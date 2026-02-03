#include "hal_data.h"
#include "drv_uart.h"
#include "drv_sci_spi.h"
#include "drv_i2c.h"
#include "drv_eeprom.h"

void EEPROMAppTest(void);

#if (1 == BSP_MULTICORE_PROJECT) && BSP_TZ_SECURE_BUILD
bsp_ipc_semaphore_handle_t g_core_start_semaphore =
{
    .semaphore_num = 0
};
#endif

unsigned int g_seed = 9797;
static uint32_t rand(void)
{
    g_seed = g_seed * 1103515245 + 12345;
    return (g_seed >> 16) & 0xFF;
}

// 全局变量栈空间大
// 局部函数栈空间小，会溢出
uint8_t wbuf[256];
uint8_t rbuf[256];

void EEPROMAppTest(void)
{
    I2CDev *ptEepromDev = EEPROMGetDevice();
    if(NULL == ptEepromDev)
        return;
    if(0 != ptEepromDev->Init(ptEepromDev))
        return;

    // 要malloc,会报错
    // srand((unsigned int)114514);

    uint8_t ucCount = 10;
    printf("Start Test Simple I2C Wtire/Read a Byte From AT25C02\r\n");
    printf("\t|  Write  |  Read  |  Result  |  Count  |\r\n");
    
    while(ucCount)
    {
        uint8_t ucWData = (uint8_t)rand();
        uint8_t ucRData = 0;
        uint8_t addr = (uint8_t)rand();
        ptEepromDev->Write(ptEepromDev, addr, &ucWData, 1);
        R_BSP_SoftwareDelay(10, BSP_DELAY_UNITS_MILLISECONDS);
        ptEepromDev->Read(ptEepromDev, addr, &ucRData, 1);
        printf("\t|  %.3d  |  %.3d  |", ucWData, ucRData);
        if(ucWData == ucRData)
            printf(" %s |  %.2d  |\r\n", "Success", ucCount);
        else
            printf(" %s |  %.3d  |\r\n", "Error", ucCount);
        ucCount--;
    }

    printf("Start Test Simple I2C Write/Read n Byte\r\n");
    printf("\t|  Address  |  Size  |  Result  |  Count  |\r\n");
    ucCount = 10;
    //uint8_t wbuf[256];
    //uint8_t rbuf[256];
    while(ucCount)
    {
        uint8_t ucAddr = (uint8_t)rand();
        uint8_t size = (uint8_t)rand();

        for(uint16_t i=0; i<256; i++)
            wbuf[i] = (uint8_t)i;
        size = (uint8_t)(((ucAddr+size)>256) ? (256-ucAddr):size);
        printf("\t|  %.3d  |  %.3d  |", ucAddr, size);

        ptEepromDev->Write(ptEepromDev, ucAddr, wbuf, size);
        R_BSP_SoftwareDelay(100, BSP_DELAY_UNITS_MILLISECONDS);
        ptEepromDev->Read(ptEepromDev, ucAddr, rbuf, size);

        uint16_t err_c = 0;
        for(uint16_t i=0; i<size; i++)
        {
            if(rbuf[i] != wbuf[i])
                err_c++;
        }
        if(0 == err_c)
            printf(" %s |  %.2d  |\r\n", "Success", ucCount);
        else
            printf(" %s |  %.3d  |\r\n", "Error", err_c);
        ucCount--;
        R_BSP_SoftwareDelay(100, BSP_DELAY_UNITS_MILLISECONDS);
    }
}


void hal_entry(void)
{
    fsp_err_t err;
    bsp_io_level_t level = 0;

    circlebuf_init();

    err = g_uart2.p_api->open(g_uart2.p_ctrl, g_uart2.p_cfg);
    printf("hello world! From lucky\r\n");
    g_ioport.p_api->pinWrite(&g_ioport_ctrl, BSP_IO_PORT_04_PIN_00, level);
    
    EEPROMAppTest();

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
