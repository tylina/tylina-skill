# Prism Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `prism-theme`
**Style**: Scientific optics -- spectral colors, prismatic geometry, clean white backgrounds
**Primary color**: `#4C3D8F` (Deep Violet)
**Best For**: Tech/data presentations, scientific talks, innovation pitches, data visualization
**Style Objective**: Scientific / Data-Driven
**Complexity Level**: Rich

## Description

A modern, scientific presentation theme inspired by light refraction through a prism. Features spectral color bands (violet through red), clean geometric angles, prismatic triangle SVG decorations, and rainbow-edge highlights. Uses a deep violet cover/section design paired with clean white content slides. Best suited for tech presentations, data analytics talks, scientific research, and innovation pitches.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: prism-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
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
| `footer` | content/function | `none` | Footer content |
| `align` | alignment | `horizon` | Default vertical alignment |

## Available Slide Types

### `#title-slide()`
Deep violet (#4C3D8F) background with prismatic triangle overlays, light ray dispersion, white centered title, and spectral band decoration.

### `#slide(title: auto)`
White background content slide with spectral gradient band top bar, bold title with violet-blue-cyan underline, faint geometric grid background, and spectral dot footer.

### `#new-section-slide[...]`
Deep violet background with prismatic triangle cutouts, bold white section title, and spectral band underline.

### `#focus-slide[...]`
Full violet (#4C3D8F) background with large white centered text, prismatic overlays, and spectral band top edge.

### `#ending-slide[...]`
Light background with centered white card, spectral band header, prismatic color underline, and rainbow dot pattern.

## Reusable Components

### `#spectrum-card(title, body, index: 0)`
Card with spectral-colored left border; color cycles through 7 spectral colors based on index.
```typst
#spectrum-card([Feature], [Description of the feature.], index: 0)
```

### `#wavelength-stat(label, value, unit: none, color: palette.primary)`
Large metric display with colored bottom border for KPI data visualization.
```typst
#wavelength-stat([Revenue], [$2.4M], unit: [annual], color: palette.blue)
```

### `#refraction-box(title, body)`
Violet-accented callout box with light background for key insights or important information.
```typst
#refraction-box([Important], [This is a key takeaway.])
```

### `#band-divider(width: 100%)`
Spectral gradient horizontal separator (full rainbow from violet to red).
```typst
#band-divider(width: 80%)
```

### `#photon-tag(content, color: palette.primary)`
Small colored tag/chip with transparent background for labels and categories.
```typst
#photon-tag([Machine Learning], color: palette.blue)
```

### `#lens-highlight(title, body)`
Cyan-highlighted emphasis box with top border for featured content.
```typst
#lens-highlight([Featured], [Highlighted content here.])
```

### `#diffraction-grid(headers, rows, columns: auto, text-size: 0.82em, align: center + horizon)`
Styled table with violet header row and alternating row colors. By default, all columns are equal; pass a `columns` tuple when long labels need more room or reduce `text-size` for a demanding full-page table.
```typst
#diffraction-grid(
  ([Name], [Value]),
  (([Item A], [100]),),
  columns: (1.4fr, 0.6fr),
)
```

### `#prism-card(number, title, description)`
Numbered feature card with spectral color cycling based on number.
```typst
#prism-card(1, [Feature], [Description of feature.])
```

### `#roadmap-card(period, title, body, color: palette.primary)`
Phase card with a spectral top edge and standard Typst list content. Use one card per column with `cols(lazy-layout: true)`.
```typst
#roadmap-card([Q4 2025], [Foundation], [
  - Multi-cloud deployment
  - Edge spectral nodes
], color: palette.violet)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Background** | `#FAFBFD` | `palette.bg` | Light slide background fill |
| **Primary** | `#4C3D8F` | `palette.primary` | Deep violet, cover backgrounds, main accent |
| **Secondary** | `#2E6BC6` | `palette.secondary` | Electric blue, overlays, secondary accent |
| **Accent** | `#E8793B` | `palette.accent` | Spectrum orange, warm contrast |
| **Highlight** | `#0EA5C8` | `palette.highlight` | Cyan, featured content emphasis |
| **Text Dark** | `#1A1A2E` | `palette.text-dark` | Headings and titles |
| **Text Body** | `#3D3D56` | `palette.text-body` | Paragraph content |
| **Text Muted** | `#6D6D82` | `palette.text-muted` | WCAG-AA captions, labels, and footers |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Card and component surfaces |
| **Border** | `#E2E4ED` | `palette.border` | Card and table borders |
| **Violet** | `#4C3D8F` | `palette.violet` | Spectral progression start |
| **Indigo** | `#3B4FC4` | `palette.indigo` | Spectral progression |
| **Blue** | `#2E6BC6` | `palette.blue` | Spectral progression |
| **Cyan** | `#0EA5C8` | `palette.cyan` | Spectral progression |
| **Green** | `#10B981` | `palette.green` | Spectral progression |
| **Orange** | `#E8793B` | `palette.orange` | Spectral progression |
| **Red** | `#DC4A5F` | `palette.red` | Spectral progression end |
| **Cyan Text** | `#08758D` | `palette.cyan-text` | Accessible cyan text on light surfaces |
| **Green Text** | `#087A5A` | `palette.green-text` | Accessible green text on light surfaces |
| **Orange Text** | `#A84213` | `palette.orange-text` | Accessible orange text on light surfaces |
| **Red Text** | `#B92C45` | `palette.red-text` | Accessible red text on light surfaces |

Bright spectral tokens remain available for rules, fills, and dots. Text-bearing components automatically map them to the darker `*-text` variants.

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example
- `theme.md` -- Theme API reference
- `theme_design_spec.md` -- Visual design specification

## Demo

See `demo.typ` for a compilable example.
