#include "drv_w800.h"
#include "drv_uart.h"
#include <stdio.h>
#include <string.h>

extern circle_buf_t g_rx_buf;
extern const uart_instance_t g_uart6;

static W800Dev g_w800_dev;

static void W800_SendCommand(const char *cmd)
{
    uart6_send_bytes((const uint8_t *)"AT+", 3);
    uart6_send_bytes((const uint8_t *)cmd, strlen(cmd));
    uart6_send_bytes((const uint8_t *)"\r\n", 2);
}

static void W800_FlushRx(void)
{
    uint8_t ch;
    while(g_rx_buf.get(&g_rx_buf, &ch) == 0);
}

static int W800_WaitFor(const char *expected, uint32_t timeout_ms)
{
    uint8_t ch;
    uint32_t count = 0;
    uint32_t exp_len = strlen(expected);
    uint32_t idx = 0;

    while (count < timeout_ms * 100) {
        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            if (ch == expected[idx]) {
                idx++;
                if (idx == exp_len) {
                    return 0;
                }
            } else {
                idx = 0;
            }
        } else {
            for (volatile int i = 0; i < 100; i++);
            count++;
        }
    }
    return -1;
}

int W800_WaitResponse(const char *expected, uint32_t timeout_ms)
{
    return W800_WaitFor(expected, timeout_ms);
}

static int W800_Init(W800Dev *ptDev)
{
    (void)ptDev;
    
    printf("[W800] RX buf init OK, size=%d\r\n", g_rx_buf.max_len);
    
    printf("[W800] Waiting for W800 boot (3s)...\r\n");
    for (volatile int i = 0; i < 3000000; i++);
    
    W800_FlushRx();
    
    printf("[W800] Test 1: AT+Z\r\n");
    W800_SendCommand("Z");
    
    volatile int recv_count = 0;
    uint8_t ch;
    for (volatile int timeout = 0; timeout < 2000000; timeout++) {
        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            printf("%02X '%c' ", ch, (ch >= 32 && ch < 127) ? ch : '?');
            recv_count++;
            if (recv_count > 100) break;
        }
    }
    printf("\r\n[W800] Test1 received %d bytes\r\n", recv_count);
    
    if (recv_count == 0 || recv_count < 5) {
        W800_FlushRx();
        
        printf("[W800] Test 2: AT+E\r\n");
        W800_SendCommand("E");
        
        recv_count = 0;
        for (volatile int timeout = 0; timeout < 2000000; timeout++) {
            if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
                printf("%02X '%c' ", ch, (ch >= 32 && ch < 127) ? ch : '?');
                recv_count++;
                if (recv_count > 100) break;
            }
        }
        printf("\r\n[W800] Test2 received %d bytes\r\n", recv_count);
    }
    
    W800_FlushRx();
    
    printf("[W800] Test 3: AT+WPRT=0\r\n");
    W800_SendCommand("WPRT=0");
    
    recv_count = 0;
    for (volatile int timeout = 0; timeout < 2000000; timeout++) {
        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            printf("%02X '%c' ", ch, (ch >= 32 && ch < 127) ? ch : '?');
            recv_count++;
            if (recv_count > 100) break;
        }
    }
    printf("\r\n[W800] Test3 received %d bytes\r\n", recv_count);
    
    ptDev->state = W800_STATE_IDLE;
    return 0;
}

static int W800_ConnectWiFi(W800Dev *ptDev, const char *ssid, const char *password)
{
    char cmd[128];
    
    ptDev->state = W800_STATE_WIFI_CONNECTING;
    
    snprintf(cmd, sizeof(cmd), "SSID=%s", ssid);
    W800_SendCommand(cmd);
    if (W800_WaitResponse("+OK", 1000) != 0) {
        ptDev->state = W800_STATE_ERROR;
        return -1;
    }
    
    snprintf(cmd, sizeof(cmd), "KEY=1,0,%s", password);
    W800_SendCommand(cmd);
    if (W800_WaitResponse("+OK", 1000) != 0) {
        ptDev->state = W800_STATE_ERROR;
        return -1;
    }
    
    W800_SendCommand("WJOIN");
    if (W800_WaitResponse("+OK", 15000) != 0) {
        ptDev->state = W800_STATE_ERROR;
        return -1;
    }
    
    W800_SendCommand("NIP=0");
    if (W800_WaitResponse("+OK", 1000) != 0) {
    }
    
    for (volatile int i = 0; i < 1000000; i++);
    
    W800_SendCommand("LKSTT");
    if (W800_WaitResponse("+OK", 1000) == 0) {
        uint8_t ch;
        uint32_t idx = 0;
        memset(ptDev->ip_addr, 0, sizeof(ptDev->ip_addr));
        
        for (volatile int i = 0; i < 1000000; i++);
        
        while (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            if (ch == '+' || idx > 0) {
                if ((ch >= '0' && ch <= '9') || ch == '.') {
                    if (idx < 15) {
                        ptDev->ip_addr[idx++] = (char)ch;
                    }
                }
            }
            if (idx > 0 && (ch == '\r' || ch == '\n')) {
                break;
            }
        }
        
        if (idx > 0 && ptDev->ip_addr[idx-1] == '.') {
            ptDev->ip_addr[idx-1] = '\0';
        }
    }
    
    printf("[W800] IP: %s\r\n", ptDev->ip_addr);
    
    ptDev->state = W800_STATE_WIFI_CONNECTED;
    return 0;
}

