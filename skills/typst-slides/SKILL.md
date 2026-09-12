---
name: typst-slides
description: Create, extend, or review Typst presentations in quick or complex mode while honoring the current workspace, selected theme, framework, animation, notes, and canonical main file.
---

# Typst Slides

Compose this Skill with Typst Authoring. The catalog selects `quick` or `complex` mode.
Tylina's `complex` entrypoint is the SeaSlides Full Mode workflow; it is not a third pipeline.

## Mode Decision Gate

If the user only asks to create slides and neither the selected entrypoint nor the request
chooses a mode, stop before modifying files and ask one concise question: should this be a
quick creation or a complex creation?

- Explain **quick** as immediate generation from one already selected or bundled Tylina
  theme, using its `theme.md` and `demo.typ`, followed by compile and visual verification.
- Explain **complex** as the complete SeaSlides process with source analysis, narrative
  planning, visual direction, asset work, and page-by-page review.

Do not ask again when the user explicitly selected a quick or complex entrypoint, named the
mode, or gave requirements that unambiguously require one mode. Never silently interpret a
generic "create slides" request as complex merely because complex mode can do more.

## Workspace Intent Gate

Apply the Typst Authoring workspace and mutation gate, then add these presentation-specific rules:

1. **Truly blank draft**: no authored deck and no materialized template scaffold exist. Create a
   new deck only from a sufficient brief or supplied source; otherwise ask for the missing
   subject, audience, and purpose. Honor a user-chosen theme; choose one only when none was named.
2. **Chosen or materialized Tylina slide theme**: a user choice identifies the exact theme but
   does not prove that its files exist. Establish an existing scaffold through stored
   materialization provenance or a coherent theme-owned entrypoint and file set—not a filename
   alone. Materialize a chosen theme when needed. For the bundled slide-theme convention, then
   read `theme.md` and `demo.typ`, keep the demo as the working API example, and preserve all
   required theme files. Author `main.typ` or a conflict-free equivalent, switch through
   `document.setMain`, and validate the newly current main.
3. **Populated main document**: determine from the request whether to edit the current deck,
   replace it, create a new main, or build a multi-file deck. Preserve content by default.
   Replacing source requires explicit intent. A request for a distinct new deck defaults to a
   new compile-checked main while retaining the old file; ask only when the artifact boundary remains
   genuinely ambiguous.

Do not call a newly written deck complete until the intended main is selected, validates, and
is the document used by render and export tools.

## Packaged Resource Resolution

Read packaged text with the host file reader or Skill loader using `skillsRoot` from
`workspace.info`; in a browser use its resource reader. Paths below are relative to that root.
In inherited SeaSlides references, `SKILL_DIR` means `<skillsRoot>/typst-slides` and
`TYLINA_SKILLS_ROOT` means `skillsRoot`; neither placeholder authorizes a different workspace.

## Current Workspace Boundary

Treat the root returned by `workspace.info` as the only presentation project. Never run
SeaSlides `project_manager.py init`, never create a sibling or nested `projects/...` workspace,
and never use a bundled Skill or `local/` checkout as the working directory. Write or copy only
the files required by the selected workflow into the current workspace. Compile, select main,
render, and export through the shared `tylina` commands so every result uses the current workspace
and canonical source.

SeaSlides command-line helpers are packaged under `<skillsRoot>/typst-slides/scripts`. Use one only
when the host offers a terminal and disk workspace, and it helps source ingestion, asset preparation, PPTX delivery, or a
supplemental audit. Read `typst-slides/scripts/TYLINA.md` for dependencies and usage, then use
the host's process tools and environment. Browser-only hosts have no native terminal.

## Modes

### Quick Mode

Create a usable deck without a separate design specification or the full SeaSlides strategy.
For a truly blank new deck without a selected theme, select exactly one bundled theme from
`_shared/slides/themes`, then read only that theme's `theme.md` and `demo.typ` among its
theme-specific files. This does not replace the always-loaded Typst core or the Quick Mode
workflow and required technical rules below. Resolve the
selected slug through `template.list`, inspect the exact matching spec, call
`template.create`, then use the returned workspace-relative destination and
entrypoint. Do not author until materialization returns `available: true`. Write a concise
narrative, validate, and visually inspect every page. Follow
`typst-slides/references/seaslides/workflows/quick-mode.md`; do not load the SeaSlides strategist
or executor references in this mode.

Honor a named, scaffolded, or existing theme without offering alternatives. Otherwise use the
three tier indexes to shortlist at most five candidates by `best_for`, style, and tags, then
choose one. Prefer Rich unless the user requests Plain or Canvas composition materially helps.
Materialize its complete directory, including `template.typ` and required assets; never import
bundled Skill resources at Typst runtime. If Tylina materialization is unavailable but the Agent
has filesystem access, use the `skillsRoot` or `bundledSlideThemesRoot` returned by
`workspace.info` to copy the exact directory without transcribing files. Never overwrite
an existing different workspace file; choose a conflict-free directory instead.
Do not create a separate design specification, research a new theme, or generate images unless
the user switches to complex mode. Do not shrink an entire slide merely to conceal overflow.

### Complex Mode

Use the complete SeaSlides-derived presentation process below for a polished deck, major
redesign, bespoke theme work, research-heavy narrative, or complex assets and animation.

## Complex-Mode Pipeline

`Sources -> brief -> theme -> design decisions -> slide plan -> author -> compile -> review`

