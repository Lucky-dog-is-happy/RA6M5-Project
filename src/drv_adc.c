#include "drv_adc.h"

static int ADCDrvInit(struct ADCDev *ptDev);
static int ADCDrvRead(struct ADCDev *ptDev, uint16_t *value, uint16_t num);
static uint32_t ADC_ToVoltageMv(uint16_t adc_value);
static void ADCWaitConvCplt(uint8_t adc_unit);

static ADCDevTypeDef g_adc0_dev = {
    .name = "ADC0",
    .adc_unit = 0,
    .channel = ADC_CHANNEL_WATER,
    .Init = ADCDrvInit,
    .Read = ADCDrvRead,
    .ToVoltageMv = ADC_ToVoltageMv
};

static ADCDevTypeDef g_adc1_dev = {
    .name = "ADC1",
    .adc_unit = 1,
    .channel = ADC_CHANNEL_MIC,
    .Init = ADCDrvInit,
    .Read = ADCDrvRead,
    .ToVoltageMv = ADC_ToVoltageMv
};

ADCDevTypeDef* ADCGetDevice(uint8_t channel)
{
    if (channel == ADC_CHANNEL_WATER) {
        return &g_adc0_dev;
    } else if (channel == ADC_CHANNEL_MIC) {
        return &g_adc1_dev;
    }
    return NULL;
}

static void ADCWaitConvCplt(uint8_t adc_unit)
{
    adc_status_t status;
    status.state = ADC_STATE_SCAN_IN_PROGRESS;
    
    if (adc_unit == 0) {
        while (ADC_STATE_SCAN_IN_PROGRESS == status.state) {
            g_adc0.p_api->scanStatusGet(g_adc0.p_ctrl, &status);
        }
    } else {
        while (ADC_STATE_SCAN_IN_PROGRESS == status.state) {
            g_adc1.p_api->scanStatusGet(g_adc1.p_ctrl, &status);
        }
    }
}

static int ADCDrvInit(struct ADCDev *ptDev)
{
    if (ptDev == NULL) {
        return -1;
    }
    
    fsp_err_t err;
    
    if (ptDev->adc_unit == 0) {
        err = g_adc0.p_api->open(g_adc0.p_ctrl, g_adc0.p_cfg);
        if (FSP_SUCCESS != err) {
            return -1;
        }
        err = g_adc0.p_api->scanCfg(g_adc0.p_ctrl, g_adc0.p_channel_cfg);
        if (FSP_SUCCESS != err) {
            return -1;
        }
    } else {
        err = g_adc1.p_api->open(g_adc1.p_ctrl, g_adc1.p_cfg);
        if (FSP_SUCCESS != err) {
            return -1;
        }
        err = g_adc1.p_api->scanCfg(g_adc1.p_ctrl, g_adc1.p_channel_cfg);
        if (FSP_SUCCESS != err) {
            return -1;
        }
    }
    
    return 0;
}

static int ADCDrvRead(struct ADCDev *ptDev, uint16_t *value, uint16_t num)
{
    if (ptDev == NULL || value == NULL || num == 0) {
        return -1;
    }
    
    fsp_err_t err;
    
    if (ptDev->adc_unit == 0) {
        for (uint16_t i = 0; i < num; i++) {
            err = g_adc0.p_api->scanStart(g_adc0.p_ctrl);
            if (FSP_SUCCESS != err) {
                return -1;
            }
            ADCWaitConvCplt(0);
            err = g_adc0.p_api->read(g_adc0.p_ctrl, ADC_CHANNEL_1, &value[i]);
            if (FSP_SUCCESS != err) {
                return -1;
            }
        }
    } else {
        for (uint16_t i = 0; i < num; i++) {
            err = g_adc1.p_api->scanStart(g_adc1.p_ctrl);
            if (FSP_SUCCESS != err) {
                return -1;
            }
            ADCWaitConvCplt(1);
            err = g_adc1.p_api->read(g_adc1.p_ctrl, ADC_CHANNEL_2, &value[i]);
            if (FSP_SUCCESS != err) {
                return -1;
            }
        }
    }
    
    return 0;
}

uint32_t ADC_ToVoltageMv(uint16_t adc_value)
{
    return ((uint32_t)adc_value * ADC_VREF_MV) / ADC_RESOLUTION;
}
