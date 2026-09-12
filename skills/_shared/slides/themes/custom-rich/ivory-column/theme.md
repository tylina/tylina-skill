# Ivory Column Theme -- API Reference

## Overview

A classical Greek/Roman column architecture theme for Touying 0.7.4. Features warm ivory/cream backgrounds, deep charcoal text, slate blue primary color, and antique gold accents. Inspired by Ionic and Corinthian column capitals, fluted pillar patterns, entablature details, and temple pediment frames.

**Tier**: custom-rich
**Touying Version**: 0.7.4
**Entry Function**: `ivory-column-theme`

---

## Theme Entry

```typst
#show: ivory-column-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [Your Footer Text],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))
#show raw: set text(font: ("Menlo", "Noto Sans SC"))
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/none | `none` | Footer text shown on content slides |
| `..args` | any | - | Additional Touying config arguments |

---

## Color Palette

Access colors via `palette.<name>`:

| Name | Hex | Description |
|------|-----|-------------|
| `bg` | `#FAF8F3` | Main background (warm ivory) |
| `ivory` | `#F5F1E8` | Secondary background |
| `card-bg` | `#FFFFFF` | Card/surface white |
| `charcoal` | `#2C2C34` | Deep text color |
| `primary` | `#4A5B7A` | Warm slate blue |
| `primary-dark` | `#3A4A66` | Darker slate blue |
| `accent` | `#B8943F` | Decorative antique gold |
| `accent-text` | `#80601B` | Contrast-safe antique gold for text |
| `accent-light` | `#D4B55A` | Lighter gold |
| `secondary` | `#536A80` | Contrast-safe muted blue-gray |
| `marble` | `#F0ECE3` | Marble white |
| `border` | `#D6CFC2` | Border color |
| `text` | `#2C2C34` | Primary text |
| `text-muted` | `#6B6B73` | Muted text |
| `warm-shadow` | `#E8E2D6` | Warm shadow fill |

---

## Slide Functions

### `title-slide()`

Full-page title slide with temple pediment frame (bookend), fluted column background, and centered content. Reads from `config-info`.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with ivory background, fluted column atmosphere, entablature header decoration, and classical footer.
The atmosphere is rendered through `config-page(background: ...)`, below body and footer chrome.

```typst
== Slide Title Here

Content goes here...
```

Or with explicit title:

```typst
#slide(title: [Custom Title])[
  Content here...
]
```

Supports multi-column layout:

```typst
#slide[
  Left column content
][
  Right column content
]
```

### `new-section-slide`

Automatically generated when using `= Section Heading`. Shows section number in gold with entablature decoration.

```typst
= New Section Title
```

### `focus-slide(body)`

Full-page emphasis slide with marble background and corner volute ornaments. For key quotes or statements.

```typst
#focus-slide[
  Your important statement here.
]
```

### `ending-slide(body)`

Closing slide with pediment frame (bookend matching title slide) and volute decoration.

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `pillar-card(title, body, accent: palette.primary)`

Content card with a left border plus an SVG fluted-column accent.

```typst
#pillar-card([Card Title], [
  Card body content with **formatting** support.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card header text |
| `body` | content | required | Card body content |
| `accent` | color | `palette.primary` | Left border accent color |

---

### `capital-box(title, body)`

Highlighted box with gold top accent (evoking Ionic capital ornamentation).

```typst
#capital-box([Important Information], [
  Detailed explanation or highlighted content.
])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box header |
| `body` | content | required | Box content |

---

### `frieze-tag(content, color: palette.primary)`

Small capsule-shaped label for categorization and tagging.

```typst
#stack(dir: ltr, spacing: 0.5em,
  frieze-tag([Strategy], color: palette.primary),
  frieze-tag([Finance], color: palette.accent),
  frieze-tag([Growth], color: palette.secondary),
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag label text |
| `color` | color | `palette.primary` | Tag color |

---

### `pediment-card(title, body, accent: palette.accent)`

Important data display card with triangular pediment indicator at top.

```typst
#pediment-card([Key Milestone], [
  Description of the milestone and its significance.
], accent: palette.accent)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card content |
| `accent` | color | `palette.accent` | Pediment triangle color |

