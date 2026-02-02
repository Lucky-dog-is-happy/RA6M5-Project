#include "drv_uart.h"

static volatile int g_uart2_tx_complete = 0;

// P112(TX) P113(RX)
void uart2_callback(uart_callback_args_t *p_args)
{
    switch(p_args->event)
    {
        case UART_EVENT_TX_COMPLETE:
            g_uart2_tx_complete = 1;
            break;
        case UART_EVENT_RX_CHAR:
            g_rx_buf.put(&g_rx_buf, (uint8_t)p_args->data);
            break;
        default:
            break;
    }
}

void uart2_wait_for_tx(void)
{
    while(!g_uart2_tx_complete);
    g_uart2_tx_complete = 0;
}

int _write(int file, char *ptr, int len)
{
    (void)file;
    
    for (int i = 0; i < len; i++) {
        g_uart2.p_api->write(g_uart2.p_ctrl, (uint8_t const * const)&ptr[i], 1);
        uart2_wait_for_tx();
    }
    
    return len;
}

int _read(int file, char *ptr, int len)
{
    (void)file;
    
    for (int i = 0; i < len; i++) {
        uint8_t ch;

        while(g_rx_buf.get(&g_rx_buf, &ch));
        ptr[i] = (char)ch;

        _write(1, &ptr[i], 1);

        if(ptr[i] == '\r') {
            char newline = '\n';
            _write(1, &newline, 1);
        }
    }

    return len;
}

int _close(int file) {
    (void)file;
    errno = EBADF;
    return -1;
}

int _lseek(int file, int ptr, int dir) {
    (void)file;
    (void)ptr;
    (void)dir;
    return 0;
}

int _fstat(int file, struct stat *st) {
    (void)file;
    st->st_mode = S_IFCHR;
    return 0;
}

int _isatty(int file) {
    (void)file;
    return 1;
}
