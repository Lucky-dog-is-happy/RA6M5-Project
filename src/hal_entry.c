#include "hal_data.h"
#include "drv_uart.h"
#include "drv_sci_spi.h"
#include "drv_i2c.h"
#include "drv_eeprom.h"
#include "hal_systick.h"
#include "drv_gpio.h"
#include "drv_w800.h"
#include "drv_dispenser.h"
#include "drv_vl53l0x.h"
#include "drv_adc.h"
#include "drv_audio.h"
#include <stdio.h>

#if (1 == BSP_MULTICORE_PROJECT) && BSP_TZ_SECURE_BUILD
bsp_ipc_semaphore_handle_t g_core_start_semaphore =
{
    .semaphore_num = 0
};
#endif

/* DispAppTest commented out - old OLED display code removed
void DispAppTest(void)
{
    DisplayDevice *ptDispDev = OLEDGetDevice();
    if(ptDispDev == NULL)
    {
        printf("Failed to get OLED Display Device!\r\n");
        return;
    }

    ptDispDev->Init(ptDispDev);
    uint8_t *pBuf = (uint8_t*)ptDispDev->FBBase;
    while(1)
    {
        for(uint16_t i=0; i<ptDispDev->dwSize; i++)
            pBuf[i] = 0x00;

        ptDispDev->Flush(ptDispDev);

        // Simple test animation
        for(uint16_t i=0; i<ptDispDev->dwSize; i++)
            pBuf[i] = (i % 2) ? 0xFF : 0x00;
        ptDispDev->Flush(ptDispDev);
        HAL_Delay(500);

        for(uint16_t i=0; i<ptDispDev->dwSize; i++)
            pBuf[i] = (i % 2) ? 0x00 : 0xFF;
        ptDispDev->Flush(ptDispDev);
        HAL_Delay(500);
    }
}
*/

void W800AppTest(void)
{
    printf("[W800] Starting WiFi Test...\r\n");
    
    W800Dev *ptW800 = W800GetDevice();
    if (ptW800 == NULL) {
        printf("[W800] Failed to get device!\r\n");
        return;
    }
    
    if (ptW800->Init(ptW800) != 0) {
        printf("[W800] Init failed!\r\n");
        return;
    }
    printf("[W800] AT test OK\r\n");
    
    printf("[W800] Connecting to WiFi...\r\n");
    if (ptW800->ConnectWiFi(ptW800, "Lucky", "26862628") != 0) {
        printf("[W800] WiFi connection failed!\r\n");
        return;
    }
    printf("[W800] WiFi connected! IP: %s\r\n", ptW800->ip_addr);

    // 初始化水机系统
    printf("[System] Initializing Dispenser System...\r\n");
    if (Dispenser_Init() != 0) {
        printf("[System] Dispenser init failed!\r\n");
        return;
    }
    
    // 设置 W800 设备指针
    Dispenser_SetW800Device(ptW800);

    printf("[W800] Connecting to TCP server...\r\n");
    if (ptW800->ConnectTCP(ptW800, "10.136.172.174", 8080) != 0) {
        printf("[W800] TCP connection failed!\r\n");
        return;
    }
    printf("[W800] TCP connected!\r\n");

    // 切换到正式运行模式
    printf("[System] Switching to Normal Mode...\r\n");
    if (Dispenser_EnterNormalMode() != 0) {
        printf("[System] Failed to enter normal mode!\r\n");
        return;
    }

    uint8_t sendData[] = "Hello from RA6M5!";
    int sent = ptW800->Send(ptW800, sendData, sizeof(sendData) - 1);
    printf("[W800] Sent %d bytes\r\n", sent);
    
    uint8_t recvBuf[256];
    int received = ptW800->Receive(ptW800, recvBuf, sizeof(recvBuf));
    if (received > 0) {
        printf("[W800] Received %d bytes: %s\r\n", received, recvBuf);
    }
    
    printf("[W800] Test completed!\r\n");
}

