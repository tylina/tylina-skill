---
description: Generate a new Touying theme template based on design specifications
---

# Create New Touying Theme Workflow

> **Role invoked**: [Template_Designer](../references/template-designer.md)

Generate a complete Touying theme. Works in the project directory, with optional save to the user template library.

## Contents

- [Process Overview](#process-overview)
- [Gather Template Information](#step-1-gather-template-information)
- [Create Theme Working Directory](#step-2-create-theme-working-directory)
- [Invoke Template Designer](#step-3-invoke-templatedesigner-role)
- [Compile and Validate](#step-4-compile--validate)
- [Save to User Theme Library](#step-5-save-to-user-theme-library-optional)
- [Output Confirmation](#step-6-output-confirmation)
- [Color Scheme Quick Reference](#color-scheme-quick-reference)

## Process Overview

```
Gather Info -> Create in Project -> Invoke Template_Designer -> Compile & Validate -> Save to User Library?
```

---

## Step 1: Gather Template Information

Confirm the following with the user:

| Item | Required | Description |
|------|----------|-------------|
| Template name | Yes | English identifier (lowercase, hyphen-separated), e.g., `corporate-blue` |
| Display name | Yes | Human-readable name for documentation, e.g., "Corporate Blue" |
| Primary color | Yes | Primary HEX value, e.g., `#1565C0` |
| Style description | Yes | Design tone in 3-8 words, e.g., "Modern, data-driven, corporate" |
| Best for | Yes | Target use cases, e.g., "Business reports, investor presentations" |
| Recommended complexity | Yes | `plain`, `rich`, or `canvas` |
| Reference source | Optional | Existing project or template path to base design on |
| Secondary color | Optional | Secondary/accent HEX value |
| Target audience | Optional | Who will use this theme |
| Special features | Optional | Notable components (e.g., "kpi-card, takeaway-box, data-table") |

> **Color tone hint**: Light backgrounds work better for projection and printing. Dark themes are great too — just don't default to dark when the topic has no particular reason for it.

---

## Step 2: Resolve the Theme Working Set

Call `workspace.info` and create theme files inside that current workspace, never directly
in the packaged template library.

Theme files (`template.typ`, `demo.typ`, `theme.md`, `theme_design_spec.md`) go in the current root.
Tylina always provides the project boundary; never call `project_manager.py init` or create a
`projects/...` child. When final deck content already exists, preserve it and keep `demo.typ` as a
separate theme gallery.

---

## Step 3: Invoke Template_Designer Role

**Switch to the Template_Designer role** and generate in `<project_path>/`:

1. **theme_design_spec.md** -- Visual design specification (from `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_design_spec_reference.md`)
2. **template.typ** -- Complete Touying 0.7.4 theme file with:
   - Theme entry point function (wraps `touying-slides.with(config-*(...))`)
   - `title-slide` function
   - `new-section-slide` function (auto-triggered on `= Heading`)
   - `slide` function (default content slides, registered via `config-common(slide-fn: slide)`)
   - `focus-slide` function
   - `ending-slide` function
   - Reusable component functions (info-card, two-column, etc.)
3. **demo.typ** -- Compilable usage example showcasing all slide types and components
4. **theme.md** -- API summary document (from `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_reference.md`)

**Demo vs final deck boundary**:

- `demo.typ` is only the theme usage gallery.
- `main.typ` is the final generated deck whenever the project contains real user/source content.
- If real deck content was accidentally authored in `demo.typ`, migrate or duplicate it into `main.typ` before final compilation and validation.
- Pure theme creation tasks may validate only `demo.typ`; benchmark or delivery projects must compile `main.typ` as the final artifact.

> **Role details**: See [template-designer.md](../references/template-designer.md)

---

## Step 4: Compile & Validate

```bash
# Produce PDF, per-slide PNGs, overview, and their compile manifest
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project_path> --all --entry demo.typ --ppi 144

# Audit the compiled artifacts and source-level layout risks
python3 ${SKILL_DIR}/scripts/typst_quality_checker.py <project_path> --entry demo.typ

# When the intended demo length is known, also verify it explicitly
python3 ${SKILL_DIR}/scripts/typst_quality_checker.py <project_path> --entry demo.typ --expected-pages <N>
```

Inspect **every** generated slide PNG at native resolution; use the overview only
for triage. Fix issues, recompile, and inspect the affected slides again. The
quality checker must report no blockers, and every review signal must be examined
and either fixed or documented as an intentional exception. Positive stack
spacing is contextual and must be checked directly in the render. KPI/stat/metric
icon → value → label composition must also be checked in
source and render; the checker deliberately does not infer KPI semantics from
function names. Zero-gap stack findings are advisory, but still require a
rendered disposition proving a deliberate seamless join.

When the project also contains a final deck, compile it after the demo:

```bash
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project_path> --all --entry main.typ
```

**Checklist**:

- [ ] `theme_design_spec.md` contains complete visual design specification
- [ ] `template.typ` compiles without errors
- [ ] Theme entry point uses `touying-slides.with(config-*(...))` pattern (NOT old `register`/`states` API)
- [ ] All slide types (title, section, content, focus, ending) render correctly
- [ ] Template-content separation principles are followed
- [ ] No content text hardcoded in template.typ
- [ ] `theme.md` API summary follows `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_reference.md` format
- [ ] `demo.typ` showcases every component defined in `template.typ` at least once
- [ ] `demo.typ` uses every slide type (title, section, content, focus, ending, plus custom types)
- [ ] If this is a delivery/benchmark project, `main.typ` exists and contains the final deck content; `demo.typ` is not the only real deck file
- [ ] Complete caller-side components remain direct natural flow; no fixed `v()` or wrapper `stack()` is added merely for routine separation
- [ ] Headers and KPI groups use `stack(spacing: .8em)` or larger; other ordinary content groups start near `.8em` and are tuned in the render; smaller positive spacing is reserved for genuinely compact labels, marks, badges, or coupled primitives; any `stack(spacing: 0pt)` is a documented seamless join
- [ ] Stat/KPI/metric cards use one centered vertical `stack` for icon → value → label and contain no internal `v()` spacer; tune the stack spacing from `.8em` upward to fit the actual typography
- [ ] Use `cols` for ordinary one-row columns and `grid` for matrices or multi-row alignment; use `cols(lazy-layout: true)` only for height equalization with exactly one direct stretchable component per column, and keep that component's terminal `lazy-v(1fr)` because it is inert when lazy layout is off
- [ ] No thin layout helper merely renames or forwards `cols`/`grid` (for example, `column-layout`); call the native primitive at the use site unless the helper adds real theme semantics
- [ ] Frame borders use `place(center + horizon, rect(width: 96%, height: 94%...))` not hardcoded positions
- [ ] Focus-slide text is width-constrained (won't overflow horizontally)
- [ ] Adjacent blocks that intentionally form one seamless shape may use `stack(spacing: 0pt)` with `clip: true`; unrelated content regions do not
- [ ] Theme has a clear aesthetic metaphor — components named from theme's world, not generic
- [ ] `demo.typ` demonstrates layouts appropriate to the content relationships instead of forcing every example into the same card grid
- [ ] Every generated `slide-*.png` has been inspected at native resolution for overflow, clipping, collisions, crowding, weak hierarchy, and unintended empty space

**Aesthetic Impact Validation** (use judgment; do not add filler to satisfy a quota):

- [ ] **Visual Signature Test**: With the text ignored, the theme is still recognizable when its metaphor calls for a strong visual world; decoration remains restrained when typography and whitespace are the intended identity
- [ ] Decorative assets have a clear metaphorical or compositional job; none exist only to meet a count
- [ ] SVG complexity is only as high as needed for a legible silhouette, depth, and reliable rendering at its actual display size
- [ ] Components with different information relationships do not all collapse into the same card-with-border treatment; repeated structure is retained when it communicates comparability
- [ ] Title and ending slides form a deliberate bookend when that supports the concept, without forcing a full-page asset into every theme
- [ ] Any memorable visual detail improves recognition or communication; a contrived "wow moment" is not required

---

## Step 5: Save to User Theme Library (Optional)

After validation, the four theme files are ready in the project directory.

### Option A: Keep theme in project only (default)

Theme stays in the current project directory. Usable for this project only. No further action needed.

### Option B: Save to user theme library for reuse

> **YOLO mode**: Default to Option A. Only save to `user/` if the user explicitly asks.

For non-YOLO mode:

> This is a **BLOCKING** step. Present the following to the user and wait for confirmation:
>
> "Theme `<template_name>` is ready. Would you like to save it to the user theme library (`${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>/`) for reuse in future projects?"

If the user confirms, copy the four required files:

```bash
mkdir -p "${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>"
cp <project_path>/theme_design_spec.md "${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>/"
cp <project_path>/template.typ "${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>/"
cp <project_path>/demo.typ "${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>/"
cp <project_path>/theme.md "${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>/"
```

If the theme uses asset files (e.g., images referenced by `template.typ`), copy those too.

> **Important**: User themes are **NOT** registered in any `index.json`. They are discovered by scanning the `user/` directory on disk. This avoids git merge conflicts when the skill is updated.

---

## Step 6: Output Confirmation

```markdown
## Theme Creation Complete

**Theme Name**: <template_name> (<display_name>)
**Location**: `<project_path>/`
**Saved to library**: [Yes → `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/<template_name>/` | No]

### Files

| File | Status |
|------|--------|
| `theme_design_spec.md` | Done |
| `template.typ` | Done |
| `demo.typ` | Done |
| `theme.md` | Done |
```

---

## Color Scheme Quick Reference

| Style | Primary Color | Use Cases |
|-------|--------------|----------|
| Corporate Blue | `#003366` | Finance, consulting, enterprise |
| Tech Blue | `#1565C0` | Technology, startups, SaaS |
| Nature Green | `#2E7D32` | Healthcare, sustainability, education |
| Elegant Purple | `#6A1B9A` | Creative, luxury, design |
| Warm Orange | `#E65100` | Marketing, food, entertainment |
| Government Red | `#C41E3A` | Government, public sector |
