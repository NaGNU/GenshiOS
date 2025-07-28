.set MAGIC,    0x1BADB002
.set FLAGS,    (1 << 0 | 1 << 1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.global _start
_start:
    mov $stack_top, %esp
    call kernel_main
    cli
    hlt

.section .bss
.align 16
stack_bottom:
    .skip 4096
stack_top:
