################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.c 

OBJS += \
./SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o 

C_DEPS += \
./SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d 


# Each subdirectory must supply rules for building sources it contributes
SEGGER/OS/%.o SEGGER/OS/%.su: ../SEGGER/OS/%.c SEGGER/OS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Core/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/USB_DEVICE/App" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/CMSIS/Include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/SEGGER" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/OS" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/Config" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS/portable/GCC/ARM_CM4F" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/USB_DEVICE/Target" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-SEGGER-2f-OS

clean-SEGGER-2f-OS:
	-$(RM) ./SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.d ./SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.o ./SEGGER/OS/SEGGER_SYSVIEW_FreeRTOS.su

.PHONY: clean-SEGGER-2f-OS

