#include "stm32f1xx_hal.h"
#include <stdio.h>

extern UART_HandleTypeDef huart1;

int __io_putchar(int ch)
{
    uint8_t c = (uint8_t)ch;
    HAL_UART_Transmit(&huart1, &c, 1, 100);
    return ch;
}

int __io_getchar(void)
{
    uint8_t c = 0;
    HAL_UART_Receive(&huart1, &c, 1, 100);
    return (int)c;
}
