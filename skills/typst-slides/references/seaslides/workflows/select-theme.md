---
description: Select or create a Typst theme using task and capability checks
---

# Select Theme Workflow

Select or create a theme, copy it into the project, learn its API, and continue to Quick or Full
Mode authoring.

## Contents

- [Quick Routing](#quick-routing)
- [Quick Mode Selection](#quick-mode-selection)
- [Assess Task and Capability](#assess-task-and-execution-capability)
- [Select from the Library](#select-from-the-library)
- [Create a New Theme](#create-a-new-theme)
- [Materialize and Learn](#materialize-and-learn)
- [Continue to Content Design](#continue-to-content-design)
- [File Reference](#file-reference)

## Quick Routing

```text
Quick Mode?                -> Quick Mode Selection -> Materialize and Learn -> Author directly
User named a theme?       -> Use it and continue to Materialize and Learn
User requested a new one? -> Create New Theme
Otherwise                 -> Assess task -> Select from Library -> Materialize and Learn
```

## Quick Mode Selection

1. Honor a named, scaffolded, or already copied theme without offering alternatives.
2. Otherwise read the dispatcher and only the tier indexes needed to find a fit. Shortlist at
   most five candidates internally and choose the strongest match without a user decision gate.
3. Prefer Rich or Plain when two themes fit equally well because normal-flow authoring is faster.
   Select Canvas when `theme.md` and `demo.typ` already demonstrate the composition the content
   needs. Do not reject Canvas merely because Quick Mode is active.
4. Do not create or materially extend a theme.
5. Continue with [Materialize and Learn](#materialize-and-learn), then follow
   `typst-slides/references/seaslides/workflows/quick-mode.md` instead of producing
   `content_design_spec.md`.

## Assess Task and Execution Capability

Choose complexity from the requested artifact and the executor's demonstrated ability, not from a model brand.

| Level | Use when | Avoid when |
|---|---|---|
| Plain | The user explicitly wants minimal or undecorated slides | The user expects rich visual storytelling |
| Rich | A dependable component-based deck satisfies the task | Bespoke free-form composition is essential |
| Canvas | Custom composition materially improves the content and the executor can safely use Typst content/code modes | API handling or compile reliability is uncertain |

Before selecting Canvas, verify all of the following:

1. The content benefits from bespoke composition rather than existing Rich components.
2. The executor can distinguish `[...]` content blocks from `{...}` code blocks.
3. The executor can read and correctly call the selected theme's `theme.md` API.
4. The task has enough time for a compile probe and visual correction.

If any check is uncertain, select Rich. A stable Rich deck is preferable to a broken Canvas deck.

## Select from the Library

1. Read `_shared/slides/themes/README.md`.
2. Read only the relevant tier catalog:
   - `_shared/slides/themes/custom-rich/index.json`
   - `_shared/slides/themes/custom-canvas/index.json` when Canvas passed the capability check
   - `_shared/slides/themes/custom-plain/index.json` when Plain was requested
3. Check `_shared/slides/themes/user/` for user-created themes.
4. Rank candidates using catalog `tags`, `best_for`, style, audience, projection/print needs, and content structure.
5. Do not select builtin themes unless the user names one.
6. Do not always map a topic to the same theme; prefer the theme whose visual grammar supports the current narrative.

In Full Mode, present up to five candidates with one-line rationales and wait. In unattended mode,
choose the highest-ranked candidate; do not pick randomly. Quick Mode uses its automatic branch
above.

## Create a New Theme

Create a theme only when the library does not adequately support the content and the task allows implementation plus review.

1. Read `_shared/slides/theme_design_spec_reference.md`.
2. Present one bundle covering theme name, visual metaphor, complexity, colors, typography, optional decorations, components, and slide types.
3. Write `theme_design_spec.md` after confirmation or unattended decision.
4. Read `typst-slides/references/seaslides/references/template-designer.md`.
5. Create `template.typ`, `demo.typ`, and `theme.md`.
6. Select the intended demo with `document.setMain`, whose candidate compile gate rejects an
   invalid entrypoint. Then run `document.validate`, `render.summary`, and
   `render.page` for up to three focused visual-review rounds.

Keep design choices outcome-oriented. Decorative SVG, asymmetry, and custom components are optional tools, not quotas. Preserve compilation, readability, content accuracy, and theme coherence.

## Materialize and Learn

If the theme is already scaffolded or copied in the current workspace, keep those files and
continue below. Otherwise resolve its exact catalog spec with `template.list`, inspect
it with `template.inspect`, and call `template.create`. Use the returned
destination and entrypoint. Never run `project_manager.py init` or `copy-theme`, never transcribe
the template, and never overwrite an existing different workspace file.

Read:

1. `theme.md` for the supported API and theme contract.
2. `demo.typ` for working composition patterns.
3. `template.typ` when using Canvas in Full Mode or modifying the theme. In Quick Mode, read it
   only when `theme.md` and `demo.typ` leave an API/layout question or a compile error points to
   the implementation.

Use the demo as evidence of valid composition, not as a requirement to copy every component or match a numeric source-code density.

When using a Canvas theme in Rich mode:

- Call only documented pre-built components.
- Use `#cols[...] [...]` for ordinary multi-column layouts.
- Avoid bespoke `place()`, inline visual styling, and per-page configuration.
- Use a theme-specific composer only when `theme.md` explicitly requires it.

## Continue to Content Design

In Full Mode:

1. Read `_shared/slides/content_design_spec_reference.md`.
2. Read `typst-slides/references/seaslides/references/strategist.md` and shared standards.
3. Complete the nine design decisions.
4. Write `<project_path>/content_design_spec.md`.
5. Continue with image acquisition and execution in `SKILL.md`.

In Quick Mode, skip this section and continue with
`typst-slides/references/seaslides/workflows/quick-mode.md`.

## File Reference

| File | Purpose |
|---|---|
| `_shared/slides/themes/README.md` | Tier dispatch |
| `_shared/slides/themes/<tier>/index.json` | Theme metadata |
| `_shared/slides/themes/user/` | User theme library |
| `<theme>/theme.md` | Theme API |
| `<theme>/demo.typ` | Working example |
| `<theme>/template.typ` | Theme implementation |
| `typst-slides/references/seaslides/references/template-designer.md` | Theme implementation guide |
| `typst-slides/references/seaslides/workflows/quick-mode.md` | Direct authoring without a separate design spec |
