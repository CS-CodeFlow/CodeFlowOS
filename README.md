# CodeFlowOS

CodeFlowOS 是一个使用 Rust 编写的 RISC-V 裸机内核实验项目。

## 当前实现

- 目标平台：`riscv64gc-unknown-none-elf`。
- 启动代码初始化 `gp` 和栈指针、清零 BSS，并调用 Rust 内核入口 `rust_main`。
- 链接脚本将内核加载地址设为 `0x80200000`，并预留 64 KiB 启动栈。
- 当前入口和 panic handler 会持续自旋；尚未实现设备驱动或控制台。

## 构建

安装 Rust 目标后构建：

```sh
rustup target add riscv64gc-unknown-none-elf
cargo build
```

`.cargo/config.toml` 已将该目标设为默认构建目标，并配置使用仓库根目录的 `linker.ld`。
