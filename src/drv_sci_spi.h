#ifndef DRV_SCI_SPI
#define DRV_SCI_SPI

#include "hal_data.h"

void SPIDrvInit(void);
void sci_spi3_callback(spi_callback_args_t *arg);
static void SPIDrvWaitTxCplt(void);
void SPIDrvWriteReadBuf(uint8_t *wbuf, uint8_t *rbuf, uint16_t wSize);
void SPIAppTest(void);

#endif
