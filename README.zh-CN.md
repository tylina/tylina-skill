<div align="center">

# Tylina Skill

**让 Agent 和你，在同一个工作区里编写文档。**

[Tylina 官网](https://tylina.github.io/) · [Web 编辑器](https://tylina.github.io/app/) · [演示](https://tylina.github.io/demo/) · [English](README.md)

</div>

把笔记变成论文、Slides、报告、书籍、试卷、科学文档、语言学例句、办公表单，
或可追溯的文献调研；也可以润色简历、设计海报、制作图表或排版给定乐谱。
Agent 可以读取你的选区，精确修改 Typst 源码，检查实际排版，再导出成品。
统一使用一个 **`tylina`** 工具，按任务加载写作与设计 Skills。

[![在 Tylina 中编辑 Typst 文档](https://tylina.github.io/demo.gif)](https://tylina.github.io/demo/)

| 共同编写 | 检查与交付 |
| --- | --- |
| 读取编辑器当前的真实选区 | 通过 Typst/Tinymist 编译 |
| 带版本校验的精确修改 | 查看实际渲染页面 |
| 无需 Python 导入 PDF 与 Office 证据 | 检查 OCR 与提取警告 |
| 搜索当前模板、包和领域 Skills | 导出 PDF、PNG、SVG、PowerPoint |
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

> 围绕这个问题进行文献调研，去重 DOI/arXiv 记录，并在修改前检查缺失引用。

> 把这篇扫描论文导入为证据，保留不确定 OCR，并逐条对照 PDF 核对引用的公式。

> 寻找适合的中文试卷模板，核对其准确 API，再生成学生版和答案版。

> 排版这些测量值、化学反应与量子线路，不改变任何给定数据。

> 把这些会议记录整理成纪要，严格区分已作出的决定与仍在讨论的行动项。

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

匹配版本的 CLI 和 SDK 使用同一套命令，包括 `editor.state`、`document.validate`、`document.eval`、
`document.import`、`package.list` 和按需查询的 `help`。连接 token 放在私密配置或受保护的进程环境中，
不进入 prompt、命令参数或文档文件。

</details>

<details>
<summary><strong>兼容性与验证范围</strong></summary>

通用 Skill 格式可供 Codex、Claude Code 等编程 Agent 使用；每个客户端仍需要兼容的 MCP 连接。
稳定版 SDK 已包含统一命令入口。升级旧安装后，可以用 `tylina --help` 核对命令是否可用。

真实 Codex 已在 macOS arm64 验证选区协作、报告与表格任务、按需 Skills、页面检查、
本地 PDF OCR 和 PDF/PNG/SVG 导出。
跨宿主测试还覆盖视觉保真与实验性可编辑 PowerPoint 导出；Electron 打包版也已验证授权导出与撤销、
编辑、保存和 Undo。
这些结果不能替代每个客户端和平台的单独验收。

</details>

## 工作方式

入口 Skill 先发现宿主实际能力，再根据 `workspace.info` 的资源路径，用宿主文件工具
读取统一维护的写作、研究、科学、语言学、教育、办公、乐谱、长篇文档、Slides、图表等指导，
复用 Tylina 的编译器与领域库。
编辑、模板和导出流程见[文档工作流](skills/tylina/references/workflow.md)。

`skills/` 是运行时资源根目录，包含可安装的 `tylina` 入口、领域 Skills、内容 catalog，
以及 `_shared` 参考资料和模板。离线场景 catalog 除了简历、海报与社交封面外，
还包含论文、定理／证明、报告、笔记、作业、试卷和语义表格工作区。对应的模板预览图位于
`resources/template-previews`，构建时仍使用编辑器现有的预览 URL。

本仓库是可独立安装的内容。运行 `npm test` 检查元数据、链接和发布归档边界；
在 Typst 0.15 环境运行 `npm run test:packages`、`npm run test:scenarios` 和
`npm run test:visual-resources`，可编译全部包示例、场景入口及变体、图表和图标示例。
Tylina 维护的 Skill 指导内容使用 [MIT 许可](LICENSE)；镜像的第三方文档与模板示例保留上游许可和声明。
SDK、编辑器、字体和打包模板分别遵循各自许可。

Tylina 也会把本仓库作为一个原子更新的核心 Skill 集合。集合版本和最低兼容 Tylina 版本记录在
`skills/catalog.json`；各个 `SKILL.md` 仍是标准 Skill 包，不增加 Tylina 私有 manifest。
每个 release tag 发布一个完整、按字节校验的 ZIP。Electron、Node SDK 与 DSH 会在后台下载兼容版本，
并在下一次宿主启动时整体启用，同时保留随应用打包的集合用于回退。Web 编辑器只使用当前部署打包的集合，
不会轮询这份 release 索引。最新 release 的索引会为每个兼容性下限保留最新集合，
因此工具契约升级后，旧版 Tylina 仍能找到自己可用的最后一个新版本。只更新内容时不提高最低 Tylina
版本；只有新增宿主命令或改变工具契约时才提高。候选更新失败不会改变 active 版本；
启动时发现已激活 snapshot 的 catalog 或标准入口无效，才回退随应用打包的内容。
选定 snapshot 后，按需资源缺失会明确失败，不会临时混入另一个版本。

集合版本沿用 Tylina 的 semver 系列，首个版本为 `0.15.0`；开发快照可使用
同一下一 patch 的 `alpha.N`。集合版本与对应的 Tylina release 一致；匹配版本验证完成后，
归档可以独立发布。旧宿主能否安装仍由 `minimumTylinaVersion` 判定。
官方更新 release 必须使用稳定版本。
