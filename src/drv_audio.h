#ifndef DRV_AUDIO_H
#define DRV_AUDIO_H

#include <stdint.h>

#define AUDIO_FFT_SIZE         256
#define AUDIO_SAMPLE_RATE       8000
#define AUDIO_SAMPLE_PERIOD_US  125

typedef struct {
    float fft_input[AUDIO_FFT_SIZE];
    float fft_output[AUDIO_FFT_SIZE];
    float fft_magnitude[AUDIO_FFT_SIZE / 2];
    uint16_t sample_buffer[AUDIO_FFT_SIZE];
    uint16_t sample_index;
    uint8_t fft_ready;
    float peak_frequency;
    float peak_magnitude;
} AudioFFTContext;

int audio_fft_init(void);
void audio_fft_sample_isr(uint16_t adc_value);
void audio_fft_process(void);
float audio_fft_get_peak_frequency(void);
float audio_fft_get_peak_magnitude(void);
uint8_t audio_fft_is_ready(void);
void audio_fft_reset(void);

#endif
