# Anthropic Theme

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | anthropic |
| **Best For** | AI/tech startups, research presentations, developer talks |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `anthropic-theme`
**Style**: Tech-forward, professional, modern — dark/light mixed design with orange accents
**Primary color**: `#D97757` (Anthropic Orange)

## Description

A tech-forward, professional theme inspired by Anthropic's brand design. Features a mixed dark/light approach: dark gradient covers and chapter dividers with warm white content slides. Orange accent bars, subtle glow effects, and card-based layouts create a modern aesthetic perfect for AI tech talks, developer conferences, technical training, and product launches.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: anthropic-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Claude: Next-Generation AI Assistant],
    subtitle: [Safe, Helpful & Honest],
    author: [Anthropic Research Team],
    date: datetime.today(),
    institution: [Anthropic],
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
Dark gradient cover slide with orange accents. Features decorative glow circles, left orange gradient bar, centered title in white, orange-blue gradient line, author info in orange, and subtle line decorations.

### `#slide(title: auto)`
Standard content slide with orange top bar (6px), bold dark title with orange underline, warm white background (`#F5F5F0`), footer with orange dot separator and page numbers.

### `#new-section-slide[...]`
Dark gradient chapter divider with left orange-to-blue gradient bar, large white section title, orange underline accent, decorative circles, and bottom line elements. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with dark gradient background, centered orange glow effect circles, and large bold white text.

### `#ending-slide[...]`
Closing slide with warm white background, centered white card with rounded corners, large orange thank-you text, and orange-blue gradient line decoration.

## Reusable Components

### `#feature-card(number, title, description, accent: auto)`
Card with colored top border and circular number badge. Auto-cycles through brand accent colors (orange→blue→green→red). Great for feature lists, pillars, and case studies.

```typst
#feature-card(1, [Foundation Model], [
  Custom transformer architecture with mixture-of-experts routing.
])
```

### `#metric-card(label, value, trend: none, accent: palette.orange, inset-y: .8em)`
KPI-like metric display with large value number, colored left accent border, and optional trend indicator. Perfect for dashboards and key statistics.
Use `inset-y` only when a verified dense normal-flow series requires less card
padding; it does not change the stack's semantic spacing.

```typst
#metric-card(
  [Model Parameters],
  [175B+],
  trend: [#sym.arrow.t Next-gen],
  accent: palette.orange,
)
```

### `#insight-box(title, body)`
Orange-accented insight callout with left border. For key takeaways and important highlights.

```typst
#insight-box([Key Insight])[
  Claude achieves state-of-the-art results across reasoning benchmarks.
]
```

### `#warning-box(title, body)`
Red-accented warning callout. For risks, challenges, and important cautions.

### `#success-box(title, body)`
Green-accented success callout. For achievements, positive outcomes, and milestones.

### `#code-block(title, body)`
Styled code display area with dark header bar (title in orange) and dark code body. Ideal for API examples and code snippets.

```typst
#code-block([API Request])[
  ```
  POST /v1/messages
  {"model": "claude-sonnet-4"}
  ```
]
```

### `#data-table(headers, rows)`
Styled table with dark header row and alternating warm white/white backgrounds.

```typst
#data-table(
  ([Benchmark], [Score], [Delta]),
  (
    ([MMLU], [92.0%], [+3.2%]),
    ([HumanEval], [92.4%], [+8.1%]),
  ),
)
```

### `#stat-row(..items)`
Horizontal row of large stat numbers with auto-cycling accent colors.

```typst
#stat-row(
  (value: [16], label: [Principles]),
  (value: [98.7%], label: [Compliance]),
)
```

### `#phase-card(phase, title, items, accent: auto)`
Timeline/roadmap card with colored top border. For project phases and strategic planning.

```typst
#phase-card([Q1 2025], [Foundation], [
  - Model launch
  - Extended context
], accent: palette.orange)
```

## Helper Functions

### `#accent-color(index)`
Returns accent color by index (cycles: orange→blue→green→red).

### `#orange-bar(height: 6pt)`
Full-width orange bar.

### `#accent-line(width: 80pt, color: palette.orange)`
Short colored underline accent for titles.

### `#gradient-line(width: 200pt)`
Orange-to-blue gradient line decoration.

### `#glow-circle(radius: 80pt, color: palette.orange)`
Decorative glow circle for dark backgrounds.

## Color Scheme

```typst
#let palette = (
  // Brand
  orange:       rgb("#D97757"),   // Primary accent
  dark:         rgb("#1A1A2E"),   // Deep Space Gray
  blue:         rgb("#4A90D9"),   // Tech Blue
  green:        rgb("#10B981"),   // Mint Green
  red:          rgb("#EF4444"),   // Coral Red
  // Background & surface
  bg:           rgb("#F5F5F0"),   // Warm White background
  card:         rgb("#FFFFFF"),   // Card background
  border:       rgb("#E5E5E0"),   // Border color
  // Text
  text-dark:    rgb("#1A1A2E"),   // Heading text
  text-body:    rgb("#4A4A5A"),   // Body text
  text-light:   rgb("#8A8A9A"),   // Secondary text
  // Derived
  dark-surface: rgb("#16213E"),   // Dark surface variant
  dark-accent:  rgb("#0F3460"),   // Dark accent variant
)
```

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.orange` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.dark` | Dark text on light backgrounds |

## Design Characteristics

- **Mixed Theme**: Dark gradient covers/chapters + warm white content slides
- **Orange Top Bar**: 6px solid orange bar on every content slide
- **Glow Effects**: Subtle orange/blue glow circles on dark backgrounds
- **Card Shadows**: White cards with border styling and colored top borders
- **Gradient Accents**: Orange-to-blue gradient lines and bars
- **Left Accent Bars**: Orange gradient vertical bars on covers and section slides
- **Recommended Complexity**: Rich

## Best For

- AI technology talks and research presentations
- Developer conferences and technical keynotes
- Technical training and workshops
- Product launches and demos
- Safety and alignment research presentations

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Full usage example (compilable, 18 slides)
- `README.md` — This documentation
