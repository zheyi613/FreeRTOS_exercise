/*
 * led_effect.c
 *
 *  Created on: Nov 14, 2022
 *      Author: DCS_LAB
 */

#include "main.h"

void led_effect_stop(void)
{
	for (int i = 0; i < 4; i++)
		xTimerStop(handle_led_timer[i], portMAX_DELAY);
}

void led_effect(int n)
{
	led_effect_stop();
	xTimerStart(handle_led_timer[n - 1], portMAX_DELAY);
}

void turn_off_all_leds(void)
{
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);
}

void turn_on_all_leds(void)
{
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_SET);
}

void turn_on_odd_leds(void)
{
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);
}

void turn_on_even_leds(void)
{
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_SET);
}

void LED_control(uint32_t value)
{
	for (int i = 0; i < 4; i++)
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12 << i, (value >> i) & 0x1);
}

void LED_effect1(void)
{
	static uint32_t flag = 1;

	(flag ^= 1) ? turn_off_all_leds() : turn_on_all_leds();
}

void LED_effect2(void)
{
	static uint32_t flag = 1;

	(flag ^= 1) ? turn_on_even_leds() : turn_on_odd_leds();
}

void LED_effect3(void)
{
	static uint32_t i = 0;

	LED_control(0x1 << (i++ % 4));
}

void LED_effect4(void)
{
	static uint32_t i = 0;

	LED_control(0x8 >> (i++ % 4));
}
