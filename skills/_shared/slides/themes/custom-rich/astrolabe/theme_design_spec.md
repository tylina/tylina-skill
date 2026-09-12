# Astrolabe Theme — Design Specification

## Concept

The Astrolabe theme translates the elegant engravings of medieval brass astronomical instruments into modern slide design. It draws from the precise geometry, graduated scales, concentric arcs, and precision metalwork patterns found on historical astrolabes — instruments that were both scientifically functional and artistically refined.

The aesthetic targets academic and scholarly presentations while avoiding obvious academic naming conventions. The name "astrolabe" references the instrument itself rather than the academic context.

---

## Visual Language

### Core Visual Elements

1. **Concentric arcs**: Celestial coordinate circles of varying radii, representing altitude and azimuth circles on an astrolabe plate
2. **Radial lines**: Meridian and hour lines radiating from a central pole point
3. **Graduated scales**: Degree markings with major/minor tick marks along arcs
4. **Ecliptic ring**: Ornate border ring with graduated degree markers
5. **Rete pointer**: A decorative compass-rose/star-pointer ornament representing the rotating star map
6. **Precision metalwork**: Thin engraved lines with varying weights suggesting brass engraving

### Design Principles

- **Precision over decoration**: Lines are thin, exact, and purposeful
- **Layered opacity**: Multiple overlapping elements at low opacity create depth without clutter
- **Warm material palette**: Brass, copper, and ivory evoke physical metalwork on parchment
- **Geometric harmony**: Arcs and circles follow mathematical relationships
- **Restraint**: Decorative elements are subtle atmospheric effects, never competing with content

---

## Color Palette

### Primary Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Warm ivory | `#FDFBF5` | Simulates aged parchment/vellum |
| Secondary bg | Light ivory | `#F8F4EA` | Slightly warmer for emphasis areas |
| Text | Deep navy | `#1B2340` | Astronomical ink, high contrast on ivory |
| Primary accent | Brass | `#B8860B` | Historical brass instrument material |
| Secondary accent | Copper | `#A0522D` | Aged copper/bronze patina |
| Tertiary accent | Gold light | `#DAA520` | Polished brass highlights |

### Supporting Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Muted navy | Subdued navy | `#3B4A6B` | For tertiary information |
| Warm gray | Text gray | `#6B6560` | For captions and secondary text |
| Card background | Off-white | `#FFFDF7` | Slightly lighter than page bg |
| Border | Warm tan | `#E8DFC8` | Subtle card borders |
| Muted text | Warm brown | `#7A7268` | For footer and annotations |

### Color Usage Rules

- Body text always in deep navy (`#1B2340`) for maximum readability
- Card titles may use accent colors for categorization
- Large values/metrics use brass or copper for visual emphasis
- Backgrounds never use saturated colors; always ivory/cream family
- SVG elements use brass/copper at very low opacity (0.06-0.25)

---

## Typography

### Font Stack

- **Body**: Noto Sans, Noto Sans CJK SC (for CJK support)
- **Monospace**: Noto Sans Mono
- **Base size**: 18pt

### Type Scale

| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Title slide heading | 2.4em | Bold | ink |
| Section heading | 2em | Bold | ink |
| Slide title | 1.3em | Bold | ink |
| Card title | 0.92em | Bold | ink or accent |
| Body text | 0.82em | Regular | ink |
| Small labels | 0.75em | Regular | text-muted |
| Footer | 0.65em | Regular | text-muted |
| Tag text | 0.75em | Semibold | accent color |

---

## SVG Specifications

### Celestial Grid (Full-page atmosphere)

- **Dimensions**: 840x474 (16:9 ratio)
- **Elements**: 5 concentric circles (r=60 to r=220), 4 radial lines, 2 arc segments, 5 endpoint markers
- **Opacity range**: 0.06 to 0.20
- **Stroke widths**: 0.3pt to 0.6pt
- **Purpose**: Subtle background atmosphere suggesting celestial coordinates

### Ecliptic Frame (Bookend)

- **Dimensions**: 840x474
- **Elements**: Double rectangular frame, 3 concentric circles, 4 corner diagonal lines, 4 corner nodes, 10 graduated tick marks
- **Opacity range**: 0.15 to 0.70
- **Purpose**: Ornate border for title and ending slides (shared bookend element)
- **Corner treatment**: Diagonal lines with brass nodes at 4 corners

