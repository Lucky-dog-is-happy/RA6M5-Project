#ifndef DRV_VL53L0X_H
#define DRV_VL53L0X_H

#include "hal_data.h"
#include <stdint.h>
#include <stdbool.h>

#define VL53L0X_DEFAULT_ADDR  0x52

int VL53L0X_Init(void);
void VL53L0X_Shutdown(void);
void VL53L0X_Wakeup(void);
uint16_t VL53L0X_Read_Distance(void);

int VL53L0X_Write_Byte(uint8_t addr, uint8_t reg, uint8_t data);
int VL53L0X_Read_Byte(uint8_t addr, uint8_t reg, uint8_t *data);
int VL53L0X_Write_Word(uint8_t addr, uint8_t reg, uint16_t data);
int VL53L0X_Read_Word(uint8_t addr, uint8_t reg, uint16_t *data);
int VL53L0X_Write_DWord(uint8_t addr, uint8_t reg, uint32_t data);
int VL53L0X_Read_DWord(uint8_t addr, uint8_t reg, uint32_t *data);
int VL53L0X_Write_Multi(uint8_t addr, uint8_t reg, uint8_t *data, uint32_t count);
int VL53L0X_Read_Multi(uint8_t addr, uint8_t reg, uint8_t *data, uint32_t count);

#endif
