# Atlas Trade Theme — Design Specification

## Design Concept

**Inspiration**: World trade routes and cartographic design. The theme draws from antique nautical charts combined with modern data visualization aesthetics — mercator projection lines, sea route curves, port city dots connected by elegant arcs, compass roses, and maritime coordinate systems.

**Mood**: Authoritative, worldly, strategic. The warm parchment palette evokes the weight of history while clean typography keeps it contemporary. Suitable for business strategy, global analysis, research presentations, and any content with a geographic or interconnected narrative.

**Key Visual Metaphors**:
- Trade routes as connections between ideas
- Port cities as milestones and destinations
- Compass roses as navigation/direction
- Coordinate grids as structure and precision
- Rhumb lines as radiating influence

---

## Color System

### Primary Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Background | Warm Parchment | `#FAF7F2` | Page fill, large surfaces |
| Primary | Ocean Blue | `#1B4F72` | Headings, borders, emphasis |
| Secondary | Deep Amber | `#996515` | Accessible text, accents, and KPIs on light surfaces |
| Accent | Compass Copper | `#B87333` | Decorative elements, timeline |
| Text | Deep Navy | `#1B2631` | Body text, labels |
| Text Muted | Blue Gray | `#5D6D7E` | Secondary text, captions |

### Extended Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Card BG | White | `#FFFFFF` | Card surfaces |
| Parchment | Light Tan | `#F5F0E8` | Alternative card fills |
| Ocean Light | Pale Blue | `#D6EAF8` | Highlight backgrounds |
| Navy Deep | Darkest Blue | `#0D2F4F` | Focus slide background |
| Border | Silver Gray | `#D5DBDB` | Subtle card borders |
| Rose Red | Port Marker | `#C0392B` | Port dots, warnings |
| Bright Gold | Focus Gold | `#D4A03C` | Focus-slide text and decoration on dark navy |

### Color Ratios
- Background occupies 65% of visual area
- Primary (navy) used for 20% (text, borders)
- Secondary (gold) used for 10% (accents, highlights)
- Copper/Red used sparingly at 5% (decorative)

### Contrast Compliance
- Text on background: 14.36:1 (exceeds WCAG AAA)
- Primary on background: 8.16:1 (exceeds WCAG AAA)
- Secondary on background: 4.65:1 (meets WCAG AA for body text)
- Bright gold on navy-deep: 5.79:1 (meets WCAG AA)

---

## Typography

### Font Stack
- **Primary demo font**: Arial (clean, widely available sans-serif)
- **CJK fallback**: Arial Unicode MS
- **Monospace**: IBM Plex Mono (code blocks)
- **Template behavior**: The theme entry point remains font-agnostic; consumers set fonts in `demo.typ` or `main.typ`

### Type Scale

| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Title slide heading | 2.4em (43.2pt) | Bold | navy-deep |
| Section number | 3.5em (63pt) | Bold | secondary |
| Section heading | 2em (36pt) | Bold | navy-deep |
| Slide heading | 1.3em (23.4pt) | Bold | navy-deep |
| Card title | 0.92em (16.6pt) | Bold | navy-deep |
| Body text | 1em (18pt) | Regular | text |
| Card body | 0.82em (14.8pt) | Regular | text |
| Tag label | 0.75em (13.5pt) | Semibold | varies |
| Footer | 0.65em (11.7pt) | Regular | text-muted |
| KPI value | 1.8em (32.4pt) | Bold | varies |

---

## Layout & Spacing

### Page Configuration
- **Aspect ratio**: 16:9 (default) or 4:3
- **Page fill**: `#FAF7F2` (warm parchment)
- **Margins**: top 4em, bottom 2em, x 2.2em
- **Header ascent**: 30%
- **Footer descent**: 30%

### Grid System
- Content slides use `cols()` with 1.2em gutter (standard) or 0.8em (compact)
- Cards fill 100% width of their column
- KPI rows typically use 3-4 columns with 0.6-0.8em gutter

### Component Spacing
- Between major elements: 0.5em vertical
- Between card groups and dividers: 0.4em vertical
- Card internal padding: x 1em, y 0.8em
- Tag inline spacing: 0.6em between tags

---

## SVG Design Elements

### 1. Mercator Grid (Full-Page Background)
- **Purpose**: Subtle latitude/longitude coordinate system
- **Composition**: 5 horizontal curves + 5 vertical curves + intersection dots
- **Opacity range**: 0.07 - 0.12 (extremely subtle)
- **Colors**: Navy lines, gold/copper intersection dots
- **Stroke widths**: 0.4pt - 0.6pt