### Arc Divider (Separator)

- **Dimensions**: 300x16
- **Elements**: 1 curved path (quadratic bezier), 9 graduated tick marks, 3 endpoint circles
- **Opacity range**: 0.5 to 0.8
- **Purpose**: Decorative separator under slide titles and between sections

### Rete Pointer (Ornament)

- **Dimensions**: 48x48
- **Elements**: 2 concentric circles, 2 crosshair lines, 1 pointer triangle, 2 center circles, 1 tip circle
- **Opacity range**: 0.3 to 0.9
- **Purpose**: Star-pointer ornament for title/ending slides

### Degree Scale (Inline decoration)

- **Dimensions**: 140x12
- **Elements**: 1 baseline, 12 graduated ticks of varying height
- **Opacity range**: 0.5 to 0.7
- **Purpose**: Inline graduated scale decoration for section headers

---

## Component Architecture

### Card Components

All card components follow this structure:
1. Outer `block` with specified fill, stroke, inset, radius
2. Title row (often with icon/indicator + text via `stack(dir: ltr)`)
3. `stack(spacing:)` for component-internal vertical rhythm
4. Body content with set text styling
5. Intrinsic height; use `cols` for semantic side-by-side regions and `grid` for regular matrices

### Component Naming Convention

Components are named from the astrolabe's world:
- **dial-card**: The graduated dial is the most iconic feature
- **rete-box**: The rete is the rotating star overlay
- **degree-tag**: Graduated degree markings
- **azimuth-card**: Azimuth is horizontal direction measurement
- **ecliptic-divider**: The ecliptic is the Sun's path
- **altitude-stat**: Altitude measurement is the primary function
- **meridian-card**: Meridians are north-south hour lines
- **quadrant-grid**: A quadrant is a quarter-circle instrument
- **plate-box**: The plate (tympan) carries engraved coordinates
- **observation-note**: Observations are what astronomers record

---

## Layout System

### Slide Structure

```
+------------------------------------------+
| Header: Title + Arc Divider              |
+------------------------------------------+
|                                          |
|  [Celestial Grid Atmosphere Background]  |
|                                          |
|  Content area with components            |
|                                          |
|                                          |
+------------------------------------------+
| Footer: text | brass dot | page number   |
+------------------------------------------+
```

### Margins

- Top: 4em (for header)
- Bottom: 2em (for footer)
- Horizontal: 2.2em

### Footer Grid

Uses `grid(columns: (1fr, auto, 1fr))`:
- Left: footer text
- Center: brass dot separator
- Right: page counter (right-aligned)

### Background Atmosphere

Every content slide has a persistent background via `setting(body)` function:
1. Full-page celestial coordinate grid SVG
2. Three corner brass markers at varying sizes and opacities
3. Content overlaid on top

---

## Bookend Design

Title and ending slides share the "ecliptic frame" SVG element:
- Double rectangular border with corner diagonal lines
- Corner brass nodes
- Concentric circle decoration (representing the ecliptic ring)
- Graduated tick marks along top and bottom edges

Both bookend slides also include:
- Celestial grid background
- Rete pointer ornament
- Arc divider decoration

---

## Interaction with Touying

### Config Pattern

```typ
config-page(
  ..utils.page-args-from-aspect-ratio(aspect-ratio),
  header-ascent: 30%,
  footer-descent: 30%,
  fill: palette.bg,
  margin: (top: 4em, bottom: 2em, x: 2.2em),
)
config-common(
  slide-fn: slide,
  new-section-slide-fn: new-section-slide,
)
config-store(
  title: none,
  footer: footer,
)
```

### Slide Function Pattern

All slide functions use `touying-slide-wrapper(self => {...})`:
1. Extract/merge title from store
2. Define header function with title + arc divider via `stack(spacing:)`
3. Define footer function with `grid(columns: (1fr, auto, 1fr))`
4. Define `setting(body)` for background atmosphere
5. Merge page config
6. Call `touying-slide(self: self, setting: setting, ..args)`

---

## Accessibility Notes

- Text contrast ratio: navy on ivory exceeds WCAG AAA (>7:1)
- All decorative SVGs are at low opacity and do not interfere with content readability
- Card borders provide clear visual boundaries
- Tags use adequate contrast with colored text on very light tinted backgrounds
- No information is conveyed solely through color
