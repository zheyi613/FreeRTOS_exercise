/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    rtc.c
  * @brief   This file provides code for the configuration
  *          of the RTC instances.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "rtc.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

RTC_HandleTypeDef hrtc;

/* RTC init function */
void MX_RTC_Init(void)
{

  /* USER CODE BEGIN RTC_Init 0 */

  /* USER CODE END RTC_Init 0 */

  /* USER CODE BEGIN RTC_Init 1 */

  /* USER CODE END RTC_Init 1 */

  /** Initialize RTC Only
  */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_12;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RTC_Init 2 */

  /* USER CODE END RTC_Init 2 */

}

void HAL_RTC_MspInit(RTC_HandleTypeDef* rtcHandle)
{

  RCC_PeriphCLKInitTypeDef PeriphClkInitStruct = {0};
  if(rtcHandle->Instance==RTC)
  {
  /* USER CODE BEGIN RTC_MspInit 0 */

  /* USER CODE END RTC_MspInit 0 */

  /** Initializes the peripherals clock
  */
    PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_RTC;
    PeriphClkInitStruct.RTCClockSelection = RCC_RTCCLKSOURCE_LSI;
    if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK)
    {
      Error_Handler();
    }

    /* RTC clock enable */
    __HAL_RCC_RTC_ENABLE();
  /* USER CODE BEGIN RTC_MspInit 1 */

  /* USER CODE END RTC_MspInit 1 */
  }
}

void HAL_RTC_MspDeInit(RTC_HandleTypeDef* rtcHandle)
{

  if(rtcHandle->Instance==RTC)
  {
  /* USER CODE BEGIN RTC_MspDeInit 0 */

  /* USER CODE END RTC_MspDeInit 0 */
    /* Peripheral clock disable */
    __HAL_RCC_RTC_DISABLE();
  /* USER CODE BEGIN RTC_MspDeInit 1 */

  /* USER CODE END RTC_MspDeInit 1 */
  }
}

/* USER CODE BEGIN 1 */
void show_time_date(void)
{
	static char showtime[40];
	static char showdate[40];

	RTC_DateTypeDef rtc_date;
	RTC_TimeTypeDef rtc_time;

	static char *time = showtime;
	static char *date = showdate;

	memset(&rtc_date, 0, sizeof(rtc_date));
	memset(&rtc_time, 0, sizeof(rtc_time));

	HAL_RTC_GetTime(&hrtc, &rtc_time, RTC_FORMAT_BIN);
	HAL_RTC_GetDate(&hrtc, &rtc_date, RTC_FORMAT_BIN);

	char *format;
	format = (rtc_time.TimeFormat == RTC_HOURFORMAT12_AM) ? "AM" : "PM";

	sprintf((char *)showtime, "%s:\t%02d:%02d:%02d [%s]", "\nCurrent Time&Date", rtc_time.Hours, rtc_time.Minutes, rtc_time.Seconds, format);
	xQueueSend(q_print, &time, portMAX_DELAY);

	sprintf((char *)showdate, "\t%02d-%02d-%02d\n", rtc_date.Month, rtc_date.Date, 2000 + rtc_date.Year);
	xQueueSend(q_print, &date, portMAX_DELAY);
}

void rtc_configure_time(RTC_TimeTypeDef *time)
{
	time->TimeFormat = RTC_HOURFORMAT12_AM;

	HAL_RTC_SetTime(&hrtc, time, RTC_FORMAT_BIN);
}

void rtc_configure_date(RTC_DateTypeDef *date)
{
	HAL_RTC_SetDate(&hrtc, date, RTC_FORMAT_BIN);
}

int validate_rtc_information(RTC_TimeTypeDef *time, RTC_DateTypeDef *date)
{
	if (time) {
		if ((time->Hours > 12) || (time->Minutes > 59) || (time->Seconds > 59))
			return 1;
	}

	if (date) {
		if ((date->Date > 31) || (date->WeekDay > 7) || (date->Year > 99) || (date->Month > 12))
			return 1;
	}

	return 0;
}
/* USER CODE END 1 */
