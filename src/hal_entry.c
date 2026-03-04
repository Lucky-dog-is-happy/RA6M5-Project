#include "hal_data.h"
#include "drv_uart.h"
#include "drv_sci_spi.h"
#include "drv_i2c.h"
#include "drv_eeprom.h"
#include "hal_systick.h"
#include "drv_gpio.h"
#include "drv_w800.h"
#include "drv_disp.h"
#include <stdio.h>

#if (1 == BSP_MULTICORE_PROJECT) && BSP_TZ_SECURE_BUILD
bsp_ipc_semaphore_handle_t g_core_start_semaphore =
{
    .semaphore_num = 0
};
#endif

void DispAppTest(void)
{
    DisplayDevice *ptDispDev = OLEDGetDevice();
    if(ptDispDev == NULL)
    {
        printf("Failed to get OLED Display Device!\r\n");
        return;
    }

    ptDispDev->Init(ptDispDev);
    uint8_t *pBuf = (uint8_t*)ptDispDev->FBBase;
    while(1)
    {
        for(uint16_t i=0; i<ptDispDev->dwSize; i++)
            pBuf[i] = 0x55;
        ptDispDev->Flush(ptDispDev);

        for(uint16_t i=0; i<ptDispDev->dwSize; i++)
            pBuf[i] = 0xFF;
        ptDispDev->Flush(ptDispDev);
    }
}

void W800AppTest(void)
{
    printf("[W800] Starting WiFi Test...\r\n");
    
    W800Dev *ptW800 = W800GetDevice();
    if (ptW800 == NULL) {
        printf("[W800] Failed to get device!\r\n");
        return;
    }
    
    if (ptW800->Init(ptW800) != 0) {
        printf("[W800] Init failed!\r\n");
        return;
    }
    printf("[W800] AT test OK\r\n");
    
    printf("[W800] Connecting to WiFi...\r\n");
    if (ptW800->ConnectWiFi(ptW800, "Lucky", "26862628") != 0) {
        printf("[W800] WiFi connection failed!\r\n");
        return;
    }
    printf("[W800] WiFi connected! IP: %s\r\n", ptW800->ip_addr);
    
    printf("[W800] Connecting to TCP server...\r\n");
    if (ptW800->ConnectTCP(ptW800, "192.168.201.175", 8080) != 0) {
        printf("[W800] TCP connection failed!\r\n");
        return;
    }
    printf("[W800] TCP connected!\r\n");
    
    uint8_t sendData[] = "Hello from RA6M5!";
    int sent = ptW800->Send(ptW800, sendData, sizeof(sendData) - 1);
    printf("[W800] Sent %d bytes\r\n", sent);
    
    uint8_t recvBuf[256];
    int received = ptW800->Receive(ptW800, recvBuf, sizeof(recvBuf));
    if (received > 0) {
        printf("[W800] Received %d bytes: %s\r\n", received, recvBuf);
    }
    
    printf("[W800] Test completed!\r\n");
}

void hal_entry(void)
{
    fsp_err_t err;
    bsp_io_level_t level = 1;

    circlebuf_init();

    err = g_uart2.p_api->open(g_uart2.p_ctrl, g_uart2.p_cfg);
    printf("UART2 open: %d\r\n", err);
    err = g_uart6.p_api->open(g_uart6.p_ctrl, g_uart6.p_cfg);
    printf("UART6 open: %d\r\n", err);
    printf("hello world! From lucky\r\n");
    g_ioport.p_api->pinWrite(&g_ioport_ctrl, BSP_IO_PORT_04_PIN_00, level);
    
    SystickInit();
    //DispAppTest();
    W800AppTest();

    IODev *ptKeyDev = IOGetDevice("UserKey");
    if(NULL == ptKeyDev)
    {
        printf("Failed to get UserKey!\r\n");
        return;
    }

    IODev *ptLedDev = IOGetDevice("UserLed");
    if(NULL == ptLedDev)
    {
        printf("Failed to get UserLed!\r\n");
        return;
    }

    if(ptKeyDev->Init(ptKeyDev) != 0)
        return;
    if(ptLedDev->Init(ptLedDev) !=0)
        return;

#if (0 == _RA_CORE) && (1 == BSP_MULTICORE_PROJECT) && !BSP_TZ_NONSECURE_BUILD

#if BSP_TZ_SECURE_BUILD
    R_BSP_IpcSemaphoreTake(&g_core_start_semaphore);
#endif

    R_BSP_SecondaryCoreStart();

#if BSP_TZ_SECURE_BUILD
    while(FSP_ERR_IN_USE == R_BSP_IpcSemaphoreTake(&g_core_start_semaphore))
    {
        ;
    }
#endif
#endif

#if (1 == _RA_CORE) && (1 == BSP_MULTICORE_PROJECT) && BSP_TZ_SECURE_BUILD
    R_BSP_IpcSemaphoreGive(&g_core_start_semaphore);
#endif


#if BSP_TZ_SECURE_BUILD
    R_BSP_NonSecureEnter();
#endif
}

#if BSP_TZ_SECURE_BUILD

FSP_CPP_HEADER
BSP_CMSE_NONSECURE_ENTRY void template_nonsecure_callable ();

BSP_CMSE_NONSECURE_ENTRY void template_nonsecure_callable ()
{

}
FSP_CPP_FOOTER

#endif
