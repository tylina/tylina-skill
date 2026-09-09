<div align="center">

# Tylina Skill

**让 Agent 和你，在同一个工作区里编写文档。**

[Tylina 官网](https://tylina.github.io/) · [Web 编辑器](https://tylina.github.io/app/) · [演示](https://tylina.github.io/demo/) · [English](README.md)

</div>

把笔记变成学术 Slides，润色简历、设计海报，或完成论文、图表与报告。
Agent 可以读取你的选区，精确修改 Typst 源码，检查实际排版，再导出成品。
统一使用一个 **`tylina`** 工具，按任务加载写作与设计 Skills。

[![在 Tylina 中编辑 Typst 文档](https://tylina.github.io/demo.gif)](https://tylina.github.io/demo/)

| 共同编写 | 检查与交付 |
| --- | --- |
| 读取编辑器当前的真实选区 | 通过 Typst/Tinymist 编译 |
| 带版本校验的精确修改 | 查看实际渲染页面 |
| 浏览模板和领域 Skills | 导出 PDF、PNG、SVG |
| 修改进入正常编辑历史 | 在同一个工作区继续写作 |

## 开始使用

为你的编程 Agent 安装 Skill：

```sh
npx skills add tylina/tylina-skill
```

也可以把 [`skills/tylina`](skills/tylina/) 复制到它支持的 Skills 目录，不需要克隆核心仓库。
Skill 提供使用指导；实际工具由编辑器连接或本地运行时提供。

**已经有 Tylina MCP 连接？** 在 Agent 中启用它，就可以开始写作。
否则安装 SDK 的稳定版命令入口：

```sh
npm install -g tylina-sdk
```

更新时执行同一条命令。发布通道见 [npm 上的 SDK](https://www.npmjs.com/package/tylina-sdk?activeTab=versions)，
运行环境要求见[连接说明](skills/tylina/references/connection.md)。

## 和编辑器共同写作

1. 打开桌面版 Agent 侧栏，点击插头图标 **连接外部 Agent**。
2. 导出 MCP 配置，保存在文档项目以外的私密位置。
3. 把配置添加到你的 Agent。需要 CLI 桥接的客户端可以使用：

```sh
tylina mcp --connection /path/to/private/mcp.json
```

无需创建内置 AI 会话。Agent 使用这个编辑器的实时选区和未保存内容。
同一按钮可以撤销授权，关闭编辑器窗口也会撤销连接；已接受的修改仍保留在正常历史中。

可以这样提问：

> 润色我选中的段落，保持原意，然后验证文档。

> 把这些笔记做成学术 Slides，先找合适的模板，检查渲染效果，再导出 PDF。

> 检查报告的排版，先给我看需要调整的页面，再修改。

<details>
<summary><strong>DSH、独立项目与脚本调用</strong></summary>

[DSH 插件](https://github.com/tylina/dsh-tylina) 可以提供 Harness 工作区中的实时编辑器连接。
HTTP/stdio 配置见[连接说明](skills/tylina/references/connection.md)。
普通静态 Web 页面本身不会暴露本地 MCP 端点。

独立项目使用 SDK 和匹配的 Native 运行时：

```sh
tylina mcp --workspace /path/to/project --main main.typ
```

这个模式不打开窗口，也能编译和导出。需要用户实时选区或未保存内容时，应连接实际编辑器。
Native 运行时支持 macOS、Windows、Linux 的 x64 和 arm64 架构。

CLI 和 SDK 使用同一套命令，包括 `editor.state`、`file.edit`、`document.validate`
和按需查询的 `help`。连接 token 放在私密配置或受保护的进程环境中，不进入 prompt、命令参数或文档文件。

</details>

<details>
<summary><strong>兼容性与验证范围</strong></summary>

通用 Skill 格式可供 Codex、Claude Code 等编程 Agent 使用；每个客户端仍需要兼容的 MCP 连接。
稳定版 SDK 已包含统一命令入口。升级旧安装后，可以用 `tylina --help` 核对命令是否可用。

真实 Codex 已在 macOS arm64 验证选区协作、报告与表格任务、按需 Skills、页面检查和 PDF/PNG/SVG 导出。
Electron 打包版也已验证授权导出与撤销、编辑、保存和 Undo。
这些结果不能替代每个客户端和平台的单独验收。

</details>

## 工作方式

入口 Skill 先发现宿主实际能力，再通过 `skill.list` 和 `skill.read`
读取统一维护的写作、Slides、图表等指导，复用 Tylina 的编译器与领域库。
编辑、模板和导出流程见[文档工作流](skills/tylina/references/workflow.md)。

本仓库是可独立安装的内容。运行 `node --test tests/skill-package.mjs` 检查元数据、链接和打包边界。
Skill 内容使用 [MIT 许可](LICENSE)；SDK、编辑器、字体和模板分别遵循各自许可。
