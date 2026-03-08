#include "drv_dispenser.h"
#include "drv_w800.h"
#include "hal_systick.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>

// 全局系统状态
static DispenserSystemState g_dispenser_state = {
    .data = {
        .runtime_seconds = 0,
        .remaining_water_ml = 1000,   // 固定值：1000ml
        .water_temp_celsius = 45,     // 固定值：45℃
        .water_quality = 4,           // 固定值：水质优良
        .cups_completed = 0           // 固定值：已完成0个水杯
    },
    .system_mode = DISPENSER_MODE_TEST,
    .last_heartbeat_time = 0,
    .tcp_connected = false
};

// 初始化系统
int Dispenser_Init(void)
{
    // 初始化默认数据
    g_dispenser_state.data.runtime_seconds = 0;
    g_dispenser_state.data.remaining_water_ml = 1000;
    g_dispenser_state.data.water_temp_celsius = 45;
    g_dispenser_state.data.water_quality = 4;
    g_dispenser_state.data.cups_completed = 0;
    g_dispenser_state.system_mode = DISPENSER_MODE_TEST;
    g_dispenser_state.last_heartbeat_time = 0;
    g_dispenser_state.tcp_connected = false;
    
    printf("[Dispenser] System initialized (Test Mode)\r\n");
    return 0;
}

// 获取系统状态
DispenserSystemState* Dispenser_GetState(void)
{
    return &g_dispenser_state;
}

// 更新运行时间
void Dispenser_UpdateRuntime(uint32_t seconds)
{
    g_dispenser_state.data.runtime_seconds = seconds;
}

// 更新水量
void Dispenser_SetWater(uint16_t ml)
{
    g_dispenser_state.data.remaining_water_ml = ml;
}

// 更新水温
void Dispenser_SetTemp(uint8_t temp)
{
    g_dispenser_state.data.water_temp_celsius = temp;
}

// 更新水质
void Dispenser_SetQuality(uint8_t quality)
{
    if (quality <= DISPENSER_QUALITY_PRIME) {
        g_dispenser_state.data.water_quality = quality;
    }
}

// 增加完成杯数
void Dispenser_AddCup(void)
{
    g_dispenser_state.data.cups_completed++;
}

// 发送心跳包
int Dispenser_SendHeartbeat(void)
{
    char heartbeat[128];
    
    if (Dispenser_GetHeartbeatString(heartbeat, sizeof(heartbeat)) < 0) {
        return -1;
    }
    
    // 通过 W800 TCP 连接发送
    if (g_dispenser_state.w800_device && g_dispenser_state.tcp_connected) {
        W800Dev *ptW800 = (W800Dev *)g_dispenser_state.w800_device;
        if (ptW800 && ptW800->Send) {
            int ret = ptW800->Send(ptW800, (uint8_t *)heartbeat, strlen(heartbeat));
            if (ret >= 0) {
                printf("[Heartbeat] Sent %d bytes: %s\r\n", ret, heartbeat);
                g_dispenser_state.last_heartbeat_time = HAL_GetTick() / 1000;
                return 0;
            }
        }
    }
    
    // 如果 TCP 未连接，只打印到串口
    printf("HB: %s\r\n", heartbeat);
    g_dispenser_state.last_heartbeat_time = HAL_GetTick() / 1000;
    
    return -1;
}

// 设置 W800 设备指针
void Dispenser_SetW800Device(void *w800_dev)
{
    g_dispenser_state.w800_device = w800_dev;
}

// 切换到正式运行模式
int Dispenser_EnterNormalMode(void)
{
    g_dispenser_state.system_mode = DISPENSER_MODE_NORMAL;
    g_dispenser_state.tcp_connected = true;
    
    printf("[Dispenser] Enter Normal Mode\r\n");
    printf("[Dispenser] Water: %dml, Temp: %d℃, Quality: %d, Cups: %d\r\n",
           g_dispenser_state.data.remaining_water_ml,
           g_dispenser_state.data.water_temp_celsius,
           g_dispenser_state.data.water_quality,
           g_dispenser_state.data.cups_completed);
    
    return 0;
}

// 切换到测试模式
int Dispenser_EnterTestMode(void)
{
    g_dispenser_state.system_mode = DISPENSER_MODE_TEST;
    g_dispenser_state.tcp_connected = false;
    
    printf("[Dispenser] Enter Test Mode\r\n");
    
    return 0;
}

// 获取心跳包格式字符串
int Dispenser_GetHeartbeatString(char *buffer, size_t len)
{
    if (!buffer || len < 64) {
        return -1;
    }
    
    const DispenserData *data = &g_dispenser_state.data;
    
    // 固定格式心跳包
    snprintf(buffer, len,
             "HB,TS=%lu,RUN=%lu,WAT=%lu,TMP=%lu,QLT=%lu,CUP=%lu",
             (unsigned long)(HAL_GetTick() / 1000),
             (unsigned long)data->runtime_seconds,
             (unsigned long)data->remaining_water_ml,
             (unsigned long)data->water_temp_celsius,
             (unsigned long)data->water_quality,
             (unsigned long)data->cups_completed);
    
    return 0;
}
