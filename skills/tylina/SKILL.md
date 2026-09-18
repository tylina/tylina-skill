---
name: tylina
description: Coedit, inspect, evaluate, and verify Typst documents with Tylina's live selection, compiler, package and template discovery, page previews, and export.
---

# Tylina

Tylina supplements your harness with editor context and document capabilities. Use your normal
read/edit/write tools for files. `workspace.info` provides the actual project and main file;
your terminal working directory may differ. Native edits reach the editor through
its external-change handling. Resolve unsaved-edit conflicts instead of overwriting them.

One MCP tool, `tylina`, accepts `{command, args}`. Common calls:

- `{command:"workspace.info"}` — workspace, main file, and known file counts.
- `{command:"editor.state"}` — real selection/caret, active file and draft status.
- `{command:"document.validate"}` — compile the current main and report diagnostics.
- `{command:"document.eval",args:{expression:"1 + 2"}}` — evaluate bounded Typst code in the
  current compiled document world without changing source.
- `{command:"document.import",args:{source:"sources/paper.pdf",destination:"sources/paper.md"}}` —
  capture and extract a PDF or Office source into a new conservative Markdown file.
  Follow `ocr-required` without silently accepting incomplete text.
- `{command:"render.page",args:{page:1}}` — return an actual page image.
- `{command:"package.list",args:{query:"music"}}` — search the current official package catalog
  and return relevant bundled Skill or recipe paths.
- `{command:"package.inspect",args:{spec:"@preview/example:1.0.0",include:["documentation"]}}`
  — read bounded evidence from one exact version returned by `package.list`.
- `{command:"image.search",args:{query:"research diagram"}}` — find reviewable Openverse
  candidates; select and license-check one before `image.import` writes its bounded preview.
- `{command:"document.export",args:{format:"pptx-visual",destination:"exports/deck.pptx"}}` —
  export a compiled document to a workspace-relative PowerPoint file.

Use `help` for unfamiliar operations only. Do not look up schemas already in context.
A standalone disk connection has no live selection or unsaved editor state. Setup, CLI and SDK:
`tylina/references/connection.md`. Templates, export and views: `tylina/references/workflow.md`.
Portable PDF and Office ingestion:
`typst-authoring/references/source-ingestion.md`.
External raster image discovery, license review, import, and attribution:
`tylina/references/image-sourcing.md`.

When the host or user selected a Skill, read that exact Skill path directly. Use `skill.list` only
when the relevant domain is not known. Core `typst-authoring` is normally already in session
instructions; do not reload it. Preserve an existing package import, then read an exact local
recipe named by the selected Skill before broader discovery. Use `package.list` only when those
routes are missing or insufficient, and `package.inspect` only for one selected exact spec.
For a curated package, `package.list` returns directly readable `recipePath` and `demoPath` values.
Official API paths are indexed in `_shared/docs/index.json`. Load only the needed reference.
These paths are not runtime imports.

Stay at the selected target. Adding a diagram or paragraph does not authorize a new document or
main-file switch. A draft selection is not canonical source; inspect its context before editing.
Validate changed source, inspect affected pages for layout changes, and export when requested.
Do not repeat an unchanged render or claim visual verification without viewing the returned image.
