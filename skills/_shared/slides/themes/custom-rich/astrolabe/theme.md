# Astrolabe Theme — API Reference

## Overview

Medieval astronomical instrument aesthetic. Warm ivory/cream backgrounds with deep navy text, brass/gold accents, and aged copper highlights. Features precise engraved arcs, celestial coordinate lines, rotating dials with degree markings, and alchemical symbol patterns.

**Tier**: custom-rich
**Touying Version**: 0.7.4
**Entry Function**: `astrolabe-theme`

---

## Theme Entry

```typ
#show: astrolabe-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  footer: [Your Footer],   // Content for slide footer
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/none | `none` | Footer text shown on content slides |
| `..args` | any | — | Additional Touying config arguments |

---

## Color Palette

Access via `palette.<name>`:

| Name | Hex | Usage |
|------|-----|-------|
| `bg` | `#FDFBF5` | Main background (warm ivory) |
| `ivory` | `#F8F4EA` | Secondary background |
| `ink` | `#1B2340` | Primary text (deep navy) |
| `brass` | `#B8860B` | Primary accent (brass/gold) |
| `copper` | `#A0522D` | Secondary accent (aged copper) |
| `gold-light` | `#DAA520` | Light gold accent |
| `navy-muted` | `#3B4A6B` | Muted navy for tertiary |
| `warm-gray` | `#6B6560` | Subtle text |
| `card-bg` | `#FFFDF7` | Card background |
| `border` | `#E8DFC8` | Border color |
| `arc-faint` | `#B8860B` | Faint arc/grid color |
| `text-muted` | `#7A7268` | Muted text |

---

## Slide Functions

### `title-slide()`

Full-page title slide with ecliptic frame, celestial grid, and rete pointer ornament.

```typ
#title-slide()
```

Uses `config-info` values for title, subtitle, author, institution, date.

---

### `slide(title: auto, ..args)`

Standard content slide with ivory background, celestial coordinate grid atmosphere, arc divider under title.

```typ
== Slide Title
Content here...

// Or with explicit title:
#slide(title: [Custom Title])[
  Content here...
]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title (auto uses heading) |

---

### `new-section-slide`

Automatically generated when using `= Section Heading`. Shows section number in brass with degree scale decoration.

---

### `focus-slide(body)`

Full-page emphasis slide with centered content and concentric arc decoration.

```typ
#focus-slide[
  A powerful quote or key statement here.
]
```

---

### `ending-slide(body)`

Closing slide with ecliptic frame (shared bookend element with title slide) and rete pointer.

```typ
#ending-slide[Thank You]
```

---

## Reusable Components

### `dial-card(title, body, accent: palette.brass)`

Primary content card with arc-accent left border and brass node indicator.

```typ
#dial-card([Card Title], [
  Card body content here.
], accent: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body |
| `accent` | color | `palette.brass` | Left border and node color |

---

### `rete-box(title, body)`

Highlighted content box with degree scale decoration in header.

```typ
#rete-box([Important Finding], [
  Detailed explanation of the finding.
])
```

---

### `degree-tag(content, color: palette.brass)`

Small capsule tag with graduated marker dot. Useful for inline labels.

```typ
#degree-tag([Category], color: palette.copper)
```

---

### `azimuth-card(label, value, color: palette.brass)`

Data/metric display card with large prominent value.

```typ
#azimuth-card([Metric Name], [42.5%], color: palette.brass)
```

---

### `ecliptic-divider(color: palette.brass, width: 80%)`

Decorative arc separator with graduated tick marks.

```typ
#ecliptic-divider(width: 70%)
```

---

### `altitude-stat(label, value, description, color: palette.brass)`

KPI card with top arc indicator band, large value, label, and description.

```typ
#altitude-stat([Revenue], [$2.4M], [Annual recurring revenue growth], color: palette.brass)
```

---

### `meridian-card(step-num, title, body, accent: palette.brass)`

Timeline/step card with numbered brass circle indicator.

```typ
#meridian-card([1], [First Step], [Description of the first step.])
#meridian-card([2], [Second Step], [Description of the second step.])
```

---

### `quadrant-grid(tl-title, tl-body, tr-title, tr-body, bl-title, bl-body, br-title, br-body)`

2x2 comparison grid layout with alternating backgrounds.

```typ
#quadrant-grid(
  [Top Left], [Content...],
  [Top Right], [Content...],
  [Bottom Left], [Content...],
  [Bottom Right], [Content...],
)
```

---

### `plate-box(title, body, accent: palette.copper)`

Technical/code content box with monospace title styling and copper accent.

```typ
#plate-box([Algorithm], [
  ```python
  def solve(): pass
  ```
])
```

---

### `observation-note(title, body, accent: palette.navy-muted)`

Annotation/insight box with full border and accent background.

```typ
#observation-note([Key Insight], [
  An important observation about the data.
])
```

---

## SVG Decorative Helpers

These functions render the theme's SVG decorative elements:

| Function | Description |
|----------|-------------|
| `celestial-grid-bg()` | Full-page coordinate grid with concentric arcs |
| `ecliptic-frame()` | Ornate frame for bookend slides |
| `arc-divider-render(width: 100%)` | Graduated arc divider |
| `rete-pointer(size: 36pt)` | Celestial pointer ornament |
| `degree-scale(width: 100pt)` | Horizontal graduated scale |

---

## Typography

- **Base font**: selected by the deck; the theme remains font-agnostic
- **Monospace**: selected by the deck when code is present
- **Base size**: 18pt
- **Title size**: 2.4em bold
- **Section heading**: 2em bold
- **Card titles**: 0.92em bold
- **Card body**: 0.82em regular
- **Footer**: 0.65em

---

## Layout Patterns

### Two-column layout
```typ
#cols(columns: (1fr, 1fr), gutter: 1.2em,
  dial-card([Left], [Content...]),
  dial-card([Right], [Content...]),
)
```

### Three-column metrics
```typ
#grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  azimuth-card([Metric A], [100]),
  azimuth-card([Metric B], [200], color: palette.copper),
  azimuth-card([Metric C], [300], color: palette.navy-muted),
)
```

### Step sequence
```typ
#grid(columns: (1fr, 1fr, 1fr), gutter: 0.7em,
  meridian-card([1], [Step One], [Description...]),
  meridian-card([2], [Step Two], [Description...]),
  meridian-card([3], [Step Three], [Description...]),
)
```
