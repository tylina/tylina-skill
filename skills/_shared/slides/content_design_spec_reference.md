# {project_name} - Content Design Specification

> **Purpose**: Content-focused design spec for planning the slide-by-slide outline of a presentation. Used in **all three flows** after a theme is selected or created. The Executor reads this to implement `main.typ`.
>
> **Not for theme design** — visual theme specs (colors, typography, components) go in `theme_design_spec.md` (see `theme_design_spec_reference.md`).

> **Completeness, not length**: Record enough source-grounded decisions for the
> Executor to implement each slide without guessing. Do not target a character
> count or add filler to make the specification look substantial.

## Contents

- [Project Information](#i-project-information)
- [Theme Selection](#ii-theme-selection)
- [Third-party Packages](#iii-third-party-packages)
- [Narrative Architecture](#iv-a-narrative-architecture)
- [Content Outline](#iv-content-outline)
- [Typography Ratio System](#iv-b-typography-ratio-system)
- [Layout Pattern Library](#iv-c-layout-pattern-library)
- [Image Resource List](#v-image-resource-list)
- [Charts and Diagrams](#vi-chart--diagram-list-if-applicable)
- [Speaker Notes and Companion Files](#vii-speaker-notes-if-applicable)
- [Completeness Requirements](#ix-spec-completeness-requirements-and-review-heuristics)
- [Technical Constraints](#x-technical-constraints-reminder)

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Project Name** | {project_name} |
| **Page Format** | {format_name} ({dimensions}) |
| **Page Count** | [Filled by Strategist] |
| **Style Objective** | [A) General Versatile / B) Consulting / C) MBB Consulting / D) Academic] |
| **Complexity Level** | [Plain / Rich / Canvas] |
| **Target Audience** | [Filled by Strategist] |
| **Use Case** | [Filled by Strategist] |
| **Created Date** | {date_str} |

### Complexity Guide

| Level | main.typ Character | Typical For | When to Use |
|-------|-------------------|-------------|-------------|
| **Plain** | Typography- and content-driven, with minimal components and restrained composition. | Minimal requests, academic talks, group meetings, seminars | When restraint supports the task or the user requests it |
| **Rich** | Component-driven composition using grids, cards, charts, and reusable structures where useful. | Consulting decks, reports, product launches, general presentations | Dependable default when richer structure helps |
| **Canvas** | Bespoke free-form composition using Typst primitives and semantic palette values. | Editorial, creative, portfolio, and visual-narrative work | When bespoke composition materially helps and capability checks pass |

> Complexity describes the authoring approach and rendered result, not source line count or a mandatory number of components.

## II. Theme Selection

| Property | Value |
| -------- | ----- |
| **Theme Source** | [builtin / universe / custom-plain / custom-rich / custom-canvas / user] |
| **Theme Name** | [e.g., corporate, nordic, metropolis] |
| **Theme Doc** | [e.g., `custom-rich/corporate/theme.md`] |
| **Entry Function** | [e.g., `corporate-theme`] |
| **Template File** | [e.g., `template.typ` — copied from custom, or `themes.metropolis` for builtin] |

> Read the theme's `theme.md` for available slide types, reusable components, and color scheme. The content outline below should use components available in the chosen theme.

## III. Third-party Packages

| Package | Version | Import | Purpose |
| ------- | ------- | ------ | ------- |
| touying | 0.7.4 | `@preview/touying:0.7.4` | Slide framework (required) |
| lilaq | 0.6.0 | `@preview/lilaq:0.6.0` | Statistical charts — preferred for bar, line, scatter |
| gribouille | 0.6.0 | `@preview/gribouille:0.6.0` | Layered Grammar-of-Graphics plots; pin version and consult current docs |
| mitex | 0.2.7 | `@preview/mitex:0.2.7` | LaTeX math equation conversion |
| codly | 1.3.0 | `@preview/codly:1.3.0` | Code blocks with zebra stripes, line numbers, icons (optional — template already styles code by default) |
| lovelace | 0.3.1 | `@preview/lovelace:0.3.1` | Pseudocode / algorithm typesetting |
| cheq | 0.4.0 | `@preview/cheq:0.4.0` | Checklists with [x], [ ], [/], [-] syntax |
| cetz | 0.5.2 | `@preview/cetz:0.5.2` | Custom charts and diagrams |
| cetz-plot | 0.1.4 | `@preview/cetz-plot:0.1.4` | Data plotting (bar, line, etc.) |
| primaviz | 0.8.0 | `@preview/primaviz:0.8.0` | Pie, donut, radar, funnel charts |
| fletcher | 0.5.8 | `@preview/fletcher:0.5.8` | Flowcharts and diagrams |
| merman | 0.1.0 | `@preview/merman:0.1.0` | Mermaid diagrams rendered to SVG during Typst compilation |
| showybox | 2.0.4 | `@preview/showybox:2.0.4` | Decorated content boxes |
| gentle-clues | 1.3.1 | `@preview/gentle-clues:1.3.1` | Admonition boxes |
| numbly | 0.1.0 | `@preview/numbly:0.1.0` | Custom heading numbering |

> Only include packages actually needed. touying is always required. Reference `${SKILL_DIR}/templates/packages/index.json` for more options.
>
> **Content-driven package selection**: Scan source material — math formulas → mitex; standard plots and existing chart templates → lilaq; layered mapped-aesthetic/statistical plots → gribouille; code snippets → use code blocks directly (codly only for zebra stripes); algorithms → lovelace; task lists → cheq; Mermaid flowcharts/Gantt/sequence diagrams → merman. These are high-impact and should be actively considered for matching content.
>
> **Package dispatch**: Prefer lilaq for standard statistical charts and existing templates; use gribouille when a layered Grammar of Graphics fits; use primaviz for specialized chart types (pie, radar, funnel); use merman for Mermaid diagrams; fall back to cetz/fletcher for custom visuals. This is need-based routing, not a universal quality ranking.

> **Icons**: Default to Unicode emoji (🚀, ✓, 📊 — LLMs can output these directly). For visually consistent non-emoji icons (e.g., user explicitly requests icon-style visuals), see `${SKILL_DIR}/templates/icons/index.json`.

## IV-A. Narrative Architecture

### Narrative Arc

> Select one: **A** (Hook/Context/Core/Shift/Takeaway) / **B** (SCQA) / **C** (Pyramid Principle)
> See `strategist.md` §2a for full framework descriptions.

**Selected arc**: [A / B / C]

### Audience Knowledge Gap

| Question | Answer |
|---|---|
| What does the audience **already know**? | [filled by strategist] |
| What is the **one thing** they must know after? | [filled by strategist] |
| What **misconception** might they hold? | [filled by strategist] |
| What **action** should they take? | [filled by strategist] |

### Ghost Deck Test

> Read the slide titles below in sequence. They must tell the complete argument without body content.

### Design Principles (if applicable)

| # | Principle |
|---|-----------|
| 1 | [e.g., Conclusion-first titles (pyramid principle)] |
| 2 | [e.g., Data always contextualized — never present numbers alone] |
| 3 | [e.g., Dark pages for impact, light pages for detail] |

### Visual Direction

| Item | Decision |
|---|---|
| **Visual Premise** | [how the visual language reinforces the core message] |
| **Cross-Page Continuity** | [recurring cue(s), planned transition/reset points, and why] |
| **Image Treatment** | [dominant framing, crop, caption/source approach; theme owns concrete chrome] |
| **Typography Delivery Plan** | [language, delivery medium, and theme/project-local type decisions] |
| **Optional Crop-Safe Background** | [local asset, focal point, safe regions, contrast plan, or none] |

> **Optional P/M/A/C vocabulary**: Note only dimensions that help execution: Primary Structure (page skeleton), Modifier Layers (crop/tone/frame/depth), Asset-Dependent Treatments (prepared composite/cutout/baked effect), and Cross-Page Continuity (matched framing or persistent visual state). These are free-form planning cues, not IDs or required coverage.

## IV. Content Outline

| Page # | Slide Type | Title | Narrative Fn | Visual Rhythm | Page Rhythm | Key Content | Layout Notes |
|--------|------------|-------|-------------|---------------|-------------|-------------|--------------|
| 1 | title-slide | [title] | hook | hero-dark | anchor | subtitle, author, date, institution | Full-bleed cover |
| 2 | new-section-slide | [section] | breathe | hero-dark | anchor | | Auto from `= Section` |
| 3–N | slide | [titles] | build/prove | content-light | dense | bullet points, components | [layout hints] |
| N+1 | ending-slide | Thank You | resolve | content-light | anchor | contact info | Closing slide |

> **Narrative Function values**: `hook`, `ground`, `build`, `pivot`, `prove`, `resolve`, `breathe` — see `strategist.md` §2a Step 3.
>
> **Visual Rhythm values**: `hero-dark`, `hero-light`, `content-light`, `content-dark` — narrative function drives this choice.
>
> **Page Rhythm** (layout density guide for the Executor):
> - `anchor` — Structural page (cover, section divider, ending). Follow the theme's built-in slide type.
> - `dense` — Information-heavy. Card grids, multi-column layouts, tables, charts all permitted.
> - `breathing` — Low-density impact page. No multi-card grids; use single emphasis elements, whitespace, full-bleed imagery. Typical: hero quote, big number, section transition.
>
> **Slide types** map to Touying functions: `title-slide`, `slide` (content), `new-section-slide` (auto from `= Heading`), `focus-slide`, `ending-slide`. The exact function names depend on the chosen theme — check `theme.md`.
>
> For each content slide, include enough detail for the Executor to implement without re-reading the source: title, 3–5 bullet points, chart/component hints, and layout pattern (single column, cols, card grid, etc.).
>
> **Layout pattern hints**:
> - `single` — Default single-column text flow
> - `cols` — Two-column via `#cols[...][...]`
> - `card-grid` — Multiple cards via `#cols(columns: (1fr, 1fr, ...))[...][...]`
> - `stat-row` — Key metrics row via `#stat-row(...)` (if available in theme)
> - `table` — Data table via `#data-table(...)` or standard `#table(...)`

### Per-Slide Detail Format (Required for Rich/Canvas, 8+ slides)

> For Rich and Canvas complexity decks, expand each content slide into a detailed subsection AFTER the summary table. This ensures the Executor has enough detail to implement each slide without re-reading source materials.

#### Slide {N} — {Title}

| Property | Value |
|----------|-------|
| **Slide Type** | [content / focus / dark / ending / custom] |
| **Layout Treatment** | [free-form arrangement; use documented theme components and optional catalog shorthand where helpful] |
| **Narrative Function** | [hook / ground / build / pivot / prove / resolve / breathe] |
| **Visual Rhythm** | [hero-dark / hero-light / content-light / content-dark] |
| **Page Rhythm** | [anchor / dense / breathing] |
| **Components Used** | [list specific theme components: kpi-card, insight-box, etc.] |
| **Image** | [filename or "none"] |
| **Image Framing** | [target slot ratio and fit; crop permission/safe area/focal point; theme-supported padding/alignment/frame treatment; caption/source or none] |
| **Source / Citation** | [source reference or none] |

**Content**:
- [3-5 bullet points of actual content for this slide]
- [Include data points, quotes, or key facts]

**Layout Notes**:
- [How components are arranged: "4x kpi-card in 2x2 grid, insight-box below"]
- [Column ratios if applicable: "Left 3fr: text content, Right 2fr: image"]

## IV-B. Typography Ratio System

> Specify font sizes as ratios to the body baseline. This ensures proportional hierarchy regardless of base size.

| Role | Ratio | Example (base=20pt) | Example (base=16pt) | Weight |
|------|-------|---------------------|---------------------|--------|
| Cover title | 3.0-3.5x | 60-70pt | 48-56pt | Bold |
| Section title | 1.6-2.0x | 32-40pt | 26-32pt | Bold |
| Slide title | 1.3-1.5x | 26-30pt | 21-24pt | SemiBold |
| **Body (baseline)** | **1.0x** | **20pt** | **16pt** | Regular |
| Caption/label | 0.7-0.8x | 14-16pt | 11-13pt | Regular |
| Footnote | 0.5-0.6x | 10-12pt | 8-10pt | Regular |

> **Base size selection**: Rich → 18-20pt. Canvas → 16-18pt (more content per slide). Plain → 20-22pt (less content, larger text). These are planning ranges, not overrides for a selected theme's documented typography; Swiss-style sharpness or compactness does not create a universal font-size threshold.

## IV-C. Layout Pattern Library

> Use this library as optional vocabulary for the "Layout Treatment" field in the per-slide detail. Each entry describes a visual structure; it is not a required ID or a fixed implementation.

| Pattern ID | Name | Structure | Best For |
|-----------|------|-----------|----------|
| `single` | Single column | Full-width text flow | Text-heavy explanation slides |
| `cols` | Two-column split | `#cols[...][...]` | Comparison, text+image |
| `cols-asym` | Asymmetric split | `#cols(columns: (3fr, 2fr))[...][...]` | Text + supporting visual |
| `card-grid-2` | Two-card row | `#cols(columns: (1fr, 1fr))` | Side-by-side concepts |
| `card-grid-3` | Three-card row | `#cols(columns: (1fr, 1fr, 1fr))` | Feature comparison |
| `card-grid-4` | Four-card row (2x2) | `#grid(columns: (1fr, 1fr))` with 4 items | KPI dashboard |
| `stat-row` | Metric strip | 3-4 stat/KPI cards in a row | Key numbers highlight |
| `table` | Data table | `#data-table(...)` | Structured data |
| `full-bleed` | Full-bleed image | `config-page(background: image(...))` | Hero/impact slides |
| `stacked` | Vertical stack | `#stack(spacing: 12pt, ...)` | Sequential items |
| `timeline` | Timeline/steps | Numbered cards or chevron | Process flows |

## V. Image Resource List

**Style Anchor**: [filled by strategist — one of: `editorial-photo`, `flat-vector`, `ink-sketch`, `3d-render`, `abstract-geometric`, `data-viz`, `watercolor`, `collage-editorial`]

| Filename | Purpose | Image Type | Text Policy | Acquire Via | Status | Intended Slides | Framing / Crop Safety | Alt Text / Caption / Source | Description |
|----------|---------|------------|-------------|-------------|--------|-----------------|-----------------------|-----------------------------|-------------|
| [filled by strategist] | | background / hero / side-illustration / diagram / grid-asset / cinematic-band / decorative | none / embedded | ai / web / user / placeholder | pending-generation / ready | [page numbers] | slot ratio, contain/cover, crop permission, focal point, safe region, theme treatment | [text or none] | |

> **Style Anchor**: Deck-wide visual rendering style. All AI-generated images share this anchor for cohesion. See `image-generator.md` §1 for descriptions.

> **Image Type values**: `background` (16:9, calm center), `hero` (16:9/3:2, subject fills frame), `side-illustration` (4:3/3:2), `diagram` (4:3/16:9), `grid-asset` (1:1), `cinematic-band` (21:9), `decorative` (1:1). See `image-generator.md` §2 for aspect ratios and composition requirements.

> **Text Policy**: `none` (default — no text in image, overlaid via Typst) or `embedded` (designed typography is integral to the image composition). Always prefer `none` for readability and theme consistency.

> **Layout treatment**: Describe the intended treatment in the per-slide detail (for example, comparison, contextual background, or captioned evidence). Entries from `image-layout-patterns.md` may be optional shorthand, but are not required IDs and do not determine image meaning.

> **Framing / Crop Safety**: Preserve screenshot pixels and UI details by default. Choose the target slot ratio first, then record fit, crop permission, crop-safe area, focal point, and any theme-supported background, padding, inset, shadow, corners, or alignment. Use `contain` for legibility-sensitive UI, diagrams, and terminal evidence; use `cover` only for an approved crop that preserves required evidence. Redesign a screenshot only when the source cannot remain legible in the required slot.

> **Alt Text / Caption / Source**: Give each image useful alt text. Add a concise visible caption and truthful source when interpretation needs it; never fabricate attribution, product chrome, or device hardware.

> **Acquire Via**: `ai` (generate with image_gen.py), `web` (search with image_search.py), `user` (provided by user), `placeholder` (to be replaced later). See `image-base.md` for dispatch logic.

> **Status values**: `ready`, `pending-generation`, `pending-review`

## VI. Chart & Diagram List (if applicable)

| Slide # | Chart Type | Package | Data Source | Notes |
|---------|-----------|---------|-------------|-------|
| [filled by strategist] | bar / line / pie / flowchart / tree | cetz / cetz-plot / fletcher | [data description] | |

> Reference `${SKILL_DIR}/templates/charts/index.json` for available chart component templates.

> **Map extension**: Add a map only when geography, movement, or location comparison is necessary to the narrative. It is not a required chart or diagram type.

## VII. Speaker Notes (if applicable)

Speaker notes are written inline in `main.typ` using `#speaker-note[...]` — NOT in a separate file.

| Style | Tone Guidelines |
|-------|----------------|
| General | Conversational, audience-focused, narrative flow |
| Consulting | Analytical, data-referencing, action-oriented |
| MBB Consulting | Executive-level, concise, recommendation-driven |
| Academic | Pedagogical, evidence-citing, question-inviting |

> In the Content Outline (Section IV), use the "Layout Notes" column to flag which slides need speaker notes.

---

## VIII. Companion Files

| File | Purpose | Generated By |
|------|---------|-------------|
| `content_design_spec.md` | This document — the single source of truth for content planning | Strategist |
| `theme.md` | Theme API reference (slide types, components, color scheme) | Theme library or custom |
| `template.typ` | Theme implementation (colors, fonts, components in code) | Strategist / template-designer |

---

## File Structure

```
{project_name}/
├── main.typ                # Content + structural layout — slides, text, component calls
├── template.typ            # Theme — styles, colors, layout components, slide functions
├── content_design_spec.md  # This specification document
├── assets/                 # Images and generated assets
│   ├── *.png/jpg           # Image files
│   └── image_prompts.md    # AI image generation prompts (if applicable)
└── output/                 # Compiled output
    ├── slides.pdf
    ├── slides.pptx
    ├── overview.png        # All slides in one grid (for LLM review)
    └── pngs/
        └── slide_{01,02,...}.png
```

> **Template-Content Separation (TCS)**: `main.typ` = content + structural layout; `template.typ` = all visual styling. See `shared-standards.md` §1 for full rules.

---

## IX. Spec Completeness Requirements and Review Heuristics

A `content_design_spec.md` must include the structural requirements below. The validator checks required sections; detail and layout choices are reviewed in context rather than against numeric quotas.

| Requirement | Expectation | Check |
|-------------|---------|-------|
| Project information table | Complete (format, page count, complexity) | Section I present |
| Theme selection table | Source + name + entry function | Section II present |
| Content outline table | ALL slides listed with title + type | Section IV present |
| Per-slide detail | Enough information for the Executor to implement each slide | Content, layout intent, and relevant components/assets |
| Image resource list | Must be present (even if "none") | Section V present |
| Visual direction | Continuity cues and intentional resets recorded | IV-A present |
| Screenshot handling | Slot ratio, fit, crop permission/safety, focal point, and truthful caption/source when needed | Per-slide detail / Section V |
| Spec detail | Complete decisions without filler or a character-count target | Review for missing information |
| Layout choice | Match each slide's content and narrative role | Repetition is allowed for comparisons and sequences |
| Repeated structure | Deliberate, readable, and useful to the narrative | Review rendered output in context |

> [!NOTE]
> There is no minimum character count or layout-count quota. A short spec is a problem only when it omits decisions or leaves the Executor unable to implement the requested content without guessing.

### Theme Selection: Introduce Randomness

When choosing a theme, do NOT always default to the single "safest" option (e.g., `corporate` or `academic-defense`). Instead:

- Consider 2-3 candidate themes that fit the content, then pick one — with some randomness
- High-expression Canvas themes (guizang-magazine, guizang-swiss, kinetic, indie-bookstore) are appropriate for most non-academic content and should be considered alongside corporate/rich options
- The theme should amplify the content's message — match energy level, formality, and visual language to the topic

---

## X. Technical Constraints Reminder

> These constraints are copied from `shared-standards.md` for quick reference. The Executor must verify compliance.

- [ ] Touying version: 0.7.4 (no other version)
- [ ] Template-Content Separation: no `rgb()` or `block(fill:)` in main.typ (except Canvas with palette.xxx)
- [ ] No manual `#new-section-slide[...]` calls (use `= Heading` instead)
- [ ] No `#slide[...]` wrapping every slide (use `== Title` for normal slides)
- [ ] Speaker notes on every slide via `#speaker-note[...]`
- [ ] Source structure is sufficient for the intended rendered result; no source-line quota
- [ ] Components are selected because they express the content; no component-count quota
- [ ] Slide types and repeated layouts support the narrative rather than arbitrary variety
- [ ] Relevant and user-required images are used; intentional exclusions are recorded
- [ ] Screenshots preserve the original UI by default and record slot ratio, fit, crop permission, focal/safe areas, and truthful caption/source where needed
- [ ] Any local background is optional, crop-safe, focal-point-aware, and contrast-safe
- [ ] Maps appear only when geographic narrative context requires them
