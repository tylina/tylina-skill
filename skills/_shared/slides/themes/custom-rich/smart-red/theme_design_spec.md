# Smart-Red Theme

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | smart-red |
| **Best For** | Corporate presentations, business reports, formal events |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |

A modern, energetic, and professional presentation theme for [Touying 0.7.4](https://github.com/touying-typ/touying). Features geometric triangle motifs, a dark/colorful cover with light content pages, and a bold red-black design language.

## Design Philosophy

**Style**: Modern, energetic, professional, geometric hybrid theme.

The Smart-Red theme uses a **dark cover + light content** approach:
- **Cover & section slides** use a dark (#333) background with vivid red triangular overlays
- **Content slides** use a clean light (#F5F5F7) background with red accent bars

**Signature Visual Elements**:
- Large triangular cutouts with semi-transparency (multi-layer overlays)
- Red-black geometric contrast with 3D shadow effects
- Dual-line decorations (red + orange)
- Diagonal line textures for depth
- Consistent red dot navigation in footers

## Color Palette

| Token | Color | Hex | Usage |
|-------|-------|-----|-------|
| `palette.red` | 🔴 Primary Red | `#DE3545` | Primary accent, top bars, badges |
| `palette.orange` | 🟠 Auxiliary Orange | `#F0964D` | Secondary accent, alternating elements |
| `palette.red-text` | Semantic Red | `#B52334` | Accessible emphasis and table headers |
| `palette.orange-text` | Semantic Orange | `#91460D` | Accessible orange labels and KPI values |
| `palette.dark` | ⬛ Dark Background | `#333333` | Cover/section slide backgrounds |
| `palette.bg` | ⬜ Light Gray | `#F5F5F7` | Content slide background |
| `palette.card-bg` | ⬜ Card White | `#FFFFFF` | Card and component backgrounds |
| `palette.text-dark` | Title Text | `#222222` | Headings and titles |
| `palette.text-body` | Body Text | `#555555` | Paragraph content |
| `palette.text-light` | Light Text | `#6B6B70` | Accessible captions and footers |
| `palette.border` | Border | `#E0E0E0` | Card and table borders |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.red-text` | Accessible `alert()` and semantic emphasis text |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` | Dark text on light backgrounds |

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

#show: smart-red-theme.with(
  aspect-ratio: "16-9",
  footer: [My Company | Confidential],
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

### `smart-red-theme()`

```typst
#let smart-red-theme(
  aspect-ratio: "16-9",  // "16-9" or "4-3"
  align: horizon,         // Vertical alignment for content
  footer: none,           // Footer text (left side)
  ..args,                 // Additional Touying config
  body,
)
```

## Slide Functions

### `title-slide(..args)`

Full-page dark (#333) title slide with multi-layer red triangle overlays. Displays title, subtitle, author, institution, and date from `config-info`. White text on dark background with red-orange accent lines.

### `slide(title: auto, align: auto, ..args)`

Standard content slide with:
- Red 4pt top bar
- Bold dark title with red+orange underline
- Light gray background
- Footer with red dots and page number

When `title: auto`, uses the current level-2 heading as the title.
Set `align: top` for dense analytical slides that should flow directly below the header.

### `new-section-slide(self: none, body)`

Automatically generated when using `= Section Title`. Dark background with large triangular cutouts and the section name in bold white text.

### `focus-slide(body)`

Full red (#DE3545) background slide for impactful quotes or key messages. White bold text centered. Subtle white triangle overlays for texture.

### `ending-slide(body)`

Light background with a centered white card, red accent bar, and dual-line decoration. Ideal for "Thank You" or closing messages.

## Reusable Components

### `feature-card(number, title, description, accent: auto)`

Numbered card with colored top border. When `accent: auto`, cycles between red (#DE3545) and orange (#F0964D) based on the number.

```typst
#grid(columns: 2, column-gutter: 1em,
  feature-card(1, [AI Engine], [Description of the AI engine feature.]),
  feature-card(2, [IoT Hub], [Description of the IoT hub feature.]),
)
```

### `metric-card(label, value, trend: none, accent: palette.red)`

KPI display card with a large value, colored left border, and optional trend indicator.

```typst
#metric-card([Revenue], [$2.4M], trend: [↑ 32% YoY], accent: palette.red)
```

### `highlight-box(title, body)`

Red-accented callout box for key insights, warnings, or important information. Light red background with bold red left border.

```typst
#highlight-box([Important], [
  This is a key takeaway that should stand out.
])
```

### `product-card(title, body)`

Clean card with subtle border and red dot accent. For product or feature showcases.

```typst
#product-card([Product Name], [
  Description of the product features and benefits.
])
```

### `phase-card(phase, title, period, body, accent: palette.red)`

Compact milestone card for side-by-side rollout timelines. The component keeps all vertical spacing in one stack and supports height equalization when it is the only component in a lazy column.

```typst
#phase-card([PHASE 1], [Foundation], [Q3 2025], [- Infrastructure setup])
```

Cards include one terminal flexible spacer for `cols(lazy-layout: true)`; keep exactly one direct card component in each lazy-layout column. The spacer is inert in ordinary layouts.

### `data-table(headers, rows, text-size: 0.82em, cell-inset: ...)`

Styled table with red header row and alternating row colors.

```typst
#figure[
  #data-table(
    ([Name], [Value], [Status]),
    (
      ([Item A], [100], [Active]),
      ([Item B], [200], [Pending]),
    ),
  )
]
```

## Helper Functions

| Function | Description |
|----------|-------------|
| `red-bar(height: 4pt)` | Full-width red accent bar |
| `triangle-accent(size, fill-color, opacity)` | Decorative triangle polygon |
| `dual-lines(width: 120pt)` | Red + orange parallel line decoration |
| `red-dots(count: 3, size: 3pt)` | Alternating red/orange dot pattern |
| `accent-color(index)` | Returns red or orange by index |

## File Structure

```
smart-red/
├── template.typ    # Theme definition (colors, slides, components)
├── demo.typ        # 17-slide demo presentation
├── output/         # Compiled PNG slides
├── theme.md        # Public API reference
└── theme_design_spec.md
```

## Best For

- Company introductions and corporate presentations
- Product launches and feature announcements
- Solution architecture and technical proposals
- Education courseware and training materials
- Annual reports and business reviews

## Recommended Complexity

**Rich** — This theme includes rich geometric decorations, multi-layer overlays, and a comprehensive component library. It works best when you leverage its full design vocabulary including feature cards, metric cards, data tables, and highlight boxes.

## Fonts

Fonts are **not** set in `template.typ`. Set your preferred fonts in `main.typ` via `#set text(font: ...)` before the `#show: smart-red-theme.with(...)` call. The demo uses the installed stack `("IBM Plex Sans", "Noto Sans SC")`.

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable
- **Aspect Ratios**: 16:9 (default), 4:3
