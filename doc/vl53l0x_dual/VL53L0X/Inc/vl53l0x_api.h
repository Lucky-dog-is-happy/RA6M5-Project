/*******************************************************************************
Copyright (C) 2016, STMicroelectronics International N.V.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of STMicroelectronics nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
NON-INFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS ARE DISCLAIMED.
IN NO EVENT SHALL STMICROELECTRONICS INTERNATIONAL N.V. BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*******************************************************************************/

#ifndef _VL53L0X_API_H_
#define _VL53L0X_API_H_

#include "vl53l0x_api_strings.h"
#include "vl53l0x_def.h"
#include "vl53l0x_platform.h"

#ifdef __cplusplus
extern "C" {
#endif

VL53L0X_Error VL53L0X_GetVersion(VL53L0X_Version_t *pVersion);
VL53L0X_Error VL53L0X_GetPalSpecVersion(VL53L0X_Version_t *pPalSpecVersion);
VL53L0X_Error VL53L0X_GetProductRevision(VL53L0X_DEV Dev,
	uint8_t *pProductRevisionMajor, uint8_t *pProductRevisionMinor);
VL53L0X_Error VL53L0X_GetDeviceInfo(VL53L0X_DEV Dev,
	VL53L0X_DeviceInfo_t *pVL53L0X_DeviceInfo);
VL53L0X_Error VL53L0X_GetDeviceErrorStatus(VL53L0X_DEV Dev,
	VL53L0X_DeviceError *pDeviceErrorStatus);
VL53L0X_Error VL53L0X_GetRangeStatusString(uint8_t RangeStatus,
	char *pRangeStatusString);
VL53L0X_Error VL53L0X_GetDeviceErrorString(
	VL53L0X_DeviceError ErrorCode, char *pDeviceErrorString);
VL53L0X_Error VL53L0X_GetPalErrorString(VL53L0X_Error PalErrorCode,
	char *pPalErrorString);
VL53L0X_Error VL53L0X_GetPalStateString(VL53L0X_State PalStateCode,
	char *pPalStateString);
VL53L0X_Error VL53L0X_GetPalState(VL53L0X_DEV Dev,
	VL53L0X_State *pPalState);
VL53L0X_Error VL53L0X_SetPowerMode(VL53L0X_DEV Dev,
	VL53L0X_PowerModes PowerMode);
VL53L0X_Error VL53L0X_GetPowerMode(VL53L0X_DEV Dev,
	VL53L0X_PowerModes *pPowerMode);
VL53L0X_Error VL53L0X_SetOffsetCalibrationDataMicroMeter(
	VL53L0X_DEV Dev, int32_t OffsetCalibrationDataMicroMeter);
VL53L0X_Error VL53L0X_GetOffsetCalibrationDataMicroMeter(
	VL53L0X_DEV Dev, int32_t *pOffsetCalibrationDataMicroMeter);
VL53L0X_Error VL53L0X_SetLinearityCorrectiveGain(VL53L0X_DEV Dev,
	int16_t LinearityCorrectiveGain);
VL53L0X_Error VL53L0X_GetLinearityCorrectiveGain(VL53L0X_DEV Dev,
	uint16_t *pLinearityCorrectiveGain);
VL53L0X_Error VL53L0X_SetGroupParamHold(VL53L0X_DEV Dev,
	uint8_t GroupParamHold);
VL53L0X_Error VL53L0X_GetUpperLimitMilliMeter(VL53L0X_DEV Dev,
	uint16_t *pUpperLimitMilliMeter);
VL53L0X_Error VL53L0X_GetTotalSignalRate(VL53L0X_DEV Dev,
	FixPoint1616_t *pTotalSignalRate);

VL53L0X_Error VL53L0X_SetDeviceAddress(VL53L0X_DEV Dev,
	uint8_t DeviceAddress);
VL53L0X_Error VL53L0X_DataInit(VL53L0X_DEV Dev);
VL53L0X_Error VL53L0X_SetTuningSettingBuffer(VL53L0X_DEV Dev,
	uint8_t *pTuningSettingBuffer, uint8_t UseInternalTuningSettings);
VL53L0X_Error VL53L0X_GetTuningSettingBuffer(VL53L0X_DEV Dev,
	uint8_t **ppTuningSettingBuffer, uint8_t *pUseInternalTuningSettings);
VL53L0X_Error VL53L0X_StaticInit(VL53L0X_DEV Dev);
VL53L0X_Error VL53L0X_WaitDeviceBooted(VL53L0X_DEV Dev);
VL53L0X_Error VL53L0X_ResetDevice(VL53L0X_DEV Dev);

VL53L0X_Error VL53L0X_SetDeviceParameters(VL53L0X_DEV Dev,
	const VL53L0X_DeviceParameters_t *pDeviceParameters);
VL53L0X_Error VL53L0X_GetDeviceParameters(VL53L0X_DEV Dev,
	VL53L0X_DeviceParameters_t *pDeviceParameters);
VL53L0X_Error VL53L0X_SetDeviceMode(VL53L0X_DEV Dev,
	VL53L0X_DeviceModes DeviceMode);
VL53L0X_Error VL53L0X_GetDeviceMode(VL53L0X_DEV Dev,
	VL53L0X_DeviceModes *pDeviceMode);
VL53L0X_Error VL53L0X_SetRangeFractionEnable(VL53L0X_DEV Dev,
	uint8_t Enable);
VL53L0X_Error VL53L0X_GetFractionEnable(VL53L0X_DEV Dev,
	uint8_t *pEnable);
VL53L0X_Error VL53L0X_SetHistogramMode(VL53L0X_DEV Dev,
	VL53L0X_HistogramModes HistogramMode);
VL53L0X_Error VL53L0X_GetHistogramMode(VL53L0X_DEV Dev,
	VL53L0X_HistogramModes *pHistogramMode);
VL53L0X_Error VL53L0X_SetMeasurementTimingBudgetMicroSeconds(
	VL53L0X_DEV Dev, uint32_t MeasurementTimingBudgetMicroSeconds);
VL53L0X_Error VL53L0X_GetMeasurementTimingBudgetMicroSeconds(
	VL53L0X_DEV Dev, uint32_t *pMeasurementTimingBudgetMicroSeconds);
VL53L0X_Error VL53L0X_GetVcselPulsePeriod(VL53L0X_DEV Dev,
	VL53L0X_VcselPeriod VcselPeriodType, uint8_t *pVCSELPulsePeriod);
VL53L0X_Error VL53L0X_SetVcselPulsePeriod(VL53L0X_DEV Dev,
	VL53L0X_VcselPeriod VcselPeriodType, uint8_t VCSELPulsePeriod);
VL53L0X_Error VL53L0X_SetSequenceStepEnable(VL53L0X_DEV Dev,
	VL53L0X_SequenceStepId SequenceStepId, uint8_t SequenceStepEnabled);
VL53L0X_Error VL53L0X_GetSequenceStepEnable(VL53L0X_DEV Dev,
	VL53L0X_SequenceStepId SequenceStepId, uint8_t *pSequenceStepEnabled);
VL53L0X_Error VL53L0X_GetSequenceStepEnables(VL53L0X_DEV Dev,
	VL53L0X_SchedulerSequenceSteps_t *pSchedulerSequenceSteps);
VL53L0X_Error VL53L0X_SetSequenceStepTimeout(VL53L0X_DEV Dev,
	VL53L0X_SequenceStepId SequenceStepId, FixPoint1616_t TimeOutMilliSecs);
VL53L0X_Error VL53L0X_GetSequenceStepTimeout(VL53L0X_DEV Dev,
	VL53L0X_SequenceStepId SequenceStepId,
	FixPoint1616_t *pTimeOutMilliSecs);
VL53L0X_Error VL53L0X_GetNumberOfSequenceSteps(VL53L0X_DEV Dev,
	uint8_t *pNumberOfSequenceSteps);
VL53L0X_Error VL53L0X_GetSequenceStepsInfo(
	VL53L0X_SequenceStepId SequenceStepId, char *pSequenceStepsString);
VL53L0X_Error VL53L0X_SetInterMeasurementPeriodMilliSeconds(
	VL53L0X_DEV Dev, uint32_t InterMeasurementPeriodMilliSeconds);
VL53L0X_Error VL53L0X_GetInterMeasurementPeriodMilliSeconds(
	VL53L0X_DEV Dev, uint32_t *pInterMeasurementPeriodMilliSeconds);
VL53L0X_Error VL53L0X_SetXTalkCompensationEnable(VL53L0X_DEV Dev,
	uint8_t XTalkCompensationEnable);
VL53L0X_Error VL53L0X_GetXTalkCompensationEnable(VL53L0X_DEV Dev,
	uint8_t *pXTalkCompensationEnable);
VL53L0X_Error VL53L0X_SetXTalkCompensationRateMegaCps(VL53L0X_DEV Dev,
	FixPoint1616_t XTalkCompensationRateMegaCps);
VL53L0X_Error VL53L0X_GetXTalkCompensationRateMegaCps(VL53L0X_DEV Dev,
	FixPoint1616_t *pXTalkCompensationRateMegaCps);
VL53L0X_Error VL53L0X_SetRefCalibration(VL53L0X_DEV Dev,
	uint8_t VhvSettings, uint8_t PhaseCal);
VL53L0X_Error VL53L0X_GetRefCalibration(VL53L0X_DEV Dev,
	uint8_t *pVhvSettings, uint8_t *pPhaseCal);
VL53L0X_Error VL53L0X_GetNumberOfLimitCheck(
	uint16_t *pNumberOfLimitCheck);
VL53L0X_Error VL53L0X_GetLimitCheckInfo(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, char *pLimitCheckString);
VL53L0X_Error VL53L0X_GetLimitCheckStatus(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, uint8_t *pLimitCheckStatus);
VL53L0X_Error VL53L0X_SetLimitCheckEnable(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, uint8_t LimitCheckEnable);
VL53L0X_Error VL53L0X_GetLimitCheckEnable(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, uint8_t *pLimitCheckEnable);
VL53L0X_Error VL53L0X_SetLimitCheckValue(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, FixPoint1616_t LimitCheckValue);
VL53L0X_Error VL53L0X_GetLimitCheckValue(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, FixPoint1616_t *pLimitCheckValue);
VL53L0X_Error VL53L0X_GetLimitCheckCurrent(VL53L0X_DEV Dev,
	uint16_t LimitCheckId, FixPoint1616_t *pLimitCheckCurrent);
VL53L0X_Error VL53L0X_SetWrapAroundCheckEnable(VL53L0X_DEV Dev,
		uint8_t WrapAroundCheckEnable);
VL53L0X_Error VL53L0X_GetWrapAroundCheckEnable(VL53L0X_DEV Dev,
		uint8_t *pWrapAroundCheckEnable);
VL53L0X_Error VL53L0X_SetDmaxCalParameters(VL53L0X_DEV Dev,
		uint16_t RangeMilliMeter, FixPoint1616_t SignalRateRtnMegaCps);
VL53L0X_Error VL53L0X_GetDmaxCalParameters(VL53L0X_DEV Dev,
	uint16_t *pRangeMilliMeter, FixPoint1616_t *pSignalRateRtnMegaCps);

VL53L0X_Error VL53L0X_PerformSingleMeasurement(VL53L0X_DEV Dev);
VL53L0X_Error VL53L0X_PerformRefCalibration(VL53L0X_DEV Dev,
	uint8_t *pVhvSettings, uint8_t *pPhaseCal);
VL53L0X_Error VL53L0X_PerformXTalkMeasurement(VL53L0X_DEV Dev,
	uint32_t TimeoutMs, FixPoint1616_t *pXtalkPerSpad,
	uint8_t *pAmbientTooHigh);
VL53L0X_Error VL53L0X_PerformXTalkCalibration(VL53L0X_DEV Dev,
	FixPoint1616_t XTalkCalDistance,
	FixPoint1616_t *pXTalkCompensationRateMegaCps);
VL53L0X_Error VL53L0X_PerformOffsetCalibration(VL53L0X_DEV Dev,
	FixPoint1616_t CalDistanceMilliMeter, int32_t *pOffsetMicroMeter);
VL53L0X_Error VL53L0X_StartMeasurement(VL53L0X_DEV Dev);
VL53L0X_Error VL53L0X_StopMeasurement(VL53L0X_DEV Dev);
VL53L0X_Error VL53L0X_GetMeasurementDataReady(VL53L0X_DEV Dev,
	uint8_t *pMeasurementDataReady);
VL53L0X_Error VL53L0X_WaitDeviceReadyForNewMeasurement(VL53L0X_DEV Dev,
	uint32_t MaxLoop);
VL53L0X_Error VL53L0X_GetMeasurementRefSignal(VL53L0X_DEV Dev,
	FixPoint1616_t *pMeasurementRefSignal);
VL53L0X_Error VL53L0X_GetRangingMeasurementData(VL53L0X_DEV Dev,
	VL53L0X_RangingMeasurementData_t *pRangingMeasurementData);
VL53L0X_Error VL53L0X_GetHistogramMeasurementData(VL53L0X_DEV Dev,
	VL53L0X_HistogramMeasurementData_t *pHistogramMeasurementData);
VL53L0X_Error VL53L0X_PerformSingleRangingMeasurement(VL53L0X_DEV Dev,
	VL53L0X_RangingMeasurementData_t *pRangingMeasurementData);
VL53L0X_Error VL53L0X_PerformSingleHistogramMeasurement(VL53L0X_DEV Dev,
	VL53L0X_HistogramMeasurementData_t *pHistogramMeasurementData);
VL53L0X_Error VL53L0X_SetNumberOfROIZones(VL53L0X_DEV Dev,
	uint8_t NumberOfROIZones);
VL53L0X_Error VL53L0X_GetNumberOfROIZones(VL53L0X_DEV Dev,
	uint8_t *pNumberOfROIZones);
VL53L0X_Error VL53L0X_GetMaxNumberOfROIZones(VL53L0X_DEV Dev,
	uint8_t *pMaxNumberOfROIZones);

VL53L0X_Error VL53L0X_SetGpioConfig(VL53L0X_DEV Dev, uint8_t Pin,
	VL53L0X_DeviceModes DeviceMode, VL53L0X_GpioFunctionality Functionality,
	VL53L0X_InterruptPolarity Polarity);
VL53L0X_Error VL53L0X_GetGpioConfig(VL53L0X_DEV Dev, uint8_t Pin,
	VL53L0X_DeviceModes *pDeviceMode,
	VL53L0X_GpioFunctionality *pFunctionality,
	VL53L0X_InterruptPolarity *pPolarity);
VL53L0X_Error VL53L0X_SetInterruptThresholds(VL53L0X_DEV Dev,
	VL53L0X_DeviceModes DeviceMode, FixPoint1616_t ThresholdLow,
	FixPoint1616_t ThresholdHigh);
VL53L0X_Error VL53L0X_GetInterruptThresholds(VL53L0X_DEV Dev,
	VL53L0X_DeviceModes DeviceMode, FixPoint1616_t *pThresholdLow,
	FixPoint1616_t *pThresholdHigh);
VL53L0X_Error VL53L0X_GetStopCompletedStatus(VL53L0X_DEV Dev,
	uint32_t *pStopStatus);
VL53L0X_Error VL53L0X_ClearInterruptMask(VL53L0X_DEV Dev,
	uint32_t InterruptMask);
VL53L0X_Error VL53L0X_GetInterruptMaskStatus(VL53L0X_DEV Dev,
	uint32_t *pInterruptMaskStatus);
VL53L0X_Error VL53L0X_EnableInterruptMask(VL53L0X_DEV Dev,
	uint32_t InterruptMask);

VL53L0X_Error VL53L0X_SetSpadAmbientDamperThreshold(VL53L0X_DEV Dev,
	uint16_t SpadAmbientDamperThreshold);
VL53L0X_Error VL53L0X_GetSpadAmbientDamperThreshold(VL53L0X_DEV Dev,
	uint16_t *pSpadAmbientDamperThreshold);
VL53L0X_Error VL53L0X_SetSpadAmbientDamperFactor(VL53L0X_DEV Dev,
	uint16_t SpadAmbientDamperFactor);
VL53L0X_Error VL53L0X_GetSpadAmbientDamperFactor(VL53L0X_DEV Dev,
	uint16_t *pSpadAmbientDamperFactor);
VL53L0X_Error VL53L0X_PerformRefSpadManagement(VL53L0X_DEV Dev,
	uint32_t *refSpadCount, uint8_t *isApertureSpads);
VL53L0X_Error VL53L0X_SetReferenceSpads(VL53L0X_DEV Dev,
	uint32_t refSpadCount, uint8_t isApertureSpads);
VL53L0X_Error VL53L0X_GetReferenceSpads(VL53L0X_DEV Dev,
	uint32_t *refSpadCount, uint8_t *isApertureSpads);

#ifdef __cplusplus
}
#endif

#endif
