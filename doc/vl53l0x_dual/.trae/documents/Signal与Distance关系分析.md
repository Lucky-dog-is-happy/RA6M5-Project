# VL53L0X Signal与Distance关系分析

## VL53L0X测距原理

VL53L0X是**飞行时间(ToF)传感器**，通过测量红外光从发射到接收的时间来直接计算距离：

* 发射红外脉冲

* 测量光往返时间

* 距离 = 光速 × 时间 / 2

## Signal和Distance的含义

| 参数       | 含义         | 单位                      |
| -------- | ---------- | ----------------------- |
| Distance | 直接测量的距离值   | mm                      |
| Signal   | 接收到的红外信号强度 | cps (counts per second) |
| Ambient  | 环境光强度      | cps                     |

## Signal与Distance的关系

**Signal不能直接用来计算距离！** 原因：

1. **Signal受目标反射率影响**

   * 白色物体：反射率高，Signal强

   * 黑色物体：反射率低，Signal弱

   * 同样距离下，Signal可能相差很大

2. **Signal受距离影响（但不线性）**

   * 距离近 → Signal强

   * 距离远 → Signal弱

   * 但这个关系不是线性的，且受多种因素影响

3. **Signal受环境光影响**

   * 强光环境下Signal可能被干扰

## 从日志数据分析

观察用户提供的日志：

```
Dist: 0 mm, Signal: 2048, Ambient: 6924, Status: 11
Dist: 257 mm, Signal: 8960, Ambient: 5121, Status: 11
Dist: 7967 mm, Signal: 7680, Ambient: 3584, Status: 4
```

* 0mm时Signal=2048（可能是测量失败）

* 257mm时Signal=8960

* 7967mm时Signal=7680

**Signal值没有随距离单调变化**，说明Signal不能用于计算距离。

## 结论

1. **Distance是ToF直接测量值**，是准确的距离
2. **Signal是辅助信息**，用于判断测量质量
3. **不能通过Signal计算距离**

## Signal的用途

* 判断测量可靠性：Signal太低说明测量可能不可靠

* 判断目标反射率：Signal高说明目标反射好

* 调试传感器：帮助诊断传感器工作状态

## 当前问题

从日志看，距离值只有0/257/514/7967四种，说明：

1. SPAD校准失败（count=6太小）
2. 传感器测量精度严重下降
3. 需要修复SPAD校准或使用正确的SPAD配置

