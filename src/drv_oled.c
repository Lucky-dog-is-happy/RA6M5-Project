/*
 * drv_oled.c
 *
 *  Created on: 2023年4月11日
 *      Author: slhuan
 */

#include "drv_oled.h"
#include "drv_disp.h"
#include "hal_systick.h"
#include <stdio.h>
#include <stdlib.h>

static bool SPIWaitTxCplt(void);
static void OLEDDrvGpioInit(void);
static void OLEDDrvWriteCS(CS eState);
static void OLEDDrvWriteDCX(DCX eState);

static void OLEDDrvWriteReg(uint8_t ucData);
static void OLEDDrvWriteDat(uint8_t ucData);
static void OLEDDrvWriteBuf(uint8_t* rbuf, unsigned short wSize);

static void OLEDDrvSetContrastValue(uint8_t ucValue);
static void OLEDDrvEntrieDisp(bool bState);
static void OLEDDrvSetDispMode(bool bMode);
static void OLEDDrvSetHScroll(uint8_t ucDir, uint8_t ucStart, uint8_t ucFrtime, uint8_t ucEnd);
static void OLEDDrvSetHVScrool(uint8_t ucDir, uint8_t ucStart, uint8_t ucFrtime, uint8_t ucEnd, uint8_t ucOffset);
static void OLEDDrvSetScroll(bool bState);
static void OLEDDrvSetScrollArea(uint8_t ucArea, uint8_t ucNumOfRow);
static void OLEDDrvSetMemAddrMode(uint8_t ucMode);
static void OLEDDrvSetColumnAddr(uint8_t ucStart, uint8_t ucEnd);
static void OLEDDrvSetPageAddr(uint8_t ucStart, uint8_t ucEnd);
static void OLEDDrvSetDispStartLine(uint8_t ucLine);
static void OLEDDrvSetSegRemap(bool bMap);
static void OLEDDrvSetMuxRatio(uint8_t ucRatio);
static void OLEDDrvSetCOMScanDir(bool bDir);
static void OLEDDrvSetDispOffset(uint8_t ucOffset);
static void OLEDDrvSetCOMHWConfig(uint8_t ucCOMPinRemap, uint8_t ucLeftRightRemap);
static void OLEDDrvSetDispClock(uint8_t ucDiv, uint8_t ucFreq);
static void OLEDDrvSetPrechargePeriod(uint8_t ucPhase1, uint8_t ucPhase2);
static void OLEDDrvSetVCOMHLevel(uint8_t ucLevel);
static void OLEDDrvSetChargePump(bool bState);

static int  OLEDDrvinit(struct DisplayDevice* ptDev);
static void OLEDDrvDispON(struct DisplayDevice* ptDev);
static void OLEDDrvDispOFF(struct DisplayDevice* ptDev);
static void OLEDDrvSetDispWindow(struct DisplayDevice* ptDev, \
                                 unsigned short wXS, unsigned short wYS, \
                                 unsigned short wXE, unsigned short wYE);
static int  OLEDDrvSetPixel(struct DisplayDevice* ptDev, \
                            unsigned short wX, unsigned short wY, unsigned short wColor);
static void OLEDDrvFulsh(struct DisplayDevice* ptDev);

static unsigned short gOledFbuf[128*64/8];
static DisplayDevice gOledDev = {
                             .name = "OLED",
                             .FBBase = gOledFbuf,
                             .wXres = 128,
                             .wYres = 64,
                             .wBpp = 1,
                             .dwSize = 128*64*1/8,
                             .Init = OLEDDrvinit,
                             .DisplayON = OLEDDrvDispON,
                             .DisplayOFF = OLEDDrvDispOFF,
                             .SetDisplayWindow = OLEDDrvSetDispWindow,
                             .Flush = OLEDDrvFulsh,
                             .SetPixel = OLEDDrvSetPixel
};

static volatile bool gSPITxCplt = false;
static uint8_t gMemMode = 0xFF;

struct DisplayDevice *OLEDGetDevice(void)
{
    return &gOledDev;
}

void spi0_callback(spi_callback_args_t *p_args)
{
    if(p_args->channel == 0)
    {
        if(p_args->event == SPI_EVENT_TRANSFER_COMPLETE)
            gSPITxCplt = true;
    }
}

static bool SPIWaitTxCplt(void)
{
    unsigned short wTimeout = 100;
    while(!gSPITxCplt && wTimeout)
    {
        HAL_Delay(1);
        wTimeout--;
    }
    gSPITxCplt = false;
    if(gSPITxCplt==false && wTimeout==0)
        return false;
    return true;
}

static void OLEDDrvGpioInit(void)
{
    fsp_err_t err = g_ioport.p_api->open(g_ioport.p_ctrl, g_ioport.p_cfg);
    if(FSP_SUCCESS != err)
        printf("Failed to open GPIOs!\r\n");
}

