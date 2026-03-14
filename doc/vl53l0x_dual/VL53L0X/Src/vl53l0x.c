#include "vl53l0.h"
#include <stdio.h>
#include "stm32f1xx_hal.h"

#define VL53L0X_DEFAULT_ADDR  0x52
#define VL53L0X_ADDR1         0x52
#define VL53L0X_ADDR2_7BIT    0x30
#define VL53L0X_ADDR2         0x60

#define XSHUT1_GPIO  GPIOA
#define XSHUT1_PIN   GPIO_PIN_5
#define XSHUT2_GPIO  GPIOA
#define XSHUT2_PIN   GPIO_PIN_6

VL53L0X_Dev_t vl53l0x_dev1;
VL53L0X_Dev_t vl53l0x_dev2;
VL53L0X_DeviceInfo_t vl53l0x_dev_info;
VL53L0X_RangingMeasurementData_t vl53l0x_data;
VL53L0X_Error vl53l0x_status;

static int measure_count = 0;

void VL53L0X_setAddress(uint8_t old_addr, uint8_t new_addr_7bit)
{
    VL53L0X_write_byte(old_addr, 0x8A, new_addr_7bit);
}

void VL53L0X_reset_sensor(uint8_t sensor_id)
{
    if(sensor_id == 1) {
        HAL_GPIO_WritePin(XSHUT1_GPIO, XSHUT1_PIN, GPIO_PIN_RESET);
        HAL_Delay(10);
        HAL_GPIO_WritePin(XSHUT1_GPIO, XSHUT1_PIN, GPIO_PIN_SET);
        HAL_Delay(10);
    } else if(sensor_id == 2) {
        HAL_GPIO_WritePin(XSHUT2_GPIO, XSHUT2_PIN, GPIO_PIN_RESET);
        HAL_Delay(10);
        HAL_GPIO_WritePin(XSHUT2_GPIO, XSHUT2_PIN, GPIO_PIN_SET);
        HAL_Delay(10);
    }
}

void VL53L0X_shutdown_sensor(uint8_t sensor_id)
{
    if(sensor_id == 1) {
        HAL_GPIO_WritePin(XSHUT1_GPIO, XSHUT1_PIN, GPIO_PIN_RESET);
    } else if(sensor_id == 2) {
        HAL_GPIO_WritePin(XSHUT2_GPIO, XSHUT2_PIN, GPIO_PIN_RESET);
    }
}

void VL53L0X_wakeup_sensor(uint8_t sensor_id)
{
    if(sensor_id == 1) {
        HAL_GPIO_WritePin(XSHUT1_GPIO, XSHUT1_PIN, GPIO_PIN_SET);
    } else if(sensor_id == 2) {
        HAL_GPIO_WritePin(XSHUT2_GPIO, XSHUT2_PIN, GPIO_PIN_SET);
    }
}

const char* get_range_status_string(uint8_t status) {
    switch(status) {
        case 0: return "Range Valid";
        case 1: return "Sigma Fail";
        case 2: return "Signal Fail";
        case 3: return "Range Valid (wrapped)";
        case 4: return "Out of Bounds";
        case 5: return "Hardware Fail";
        case 6: return "Range Valid (spads abnormal)";
        case 7: return "Wrapped Target Fail";
        default: return "Unknown";
    }
}

void print_pal_error(VL53L0X_Error Status)
{
    char buf[VL53L0X_MAX_STRING_LENGTH];
    VL53L0X_GetPalErrorString(Status, buf);
    printf("API Status: %i : %s\n", Status, buf);
}

void print_range_status(VL53L0X_RangingMeasurementData_t* pdata)
{
    char buf[VL53L0X_MAX_STRING_LENGTH];
    uint8_t RangeStatus;
    RangeStatus = pdata->RangeStatus;
    VL53L0X_GetRangeStatusString(RangeStatus, buf);
}