void hal_entry(void)
{
    fsp_err_t err;
    bsp_io_level_t level = 1;

    circlebuf_init();

    err = g_uart2.p_api->open(g_uart2.p_ctrl, g_uart2.p_cfg);
    printf("UART2 open: %d\r\n", err);
    err = g_uart6.p_api->open(g_uart6.p_ctrl, g_uart6.p_cfg);
    printf("UART6 open: %d\r\n", err);
    printf("hello world! From lucky\r\n");
    g_ioport.p_api->pinWrite(&g_ioport_ctrl, BSP_IO_PORT_04_PIN_00, level);
    
    SystickInit();
    
    ADCDevTypeDef *ptWaterDev = ADCGetDevice(ADC_CHANNEL_WATER);
    ADCDevTypeDef *ptMicDev = ADCGetDevice(ADC_CHANNEL_MIC);
    
    if (ptWaterDev == NULL || ptMicDev == NULL) {
        printf("Failed to get ADC devices!\r\n");
        return;
    }
    
    ptWaterDev->Init(ptWaterDev);
    ptMicDev->Init(ptMicDev);
    
    printf("ADC initialized: Water(ADC0), Mic(ADC1)\r\n");
    
    audio_fft_init();
    printf("Audio FFT initialized (256 points, 8kHz sample rate)\r\n");
    
    uint32_t sample_count = 0;
    
    while(1)
    {
        uint16_t water_val = 0;
        uint16_t mic_val = 0;
        
        ptWaterDev->Read(ptWaterDev, &water_val, 1);
        ptMicDev->Read(ptMicDev, &mic_val, 1);
        
        audio_fft_sample_isr(mic_val);
        sample_count++;
        
        if (audio_fft_is_ready()) {
            audio_fft_process();
            float peak_freq = audio_fft_get_peak_frequency();
            float peak_mag = audio_fft_get_peak_magnitude();
            uint32_t freq_int = (uint32_t)(peak_freq * 10);
            uint32_t mag_int = (uint32_t)(peak_mag * 100);
            printf("[FFT] S:%u F:%u.%uHz M:%u.%02u\r\n", 
                   sample_count, freq_int / 10, freq_int % 10, mag_int / 100, mag_int % 100);
            audio_fft_reset();
            sample_count = 0;
        }
        
        if (sample_count % 1000 == 0) {
            uint32_t water_mv = ptWaterDev->ToVoltageMv(water_val);
            uint32_t mic_mv = ptMicDev->ToVoltageMv(mic_val);
            printf("Water[ADC0]: %u (%umV) | Mic[ADC1]: %u (%umV)\r\n", 
                   water_val, water_mv, mic_val, mic_mv);
        }
        
        for(volatile int i = 0; i < 1000; i++);
    }

    IODev *ptKeyDev = IOGetDevice("UserKey");
    if(NULL == ptKeyDev)
    {
        printf("Failed to get UserKey!\r\n");
        return;
    }

    IODev *ptLedDev = IOGetDevice("UserLed");
    if(NULL == ptLedDev)
    {
        printf("Failed to get UserLed!\r\n");
        return;
    }

    if(ptKeyDev->Init(ptKeyDev) != 0)
        return;
    if(ptLedDev->Init(ptLedDev) !=0)
        return;

#if (0 == _RA_CORE) && (1 == BSP_MULTICORE_PROJECT) && !BSP_TZ_NONSECURE_BUILD

#if BSP_TZ_SECURE_BUILD
    R_BSP_IpcSemaphoreTake(&g_core_start_semaphore);
#endif

    R_BSP_SecondaryCoreStart();

#if BSP_TZ_SECURE_BUILD
    while(FSP_ERR_IN_USE == R_BSP_IpcSemaphoreTake(&g_core_start_semaphore))
    {
        ;
    }
#endif
#endif

#if (1 == _RA_CORE) && (1 == BSP_MULTICORE_PROJECT) && BSP_TZ_SECURE_BUILD
    R_BSP_IpcSemaphoreGive(&g_core_start_semaphore);
#endif


#if BSP_TZ_SECURE_BUILD
    R_BSP_NonSecureEnter();
#endif
}

#if BSP_TZ_SECURE_BUILD

FSP_CPP_HEADER
BSP_CMSE_NONSECURE_ENTRY void template_nonsecure_callable ();

BSP_CMSE_NONSECURE_ENTRY void template_nonsecure_callable ()
{

}
FSP_CPP_FOOTER

#endif
