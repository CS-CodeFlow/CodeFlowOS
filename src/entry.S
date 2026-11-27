.section .text.entry
.globl _start

_start:
    # 初始化全局指针，防止链接松弛优化依赖尚未初始化的gp
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # 初始化栈指针，为接下来 rust 调用腾出栈空间
    la sp, boot_stack_top

    # 清零 bss (block started by symbol)
    la t0, sbss # start of bss?
    la t1, ebss # end of bss? 不包含此地址

.Lclear_bss:
    # 从 t0 的位置开始，到 t1 的位置结束，结束之后从标签 bss_done 开始
    bgeu t0, t1, .Lbss_done
    # 清零相应位置 1 字节的内存
    sb zero, 0(t0)
    # t0 地址加一以清零下个地址的内存
    addi t0, t0, 1
    # 返回 1 这个标志的位置（典型 goto 行为）
    j .Lclear_bss

.Lbss_done:
    # 基础运行环境初始化完成，开始进入 rust 内核入口
    call rust_main

.Lhalt:
    # 如果 rust 入口函数返回，则进入无限循环，防止执行未知指令
    j .Lhalt
