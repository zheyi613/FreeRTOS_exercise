################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS/croutine.c \
../FreeRTOS/event_groups.c \
../FreeRTOS/list.c \
../FreeRTOS/queue.c \
../FreeRTOS/stream_buffer.c \
../FreeRTOS/tasks.c \
../FreeRTOS/timers.c 

OBJS += \
./FreeRTOS/croutine.o \
./FreeRTOS/event_groups.o \
./FreeRTOS/list.o \
./FreeRTOS/queue.o \
./FreeRTOS/stream_buffer.o \
./FreeRTOS/tasks.o \
./FreeRTOS/timers.o 

C_DEPS += \
./FreeRTOS/croutine.d \
./FreeRTOS/event_groups.d \
./FreeRTOS/list.d \
./FreeRTOS/queue.d \
./FreeRTOS/stream_buffer.d \
./FreeRTOS/tasks.d \
./FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS/%.o FreeRTOS/%.su: ../FreeRTOS/%.c FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Core/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/USB_DEVICE/App" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/CMSIS/Include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/SEGGER" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/OS" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/Config" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS/portable/GCC/ARM_CM4F" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/USB_DEVICE/Target" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS/include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-FreeRTOS

clean-FreeRTOS:
	-$(RM) ./FreeRTOS/croutine.d ./FreeRTOS/croutine.o ./FreeRTOS/croutine.su ./FreeRTOS/event_groups.d ./FreeRTOS/event_groups.o ./FreeRTOS/event_groups.su ./FreeRTOS/list.d ./FreeRTOS/list.o ./FreeRTOS/list.su ./FreeRTOS/queue.d ./FreeRTOS/queue.o ./FreeRTOS/queue.su ./FreeRTOS/stream_buffer.d ./FreeRTOS/stream_buffer.o ./FreeRTOS/stream_buffer.su ./FreeRTOS/tasks.d ./FreeRTOS/tasks.o ./FreeRTOS/tasks.su ./FreeRTOS/timers.d ./FreeRTOS/timers.o ./FreeRTOS/timers.su

.PHONY: clean-FreeRTOS

