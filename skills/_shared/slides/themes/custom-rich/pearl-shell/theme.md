# Pearl Shell Theme — API Reference

## Overview

Mother-of-pearl iridescence theme for Touying 0.7.4. Soft opalescent colors (lavender, rose, aqua) on luminous pearl white. Elegant modern business presentations for beauty, wellness, fashion, creative agencies, and luxury hospitality.

## Installation

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *
```

## Theme Entry

### `pearl-shell-theme`

```typst
#show: pearl-shell-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/none | `none` | Footer text on content slides |
| `..args` | any | — | Additional Touying config arguments |

**Note:** `set text(size: 18pt)` is applied in theme entry. Fonts should be set in your presentation file.

---

## Slide Functions

### `title-slide()`

Opening slide with shell frame border and pearl cluster corners (bookend element).

```typst
#title-slide()
```

Uses `config-info` data for title, subtitle, author, institution, and date.

---

### `slide(title: auto, ..args)`

Standard content slide with persistent nacre wave atmosphere, violet header with shimmer underline.

```typst
== Slide Title

Content here...

// Or with explicit title:
#slide(title: [Custom Title])[
  Content here...
]

// Multi-column:
#slide[Column 1][Column 2]
```

---

### `new-section-slide`

Auto-generated section divider with deep violet background and opalescent wave accents.

```typst
= Section Name   // Automatically triggers new-section-slide
```

---

### `focus-slide(body)`

Full-bleed opal teal slide for key quotes or emphasis moments.

```typst
#focus-slide[
  _"Your impactful quote here."_
]
```

---

### `outline-slide(title: [Contents])`

Table of contents slide with shell spiral decoration.

```typst
#outline-slide()
#outline-slide(title: [Agenda])
```

---

### `ending-slide(body)`

Closing slide with shell frame border and pearl cluster corners (bookends with title-slide).

```typst
#ending-slide[Thank You]
```

---

## Components

### `nacre-card[title][body]`

Card with iridescent shimmer top border. Primary workhorse component.

```typst
#nacre-card([Card Title], [Card body content...])
#nacre-card([Title], [Body...], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card header |
| `body` | content | required | Card content |
| `accent` | color | `palette.primary` | Top border and title color |

---

### `pearl-box[title][body]`

Highlighted box with pearl dot icon in header. Uses `stack(spacing: 0pt)` for header + body.

```typst
#pearl-box([Box Title], [Content here...])
#pearl-box([Title], [Body...], accent: palette.tertiary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Header text |
| `body` | content | required | Body content |
| `accent` | color | `palette.secondary` | Accent color |

---

### `shell-divider(color, width)`

SVG shell spiral decorative divider with lines on either side.

```typst
#shell-divider()
#shell-divider(color: palette.secondary, width: 60%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Divider color |
| `width` | relative | `80%` | Total width |

---

### `pearl-tag[label]`

Small inline capsule tag with pearl dot icon. For categorization labels.

```typst
#pearl-tag([Category])
#pearl-tag([Label], color: palette.tertiary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag label text |
| `color` | color | `palette.primary` | Tag color |

---

### `luster-card[value][label]`

Metric display card with colored bottom border. For KPIs and statistics.

```typst
#luster-card([+23%], [Growth Rate])
#luster-card([value], [label], color: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | content | required | Large metric value |
| `label` | content | required | Descriptive label |
| `color` | color | `palette.primary` | Accent color |

---

### `campaign-card[title][body]`

Strategy container with opal accent header stripe. Uses `stack(spacing: 0pt)`.

```typst
#campaign-card([Phase 1: Launch], [Strategy details...])
#campaign-card([Title], [Body], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card header |
| `body` | content | required | Card content |
| `accent` | color | `palette.tertiary` | Header accent color |

---

### `insight-box[title][body]`

Left-bordered callout with mother-of-pearl nacre fill background.

```typst
#insight-box([Key Insight], [Detailed explanation...])
#insight-box([Title], [Body], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Callout title |
| `body` | content | required | Callout content |
| `accent` | color | `palette.primary` | Left border color |

---

### `comparison-table(headers, ..rows)`

Elegant table with pearl-tone alternating rows and violet header.

```typst
#comparison-table(
  ([Col 1], [Col 2], [Col 3]),
  [Row 1 A], [Row 1 B], [Row 1 C],
  [Row 2 A], [Row 2 B], [Row 2 C],
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `headers` | array | required | Column header labels |
| `..rows` | content | required | Row cell contents (flattened) |

---

### `wave-note[body]`

Borderless inline note with nacre wave icon. For subtle annotations.

```typst
#wave-note[This is an understated observation or aside.]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `body` | content | required | Note text |

---

### `spotlight-card[title][body]`

Featured content card with radial glow SVG effect and prominent border.

```typst
#spotlight-card([Featured Item], [Description content...])
#spotlight-card([Title], [Body], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card content |
| `accent` | color | `palette.primary` | Glow and border color |

---

### `collection-grid[..items]`

Multi-item display grid with pearl dot separators above each item.

```typst
#collection-grid(
  [*Item 1*\ Description],
  [*Item 2*\ Description],
  [*Item 3*\ Description],
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `..items` | content | required | Grid items (max 3 columns) |

---

## Color Palette

Access via `palette.*`:

| Key | Hex | Description |
|-----|-----|-------------|
| `bg` | `#FDFCFE` | Pearl white background |
| `primary` | `#6B5B8A` | Soft violet/amethyst |
| `secondary` | `#B07A8A` | Pearl rose |
| `tertiary` | `#5A8B8B` | Opal aqua/teal |
| `text-dark` | `#2D2640` | Deep violet-charcoal |
| `text-body` | `#4A4260` | Soft dark purple |
| `card-bg` | `#FFFFFF` | Card white |
| `border` | `#E0D8EC` | Lavender border |
| `nacre` | `#F5F0F8` | Mother-of-pearl fill |

---

## Layout Patterns

### Multi-column with `cols`

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  nacre-card([Left], [Content...]),
  nacre-card([Right], [Content...]),
)
```

### Tags row

```typst
#stack(dir: ltr, spacing: 0.5em,
  pearl-tag([Tag 1]),
  pearl-tag([Tag 2], color: palette.secondary),
)
```

### Speaker notes

```typst
#speaker-note[Notes for the presenter...]
```

---

## Design Notes

- All card components use `lazy-v(1fr)` for height equalization in `cols`
- Adjacent colored blocks use `stack(spacing: 0pt)` pattern
- Background atmosphere (`_bg-atmosphere`) is applied to every content slide
- Title and ending slides share shell frame + pearl cluster corners (bookending)
- SVG decorations use `image(bytes(svg-string), ...)` pattern
- `std.align` used instead of bare `align` inside slide functions
