# CATARC Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | catarc |
| **Best For** | Automotive industry, research reports, technical standards presentations |
| **Style Objective** | Consulting |
| **Complexity Level** | Rich |

A modern, authoritative automotive industry presentation theme inspired by CATARC (China Automotive Technology & Research Center) design language. Combines standard, business, and modern futuristic design variants into one versatile theme.

## Design Philosophy

- **Mixed Dark/Light**: Dark immersive covers and section dividers with clean white content slides
- **Tech-Forward**: Geometric tech lines, neon cyan accents, and gradient backgrounds convey cutting-edge automotive technology
- **Authoritative**: Deep blue primary palette communicates trust, professionalism, and industry authority
- **Automotive DNA**: Card-based layouts for test results, metrics, and specifications reflect automotive testing and certification workflows

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `palette.blue` | `#003366` | Primary Deep Blue — headers, backgrounds, section slides |
| `palette.tech` | `#0050B3` | Tech Blue — card accents, gradients |
| `palette.bright` | `#007ACC` | Bright Blue — links, underlines, highlights |
| `palette.cyan` | `#00E5FF` | Neon Cyan — futuristic accents, decorative lines |
| `palette.red` | `#D32F2F` | Vibrant Red — alerts, fail indicators, accent stripes |
| `palette.bg` | `#FFFFFF` | White — content slide background |
| `palette.bg-cool` | `#F0F2F5` | Cool Gray — alternating table rows |
| `palette.card-bg` | `#FFFFFF` | White — card surfaces |
| `palette.text-dark` | `#1A1A2E` | Dark — primary headings |
| `palette.text-body` | `#4A5568` | Gray — body text |
| `palette.text-light` | `#718096` | Light Gray — captions, footer |
| `palette.border` | `#CBD5E0` | Border — card and table borders |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.bright` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.blue` | Dark text on light backgrounds |

## Slide Functions

### `slide(title: auto, ..args)`
Standard content slide with white background, blue gradient top bar, bold dark blue title with cyan underline accent, and footer with page numbers.

### `title-slide(..args)`
Full-bleed dark cover slide with deep blue gradient background, geometric tech line decorations, white title text, cyan subtitle, and red accent stripe.

### `new-section-slide(self: none, body)`
Section divider with deep blue radial gradient background, large semi-transparent section number on the right, "SECTION" label in cyan, and white section title. Automatically triggered by `= Section Name` headings.

### `focus-slide(body)`
Minimal dark slide for quotes or key messages. Deep blue gradient background with centered white text.

### `ending-slide(body)`
Closing slide with blue gradient background, centered white text, cyan accent line, and red dot decoration.

## Reusable Components

### `spec-card(number, title, description, accent: auto)`
Numbered specification or feature card with colored left border and numbered badge. Ideal for listing testing standards, product features, or technical specifications.

```typst
#spec-card(1, [Battery Safety Testing], [
  Covers thermal propagation, external fire, mechanical shock...
], accent: palette.tech)
```

### `metric-card(label, value, unit: none, accent: palette.tech)`
Key performance metric card with colored top border, large value display, and optional unit. Perfect for KPIs and automotive performance data.

```typst
#metric-card([Annual Production], [9.58M], unit: [units], accent: palette.tech)
```

### `test-result(title, status, body)`
Test or certification result card with pass/fail badge indicator. Left border color automatically reflects status (green for pass, red for fail).

```typst
#test-result([Battery Safety Test], "pass")[
  - Thermal propagation: Warning time > 8 minutes
  - External fire: No ignition within 2 minutes
]
```

### `highlight-box(title, body)`
Blue-accented information highlight box for key insights, summaries, or callouts.

```typst
#highlight-box([Key Insight])[
  Market penetration exceeded 30% for the first time...
]
```

### `data-table(headers, rows)`
Styled data table with deep blue header row and alternating row colors (white/cool gray).

```typst
#data-table(
  ([Standard], [Count], [New in 2024]),
  (
    ([Safety], [28], [+5]),
    ([Performance], [22], [+3]),
  ),
)
```

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: catarc-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [CATARC],
  ),
)
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default content alignment |
| `footer` | `content/function` | `none` | Footer content or function |

## Fonts

Fonts are **not** set in `template.typ`. Set your preferred fonts in `main.typ` (or `demo.typ`) via `#set text(font: ...)` before the `#show: catarc-theme.with(...)` call.

## Best For

- Automotive industry presentations
- Product certification and compliance reports
- NEV (New Energy Vehicle) technical reports
- EV/autonomous driving technology promotion
- Testing laboratory capability showcases
- Automotive standards and regulation briefings

## Recommended Complexity

**Rich** — This theme uses rich visual elements including gradients, decorative tech lines, semi-transparent overlays, and card-based layouts. Best suited for formal presentations where visual impact matters.

## File Structure

```
catarc/
├── template.typ    # Theme definition (colors, slides, components)
├── demo.typ        # Demo presentation (14-16 slides, Chinese content)
├── README.md       # This documentation
└── output/         # Compiled slide images
```

## Touying Compatibility

This theme is built for **Touying 0.7.4** and uses the standard Touying slide wrapper API (`touying-slide-wrapper`, `touying-slide`, `config-page`, `config-common`, `config-store`, etc.).