VL53L0X_Error vl53l0x_start_single_test(VL53L0X_Dev_t *pdev, \
                            VL53L0X_RangingMeasurementData_t *pdata)
{
    VL53L0X_Error status = VL53L0X_ERROR_NONE;
    
    status = VL53L0X_PerformSingleRangingMeasurement(pdev, pdata);
    if(status != VL53L0X_ERROR_NONE){
        return status;
    }
    
    measure_count++;
    printf("Sensor[0x%02X]: %d mm\n", pdev->I2cDevAddr, pdata->RangeMilliMeter);
    
    return status;
}

uint16_t vl53l0x_read_distance(uint8_t addr)
{
    VL53L0X_RangingMeasurementData_t data;
    VL53L0X_Error status;
    
    if(addr == VL53L0X_ADDR2) {
        status = VL53L0X_PerformSingleRangingMeasurement(&vl53l0x_dev1, &data);
    } else if(addr == VL53L0X_ADDR1) {
        status = VL53L0X_PerformSingleRangingMeasurement(&vl53l0x_dev2, &data);
    } else {
        return 0xFFFF;
    }
    
    if(status != VL53L0X_ERROR_NONE) {
        return 0xFFFF;
    }
    
    return data.RangeMilliMeter;
}

VL53L0X_Error vl53l0x_measure_init(VL53L0X_Dev_t *pMyDevice)
{
    VL53L0X_Error Status = VL53L0X_ERROR_NONE;
    uint32_t refSpadCount;
    uint8_t isApertureSpads;
    uint8_t VhvSettings;
    uint8_t PhaseCal;

    Status = VL53L0X_StaticInit(pMyDevice);
    if(Status != VL53L0X_ERROR_NONE){
        printf ("Call of VL53L0X_StaticInit\n");
        print_pal_error(Status);
        return Status;
    }

    Status = VL53L0X_PerformRefCalibration(pMyDevice, &VhvSettings, &PhaseCal);
    if(Status != VL53L0X_ERROR_NONE){
        printf ("Call of VL53L0X_PerformRefCalibration\n");
        print_pal_error(Status);
        return Status;
    }

    Status = VL53L0X_PerformRefSpadManagement(pMyDevice,&refSpadCount, &isApertureSpads);
    if(Status != VL53L0X_ERROR_NONE){
        printf ("Call of VL53L0X_PerformRefSpadManagement\n");
        printf ("refSpadCount = %lu, isApertureSpads = %d\n", (unsigned long)refSpadCount, isApertureSpads);
        print_pal_error(Status);
        return Status;
    }

    printf("=== SPAD Calibration Result ===\n");
    printf("refSpadCount: %lu\n", (unsigned long)refSpadCount);
    printf("isApertureSpads: %d\n", isApertureSpads);
    printf("===============================\n");

    Status = VL53L0X_SetDeviceMode(pMyDevice, VL53L0X_DEVICEMODE_SINGLE_RANGING);
    if(Status != VL53L0X_ERROR_NONE){
        printf ("Call of VL53L0X_SetDeviceMode\n");
        print_pal_error(Status);
        return Status;
    }

    if(Status == VL53L0X_ERROR_NONE){
        Status = VL53L0X_SetLimitCheckEnable(pMyDevice,
        		VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, 1);
    }
    if(Status == VL53L0X_ERROR_NONE){
        Status = VL53L0X_SetLimitCheckEnable(pMyDevice,
        		VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, 1);
    }
				
    if(Status == VL53L0X_ERROR_NONE){
        Status = VL53L0X_SetLimitCheckValue(pMyDevice,
        		VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE,
        		(FixPoint1616_t)(0.25*65536));
	}			
    if(Status == VL53L0X_ERROR_NONE){
        Status = VL53L0X_SetLimitCheckValue(pMyDevice,
        		VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE,
        		(FixPoint1616_t)(18*65536));			
    }
    if(Status == VL53L0X_ERROR_NONE){
        Status = VL53L0X_SetMeasurementTimingBudgetMicroSeconds(pMyDevice,
        		200000);
    }
    if(Status != VL53L0X_ERROR_NONE){
        printf ("Sigma and Signal check error\n");
        print_pal_error(Status);
        return Status;
    }

    return Status;
}

