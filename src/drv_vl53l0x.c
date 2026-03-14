#include "drv_vl53l0x.h"
#include <stdio.h>

#define XSHUT1_PIN  BSP_IO_PORT_05_PIN_00

#define VL53L0X_I2C_ADDR    0x52

#define STATUS_OK            0
#define STATUS_FAIL          1

static volatile bool gI2C5TxCplt = false;
static volatile bool gI2C5RxCplt = false;

void sci_i2c5_master_callback(i2c_master_callback_args_t *p_args)
{
    if(I2C_MASTER_EVENT_RX_COMPLETE == p_args->event)
        gI2C5RxCplt = true;
    else if(I2C_MASTER_EVENT_TX_COMPLETE == p_args->event)
        gI2C5TxCplt = true;
}

static void I2C5_Wait_TxCplt(void)
{
    uint16_t timeout = 50;
    while(!gI2C5TxCplt && timeout) {
        R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MILLISECONDS);
        timeout--;
    }
    gI2C5TxCplt = false;
}

static void I2C5_Wait_RxCplt(void)
{
    uint16_t timeout = 50;
    while(!gI2C5RxCplt && timeout) {
        R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MILLISECONDS);
        timeout--;
    }
    gI2C5RxCplt = false;
}

void VL53L0X_Shutdown(void)
{
    g_ioport.p_api->pinWrite(&g_ioport_ctrl, XSHUT1_PIN, BSP_IO_LEVEL_LOW);
    R_BSP_SoftwareDelay(10, BSP_DELAY_UNITS_MILLISECONDS);
}

void VL53L0X_Wakeup(void)
{
    g_ioport.p_api->pinWrite(&g_ioport_ctrl, XSHUT1_PIN, BSP_IO_LEVEL_HIGH);
    R_BSP_SoftwareDelay(10, BSP_DELAY_UNITS_MILLISECONDS);
}

int VL53L0X_Write_Byte(uint8_t addr, uint8_t reg, uint8_t data)
{
    return VL53L0X_Write_Multi(addr, reg, &data, 1);
}

int VL53L0X_Read_Byte(uint8_t addr, uint8_t reg, uint8_t *data)
{
    return VL53L0X_Read_Multi(addr, reg, data, 1);
}

int VL53L0X_Write_Word(uint8_t addr, uint8_t reg, uint16_t data)
{
    uint8_t buffer[2];
    buffer[0] = (uint8_t)(data >> 8);
    buffer[1] = (uint8_t)(data & 0xFF);
    
    if(reg % 2 == 1) {
        VL53L0X_Write_Multi(addr, reg, &buffer[0], 1);
        return VL53L0X_Write_Multi(addr, reg + 1, &buffer[1], 1);
    } else {
        return VL53L0X_Write_Multi(addr, reg, buffer, 2);
    }
}

int VL53L0X_Read_Word(uint8_t addr, uint8_t reg, uint16_t *data)
{
    uint8_t buffer[2];
    int status = VL53L0X_Read_Multi(addr, reg, buffer, 2);
    if(status == STATUS_OK) {
        *data = ((uint16_t)buffer[0] << 8) | buffer[1];
    }
    return status;
}

int VL53L0X_Write_DWord(uint8_t addr, uint8_t reg, uint32_t data)
{
    uint8_t buffer[4];
    buffer[0] = (uint8_t)(data >> 24);
    buffer[1] = (uint8_t)((data >> 16) & 0xFF);
    buffer[2] = (uint8_t)((data >> 8) & 0xFF);
    buffer[3] = (uint8_t)(data & 0xFF);
    return VL53L0X_Write_Multi(addr, reg, buffer, 4);
}

int VL53L0X_Read_DWord(uint8_t addr, uint8_t reg, uint32_t *data)
{
    uint8_t buffer[4];
    int status = VL53L0X_Read_Multi(addr, reg, buffer, 4);
    if(status == STATUS_OK) {
        *data = ((uint32_t)buffer[0] << 24) | ((uint32_t)buffer[1] << 16) |
                ((uint32_t)buffer[2] << 8) | buffer[3];
    }
    return status;
}

int VL53L0X_Write_Multi(uint8_t addr, uint8_t reg, uint8_t *data, uint32_t count)
{
    uint8_t buffer[64];
    if(count >= 64) return STATUS_FAIL;
    
    buffer[0] = reg;
    for(uint32_t i = 0; i < count; i++) {
        buffer[i + 1] = data[i];
    }
    
    g_i2c5.p_api->write(g_i2c5.p_ctrl, buffer, count + 1, false);
    I2C5_Wait_TxCplt();
    
    return STATUS_OK;
}

int VL53L0X_Read_Multi(uint8_t addr, uint8_t reg, uint8_t *data, uint32_t count)
{
    g_i2c5.p_api->write(g_i2c5.p_ctrl, &reg, 1, true);
    I2C5_Wait_TxCplt();
    
    R_BSP_SoftwareDelay(300, BSP_DELAY_UNITS_MICROSECONDS);
    
    g_i2c5.p_api->read(g_i2c5.p_ctrl, data, count, false);
    I2C5_Wait_RxCplt();
    
    return STATUS_OK;
}

