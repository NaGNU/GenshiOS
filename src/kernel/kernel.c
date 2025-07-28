#include <stdint.h>

volatile uint16_t *vga_buffer = (uint16_t *)0xB8000;
const int VGA_COLS = 80;
const int VGA_ROWS = 25;

enum vga_color {
    VGA_COLOR_BLACK = 0,
    VGA_COLOR_WHITE = 15,
};

void clear_screen() {
    for (int i = 0; i < VGA_COLS * VGA_ROWS; i++) {
        vga_buffer[i] = (uint16_t)((VGA_COLOR_BLACK << 8) | ' ');
    }
}

void print_str(const char *str, enum vga_color color) {
    static int cursor_pos = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        if (cursor_pos >= VGA_COLS * VGA_ROWS) {
            clear_screen();
            cursor_pos = 0;
        }
        vga_buffer[cursor_pos++] = (uint16_t)((color << 8) | str[i]);
    }
}

void kernel_main() {
    clear_screen();
    print_str("initializing...", VGA_COLOR_WHITE);

    while (1) {} // HLT 
}
