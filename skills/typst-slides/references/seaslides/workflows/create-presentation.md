---
description: Generate Full Mode presentation content (main.typ) from a design spec and theme
---

# Create Presentation Content Workflow

Use this workflow in Full Mode. For direct authoring without a separate design specification,
follow `${SKILL_DIR}/references/seaslides/workflows/quick-mode.md` instead.

> **Role invoked**: Executor (see `executors/base.md` + complexity-specific executor)

Generate the content file (`main.typ`) for a Touying presentation. This workflow is the content-generation counterpart to `create-template.md` (which generates the theme).

## Contents

- [Trigger Condition](#trigger-condition)
- [Process Overview](#process-overview)
- [Read Design Specifications](#step-1-read-design-specifications)
- [Determine Complexity Level](#step-2-determine-complexity-level)
- [Generate main.typ](#step-3-generate-maintyp)
- [Add Speaker Notes](#step-4-add-speaker-notes)
- [Compile and Review](#step-5-compile--review)
- [Notes](#notes)

## Trigger Condition

Called when:
- A `template.typ` already exists (either custom-built or selected from the theme library)
- A `content_design_spec.md` exists with the slide outline and content plan

## Process Overview

```
Read Specs → Determine Complexity → Generate main.typ → Add Speaker Notes → Compile & Review
```

---

## Step 1: Read Design Specifications

Read the following files in order:

1. **`content_design_spec.md`** — Full design specification (slide outline, content per page, image assignments, page rhythm, packages)
2. **`theme.md`** — Theme API reference (available slide types, components, color scheme, presets)
3. **`template.typ`** — Skim for available component function signatures

---

## Step 2: Determine Complexity Level

Check `content_design_spec.md` §I for the declared complexity level:

| Level | Executor Reference | Authoring profile |
|-------|-------------------|-------------------|
| **Plain** | `executors/base.md` only | Direct use of the selected theme's standard slide API |
| **Rich** | `executors/base.md` + `executors/general.md` or `executors/consultant.md` | Reusable components and more varied theme-supported layouts |
| **Canvas** | `executors/base.md` + `executors/canvas.md` | Deliberate page-level composition when the task and compile probe justify it |

For Canvas: also read `canvas.md` for the layout patterns, dark/light rhythm, and aesthetic checklist.

---

## Step 3: Generate main.typ

### 3.1 File Header

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Primary Font", "CJK Font"), size: 20pt)

#show: theme-entry.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [...],
    subtitle: [...],
    author: [...],
    date: datetime.today(),
    institution: [...],
  ),
)
```

### 3.2 Content Generation

Follow the slide outline from `content_design_spec.md` §VII page-by-page:

1. **Check page rhythm tag** from `content_design_spec.md` §IV (anchor / dense / breathing)
2. **Select layout pattern** appropriate to the rhythm and content type
3. **Use theme components** — call functions from `template.typ` rather than building inline
4. **Reference `palette.xxx`** for all colors — zero inline `rgb("#...")`

### 3.3 Image Integration

- Use images listed in `content_design_spec.md` §V
- Follow the `Layout pattern` column for each image
- For pending images: use `// [Pending: Generate image of X]` placeholder
- Consult `image-layout-patterns.md` for the 72-pattern vocabulary

---

## Step 4: Add Speaker Notes

Add `#speaker-note[...]` on each slide following the rules in `base.md` §4 Phase 3:

- 2-5 natural sentences per slide
- TTS-ready (no bracketed markers, no meta-commentary)
- Tone matches the style objective (conversational / analytical / pedagogical)

---

## Step 5: Compile & Review

```bash
# Compile to PDF
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project_path> --format pdf --entry <entry.typ>

# Compile to PNG for visual review
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project_path> --format png --ppi 144 --entry <entry.typ>

# Generate overview for LLM self-review
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project_path> --format overview --entry <entry.typ>
```

### Visual Review Checklist

- [ ] All slides compile without errors
- [ ] No content overflow (text cut off or spilling)
- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] Color contrast meets WCAG AA (4.5:1 normal text, 3:1 large text)
- [ ] Dark/light page rhythm matches `content_design_spec.md` §IV Page Rhythm column
- [ ] Images render at correct size and position
- [ ] Repeated layouts are intentional and support comparison or sequence
- [ ] Font sizes follow the hierarchy (display > H1 > H2 > body > small > tiny)
- [ ] Template-content separation maintained (no `rgb()` or `block(fill:)` in main.typ for Plain/Rich)

---

## Notes

- This workflow generates `main.typ` only — `template.typ` should already exist
- For new themes, run `create-template.md` first
- For existing themes from the library, the theme files are already available
- Speaker notes are required for TTS audio generation via `notes_to_audio.py`
