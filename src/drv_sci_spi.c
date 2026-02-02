#include "drv_sci_spi.h"
#include <stdio.h>
#include <stdlib.h>

static volatile bool gSPITxCplt = false;

void SPIDrvInit(void)
{
    fsp_err_t err = g_spi3.p_api->open(g_spi3.p_ctrl, g_spi3.p_cfg);
    if(FSP_SUCCESS == err)
       printf("Success to open device: spi3\r\n");
    else
       printf("Failed to open device: spi3\r\n");
}

void sci_spi3_callback(spi_callback_args_t *arg)
{ 
    printf("SPI callback triggered! Event: %d\r\n", arg->event);
    // 如果到完成出发的终端就把flag置1
    if(SPI_EVENT_TRANSFER_COMPLETE == arg->event)
        gSPITxCplt = true;
}

static void SPIDrvWaitTxCplt(void)
{
    uint16_t wTimeout = 50;
    printf("test1\r\n");
    while(!gSPITxCplt && wTimeout)
    {
        printf("%d\r\n",wTimeout);
        R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MILLISECONDS);
        wTimeout--;
    }
    printf("test2\r\n");
    gSPITxCplt = false;
}

void SPIDrvWriteReadBuf(uint8_t *wbuf, uint8_t *rbuf, uint16_t wSize)
{
    // 全双工收发数据
    g_spi3.p_api->writeRead(g_spi3.p_ctrl, (uint8_t*)wbuf, (uint8_t*)rbuf, (uint32_t)wSize, SPI_BIT_WIDTH_8_BITS);
    // 等待数据收发结束
    SPIDrvWaitTxCplt();
}

void SPIAppTest(void)
{
    SPIDrvInit();

    // 测试计数
    uint32_t dwCount = 50;
    // 定义收发数组，256
    uint8_t wBuf[256] = {0};
    uint8_t rBuf[256] = {0};
    
    printf("%d\r\n", dwCount);
    while(dwCount)
    {
        // 给发送数组随机赋值作输出
        for(uint16_t i=0; i<256; i++) {
            // wBuf[i] = (uint8_t)rand();
            wBuf[i] = (uint8_t)i;
        }
        
        printf("AppTest1\r\n");
        SPIDrvWriteReadBuf(wBuf, rBuf, 256);
        uint16_t err = 0;

        printf("AppTest2\r\n");
        // 比较收发数据是否一致 
        for(uint16_t i=0; i<256; i++)
        {
            if(wBuf[i] != rBuf[i])
            {
                err++;
                printf("Error:\r\n\twBuf:0x%.2x\trBuf:0x%.2x\r\n", wBuf[i], rBuf[i]);
            }
        }
        if(0 == err)
            printf("Success to write and read data by scp_spi:\t%d!\r\n", (int)dwCount); 
        
        dwCount--;
        R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_SECONDS);
    }
}

