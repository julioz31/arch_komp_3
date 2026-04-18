SDK_PREFIX?=arm-none-eabi-
CC = $(SDK_PREFIX)gcc
OBJCOPY = $(SDK_PREFIX)objcopy
QEMU = /home/kuzmenkoioz31/opt/xPacks/qemu-arm/xpack-qemu-arm-7.2.0-1/bin/qemu-system-gnuarmeclipse

TARGET = firmware
CPU_CC = cortex-m4

all: $(TARGET).bin

$(TARGET).bin: $(TARGET).elf
	$(OBJCOPY) -O binary -F elf32-littlearm $(TARGET).elf $(TARGET).bin

$(TARGET).elf: start.o lab1.o
	$(CC) start.o lab1.o -mcpu=$(CPU_CC) -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./lscript.ld -o $(TARGET).elf

start.o: start.S
	$(CC) -x assembler-with-cpp -c -O0 -g3 -mcpu=$(CPU_CC) -mthumb -Wall start.S -o start.o

lab1.o: lab1.S
	$(CC) -x assembler-with-cpp -c -O0 -g3 -mcpu=$(CPU_CC) -mthumb -Wall lab1.S -o lab1.o

qemu:
	$(QEMU) --board STM32F4-Discovery --mcu STM32F407VG -d unimp,guest_errors --image $(TARGET).bin -s -S

clean:
	rm -f *.o *.elf *.bin
