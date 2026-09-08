<div align="center">

# Tylina Skill

**让 Agent 和你，在同一个工作区里编写文档。**

[Tylina 官网](https://tylina.github.io/) · [Web 编辑器](https://tylina.github.io/app/) · [English](README.md)

</div>

写论文、优化简历、制作学术 Slides，或把笔记整理成完整报告。
Tylina 为 Agent 提供真实 Typst 编译、页面图像、PDF/PNG/SVG 导出和当前编辑器上下文。
统一使用一个 `tylina` 命令入口，按任务加载领域 Skills。

> **开发预览。** 本仓库面向下一版支持统一命令的 Tylina SDK。
> CLI 和 MCP stdio 桥接已在本地测试，npm 已发布的 SDK 0.4.2 尚不包含这些能力。
> 共同编辑需要匹配的编辑器/DSH 构建及其授权连接；新版入口尚未发布到 DSH bundle。
> 独立磁盘工作区也已通过匹配 native 运行时的本地验证。

真实 Codex 已在 macOS arm64 通过单一 MCP 入口完成报告编辑和表格优化，
包括按需读取表格指导、检查页面图像及导出 PDF/PNG/SVG。
通过 Electron 已授权连接，Codex 也已读取移焦后的 Document 实时选区，
仅修改选中范围、检查渲染并保存；用户 Undo/Redo 保留原有输入。
独立可视化连接／配置流程、其它宿主、客户端和平台仍需分别验收。

| 共同编写 | 检查结果 |
| --- | --- |
| 读取用户当前的真实选区 | 通过 Typst/Tinymist 编译 |
| 带版本校验的精确修改 | 查看实际渲染页面 |
| 发现模板和领域 Skills | 导出 PDF、PNG、SVG |
| 操作宿主支持的视图 | 修改进入正常编辑历史 |

## 安装 Skill

使用 [Skills CLI](https://www.skills.sh/docs/cli)：

```sh
npx skills add tylina/tylina-skill
```

也可以把 [`skills/tylina`](skills/tylina/) 复制到你的 Agent 支持的 Skills 目录。
使用通用 Skill 格式，可供 Codex、Claude Code 等编程 Agent 加载，不绑定模型供应商，
也不需要克隆 Tylina 核心仓库。

安装 Skill 只提供指导，不会自动连接编辑器。
请使用已有的 Tylina MCP 连接，或安装预览版提供的、支持统一命令的匹配 `tylina-sdk` 产物。
已发布的 SDK 0.4.2 不能执行下面的命令。

## 连接编辑器

DSH 的 Tylina 集成可以提供当前编辑器的 MCP 连接。
在 Agent 中配置该 HTTP 连接，或通过受保护的进程环境提供
`TYLINA_MCP_URL` 和 `TYLINA_MCP_TOKEN`，启动 SDK 的 stdio 适配器：

```sh
tylina mcp
```

具备终端能力的 Agent 和脚本也能使用同一连接：

```sh
tylina editor.state
tylina help --args '{"command":"file.edit"}'
tylina document.validate
```

真实 token 不应进入 prompt、仓库文件或命令行参数。
Agent 操作的是已连接的编辑器，不会另起一个模型或维护另一份文档。
普通静态 Web 页面本身不会暴露本地 MCP 端点。

## 可以这样使用

独立项目也能通过候选 SDK 执行
`tylina mcp --workspace /path/to/project --main main.typ`，无需打开窗口即可编译和导出。
需要用户的未保存内容或选区时，应连接实际编辑器。
运行时安装和作用域见[连接说明](skills/tylina/references/connection.md)。

> 用 Tylina 润色我选中的段落，保持原意，然后验证文档。

> 把这些笔记做成学术 Slides，先浏览合适的模板，检查渲染效果，再导出 PDF。

> 检查报告的排版，先给我看需要调整的页面，再修改。

入口 Skill 先发现宿主实际提供的能力，再通过 `skill.list` 和 `skill.read`
读取 Tylina 统一维护的写作、Slides、图表等领域指导；本仓库不复制整个领域库或编译器。

SDK 组合调用见[连接说明](skills/tylina/references/connection.md)，
编辑、模板和导出流程见[文档工作流](skills/tylina/references/workflow.md)。

## 开发

本仓库是可独立安装的 Skill 内容，不要求核心源码或编译步骤。
运行 `node --test tests/skill-package.mjs` 检查链接、元数据和内容边界。
真实编辑流程还需要匹配的 SDK、编辑器和运行时验收；内容检查不代表编译、UI 或 Agent 质量已验收。

Skill 内容使用 [MIT 许可](LICENSE)；SDK、编辑器、字体和模板分别遵循各自的许可。