static int W800_ConnectTCP(W800Dev *ptDev, const char *ip, uint16_t port)
{
    (void)ip;
    (void)port;
    
    ptDev->state = W800_STATE_TCP_CONNECTING;
    
    if (ptDev->socket_fd >= 0) {
        printf("[W800] Closing existing socket %d\r\n", ptDev->socket_fd);
        ptDev->CloseSocket(ptDev);
        for (volatile int i = 0; i < 2000000; i++);
    }
    
    W800_FlushRx();
    for (volatile int i = 0; i < 500000; i++);
    W800_FlushRx();
    
    char cmd[64];
    snprintf(cmd, sizeof(cmd), "SKCT=0,0,%s,%d,%d", ip, port, port);
    printf("[W800] Sending TCP connect command...\r\n");
    W800_SendCommand(cmd);
    
    uint8_t ch;
    uint8_t buf[128];
    int idx = 0;
    volatile int timeout = 0;
    
    while (timeout < 20000) {
        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            if (idx < 127) {
                buf[idx++] = ch;
            }
            buf[idx] = '\0';
            
            if (idx > 3 && buf[idx-4] == '+' && buf[idx-3] == 'O' && buf[idx-2] == 'K') {
                printf("\r\n[W800] TCP response: %s\r\n", buf);
                
                if (buf[idx-1] == '=') {
                    for (int j = idx; j < idx+10 && j < 127; j++) {
                        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
                            buf[idx++] = ch;
                            buf[idx] = '\0';
                        } else {
                            break;
                        }
                    }
                }
                
                printf("[W800] Full response: %s\r\n", buf);
                
                for (int k = 0; k < idx; k++) {
                    if (buf[k] >= '0' && buf[k] <= '9') {
                        ptDev->socket_fd = buf[k] - '0';
                        break;
                    }
                }
                printf("[W800] Socket fd = %d\r\n", ptDev->socket_fd);
                
                ptDev->state = W800_STATE_TCP_CONNECTED;
                return 0;
            }
            timeout = 0;
        } else {
            for (volatile int i = 0; i < 500; i++);
            timeout++;
        }
    }
    
    printf("\r\n[W800] TCP response: %s\r\n", buf);
    
    if (ptDev->state == W800_STATE_TCP_CONNECTED) {
        return 0;
    }
    
    ptDev->state = W800_STATE_ERROR;
    return -1;
}

static int W800_SendData(W800Dev *ptDev, const uint8_t *data, uint16_t len)
{
    if (ptDev->state != W800_STATE_TCP_CONNECTED) {
        return -1;
    }
    
    W800_FlushRx();
    for (volatile int i = 0; i < 1000000; i++);
    
    printf("[W800] Sending data %d bytes using socket %d...\r\n", len, ptDev->socket_fd);
    
    char cmd[32];
    snprintf(cmd, sizeof(cmd), "SKSND=%d,%d", ptDev->socket_fd, len);
    W800_SendCommand(cmd);
    
    uint8_t ch;
    uint8_t buf[128];
    int idx = 0;
    volatile int timeout = 0;
    
    while (timeout < 2000) {
        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            if (idx < 127) buf[idx++] = ch;
            buf[idx] = '\0';
            if (idx > 3 && buf[idx-4] == '+' && buf[idx-3] == 'O' && buf[idx-2] == 'K') {
                break;
            }
            timeout = 0;
        } else {
            for (volatile int i = 0; i < 500; i++);
            timeout++;
        }
    }
    
    uart6_send_bytes(data, len);
    
    idx = 0;
    timeout = 0;
    while (timeout < 3000) {
        if (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
            if (idx < 127) buf[idx++] = ch;
            buf[idx] = '\0';
            if (idx > 3 && buf[idx-4] == '+' && buf[idx-3] == 'O' && buf[idx-2] == 'K') {
                break;
            }
            timeout = 0;
        } else {
            for (volatile int i = 0; i < 500; i++);
            timeout++;
        }
    }
    
    printf("[W800] Send response: %s\r\n", buf);
    
    return len;
}

static int W800_ReceiveData(W800Dev *ptDev, uint8_t *data, uint16_t maxLen)
{
    uint8_t ch;
    uint16_t idx = 0;
    
    (void)ptDev;
    
    while (g_rx_buf.get(&g_rx_buf, &ch) == 0) {
        if (idx < maxLen - 1) {
            data[idx++] = ch;
        }
    }
    
    data[idx] = '\0';
    return idx;
}

static int W800_CloseSocket(W800Dev *ptDev)
{
    if (ptDev->socket_fd >= 0) {
        char cmd[32];
        snprintf(cmd, sizeof(cmd), "SKCLS=%d", ptDev->socket_fd);
        W800_SendCommand(cmd);
        W800_WaitResponse("+OK", 1000);
        ptDev->socket_fd = -1;
        printf("[W800] Socket closed\r\n");
    }
    return 0;
}

struct W800Dev *W800GetDevice(void)
{
    g_w800_dev.name = "W800";
    g_w800_dev.Init = W800_Init;
    g_w800_dev.ConnectWiFi = W800_ConnectWiFi;
    g_w800_dev.ConnectTCP = W800_ConnectTCP;
    g_w800_dev.Send = W800_SendData;
    g_w800_dev.Receive = W800_ReceiveData;
    g_w800_dev.CloseSocket = W800_CloseSocket;
    g_w800_dev.state = W800_STATE_IDLE;
    g_w800_dev.socket_fd = -1;
    memset(g_w800_dev.ip_addr, 0, sizeof(g_w800_dev.ip_addr));
    
    return &g_w800_dev;
}