uint16_t vl53l0x_read_distance_simple(void)
{
    uint8_t buf[12];
    uint8_t val = 0;
    int cnt = 0;
    
    VL53L0X_write_byte(0x52, 0x00, 0x01);
    
    HAL_Delay(10);
    
    while (cnt < 100) {
        VL53L0X_read_byte(0x52, 0x14, &val);
        if (val & 0x01) break;
        HAL_Delay(10);
        cnt++;
    }
    
    if (!(val & 0x01)) {
        return 0xFFFF;
    }
    
    VL53L0X_read_multi(0x52, 0x14, buf, 12);
    
    printf("Raw: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\r\n",
           buf[0], buf[1], buf[2], buf[3], buf[4], buf[5],
           buf[6], buf[7], buf[8], buf[9], buf[10], buf[11]);
    
    uint16_t ambient = ((uint16_t)buf[7] << 8) | buf[6];
    uint16_t signal = ((uint16_t)buf[9] << 8) | buf[8];
    uint16_t dist = ((uint16_t)buf[10] << 8) | buf[11];
    uint8_t status = (buf[0] & 0x78) >> 3;
    
    printf("Dist: %u mm, Signal: %u, Ambient: %u, Status: %u\r\n", dist, signal, ambient, status);
    
    return dist;
}

VL53L0X_Error vl53l0x_init_single(VL53L0X_Dev_t *pMyDevice, uint8_t addr)
{
    VL53L0X_Error Status = VL53L0X_ERROR_NONE;
    
    pMyDevice->I2cDevAddr = addr;
    pMyDevice->comms_type = 1;
    pMyDevice->comms_speed_khz = 400;

    Status = VL53L0X_DataInit(pMyDevice);
    if(Status != VL53L0X_ERROR_NONE){
        print_pal_error(Status);
        return Status;
    }

    Status = VL53L0X_GetDeviceInfo(pMyDevice, &vl53l0x_dev_info);
    if(Status != VL53L0X_ERROR_NONE){
        print_pal_error(Status);
        return Status;
    }
    printf("Device Name : %s\n", vl53l0x_dev_info.Name);

    Status = vl53l0x_measure_init(pMyDevice);
    if(Status != VL53L0X_ERROR_NONE){
        print_pal_error(Status);
        return Status;
    }

    return Status;
}

VL53L0X_Error vl53l0x_init_dual(void)
{
    VL53L0X_Error Status = VL53L0X_ERROR_NONE;

    VL53L0X_i2c_init();

    printf("=== Initialize Dual VL53L0X Sensors ===\n");
    
    printf("\n--- Shutdown both sensors ---\n");
    VL53L0X_shutdown_sensor(1);
    VL53L0X_shutdown_sensor(2);
    HAL_Delay(10);
    
    printf("--- Wakeup sensor 1 ---\n");
    VL53L0X_wakeup_sensor(1);
    HAL_Delay(10);
    
    printf("--- Init sensor 1 with default address 0x52 ---\n");
    Status = vl53l0x_init_single(&vl53l0x_dev1, VL53L0X_DEFAULT_ADDR);
    if(Status != VL53L0X_ERROR_NONE){
        printf("Sensor 1 init failed!\n");
        return Status;
    }
    
    printf("--- Change sensor 1 address to 0x60 ---\n");
    VL53L0X_setAddress(VL53L0X_DEFAULT_ADDR, VL53L0X_ADDR2_7BIT);
    vl53l0x_dev1.I2cDevAddr = VL53L0X_ADDR2;
    HAL_Delay(10);
    
    printf("--- Wakeup sensor 2 ---\n");
    VL53L0X_wakeup_sensor(2);
    HAL_Delay(10);
    
    printf("--- Init sensor 2 with default address 0x52 ---\n");
    Status = vl53l0x_init_single(&vl53l0x_dev2, VL53L0X_DEFAULT_ADDR);
    if(Status != VL53L0X_ERROR_NONE){
        printf("Sensor 2 init failed!\n");
        return Status;
    }
    
    printf("\n=== Dual sensors initialized! ===\n");
    printf("Sensor 1: address 0x%02X\n", vl53l0x_dev1.I2cDevAddr);
    printf("Sensor 2: address 0x%02X\n", vl53l0x_dev2.I2cDevAddr);
    
    return Status;
}

