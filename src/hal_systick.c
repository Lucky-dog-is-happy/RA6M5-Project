#include "hal_systick.h"

static __IO uint32_t dwTick;

// 心跳包定时器变量
static uint32_t last_heartbeat_tick = 0;

fsp_err_t SystickInit(void)
{
    uint32_t uwSysclk = R_BSP_SourceClockHzGet(FSP_PRIV_CLOCK_PLL);
    // 频率为1kHz
    if (SysTick_Config(uwSysclk / 1000) != 0)
        return FSP_ERR_ASSERTION;
    return FSP_SUCCESS;
}

void SysTick_Handler(void)
{
    dwTick++;

    // 每 5 秒发送心跳包
    if (dwTick - last_heartbeat_tick >= 5000) {
        last_heartbeat_tick = dwTick;
        extern int Dispenser_SendHeartbeat(void);
        Dispenser_SendHeartbeat();
    }

    extern void KeyProcessJitter(uint32_t tick);
    KeyProcessJitter(dwTick);
}

void HAL_Delay(uint32_t dwTime)
{
    uint32_t dwStart = dwTick;
    uint32_t dwWait = dwTime;

    if (dwWait < HAL_MAX_DELAY)
        dwWait++;
    while ((dwTick - dwStart) < dwWait);
}

uint32_t HAL_GetTick(void)
{
    return dwTick;
}
