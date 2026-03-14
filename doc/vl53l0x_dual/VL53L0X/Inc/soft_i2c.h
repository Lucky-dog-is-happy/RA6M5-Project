#ifndef __SOFT_I2C_H
#define __SOFT_I2C_H

#include "stm32f1xx_hal.h"

#define SOFT_I2C_SCL_GPIO    GPIOB
#define SOFT_I2C_SCL_PIN     GPIO_PIN_8
#define SOFT_I2C_SDA_GPIO    GPIOB
#define SOFT_I2C_SDA_PIN     GPIO_PIN_9

#define SOFT_I2C_SCL_HIGH()  HAL_GPIO_WritePin(SOFT_I2C_SCL_GPIO, SOFT_I2C_SCL_PIN, GPIO_PIN_SET)
#define SOFT_I2C_SCL_LOW()   HAL_GPIO_WritePin(SOFT_I2C_SCL_GPIO, SOFT_I2C_SCL_PIN, GPIO_PIN_RESET)
#define SOFT_I2C_SDA_HIGH()  HAL_GPIO_WritePin(SOFT_I2C_SDA_GPIO, SOFT_I2C_SDA_PIN, GPIO_PIN_SET)
#define SOFT_I2C_SDA_LOW()   HAL_GPIO_WritePin(SOFT_I2C_SDA_GPIO, SOFT_I2C_SDA_PIN, GPIO_PIN_RESET)
#define SOFT_I2C_SDA_READ()  HAL_GPIO_ReadPin(SOFT_I2C_SDA_GPIO, SOFT_I2C_SDA_PIN)

void soft_i2c_init(void);
uint8_t soft_i2c_write(uint8_t addr, uint8_t reg, uint32_t len, uint8_t *data);
uint8_t soft_i2c_read(uint8_t addr, uint8_t reg, uint32_t len, uint8_t *buf);

#endif
