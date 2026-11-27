# 参与贡献

感谢你对 CodeFlowOS 的关注。本项目是 RISC-V 裸机内核实验项目，请遵循以下流程。

## 开发环境

```sh
rustup target add riscv64gc-unknown-none-elf
cargo build
```

提交 PR 前请确保 `cargo build` 通过（仓库暂无 CI，构建验证由贡献者在本地完成）。

## 贡献流程

按你是否拥有组织仓库的写权限，选择对应路径：

### 外部贡献者（fork 流程）

1. 在 GitHub 上 fork <https://github.com/CS-CodeFlow/CodeFlowOS>。
2. clone 自己的 fork，并添加上游远程：

   ```sh
   git clone git@github.com:<你的用户名>/CodeFlowOS.git
   cd CodeFlowOS
   git remote add upstream git@github.com:CS-CodeFlow/CodeFlowOS.git
   ```

3. 从上游 main 创建功能分支：

   ```sh
   git fetch upstream
   git switch -c <类型>/<简述> upstream/main
   ```

4. 开发并提交（commit message 约定见下）。
5. 推送到**自己的 fork**：`git push origin <类型>/<简述>`。
6. 创建 PR：`<你的用户名>:<分支>` → `CS-CodeFlow:main`。

### 维护者（组织内分支）

1. 从组织仓库 main 创建功能分支：

   ```sh
   git fetch upstream
   git switch -c <类型>/<简述> upstream/main
   ```

2. 开发并提交。
3. 推送到**组织仓库**：`git push upstream <类型>/<简述>`。
4. 创建同仓库 PR：`<分支>` → `main`。

## 合并策略

三种合并方式均保持开启，由维护者按 PR 情况选择：

| PR 情况 | 合并方式 | 理由 |
|---|---|---|
| 历史含 `fix typo` / `wip` / 反复返工 | **squash** | main 保持每变更一提交，可二分、可整体回滚 |
| 干净的按内容拆分 PR | **rebase merge** | 保留每个提交的完整信息，线性历史 |
| 长期特性分支 / release 集成 | **merge commit** | 保留分支拓扑与合并点 |

合并后源分支自动删除（GitHub 原生设置；fork PR 在贡献者勾选「允许维护者修改」时同样生效）。

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
- 当前为单人维护，PR 不要求额外 review；加入协作者后将启用 review 与 CI 检查（`cargo build`），并补充 CODEOWNERS。

## 问题反馈

使用组织仓库的 Issues：<https://github.com/CS-CodeFlow/CodeFlowOS/issues>
