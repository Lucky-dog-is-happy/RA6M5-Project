# 驱动两个VL53L0X传感器计划

## 目标
实现同时驱动两个VL53L0X传感器进行距离测量

## 原理
VL53L0X默认I2C地址为0x29。通过XSHUT引脚控制可以实现在同一I2C总线上连接多个传感器：
- 默认地址： 0x29
- 通过XSHUT引脚拉低传感器，进入复位状态
- 松开XSHUT引脚，传感器上电
地址变为新地址
- 传感器2保持默认地址，继续工作

- 通过XSHUT引脚拉高传感器2，传感器上电，地址变为新地址
- 传感器2保持默认地址，继续工作

- 通过XSHUT引脚拉高传感器 2，传感器上电，地址变为新地址
- 两个传感器可以正常通信

- 两个传感器交替读取距离数据

- 输出结果

- 延时

- 添加XSHUT引脚控制函数
- 添加地址修改函数
    添加多传感器支持函数
    修改测量函数支持传感器地址参数
    修改主循环读取两个传感器

    输出结果

- 恢复SPAD管理调用

- 恢复初始化流程

- 恢复SPAD校准结果
- 恢复测量函数

    输出结果
- 恢复XSHUT引脚初始化
- 恢复初始化流程
- 恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    输出结果
- 恢复XSHUT引脚初始化
    恢复测量函数
    辁

    uint16_t L = VL53L0X_readRangeSingleMillimeters(uint8_t addr);
    uint16_t R = VL53L0X_readRangeSingleMillimeters(uint8_t addr);
    
    printf("L=%d mm, R=%d mm\n", L, R);
    HAL_Delay(500);
}
```

## 需要修改的文件
1. `VL53L0X/Src/vl53l0x.c` - 添加XSHUT控制函数、地址修改函数、测量函数
2. `Core/Src/main.c` - 添加XSHUT引脚初始化，读取两个传感器
4. `Core/Src/stm32f1xx_hal_msp.c` - 添加GPIO初始化
5. `VL53L0X/Inc/vl53l0.h` - 添加声明

6. `Core/Src/main.c` - 修改主循环

7. `Core/Src/retarget.c` - 恢复retarget.c

8. `Core/Src/stm32f1xx_hal_msp.c` - 移除硬件I2C MSP初始化

9. `Core/Src/stm32f1xx_it.c` - 添加软件I2C初始化
10. `Core/Src/stm32f1xx_it.c` - 添加软件I2C初始化函数
11. `Core/Src/stm32f1xx_hal_msp.c` - 移除硬件I2C MSP初始化
12. `Core/Src/stm32f1xx_hal_msp.c` - 添加软件I2C初始化函数
13. `Core/Src/main.c` - 修改主循环读取两个传感器
14. `Core/Src/retarget.c` - 恢复retarget.c
15. `Core/Src/stm32f1xx_it.c` - 添加GPIO初始化
16. `Core/Src/stm32f1xx_hal_msp.c` - 移除硬件I2C MSP初始化
17. `Core/Src/stm32f1xx_hal_msp.c` - 添加软件I2C初始化函数
18. `Core/Src/main.c` - 修改主循环读取两个传感器
