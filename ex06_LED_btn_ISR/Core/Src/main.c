/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
#include "main.h"
#include "adc.h"
#include "i2c.h"
#include "spi.h"
#include "tim.h"
#include "usb_device.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "dwt_delay.h"
#include "FreeRTOS.h"
#include "task.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
TaskHandle_t led1_task_handle;
TaskHandle_t led2_task_handle;
TaskHandle_t led3_task_handle;
TaskHandle_t volatile next_task_handle;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
static void led1_handler(void *parameters);
static void led2_handler(void *parameters);
static void led3_handler(void *parameters);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
  BaseType_t status;
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  MX_I2C1_Init();
  MX_SPI1_Init();
  MX_TIM2_Init();
  MX_USB_DEVICE_Init();
  /* USER CODE BEGIN 2 */
  SEGGER_UART_init(500000);
  DWT_Init();
  SEGGER_SYSVIEW_Conf();

  status = xTaskCreate(led1_handler, "LED1_task", 200, NULL, 3, &led1_task_handle);
  configASSERT(status == pdPASS);

  status = xTaskCreate(led2_handler, "LED2_task", 200, NULL, 2, &led2_task_handle);
  configASSERT(status == pdPASS);

  status = xTaskCreate(led3_handler, "LED3_task", 200, NULL, 1, &led3_task_handle);
  configASSERT(status == pdPASS);

  next_task_handle = led1_task_handle;

  vTaskStartScheduler();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
void button_interrupt_handler(void)
{
	BaseType_t pxHigherPriorityTaskWoken = pdFALSE;

	traceISR_ENTER();
	xTaskNotifyFromISR(next_task_handle, 0, eNoAction, &pxHigherPriorityTaskWoken);
	portYIELD_FROM_ISR(pxHigherPriorityTaskWoken);
	traceISR_EXIT();
}

static void led1_handler(void *parameters)
{
	BaseType_t status;

	while(1) {
		SEGGER_SYSVIEW_PrintfTarget("Toggling LED1");
		HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_12);
		status = xTaskNotifyWait(0, 0, NULL, pdMS_TO_TICKS(1000));
		if (status == pdTRUE) {
			portENTER_CRITICAL();
			next_task_handle = led2_task_handle;
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);
			SEGGER_SYSVIEW_PrintfTarget("Delete LED1 task");
			portEXIT_CRITICAL();
			vTaskDelete(NULL); // Self delete
		}
	}
}

static void led2_handler(void *parameters)
{
	BaseType_t status;

	while(1) {
		SEGGER_SYSVIEW_PrintfTarget("Toggling LED2");
		HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_13);
		status = xTaskNotifyWait(0, 0, NULL, pdMS_TO_TICKS(800));
		if (status == pdTRUE) {
			portENTER_CRITICAL();
			next_task_handle = led3_task_handle;
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
			SEGGER_SYSVIEW_PrintfTarget("Delete LED2 task");
			portEXIT_CRITICAL();
			vTaskDelete(NULL); // Self delete
		}
	}
}

static void led3_handler(void *parameters)
{
	BaseType_t status;

	while(1) {
		SEGGER_SYSVIEW_PrintfTarget("Toggling LED3");
		HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_14);
		status = xTaskNotifyWait(0, 0, NULL, pdMS_TO_TICKS(400));
		if (status == pdTRUE) {
			portENTER_CRITICAL();
			next_task_handle = NULL;
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
			SEGGER_SYSVIEW_PrintfTarget("Delete LED3 task");
			portEXIT_CRITICAL();
			vTaskDelete(NULL); // Self delete
		}
	}
}
/* USER CODE END 4 */

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM1 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM1) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