static int VL53L0X_Init_Sensor(void)
{
    uint8_t model_id, revision_id;
    uint16_t word_data;
    
    VL53L0X_Read_Byte(VL53L0X_I2C_ADDR, 0xC0, &model_id);
    VL53L0X_Read_Byte(VL53L0X_I2C_ADDR, 0xC2, &revision_id);
    printf("[VL53L0X] Model ID: 0x%02X, Revision: 0x%02X\r\n", model_id, revision_id);
    
    if(model_id != 0xEE) {
        printf("[VL53L0X] ERROR: Model ID mismatch!\r\n");
        return STATUS_FAIL;
    }
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Word(VL53L0X_I2C_ADDR, 0x00, 0x0000);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x80, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x00, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x80, 0x01);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x60, 0x00);
    VL53L0X_Read_Word(VL53L0X_I2C_ADDR, 0x54, &word_data);
    printf("[VL53L0X] VHV config: 0x%04X\r\n", word_data);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x22, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x20, 0x04);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xF3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x7F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x02, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x80, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x09);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x0A);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x0B);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x09);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x0C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x0D);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x0E);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x80, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0A, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x84, 0x02);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x0E, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x11, 0x03);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x3A, 0xE3);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x40, 0x33);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x46, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x09, 0x0F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x10, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x14, 0x3C);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x4F, 0x3F);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x44, 0x00);
    
    printf("[VL53L0X] Sensor initialized\r\n");
    return STATUS_OK;
}

static int VL53L0X_Scan_I2C_Addr(void)
{
    printf("[VL53L0X] Scanning I2C addresses...\r\n");
    
    uint8_t test_addrs[] = {0x52, 0x29, 0x30, 0x60};
    
    for(int i = 0; i < sizeof(test_addrs); i++) {
        uint8_t addr = test_addrs[i];
        uint8_t model_id = 0;
        
        g_i2c5.p_api->write(g_i2c5.p_ctrl, &addr, 1, true);
        uint16_t timeout = 20;
        while(!gI2C5TxCplt && timeout) {
            R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MILLISECONDS);
            timeout--;
        }
        gI2C5TxCplt = false;
        
        if(timeout == 0) {
            printf("[VL53L0X] addr 0x%02X: NACK\r\n", addr);
            continue;
        }
        
        R_BSP_SoftwareDelay(300, BSP_DELAY_UNITS_MICROSECONDS);
        
        g_i2c5.p_api->read(g_i2c5.p_ctrl, &model_id, 1, false);
        timeout = 20;
        while(!gI2C5RxCplt && timeout) {
            R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MILLISECONDS);
            timeout--;
        }
        gI2C5RxCplt = false;
        
        if(timeout == 0) {
            printf("[VL53L0X] addr 0x%02X: read timeout\r\n", addr);
            continue;
        }
        
        printf("[VL53L0X] addr 0x%02X: read 0x%02X\r\n", addr, model_id);
        
        if(model_id == 0xEE) {
            printf("[VL53L0X] Found VL53L0X at 0x%02X\r\n", addr);
            return addr;
        }
    }
    
    printf("[VL53L0X] No VL53L0X found\r\n");
    return -1;
}

int VL53L0X_Init(void)
{
    fsp_err_t err;
    
    printf("[VL53L0X] Initializing...\r\n");
    
    err = g_ioport.p_api->portDirectionSet(&g_ioport_ctrl, 
                                             BSP_IO_PORT_05, 
                                             0x0001,
                                             0x0001);
    if(FSP_SUCCESS != err) {
        printf("[VL53L0X] XSHUT pin config failed: %d\r\n", err);
    } else {
        printf("[VL53L0X] XSHUT pin configured\r\n");
    }
    
    err = g_i2c5.p_api->open(g_i2c5.p_ctrl, g_i2c5.p_cfg);
    if(FSP_SUCCESS != err) {
        printf("[VL53L0X] I2C5 open failed: %d\r\n", err);
        return STATUS_FAIL;
    }
    printf("[VL53L0X] I2C5 opened\r\n");
    
    VL53L0X_Shutdown();
    R_BSP_SoftwareDelay(10, BSP_DELAY_UNITS_MILLISECONDS);
    VL53L0X_Wakeup();
    R_BSP_SoftwareDelay(50, BSP_DELAY_UNITS_MILLISECONDS);
    
    int found_addr = VL53L0X_Scan_I2C_Addr();
    if(found_addr < 0) {
        printf("[VL53L0X] No sensor found!\r\n");
        return STATUS_FAIL;
    }
    
    if(VL53L0X_Init_Sensor() != STATUS_OK) {
        return STATUS_FAIL;
    }
    
    return STATUS_OK;
}

uint16_t VL53L0X_Read_Distance(void)
{
    uint16_t distance = 0;
    uint8_t range_status;
    uint8_t data[12];
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x80, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x01);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x00, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x91, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0xFF, 0x00);
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x80, 0x00);
    
    VL53L0X_Write_Byte(VL53L0X_I2C_ADDR, 0x00, 0x01);
    
    uint16_t timeout = 500;
    uint8_t ready = 0;
    while(timeout > 0) {
        VL53L0X_Read_Byte(VL53L0X_I2C_ADDR, 0x13, &ready);
        if(ready & 0x07) break;
        R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MILLISECONDS);
        timeout--;
    }
    
    VL53L0X_Read_Multi(VL53L0X_I2C_ADDR, 0x14, data, 12);
    
    range_status = data[0];
    distance = ((uint16_t)data[10] << 8) | data[11];
    
    if(range_status != 0) {
        printf("[VL53L0X] Range status: %d\r\n", range_status);
        return 0xFFFF;
    }
    
    return distance;
}
