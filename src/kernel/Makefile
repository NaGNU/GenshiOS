CC=gcc
AC=as

all:
	$(CC) -m64 -ffreestanding -nostdlib -c kernel.c -o kernel.o
	$(AC) --64 boot.s -o boot.o
	ld -n -o kernel.bin -T linker.ld boot.o kernel.o
