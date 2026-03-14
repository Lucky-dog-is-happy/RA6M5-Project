/*******************************************************************************
Copyright (C) 2014, STMicroelectronics International N.V.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of STMicroelectronics nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
NON-INFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS ARE DISCLAIMED.
IN NO EVENT SHALL STMICROELECTRONICS INTERNATIONAL N.V. BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
********************************************************************************/

#ifndef _VL53L0X_I2C_PLATFORM_H_
#define _VL53L0X_I2C_PLATFORM_H_

#include "vl53l0x_def.h"

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdarg.h>

#ifndef bool_t
typedef unsigned char bool_t;
#define TRUE 1
#define FALSE 0
#endif

#define I2C                0x01
#define SPI                0x00

#define COMMS_BUFFER_SIZE    64
#define BYTES_PER_WORD        2
#define BYTES_PER_DWORD       4
#define VL53L0X_MAX_STRING_LENGTH_PLT       256

int32_t VL53L0X_comms_initialise(uint8_t  comms_type, uint16_t comms_speed_khz);
int VL53L0X_i2c_init(void);
int32_t VL53L0X_comms_close(void);
int32_t VL53L0X_write_multi(uint8_t address, uint8_t index, uint8_t  *pdata, int32_t count);
int32_t VL53L0X_read_multi(uint8_t address,  uint8_t index, uint8_t  *pdata, int32_t count);
int32_t VL53L0X_write_byte(uint8_t address,  uint8_t index, uint8_t   data);
int32_t VL53L0X_write_word(uint8_t address,  uint8_t index, uint16_t  data);
int32_t VL53L0X_write_dword(uint8_t address, uint8_t index, uint32_t  data);
int32_t VL53L0X_read_byte(uint8_t address,  uint8_t index, uint8_t  *pdata);
int32_t VL53L0X_read_word(uint8_t address,  uint8_t index, uint16_t *pdata);
int32_t VL53L0X_read_dword(uint8_t address, uint8_t index, uint32_t *pdata);

#ifdef __cplusplus
}
#endif

#endif
