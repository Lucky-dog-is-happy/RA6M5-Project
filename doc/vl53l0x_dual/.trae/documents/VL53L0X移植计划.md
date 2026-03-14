# VL53L0X激光测距移植计划

## 项目概述

将参考项目 `e:\6edf1\VL53L0激光测距\VL53L0激光测距\测距` 中的VL53L0X激光测距功能移植到目标项目 `e:\stm32cube\vl53l0x`。

## 项目差异分析

| 项目 | 参考项目 | 目标项目 |
|------|----------|----------|
| 开发环境 | Keil MDK | STM32CubeIDE |
| 固件库 | 标准外设库 | HAL库 |
| I2C方式 | 软件模拟I2C (GPIO PC11/PC12) | 硬件I2C1 (PB6/PB7) |
| 串口 | USART1 (9600 baud) | USART1 (9600 baud) |

## 实施步骤

### 步骤1: 创建VL53L0X驱动目录结构

在目标项目中创建以下目录和文件:
```
e:\stm32cube\vl53l0x\
├── VL53L0X/                    # 新建目录
│   ├── Inc/                    # 头文件目录
│   │   ├── vl53l0x_api.h
│   │   ├── vl53l0x_api_calibration.h
│   │   ├── vl53l0x_api_core.h
│   │   ├── vl53l0x_api_ranging.h
│   │   ├── vl53l0x_api_strings.h
│   │   ├── vl53l0x_def.h
│   │   ├── vl53l0x_device.h
│   │   ├── vl53l0x_interrupt_threshold_settings.h
│   │   ├── vl53l0x_tuning.h
│   │   ├── vl53l0x_platform.h
│   │   ├── vl53l0x_i2c_platform.h
│   │   ├── vl53l0x_types.h
│   │   └── vl53l0.h
│   └── Src/                    # 源文件目录
│       ├── vl53l0x_api.c
│       ├── vl53l0x_api_calibration.c
│       ├── vl53l0x_api_core.c
│       ├── vl53l0x_api_ranging.c
│       ├── vl53l0x_api_strings.c
│       ├── vl53l0x_platform.c
│       ├── vl53l0x_i2c.c
│       └── vl53l0x.c
```

### 步骤2: 复制VL53L0X API核心文件

从参考项目复制以下文件到目标项目:
- `vl53l0x_api/vl53l0x_api.c` → `VL53L0X/Src/`
- `vl53l0x_api/vl53l0x_api.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_api_calibration.c` → `VL53L0X/Src/`
- `vl53l0x_api/vl53l0x_api_calibration.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_api_core.c` → `VL53L0X/Src/`
- `vl53l0x_api/vl53l0x_api_core.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_api_ranging.c` → `VL53L0X/Src/`
- `vl53l0x_api/vl53l0x_api_ranging.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_api_strings.c` → `VL53L0X/Src/`
- `vl53l0x_api/vl53l0x_api_strings.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_def.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_device.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_interrupt_threshold_settings.h` → `VL53L0X/Inc/`
- `vl53l0x_api/vl53l0x_tuning.h` → `VL53L0X/Inc/`

### 步骤3: 创建HAL库适配的平台层文件

#### 3.1 创建 vl53l0x_types.h
修改以适配HAL库，包含 `stm32f1xx_hal.h` 而非标准库头文件。

#### 3.2 创建 vl53l0x_platform.h
保持原有结构定义，适配HAL库。

#### 3.3 创建 vl53l0x_platform.c
实现平台抽象层函数，调用底层I2C函数。

#### 3.4 创建 vl53l0x_i2c.c 和 vl53l0x_i2c_platform.h
**关键修改**: 使用HAL库的硬件I2C函数替代软件模拟I2C:
- 使用 `HAL_I2C_Master_Transmit()` 替代软件I2C写
- 使用 `HAL_I2C_Master_Receive()` 替代软件I2C读
- 使用外部变量 `hi2c1` (HAL I2C句柄)

#### 3.5 创建 vl53l0x.c 和 vl53l0.h
用户接口层，包含初始化和测距函数。

### 步骤4: 添加printf重定向支持

创建 `Core/Src/retarget.c` 文件，实现printf到USART1的重定向:
- 重定向 `fputc()` 到UART发送
- 启用GCC工具链的新lib支持

### 步骤5: 修改main.c

在 `Core/Src/main.c` 中添加:
1. 包含VL53L0X头文件
2. 声明VL53L0X相关变量
3. 在 `main()` 函数中调用 `vl53l0x_init()`
4. 在主循环中调用 `vl53l0x_start_single_test()` 进行测距
5. 添加HAL_Delay()延时

### 步骤6: 修改main.h

添加必要的声明和包含。

## 关键技术点

### I2C通信适配

参考项目使用软件模拟I2C:
```c
// 软件I2C (参考项目)
#define I2C_SCL_GPIO       GPIOC
#define I2C_PIN_SCL        GPIO_Pin_12
#define I2C_SDA_GPIO       GPIOC
#define I2C_PIN_SDA        GPIO_Pin_11
```

目标项目使用HAL硬件I2C:
```c
// 硬件I2C (目标项目)
hi2c1.Instance = I2C1;
hi2c1.Init.ClockSpeed = 100000;  // 100kHz
// PB6 = SCL, PB7 = SDA
```

### I2C函数映射

| 软件I2C函数 | HAL I2C函数 |
|-------------|-------------|
| `i2c_write()` | `HAL_I2C_Master_Transmit()` |
| `i2c_read()` | `HAL_I2C_Mem_Read()` |
| `i2c_init()` | 已由 `MX_I2C1_Init()` 完成 |

### VL53L0X设备地址

VL53L0X默认I2C地址为 `0x52` (8位地址，包含读写位) 或 `0x29` (7位地址)。

## 文件修改清单

| 文件路径 | 操作 |
|----------|------|
| `VL53L0X/Inc/*` | 新建 - 头文件 |
| `VL53L0X/Src/*` | 新建 - 源文件 |
| `Core/Src/retarget.c` | 新建 - printf重定向 |
| `Core/Src/main.c` | 修改 - 添加VL53L0X功能 |
| `Core/Inc/main.h` | 修改 - 添加声明 |

## 预期结果

编译成功后，程序将:
1. 初始化VL53L0X传感器
2. 打印设备信息到串口
3. 每秒进行一次测距
4. 通过串口输出距离值(单位: cm)
