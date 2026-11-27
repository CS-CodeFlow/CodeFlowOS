#![no_std]
#![no_main]

use core::arch::global_asm;
use core::panic::PanicInfo;

global_asm!(include_str!("entry.S"));

// 手动实现 riscv 上的 main 函数（就是手写 _start )
#[unsafe(no_mangle)]
pub extern "C" fn rust_main() -> ! {
    let _result = 2 + 1;

    loop {
        core::hint::spin_loop();
    }
}

// 手动实现 panic 宏（很明显这并不是非常完善）
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {
        core::hint::spin_loop();
    }
}
