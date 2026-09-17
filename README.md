<div align="center">

# Tylina Skill

**Your Agent and your document, in the same workspace.**

[Tylina](https://tylina.github.io/) · [Web editor](https://tylina.github.io/app/) · [Demo](https://tylina.github.io/demo/) · [中文](README.zh-CN.md)

</div>

Turn notes into papers, slides, reports, books, exams, research trails, scientific documents,
linguistic examples, or office forms. Polish a résumé, lay out a poster, build a chart, or engrave
supplied music notation.
Your Agent can read your selection, edit Typst source, inspect real rendered pages and export the result.
One **`tylina`** tool connects the workflow; writing and design Skills load as needed.

[![Editing a Typst document in Tylina](https://tylina.github.io/demo.gif)](https://tylina.github.io/demo/)

| Write together | Check and deliver |
| --- | --- |
| Read the current editor selection | Compile with Typst/Tinymist |
| Make precise, version-checked edits | Inspect actual page images |
| Import PDF and Office evidence without Python | Review OCR and extraction warnings |
| Search current templates, packages and domain Skills | Export PDF, PNG, SVG and PowerPoint |
| Keep edits in normal editor history | Continue in the same workspace |

## Get started

Install the Skill for your coding Agent:

```sh
npx skills add tylina/tylina-skill
```

Or copy [`skills/tylina`](skills/tylina/) into its supported Skills directory. No core repository
checkout is required. The Skill provides guidance; an editor connection or local runtime supplies the tools.

**Already have a Tylina MCP connection?** Enable it in your Agent and start writing.
Otherwise install the SDK's stable command interface:

```sh
npm install -g tylina-sdk
```

Use the same command to update. [SDK on npm](https://www.npmjs.com/package/tylina-sdk?activeTab=versions)
lists published channels; the connection guide explains [runtime requirements](skills/tylina/references/connection.md).

## Write with your editor

1. Open the desktop Agent sidebar and click **Connect external Agent** (the plug icon).
2. Export the MCP configuration to a private location outside your document project.
3. Add that configuration to your Agent. For clients that use the CLI bridge:

```sh
tylina mcp --connection /path/to/private/mcp.json
```

No built-in AI conversation is required. The Agent uses this editor's live selection and unsaved content.
Revoke access from the same button, or close the editor window; accepted edits remain in normal history.

Try asking:

> Improve the selected paragraph without changing its meaning, then validate the document.

> Turn these notes into academic slides. Find a suitable template, inspect the pages, and export a PDF.

> Review the report's layout. Show me the pages that need attention before changing them.

> Research this question, deduplicate DOI/arXiv records, and audit missing citations before editing.

> Import this scanned paper as evidence, keep uncertain OCR visible, and verify every quoted formula against the PDF.

> Find a suitable Chinese exam template, inspect its exact API, then create student and answer versions.

> Typeset these measurements, reactions, and quantum circuits without changing any supplied value.

> Turn these meeting records into minutes, keeping decisions and proposed actions distinct.

<details>
<summary><strong>DSH, standalone projects and scripting</strong></summary>

[DSH Plugin](https://github.com/tylina/dsh-tylina) provides a live-editor connection in the Harness workspace.
For HTTP/stdio configuration, see the [connection guide](skills/tylina/references/connection.md).
A static Web tab alone does not expose a local MCP endpoint.

Standalone projects use the SDK and a matching native runtime:

```sh
tylina mcp --workspace /path/to/project --main main.typ
```

This mode compiles and exports without a window. Use an editor connection when you need live selection
or unsaved edits. Native runtimes are available for macOS, Windows and Linux on x64 and arm64.

Matching CLI and SDK callers use the same commands, including `editor.state`, `document.validate`,
`document.eval`, `document.import`, `package.list`, and progressive `help`. Connection tokens belong in private
configuration or protected process
variables, outside prompts, command arguments and document files.

</details>

<details>
<summary><strong>Compatibility and verification</strong></summary>

The Skill format works with coding Agents such as Codex and Claude Code; each client still needs a
compatible MCP connection. The stable SDK includes the unified command interface.
Check `tylina --help` when upgrading an older installation.

Real Codex checks on macOS arm64 cover selected-range coediting, report and table tasks, on-demand
Skills, rendered images, local PDF OCR and PDF/PNG/SVG export. Cross-host tests also cover visual-fidelity and
experimental editable PowerPoint export. Packaged Electron verifies grant export and revocation,
editing, saving and Undo. These checks do not establish every client's or platform's behavior.

</details>

## How it works

The entry Skill discovers the host's actual capabilities, then reads maintained authoring,
research, science, linguistics, education, office, music, long-form, slides, charts, and other
guidance using the paths from `workspace.info` and the harness file reader. It shares Tylina's
compiler and domain library. [Document workflows](skills/tylina/references/workflow.md) describe
editing, templates and export.

The `skills/` directory is the runtime resource root. It contains the installable `tylina` entry,
domain Skills, their catalog and the `_shared` reference and template resources. The offline
scenario catalog includes paper, theorem/proof, report, notes, homework, exam and semantic table
workspaces alongside the CV, poster and social-cover collection. Matching gallery images live in
`resources/template-previews` and are packaged at the editor's stable preview URLs.

This repository is independently installable content. Run `npm test` to check metadata, links and the release
archive boundary. Run `npm run test:scenarios` with Typst 0.15 to
compile every Tylina-owned template and output variant. Tylina-maintained Skill guidance is [MIT licensed](LICENSE);
mirrored third-party documentation and template examples retain their upstream licenses and notices.
The SDK, editor, fonts and packaged templates retain their own licenses.

Tylina also consumes this repository as one atomic core Skill collection. The collection version and
minimum compatible Tylina version live in `skills/catalog.json`; individual `SKILL.md` files remain
standard Skill packages and do not carry a Tylina-only manifest. A release tag publishes one complete,
byte-verified ZIP. The latest release index retains the newest collection for every compatibility floor,
so an older Tylina can still discover its newest compatible collection after the tool contract advances.
Compatible hosts download in the background and activate the whole collection for the next host session,
while keeping their packaged collection as the fallback. Content-only releases do not raise the minimum
Tylina version; a new host command or changed tool contract does.

Collection releases use the Tylina semver series for a recognizable product generation, starting at
`0.15.0`; development snapshots may use versions such as `0.15.1-alpha.1`. The release cadence remains
independent: `minimumTylinaVersion`, not an exact version match, determines host compatibility. Alpha
versions identify packaged development snapshots; only a stable version can produce an official update release.
