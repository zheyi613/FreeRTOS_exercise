################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.c 

OBJS += \
./SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.o 

C_DEPS += \
./SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
SEGGER/Config/%.o SEGGER/Config/%.su: ../SEGGER/Config/%.c SEGGER/Config/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Core/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/USB_DEVICE/App" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/USB_DEVICE/Target" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/CMSIS/Include" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/FreeRTOS" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/FreeRTOS/include" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/SEGGER/Config" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/SEGGER/OS" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-SEGGER-2f-Config

clean-SEGGER-2f-Config:
	-$(RM) ./SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.d ./SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.o ./SEGGER/Config/SEGGER_SYSVIEW_Config_FreeRTOS.su

.PHONY: clean-SEGGER-2f-Config

