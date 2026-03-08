#ifndef DRV_DISPENSER_H
#define DRV_DISPENSER_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

// 水质等级定义
#define DISPENSER_QUALITY_POOR  0
#define DISPENSER_QUALITY_BAD   1
#define DISPENSER_QUALITY_OK    2
#define DISPENSER_QUALITY_GOOD  3
#define DISPENSER_QUALITY_EXCEL 4
#define DISPENSER_QUALITY_PRIME 5

// 系统模式定义
#define DISPENSER_MODE_TEST     0   // 测试模式
#define DISPENSER_MODE_NORMAL   1   // 正式运行模式

// 水机数据结构
typedef struct {
    uint32_t runtime_seconds;      // 运行时间（秒）
    uint16_t remaining_water_ml;    // 剩余水量（ml）
    uint8_t water_temp_celsius;    // 水温（℃）
    uint8_t water_quality;         // 水质等级
    uint16_t cups_completed;       // 已完成水杯数
} DispenserData;

// 系统状态结构体
typedef struct {
    DispenserData data;             // 水机数据
    uint8_t system_mode;            // 系统模式
    uint32_t last_heartbeat_time;   // 上次心跳时间
    bool tcp_connected;             // TCP 连接状态
    void *w800_device;              // W800 设备指针
} DispenserSystemState;

// 初始化系统
int Dispenser_Init(void);

// 获取系统状态
DispenserSystemState* Dispenser_GetState(void);

// 更新运行时间
void Dispenser_UpdateRuntime(uint32_t seconds);

// 更新水量
void Dispenser_SetWater(uint16_t ml);

// 更新水温
void Dispenser_SetTemp(uint8_t temp);

// 更新水质
void Dispenser_SetQuality(uint8_t quality);

// 增加完成杯数
void Dispenser_AddCup(void);

// 发送心跳包
int Dispenser_SendHeartbeat(void);

// 设置 W800 设备指针
void Dispenser_SetW800Device(void *w800_dev);

// 切换到正式运行模式
int Dispenser_EnterNormalMode(void);

// 切换到测试模式
int Dispenser_EnterTestMode(void);

// 获取心跳包格式字符串
int Dispenser_GetHeartbeatString(char *buffer, size_t len);

#ifdef __cplusplus
}
#endif

#endif // DRV_DISPENSER_H
