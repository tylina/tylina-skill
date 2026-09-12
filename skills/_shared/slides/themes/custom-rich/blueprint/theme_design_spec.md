# Blueprint Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | blueprint |
| **Best For** | Engineering talks, architecture reviews, technical documentation, system design |
| **Style Objective** | Technical Precision |
| **Complexity Level** | Rich |

A crisp architectural blueprint aesthetic with blue technical drawing lines, dimension markers, grid references, corner registration marks, and dashed construction lines on white paper backgrounds. Engineering drawings meet modern design.

## Design Philosophy

- **Technical Drawing Heritage**: Grid references, fold marks, and scale markers evoke real engineering drawings
- **Precise Measurement**: Dimension arrows and ruler markings reinforce quantitative thinking
- **Construction Geometry**: Dashed diagonal guides and golden-ratio lines hint at underlying structure
- **Blueprint Authenticity**: Monospace labels, zone identifiers, and revision blocks add engineering credibility

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Paper White | `#FAFCFF` | Background |
| Ink Black | `#111827` | Primary text |
| Blueprint Blue | `#1D4ED8` | Primary accent / lines |
| Gray | `#6B7280` | Secondary text |
| Red | `#DC2626` | Dimension markers |
| Wash Blue | `#EFF6FF` | Card fill |

## Typography

- Body: 18pt Charter with Arial Unicode MS fallback; Menlo for code and blueprint labels
- Headings: Bold, ink black with numbered sections
- Zone identifiers: Small monospace uppercase labels

## SVG Decorations

- **Blueprint grid**: Full-page engineering grid with major/minor divisions and reference labels
- **Registration marks**: Corner alignment marks with crosshair center
- **Dimension arrow**: Red measurement indicator with endpoint ticks
- **Construction lines**: Dashed diagonal/center guides with golden-ratio lines
- **Section divider**: Technical drawing section break with zone markers
- **Title frame**: Full drawing border with title block zone

## Slide Types

- `title-slide` -- Full technical drawing frame with registration marks
- `slide` -- Blueprint grid atmosphere, blue header line with endpoint dots
- `new-section-slide` -- Large section number, blueprint grid, section divider SVG
- `focus-slide` -- Inverted blue background with white grid and registration marks
- `ending-slide` -- Technical close-out frame matching title bookend

## Components

- `concept-card(title, body, zone)` -- Technical spec card with blue left border and zone reference
- `insight-box(body)` -- Highlighted insight with dimension arrow decoration
- `stat-card(value, caption, unit)` -- Large metric with technical measurement styling; internal value, rule, and caption use a vertical stack
- `spec-card(title, body, rev)` -- Technical specification block with header bar and revision
- `dimension-box(title, body)` -- Callout with dimension markers (measurement metaphor)
- `quote-card(body, attribution)` -- Technical quotation with construction line decoration
- `schematic-card(title, body)` -- Dashed-border blueprint-style info card
- `callout-box(title, body, accent)` -- Warning/note with red accent
- `blueprint-tag(label, accent)` -- Inline tag/badge element (zone identifier style)
- `blueprint-divider()` -- SVG-based section divider
- `grid-ref(label)` -- Small monospace zone identifier label
