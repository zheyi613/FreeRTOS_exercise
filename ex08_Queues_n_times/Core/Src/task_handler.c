/*
 * task_handler.c
 *
 *  Created on: Nov 14, 2022
 *      Author: DCS_LAB
 */


#include "main.h"
#include "usart.h"

int extract_command(command_t *cmd);
void process_command(command_t *cmd);

const char *msg_inv = "Invalid option !!\n";

void menu_task(void *param)
{
	uint32_t cmd_addr;
	command_t *cmd;
	uint32_t option;
	const char *msg_menu = "======================\n"
						   "|         Menu       |\n"
						   "======================\n"
						   "LED effect    -----> 0\n"
						   "Date and time -----> 1\n"
						   "Exit          -----> 2\n"
						   "Enter your choice here : ";
	while (1) {
		xQueueSend(q_print, &msg_menu, portMAX_DELAY);
		xTaskNotifyWait(0, 0, &cmd_addr, portMAX_DELAY);
		cmd = (command_t *)cmd_addr;

		if (cmd->len == 1) {
			option = cmd->payload[0] - 48;
			switch (option) {
			case 0:
				curr_state = sLedEffect;
				xTaskNotify(handle_led_task, 0, eNoAction);
				break;
			case 1:
				curr_state = sRtcMenu;
				xTaskNotify(handle_rtc_task, 0, eNoAction);
				break;
			case 2:
				break;
			default:
				xQueueSend(q_print, &msg_inv, portMAX_DELAY);
				continue;
			}
		} else {
			xQueueSend(q_print, &msg_inv, portMAX_DELAY);
			continue;
		}

		xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);
	}
}

void led_task(void *param)
{
	uint32_t cmd_addr;
	command_t *cmd;
	const char *msg_led = "======================\n"
			   	   	      "|      LED Effect    |\n"
			   	   	      "======================\n"
						  "(none, e1, e2, e3, e4)\n"
						  "Enter your choice here : ";
	while (1) {
		xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);
		xQueueSend(q_print, &msg_led, portMAX_DELAY);
		xTaskNotifyWait(0, 0, &cmd_addr, portMAX_DELAY);
		cmd = (command_t *)cmd_addr;

		if (cmd->len <= 4) {
			if (!strcmp((char*)cmd->payload, "none"))
				led_effect_stop();
			else if (!strcmp((char*)cmd->payload, "e1"))
				led_effect(1);
			else if (!strcmp((char*)cmd->payload, "e2"))
				led_effect(2);
			else if (!strcmp((char*)cmd->payload, "e3"))
				led_effect(3);
			else if (!strcmp((char*)cmd->payload, "e4"))
				led_effect(4);
			else
				xQueueSend(q_print, &msg_inv, portMAX_DELAY);
		} else {
			xQueueSend(q_print, &msg_inv, portMAX_DELAY);
		}

		curr_state = sMainMenu;

		xTaskNotify(handle_menu_task, 0, eNoAction);
	}
}

uint8_t getnumber(uint8_t *p, int len)
{
	uint8_t value;

	if (len > 1)
		value = ((p[0] - 48) * 10) + p[1] - 48;
	else
		value = p[0] - 48;

	return value;
}

