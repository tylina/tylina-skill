# Fossil Amber Theme - API Reference

## Overview

A Touying 0.7.4 presentation theme inspired by paleontology and geological strata aesthetics. Warm honey-gold tones, layered geological patterns, fossilized leaf impressions, and amber resin decorations create a distinctive yet professional visual language suitable for academic presentations.

## Theme Entry Function

### `fossil-amber-theme`

```typst
#show raw: set text(font: "IBM Plex Mono")
#show: fossil-amber-theme.with(
  aspect-ratio: "16-9",
  align: horizon,
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)
#set text(font: ("IBM Plex Serif", "Noto Serif SC"))
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | - | Additional Touying configuration arguments |

## Slide Functions

### `title-slide`

Full-page title slide with amber frame border and fossil fern corner decorations.

```typst
#title-slide()
```

Uses `config-info` data automatically. Shares the amber frame "bookend" element with the ending slide.

### `slide`

Standard content slide with strata background atmosphere and cross-section divider under title.

```typst
== Slide Title

Content goes here.
```

For a low-level slide with an alignment override:
```typst
#slide(align: top)[
  Content here.
]
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content/auto | `auto` | Slide title (auto uses heading) |
| `align` | alignment/auto | `auto` | Per-slide alignment override; `auto` uses the theme default |

### `new-section-slide`

Auto-generated when using `= Section Title` headings. Features left amber accent bar, amber pulse decoration, and section number.

### `focus-slide`

Dark background slide for impactful single statements or quotes.

```typst
#focus-slide[
  Your impactful statement here.
]
```

### `ending-slide`

Closing slide with amber frame (bookend), fossil fern decorations, and centered farewell text.

```typst
#ending-slide[Thank You]
```

## Reusable Components

### `stratum-card`

Layered info card with geological texture accent indicator.

```typst
#stratum-card([Title], [
  Body content here.
], accent: palette.accent)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body content |
| `accent` | color | `palette.accent` | Left border and indicator color |

### `inclusion-box`

Highlighted callout box with amber resin border and pulse decoration. Ideal for key findings or important notes.

```typst
#inclusion-box([Title], [
  Important content here.
])
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box content |

### `fossil-tag`

Small capsule tag with layered dot indicator. Used for labels and categories.

```typst
#fossil-tag([Label], color: palette.accent)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag text |
| `color` | color | `palette.accent` | Tag color |

### `specimen-card`

Data display card with top sediment stripe accent.

```typst
#specimen-card([Title], [
  Body content here.
], accent: palette.secondary)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body |
| `accent` | color | `palette.secondary` | Top stripe color |

### `amber-stat`

Fixed-height KPI/metric display with one centered marker -> value -> label stack. The stable stack keeps short values, long values, and wrapped labels aligned.

```typst
#amber-stat([Label], [Value], color: palette.accent)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label (small) |
| `value` | content | required | Metric value (large) |
| `color` | color | `palette.accent` | Accent color |

### `epoch-card`

Timeline/era card with period label in small caps.

```typst
#epoch-card([Era Label], [Title], [
  Body content here.
], accent: palette.sediment)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `era` | content | required | Era/period label (rendered in uppercase) |
| `title` | content | required | Card title |
| `body` | content | required | Card body |
| `accent` | color | `palette.sediment` | Left border color |

### `sediment-grid`

Multi-item comparison matrix with centered value -> label -> description stacks.

```typst
#sediment-grid((
  (label: "Label 1", value: "42", desc: "Description"),
  (label: "Label 2", value: "87%", desc: "Description"),
  (label: "Label 3", value: "3.5x", desc: "Description"),
))
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `items` | array | required | Array of dictionaries with `label`, `value`, and optional `desc` keys |

### `resin-box`

Code/technical content box with an amber-tinted background. Raw code uses the project's configured monospace font.

```typst
#resin-box([Title], [
  Technical content or code here.
], accent: palette.resin)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box content |
| `accent` | color | `palette.resin` | Left border and title color |

### `discovery-note`

Annotation/insight callout with leaf-green accent.

```typst
#discovery-note([Title], [
  Insight or annotation content here.
])
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Note title |
| `body` | content | required | Note content |
| `accent` | color | `palette.leaf-green` | Border and title color |

### `strata-divider`

SVG-based horizontal separator with layered sediment appearance.

```typst
#strata-divider(width: 60%)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | length | `80%` | Divider width |

### `cross-section-divider`

Lower-level SVG divider rendering function.

```typst
#cross-section-divider(width: 100%)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | length | `100%` | Divider width |

## SVG Decorative Helpers

### `strata-bg()`
Full-page geological strata background texture. Used automatically in content slide atmosphere.

### `fossil-fern(height: 120pt)`
Fossilized fern leaf impression decoration. Used in title and ending slides.

### `amber-frame()`
Amber inclusion frame overlay (bookend element). Shared between title and ending slides.

### `resin-drip(height: 60pt)`
Amber resin drip corner decoration.

### `amber-pulse(width: 80pt)`
Inline amber pulse signal decoration for section headers.

## Color Palette

Access colors via the `palette` dictionary:

| Key | Hex | Usage |
|-----|-----|-------|
| `bg` | `#FDF8F0` | Main warm cream background |
| `ink` | `#3D2B1F` | Primary text color (dark brown) |
| `accent` | `#D4920B` | Decorative honey-gold accent |
| `accent-text` | `#8A5A00` | Text-safe amber on light surfaces |
| `secondary` | `#8B5E3C` | Warm brown secondary |
| `amber-glow` | `#F5C842` | Bright amber highlight |
| `cream` | `#FFF8E7` | Light cream for contrast |
| `sediment` | `#6B4423` | Deep sediment brown |
| `fossil-gray` | `#7A6B5E` | Muted fossil gray |
| `card-bg` | `#FFFDF7` | Card background |
| `border` | `#E8D5B7` | Border/stroke color |
| `amber-light` | `#FAEAC8` | Light amber for inclusion-box bg |
| `strata-dark` | `#4A3728` | Dark warm brown for focus slides |
| `resin` | `#C87F0A` | Decorative deep amber resin |
| `resin-text` | `#8F5200` | Text-safe resin amber on light surfaces |
| `leaf-green` | `#5C7A3D` | Decorative fossilized leaf green |
| `leaf-text` | `#49652E` | Text-safe leaf green on light surfaces |
| `text-muted` | `#6F6252` | Muted text/footer color |

## Font Ownership

The reusable theme sets only the 18pt base size and remains font-agnostic. The demo uses the verified installed stack `("IBM Plex Serif", "Noto Serif SC")` and `"IBM Plex Mono"` for raw/code blocks. Projects may supply any installed fonts after the theme show rule.

## Layout Utilities

The theme uses Touying's built-in `cols()` function for multi-column layouts:

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  stratum-card([Left], [Content]),
  stratum-card([Right], [Content]),
)
```

Use `lazy-layout: true` only when every column contains exactly one flexible component and the row is not followed by unrelated content in the same lazy scope. Use ordinary `cols` for multi-region columns and `grid` for regular matrices such as `sediment-grid`.

## Tips

- Use `stratum-card` for general-purpose information blocks
- Use `inclusion-box` for key findings that need visual emphasis
- Use `epoch-card` for chronological/sequential content
- Use `sediment-grid` for at-a-glance comparisons of 3-5 metrics
- Use `resin-box` for code snippets or technical specifications
- Use `discovery-note` for annotations, insights, or supplementary information
- Use `fossil-tag` for category labels or keywords
- Combine `amber-stat` in rows of 3-4 for dashboard-style metric displays
