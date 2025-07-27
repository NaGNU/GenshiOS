/* linker.ld :: Ruzen42 */
ENTRY(_start)                    
OUTPUT_FORMAT(elf64-x86-64)       

SECTIONS
{
    . = 0x100000;                  

    .text : ALIGN(0x1000)          
    {
        *(.multiboot)           
        *(.text)                 
    }

    .rodata : ALIGN(0x1000)       
    {
        *(.rodata)
    }

    .data : ALIGN(0x1000)          
    {
        *(.data)
    }

    .bss : ALIGN(0x1000)           
    {
        *(.bss)
    }

    /DISCARD/ :
    {
        *(.eh_frame)
        *(.note.GNU-stack)
    }
}
