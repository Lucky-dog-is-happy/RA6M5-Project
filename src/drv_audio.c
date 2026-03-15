#include "drv_audio.h"
#include "arm_math.h"

static AudioFFTContext g_audio_fft;
static arm_rfft_fast_instance_f32 g_fft_handle;

int audio_fft_init(void)
{
    arm_rfft_fast_init_f32(&g_fft_handle, AUDIO_FFT_SIZE);
    
    g_audio_fft.sample_index = 0;
    g_audio_fft.fft_ready = 0;
    g_audio_fft.peak_frequency = 0.0f;
    g_audio_fft.peak_magnitude = 0.0f;
    
    for (int i = 0; i < AUDIO_FFT_SIZE; i++) {
        g_audio_fft.sample_buffer[i] = 0;
        g_audio_fft.fft_input[i] = 0.0f;
    }
    
    return 0;
}

void audio_fft_sample_isr(uint16_t adc_value)
{
    g_audio_fft.sample_buffer[g_audio_fft.sample_index] = adc_value;
    
    g_audio_fft.sample_index++;
    
    if (g_audio_fft.sample_index >= AUDIO_FFT_SIZE) {
        g_audio_fft.sample_index = 0;
        g_audio_fft.fft_ready = 1;
    }
}

void audio_fft_process(void)
{
    if (!g_audio_fft.fft_ready) {
        return;
    }
    
    float sum = 0.0f;
    float min_val = 4095.0f;
    float max_val = 0.0f;
    for (int i = 0; i < AUDIO_FFT_SIZE; i++) {
        float v = (float)g_audio_fft.sample_buffer[i];
        sum += v;
        if (v < min_val) min_val = v;
        if (v > max_val) max_val = v;
    }
    float mean = sum / (float)AUDIO_FFT_SIZE;
    float range = max_val - min_val;
    
    for (int i = 0; i < AUDIO_FFT_SIZE; i++) {
        float sample = (float)g_audio_fft.sample_buffer[i] - mean;
        g_audio_fft.fft_input[i] = sample / 4095.0f;
    }
    
    arm_rfft_fast_f32(&g_fft_handle, g_audio_fft.fft_input, g_audio_fft.fft_output, 0);
    
    arm_cmplx_mag_f32(g_audio_fft.fft_output, g_audio_fft.fft_magnitude, AUDIO_FFT_SIZE / 2);
    
    float max_magnitude = 0.0f;
    uint32_t max_index = 0;
    
    for (int i = 1; i < AUDIO_FFT_SIZE / 2; i++) {
        float mag = g_audio_fft.fft_magnitude[i];
        if (mag > max_magnitude) {
            max_magnitude = mag;
            max_index = i;
        }
    }
    
    g_audio_fft.peak_magnitude = max_magnitude;
    g_audio_fft.peak_frequency = (float)max_index * (float)AUDIO_SAMPLE_RATE / (float)AUDIO_FFT_SIZE;
    
    g_audio_fft.fft_ready = 0;
}

float audio_fft_get_peak_frequency(void)
{
    return g_audio_fft.peak_frequency;
}

float audio_fft_get_peak_magnitude(void)
{
    return g_audio_fft.peak_magnitude;
}

uint8_t audio_fft_is_ready(void)
{
    return g_audio_fft.fft_ready;
}

void audio_fft_reset(void)
{
    g_audio_fft.sample_index = 0;
    g_audio_fft.fft_ready = 0;
    g_audio_fft.peak_frequency = 0.0f;
    g_audio_fft.peak_magnitude = 0.0f;
}
