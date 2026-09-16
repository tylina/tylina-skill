# Document workflows

These are Tylina-specific operations. Use `help` only for an unfamiliar command.

## Start from a template

When the host provides template commands, for a requested template use `template.list` before inventing styling or searching arbitrary
repository revisions. Inspect the chosen exact spec with `template.inspect`, then materialize it
with `template.create`. The materializer preserves conflicting files by choosing an isolated
destination; use the actual paths returned in its receipt.

Preserve the current document unless the user requested replacing it. Choose the new main file
through `document.setMain`; that command uses real compilation before switching. Follow the selected
domain Skill for slides, papers, resumes, posters, charts or other document types.
The candidate standalone SDK provides these commands too. Official packages resolve through Tinymist;
bundled themes require installed Web assets. A host can disable template access. Inspect `help` and
check unavailable catalog sources; do not claim an offline shortlist contains every available template.

For reusable capabilities rather than a whole scaffold, call `package.list`. It reads the current
official Universe index, including non-template packages, and returns pinned metadata plus the
relevant Tylina Skill and optional verified recipe. Read the returned recipe when present;
when it does not establish the needed API, use `package.inspect` on the returned exact spec and
request only the relevant documentation, manifest, entrypoint, file list, or source path.
Inspection is read-only package evidence, not a workspace edit target.
`package.list` metadata, repository HEAD, and a screenshot do not establish the selected API.

## Inspect document values

Use `document.eval` for bounded read-only Typst expressions that need the current compiled world,
imports, library, or document introspector. It can inspect values such as counters or query results
without inserting diagnostic code into canonical source. The expression is code mode, not markup;
use returned diagnostics and never treat evaluation as permission to mutate files. Large inputs and
results are rejected by the host.

## Import source material

Use `document.import` for a PDF, DOCX, PPTX, or XLSX already in the workspace. Read
`typst-authoring/references/source-ingestion.md` before calling it. One call captures the current
binary and may create the chosen new `.md` destination. Keep the original binary and treat warnings
as unresolved evidence. Never opt into partial scan text silently. This shared path works in Web,
DSH, Electron, and the standalone SDK without Python.

## Work in a large project

Start from `workspace.info` and the main or active file. Use the harness filesystem tools for the relevant directory. Read only files needed for the task. Tylina's
compiler resolves imports and requests dependencies through the workspace provider.

An initial file list is not proof that the rest of the repository is absent. Do not recursively
download a project, enumerate `.git`, or synthesize dependency lists by parsing source strings.
Paths are workspace-relative. Providers own native paths, symlinks and access checks.

## Review and export

1. Validate changed source with `document.validate`.
2. Inspect affected pages with `render.page`; use a summary or overview only to locate unknown pages.
3. Use `document.export` to produce PDF, PNG, SVG, `pptx-visual`, or `pptx-editable`. PDF and both
   PPTX formats use a file destination; PNG/SVG use a directory. Discover the current schema before
   exporting and respect overwrite intent.
4. Return the actual export receipt and destination. In a browser workspace, an exported resource
   may still require the user's download action; a workspace path is not necessarily a host disk path.

`pptx-visual` places each compiled Typst page as a full-slide image. It is the fidelity-oriented
choice and its slide contents are not editable. `pptx-editable` reconstructs supported text, image,
and shape elements from the compiled frame model; it is experimental and should be inspected in a
real PowerPoint-compatible application. Neither PPTX becomes canonical document state: preserve the
Typst source and resources, and do not promise round-trip editing from PowerPoint back to Typst.

Validation and rendering must correspond to the current source. If the user edits concurrently,
refresh the source/context and repeat only the checks made obsolete by those changes.

## Operate the editor

`view.state` reads observed application state. `view.set` explicitly sets a supported target instead
of blindly toggling it. Discover targets from `help`; a `null` surface is unavailable in that host.
Use these commands when an operation benefits the user, such as opening a requested template gallery
or switching to Split to review source. Open `workspace` before selecting `sidebarTool`, such as
`outline` or `labels`; `zoom: 1` resets preview zoom. `history` selects `edits`, `git` or `closed`.
A host may reject an unsupported subview even when it provides the parent surface. Opening a panel
confirms its UI state, not completion of its asynchronous contents. Do not rearrange the UI on every read or edit.

View commands reuse the human UI controllers. They can reject a change during IME or a temporary
editor. Preserve the draft and explain the blocked action; do not force a blur or simulate clicks.
Browser user-gesture restrictions still apply to windows, clipboard and fullscreen capabilities.
Use `presenter` only when the user wants to present. `start` can return `preparing` or
`user-action-required`; the latter requires clicking Start presentation in the editor, not polling.
Read `state` for the actual phase. `jump` uses a one-based physical page; both `jump` and `stop`
require the returned `operationId`. Do not reuse an identity after the main file or presentation changes.
Cancelling a tool request does not undo an accepted start. Read state before deciding whether to stop.
Do not promise Git, full-screen control or other operations absent from this host's current help.