Complete the gates serially. In interactive mode, ask only for decisions that materially
change the result. In unattended mode, make a documented choice and continue.

## Hard Contract

1. Read source material before planning. Preserve facts, terminology, citations, required
   assets, and the user's language.
2. Inspect an existing deck before changing it. Its framework, import versions, theme,
   aspect ratio, slide idiom, animation, overflow, and notes are authoritative.
3. Keep content and theme concerns separate. Reusable visual patterns belong in the theme;
   slide-specific content and semantic structure belong in the main source.
4. For a new bundled theme, select from
   `_shared/slides/themes`, resolve and inspect its exact spec, then use
   `template.create`. Never import the bundled resource in the final document.
5. Do not invent APIs or mix Touying versions. Bundled custom themes are pinned to their
   checked-in working imports; a third-party theme owns its documented version boundary.
   For an uncertain Touying API, route through
   `_shared/docs/touying/index.json` and read one focused official page.
6. Preserve `#pause`, `#meanwhile`, repeat/later semantics, natural overflow groups, and
   per-slide speaker notes. Do not infer logical slides from physical page count alone.
7. For every formula, follow the Typst core's math integrity gate. Default new formulas to raw
   ``#mi(`...`)`` or ``#mitex(`...`)``. Use native `$...$` only when already fluent in its exact
   Typst spelling and expecting the first authored expression to validate; short or simple is not
   sufficient. Quick mode is not an exception to real math content: never imitate an equation with
   text, strings, `#raw(...)`, code, or Unicode lookalikes. Read
   `_shared/packages/mitex/README.md` before first using MiTeX.
8. Validate and visually inspect every page for a new deck or global theme change;
   inspect only affected pages for a local edit.

## Complex-Mode Progressive References

Read only the files required for the current phase. The SeaSlides reference snapshot is at
`typst-slides/references/seaslides`. Do not load these references in quick mode.

| Phase | Read |
|---|---|
| Theme selection | `typst-slides/references/seaslides/workflows/select-theme.md` and the relevant bundled tier index |
| Narrative and page plan | `typst-slides/references/seaslides/references/strategist.md` |
| Technical authoring | `typst-slides/references/seaslides/references/shared-standards.md` |
| General execution | `typst-slides/references/seaslides/references/executors/base.md` plus exactly one style executor |
| New or extended theme | `typst-slides/references/seaslides/references/template-designer.md` |
| Image-heavy composition | `typst-slides/references/seaslides/references/image-layout-patterns.md` |
| Visual review | `typst-slides/references/seaslides/workflows/visual-review.md` and `typst-slides/references/seaslides/references/visual-review.md` |
| Confirmed defect ownership | `typst-slides/references/seaslides/references/artifact-ownership.md` |

Upstream references may mention SeaSlides Python scripts. The Tylina-packaged snapshot is optional
and follows `typst-slides/scripts/TYLINA.md`; never substitute an upstream project directory for the
current workspace. Tylina MCP compilation, source mapping, render, main selection, and export
remain authoritative even when a helper script also produces diagnostics or artifacts.

## Complex-Mode Workflow

### 1. Understand Sources

Read supplied files or attached content and create a compact source brief. Mark uncertainty
and missing evidence. Do not proceed from an unread PDF, document, or web page.

### 2. Select a Theme

Honor a named, scaffolded, or existing theme. Otherwise use the bundled tier indexes and choose by
audience, delivery setting, content structure, and visual character. Rich is the dependable
default; use Plain when requested and Canvas only when bespoke composition materially helps.

For a new bundled theme, resolve it with `template.list`, inspect the exact spec, and call
`template.create`. Continue from its returned destination and entrypoint. Read the
materialized `theme.md`, `demo.typ`, and, for Canvas or theme modifications, `template.typ`.

### 3. Make Design Decisions

Decide page format, page-count range, audience, style objective, complexity tier, color and
type direction, image approach, and third-party packages. Use `_shared/packages/index.json`
only for relevant pinned recipes.

Create a concise slide-by-slide plan with purpose, source evidence, layout intent, animation,
and speaker-note intent. Do not force arbitrary layout variety when repetition helps compare
or sequence material.

### 4. Author

Use the selected theme's documented public components. Keep each slide focused and readable
at projection size. Use semantic tables, diagrams, math, figures, labels, and references.
For formulas, follow the always-loaded core math policy; compilation does not replace checking
notation and mathematical meaning against the source.
Keep source/debug text, TODOs, unresolved calls, and Markdown residue out of rendered pages.
Add meaningful speaker notes to every logical slide when supported.

### 5. Verify

For a new deck or global redesign:

1. Run `document.validate` and resolve all blocking diagnostics.
2. Run `render.summary` and confirm physical pages, aspect ratios, and pagination.
3. Use `render.overview` to find suspicious pages.
4. Use `render.page` at readable PPI for every page. Check overflow, clipping,
   collisions, contrast, missing assets, raw source leakage, and accidental blanks.
5. Revalidate after every correction. Report any unavailable verification explicitly.
6. When the user requests a PDF, PNG, or SVG deliverable, call
   `document.export` only after final validation and visual review. Keep the destination
   inside the workspace, and set `overwrite: true` only when replacement is explicit.

## Existing Decks

Edit the current source and theme in place. Validate and inspect affected pages; a small addition
does not require rerunning the full creation workflow. Re-run narrative planning only when the request
changes the deck's story, theme, or structure. Preserve logical slide groups and animation
steps when moving, duplicating, or rewriting content.
