# Lab Notebook Theme — API Reference

## Overview

A Touying 0.7.4 theme inspired by research laboratory notebook pages. Features graph paper grid backgrounds, margin rule lines, ring-binder decorative elements, specimen sketch frames, and sticky note callouts. Designed for academic research presentations, lab meetings, and thesis defenses.

**Tier**: custom-rich
**Entry function**: `lab-notebook-theme`
**Demo fonts**: Arial, Noto Sans SC (18pt base); IBM Plex Mono for raw text
**Aspect ratio**: 16:9 (default)

---

## Theme Setup

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lab-notebook-theme.with(
  aspect-ratio: "16-9",
  footer: [Lab Meeting -- Project Name],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Arial", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")
```

---

## Entry Function

### `lab-notebook-theme`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/none | `none` | Footer text shown on content slides |
| `body` | content | required | Presentation content |

---

## Slide Functions

### `title-slide(..args)`

Full-page title slide with binder frame bookend element, graph paper background, and centered presentation metadata.

```typst
#title-slide()
```

### `slide(title: auto, ..args)`

Standard content slide with graph paper grid atmosphere, margin rule lines, teal header underline, and page number footer.

```typst
== Slide Title

Content here...
```

Or explicitly:

```typst
#slide(title: [Custom Title])[
  Content here...
]
```

### `new-section-slide`

Automatically generated when using `= Section Title`. Shows section number in orange, binding coil decoration, and section title.

```typst
= New Section
```

### `focus-slide(body)`

Centered statement slide with dashed teal border frame over graph paper background.

```typst
#focus-slide[
  Important statement or quote here.
]
```

### `ending-slide(body)`

Closing slide with binder frame bookend (matching title slide), binding coil decoration above text.

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `entry-card(title, body, accent: palette.teal)`

Main content card with left accent border and ruled-line styling. Primary card for most content.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card content |
| `accent` | color | `palette.teal` | Left border and title dot color |

```typst
#entry-card([Title], [Content here...], accent: palette.orange)
```

### `margin-note(body, accent: palette.margin-red)`

Annotation box styled as a handwritten margin note. Italic text, red left border.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `body` | content | required | Note content |
| `accent` | color | `palette.margin-red` | Border color |

```typst
#margin-note[
  Important observation about the data above.
]
```

### `specimen-box(title, body, accent: palette.specimen-green)`

Highlighted specimen/sample description box with cross-hair indicator and green border.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Specimen name/title |
| `body` | content | required | Description |
| `accent` | color | `palette.specimen-green` | Border and title color |

```typst
#specimen-box([Sample A-7], [
  Description of the specimen...
])
```

### `protocol-card(title, body, accent: palette.teal)`

Step-by-step procedure card with top accent bar. Ideal for numbered protocol steps.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Protocol name |
| `body` | content | required | Steps/content |
| `accent` | color | `palette.teal` | Top bar and title color |

```typst
#protocol-card([Staining Protocol], [
  + Fix cells with 4% PFA
  + Permeabilize with Triton X-100
  + Block with BSA
  + Primary antibody overnight
])
```

### `binding-divider(width: 80%)`

Decorative spiral binding separator using SVG coil pattern.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | length | `80%` | Width of the divider |

```typst
#binding-divider(width: 60%)
```

### `reading-stat(label, value, color: palette.teal)`

Measurement/metric display with large value and indicator dot.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label (small text) |
| `value` | content | required | Metric value (large text) |
| `color` | color | `palette.teal` | Value color |

```typst
#reading-stat([Temperature], [37.2 C], color: palette.orange)
```

### `sample-tag(content, color: palette.teal)`

Small capsule-shaped label for tagging/categorizing items.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag text |
| `color` | color | `palette.teal` | Tag color |

```typst
#sample-tag([Control], color: palette.teal)
#sample-tag([Treatment], color: palette.orange)
```

### `data-table-card(title, body, accent: palette.teal)`

Structured data display with colored header stripe.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Table title |
| `body` | content | required | Table/data content |
| `accent` | color | `palette.teal` | Header stripe color |

```typst
#data-table-card([Results Summary], [
  #table(
    columns: (auto, auto, auto),
    [*Sample*], [*Value*], [*SD*],
    [A], [1.23], [0.05],
    [B], [2.45], [0.12],
  )
])
```

### `sticky-note(title, body)`

Yellow sticky note callout for insights, reminders, or important notes.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Note title |
| `body` | content | required | Note content |

```typst
#sticky-note([Remember], [
  Always run controls alongside experimental samples.
])
```

### `observation-log(title, body, accent: palette.orange)`

Timeline/sequence card with timestamp styling. Orange left border with circle indicator.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Log entry title/timestamp |
| `body` | content | required | Observation content |
| `accent` | color | `palette.orange` | Accent color |

```typst
#observation-log([Day 3 -- 14:30], [
  Observed unexpected cell death in well B4.
  Possible contamination. Discarded and re-plated.
])
```

---

## Color Palette

Access palette colors via the `palette` dictionary:

| Key | Hex | Usage |
|-----|-----|-------|
| `paper` | #FAF8F3 | Warm off-white background |
| `ink` | #2C2C2C | Primary text |
| `teal` | #1A7A6C | Primary accent |
| `teal-light` | #E8F5F2 | Light teal backgrounds |
| `orange` | #D4552A | Secondary accent / highlights |
| `orange-light` | #FDF0EC | Light orange backgrounds |
| `margin-red` | #C75B5B | Margin rule / annotation color |
| `grid-blue` | #B8D4E3 | Graph paper grid lines |
| `grid-heavy` | #8FBDD4 | Heavy grid lines |
| `card-bg` | #FFFFFF | Card backgrounds |
| `text-muted` | #6B6B6B | Secondary text |
| `binding-gray` | #9E9E9E | Binder/spiral elements |
| `sticky-yellow` | #FFF8DC | Sticky note background |
| `sticky-border` | #E6D88A | Sticky note border |
| `specimen-green` | #2E7D32 | Specimen box accent |
| `specimen-bg` | #F1F8E9 | Specimen box background |

---

## SVG Decorative Elements

The theme includes several SVG-based decorative elements:

- **Graph paper grid**: Full-page background with small/large grid intervals
- **Margin rule**: Vertical red line mimicking notebook margin
- **Binder frame**: Ring-binder holes with border (bookend element)
- **Specimen frame**: Cross-hair corner frame for specimens
- **Sticky tab**: Tab-shaped decoration
- **Binding coil**: Spiral binding separator

These low-level helpers are used automatically by the theme. The full-page helpers return
100%-height artwork, so manual use belongs inside `place()` decoration rather than normal
flow:

```typst
#place(top + left, box(width: 100%, height: 100%, graph-paper-bg()))
#place(top + left, box(width: 100%, height: 100%, margin-rule-bg()))
#place(top + left, box(width: 100%, height: 100%, binder-frame()))
#binding-coil(width: 100%)  // Spiral separator
#sticky-tab(width: 80pt)    // Tab decoration
```

---

## Layout Tips

- Use `#cols(columns: (..), gutter: ..)` for multi-column layouts
- Combine `entry-card` for main content, `margin-note` for annotations
- Use `sticky-note` for important callouts and reminders
- Use `protocol-card` for numbered procedures
- Use `data-table-card` with `#table()` for structured data
- Tags work well in `#stack(dir: ltr, spacing: ..)` for inline categorization
- The `binding-divider()` provides visual section breaks within slides
