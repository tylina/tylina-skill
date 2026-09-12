# Silk Ribbon Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#show: silk-ribbon-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()

= Section Title
== Slide Title
- Content here

#focus-slide[Key Message]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default vertical alignment for content |
| `footer` | content/function | `none` | Footer content (or `self => content` function) |

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| `palette.ivory` | `#FFFDF5` | Page background |
| `palette.champagne` | `#C9A96E` | Primary accent (gold) |
| `palette.rose` | `#D4848C` | Secondary accent (pink) |
| `palette.mauve` | `#9B7E8E` | Tertiary accent (dusty purple) |
| `palette.cream` | `#F5EDE3` | Card/box backgrounds |
| `palette.text-dark` | `#3D2C2E` | Headings, dark text |
| `palette.text-body` | `#4A3B3D` | Body text |
| `palette.text-muted` | `#79686A` | Accessible metadata and captions |
| `palette.card-white` | `#FFFFFF` | Card fills |
| `palette.border` | `#E8DDD4` | Borders and rules |

Champagne, rose, and mauve remain the decorative accents. Text that uses those accents is automatically darkened to preserve readable contrast on ivory, cream, and white surfaces.

## Slide Types

### `title-slide()`
Premium cover with ribbon frame, bow accent, and flowing ribbon curves.

### `new-section-slide` (auto on `= Heading`)
Section divider with large ribbon curve, bow knot, and ghost section number.

### `slide(title: auto, align: auto)`
Standard content slide with champagne header accent and persistent ribbon atmosphere.

### `focus-slide[content]`
Deep mauve background with ribbon curves for key statements/quotes.

### `ending-slide[content]`
Ivory closing slide with ribbon frame (bookends with title), bow accent.

## Reusable Components

### `concept-card(title, body, accent: palette.champagne)`
Champagne-bordered card with bow decoration at title. For key concepts.

### `insight-box(title, body, accent: palette.rose)`
Left-accented box with swirl flourish divider. For insights/takeaways.

### `stat-card(label, value, color: palette.champagne)`
Large statistic display with colored accent number.

### `ribbon-card(title, body, accent: palette.champagne)`
Card with flowing ribbon SVG decoration across top header area.

### `feature-box[title][body]`
List card with champagne diamond bullets. Pass body as content block (use `- item` lists).

### `quote-card(quote, attribution: none)`
Elegant quote display with swirl flourish decorations.

### `showcase-card(title, body, accent: palette.rose)`
Premium card with place()-overlay bow at top-right corner.

### `callout-box(title, body, accent: palette.rose)`
Highlighted attention box with tinted background and left accent.

### `silk-tag(content, color: palette.champagne)`
Small inline tag/badge with pill-shaped border.

## SVG Decorative Elements

| Function | Description |
|----------|-------------|
| `ribbon-curve(color, width)` | Flowing S-curve ribbon |
| `bow-knot(color, size)` | Decorative ribbon bow |
| `swirl-flourish(color, width)` | Calligraphic swirl ornament |
| `ribbon-divider(color, width)` | Centered swirl separator |
| `ribbon-texture-bg(color)` | Full-page flowing ribbon pattern |
| `ribbon-frame(color)` | Decorative border frame with ribbon corners |

## Layout Tips

- Use `#cols(columns: (1fr, 1fr))[...][...]` for multi-column layouts
- Cards include `lazy-v(1fr)` for automatic height equalization in columns
- Use `silk-tag()` inline after cards for labels/categories
- Combine `stat-card` in 3-4 column rows for KPI dashboards
- `quote-card` works best at full width or in a 2-column layout

## Best For

- Luxury brand presentations
- Fashion collection reveals
- Beauty & wellness pitches
- Premium event proposals
- High-end product launches
- Bridal/wedding planning decks
