#include "hal_data.h"
#include "drv_uart.h"
#include "drv_sci_spi.h"
#include "drv_i2c.h"
#include "drv_eeprom.h"
#include "hal_systick.h"
#include "drv_gpio.h"
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

void hal_entry(void)
{
    fsp_err_t err;
    bsp_io_level_t level = 1;

    circlebuf_init();

    err = g_uart2.p_api->open(g_uart2.p_ctrl, g_uart2.p_cfg);
    printf("hello world! From lucky\r\n");
    g_ioport.p_api->pinWrite(&g_ioport_ctrl, BSP_IO_PORT_04_PIN_00, level);
    
    SystickInit();
    DispAppTest();

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
