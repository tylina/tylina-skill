# Tidal Pool Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | tidal-pool |
| **Best For** | Marine biology, ocean science, environmental talks, research presentations |
| **Style Objective** | Scientific / Organic Ocean |
| **Complexity Level** | Rich |

An ocean science inspired aesthetic with aquamarine, sand, and deep navy accents on light sandy backgrounds. Wave-form SVG decorations, tide line patterns, and circular pool motifs evoke marine biology fieldwork -- scientific yet organic and beautiful.

## Design Philosophy

- **Tidal Rhythm**: Sine-curve wave patterns at multiple frequencies create ocean rhythm
- **Rock Pool Observation**: Concentric ripple circles reference the quiet observation of tide pools
- **Sediment Layers**: Dashed tide-line marks suggest water levels and geological strata
- **Marine Palette**: Aquamarine, navy, sand, and coral reference the shoreline ecosystem

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Sandy White | `#F8F6F0` | Background |
| Aquamarine | `#4ECDC4` | Primary accent |
| Deep Navy | `#1A3A4A` | Headings / section bg |
| Sand Gold | `#D4A76A` | Warm accent |
| Coral | `#E87461` | Alert/specimen accent |
| Dark Ink | `#1E2D3D` | Body text |
| Dark Aquamarine | `#137D78` | Accessible aquamarine text |
| Dark Sand | `#8A5A24` | Accessible sand text |
| Dark Coral | `#AC4637` | Accessible coral text |

## Typography

- Body: 18pt, `New Computer Modern` with `Heiti SC` CJK fallback (set in the deck, not the theme)
- Headings: Bold, deep navy
- `IBM Plex Mono` for code

## SVG Decorations

- **Wave form**: Gentle sine curves at multiple amplitudes (ocean shore rhythm)
- **Tidal lines**: Horizontal dashed tide marks with sediment dots
- **Pool ripple**: Concentric circles with center pebble and organism dots
- **Tidal atmosphere**: Combined waves, pools, and organic seaweed elements (full-page)
- **Wave divider**: Decorative double-wave horizontal separator
- **Quote waves**: Stylized wave-shaped quotation marks

## Slide Types

- `title-slide` -- Sandy white, wave + tidal lines, pool ripples, navy tidal frame border
- `slide` -- Sandy bg, tidal atmosphere, aquamarine wave-divider header accent
- `new-section-slide` -- Deep navy bg, white wave overlay, pool ripple, sand number
- `focus-slide` -- Aquamarine background, white waves, pool ripple corners, navy text and tidal frame
- `ending-slide` -- Sandy white with tidal frame bookend, centered pool ripple, wave divider

## Components

- `concept-card(title, body, accent)` -- Aquamarine top border with wave divider inside
- `insight-box(title, body, accent)` -- Left-bordered navy callout for observations
- `stat-card(label, value, color)` -- Large value with colored bottom border (tide gauge)
- `quote-card(quote-text, author)` -- Ocean-themed quote with SVG wave quote marks
- `specimen-card(title, body, accent)` -- Marine specimen card with coral header and pool icon
- `depth-card(title, body, depth-label)` -- Dark navy card representing ocean depth zones
- `wave-box(body, accent)` -- Full-width highlight with wave background pattern
- `callout-box(title, body, accent)` -- Sand-colored callout for notes/tips
- `tide-tag(content, color)` -- Capsule-shaped species/category label
- `tide-divider(color, width)` -- Decorative SVG wave separator with side lines
