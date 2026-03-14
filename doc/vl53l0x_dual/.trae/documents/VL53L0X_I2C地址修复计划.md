# VL53L0X I2C地址修复计划

## 问题分析

根据文章 `https://zhuanlan.zhihu.com/p/656895168`，VL53L0X的I2C地址处理方式：

### 文章中的正确实现
```c
void VL53L0X_WriteByte(uint8_t add, uint8_t reg, uint8_t data)
{
    HAL_I2C_Mem_Write(&hi2c1, (add<<1)|0, reg, I2C_MEMADD_SIZE_8BIT, &data, 1, 0xffff);
}

uint8_t VL53L0X_ReadByte(uint8_t add, uint8_t reg)
{
    uint8_t data=0;
    HAL_I2C_Mem_Read(&hi2c1, (add<<1)|1, reg, I2C_MEMADD_SIZE_8BIT, &data, 1, 0xffff);
    return data;
}
```

### 关键发现
1. **VL53L0X的7位地址是0x29**
2. **HAL库需要传入完整的8位地址（包含读写位）**
3. **写地址 = 0x29 << 1 | 0 = 0x52**
4. **读地址 = 0x29 << 1 | 1 = 0x53**

### 我们当前代码的问题
```c
// 当前代码 - 写和读都使用相同的地址0x52
HAL_I2C_Mem_Write(&hi2c1, address, ...);    // address = 0x52
HAL_I2C_Mem_Read(&hi2c1, address, ...);     // address = 0x52 (错误！应该是0x53)
```

**读操作使用了错误的地址！** 读操作应该使用0x53，而不是0x52。

## 解决方案

### 方案：修改I2C读写函数，正确处理地址

修改 `vl53l0x_i2c.c` 中的函数：

```c
int32_t VL53L0X_write_multi(uint8_t address, uint8_t reg, uint8_t *pdata, int32_t count)
{
    // address已经是8位写地址(0x52)，直接使用
    HAL_I2C_Mem_Write(&hi2c1, address, reg, I2C_MEMADD_SIZE_8BIT, pdata, count, 100);
    ...
}

int32_t VL53L0X_read_multi(uint8_t address, uint8_t index, uint8_t *pdata, int32_t count)
{
    // 读操作需要将地址改为读地址
    // 写地址0x52 → 读地址0x53
    uint8_t read_addr = address | 0x01;  // 设置读位
    HAL_I2C_Mem_Read(&hi2c1, read_addr, index, I2C_MEMADD_SIZE_8BIT, pdata, count, 100);
    ...
}
```

## 需要修改的文件
1. `VL53L0X/Src/vl53l0x_i2c.c` - 修改 `VL53L0X_read_multi` 函数

## 预期结果
修复后，I2C读操作应该正常工作，SPAD校准结果应该正常。