static void OLEDDrvWriteCS(CS eState)
{
    fsp_err_t err = g_ioport.p_api->pinWrite(g_ioport.p_ctrl, BSP_IO_PORT_02_PIN_05, (bsp_io_level_t)eState);
    if(FSP_SUCCESS != err)
        printf("Failed to write %d to pin 0x%.4x!\r\n", eState, BSP_IO_PORT_02_PIN_05);
}

static void OLEDDrvWriteDCX(DCX eState)
{
    fsp_err_t err = g_ioport.p_api->pinWrite(g_ioport.p_ctrl, BSP_IO_PORT_02_PIN_06, (bsp_io_level_t)eState);
    if(FSP_SUCCESS != err)
        printf("Failed to write %d to pin 0x%.4x!\r\n", eState, BSP_IO_PORT_02_PIN_06);
}

static void OLEDDrvWriteReg(uint8_t ucData)
{
    OLEDDrvWriteDCX(isCommand);
    fsp_err_t err = g_spi0.p_api->write(g_spi0.p_ctrl, (uint8_t*)&ucData, 1, SPI_BIT_WIDTH_8_BITS);
    if(FSP_SUCCESS != err)
        printf("Function:%s\tLine:%d\r\n", __FUNCTION__, __LINE__);
    SPIWaitTxCplt();
}

static void OLEDDrvWriteDat(uint8_t ucData)
{
    OLEDDrvWriteDCX(isData);
    fsp_err_t err = g_spi0.p_api->write(g_spi0.p_ctrl, (uint8_t*)&ucData, 1, SPI_BIT_WIDTH_8_BITS);
    if(FSP_SUCCESS != err)
        printf("Function:%s\tLine:%d\r\n", __FUNCTION__, __LINE__);
    SPIWaitTxCplt();
}

static void OLEDDrvWriteBuf(uint8_t* rbuf, unsigned short wSize)
{
    OLEDDrvWriteDCX(isData);
    fsp_err_t err = g_spi0.p_api->write(g_spi0.p_ctrl, (uint8_t*)rbuf, wSize, SPI_BIT_WIDTH_8_BITS);
    if(FSP_SUCCESS != err)
        printf("Function:%s\tLine:%d\r\n", __FUNCTION__, __LINE__);
    SPIWaitTxCplt();
}

/************** 1. 基础命令功能函数 **************/
/*
 *  函数名：OLED_SetContrastValue
 *  功能描述：设置OLED的对比度：发送命令0x81--->发送对比度值
 *  输入参数：value --> 对比度值，范围0~255
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetContrastValue(uint8_t ucValue)
{
    OLEDDrvWriteReg(0x81);
    OLEDDrvWriteReg(ucValue);
}

/* SSD1306全部显示或者局部显示：0xA5-局部显示；0xA4-全部显示 */
static void OLEDDrvEntrieDisp(bool bState)
{
    if(bState)
        OLEDDrvWriteReg(0xA5);
    else
        OLEDDrvWriteReg(0xA4);
}

/* SSD1306正常显示还是颠倒显示：
 * 0xA6-正常显示，1显示，0不显示
 * 0xA7-颠倒现实，1不显示，0显示*/
static void OLEDDrvSetDispMode(bool bMode)
{
    if(bMode)
        OLEDDrvWriteReg(0xA6);
    else
        OLEDDrvWriteReg(0xA7);
}

