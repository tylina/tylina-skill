# Meridian Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | meridian |
| **Best For** | Research presentations, data analysis, academic seminars, scientific briefings |
| **Style Objective** | Cartographic precision meets modern minimalism |
| **Complexity Level** | Rich |

A clean geometric theme inspired by cartographic meridian lines and compass-rose motifs. Warm ivory background with deep teal/navy accent lines evoke longitude/latitude grid lines. Subtle SVG compass rose ornaments provide elegant visual anchors. The aesthetic draws from vintage scientific maps — precise geometry, clean lines, and natural warmth.

## Design Philosophy

- **Cartographic Precision**: Grid lines and compass elements provide visual structure without visual noise
- **Warm Minimalism**: Ivory background with deep teal creates a warm yet professional tone
- **Golden Accents**: Amber accent color adds warmth and hierarchy like gilded map elements
- **Geometric Order**: Clean lines, precise spacing, and structured layouts reflect scientific rigor
- **Abstract Versatility**: While map-inspired, the design works for any research or analytical content

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Warm Ivory | `#F8F6F1` | Primary background (paper surface) |
| Deep Ink | `#1E2A32` | Main text (body content) |
| Deep Teal | `#1B4B5A` | Primary accent — titles, borders, key elements |
| Golden Amber | `#C4963C` | Warm accent — highlights, section numbers, decorative lines |
| Amber Text | `#8A5E08` | Text-safe amber emphasis on light surfaces |
| Steel Blue | `#4A7896` | Secondary accent — quotes, secondary cards, callouts |
| Highlight Ivory | `#F5EBD5` | Opaque amber-tinted highlight surface |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Helvetica Neue", "Noto Sans SC"), size: 18pt)
#show raw: set text(font: "DejaVu Sans Mono")

#show: meridian-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default vertical alignment for content slides |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Cover slide with warm ivory background, faint meridian grid overlay, compass rose ornament (top-right), latitude markers (left edge), double-line border frame (top and bottom), centered title in deep teal, golden accent line, subtitle, author, institution, and date.

### `slide(title: auto, align: auto, ..args)`
Standard content slide with:
- Warm ivory background with faint meridian grid lines
- Bold teal title with double meridian line decoration below (teal + gold)
- Footer with golden compass dot separator and slide counter
- Grid columns: `(1fr, auto, 1fr)` layout

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features a deep teal background with white meridian grid overlay, large golden amber section number, white section title, golden accent line, compass rose in bottom-right corner, and thin white bottom line.

### `focus-slide(body)`
Single centered statement on deep teal background with white meridian grid, rectangular frame border, compass rose ornament (top-left), white bold text, and golden accent underline.

### `ending-slide(body)`
Closing slide with warm ivory background, meridian grid overlay, double-line border frame (top and bottom), centered compass rose above text, deep teal title, golden accent line, and three-dot ornament (teal/amber/blue).

## Reusable Components

### `coordinate-card(title, body, accent: palette.primary)`
Card with colored top border (3pt) and light border sides (0.7pt). Clean white background with bold colored title, golden separator line, and body text. Ideal for structured content blocks.

```typst
#coordinate-card([Study Overview], [
  This research examines *global surface temperature anomalies*...
], accent: palette.primary)
```

### `bearing-stat(label, value, color: palette.accent)`
Centered value-over-label display with an opaque tint and colored bottom border. The value, label, and flexible tail are one `stack(spacing:)`, so varying values and labels remain aligned when the component is the sole child of a bounded lazy column.

```typst
#bearing-stat([Northern Continental], [+1.54 C], color: palette.accent)
```

### `azimuth-box(title, body, accent: palette.secondary)`
Left-bordered content box (4pt accent bar) with tinted background. Used for callouts, notes, and emphasis blocks.

```typst
#azimuth-box([Data Sources], [
  - NASA GISS Surface Temperature Analysis
  - HadCRUT5 global temperature dataset
], accent: palette.primary)
```

### `meridian-divider(color: palette.primary, width: 80%)`
Horizontal separator with centered compass dot between two thin lines. Used to separate content sections.

```typst
#meridian-divider(color: palette.primary)
```

### `compass-tag(content, color: palette.primary)`
Capsule-shaped label for categorization with tinted background and border.

```typst
#compass-tag([Spatial Statistics], color: palette.primary)
```

### `waypoint-list(body)`
Scoped native Typst enum with golden amber circular markers in a bordered card. It preserves standard `+ item` authoring syntax for procedures and ordered steps.

```typst
#waypoint-list[
  + Collect raw station data
  + Apply homogenization filters
  + Compute zonal anomalies
]
```

### `cartograph-highlight(body)`
Full-width highlight box with golden amber background tint and border. Used for key findings or important statements.

```typst
#cartograph-highlight[
  *Central Finding:* The mean anomaly was +1.21 degrees C.
]
```

### `projection-quote(quote, author: none)`
Quote block with teal left accent bar and light border. Italic text with optional golden author attribution.

```typst
#projection-quote(
  [The warming signal is geographically structured.],
  author: [Hansen et al., 2023]
)
```

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.primary)[Deep teal text]
#text(fill: palette.accent-text)[Text-safe amber emphasis]
#text(fill: palette.secondary)[Steel blue text]
#text(fill: palette.ink)[Dark body text]
#text(fill: palette.ink-muted)[Muted text]
```

- `palette.bg`, `palette.ink`, `palette.primary`, `palette.accent`, `palette.accent-text`, `palette.secondary`
- `palette.ink-muted`
- `palette.border-light`, `palette.card-bg`, `palette.highlight-bg`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent-text` | Text-safe amber for `alert()` and strong emphasis |
| `neutral-lightest` | `palette.bg` | Light backgrounds (warm ivory) |
| `neutral-darkest` | `palette.ink` | Dark text (deep ink) |

## Best Use Cases

- Research presentations and scientific briefings
- Data analysis and statistical reports
- Academic seminars and conference talks
- Geographic and spatial analysis
- Environmental science and climate research
- Any presentation requiring clean, professional aesthetics

## Recommended Complexity

**Rich** -- This theme uses multiple SVG decorations (compass rose, meridian grid, latitude markers) and geometric design elements. Use `coordinate-card`, `bearing-stat`, and `waypoint-list` for structured content that maintains the cartographic precision aesthetic.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (compass rose, meridian grid, double borders)
2. Introduction (research context, methodology)
3. Key Findings (temperature anomalies, decadal summary, dedicated trend chart)
4. Implications (policy, future research)
5. Focus slide and ending slide

## File Structure

```
meridian/
  template.typ         -- Theme definition (colors, slides, components)
  demo.typ             -- Full demonstration presentation
  theme_design_spec.md -- Visual design specification (this file)
  theme.md             -- API summary
```
