---
description: Create a usable compiled deck quickly from an existing bundled theme
---

# Quick Mode Workflow

Use Quick Mode when the user explicitly prioritizes speed, asks for a first usable draft, or
accepts reasonable defaults. Treat Quick Mode as a workflow choice, not a complexity tier:
Plain, Rich, and Canvas themes are all eligible.

Skip the separate `content_design_spec.md`, Strategist reference, executor references, new-theme
design, and new image acquisition. Keep source conversion, preservation of existing notes,
compilation, mechanical quality checks, validation, affected-page inspection, and requested exports.

## 1. Prepare the Source and Workspace

1. Call `workspace.info` and keep that root and live main as the only workspace state.
   Convert supported PDF or Office source with `document.import`, then read its receipt, warnings,
   and result before authoring.
2. For a topic-only request, write a concise source brief from reliable information already in
   scope. Switch to Full Mode when research, citation verification, or current/high-stakes facts
   are required.
3. Preserve an existing template scaffold or populated main. Never initialize a second project;
   write only the files required by the selected workflow into the current workspace.

Do not use Quick Mode as permission to author from an unread raw document.

## 2. Select One Existing Theme

1. Honor a named, scaffolded, or already copied theme without offering alternatives.
2. Otherwise read `_shared/slides/themes/README.md` and only the tier
   indexes needed to find a fit. Shortlist
   at most five candidates internally and select one without adding a user decision gate.
3. Prefer Rich or Plain when two themes fit equally well because their normal-flow authoring is
   faster. Select Canvas when its `theme.md` and `demo.typ` already demonstrate the composition
   the content needs; Canvas alone is not a reason to leave Quick Mode.
4. Do not create or materially extend a theme in Quick Mode.
5. If no theme is already present, call `template.list` with the chosen slug, then match
   the bundled result's `source` and `template.path`. Inspect that exact catalog spec and call
   `template.create` without a destination. Do not start authoring until it returns
   `available: true`.
6. For a newly materialized theme, use the returned destination and entrypoint; the materializer
   may place a conflicting theme under `themes/<name>/` instead of overwriting workspace files.
   For an existing scaffold, use its current paths instead. Read the materialized `theme.md` and
   `demo.typ`; `template.inspect` may already have supplied the same `theme.md`, so do not fetch it
   twice. The top-level Slides Skill and this workflow contain the ordinary Quick Mode technical
   rules. Read the 53 KiB `shared-standards.md` only for a specific unresolved technical question,
   never as routine setup. Read `template.typ` only when the public docs and demo omit the exact
   component or a compile diagnostic points to its implementation; do not read it merely to
   reconfirm a documented signature.
7. If a required new theme cannot be materialized, report that boundary. Do not guess private
   resource paths, transcribe template source, or overwrite a different file.

## 3. Author Directly

Choose a concise narrative, total physical-page target, and slide order, then write the authored
entrypoint directly. An unqualified page count includes cover, section, and ending pages. When the
named sections outnumber the pages left after those structural pages, combine compatible sections
deliberately before drafting instead of authoring extra pages and shrinking them afterward. With a
bundled theme scaffold, use `main.typ` when it is absent or blank; otherwise use a conflict-free new
`.typ` file unless the user explicitly requested replacement. Call
`document.setMain`, which compiles the candidate before switching, only when the authored file is
not already current; then validate the current main. Do not create a substitute mini design-spec
file.

- Favor a plain authoring vocabulary: headings, short paragraphs, lists, `#cols[...] [...]`, and
  a small set of documented theme components. “Plain authoring” does not require a Plain theme.
- Use only component calls and slide patterns documented in `theme.md` or proven by `demo.typ`.
- Prefer Typst content blocks for rendered copy: `#card[Title][Body]`, not
  `#card("Title")[Body]`. Keep strings for paths, URLs, enum/config keys, font names, and values
  that genuinely require string operations.
- Before writing a formula, apply the always-loaded math integrity gate. Use native Typst math by
  default. Use MiTeX only for supplied LaTeX or an existing MiTeX-authored document. Never use
  `#raw(...)`, ordinary/code text, or Unicode lookalikes as a shortcut. Compare every formula with
  its source and rendered result.
- Reuse a Canvas theme's demonstrated composer or layout skeleton. Do not invent new page
  geometry; use `place()` only when adapting the same pattern shown by the demo and verify it with
  a compile probe.
- Use relevant user/source images and assets required by the theme. Do not search for or generate
  new images, add optional packages, build new components, or add decorative SVG merely to make
  the draft look busier.
- Preserve existing `#speaker-note[...]` blocks. Add concise notes only when the user requests
  them, supplied material includes them, or the deck's delivery needs a separate narration layer.

## 4. Compile, Validate, and Review

Use Tylina's live toolchain first:

```text
document.validate
render.summary
render.overview
render.page
```

Apply the Quick Mode policy in
`typst-slides/references/seaslides/workflows/visual-review.md`.
Use `render.summary` for the actual page count. If an exact target differs because the source has
the wrong number of authored slides, fix that structure before sending stale page images to the
model. Use an overview when pagination or overflow still needs diagnosis, then inspect every newly
created or affected slide once with `render.page`; an overview can locate likely defects but cannot
replace those page images. Keep the default `render.page` PPI consistent across the first and final
visual pass for a new deck; only change it for a user request or a specific diagnostic. Fix defects
found in that bounded pass, repeat the stale evidence after source changes, and avoid discretionary
polish rounds. Require a successful live validation and the requested exports.

## 5. Switch to Full Mode When Needed

Switch to the standard workflow when the task requires a new or materially extended theme, new
image generation/search, substantial research or sourcing, a formal design specification,
complex chart calibration, extensive bespoke Canvas geometry, or long-deck phase resumption.
Do not switch merely because the selected existing theme is Canvas.
