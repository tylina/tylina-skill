# Plasma Arc Theme — Visual Design Specification

## Design Philosophy

The Plasma Arc theme draws from the visual language of electrical discharge physics, plasma phenomena, and high-voltage engineering. It evokes the controlled chaos of Tesla coils, the precision of laboratory instruments, and the raw beauty of electrical arcs — channeling that energy into clean, structured presentations. The aesthetic communicates cutting-edge technology and scientific precision without resorting to generic "tech" tropes, instead letting the plasma/discharge metaphor (energy flow, controlled power, field dynamics) resonate with innovation-focused content.

## Visual World

- **Domain**: Plasma physics, electrical engineering, high-voltage systems
- **Phenomena**: Arc discharges, ionization fields, electrode nodes, plasma confinement
- **Materials**: Laboratory glass, copper electrodes, ionized gas, electromagnetic fields
- **Atmosphere**: A high-energy physics lab — controlled arcs dancing between electrodes, field lines mapping invisible forces, spark gaps firing with precision

## Color Palette

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Cool white/blue-tinted | `#FAFCFF` | Clean laboratory surface, slight blue cast from plasma glow |
| Primary | Electric violet | `#6D28D9` | Ionized gas discharge color, high-energy plasma state |
| Secondary | Plasma blue | `#2563EB` | Lower-energy discharge paths, electric field visualization |
| Accent | Energy orange/amber | `#F59E0B` | Spark energy, thermal hotspots, warning indicators |
| Text | Dark slate | `#1E293B` | High contrast, technical precision |
| Muted text | Slate-gray | `#64748B` | Secondary information, annotations |
| Card surface | White | `#FFFFFF` | Clean reading surface, instrument panel |
| Border | Light slate | `#E2E8F0` | Subtle containment lines |
| Light violet | Violet tint | `#EDE9FE` | Ionization glow background for plasma-box |
| Light blue | Blue tint | `#EFF6FF` | Field-line fill for field-card |
| Field background | Faint violet | `#F5F3FF` | Subtle energy field presence |
| Focus background | Deep violet/indigo | `#1E1040` | Dark plasma containment chamber |

## Typography Hierarchy

| Level | Size | Weight | Color | Usage |
|-------|------|--------|-------|-------|
| Slide title | 1.3em | Bold | text (`#1E293B`) | Content slide headers |
| Presentation title | 2.4em | Bold | text (`#1E293B`) | Title/ending slides |
| Section number | 3.5em | Bold | primary (violet) | Section transition slides |
| Section title | 2em | Bold | text (`#1E293B`) | Section headings |
| Card title | 0.90--0.95em | Bold | text or accent | Component headers |
| Body text | 0.80--0.82em | Regular | text | Card/component content |
| Labels | 0.75em | Regular | text-muted | Stat labels, metadata |
| Stat values | 1.55em | Bold | varies (color param) | voltage-stat metric display |
| Tags | 0.75em | Semibold | varies | ion-tag labels |
| Footer | 0.65em | Regular | text-muted | Page numbering |
| Subtitle | 1.05em | Medium | secondary (blue) | Title slide subtitle |

## SVG Design Inventory

### 1. Plasma Field Background (Full-page, 840x474)
- **Purpose**: Persistent atmospheric background for all slide types
- **Elements**: 30+ shapes (circles, polylines, rects, gradients)
- **Design**: Two sets of concentric circular field lines (center-right radiating at r=60/100/140/180, top-left at r=80/120); six jagged polyline arc discharges emanating from edges (top-left, bottom-right, left-mid, right-mid, top-right, bottom-left); 14 ionization dots scattered across the field in violet, blue, and orange; faint gradient wash at bottom edge
- **Opacity range**: 0.03--0.10 (extremely subtle, atmospheric only)
- **Color distribution**: Violet (`#6D28D9`) for primary arcs and dots, blue (`#2563EB`) for secondary arcs, orange (`#F59E0B`) for energy hotspot dots
- **Depth strategy**: Field lines at lowest opacity, arc paths slightly more visible, ionization dots at 0.06--0.10

### 2. Arc Frame (Full-page, 840x474, Bookend)
- **Purpose**: Ornamental border for title and ending slides (bookend pairing)
- **Elements**: 30+ elements (rects, polylines, circles)
- **Design**: Double rectangular border (outer 1.5pt violet, inner 0.6pt blue with slight inset); jagged discharge arc polylines along all four edges; four electrode node circles at corners (filled 4r, outlined 8r); ionization rings around each electrode (14r in orange); voltage level indicator bars at top edge
- **Opacity range**: 0.20--0.60 (more visible as framing device)
- **Corner electrodes**: Alternating violet/blue fills with matching stroke rings, orange ionization halos
- **Edge arcs**: Each edge has a jagged polyline simulating electrical discharge, 10--20 points per arc

### 3. Discharge Divider (Inline, 300x14)
- **Purpose**: Header divider and section separator
- **Elements**: 8 elements (circles, polylines)
- **Design**: Left electrode node (violet filled 3r, stroked 5r); jagged arc polyline spanning full width with zigzag pattern (32+ coordinate points); right electrode node (blue filled 3r, stroked 5r); three energy spark dots along the arc in orange
- **Size**: 300x14px viewport, rendered at variable widths (80--220pt)
- **Opacity**: Electrodes at 0.4--0.7, arc line at 0.45, sparks at 0.5--0.6

