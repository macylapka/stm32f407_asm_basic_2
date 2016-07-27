################### PATH ##########################
BINPATH=~/programs/gcc_arm_none_eabi/gcc-arm-none-eabi-5_4-2016q2/bin
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

