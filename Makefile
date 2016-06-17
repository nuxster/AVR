DEVICE     = attiny85
CLOCK      = 8000000
PROGRAMMER = usbasp
PORT	   = /dev/usbasp
BAUD       = 19200
FILENAME   = main
COMPILE    = avr-gcc -Wall -Os -DF_CPU=$(CLOCK) -mmcu=$(DEVICE)

all: usb clean build upload

usb:
	ls /dev/usbasp*
	
build:
	$(COMPILE) -c $(FILENAME).c -o $(FILENAME).o
	$(COMPILE) -o $(FILENAME).elf $(FILENAME).o
	avr-objcopy -j .text -j .data -O ihex $(FILENAME).elf $(FILENAME).hex
	avr-size --format=avr --mcu=$(DEVICE) $(FILENAME).elf

upload:
	avrdude -v -p $(DEVICE) -c $(PROGRAMMER) -P $(PORT) -b $(BAUD) -U flash:w:$(FILENAME).hex:i 

clean:
#	rm main.o
#	rm main.elf
#	rm main.hex
