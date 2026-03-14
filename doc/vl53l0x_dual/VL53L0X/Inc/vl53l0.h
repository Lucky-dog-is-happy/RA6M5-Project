#ifndef __VL53L0_H
#define __VL53L0_H

#include "vl53l0x_api.h"
#include "vl53l0x_i2c_platform.h"

#define VL53L0X_DEFAULT_ADDR  0x52
#define VL53L0X_ADDR1         0x52
#define VL53L0X_ADDR2         0x60

extern VL53L0X_Dev_t vl53l0x_dev1;
extern VL53L0X_Dev_t vl53l0x_dev2;
extern VL53L0X_RangingMeasurementData_t vl53l0x_data;
extern VL53L0X_Error vl53l0x_status;

void VL53L0X_setAddress(uint8_t old_addr, uint8_t new_addr);
void VL53L0X_reset_sensor(uint8_t sensor_id);
void VL53L0X_shutdown_sensor(uint8_t sensor_id);
void VL53L0X_wakeup_sensor(uint8_t sensor_id);

VL53L0X_Error vl53l0x_init(void);
VL53L0X_Error vl53l0x_init_dual(void);
VL53L0X_Error vl53l0x_start_single_test(VL53L0X_Dev_t *pdev,
                            VL53L0X_RangingMeasurementData_t *pdata);
uint16_t vl53l0x_read_distance(uint8_t addr);
uint16_t vl53l0x_read_distance_simple(void);

#endif
