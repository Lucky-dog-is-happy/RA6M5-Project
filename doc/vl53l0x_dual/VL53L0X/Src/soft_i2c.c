#include "soft_i2c.h"

static void soft_i2c_delay(void)
{
    volatile int i = 30;
    while(i--);
}

void soft_i2c_init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    
    __HAL_RCC_GPIOB_CLK_ENABLE();
    
    GPIO_InitStruct.Pin = SOFT_I2C_SCL_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(SOFT_I2C_SCL_GPIO, &GPIO_InitStruct);
    
    GPIO_InitStruct.Pin = SOFT_I2C_SDA_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
    HAL_GPIO_Init(SOFT_I2C_SDA_GPIO, &GPIO_InitStruct);
    
    SOFT_I2C_SCL_HIGH();
    SOFT_I2C_SDA_HIGH();
}

static void soft_i2c_start(void)
{
    SOFT_I2C_SDA_HIGH();
    SOFT_I2C_SCL_HIGH();
    soft_i2c_delay();
    SOFT_I2C_SDA_LOW();
    soft_i2c_delay();
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
}

static void soft_i2c_stop(void)
{
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
    SOFT_I2C_SDA_LOW();
    soft_i2c_delay();
    SOFT_I2C_SCL_HIGH();
    soft_i2c_delay();
    SOFT_I2C_SDA_HIGH();
    soft_i2c_delay();
}

static void soft_i2c_send_byte(uint8_t data)
{
    uint8_t i = 8;
    while(i--)
    {
        SOFT_I2C_SCL_LOW();
        soft_i2c_delay();
        if(data & 0x80)
        {
            SOFT_I2C_SDA_HIGH();
        }
        else
        {
            SOFT_I2C_SDA_LOW();
        }
        data <<= 1;
        soft_i2c_delay();
        SOFT_I2C_SCL_HIGH();
        soft_i2c_delay();
    }
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
}

static uint8_t soft_i2c_receive_byte(void)
{
    uint8_t i = 8;
    uint8_t data = 0;
    
    SOFT_I2C_SDA_HIGH();
    while(i--)
    {
        data <<= 1;
        SOFT_I2C_SCL_LOW();
        soft_i2c_delay();
        SOFT_I2C_SCL_HIGH();
        soft_i2c_delay();
        if(SOFT_I2C_SDA_READ())
        {
            data |= 0x01;
        }
    }
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
    return data;
}

static uint8_t soft_i2c_wait_ack(void)
{
    uint8_t ack;
    
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
    SOFT_I2C_SDA_HIGH();
    soft_i2c_delay();
    SOFT_I2C_SCL_HIGH();
    soft_i2c_delay();
    
    if(SOFT_I2C_SDA_READ())
    {
        ack = 1;
    }
    else
    {
        ack = 0;
    }
    
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
    return ack;
}

static void soft_i2c_send_ack(void)
{
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
    SOFT_I2C_SDA_LOW();
    soft_i2c_delay();
    SOFT_I2C_SCL_HIGH();
    soft_i2c_delay();
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
}

static void soft_i2c_send_nack(void)
{
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
    SOFT_I2C_SDA_HIGH();
    soft_i2c_delay();
    SOFT_I2C_SCL_HIGH();
    soft_i2c_delay();
    SOFT_I2C_SCL_LOW();
    soft_i2c_delay();
}

uint8_t soft_i2c_write(uint8_t addr, uint8_t reg, uint32_t len, uint8_t *data)
{
    uint32_t i;
    
    soft_i2c_start();
    
    soft_i2c_send_byte(addr);
    if(soft_i2c_wait_ack())
    {
        soft_i2c_stop();
        return 1;
    }
    
    soft_i2c_send_byte(reg);
    if(soft_i2c_wait_ack())
    {
        soft_i2c_stop();
        return 1;
    }
    
    for(i = 0; i < len; i++)
    {
        soft_i2c_send_byte(data[i]);
        if(soft_i2c_wait_ack())
        {
            soft_i2c_stop();
            return 1;
        }
    }
    
    soft_i2c_stop();
    return 0;
}

uint8_t soft_i2c_read(uint8_t addr, uint8_t reg, uint32_t len, uint8_t *buf)
{
    uint32_t i;
    
    soft_i2c_start();
    
    soft_i2c_send_byte(addr);
    if(soft_i2c_wait_ack())
    {
        soft_i2c_stop();
        return 1;
    }
    
    soft_i2c_send_byte(reg);
    if(soft_i2c_wait_ack())
    {
        soft_i2c_stop();
        return 1;
    }
    
    soft_i2c_delay();
    soft_i2c_start();
    
    soft_i2c_send_byte(addr | 0x01);
    if(soft_i2c_wait_ack())
    {
        soft_i2c_stop();
        return 1;
    }
    
    for(i = 0; i < len; i++)
    {
        buf[i] = soft_i2c_receive_byte();
        if(i < len - 1)
        {
            soft_i2c_send_ack();
        }
        else
        {
            soft_i2c_send_nack();
        }
    }
    
    soft_i2c_stop();
    return 0;
}
