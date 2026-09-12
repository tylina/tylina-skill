# Syntax Garden — Design Specification

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| bg | #FDFCF7 | Soft cream background |
| ink | #1B4332 | Deep forest green primary text |
| accent | #40916C | Leaf green accent |
| secondary | #8B5E3C | Warm earth for stems/branches |
| leaf-light | #95D5B2 | Light leaf tones for decorative fills |
| earth-light | #D4A574 | Light earth for subtle warmth |
| ink-muted | #1B4332 at 50% | Muted text, footers |
| bg-dark | #2D6A4F | Dark green for code backgrounds |
| error-red | #9B2226 | Error/failure highlights |
| success-green | #2D6A4F | Success/correct highlights |

## SVG Assets

### branch-corner (content slides, bottom-right)
- 8+ path elements with varying opacities (0.15 - 0.35)
- Brown (#8B5E3C) stem paths growing upward
- Green (#40916C, #95D5B2) leaf ellipses at branch tips
- Dimensions: 180x160 viewBox, rendered at 140x120pt
- Subtle presence -- decorative, not distracting

### tree-frame (title/ending slides)
- Outer border: 4pt earth-brown (#8B5E3C) rounded rect
- Inner border: 1.5pt leaf-green (#40916C) at 40% opacity
- Left and right trunk paths growing from bottom up
- Canopy ellipses (green, varying opacity) at trunk tops
- Top vine decorations with small leaves

### vine-divider (horizontal separator)
- Wavy brown (#8B5E3C) stem path
- Five leaf ellipses at intervals (alternating #40916C and #95D5B2)
- 300x16 viewBox, rendered at user-specified width

## Component Design

### seed-card
- Border-radius: 12pt (organic/rounded)
- Subtle stroke with accent transparentize(40%)
- Leaf SVG icon inline with title
- Uses lazy-v(1fr) for card filling

### branch-step
- NO box border -- open layout
- Vertical 2pt stem line on left (secondary color, 40% transparent)
- Numbered circle (6pt radius, accent fill, white number)
- Progressive visual connection between steps

### root-block
- Grid: two columns (code left, explanation right)
- Code side: dark green bg (#2D6A4F), light text
- Explanation side: slightly darkened cream bg
- Shared rounded clipping (10pt radius)

### leaf-tag
- Pill shape (99pt radius)
- Very light fill (82% transparent)
- 1pt stroke border
- Small text (0.72em), semibold

### bloom-highlight
- Left border only (3.5pt, color-coded)
- Flower-bud SVG marker next to title
- Very light color wash background (92% transparent)
- Right side rounded (8pt radius)
- Used for errors (red) and successes (green)

### canopy-quote
- Full rounded corners (12pt)
- Left border: 3pt accent
- Light green wash background
- Italic text, optional author attribution

## Typography

- Base: 18pt; the consuming deck supplies its installed sans-serif stack
- Code: 13pt; the consuming deck supplies its installed monospaced stack
- Headers: 1.3em bold forest green
- Component titles: 0.92em bold with accent color
- Body in components: 0.82em
- Tags: 0.72em semibold

## Layout Rules

- `lazy-layout: true` only when each column has exactly ONE component
- Headers use `stack(spacing:)` not `v()`
- All card components use `#lazy-v(1fr)`
- Focus slide text width-constrained (65% block width)
