################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/adc.c \
../Core/Src/gpio.c \
../Core/Src/i2c.c \
../Core/Src/main.c \
../Core/Src/spi.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_hal_timebase_tim.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c \
../Core/Src/tim.c 

OBJS += \
./Core/Src/adc.o \
./Core/Src/gpio.o \
./Core/Src/i2c.o \
./Core/Src/main.o \
./Core/Src/spi.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_hal_timebase_tim.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o \
./Core/Src/tim.o 

C_DEPS += \
./Core/Src/adc.d \
./Core/Src/gpio.d \
./Core/Src/i2c.d \
./Core/Src/main.d \
./Core/Src/spi.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_hal_timebase_tim.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d \
./Core/Src/tim.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Core/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/USB_DEVICE/App" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/USB_DEVICE/Target" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/Drivers/CMSIS/Include" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/FreeRTOS" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/FreeRTOS/include" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/SEGGER/Config" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/SEGGER/OS" -I"D:/STM32/FreeRTOS_exercise/ex01_using_SEGGER_trace/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/adc.d ./Core/Src/adc.o ./Core/Src/adc.su ./Core/Src/gpio.d ./Core/Src/gpio.o ./Core/Src/gpio.su ./Core/Src/i2c.d ./Core/Src/i2c.o ./Core/Src/i2c.su ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/spi.d ./Core/Src/spi.o ./Core/Src/spi.su ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.o ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_hal_timebase_tim.d ./Core/Src/stm32f4xx_hal_timebase_tim.o ./Core/Src/stm32f4xx_hal_timebase_tim.su ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.o ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.o ./Core/Src/system_stm32f4xx.su ./Core/Src/tim.d ./Core/Src/tim.o ./Core/Src/tim.su

.PHONY: clean-Core-2f-Src

