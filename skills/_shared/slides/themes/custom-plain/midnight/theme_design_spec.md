# Midnight Theme — Design Specification

## I. Project Information

| Item | Value |
|------|-------|
| **Theme Name** | midnight |
| **Best For** | Tech talks, developer presentations, and dark-room venues |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

Midnight is a restrained dark-mode system inspired by a clear night sky. Deep navy supplies the field, soft white carries content, and cyan-to-violet accents behave like sparse points of light. The Plain-tier identity comes from typography, whitespace, thin rules, native list styling, and two purposeful card components rather than persistent decoration or a large wrapper API.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🔵 | Primary / Accent | `#4FC3F7` | `palette.primary` / `palette.accent` | Headings, rules, values, and list markers |
| 🌑 | Background | `#0D1B2A` | `palette.bg` | Page and chrome background |
| 🌑 | Card Background | `#1B2838` | `palette.card-bg` | Opaque component fill |
| 🟣 | Accent 2 | `#7C4DFF` | `palette.accent2` | Alternate card accent and gradient endpoint |
| ⬜ | Text | `#E0E0E0` | `palette.text` | Primary body text |
| 🔵 | Text Secondary | `#90A4AE` | `palette.text-sec` | Metadata, labels, and footer |
| 🌑 | Code Background | `#0A1628` | `palette.code-bg` | Block and inline code fill |
| ⬜ | Code Text | `#C5E1F5` | `palette.code-text` | Block-code foreground |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Alerts and primary theme accent |
| `neutral-lightest` | `palette.text` | Light text reference |
| `neutral-darkest` | `palette.bg` | Dark background reference |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text** | `palette.text` |
| **Font** | Set in `main.typ`, not in the template |
| **Cover Title** | 2.2em, bold, `palette.text` |
| **Section Title** | 2em, semibold, `palette.text` |
| **Content Title** | 1.25em, medium, `palette.text` |
| **Header Section Label** | 0.6em, medium, `palette.text-sec` |
| **Footer** | 0.7em, `palette.text-sec` |
| **Code** | `palette.code-bg` with `palette.code-text` for blocks |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** `palette.bg`; x/y margin 2em.
**Layout:** Centered headline group and compact metadata group, both built with explicit `stack(spacing:)`.
**Decorations:** Eight 1–2pt star dots in cyan, violet, and blue-gray at 40–70% transparency.
**Title:** 2.2em bold `palette.text`.
**Rule:** 40% width, 2pt blue-to-violet gradient.
**Subtitle:** 1.2em `palette.accent`.
**Metadata:** Author at 1em; institution/date at 0.85em.
**Header/Footer:** Disabled.

### Section Slide (`new-section-slide`)

**Background:** `palette.bg`; margin 2em.
**Layout:** Centered stack with 16pt spacing.
**Decorations:** Two 20%-width, 1.5pt rules in translucent cyan and violet.
**Title:** 2em semibold `palette.text`.
**Header/Footer:** Disabled.

### Content Slide (`slide`)

**Header:** Open midnight field aligned to the 2em content axis. A muted section label precedes a medium-weight white title and a 64pt × 2pt blue-to-violet rule; the group uses `stack(spacing: .8em)`.
**Footer:** Three-part grid `(1fr, auto, 1fr)` with optional footer at left and the braced-context counter at right.
**Content area:** `palette.bg`; margin top 4em, bottom 2em, x 2em; header ascent 30% and footer descent 30%.
**Alignment:** Stored `align` value, default `horizon`.

### Focus Slide (`focus-slide`)

**Background:** `palette.bg`; margin 2em.
**Text:** 2em semibold `palette.text`, centered inside an 88%-width block.
**Decorations:** One translucent cyan top rule and violet bottom rule, each 30% wide.
**Header/Footer:** Disabled.

### Ending Slide (`ending-slide`)

**Background:** `palette.bg`; margin 2em.
**Layout:** Centered text and gradient rule in a 12pt-spaced stack.
**Decorations:** Four small star dots shared with the cover bookend.
**Text:** 2.2em semibold `palette.text`.
**Header/Footer:** Disabled.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Glow Card | `glow-card(title, body, accent: none)` | Opaque `palette.card-bg` card with a 3pt accent left rule, subtle 1pt remaining stroke, 6pt radius, semibold title, and one internal `lazy-v(1fr)` for supported lazy-column equalization. |
| Stat Card | `stat-card(label, value, trend: none)` | Opaque `palette.card-bg` metric card with a subtle cyan stroke. Value, label, and optional trend form one horizontally centered stack with 6pt spacing and no `v()` calls; a single trailing `lazy-v(1fr)` supports equal-height lazy columns. |

## Native Layout and List Contract

- Use Touying `#cols` for ordinary multi-column layouts; the theme defines no generic two-/three-column wrapper.
- Use `cols(lazy-layout: true)` only when each column contains exactly one component with one internal `lazy-v(1fr)`.
- Use standard `- item` syntax. The theme globally supplies a filled cyan circular marker; there is no custom icon-list component.
- Use `grid` for genuine multi-row arrangements and three-part chrome, never to host lazy-height card components.

## Chart Demonstration Contract

The demo's Growth Trends slide uses ordinary two-column `cols` because each chart column contains a figure and caption. Axis labels are scoped to 0.7em, diagrams use 240pt × 165pt canvases, and a 2em column gutter separates both plots. The four Q1–Q4 labels map one-to-one to the four data values; y-axis maxima provide at least 10% headroom.

## Best Use Cases

- Tech conferences and developer keynotes
- Data-led product updates
- Cybersecurity and infrastructure talks
- Evening or dimmed-room presentations

## Recommended Complexity

**Plain** — The identity is carried by a disciplined dark palette, explicit typography and spacing, native lists, thin gradient rules, and two restrained card components. Star dots appear only on the title and ending bookends.
