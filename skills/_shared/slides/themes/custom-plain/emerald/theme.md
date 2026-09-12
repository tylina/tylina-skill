# Emerald Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `emerald-theme`
**Style**: Luxurious, premium — emerald green with gold accents
**Primary color**: `#1B5E20` (dark emerald green)
**Best For**: Finance, luxury brands, premium corporate events
**Style Objective**: Consulting
**Complexity Level**: Plain

## Description

A restrained, luxurious presentation theme featuring emerald green and gold accents. Designed for premium finance reports, luxury brand presentations, high-end corporate events, and executive-level communications. Its identity comes from typography, whitespace, a narrow gold rule, diamond ornaments, and a small set of practical financial components.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: emerald-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Premium cover slide with dark green background. Title displayed in white with gold decorative line below. Small diamond ornament above the title. Author, institution, and date in white. Reads from `config-info()`.

### `#slide(title: auto)`
Standard content slide with an open white header: a muted section label, emerald slide title, and short gold underline share the content axis. Footer includes custom content and a gold-tinted page counter.

### `#new-section-slide[...]`
Section divider with large bold title in emerald green, framed by gold decorative lines above and below. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with very dark green background and gold text. Perfect for key quotes or pivotal statements.

### `#ending-slide[...]`
Closing slide with dark green background, white bold text, and a decorative gold line with diamond ornament below.

## Reusable Components

### `#gem-card(title, body, accent: none)`
Card with gold top border and light green background. Great for callouts, key insights, and highlighted information.

```typst
#gem-card([Key Insight])[
  Important information displayed in a premium card format.
]

// With custom accent color:
#gem-card([Note], accent: palette.accent)[
  Card with green accent instead of gold.
]
```

### `#value-display(label, value)`
Large value display with a label and formatted value. Designed for financial figures, KPIs, and metrics.

```typst
#value-display([Total Revenue], [\$4.2B])
#value-display([YTD Return], [+14.7%])
```

### `#gold-divider()`
Decorative gold line divider with a small diamond shape in the center. Use to separate content sections elegantly.

```typst
#gold-divider()
```

### Checklist styling

The theme styles cheq's native checklist markup with emerald checkmarks. Use standard list syntax rather than a wrapper component.

```typst
- [x] First completed item
- [x] Second completed item
- [ ] Pending item
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#1B5E20` | `palette.primary` | Dark emerald green — headers, titles |
| **Secondary** | `#2E7D32` | `palette.secondary` | Forest green — secondary elements |
| **Accent** | `#43A047` | `palette.accent` | Medium green — checkmarks, border accents |
| **Gold** | `#FFB300` | `palette.gold` | Amber gold — decorative lines, ornaments |
| **Gold Light** | `#FFD54F` | `palette.gold-light` | Light gold — subtitle highlights |
| **Background** | `#F1F8E9` | `palette.bg` | Very light green — card backgrounds |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White — value display backgrounds |
| **Deep** | `#0D3B0E` | `palette.deep` | Very dark green — focus/title slide backgrounds |
| **Text Dark** | `#1B2631` | `palette.text-dark` | Near black — body text |
| **Text Light** | `#546E7A` | `palette.text-light` | Blue-gray — secondary text, labels |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  secondary: palette.secondary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)
- `theme.md` — This documentation file

## Demo

See `demo.typ` for a full compilable example showcasing all slide types and components.
