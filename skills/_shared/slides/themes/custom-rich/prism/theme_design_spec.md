# Prism Theme

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | prism |
| **Best For** | Tech/data presentations, scientific talks, innovation pitches, data visualization |
| **Style Objective** | Scientific / Data-Driven |
| **Complexity Level** | Rich |

A modern, scientific presentation theme for [Touying 0.7.4](https://github.com/touying-typ/touying). Inspired by light refraction through a prism -- spectral color bands, clean geometric angles, and rainbow-edge highlights. Combines optics aesthetics with modern data visualization principles.

## Design Philosophy

**Style**: Modern optics lab -- precise, colorful yet controlled, intellectual.

The Prism theme uses a **violet cover + white content** approach:
- **Cover & section slides** use a deep violet (#4C3D8F) background with prismatic triangle overlays
- **Content slides** use a clean white (#FAFBFD) background with spectral accents

**Signature Visual Elements**:
- Prismatic triangles (equilateral, layered with transparency)
- Spectral gradient band separators (full rainbow progression)
- Light ray dispersion lines (diverging from a focal point)
- Spectral color progression underlines (violet to blue to cyan)
- Faint geometric grid background pattern on content slides
- Multi-color dot navigation in footers

## Color Palette

| Token | Color | Hex | Usage |
|-------|-------|-----|-------|
| `palette.bg` | Light Gray-White | `#FAFBFD` | Content slide background |
| `palette.primary` | Deep Violet | `#4C3D8F` | Primary accent, cover backgrounds, headers |
| `palette.secondary` | Electric Blue | `#2E6BC6` | Secondary accent, overlays, underlines |
| `palette.accent` | Spectrum Orange | `#E8793B` | Warm accent, contrast highlights |
| `palette.highlight` | Cyan | `#0EA5C8` | Featured content, alert highlights |
| `palette.text-dark` | Near-Black | `#1A1A2E` | Headings and titles |
| `palette.text-body` | Dark Violet-Gray | `#3D3D56` | Body text |
| `palette.text-muted` | Muted Purple-Gray | `#6D6D82` | WCAG-AA captions, labels, and footers |
| `palette.card-bg` | Card White | `#FFFFFF` | Card and component backgrounds |
| `palette.border` | Subtle Border | `#E2E4ED` | Card and table borders |
| `palette.violet` | Violet | `#4C3D8F` | Spectral progression start |
| `palette.indigo` | Indigo | `#3B4FC4` | Spectral progression |
| `palette.blue` | Blue | `#2E6BC6` | Spectral progression |
| `palette.cyan` | Cyan | `#0EA5C8` | Spectral progression |
| `palette.green` | Green | `#10B981` | Spectral progression |
| `palette.orange` | Orange | `#E8793B` | Spectral progression |
| `palette.red` | Red | `#DC4A5F` | Spectral progression end |
| `palette.cyan-text` | Dark Cyan | `#08758D` | Accessible cyan text on light surfaces |
| `palette.green-text` | Dark Green | `#087A5A` | Accessible green text on light surfaces |
| `palette.orange-text` | Burnt Orange | `#A84213` | Accessible orange text on light surfaces |
| `palette.red-text` | Dark Rose | `#B92C45` | Accessible red text on light surfaces |

Bright spectral tokens are reserved for rules, fills, and dots. Text-bearing components map them through `spectrum-text-color` so small text retains WCAG-AA contrast.

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Theme accent, `alert()` text, cover backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` | Dark text on light backgrounds |

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: prism-theme.with(
  aspect-ratio: "16-9",
  footer: [Company Name | Presentation],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle goes here],
    author: [Author Name],
    institution: [Organization],
    date: datetime.today(),
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here.

#ending-slide()[Thank You]
```

## Theme Entry Point

### `prism-theme()`

```typst
#let prism-theme(
  aspect-ratio: "16-9",  // "16-9" or "4-3"
  align: horizon,         // Vertical alignment for content
  footer: none,           // Footer text (left side)
  ..args,                 // Additional Touying config
  body,
)
```

## Slide Functions

### `title-slide(..args)`

Full-page deep violet (#4C3D8F) title slide with prismatic triangle overlays, light ray dispersion, and spectral band decoration. Displays title, subtitle, author, institution, and date from `config-info`. White text on violet background with cyan/blue accent lines.

### `slide(title: auto, ..args)`

Standard content slide with:
- Spectral gradient band top bar (full rainbow)
- Bold dark title with violet-blue-cyan underline progression
- Faint geometric grid background pattern
- Footer with spectral dots and page number

When `title: auto`, uses the current level-2 heading as the title.

### `new-section-slide(self: none, body)`

Automatically generated when using `= Section Title`. Deep violet background with prismatic triangle overlays and the section name in bold white text with spectral band underline.

### `focus-slide(body)`

Deep violet (#4C3D8F) background slide for impactful quotes or key messages. White bold text centered. Prismatic triangle overlays and spectral band top decoration.

### `ending-slide(body)`

Light background with a centered white card, spectral band decoration, prismatic underline, and rainbow dot pattern. Ideal for "Thank You" or closing messages.

## Reusable Components

### `spectrum-card(title, body, index: 0)`

Card with spectral-colored left border. Border color cycles through the 7 spectral colors based on `index`.

```typst
#spectrum-card([Feature Name], [Description of the feature.], index: 2)
```

### `wavelength-stat(label, value, unit: none, color: palette.primary)`

Large metric display with spectral color accent on the bottom border. For KPI and data visualization.

```typst
#wavelength-stat([Revenue], [$2.4M], unit: [annual], color: palette.blue)
```

### `refraction-box(title, body)`

Violet-accented callout box with light violet background for key insights or important information.

```typst
#refraction-box([Key Insight], [This is an important observation.])
```

### `band-divider(width: 100%)`

Spectral gradient horizontal separator spanning the full rainbow from violet to red.

```typst
#band-divider(width: 80%)
```

### `photon-tag(content, color: palette.primary)`

Small colored tag/chip with transparent background and colored border. For labels and categories.

```typst
#photon-tag([Machine Learning], color: palette.blue)
```

### `lens-highlight(title, body)`

Cyan-highlighted emphasis box with top border for featured content.

```typst
#lens-highlight([Featured], [This content is highlighted with a cyan accent.])
```

### `diffraction-grid(headers, rows, columns: auto, text-size: 0.82em, align: center + horizon)`

Styled data table with violet header row and alternating row colors. Equal-width columns are the default; callers may pass a custom `columns` tuple for long labels or reduce `text-size` for a demanding full-page table.

```typst
#diffraction-grid(
  ([Name], [Value], [Status]),
  (
    ([Item A], [100], [Active]),
    ([Item B], [200], [Pending]),
  ),
  columns: (1.3fr, 0.7fr, 1fr),
)
```

### `prism-card(number, title, description)`

Numbered feature card with spectral color cycling based on number.

```typst
#prism-card(1, [Feature Name], [Description of the feature.])
```

### `roadmap-card(period, title, body, color: palette.primary)`

Phase card with a spectral top edge and standard Typst list content. It is height-equalized for one-card-per-column `cols(lazy-layout: true)` layouts.

```typst
#roadmap-card([Q4 2025], [Foundation], [
  - Multi-cloud deployment
  - Edge spectral nodes
], color: palette.violet)
```

## Helper Functions

| Function | Description |
|----------|-------------|
| `spectrum-color(index)` | Returns spectral color by index (cycles through 7) |
| `spectrum-text-color(color)` | Maps bright spectral tokens to accessible text variants |
| `prism-triangle(width: 80pt)` | SVG prismatic triangle decoration |
| `spectral-band(width: 100%)` | SVG spectral gradient band |
| `light-rays(width: 140pt)` | SVG light ray dispersion lines |
| `prism-bg-pattern()` | Faint geometric grid background |

## File Structure

```
prism/
├── template.typ          # Theme definition (colors, SVGs, slides, components)
├── demo.typ              # 16-slide demo presentation
├── theme.md              # Theme API reference
├── theme_design_spec.md  # Visual design specification
└── output/               # Compiled review artifacts
```

## Best For

- Tech company presentations and product launches
- Data analytics and visualization talks
- Scientific research presentations
- Innovation pitches and startup fundraising
- Engineering architecture reviews
- Conference talks on technology topics

## Recommended Complexity

**Rich** -- This theme includes rich geometric decorations (SVG prismatic triangles, spectral bands, light rays), a comprehensive component library (8 components), and a full spectral color system. It works best when leveraging spectrum cards, wavelength stats, diffraction grids, and photon tags for data-heavy content.

## Fonts

Fonts are **not** set in `template.typ`. Set your preferred fonts in `main.typ` (or `demo.typ`) via `#set text(font: ...)` before the `#show: prism-theme.with(...)` call.

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable
- **Aspect Ratios**: 16:9 (default), 4:3
