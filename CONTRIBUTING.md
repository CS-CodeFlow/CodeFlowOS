# 参与贡献

感谢你对 CodeFlowOS 的关注。本项目是 RISC-V 裸机内核实验项目，请遵循以下流程。

## 开发环境

```sh
rustup target add riscv64gc-unknown-none-elf
cargo build
```

提交 PR 前请确保 `cargo build` 通过（仓库暂无 CI，构建验证由贡献者在本地完成）。

## 分支与提交流程

1. 从组织仓库 main 创建功能分支：

   ```sh
   git fetch upstream
   git switch -c <类型>/<简述> upstream/main
   ```

2. 开发并提交（commit message 约定见下）。
3. 将分支推送到**组织仓库** `CS-CodeFlow/CodeFlowOS`（不是个人 fork）：

   ```sh
   git push upstream <类型>/<简述>
   ```

4. 创建 PR：`<你的分支>` → `main`。
5. 满足 main 的保护规则后由维护者合并；合并采用 **merge commit**（创建合并提交，功能分支的提交原样进入 main）。
6. 合并后源分支自动删除（GitHub 原生设置）。

### 分支命名

| 前缀 | 用途 |
|---|---|
| `feat/` | 新功能 |
| `fix/` | 缺陷修复 |
| `docs/` | 文档 |
| `chore/` | 构建、依赖等杂项 |
| `ci/` | CI / 自动化配置 |

### Commit message

采用 Conventional Commits：`<type>: <简述>`，例如 `feat: add RISC-V kernel boot flow`。
一个提交只做一件事；不要把「错误版本」和「修正版本」分别留在历史里——提交前自行整理（squash / amend）。

## main 分支保护规则

- 禁止直接 push、force push、删除 main。
- 所有变更必须经 PR 进入 main。
- 当前为单人维护，PR 不要求额外 review；加入协作者后将启用 review 与 CI 检查（`cargo build`）。

## 问题反馈

使用组织仓库的 Issues：<https://github.com/CS-CodeFlow/CodeFlowOS/issues>