void rtc_task(void *param)
{
	const char *msg_rtc1 = "======================\n"
						   "|         RTC        |\n"
						   "======================\n";

	const char *msg_rtc2 = "Configure Time   --> 0\n"
						   "Configure Date   --> 1\n"
						   "Enable reporting --> 2\n"
						   "Exit             --> 3\n"
						   "Enter your choice here: ";

	const char *msg_rtc_hh = "Enter hour(1-12):";
	const char *msg_rtc_mm = "Enter minutes(0-59):";
	const char *msg_rtc_ss = "Enter seconds(0-59):";

	const char *msg_rtc_dd = "Enter date(1-31):";
	const char *msg_rtc_mo = "Enter month(1-12):";
	const char *msg_rtc_dow = "Enter day(1-7, Sun = 1):";
	const char *msg_rtc_yr = "Enter year(0-99):";

	const char *msg_conf = "Configuration successful\n";
	const char *msg_rtc_report = "Enable time&date reporting(y/n):";

	uint32_t cmd_addr;
	command_t *cmd;

	static int rtc_state = 0;
	int menu_code;

	RTC_TimeTypeDef time;
	RTC_DateTypeDef date;

#define HH_CONFIG	0
#define MM_CONFIG	1
#define SS_CONFIG	2

#define DATE_CONFIG		0
#define MONTH_CONFIG	1
#define YEAR_CONFIG		2
#define DAY_CONFIG		3

	while (1) {
		xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);

		xQueueSend(q_print, &msg_rtc1, portMAX_DELAY);
		show_time_date();
		xQueueSend(q_print, &msg_rtc2, portMAX_DELAY);

		while (curr_state != sMainMenu) {
			xTaskNotifyWait(0, 0, &cmd_addr, portMAX_DELAY);
			cmd = (command_t *)cmd_addr;

			switch (curr_state) {
			case sRtcMenu:
				if (cmd->len == 1) {
					menu_code = cmd->payload[0] - 48;

					switch (menu_code) {
					case 0:
						curr_state = sRtcTimeConfig;
						xQueueSend(q_print, &msg_rtc_hh, portMAX_DELAY);
						break;
					case 1:
						curr_state = sRtcDateConfig;
						xQueueSend(q_print, &msg_rtc_dd, portMAX_DELAY);
						break;
					case 2:
						curr_state = sRtcReport;
						xQueueSend(q_print, &msg_rtc_report, portMAX_DELAY);
						break;
					case 3:
						curr_state = sMainMenu;
						break;
					default:
						curr_state = sMainMenu;
						xQueueSend(q_print, &msg_inv, portMAX_DELAY);
					}
				} else {
					curr_state = sMainMenu;
					xQueueSend(q_print, &msg_inv, portMAX_DELAY);
				}
				break;
			case sRtcTimeConfig:
				switch (rtc_state) {
				case HH_CONFIG:
					time.Hours = getnumber(cmd->payload, cmd->len) - 1;
					rtc_state = MM_CONFIG;
					xQueueSend(q_print, &msg_rtc_mm, portMAX_DELAY);
					break;
				case MM_CONFIG:
					time.Minutes = getnumber(cmd->payload, cmd->len);
					rtc_state = SS_CONFIG;
					xQueueSend(q_print, &msg_rtc_ss, portMAX_DELAY);
					break;
				case SS_CONFIG:
					time.Seconds = getnumber(cmd->payload, cmd->len);
					if (!validate_rtc_information(&time, NULL)) {
						rtc_configure_time(&time);
						xQueueSend(q_print, &msg_conf, portMAX_DELAY);
						show_time_date();
					} else {
						xQueueSend(q_print, &msg_inv, portMAX_DELAY);
					}

					curr_state = sMainMenu;
					rtc_state = 0;
					break;
				}
				break;
			case sRtcDateConfig:
				switch (rtc_state) {
				case DATE_CONFIG:
					date.Date = getnumber(cmd->payload, cmd->len);
					rtc_state = MONTH_CONFIG;
					xQueueSend(q_print, &msg_rtc_mo, portMAX_DELAY);
					break;
				case MONTH_CONFIG:
					date.Month = getnumber(cmd->payload, cmd->len);
					rtc_state = DAY_CONFIG;
					xQueueSend(q_print, &msg_rtc_dow, portMAX_DELAY);
					break;
				case DAY_CONFIG:
					date.WeekDay = getnumber(cmd->payload, cmd->len);
					rtc_state = YEAR_CONFIG;
					xQueueSend(q_print, &msg_rtc_yr, portMAX_DELAY);
					break;
				case YEAR_CONFIG:
					date.Year = getnumber(cmd->payload, cmd->len);

					if (!validate_rtc_information(NULL, &date)) {
						rtc_configure_date(&date);
						xQueueSend(q_print, &msg_conf, portMAX_DELAY);
						show_time_date();
					} else {
						xQueueSend(q_print, &msg_conf, portMAX_DELAY);
					}

					curr_state = sMainMenu;
					rtc_state = 0;
					break;
				}
				break;
			case sRtcReport:
				if (cmd->len == 1) {
					if (cmd->payload[0] == 'y') {
						if (xTimerIsTimerActive(rtc_timer) == pdFALSE)
							xTimerStart(rtc_timer, portMAX_DELAY);
					} else if (cmd->payload[0] == 'n') {
						xTimerStop(rtc_timer, portMAX_DELAY);
					} else {
						xQueueSend(q_print, &msg_inv, portMAX_DELAY);
					}
				} else {
					xQueueSend(q_print, &msg_inv, portMAX_DELAY);
				}
				curr_state = sMainMenu;
				break;
			default:
				xQueueSend(q_print, &msg_inv, portMAX_DELAY);
				curr_state = sMainMenu;
				rtc_state = 0;
			}
		}

		xTaskNotify(handle_menu_task, 0, eNoAction);
	}
}

void print_task(void *param)
{
	uint8_t *msg;

	while (1) {
		xQueueReceive(q_print, &msg, portMAX_DELAY);
		HAL_UART_Transmit(&huart2, msg, strlen((char *)msg), HAL_MAX_DELAY);
	}
}

void cmd_task(void *param)
{
	BaseType_t ret;
	command_t cmd;

	while (1) {
		ret = xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);
		if (ret == pdTRUE)
			process_command(&cmd);
	}
}

void process_command(command_t *cmd)
{
	extract_command(cmd);

	switch(curr_state) {
	case sMainMenu:
		xTaskNotify(handle_menu_task, (uint32_t)cmd, eSetValueWithOverwrite);
		break;
	case sLedEffect:
		xTaskNotify(handle_led_task, (uint32_t)cmd, eSetValueWithOverwrite);
		break;
	case sRtcMenu:
	case sRtcTimeConfig:
	case sRtcDateConfig:
	case sRtcReport:
		xTaskNotify(handle_rtc_task, (uint32_t)cmd, eSetValueWithOverwrite);
		break;
	}
}

int extract_command(command_t *cmd)
{
	uint8_t item;
	BaseType_t status;

	status = uxQueueMessagesWaiting(q_data);
	if (!status)
		return -1;

	uint8_t i = 0;

	do {
		status = xQueueReceive(q_data, &item, 0);
		if (status == pdTRUE)
			cmd->payload[i++] = item;
	} while (item != '\n');

	cmd->payload[i - 1] = '\0';
	cmd->len = i - 1;

	return 0;
}
