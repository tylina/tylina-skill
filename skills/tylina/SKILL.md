---
name: tylina
description: Coedit and verify Typst documents with Tylina's live selection, compiler, page previews, templates and PDF/PNG/SVG export.
---

# Tylina

Tylina supplements your harness with editor context and document capabilities. Use your normal
read/edit/write tools for files. `workspace.info` provides the actual project, main file and
`skillsRoot`; your terminal working directory may differ. Native edits reach the editor through
its external-change handling. Resolve unsaved-edit conflicts instead of overwriting them.

One MCP tool, `tylina`, accepts `{command, args}`. Common calls:

- `{command:"workspace.info"}` — workspace and resource paths.
- `{command:"editor.state"}` — real selection/caret, active file and draft status.
- `{command:"document.validate"}` — compile the current main and report diagnostics.
- `{command:"render.page",args:{page:1}}` — return an actual page image.

Use `help` for unfamiliar operations only. Do not look up schemas already in context.
A standalone disk connection has no live selection or unsaved editor state. Setup, CLI and SDK:
[connection.md](references/connection.md). Templates, export and views: [workflow.md](references/workflow.md).

Read the relevant bundled `typst-<domain>/SKILL.md` under `skillsRoot` using your file reader or
Skill loader. Core `typst-authoring` is normally already in session instructions; do not reload it.
Package recipes and official API paths are indexed in `_shared/packages/index.json` and
`_shared/docs/index.json`. Load only the needed reference. These paths are not runtime imports.

Stay at the selected target. Adding a diagram or paragraph does not authorize a new document or
main-file switch. A draft selection is not canonical source; inspect its context before editing.
Validate changed source, inspect affected pages for layout changes, and export when requested.
Do not repeat an unchanged render or claim visual verification without viewing the returned image.
