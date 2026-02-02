#ifndef DRV_UART_H
#define DRV_UART_H

#include <stdint.h>
#include <stdio.h>
#include <sys/stat.h>
#include <errno.h>
#include "hal_data.h"
#include "circle_buf.h"

void uart2_callback(uart_callback_args_t *p_args);
void uart2_wait_for_tx(void);

int _write(int file, char *ptr, int len);
int _read(int file, char *ptr, int len);
int _close(int file);
int _lseek(int file, int ptr, int dir);
int _fstat(int file, struct stat *st);
int _isatty(int file);

#endif
