# Carbon Fiber Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | carbon-fiber |
| **Best For** | Aerospace/automotive engineering, performance analysis, premium product pitches |
| **Style Objective** | Precision Engineering / Premium |
| **Complexity Level** | Rich |

A precision engineering aesthetic with light gray backgrounds, subtle carbon-weave texture patterns, metallic blue accents, and sharp geometric lines. Inspired by aerospace and automotive materials -- lightweight but incredibly strong, clean, technical, premium.

## Design Philosophy

- **Material Honesty**: Carbon weave diagonal crosshatch pattern conveys engineered material strength
- **Precision Measurement**: Edge ruler marks and corner registration brackets add technical credibility
- **Honeycomb Structure**: Hexagonal fragments reference the molecular structure of carbon fiber composites
- **Metallic Blue Accent**: Single strong accent color against gray/silver creates premium clarity

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Light Gray | `#F4F5F7` | Background |
| Metallic Blue | `#2563EB` | Primary accent |
| Titanium | `#64748B` | Secondary / header bars |
| Silver | `#94A3B8` | Tertiary / muted text |
| Accent Red | `#DC2626` | Warning/alert |
| Dark Text | `#0F172A` | Primary text |
| Card White | `#FFFFFF` | Card surfaces |
| Border | `#CBD5E1` | Borders |

## Typography

- Body: 18pt. The template stays font-agnostic; the demo uses installed `Libertinus Serif` with `Noto Sans SC` fallback and `DejaVu Sans Mono` for code.
- Headings: Bold, dark text with metallic blue accent bar

## SVG Decorations

- **Carbon weave**: Full-page diagonal crosshatch pattern simulating woven carbon fiber fabric
- **Precision lines**: Edge measurement rails with tick marks and corner registration brackets
- **Honeycomb fragment**: Partial hexagonal honeycomb structure fading at edges
- **Geometric divider**: Precision separator with diamond chevrons
- **Engineering frame**: Technical blueprint-style border with corner brackets and title block

## Slide Types

- `title-slide` -- Engineering frame, carbon weave texture, honeycomb fragment
- `slide` -- Light gray bg, carbon weave + precision lines atmosphere, blue header
- `new-section-slide` -- Sharp geometric divider with section title, left accent stripe
- `focus-slide` -- Dark blue background, carbon weave, engineering frame, white text
- `ending-slide` -- Dark background with engineering frame bookend, honeycomb decoration

## Components

- `concept-card(title, body, accent)` -- Left metallic blue stripe with diamond marker
- `insight-box(title, body)` -- Highlighted key insight with titanium background
- `stat-card(label, value, color)` -- Large metric with engineering precision feel
- `spec-card(title, body, accent)` -- Specification card with titanium header bar
- `material-box(title, body, accent)` -- Carbon fiber material properties style card
- `quote-card(quote-text, attribution)` -- Precision-styled quotation with geometric marks
- `benchmark-card(title, items)` -- Performance comparison card with colored indicators
- `callout-box(body, type)` -- Alert/warning with geometric icon (info/warning/success)
- `eng-tag(content, color)` -- Small capsule label for categorization
- `precision-divider(width)` -- Horizontal separator styled as measurement line
