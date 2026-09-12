---
description: Create a usable compiled deck quickly from an existing bundled theme
---

# Quick Mode Workflow

Use Quick Mode when the user explicitly prioritizes speed, asks for a first usable draft, or
accepts reasonable defaults. Treat Quick Mode as a workflow choice, not a complexity tier:
Plain, Rich, and Canvas themes are all eligible.

Skip the separate `content_design_spec.md`, Strategist reference, executor references, new-theme
design, and new image acquisition. Keep source conversion, shared standards, speaker notes,
compilation, mechanical quality checks, validation, and requested exports. Match visual-review
depth to the user's intent.

## 1. Prepare the Source and Workspace

1. Call `workspace.info` and keep that root and live main as the only workspace state.
   Convert a non-Markdown source only when its focused SeaSlides helper materially helps, then
   read the result before authoring.
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
   For an existing scaffold, use its current paths instead. Read `theme.md`, `demo.typ`, and
   `typst-slides/references/seaslides/references/shared-standards.md`. Read `template.typ` only
   when the public docs and demo leave an API/layout question or a compile error points to the
   implementation.
7. If a required new theme cannot be materialized and direct filesystem access exists, copy the
   exact theme directory from the resource roots returned by `workspace.info`. Preserve
   its directory tree and binary assets; never transcribe template source or overwrite a
   different file.

## 3. Author Directly

Choose a concise narrative, page-count target, and slide order, then write the authored entrypoint
directly. With a bundled theme scaffold, use `main.typ` when it is absent or blank; otherwise use
a conflict-free new `.typ` file unless the user explicitly requested replacement. Call
`document.setMain`, which compiles the candidate before switching, then validate the newly
current main. Do not create a substitute mini design-spec file.

- Favor a plain authoring vocabulary: headings, short paragraphs, lists, `#cols[...] [...]`, and
  a small set of documented theme components. “Plain authoring” does not require a Plain theme.
- Use only component calls and slide patterns documented in `theme.md` or proven by `demo.typ`.
- Prefer Typst content blocks for rendered copy: `#card[Title][Body]`, not
  `#card("Title")[Body]`. Keep strings for paths, URLs, enum/config keys, font names, and values
  that genuinely require string operations.
- Before writing a formula, apply the always-loaded math integrity gate. Quick compilation is never
  a reason to use `#raw(...)`, ordinary/code text, or Unicode lookalikes as a shortcut. Default new
  formulas to raw ``#mi(`...`)`` or ``#mitex(`...`)``. Use native `$...$` only when already fluent
  in every exact Typst spelling and expecting the first authored expression to validate; short or
  simple is not sufficient. Read the MiTeX README/demo before using it, and compare every formula
  with its source and rendered result.
- Reuse a Canvas theme's demonstrated composer or layout skeleton. Do not invent new page
  geometry; use `place()` only when adapting the same pattern shown by the demo and verify it with
  a compile probe.
- Use relevant user/source images and assets required by the theme. Do not search for or generate
  new images, add optional packages, build new components, or add decorative SVG merely to make
  the draft look busier.
- Add concise, meaningful `#speaker-note[...]` content to every slide.

## 4. Compile, Validate, and Review as Requested

Use Tylina's live toolchain first:

```text
document.validate
render.summary
render.overview
render.page
```

Apply the Quick Mode policy in
`typst-slides/references/seaslides/workflows/visual-review.md`.
Honor an explicit request to skip visual review. For an ordinary fast draft with no review
preference, inspect the overview and only suspicious pages. Inspect every slide once when the user
requests visual assurance or a delivery-grade review. Fix defects found in the selected review
scope, recompile after source changes, and avoid discretionary polish rounds.

Use the packaged quality checker only for a supplemental audit. First read
`typst-slides/scripts/TYLINA.md`, call `runtime.prepare`, and pass `--entry` for the
live workspace-relative main. Never use a script result instead of Tylina validation or render.

Require a successful live validation and the requested Tylina exports. If visual review was
skipped, state that the deck was compiled and mechanically checked but not visually reviewed; do
not report a visual pass.

## 5. Switch to Full Mode When Needed

Switch to the standard workflow when the task requires a new or materially extended theme, new
image generation/search, substantial research or sourcing, a formal design specification,
complex chart calibration, extensive bespoke Canvas geometry, or long-deck phase resumption.
Do not switch merely because the selected existing theme is Canvas.
