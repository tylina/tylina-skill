# Carbon Fiber Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `carbon-fiber-theme`
**Style**: Precision engineering, aerospace/automotive, clean technical, premium light theme
**Primary color**: `#2563EB` (Metallic Blue)
**Best For**: Engineering presentations, materials science, aerospace talks, automotive design, technical reviews
**Style Objective**: Precision Engineering — Lightweight but incredibly strong
**Complexity Level**: Rich

## Description

A precision engineering presentation theme inspired by carbon fiber composites. Light gray backgrounds with subtle carbon-weave texture patterns (SVG diagonal crosshatch), metallic blue accents, and sharp geometric lines. Features precision measurement decorations, hexagonal honeycomb fragments, and an engineering frame border. Clean, technical, premium aesthetic evoking aerospace and automotive engineering.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Sans SC"))
#show raw: set text(font: "DejaVu Sans Mono")

#show: carbon-fiber-theme.with(
  aspect-ratio: "16-9",
  footer: [Conference Name -- Track],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Engineering frame border with carbon weave texture, honeycomb decoration in top-right, centered dark title with metallic blue accent bar, subtitle in primary blue, author, institution, and date.

### `#slide(title: auto)`
Light gray content slide with persistent carbon weave texture, precision measurement lines overlay, and honeycomb fragment in bottom-right. Bold dark title with blue accent bar underline. Three-column footer with diamond separator.

### `#new-section-slide[...]`
Section divider with left metallic blue accent stripe, large silver section number, bold title, blue accent bar, carbon weave and precision lines background.

### `#focus-slide[...]`
Dark metallic blue background with carbon weave texture, engineering frame border, centered white text with accent bar below.

### `#ending-slide[...]`
Dark charcoal background with carbon weave texture, engineering frame, honeycomb decoration in bottom-left, centered white text with blue accent bar above and geo-divider below. Bookends with title slide via shared engineering frame element.

## Reusable Components

### `#concept-card(title, body, accent: palette.primary)`
Primary knowledge container with left colored stripe and geometric diamond marker. Use for core concepts and definitions.
```typst
#concept-card([Microstructure], [Carbon fibers consist of...], accent: palette.primary)
```

### `#insight-box(title, body)`
Highlighted key insight with metallic blue left border and light blue tinted background. Use for critical takeaways.
```typst
#insight-box([Critical Insight], [The tensile modulus directly correlates with...])
```

### `#stat-card(label, value, color: palette.primary)`
Large metric display with engineering precision feel. Uppercase label, bold oversized value, top-left accent marker.
```typst
#stat-card([Tensile Strength], [6.4 GPa], color: palette.primary)
```

### `#spec-card(title, body, accent: palette.titanium)`
Specification card with colored header bar and white body. Use for technical specifications and data sheets.
```typst
#spec-card([Standard Modulus (SM)], [- Modulus: 230-240 GPa], accent: palette.primary)
```

### `#material-box(title, body, accent: palette.primary)`
Material properties card with top accent border and subtle diamond decoration. Themed for material data.
```typst
#material-box([AFP Process Parameters], [...], accent: palette.primary)
```

### `#quote-card(quote-text, attribution: none)`
Precision-styled quotation with geometric quote mark, titanium left border, and optional attribution.
```typst
#quote-card([The challenge is not...], attribution: [Dr. Paul Lagacé, MIT])
```

### `#benchmark-card(title, items)`
Performance comparison card with colored indicators. Items is an array of dictionaries with `label`, `value`, and optional `color` keys.
```typst
#benchmark-card([Qualification Metrics], (
  (label: [OHC strength], value: [310 MPa], color: palette.primary),
  (label: [CAI strength], value: [220 MPa], color: palette.accent-red),
))
```

### `#callout-box(body, type: "info")`
Alert/notification box. Types: `"info"` (blue diamond), `"warning"` (red triangle), `"success"` (green circle).
```typst
#callout-box(type: "warning")[*Critical*: All allowables must include environmental conditioning.]
```

## Additional Utilities

### `#eng-tag(content, color: palette.primary)`
Small uppercase capsule label for categorization and tagging.
```typst
#eng-tag([CFRP], color: palette.primary)
```

### `#precision-divider(width: 80%)`
Horizontal separator styled as measurement line with diamond center and endpoint markers.
```typst
#precision-divider(width: 70%)
```

### `#geo-divider(width: 70%)`
Geometric divider with diamond markers, used for visual separation.
```typst
#geo-divider(width: 60%)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Light Gray** | `#F4F5F7` | `palette.bg` | Background |
| **Metallic Blue** | `#2563EB` | `palette.primary` | Primary accents, headers |
| **Titanium** | `#64748B` | `palette.titanium` | Secondary elements |
| **Silver** | `#94A3B8` | `palette.silver` | Tertiary, measurement lines |
| **Accent Red** | `#DC2626` | `palette.accent-red` | Warnings, alerts |
| **Text Dark** | `#0F172A` | `palette.text` | Main body text |
| **Text Muted** | `#475569` | `palette.text-muted` | Captions, footers |
| **White** | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| **Border** | `#CBD5E1` | `palette.border` | Borders, dividers |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.card-bg,
  neutral-darkest: palette.text,
)
```

## SVG Decorations

| Decoration | Description | Usage |
|-----------|-------------|-------|
| Carbon Weave | Diagonal crosshatch pattern (full-page) | All slide backgrounds |
| Precision Lines | Engineering ruler marks with corner registration | Content slide overlay |
| Honeycomb Fragment | Fading hexagonal grid in corner | Title, content, ending slides |
| Engineering Frame | Blueprint-style technical border with brackets | Title, focus, ending slides |
| Geo Divider | Diamond-marker separator line | Endings, manual separation |

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with realistic aerospace materials content.
