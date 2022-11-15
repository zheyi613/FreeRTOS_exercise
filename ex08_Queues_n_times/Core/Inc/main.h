/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "rtc.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */
typedef struct {
	uint8_t payload[10];
	uint32_t len;
} command_t;

/* App state */
typedef enum {
	sMainMenu = 0,
	sLedEffect,
	sRtcMenu,
	sRtcTimeConfig,
	sRtcDateConfig,
	sRtcReport,
} state_t;

extern TaskHandle_t handle_menu_task;
extern TaskHandle_t handle_cmd_task;
extern TaskHandle_t handle_print_task;
extern TaskHandle_t handle_led_task;
extern TaskHandle_t handle_rtc_task;

extern QueueHandle_t q_data;
extern QueueHandle_t q_print;

extern TimerHandle_t handle_led_timer[4];

extern state_t curr_state;
/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */
void menu_task(void *param);
void led_task(void *param);
void rtc_task(void *param);
void print_task(void *param);
void cmd_task(void *param);

void led_effect_stop(void);
void led_effect(int n);
void LED_effect1(void);
void LED_effect2(void);
void LED_effect3(void);
void LED_effect4(void);

void show_time_date(void);
void rtc_configure_time(RTC_TimeTypeDef *time);
void rtc_configure_date(RTC_DateTypeDef *date);
int validate_rtc_information(RTC_TimeTypeDef *time, RTC_DateTypeDef *date);
/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define BLUE_LED_Pin GPIO_PIN_13
#define BLUE_LED_GPIO_Port GPIOC
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
