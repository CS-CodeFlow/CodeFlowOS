OUTPUT_ARCH(riscv)
ENTRY(_start)

BASE_ADDRESS = 0x80200000;

SECTIONS {
    . = BASE_ADDRESS;

    .text : {
        KEEP(*(.text.entry))
        *(.text .text.*)
    }

    . = ALIGN(4096);

    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }

    . = ALIGN(4096);

    .data : {
        PROVIDE(__global_pointer$ = . + 0x800);
        *(.data .data.*)
        *(.sdata .sdata.*)
    }

    . = ALIGN(4096);

    .bss (NOLOAD) : {
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
        *(COMMON)
        ebss = .;
    }

    . = ALIGN(16);

    .stack (NOLOAD) : {
        boot_stack_bottom = .;
        . += 64K;
        boot_stack_top = .;
    }
}
