################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c 

OBJS += \
./SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o 

C_DEPS += \
./SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d 


# Each subdirectory must supply rules for building sources it contributes
SEGGER/SEGGER/Syscalls/%.o SEGGER/SEGGER/Syscalls/%.su: ../SEGGER/SEGGER/Syscalls/%.c SEGGER/SEGGER/Syscalls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"E:/stm32/STM32IDE_workspace/qr_uav/FreeRTOS/include" -I"E:/stm32/STM32IDE_workspace/qr_uav/Core/Inc" -I"E:/stm32/STM32IDE_workspace/qr_uav/USB_DEVICE/App" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/STM32F4xx_HAL_Driver/Inc" -I"E:/stm32/STM32IDE_workspace/qr_uav/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/CMSIS/Include" -I"E:/stm32/STM32IDE_workspace/qr_uav/SEGGER/SEGGER" -I"E:/stm32/STM32IDE_workspace/qr_uav/SEGGER/OS" -I"E:/stm32/STM32IDE_workspace/qr_uav/SEGGER/Config" -I"E:/stm32/STM32IDE_workspace/qr_uav/FreeRTOS/portable/GCC/ARM_CM4F" -I"E:/stm32/STM32IDE_workspace/qr_uav/FreeRTOS" -I"E:/stm32/STM32IDE_workspace/qr_uav/USB_DEVICE/Target" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"E:/stm32/STM32IDE_workspace/qr_uav/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-SEGGER-2f-SEGGER-2f-Syscalls

clean-SEGGER-2f-SEGGER-2f-Syscalls:
	-$(RM) ./SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d ./SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o ./SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.su

.PHONY: clean-SEGGER-2f-SEGGER-2f-Syscalls