---

### `meander-divider(width: 80%, color: palette.accent)`

Greek key/meander pattern horizontal separator.

```typst
#meander-divider(width: 60%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | length | `80%` | Divider width |
| `color` | color | `palette.accent` | Rendered pattern color |

---

### `order-stat(label, value, color: palette.primary)`

KPI/metric display with classical proportions. A centered square marker, large value, and label form one controlled vertical stack.

```typst
#block(width: 100%, height: 76pt)[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    order-stat([Revenue], [$142M], color: palette.primary),
    order-stat([Year-over-Year Growth], [28%], color: palette.accent),
    order-stat([Clients], [1,240], color: palette.secondary),
  )
]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label below the value |
| `value` | content | required | Metric value (large, prominent) |
| `color` | color | `palette.primary` | Value and bottom border color |

---

### `colonnade-card(number, title, body, accent: palette.primary)`

Sequential/step card with numbered circle. For processes and ordered items.

```typst
#cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
  colonnade-card([I], [First Step], [Description...], accent: palette.primary),
  colonnade-card([II], [Second Step], [Description...], accent: palette.accent),
  colonnade-card([III], [Third Step], [Description...], accent: palette.secondary),
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `number` | content | required | Step number/roman numeral |
| `title` | content | required | Step title |
| `body` | content | required | Step description |
| `accent` | color | `palette.primary` | Number circle color |

---

### `forum-grid(left-title, left-body, right-title, right-body)`

Two-panel comparison layout with classical column divider.

```typst
#forum-grid(
  [Current State], [
    - Item one
    - Item two
  ],
  [Future State], [
    - Improved item one
    - Improved item two
  ],
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `left-title` | content | required | Left panel header |
| `left-body` | content | required | Left panel content |
| `right-title` | content | required | Right panel header |
| `right-body` | content | required | Right panel content |

---

### `portico-box(title, body, accent: palette.secondary)`

Technical/code content box with column accent. Raw body content uses the deck's configured raw font; the title follows the deck font.

```typst
#portico-box([System Output], [
  ```
  Status: Operational
  Uptime: 99.97%
  ```
], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title (rendered in monospace) |
| `body` | content | required | Technical content |
| `accent` | color | `palette.secondary` | Left border and title color |

---

### `inscription-note(title, body)`

Annotation or insight with engraved/italic feel. Gold left accent.

```typst
#inscription-note([Key Insight], [
  An important observation rendered in an elegant, understated manner.
])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Note title (gold) |
| `body` | content | required | Note content (italic) |

---

## SVG Helper Functions

These functions render the theme's architectural SVG decorations:

| Function | Description |
|----------|-------------|
| `fluted-columns-bg()` | Full-page vertical fluting pattern |
| `pediment-frame()` | Temple pediment frame overlay |
| `entablature-border(width)` | Cornice/triglyph header border |
| `volute-ornament(size)` | Ionic volute scroll decoration |
| `meander-line(width, color)` | Greek key pattern line |
| `pillar-accent(height, color)` | Single fluted pillar accent |

---

## Layout Tips

- Use `#cols(columns: (...), gutter: ...)` for multi-column layouts
- Combine `order-stat` in 3-4 column `cols(lazy-layout: true)` rows, with one stat per column and an explicit-height ancestor
- Use `colonnade-card` with Roman numerals for sequential processes
- Place `inscription-note` at the bottom of slides for elegant commentary
- Use `meander-divider()` between content sections for visual breathing room
- Stack `frieze-tag` elements horizontally for categorization
- `forum-grid` works best for before/after or comparison content
- `portico-box` is ideal for code blocks and technical specifications
- Only `order-stat` and `portico-box` use `lazy-v(1fr)`; they must be direct children of bounded `cols(lazy-layout: true)`. Other components are natural-height and belong in ordinary `cols` or `stack` layouts.
