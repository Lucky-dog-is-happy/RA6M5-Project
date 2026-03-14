# 软件I2C实现计划

## 目标
将硬件I2C改为软件I2C（GPIO模拟），与原始项目保持一致。

## 引脚配置（用户选择）
- **SCL**: PB8
- **SDA**: PB9

## 实现步骤

### 步骤1：创建软件I2C头文件
创建 `VL53L0X/Inc/soft_i2c.h`
```c
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
```

### 步骤2：创建软件I2C源文件
创建 `VL53L0X/Src/soft_i2c.c`
- 从原始项目复制并适配HAL库
- 使用PB8/PB9引脚

### 步骤3：修改vl53l0x_i2c.c
将硬件I2C函数替换为软件I2C函数

### 步骤4：修改main.c
- 移除硬件I2C初始化
- 添加软件I2C GPIO初始化

## 需要创建/修改的文件
1. **新建**: `VL53L0X/Inc/soft_i2c.h`
2. **新建**: `VL53L0X/Src/soft_i2c.c`
3. **修改**: `VL53L0X/Src/vl53l0x_i2c.c`
4. **修改**: `Core/Src/main.c`

## 接线说明
请将VL53L0X模块重新接线：
- **SCL** → PB8
- **SDA** → PB9
- **VCC** → 2.8V (或3.3V)
- **GND** → GND
- **XSHUT** → PA5

## 预期结果
使用软件I2C后，VL53L0X应该能够正常工作。
