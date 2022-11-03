################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SEGGER/SEGGER/SEGGER_RTT.c \
../SEGGER/SEGGER/SEGGER_RTT_printf.c \
../SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./SEGGER/SEGGER/SEGGER_RTT.o \
./SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./SEGGER/SEGGER/SEGGER_RTT_printf.o \
./SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./SEGGER/SEGGER/SEGGER_RTT.d \
./SEGGER/SEGGER/SEGGER_RTT_printf.d \
./SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
SEGGER/SEGGER/%.o SEGGER/SEGGER/%.su: ../SEGGER/SEGGER/%.c SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS/include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Core/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/USB_DEVICE/App" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/CMSIS/Include" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/SEGGER" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/OS" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/Config" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS/portable/GCC/ARM_CM4F" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/FreeRTOS" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/USB_DEVICE/Target" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
SEGGER/SEGGER/%.o: ../SEGGER/SEGGER/%.S SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"E:/stm32/STM32IDE_FreeRTOS_workspace/ex01_using_SEGGER_trace/SEGGER/Config" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-SEGGER-2f-SEGGER

clean-SEGGER-2f-SEGGER:
	-$(RM) ./SEGGER/SEGGER/SEGGER_RTT.d ./SEGGER/SEGGER/SEGGER_RTT.o ./SEGGER/SEGGER/SEGGER_RTT.su ./SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./SEGGER/SEGGER/SEGGER_RTT_printf.d ./SEGGER/SEGGER/SEGGER_RTT_printf.o ./SEGGER/SEGGER/SEGGER_RTT_printf.su ./SEGGER/SEGGER/SEGGER_SYSVIEW.d ./SEGGER/SEGGER/SEGGER_SYSVIEW.o ./SEGGER/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-SEGGER-2f-SEGGER

