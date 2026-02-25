#include "drv_gpio.h"
#include "hal_systick.h"
#include <stdio.h>

static int IODrvInit(struct IODev *ptdev);
static int IODrvWrite(struct IODev *ptdev, IODevState_t level);
static IODevState_t IODrvRead(struct IODev *ptdev);

static IODev gKeyDev = {
    .name = "UserKey",
    .Init = IODrvInit,
    .Write = NULL,
    .Read = NULL
};

static IODev gLedDev = {
    .name = "UserLed",
    .Init = IODrvInit,
    .Write = IODrvWrite,
    .Read = IODrvRead
};

struct IODev *IOGetDevice(const char *name)
{
    if(strcmp(name, "UserKey") == 0)
        return &gKeyDev;
    if(strcmp(name, "UserLed") == 0)
        return &gLedDev;

    return NULL;
}

static volatile uint32_t uwPressTick = 0;
void ex_irq6_callback(external_irq_callback_args_t *p_args)
{
    if(p_args->channel == 6)
        uwPressTick = HAL_GetTick() + 100;
}

static volatile IODevState_t gLedLevel = HighLevel;
void KeyProcessJitter(uint32_t tick)
{
    if(tick == uwPressTick)
    {
        gLedDev.Write(&gLedDev, gLedLevel);
        gLedLevel = !gLedLevel;
    }
}

static int IODrvInit(struct IODev *ptdev)
{
    if(ptdev->name == NULL)
        return -1;
    // 初始化按键GPIO
    if(strcmp(ptdev->name, "UserKey") == 0)
    {
        fsp_err_t err = g_external_irq6.p_api->open(g_external_irq6.p_ctrl, g_external_irq6.p_cfg);
        if(FSP_SUCCESS != err)
        {
            printf("Failed to open Key device: %s\r\n", ptdev->name);
            return -1;
        }
        err = g_external_irq6.p_api->enable(g_external_irq6.p_ctrl);
        if(FSP_SUCCESS == err)
            printf("Success to enable %s's irq!\r\n", ptdev->name);
        else
        {
            printf("Failed to enable %s's irq!\r\n", ptdev->name);
            return -1;
        }
    }
    
    // 初始化LED灯GPIO
    if(strcmp(ptdev->name, "UserLed") == 0)
    {
        fsp_err_t err = g_ioport.p_api->open(g_ioport.p_ctrl, g_ioport.p_cfg);
        if(FSP_ERR_ALREADY_OPEN == err)
        {
            printf("Error, GPIOs are already open and init.\r\n");
            return -1;
        } else if(FSP_SUCCESS == err)
            printf("Success to open Led device: %s!\r\n", ptdev->name);
    }
    return 0;
}

static int IODrvWrite(struct IODev *ptdev, IODevState_t level)
{
    if(ptdev->name == NULL)
        return -1;
    if(strcmp(ptdev->name, "UserLed") == 0)
    {
        fsp_err_t err = g_ioport.p_api->pinWrite(g_ioport.p_ctrl, BSP_IO_PORT_04_PIN_00, (bsp_io_level_t)level);
        if(FSP_SUCCESS != err)
        {
            printf("Error. Failed to write level in IO device: %s\r\n", ptdev->name);
            return -1;
        }
    }
    return 0;
}

static IODevState_t IODrvRead(struct IODev *ptdev)
{
    if(ptdev->name == NULL)
        return ErrLevel;

    IODevState_t state = ErrLevel;
    if(strcmp(ptdev->name, "UserLed") == 0)
    {
        fsp_err_t err = g_ioport.p_api->pinRead(g_ioport.p_ctrl, BSP_IO_PORT_04_PIN_00, (bsp_io_level_t*)&state);
        if(FSP_SUCCESS != err)
        {
            printf("Error. Failed to write level in IO device: %s\r\n", ptdev->name);
            return ErrLevel;
        }
    }
    return state;
}
