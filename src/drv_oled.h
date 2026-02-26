/*
 * drv_disp.h
 *
 *  Created on: 2023年4月12日
 *      Author: slhuan
 */

#ifndef DRV_OLED_H_
#define DRV_OLED_H_

#include "hal_data.h"

typedef enum{
    isSelect,
    notSelect
}CS;      /* 片选信号控制状态 */

typedef enum{
    isCommand,
    isData
}DCX;     /* 数据/命令切换控制状态 */

#endif /* DRV_OLED_H_ */