/************** 2. 滚动命令功能函数 **************/
/*
 *  函数名：OLED_H_Scroll
 *  功能描述：让指定页的像素朝着设置的方向按设置的频率水平滚动
 *  输入参数：dir--->滚动方向：朝左或者朝右
 *            start--->起始页
 *            fr_time--->滚动间隔时间，每隔这么多帧水平偏移一列滚动
 *            end--->结束页
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetHScroll(uint8_t ucDir, uint8_t ucStart, uint8_t ucFrtime, uint8_t ucEnd)
{
    if((ucStart>0x07) || (ucFrtime>0x07) || (ucEnd>0x07))    return;
    if(ucDir)
        OLEDDrvWriteReg(0x26);
    else
        OLEDDrvWriteReg(0x27);
    OLEDDrvWriteReg(0x00);
    OLEDDrvWriteReg(ucStart);
    OLEDDrvWriteReg(ucFrtime);
    OLEDDrvWriteReg(ucEnd);
    OLEDDrvWriteReg(0x00);
    OLEDDrvWriteReg(0xFF);
}

/*
 *  函数名：OLED_HV_Scroll
 *  功能描述：让指定页的像素朝着设置的方向按设置的频率水平滚动且会将像素的行地址进行偏移offset这么多个单位
 *  输入参数：dir--->滚动方向：朝左或者朝右
 *            start--->起始页
 *            fr_time--->滚动间隔时间，每隔这么多帧水平偏移一列滚动
 *            end--->结束页
 *            offset--->行偏移单位
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetHVScrool(uint8_t ucDir, uint8_t ucStart, uint8_t ucFrtime, uint8_t ucEnd, uint8_t ucOffset)
{
    if((ucStart>0x07) || (ucFrtime>0x07) || (ucEnd>0x07) || (ucOffset>0x3F))    return;
    if(ucDir)
        OLEDDrvWriteReg(0x29);
    else
        OLEDDrvWriteReg(0x2A);
    OLEDDrvWriteReg(0x00);
    OLEDDrvWriteReg(ucStart);
    OLEDDrvWriteReg(ucFrtime);
    OLEDDrvWriteReg(ucEnd);
    OLEDDrvWriteReg(ucOffset);
}

static void OLEDDrvSetScroll(bool bState)
{
    if(bState)
        OLEDDrvWriteReg(0x2F);
    else
        OLEDDrvWriteReg(0x2E);
}

/*
 *  函数名：OLED_SetVScrollArea
 *  功能描述：设置OLED像素垂直滚动的区域
 *  输入参数：area-->顶行区域
 *            row_num--->滚动的行区域
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetScrollArea(uint8_t ucArea, uint8_t ucNumOfRow)
{
    if((ucArea>0x3F) || (ucNumOfRow>0x7F))       return;
    OLEDDrvWriteReg(0xA3);
    OLEDDrvWriteReg(ucArea);
    OLEDDrvWriteReg(ucNumOfRow);
}

/*
 *  函数名：OLED_SetMemAddrMode
 *  功能描述：设置OLED的地址模式
 *  输入参数：mode-->地址模式：页地址模式、水平地址模式、垂直地址模式
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetMemAddrMode(uint8_t ucMode)
{
    if(3 <= ucMode)      return;
    OLEDDrvWriteReg(0x20);
    OLEDDrvWriteReg(ucMode);
    gMemMode = ucMode;
}

/*
 *  函数名：OLED_SetColAddr_PAGE
 *  功能描述：设置OLED在页地址模式下的显示起始行地址
 *  输入参数：addr-->起始行地址
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetColumnAddr(uint8_t ucStart, uint8_t ucEnd)
{
    if(ucStart>0x7F || ucEnd>0x7F)   return;
    if(2 == gMemMode)
    {
        OLEDDrvWriteReg(ucStart&0x0F);
        OLEDDrvWriteReg(0x10 + (ucStart>>4)&0x0F);
    }
    else
    {
        OLEDDrvWriteReg(0x21);
        OLEDDrvWriteReg(ucStart);
        OLEDDrvWriteReg(ucEnd);
    }
}
static void OLEDDrvSetPageAddr(uint8_t ucStart, uint8_t ucEnd)
{
    if(2 == gMemMode)
    {
        if(ucStart>7)    return;
        OLEDDrvWriteReg(0xB0 + ucStart);
    }
    else
    {
        if(ucStart>0x7F || ucEnd>0x7F)   return;
        OLEDDrvWriteReg(0x22);
        OLEDDrvWriteReg(ucStart&0x07);
        OLEDDrvWriteReg(ucEnd&0x07);
    }
}

/************** 4. 硬件配置功能函数 **************/
/*
 *  函数名：OLED_SetDispStartLine
 *  功能描述：设置OLED从第line行开始显示，即将默认的0行偏移至line那一行
 *  输入参数：line-->显示的起始行
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetDispStartLine(uint8_t ucLine)
{
    if(ucLine > 63)       return;
    OLEDDrvWriteReg(0x40 + ucLine);
}

static void OLEDDrvSetSegRemap(bool bMap)
{
    if(false == bMap)
        OLEDDrvWriteReg(0xA0);
    else
        OLEDDrvWriteReg(0xA1);
}

/*
 *  函数名：OLED_SetMuxRatio
 *  功能描述：设置OLED复用率
 *  输入参数：ratio-->复用率值
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetMuxRatio(uint8_t ucRatio)
{
    if((ucRatio < 15) || (ucRatio > 63))      return;
    OLEDDrvWriteReg(0xA8);
    OLEDDrvWriteReg(ucRatio);
}

static void OLEDDrvSetCOMScanDir(bool bDir)
{
    if(bDir==false)
        OLEDDrvWriteReg(0xC0);
    else if(bDir == true)
        OLEDDrvWriteReg(0xC8);
}

static void OLEDDrvSetDispOffset(uint8_t ucOffset)
{
    if(ucOffset > 0x3F)   return;
    OLEDDrvWriteReg(0xD3);
    OLEDDrvWriteReg(ucOffset);
}

static void OLEDDrvSetCOMHWConfig(uint8_t ucCOMPinRemap, uint8_t ucLeftRightRemap)
{
    OLEDDrvWriteReg(0xDA);
    OLEDDrvWriteReg((ucCOMPinRemap<<4) + (ucLeftRightRemap<<5) + 0x02);
}

static void OLEDDrvSetDispClock(uint8_t ucDiv, uint8_t ucFreq)
{
    OLEDDrvWriteReg(0xD5);
    OLEDDrvWriteReg((ucFreq<<4) + ucDiv);
}

static void OLEDDrvSetPrechargePeriod(uint8_t ucPhase1, uint8_t ucPhase2)
{
    OLEDDrvWriteReg(0xD9);
    OLEDDrvWriteReg((ucPhase2<<4) + ucPhase1);
}

static void OLEDDrvSetVCOMHLevel(uint8_t ucLevel)
{
    OLEDDrvWriteReg(0xDB);
    OLEDDrvWriteReg(ucLevel<<4);
}

/************** 6. 电荷碰撞功能函数 **************/
/*
 *  函数名：OLED_SetChargePump
 *  功能描述：打开或关闭OLED的电荷泵
 *  输入参数：state-->电荷泵打开或关闭
 *  输出参数：无
 *  返回值：无
*/
static void OLEDDrvSetChargePump(bool bState)
{
    OLEDDrvWriteReg(0x8D);
    OLEDDrvWriteReg((bState<<2) + 0x10);
}