### 4. Spark Accent (Inline icon, 16x16)
- **Purpose**: Small decorative energy burst for card titles and inline accents
- **Elements**: 9 elements (circle, lines)
- **Design**: Central orange filled circle (2r); four cardinal radial lines in orange (1.2pt); four diagonal radial lines alternating violet and blue (0.8pt)
- **Size**: 16x16px viewport, rendered at 12pt
- **Opacity**: Central dot at 0.8, cardinal lines at 0.7, diagonal lines at 0.6

## Layout Specifications

### Content Slides
- **Margins**: top 3.5em, bottom 2em, x 2.2em
- **Header**: Title in 1.3em bold slate, followed by discharge divider (160pt)
- **Footer**: Three-column grid — left (footer text), center (spark accent 8pt), right (page numbers)
- **Background**: Plasma field atmosphere + three corner electrode markers (violet top-right, blue bottom-left, orange bottom-right)

### Title Slide
- **Margin**: 0 (full-page)
- **Layers** (bottom to top): Cool white fill -> Plasma field background -> Arc frame -> Content
- **Content**: Centered vertically with discharge divider (220pt) between title and metadata
- **Metadata stack**: Title -> divider -> subtitle (blue) -> author -> institution (muted) -> date (violet)

### Section Transition Slides
- **Layout**: Left-aligned content with 4pt violet accent bar on left edge
- **Hierarchy**: Large violet section number (3.5em) -> discharge divider (120pt) -> section title (2em)
- **Background**: Cool white fill + plasma field + electrode dots top-right
- **Bottom accent**: Full-width 2pt violet line at 50% transparency

### Focus Slides
- **Background**: Deep violet (`#1E1040`) + plasma field overlay (more visible on dark)
- **Content**: Centered in normal flow, 72% width, white text at 1.4em bold, discharge divider (180pt) below
- **Corner electrodes**: Four corners — violet top-left, orange top-right, orange bottom-left, violet bottom-right
- **Electrode sizing**: 5--6pt filled circles with 30--40% transparency

### Ending Slide
- **Layout**: Same bookend frame as title slide (arc frame)
- **Content**: Discharge divider (200pt) above -> large farewell text (2.4em bold) -> violet accent bar (5em x 3pt) below
- **Layers**: Same as title slide

## Component Design Principles

1. **Top borders**: `arc-card` and `voltage-stat` use colored top borders (3pt) evoking electrode contacts
2. **Left borders**: `plasma-box`, `discharge-quote`, and `field-card` use left accent borders for directional energy flow
3. **All-around borders**: `reactor-box` uses full 2pt border suggesting plasma containment
4. **Spark indicators**: Cards pair spark-accent icons with titles for energy-burst emphasis
5. **Electrode markers**: Stats use a centered electrode dot above the value and label
6. **Height equalization**: Block components used in equalized columns end with `lazy-v(1fr)`; inline tags and dividers are intentionally excluded
7. **Color coding**: Primary (violet) for core/primary content, secondary (blue) for supporting/field content, accent (orange) for metrics/highlights
8. **Progress bars**: `pulse-meter` uses nested blocks for layered progress visualization
9. **Capsule tags**: `ion-tag` uses 99pt radius for perfect pill shape with internal dot indicators

## Interaction with Touying Framework

- **`cols()`**: Use `lazy-layout: true` only when each column contains exactly one lazy-capable block component; use ordinary `cols` for columns containing multiple components
- **`setting()` function**: Background atmosphere (`_content-atmosphere()`) applied via setting parameter in slide function
- **Bookend pairing**: Title and ending slides share the arc frame SVG for visual cohesion
- **Section numbering**: Arabic numerals for modern technical feel
- **Footer spark**: Central spark-accent icon serves as visual anchor between left text and right page numbers
- **Store mechanism**: `config-store` holds `title` and `footer` state for slide rendering

## Technical Implementation Notes

1. **Touying 0.7.4 patterns**: Uses `touying-slide-wrapper`, `config-page`, `config-store`, `utils.merge-dicts`
2. **SVG rendering**: All SVGs defined as raw strings via ` ```...```.text `, rendered with `image(bytes(svg-string), ...)`
3. **Alignment safety**: Uses `std.align` inside slide functions to avoid shadowing Touying's `align` parameter
4. **Height safety**: `height: 100%` is limited to out-of-flow `place()` backgrounds and framing; flow components use `lazy-v(1fr)`
5. **Background persistence**: `_content-atmosphere()` called in every content slide's `setting` function
6. **Bookending symmetry**: Title and ending slides share arc frame + plasma field for visual cohesion
7. **Stack for headers**: Header elements use `stack(spacing: .8em)` for title + divider composition
8. **Electrode transparency**: Corner markers use `.transparentize()` method for consistent opacity control
9. **Font ownership**: The theme entry sets size and color only; the demo selects verified IBM Plex Sans/Mono and Heiti SC fonts
