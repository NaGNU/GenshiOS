# Makefile :: Ruzen42
TARGET = kernel.bin                   
SRCS_ASM = src/kernel/boot.s         
SRCS_D = src/kernel/main.d          
LDSCRIPT = src/linker.ld           

GDC = gdc                  
LD = ld                   

all: $(TARGET)

$(TARGET): $(SRCS_ASM) $(SRCS_D) $(LDSCRIPT)
	$(GDC) -c $(SRCS_ASM) -o boot.o -ffreestanding -mno-red-zone
	$(GDC) -c $(SRCS_D) -o main.o 
	$(LD) -n -T $(LDSCRIPT) boot.o main.o -o $(TARGET)

clean:
	rm -f *.o $(TARGET)

run: $(TARGET)
	qemu-system-x86_64 -kernel $(TARGET) -serial stdio

debug: $(TARGET)
	qemu-system-x86_64 -kernel $(TARGET) -s -S -serial stdio