static void OLEDDrvDispON(struct DisplayDevice* ptDev)
{
    if(NULL == ptDev->name)    return;
    OLEDDrvWriteReg(0xAF);
}

static void OLEDDrvDispOFF(struct DisplayDevice* ptDev)
{
    if(NULL == ptDev->name)    return;
    OLEDDrvWriteReg(0xAE);
}

static void OLEDDrvSetDispWindow(struct DisplayDevice* ptDev, unsigned short wXS, unsigned short wYS, unsigned short wXE, unsigned short wYE)
{
    if(NULL == ptDev->name)    return;
    OLEDDrvSetColumnAddr((uint8_t)wXS, (uint8_t)wXE);
    OLEDDrvSetPageAddr((uint8_t)wYS, (uint8_t)wYE);
}

static int OLEDDrvSetPixel(struct DisplayDevice* ptDev, unsigned short wX, unsigned short wY, unsigned short wColor)
{
    if(NULL == ptDev->name)    return -1;

    unsigned char *buf = ptDev->FBBase;
    int page;
    unsigned char *byte;
    int bit;

    if (wX >= ptDev->wXres || wY >= ptDev->wYres)
        return -1;

    page = wY / 8;
    byte = buf + page * 128 + wX;
    bit = wY % 8;

    if (wColor)
        *byte |= (1<<bit);
    else
        *byte &= ~(1<<bit);

    return 0;
}

static void OLEDDrvFulsh(struct DisplayDevice* ptDev)
{
    if(NULL == ptDev->name)    return;
    OLEDDrvWriteCS(isSelect);
    OLEDDrvWriteBuf(ptDev->FBBase, 128*8);
    OLEDDrvWriteCS(notSelect);
}

static int OLEDDrvinit(struct DisplayDevice* ptDev)
{
    if(NULL == ptDev->name)    return -1;
    OLEDDrvGpioInit();
    OLEDDrvWriteCS(notSelect);
    OLEDDrvWriteDCX(isCommand);

    fsp_err_t err = g_spi0.p_api->open(g_spi0.p_ctrl, g_spi0.p_cfg);
    if(FSP_SUCCESS != err)
    {
        printf("Error when open spi0 device!\r\n");
        return -1;
    }
    printf("Success to open device: spi0\r\n");

    OLEDDrvWriteCS(isSelect);
    OLEDDrvSetMemAddrMode(1);
    OLEDDrvSetMuxRatio(0x3F);
    OLEDDrvSetDispOffset(0x00);
    OLEDDrvSetDispStartLine(0);
    OLEDDrvSetSegRemap(true);
    OLEDDrvSetCOMScanDir(true);
    OLEDDrvSetCOMHWConfig(0, 0);
    OLEDDrvSetContrastValue(0x7F);
    OLEDDrvEntrieDisp(false);
    OLEDDrvSetDispMode(true);
    OLEDDrvSetDispClock(0x00, 0x08);
    OLEDDrvSetChargePump(true);
    OLEDDrvDispON(ptDev);
    OLEDDrvSetDispWindow(ptDev, 0, 0, ptDev->wXres-1, ptDev->wYres-1);
    OLEDDrvWriteCS(notSelect);

    return 0;
}
