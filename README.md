<div align="center">

# Tylina Skill

**Your Agent and your document, in the same workspace.**

[Tylina](https://tylina.github.io/) · [Web editor](https://tylina.github.io/app/) · [中文](README.zh-CN.md)

</div>

Create a paper, polish a resume, build academic slides, or turn notes into a finished report.
Tylina gives your Agent real Typst compilation, page images and PDF/PNG/SVG export, together with
the user's live editor context. One `tylina` command interface; domain Skills load as needed.

> **Development preview.** This repository targets the next command-capable Tylina SDK release.
> The CLI and MCP stdio bridge are locally tested; published SDK 0.4.2 does not include them yet.
> A matching command-capable editor/DSH build and its granted connection are required; the new gateway
> has not been released in the DSH bundle yet. Independent workspace launch is still in development.

| Write together | Verify the result |
| --- | --- |
| Read the user's actual selection | Compile through Typst/Tinymist |
| Apply precise edits with version checks | Inspect rendered pages |
| Discover templates and domain Skills | Export PDF, PNG and SVG |
| Use supported editor views | Keep changes in normal editor history |

## Install the Skill

With the [Skills CLI](https://www.skills.sh/docs/cli):

```sh
npx skills add tylina/tylina-skill
```

Or copy [`skills/tylina`](skills/tylina/) into your Agent's supported skills directory. The Skill
format is shared by coding Agents such as Codex and Claude Code; it is not tied to a model provider.
No Tylina core repository checkout is required.

Installing a Skill provides guidance, not a running editor connection. Use an existing Tylina MCP
connection, or install the matching command-capable `tylina-sdk` artifact supplied with the preview.
Do not use published SDK 0.4.2 for the commands below.

## Connect your editor

The DSH Tylina integration can supply a live-editor MCP connection. Configure that HTTP connection
in your Agent, or supply `TYLINA_MCP_URL` and `TYLINA_MCP_TOKEN` through its protected environment and
run the SDK's stdio adapter:

```sh
tylina mcp
```

For CLI-capable Agents and scripts, the same environment also enables:

```sh
tylina editor.state
tylina help --args '{"command":"file.edit"}'
tylina document.validate
```

Keep real connection tokens out of prompts, repository files and command arguments.
The Agent uses your connected editor; it does not start another model or create a competing copy of
the document. A static Web tab alone does not expose a local MCP endpoint.

## Try it

> Use Tylina to improve the selected paragraph while preserving its meaning, then validate the document.

> Create an academic slide deck from these notes. Browse suitable templates, check the rendered pages,
> and export a PDF.

> Review the report's layout. Show me the pages that need attention before changing them.

The entry Skill discovers the host's actual capabilities, then loads Tylina's maintained authoring,
slides, charts and other domain guidance through `skill.list` and `skill.read`. This repository
doesn't duplicate that library or the compiler.

See the [connection guide](skills/tylina/references/connection.md) for SDK composition and
[document workflows](skills/tylina/references/workflow.md) for editing and export behavior.

## Development

This repository is independently installable Skill content. There is no core source checkout or
compilation step. Run `node --test tests/skill-package.mjs` to validate its links, metadata and package
boundaries. Live-editor workflows additionally require a compatible SDK/editor and real runtime tests;
the content checks alone do not prove compilation, UI behavior or Agent quality.

Skill content is [MIT licensed](LICENSE). The SDK, editor, fonts and templates retain their own licenses.
