# Aurora Borealis Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | aurora-borealis |
| **Best For** | Science presentations, creative pitches, research talks, data storytelling |
| **Style Objective** | Ethereal / Scientific Beauty |
| **Complexity Level** | Rich |

A soft violet, teal, and emerald gradient palette on clean white/light backgrounds. Wavy aurora-band SVG decorations flow across slide headers, creating a dreamy northern-lights atmosphere that is both scientific and beautiful.

## Design Philosophy

- **Ethereal Light**: Multi-layered aurora wave bands with gradient colors simulate the flowing northern lights
- **Constellation Depth**: Scattered dot patterns with connecting lines evoke a starfield observatory aesthetic
- **Gradient Harmony**: Violet-to-teal-to-green color transitions unify all decorative elements
- **Warm Scientific**: Clean light backgrounds keep content readable while aurora accents add visual wonder

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Clean White | `#FAFCFF` | Background |
| Deep Violet | `#4A2C6E` | Primary accent |
| Aurora Teal | `#2EC4B6` | Decorative secondary accent |
| Aurora Green | `#3DDC97` | Decorative tertiary accent |
| Soft Pink | `#E8A1D0` | Decorative highlight |
| Deep Teal | `#186F69` | Accessible focus-page background |
| Text Teal | `#17776F` | Light-surface teal text, 5.38:1 on white |
| Text Green | `#14734E` | Light-surface green text, 5.85:1 on white |
| Text Pink | `#9A3D75` | Light-surface pink text, 6.37:1 on white |
| Dark Text | `#2B2D42` | Heading text |
| Body Text | `#3D4055` | Body copy |
| Muted Text | `#686B7E` | Secondary copy, 5.26:1 on white |

## Typography

- Body: 20pt default
- Headings: Bold, dark text color (`#2B2D42`)
- Title slide: 2.4em bold white on deep violet
- Font ownership: the theme sets size and color only; each deck selects installed Latin/CJK font families

## SVG Decorations

- **Aurora wave band**: Multi-path flowing curves with gradient strokes (violet to teal to green)
- **Aurora atmosphere**: Full-page faint flowing bands with corner constellation dots
- **Constellation dots**: Star points with connecting lines forming subtle patterns
- **Aurora curtain**: Vertical flowing ribbon strokes for title/section backgrounds
- **Aurora divider**: Wavy gradient separator line with glow effect
- **Quote mark**: Stylized quotation marks with aurora gradient fill

## Slide Types

- `title-slide` -- Deep violet sky with aurora curtain, stars, centered content
- `slide` -- Light background, aurora wave header, constellation atmosphere
- `new-section-slide` -- Deep background with aurora wave band and section title
- `focus-slide` -- Deep teal background with aurora shimmer, bold centered text
- `ending-slide` -- Light background with aurora frame (bookend with title)

## Components

- `concept-card(title, body, accent)` -- Intrinsic-height aurora-bordered card with gradient left accent
- `insight-box(title, body)` -- Highlighted callout with violet accent and terminal lazy-layout spacer
- `stat-card(label, value, unit, accent)` -- Intrinsic centered value → label → unit stack
- `quote-card(quote-text, attribution)` -- Blockquote with aurora SVG quotation marks and terminal lazy-layout spacer
- `feature-card(number, title, description)` -- Intrinsic numbered card with aurora color cycling and accessible badge fill
- `highlight-box(title, body)` -- Teal aurora-glow emphasis box with constellation decoration
- `data-card(title, body)` -- Structured data display with aurora divider and terminal lazy-layout spacer
- `callout-box(title, body, accent)` -- Versatile alert/info box with color variants
- `roadmap-card(year, title, body, accent)` -- Intrinsic-height timeline panel for regular grids
- `aurora-tag(content, color)` -- Small colored pill/chip element
- `aurora-table(headers, rows, align)` -- Bare table with semantic header and configurable alignment
- `aurora-wave(width, height)` -- Render aurora wave band inline
- `aurora-divider(width, height)` -- Render aurora divider inline
- `constellation-dots(width)` -- Render constellation dots inline

## Layout Semantics

- `stack(spacing:)` owns all sequential visual regions, including header, title/ending metadata, KPI internals, and multi-part demo compositions.
- `cols()` is reserved for semantic side-by-side regions; `grid()` owns regular card and KPI matrices.
- Stretchable components retain one terminal `lazy-v(1fr)`, inert outside lazy layout. Each `cols(lazy-layout: true)` column contains exactly one direct stretchable component.