### 2. Compass Rose (Ornamental)
- **Purpose**: Directional accent, decorative marker for title/ending slides
- **Composition**: 8-pointed star (4 cardinal + 4 intercardinal), double circle ring, center copper dot
- **Sizes used**: 50pt (section), 56pt (ending), 64pt (title), 80pt (default), 160pt (focus watermark)
- **Opacity range**: 0.25 - 0.9 (varies by element layer)

### 3. Trade Routes (Full-Page Background)
- **Purpose**: Visual narrative of global connectivity
- **Composition**: 6 curved paths (dashed) + 10 port dots at endpoints
- **Opacity range**: 0.08 - 0.15 (routes), 0.35 - 0.50 (port dots)
- **Path style**: Dashed (`stroke-dasharray: 6,4` and `4,3`)
- **Port dots**: Red and gold, 3-4px radius

### 4. Cartographic Frame (Bookend Border)
- **Purpose**: Formal frame shared between title and ending slides
- **Composition**: Double border (navy outer, gold inner) + tick marks on all edges + corner copper dots
- **Dimensions**: 2pt outer, 0.8pt inner border
- **Tick marks**: 1.5pt strokes at regular intervals along all edges

### 5. Rhumb Lines (Radiating Pattern)
- **Purpose**: Wind rose / directional atmosphere for dark backgrounds
- **Composition**: 12 lines radiating from center + center point markers
- **Opacity range**: 0.05 - 0.07 (very subtle)
- **Center**: Copper dot at intersection

### 6. Route Accent (Inline Divider)
- **Purpose**: Section/title separator with trade route character
- **Composition**: Sinusoidal curve + 5 port dots along the line
- **Height**: 12px SVG, rendered at 10pt
- **Dots**: Red endpoints (3px), gold waypoints (2px), navy midpoint (2.5px)

---

## Component Architecture

### Card Hierarchy
1. **route-card**: General-purpose content card (left border accent)
2. **compass-card**: Data/information display (diamond compass indicator)
3. **port-box**: Milestone/highlight (top border + ocean-light fill)
4. **voyage-card**: Timeline narrative (stacked dot waypoints)
5. **manifest-box**: Structured inventory (top border + parchment fill)

### Decorative Elements
1. **waypoint-tag**: Inline capsule label
2. **latitude-divider**: Section separator
3. **compass-rose**: Ornamental placement

### Data Display
1. **tonnage-stat**: Large KPI metric
2. **hemisphere-grid**: Two-panel comparison

### Annotation
1. **logbook-note**: Italic quotation/observation with attribution

### Height Equalization
All card-type components end with `#lazy-v(1fr)` to ensure consistent heights when placed in multi-column layouts. This pushes content to the top and allows all cards in a row to match the tallest card's height.

---

## Slide Type Specifications

### Title Slide
- Full bleed (margin: 0pt)
- Layers: parchment bg > rhumb lines > trade routes > cartographic frame > compass rose (corner)
- Content centered with 5em horizontal padding
- Bookend element: cartographic frame

### Content Slide
- Standard margins with header/footer
- Background atmosphere: mercator grid + corner port dots
- Header: title + route accent divider (stack spacing: `.8em`)
- Footer: grid(1fr, auto, 1fr) with copper dot center

### Section Slide
- Full bleed (margin: 0pt)
- Layers: parchment bg > mercator grid > navy left bar > compass rose (top-right)
- Gold section number (3.5em), route accent, then section title
- Bottom gold accent line (2pt)

### Focus Slide
- Full bleed (margin: 0pt)
- Layers: navy-deep bg > rhumb lines > compass rose (160pt, centered) > gold text
- Content: 72% width block, centered
- Text color: secondary (gold)

### Ending Slide
- Full bleed (margin: 0pt)
- Layers: parchment bg > rhumb lines > trade routes > cartographic frame
- Content: compass rose (56pt) above text, route accent below
- Bookend element: cartographic frame (matches title slide)

---

## Interaction & Animation Notes

- Touying supports incremental reveal via `#pause` and `#only()`
- All components are compatible with step-by-step build
- Focus slides work well as transition moments between dense sections
- Voyage cards are designed for sequential reveal (timeline narrative)

---

## Accessibility Considerations

- All colors meet WCAG AA contrast requirements for their intended use
- SVG elements are purely decorative (opacity < 0.15 for backgrounds)
- Card borders provide clear visual containment
- Font sizes never drop below 11.7pt (footer smallest)
- Port dots and waypoint markers use size + color for identification

---

## File Structure

```
atlas-trade/
  template.typ      — Theme definition (slide functions, components, SVGs)
  demo.typ          — Full demonstration with 8+ slides
  theme.md          — API reference documentation
  theme_design_spec.md — This design specification
```
