#ifndef HAL_SYSTICK
#define HAL_SYSTICK

#include "hal_data.h"

#define HAL_MAX_DELAY   0xFFFFFFU

fsp_err_t SystickInit(void);
void HAL_Delay(uint32_t dwTime);
uint32_t HAL_GetTick(void);

#endif
