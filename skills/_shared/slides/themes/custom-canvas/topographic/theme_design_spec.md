# Topographic Theme -- Design Specification

## Aesthetic Vision

Topographic maps meet modern data visualization. The organic flowing curves of topographic contour lines serve as the primary decorative element, rendered as embedded SVG paths. Earth tones with a single bright accent (survey marker orange). The feel of a geological survey map turned into a presentation.

## Color Palette

| Token | Hex | Role |
|-------|-----|------|
| Terrain Dark | #2D3B2D | Primary text, dark backgrounds |
| Paper | #F7F4EF | Light backgrounds (topographic map paper) |
| Contour | #5B7553 | Contour lines, accent underlines |
| Water | #4A90A4 | Focus slide bg, water elements |
| Marker | #E85D04 | Survey marker orange (sparingly) |
| Grid | #8B7355 | Grid/coordinate annotations |

### Presets

- **forest**: Green contours on cream (default)
- **ocean**: Blue contours on light blue-gray
- **desert**: Brown contours on sand

## Typography

- Display: 42pt bold (terrain dark)
- H1: 28pt bold
- H2: 22pt bold
- Lead: 16pt
- Body: 14pt
- Metadata: 8pt monospace (coordinate style)
- Coordinate tags: 9pt monospace

## Key Design Elements

### SVG Contour Lines
Flowing organic curves at multiple "elevations" (different opacities/thicknesses) creating visual depth. Two variants:
- Standard: 3 contour paths at different opacities (0.25, 0.18, 0.12)
- Dense: 6 contour paths for title/hero slides

### Survey Marker
Crosshair + circle SVG element used as section indicators and accent decorations.

## Slide Types

| Slide | Background | Key Elements |
|-------|-----------|-------------|
| slide | Paper | Title + contour underline, subtle bottom contours |
| dark-slide | Terrain dark | Paper-colored contours, survey marker accent |
| title-slide | Paper | Large dense contour pattern, marker, coordinates |
| new-section-slide | Paper | Ghost number, survey marker, contour lines |
| focus-slide | Water blue | White text, subtle white contours |
| ending-slide | Paper | Centered farewell, marker, "SURVEY COMPLETE" |
| hero-slide | Custom color | Dense contour overlay in white |

## Components

| Component | Purpose |
|-----------|---------|
| elevation-card | Card with contour-green top border |
| depth-stat | Large number + monospace unit annotation |
| coordinate-tag | Monospace tag like map coordinates |
| terrain-quote | Quote with contour-green left border |
| contour-divider | SVG contour lines as separator |
| survey-note | Callout with orange left bar + mono label |

## Layout

- 16:9 aspect ratio
- Margins: top 4.5em, bottom 1.3em, x 2em
- Footer: coordinate-style with "N {page} . E {total}" format
- No rounded corners anywhere (geological/survey aesthetic)
