################### PATH ##########################
BINPATH=~/programs/gcc-arm-none-eabi/arm_none_eabi_4_9_2015q3/gcc-arm-none-eabi-4_9-2015q3/bin
AS=$(BINPATH)/arm-none-eabi-gcc
OBJCOPY=$(BINPATH)/arm-none-eabi-objcopy
BUILD=build
LDSCRIPTS=ldscripts

################## OPTIONS ########################
ASFLAGS   := -Wall -Wextra -g
LDFLAGS   := -nostdlib -mcpu=cortex-m4 -mthumb -L$(LDSCRIPTS) -Tbasic.ld 
PROJ_NAME := asm_sample

################ BUILD FILES ######################
SRCS = src/main.S 

$(BUILD)/$(PROJ_NAME).elf: $(SRCS)
	$(AS) $(ASFLAGS) $^ -o $@ $(LDFLAGS)
	$(OBJCOPY) -O binary $(BUILD)/$(PROJ_NAME).elf $(BUILD)/$(PROJ_NAME).bin

clean:
	rm -f $(BUILD)/$(PROJ_NAME).elf
	rm -f $(BUILD)/$(PROJ_NAME).bin

