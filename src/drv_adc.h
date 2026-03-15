#ifndef DRV_ADC_H
#define DRV_ADC_H

#include <stdint.h>
#include "hal_data.h"

#define ADC_VREF_MV     3300
#define ADC_RESOLUTION  4096

#define ADC_CHANNEL_WATER   1
#define ADC_CHANNEL_MIC     2

typedef struct ADCDev {
    char *name;
    uint8_t adc_unit;
    uint8_t channel;
    int (*Init)(struct ADCDev *ptDev);
    int (*Read)(struct ADCDev *ptDev, uint16_t *value, uint16_t num);
    uint32_t (*ToVoltageMv)(uint16_t adc_value);
} ADCDevTypeDef;

ADCDevTypeDef* ADCGetDevice(uint8_t channel);

#endif
