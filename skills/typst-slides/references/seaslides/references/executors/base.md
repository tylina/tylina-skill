# Executor Common Guidelines

> **Canonical reference**: See `shared-standards.md` for all Typst/Touying technical rules, syntax, layout best practices, and font/color standards. This document covers **executor workflow** — do not duplicate what is already defined there.

---

## Contents

- [Template-content separation](#1-template-content-separation-tcs)
- [Touying slide type mapping](#2-touying-074-slide-type-mapping)
- [Design parameter confirmation](#3-design-parameter-confirmation-mandatory-pre-step)
- [Phased batch generation](#4-phased-batch-generation)
- [Third-party packages](#5-third-party-package-reference)
- [Image handling](#6-image-handling)
- [Project structure](#7-project-structure)
- [Quality checklist](#8-quality-checklist)
- [Emergency procedures](#9-emergency-procedures)

## 1. Template-Content Separation (TCS)

> **Full specification**: See `shared-standards.md` §1 for complete TCS rules, examples, and the Plain/Rich/Canvas complexity guide.

**Quick rule**: `template.typ` = theme + styles + components (zero content text). `main.typ` = content + structural layout (no `rgb()`, `block(fill:)`). Structural elements like `grid()`, `cols`, `#v()`, `#text(size:)` are fine in main.typ.

---

## 2. Touying 0.7.4 Slide Type Mapping

### Heading-Driven Slide Structure

| Heading | Effect | Touying Mechanism |
|---------|--------|-------------------|
| `= Section Title` | Creates a **new-section-slide** | Triggers `new-section-slide-fn` |
| `== Slide Title` | Creates a **content slide** | Triggers `slide-fn` (default `slide-level: 2`) |
| `---` | Splits into a **new slide** under same heading | Touying slide-break marker |

### Slide Type Functions

| Slide Type | Function | Usage |
|------------|----------|-------|
| **Title** | `title-slide()` | `#title-slide()` — reads from `config-info(...)` |
| **Section** | `new-section-slide` | Auto-triggered by `= Section Title` |
| **Content** | `slide` | Auto-triggered by `== Slide Title` |
| **Focus** | `focus-slide` | `#focus-slide[Key Message]` |
| **Ending** | `ending-slide` | `#ending-slide[Thank You]` |

### Usage Example

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: my-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(title: [Annual Review], author: [John Smith], date: [Dec 2024]),
)

#title-slide()

= Executive Summary

== Key Highlights
- Revenue increased by 15% YoY
- Market share grew to 25%

= Strategic Outlook

== Next Quarter Goals
- Launch new product line

#focus-slide[Questions?]
#ending-slide[Thank You]
```

> **Anti-pattern**: Do NOT use old-style `#slide[== Title ...]` or `#cover-slide(...)`. Touying 0.7.4 uses `#show: theme.with(...)` + heading-driven slides.

> **Academic override**: Academic-style decks do NOT use `ending-slide` for a "Thank You" page. Instead, keep the final conclusions slide on screen during Q&A. Use `focus-slide` for the final slide if a closing statement is needed. See `academic.md` for details.

---

## 3. Design Parameter Confirmation (Mandatory Pre-Step)

Before generating the first Typst file, confirm these parameters:

| Parameter | Description | Example |
|-----------|-------------|---------|
| **Page Format** | 16:9 or 4:3 | `aspect-ratio: "16-9"` |
| **Color Scheme** | Primary, secondary, accent | `primary: rgb("#003366")` |
| **Typography** | Font families and base size | `font: ("Arial", "Noto Sans CJK SC"), size: 20pt` |
| **Packages Needed** | Charts, boxes, diagrams | `showybox`, `cetz`, `lilaq` |
| **Custom Components** | Cards, callouts, highlights | Per-theme (see `template.typ`) |

### 3.1 Design Consistency (Architecture Advantage)

> seaslides-typst-slides-skill outputs a **single `main.typ`** file. Colors, fonts, and components are defined once in `template.typ` and apply globally — they cannot drift mid-deck regardless of context length. No per-page re-reading of design specs is needed.

**Before generating `main.typ`**, read:
1. `content_design_spec.md` — slide outline, page rhythm tags, image assignments, packages
2. `theme.md` — available slide types, components, color scheme
3. `template.typ` — skim for component function signatures

**Values enforced by the template** (never hardcode in main.typ):
- Colors MUST use `palette.xxx` tokens defined in `template.typ`
- Font families are set in template — never override in main.typ
- Page rhythm tag from `content_design_spec.md` §IV `Page Rhythm` column
- Images MUST reference files listed in `content_design_spec.md` §V

### 3.2 Per-page rhythm discipline

Before writing each slide, look up its `Page Rhythm` tag from `content_design_spec.md` §IV and apply:

| Tag | Layout discipline |
|-----|-------------------|
| `anchor` | Structural page (cover / section / ending). Follow the theme's built-in slide type. |
| `dense` | Information-heavy. Card grids, multi-column layouts, KPI dashboards, tables, charts all permitted. Baseline behavior. |
| `breathing` | Low-density impact page. Favor single visual focus: hero quote, big number, full-bleed image, section transition. Avoid cramming multiple containers into a breathing page. |

> Without rhythm variation, every page risks looking monotonous.

**Missing rhythm info** → default all pages to `dense`.

---

## 4. Phased Batch Generation

### Phase 1: Theme Building (template.typ)

Build the template following the structure in `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-plain/`, `custom-rich/`, or `custom-canvas/`. See `template-designer.md` for the complete theme construction pattern, component implementations, header best practices, and `std.align` vs `align` rules.

> **Working examples**: Use `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-rich/psychology/template.typ` (Rich) or `custom-canvas/guizang-magazine/template.typ` (Canvas) as reference implementations for component structure, palette setup, and slide function patterns. For Canvas with full main.typ examples, see `custom-canvas/sugar-rush/demo.typ` and `custom-canvas/guizang-swiss/`.

Key patterns:
- Use `touying-slide-wrapper` + `touying-slide` for every slide type
- Use `utils.display-current-heading(level: 2)` in headers
- Use `config-common(slide-fn: slide, new-section-slide-fn: new-section-slide)` in theme entry
- Use `lazy-v(1fr)` inside card components for height equalization
- Use `std.align` (not `align`) inside functions that have an `align` parameter

### Phase 2: Content Building (main.typ)

- Write clean Typst markup — headings create slides automatically
- Use `#cols[...][...]` for columns (NOT custom helpers)
- Call template components by their defined names from `template.typ`
- Structural layout (`grid()`, `#v()`, `align()`) is allowed; raw styling (`rgb()`, `block(fill:)`) stays in template

**Complexity**: See `shared-standards.md` §1c for the qualitative Plain/Rich/Canvas definitions. When Canvas is selected, also read `canvas.md` for its layout, image-composition, and quality guidance.

**Rich-Level Discipline** (when Rich complexity is selected):
- Repeated visual patterns should be template components (avoid inline styling duplication)
- Minimize `block(fill: ...)` and inline `rgb("#...")` in main.typ — colors belong in template
- Keep `place()` usage for genuine overlays only
- If slides consistently exceed 80 lines, consider upgrading to Canvas complexity

### Phase 3: Speaker Notes

Add `#speaker-note[...]` after each slide's content. It automatically attaches to the preceding slide.

**Writing rules** (TTS-ready):
- 2–5 natural sentences carrying the page's core message
- Transitions as natural prose in the opening sentence ("Having framed X, let's turn to Y")
- No bracketed markers (`[Transition]`, `[Pause]`) — TTS reads them literally
- No enumerated lists, duration annotations, or meta-commentary
- Numbers: spelled forms when pronunciation is awkward (Chinese: "百分之六十八"; English: digits are fine)
- Single language per deck

**Tone**: Conversational for general, analytical for consulting, pedagogical for academic.

**Example** (Chinese):
```typst
#speaker-note[
  在明确了行业背景之后，我们来看具体的市场格局。当前线上零售集中度持续上升，前三大平台合计份额已经达到百分之六十八，留给新进入者的窗口期不超过十八个月。
]
```

---

## 5. Third-Party Package Reference

> Package versions and import patterns: see `shared-standards.md` §5.

### Content Enhancement Packages

Actively consider these before writing slides — they significantly improve quality over plain text:

| Package | When to Use | Import |
|---------|-------------|--------|
| **mitex** | Any math content: `` #mi(`E=mc^2`) `` inline, `` #mitex(`...`) `` block. Backtick strings only. | `@preview/mitex:0.2.7` |
| **lilaq** | Standard slide/scientific plots or an existing SeaSlides chart template | `@preview/lilaq:0.6.0` |
| **gribouille** | Layered analytical plots with mapped aesthetics, statistics, scales, and themes; read current docs because the API is evolving | `@preview/gribouille:0.6.0` |
| **codly** | Code blocks when zebra-stripe aesthetic is desired (template already styles code by default) | `@preview/codly:1.3.0` |
| **lovelace** | Algorithms / pseudocode | `@preview/lovelace:0.3.1` |
| **cheq** | Checklists / task lists / roadmaps: `- [x]` / `- [ ]` syntax | `@preview/cheq:0.4.0` |
| **merman** | Mermaid flowcharts, Gantt charts, and sequence/state diagrams. Use `` ```mermaid `` blocks with the package's `show-mermaid-blocks` handler. | `@preview/merman:0.1.0` |

### Resource Discovery

| Resource | Path | Contents |
|----------|------|----------|
| **Charts** | `${TYLINA_SKILLS_ROOT}/_shared/charts/index.json` | Chart and infographic component catalog |
| **Packages** | `${TYLINA_SKILLS_ROOT}/_shared/packages/index.json` | Curated package catalog and runnable demos |
| **Icons** | `${TYLINA_SKILLS_ROOT}/_shared/icons/index.json` | Icon packages; use Unicode emoji by default |

> **GATE**: Before implementing ANY chart or diagram: (1) Read `charts/index.json` for the matching type, (2) Read the chart template file for correct API, (3) Verify version matches `shared-standards.md` §5. NEVER write chart code from memory.

---

## 6. Image Handling

> Use every relevant or user-required image. Record why other assets are intentionally excluded instead of forcing them into the deck.

| State | Typst Syntax |
|-------|-------------|
| **Existing** | `#image("assets/photo.png", width: 80%)` |
| **Placeholder** | `#rect(fill: gray.lighten(80%), width: 100%, height: 200pt)[Image: Description]` |
| **Pending** | `// [Pending: Generate image of X]` |

Always specify `width` or `height`. Use relative paths (`assets/images/photo.png`). Use `#place()` for logo/watermark overlays.

**Image distribution review**: Place each image where it has a concrete narrative
job. Avoid accidental clustering caused by batching asset work, but preserve a
deliberate image-led sequence or a mostly text/data deck when the content calls
for it. There is no image-per-slide distribution formula.

> **Layout variety**: Consult `${SKILL_DIR}/references/seaslides/references/image-layout-patterns.md` for the 72-pattern vocabulary. Follow the `Layout Pattern` column from `content_design_spec.md` §V for each image. Avoid defaulting every image to bare left-right split (#2/#3).

---

## 7. Project Structure

```
project/
├── template.typ          # Theme: colors, components, slide functions, entry point
├── main.typ              # Content: all slides using clean Typst markup
└── assets/               # Images and resources
    └── images/
```

---

## 8. Quality Checklist

Before finalizing each phase:

**Structural**:
- [ ] Template-content separation maintained (no raw visual styling in main.typ)
- [ ] All package versions match `shared-standards.md` §5
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] Slide titles use `==`, sections use `=`, title slide uses `#title-slide()`
- [ ] `cols` used for columns (not custom layout wrappers)
- [ ] `config-common(breakable: false)` is set
- [ ] All component function names exist in template.typ (pre-flight verification)

**Typography**:
- [ ] Body text >= 14pt, captions >= 12pt, meta/footnotes >= 10pt (projection readability)
- [ ] Text below 14pt uses weight >= 400 (no light fonts at small sizes)
- [ ] CJK titles sized appropriately (typically 85-90% of equivalent Latin sizes)
- [ ] Colors meet contrast standards (see `shared-standards.md` §4)
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] Content enhancement packages considered: math→mitex, standard charts→lilaq, layered statistical plots→gribouille, Mermaid diagrams→merman, algorithms→lovelace, checklists→cheq

**Images**:
- [ ] Images have explicit dimensions (`width:` or `height:`)
- [ ] Charts reference `${TYLINA_SKILLS_ROOT}/_shared/charts/` for correct API usage
- [ ] Multi-image groups use consistent slot dimensions and framing
- [ ] No thick borders or drop shadows on images (subtle 0.5pt stroke max)
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ

**Content**:
- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] Terminology consistent throughout (same concept = same term, no mid-deck switching)
- [ ] Section page count is balanced (no top-heavy or tail-heavy structure)
- [ ] Title-to-content spacing adequate (no "squished" slides)

**Visual QA**:
- [ ] Render PDF and visually review (compilation success ≠ visual quality)
- [ ] Verify alignment consistency across `place()` compositions

### Layout Diversity

Review repeated layouts in narrative context. Keep a stable structure for comparisons, sequences, and recurring evidence; vary it only when another layout communicates the content more clearly or restores needed emphasis. Use typography weight to clarify hierarchy rather than to satisfy a variety quota.

### Common Mistakes

| Mistake | Correction |
|---------|------------|
| `#cover-slide(...)` or `#slide[== Title ...]` | Use `#title-slide()` and `== Title` headings |
| Wrong showybox version | Use `2.0.4` — check `shared-standards.md` §5 |
| Custom `#two-column()` helper | Use `#cols[...][...]` |
| `rgb("#XXXXXX")` in main.typ | Define colors in template.typ |
| Writing chart code from memory | Read `${TYLINA_SKILLS_ROOT}/_shared/charts/` |
| `align` inside function with `align` parameter | Use `std.align` |

---

## 9. Emergency Procedures

**Compilation Failure**: Check syntax (missing `#`, unmatched brackets), verify import versions, simplify to isolate the issue, rebuild incrementally.

**Content Overflow**: Ensure `config-common(breakable: false)` is set. Reduce content density. Split into multiple slides using `---` or new `==` headings.

**Missing Design Specification**: Use industry color defaults from `shared-standards.md` §4. Default to 16:9, 20pt body, Arial/Noto Sans CJK SC.
