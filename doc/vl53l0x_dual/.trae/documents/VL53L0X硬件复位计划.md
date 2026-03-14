# VL53L0X硬件复位实现计划

## 问题分析
`EffectiveSpadRtnCount: 49156 (0xC004)` 一直不变，说明传感器内部状态异常。软件复位不可靠，需要通过XSHUT引脚进行硬件复位。

## 硬件信息
- XSHUT引脚已连接到 **PA5**

## 实现步骤

### 步骤1：在main.c中初始化PA5为输出
在 `MX_GPIO_Init()` 函数中添加PA5的初始化：
- 配置PA5为推挽输出
- 初始状态设为高电平

### 步骤2：在vl53l0x.c中添加硬件复位代码
在 `vl53l0x_init()` 函数的I2C初始化后，添加硬件复位：
```c
// XSHUT硬件复位
HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);  // 拉低
HAL_Delay(30);
HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);    // 拉高
HAL_Delay(30);
```

### 步骤3：移除软件复位代码
硬件复位更可靠，可以移除之前添加的软件复位代码。

## 需要修改的文件
1. `Core/Src/main.c` - 添加PA5 GPIO初始化
2. `VL53L0X/Src/vl53l0x.c` - 添加硬件复位代码

## 预期结果
硬件复位后，传感器应该能够正确初始化，SPAD校准结果应该正常，距离测量值应该随实际距离变化。
