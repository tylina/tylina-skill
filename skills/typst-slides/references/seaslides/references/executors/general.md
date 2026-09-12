# Executor General — Creative Versatile Style

## Contents

- [Role and references](#role-definition)
- [Complexity level](#complexity-level)
- [Layout techniques](#1-layout-techniques-general-style)
- [Visual rhythm and variety](#2-visual-rhythm-and-variety)
- [Template components](#3-template-components)
- [Decorative elements](#4-decorative-elements)
- [Color usage](#5-color-usage-guidelines)
- [Image strategy](#6-image-strategy)
- [Typography](#7-typography-hierarchy)
- [Drawing and diagrams](#8-drawing-and-diagrams)
- [Speaker notes and use cases](#9-speaker-notes-style)
- [Quality checklist](#11-quality-checklist)

## Role Definition

Creative and versatile Typst slide executor, specializing in product introductions, training materials, proposal presentations, marketing campaigns, and other non-consulting scenarios. Emphasizes visual variety, audience engagement, and dynamic layouts while following TCS architecture.

## References

- `base.md` — Common execution guidelines, phased generation workflow, slide type mapping
- `shared-standards.md` — Typst/Touying technical constraints, layout APIs, package versions, font/color standards
- `template-designer.md` — Theme design patterns, component implementations
- `${TYLINA_SKILLS_ROOT}/_shared/packages/index.json` — Additional packages (codly, cheq, tablem, pinit, etc.)
- `${TYLINA_SKILLS_ROOT}/_shared/icons/index.json` — Icon packages; use emoji by default

> **Rule**: All technical standards (APIs, versions, syntax) are defined in those documents. This file covers **General style-specific** guidance only.

---

## Complexity Level

> See `shared-standards.md` §1c for the full Plain/Rich/Canvas comparison table.

General Versatile **defaults to Rich** — rich component compositions, grid layouts on most slides, visual variety.

| Complexity | When to Use |
|------------|-------------|
| **Rich (default)** | Product launches, marketing, proposals, training with visual impact |
| **Canvas** | Magazine editorial, festival posters, highly visual narratives where every page is unique |
| **Plain (override)** | Simple training materials, quick internal presentations |

> When Plain is selected, use a restrained component vocabulary, skip grid layouts unless they clarify the content, and let content breathe with whitespace.
> When Canvas is selected, also read `canvas.md` for the Seven Iron Rules, Canvas-specific layout patterns, image composition guidelines, and the P0-P3 aesthetic quality checklist. Each slide becomes a layout canvas — use `place()` extensively, inline `text(size:, fill:)` for unique per-page composition, but still reference colors via `palette.xxx`. Abstract only what repeats across 2+ slides; inline what's unique. Create a visual rhythm table before writing content.

---

## 1. Layout Techniques (General Style)

> **Layout methods**: See `shared-standards.md` §2 for `#cols`, `grid()`, `lazy-v` rules, `stack()` spacing patterns, and documented theme-specific composer exceptions.

### Layout Decision Rule

Single row of columns → `cols`. Multiple rows → `grid()`. Use `grid()` for 2x2 or 3x2 card grids. Components (stat cards, callout boxes, etc.) are defined per-theme in `template.typ` — use whatever the chosen theme provides.

### Overlay Positioning with `place()`

Use `place()` **only** for overlays — elements that sit on top of other content (watermarks, floating labels, background images). It removes the element from normal flow. If content should flow naturally, use `cols` or `stack` instead.

---

## 2. Visual Rhythm and Variety

### Slide Layout Variation

Create visual interest by varying layout patterns when the content role changes:

| Technique | Description |
|-----------|-------------|
| **Content-driven layouts** | Switch among full-width, split columns, and card grids when their information structures fit |
| **Color Accent** | Use accent color strategically for key terms, stat cards, CTA buttons |
| **Size Variation** | Large numbers in stat cards, small captions |
| **Spacing Variation** | Tight card clusters vs. open hero slides |

### Rhythm Pattern

Alternate layout styles to maintain visual interest. Avoid long runs of identical layouts.

---

## 3. Template Components

> **Component implementations**: See `template-designer.md` for full code definitions and design guidelines (width: 100%, lazy-v, clip, accent parameter).

Each theme defines its own component functions in `template.typ`. Use whatever the theme provides — do not prescribe specific component names across all themes. Common categories include: callout boxes, data cards, highlight banners, and status indicators.

---

## 4. Decorative Elements

Use shapes inside component functions in template.typ, not directly in main.typ: accent bars, circles for icon backgrounds, `line()` for dividers, rounded content blocks.

> **showybox**: Use `showybox(title: ..., frame: (...))[content]` API (version 2.0.4). There is NO `.box()`, `.warning-box()`, or `.success-box()`. For simple callouts, define your own component functions instead.

---

## 5. Color Usage Guidelines

> **60-30-10 rule and contrast requirements**: See `shared-standards.md` §4.

**General-specific note**: All colors are defined as named variables in `template.typ`. In main.typ, avoid inline `rgb(...)` — use component functions that handle colors internally. Use `.lighten()` / `.darken()` variations instead of adding new colors.

---

## 6. Image Strategy

> Image states and Typst syntax: see `base.md` §6.

| Image Type | Layout | Sizing |
|------------|--------|--------|
| **Hero Images** | Full background via `place()` in slide function | `width: 100%` |
| **Product Images** | Centered or in `cols` column | `width: 60%` to `80%` |
| **Team Photos** | `grid()` for uniform multi-row sizing | Equal dimensions |
| **Screenshots** | Inside card component with border | `width: 100%` within card |
| **Icons/Logos** | `place()` for overlays, or inline | `width: 40pt` to `80pt` |

---

## 7. Typography Hierarchy

> See `shared-standards.md` §3. Define sizes/weights in template.typ via component functions. Do not set font sizes inline in main.typ.

---

## 8. Drawing and Diagrams

> **GATE**: Before writing ANY chart or diagram code, read the matching template from `${TYLINA_SKILLS_ROOT}/_shared/charts/`. See `charts/README.md` for the full chart index, need-based package dispatch (including lilaq, gribouille, primaviz, and merman), API examples, and layout best practices.

**Key rules**: cetz uses numeric coordinates only (NOT percentages). fletcher uses `node((col, row), [...])` + `edge(...)`. All chart code goes in template.typ or inline per charts/README.md patterns.

---

## 9. Speaker Notes Style

### Narrative Tone

General-style presentations use a **conversational, story-driven** speaking style: enthusiastic, audience-focused, rhetorical questions, personal anecdotes.

### Writing Guidelines

- Use active voice and present tense
- Ask rhetorical questions to engage
- Use simple, conversational language
- Don't read slides verbatim — expand and contextualize
- Maintain energy throughout
- Weave transitions naturally into prose ("Having explored X, let's turn to Y") instead of bracketed markers
- Do NOT include bracketed markers (`[Pause]`, `[Transition]`, etc.) — TTS engines read them literally

---

## 10. Common Use Cases

Product launches, training materials, proposals, and marketing campaigns. Structure the deck to match the content's narrative needs — no fixed template applies universally.

---

## 11. Quality Checklist

> **Common checks**: See `base.md` §8 for the full shared checklist.

**General-specific checks**:
- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ
- [ ] `grid()` used only for multi-row layouts where `cols` is insufficient
- [ ] Repeated layouts are intentional; variation supports content hierarchy rather than a quota
- [ ] Visual rhythm is controlled and intentional
- [ ] Card components include `#lazy-v(1fr)` for height equalization
- [ ] `showybox` uses correct 2.0.4 API (not `.box()`, `.warning-box()`, etc.)
- [ ] `cetz` uses numeric coordinates (not percentages)
- [ ] `---` used only for intentional slide breaks
- [ ] Color scheme is consistent (60-30-10 rule)
- [ ] Speaker notes are engaging and conversational
- [ ] Call to action is clear and compelling
