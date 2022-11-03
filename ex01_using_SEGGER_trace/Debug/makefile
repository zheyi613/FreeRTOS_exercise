################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include USB_DEVICE/Target/subdir.mk
-include USB_DEVICE/App/subdir.mk
-include SEGGER/SEGGER/Syscalls/subdir.mk
-include SEGGER/SEGGER/subdir.mk
-include SEGGER/OS/subdir.mk
-include SEGGER/Config/subdir.mk
-include Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
-include Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/subdir.mk
-include FreeRTOS/portable/MemMang/subdir.mk
-include FreeRTOS/portable/GCC/ARM_CM4F/subdir.mk
-include FreeRTOS/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := ex01_using_SEGGER_trace
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
ex01_using_SEGGER_trace.elf \

MAP_FILES += \
ex01_using_SEGGER_trace.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
ex01_using_SEGGER_trace.list \


# All Target
all: main-build

# Main-build Target
main-build: ex01_using_SEGGER_trace.elf secondary-outputs

# Tool invocations
ex01_using_SEGGER_trace.elf ex01_using_SEGGER_trace.map: $(OBJS) $(USER_OBJS) E:\stm32\STM32IDE_FreeRTOS_workspace\ex01_using_SEGGER_trace\STM32F401CCUX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "ex01_using_SEGGER_trace.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"E:\stm32\STM32IDE_FreeRTOS_workspace\ex01_using_SEGGER_trace\STM32F401CCUX_FLASH.ld" --specs=nosys.specs -Wl,-Map="ex01_using_SEGGER_trace.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

ex01_using_SEGGER_trace.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "ex01_using_SEGGER_trace.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout ex01_using_SEGGER_trace.elf ex01_using_SEGGER_trace.list ex01_using_SEGGER_trace.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
