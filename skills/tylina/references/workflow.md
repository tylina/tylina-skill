# Document workflows

Discover exact parameters with `help`; these workflows name shared commands, not separate MCP tools.

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

## Work in a large project

Start from `workspace.info` and the main or active file. Use `file.list` for direct children of a
relevant directory; follow pagination when returned. Read only files needed for the task. Tylina's
compiler resolves imports and requests dependencies through the workspace provider.

An initial file list is not proof that the rest of the repository is absent. Do not recursively
download a project, enumerate `.git`, or synthesize dependency lists by parsing source strings.
Paths are workspace-relative. Providers own native paths, symlinks and access checks.

## Review and export

1. Validate the current main document with `document.validate` after changes.
2. Use `render.summary` to learn the actual page count. For a long artifact, inspect bounded
   `render.overview` batches and obtain `render.page` images for pages needing closer review.
3. Use `document.export` to produce PDF, PNG or SVG. PDF uses a file destination; PNG/SVG use a
   directory. Discover the current schema before exporting and respect overwrite intent.
4. Return the actual export receipt and destination. In a browser workspace, an exported resource
   may still require the user's download action; a workspace path is not necessarily a host disk path.

Validation and rendering must correspond to the current source. If the user edits concurrently,
refresh the source/context and repeat only the checks made obsolete by those changes.

## Use packaged scripts

Read the relevant domain Skill before choosing a script. When the host advertises `runtime.prepare`,
use it to obtain the actual `uvExecutable`, environment, workspace root and Skills root. Check for
`ready`; interactive hosts can return `installing`, while standalone CLI/SDK calls wait for completion.
Retry a failed installation only with an explicit `retry: true` request after addressing the cause.

Run the documented script through your host's ordinary process tool, using the returned environment
and workspace root as `cwd`. Use `uv run --no-project` unless the Skill explicitly requires that
workspace's Python project. Keep script arguments separate; do not assemble unescaped shell strings.
Respect the calling Agent's execution permissions, timeouts and cancellation. This command prepares
runtime paths, not a hidden shell inside Tylina. Browser-only hosts need their supported document
commands or an external host for native scripts; do not invent a browser terminal capability.

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
