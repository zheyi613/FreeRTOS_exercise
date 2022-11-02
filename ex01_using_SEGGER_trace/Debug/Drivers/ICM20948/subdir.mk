################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/ICM20948/DataConverter.c \
../Drivers/ICM20948/Icm20948Augmented.c \
../Drivers/ICM20948/Icm20948AuxCompassAkm.c \
../Drivers/ICM20948/Icm20948AuxTransport.c \
../Drivers/ICM20948/Icm20948DataBaseControl.c \
../Drivers/ICM20948/Icm20948DataBaseDriver.c \
../Drivers/ICM20948/Icm20948DataConverter.c \
../Drivers/ICM20948/Icm20948Dmp3Driver.c \
../Drivers/ICM20948/Icm20948LoadFirmware.c \
../Drivers/ICM20948/Icm20948MPUFifoControl.c \
../Drivers/ICM20948/Icm20948SelfTest.c \
../Drivers/ICM20948/Icm20948Setup.c \
../Drivers/ICM20948/Icm20948Transport.c 

OBJS += \
./Drivers/ICM20948/DataConverter.o \
./Drivers/ICM20948/Icm20948Augmented.o \
./Drivers/ICM20948/Icm20948AuxCompassAkm.o \
./Drivers/ICM20948/Icm20948AuxTransport.o \
./Drivers/ICM20948/Icm20948DataBaseControl.o \
./Drivers/ICM20948/Icm20948DataBaseDriver.o \
./Drivers/ICM20948/Icm20948DataConverter.o \
./Drivers/ICM20948/Icm20948Dmp3Driver.o \
./Drivers/ICM20948/Icm20948LoadFirmware.o \
./Drivers/ICM20948/Icm20948MPUFifoControl.o \
./Drivers/ICM20948/Icm20948SelfTest.o \
./Drivers/ICM20948/Icm20948Setup.o \
./Drivers/ICM20948/Icm20948Transport.o 

C_DEPS += \
./Drivers/ICM20948/DataConverter.d \
./Drivers/ICM20948/Icm20948Augmented.d \
./Drivers/ICM20948/Icm20948AuxCompassAkm.d \
./Drivers/ICM20948/Icm20948AuxTransport.d \
./Drivers/ICM20948/Icm20948DataBaseControl.d \
./Drivers/ICM20948/Icm20948DataBaseDriver.d \
./Drivers/ICM20948/Icm20948DataConverter.d \
./Drivers/ICM20948/Icm20948Dmp3Driver.d \
./Drivers/ICM20948/Icm20948LoadFirmware.d \
./Drivers/ICM20948/Icm20948MPUFifoControl.d \
./Drivers/ICM20948/Icm20948SelfTest.d \
./Drivers/ICM20948/Icm20948Setup.d \
./Drivers/ICM20948/Icm20948Transport.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/ICM20948/%.o Drivers/ICM20948/%.su: ../Drivers/ICM20948/%.c Drivers/ICM20948/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xC -c -I"E:/stm32/STM32IDE_workspace/qr_uav/FreeRTOS/include" -I"E:/stm32/STM32IDE_workspace/qr_uav/Core/Inc" -I"E:/stm32/STM32IDE_workspace/qr_uav/USB_DEVICE/App" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/STM32F4xx_HAL_Driver/Inc" -I"E:/stm32/STM32IDE_workspace/qr_uav/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/CMSIS/Include" -I"E:/stm32/STM32IDE_workspace/qr_uav/SEGGER/SEGGER" -I"E:/stm32/STM32IDE_workspace/qr_uav/SEGGER/OS" -I"E:/stm32/STM32IDE_workspace/qr_uav/SEGGER/Config" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/ICM20948" -I"E:/stm32/STM32IDE_workspace/qr_uav/FreeRTOS/portable/GCC/ARM_CM4F" -I"E:/stm32/STM32IDE_workspace/qr_uav/FreeRTOS" -I"E:/stm32/STM32IDE_workspace/qr_uav/USB_DEVICE/Target" -I"E:/stm32/STM32IDE_workspace/qr_uav/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"E:/stm32/STM32IDE_workspace/qr_uav/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-ICM20948

clean-Drivers-2f-ICM20948:
	-$(RM) ./Drivers/ICM20948/DataConverter.d ./Drivers/ICM20948/DataConverter.o ./Drivers/ICM20948/DataConverter.su ./Drivers/ICM20948/Icm20948Augmented.d ./Drivers/ICM20948/Icm20948Augmented.o ./Drivers/ICM20948/Icm20948Augmented.su ./Drivers/ICM20948/Icm20948AuxCompassAkm.d ./Drivers/ICM20948/Icm20948AuxCompassAkm.o ./Drivers/ICM20948/Icm20948AuxCompassAkm.su ./Drivers/ICM20948/Icm20948AuxTransport.d ./Drivers/ICM20948/Icm20948AuxTransport.o ./Drivers/ICM20948/Icm20948AuxTransport.su ./Drivers/ICM20948/Icm20948DataBaseControl.d ./Drivers/ICM20948/Icm20948DataBaseControl.o ./Drivers/ICM20948/Icm20948DataBaseControl.su ./Drivers/ICM20948/Icm20948DataBaseDriver.d ./Drivers/ICM20948/Icm20948DataBaseDriver.o ./Drivers/ICM20948/Icm20948DataBaseDriver.su ./Drivers/ICM20948/Icm20948DataConverter.d ./Drivers/ICM20948/Icm20948DataConverter.o ./Drivers/ICM20948/Icm20948DataConverter.su ./Drivers/ICM20948/Icm20948Dmp3Driver.d ./Drivers/ICM20948/Icm20948Dmp3Driver.o ./Drivers/ICM20948/Icm20948Dmp3Driver.su ./Drivers/ICM20948/Icm20948LoadFirmware.d ./Drivers/ICM20948/Icm20948LoadFirmware.o ./Drivers/ICM20948/Icm20948LoadFirmware.su ./Drivers/ICM20948/Icm20948MPUFifoControl.d ./Drivers/ICM20948/Icm20948MPUFifoControl.o ./Drivers/ICM20948/Icm20948MPUFifoControl.su ./Drivers/ICM20948/Icm20948SelfTest.d ./Drivers/ICM20948/Icm20948SelfTest.o ./Drivers/ICM20948/Icm20948SelfTest.su ./Drivers/ICM20948/Icm20948Setup.d ./Drivers/ICM20948/Icm20948Setup.o ./Drivers/ICM20948/Icm20948Setup.su ./Drivers/ICM20948/Icm20948Transport.d ./Drivers/ICM20948/Icm20948Transport.o ./Drivers/ICM20948/Icm20948Transport.su

.PHONY: clean-Drivers-2f-ICM20948