VL53L0X_Error vl53l0x_init(void)
{
    VL53L0X_Error Status = VL53L0X_ERROR_NONE;
    uint8_t model_id, revision_id;

    VL53L0X_Dev_t *pMyDevice = &vl53l0x_dev1;

    printf("=== Hardware Reset (XSHUT) ===\n");
    VL53L0X_reset_sensor(1);
    printf("Reset done\n");
    printf("==============================\n\n");
    
    VL53L0X_i2c_init();

    printf("=== I2C Communication Test ===\n");
    VL53L0X_read_byte(VL53L0X_DEFAULT_ADDR, 0xC0, &model_id);
    VL53L0X_read_byte(VL53L0X_DEFAULT_ADDR, 0xC2, &revision_id);
    printf("Model ID: 0x%02X (expect 0xEE)\n", model_id);
    printf("Revision ID: 0x%02X\n", revision_id);
    if (model_id != 0xEE) {
        printf("WARNING: Model ID mismatch! I2C may have issues.\n");
    }
    printf("==============================\n\n");

    pMyDevice->I2cDevAddr = VL53L0X_DEFAULT_ADDR;
    pMyDevice->comms_type = 1;
    pMyDevice->comms_speed_khz = 400;

    Status = VL53L0X_DataInit(pMyDevice);
    if(Status != VL53L0X_ERROR_NONE){
        print_pal_error(Status);
        return Status;
    }

    Status = VL53L0X_GetDeviceInfo(pMyDevice, &vl53l0x_dev_info);
    if(Status != VL53L0X_ERROR_NONE){
        print_pal_error(Status);
        return Status;
    }
    printf("VL53L0X_GetDeviceInfo:\n");
    printf("Device Name : %s\n", vl53l0x_dev_info.Name);
    printf("Device Type : %s\n", vl53l0x_dev_info.Type);
    printf("Device ID : %s\n", vl53l0x_dev_info.ProductId);
    printf("ProductRevisionMajor : %d\n", vl53l0x_dev_info.ProductRevisionMajor);
    printf("ProductRevisionMinor : %d\n", vl53l0x_dev_info.ProductRevisionMinor);

    if ((vl53l0x_dev_info.ProductRevisionMajor != 1) && (vl53l0x_dev_info.ProductRevisionMinor != 1)){
        printf("Error expected cut 1.1 but found cut %d.%d\n",
        vl53l0x_dev_info.ProductRevisionMajor, vl53l0x_dev_info.ProductRevisionMinor);
        Status = VL53L0X_ERROR_NOT_SUPPORTED;
        print_pal_error(Status);
        return Status;
    }

    Status = vl53l0x_measure_init(pMyDevice);
    vl53l0x_status = Status;
    if(Status != VL53L0X_ERROR_NONE){
        print_pal_error(Status);
        return Status;
    }

    printf("\n=== Warm-up Measurement (skip first) ===\n");
    {
        VL53L0X_RangingMeasurementData_t warmup_data;
        Status = VL53L0X_PerformSingleRangingMeasurement(pMyDevice, &warmup_data);
        if(Status == VL53L0X_ERROR_NONE){
            printf("Warm-up done. RangeStatus=%d, Distance=%d mm\n", 
                   warmup_data.RangeStatus, warmup_data.RangeMilliMeter);
        } else {
            printf("Warm-up measurement error: %d (may be normal)\n", Status);
        }
    }
    printf("========================================\n\n");

    return Status;
}
