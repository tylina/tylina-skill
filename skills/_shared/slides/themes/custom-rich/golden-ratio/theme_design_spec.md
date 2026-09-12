# Golden Ratio Theme — Design Specification

## Concept

The Golden Ratio theme applies the divine proportion (phi = 1.618033988...) to presentation design. Inspired by the mathematical beauty found in Fibonacci sequences, logarithmic spirals, and proportional rectangles, this theme creates a sophisticated visual language that communicates precision, balance, and thoughtful structure.

The aesthetic draws from Da Vinci's Vitruvian Man, Swiss modernist design principles, and natural mathematical patterns. It occupies the intersection of analytical rigor and visual elegance — perfect for contexts where both credibility and aesthetics matter.

## Design Philosophy

### Mathematical Foundation
- The golden ratio (1.618:1) informs column proportions, spacing hierarchies, and decorative elements
- Fibonacci sequence (1, 1, 2, 3, 5, 8, 13, 21...) provides sizing scales
- Golden angle (137.5 degrees) creates natural radial patterns
- Nested golden rectangles form the primary background texture

### Visual Principles
1. **Proportional Harmony**: Every spacing decision references phi or Fibonacci values
2. **Warm Minimalism**: Clean layouts with cream/ivory warmth rather than cold whites
3. **Gold as Structure**: Primary gold accent defines hierarchy and navigation, never decoration
4. **Subtle Mathematics**: SVG patterns reveal the underlying geometry without shouting
5. **Bookend Symmetry**: Opening and closing slides mirror each other through shared golden frame

## Color Palette

### Primary Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Warm White | `#FFFDF7` | Slight cream warmth reduces eye strain, references aged paper |
| Body Text | Deep Warm Gray | `#3D3530` | Warm-leaning near-black for comfortable reading |
| Primary Accent | Warm Gold | `#C8922A` | Classic gold representing the golden ratio itself |
| Primary Text Ink | Deep Gold | `#966917` | Accessible counterpart for gold-colored text on light surfaces |
| Secondary Accent | Muted Bronze | `#8B6914` | Darker gold for depth and hierarchy |
| Highlight | Sage Green | `#7A9B6D` | Natural green for callouts and theorems |
| Highlight Text Ink | Deep Sage | `#557348` | Accessible counterpart for sage-colored text on light surfaces |

### Supporting Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Card Background | Pure White | `#FFFFFF` | Clean surface for content cards |
| Cream Fill | Warm Cream | `#FBF7EF` | Subtle elevation for annotation areas |
| Gold Light | Light Gold | `#F5E6C8` | Highlighted backgrounds for key content |
| Deep Bronze | Bronze | `#6B4E2A` | Dark background for focus slides |
| Muted Text | Warm Gray | `#7A6F66` | Secondary text and metadata |
| Border | Neutral Warm | `#E8DFD2` | Card borders that disappear gracefully |

### Color Relationships
- Primary gold to background creates phi-proportional contrast ratio
- Bronze to gold follows the same tonal relationship as gold to cream
- Sage green provides complementary relief from the warm spectrum
- All transparencies use phi-derived values (61.8%, 38.2%, 23.6%)

## Typography

### Font Stack
- **Theme contract**: Font-family agnostic; `template.typ` sets size and color only
- **Demo primary**: Charter — warm editorial serif available in the review environment
- **Demo CJK fallback**: Arial Unicode MS
- **Code**: Select an installed monospace family in the consuming deck when raw/code content is present

### Type Scale (Fibonacci-derived)
- Base: 18pt
- Small (labels): 13pt (0.72em)
- Body: 15pt (0.82em)
- Subhead: 17pt (0.95em)
- Title: 23pt (1.3em)
- Display: 43pt (2.4em)
- Hero: 63pt (3.5em)

### Weights
- Regular (400): Body text
- Medium (500): Subtitles
- Semibold (600): Labels and tags
- Bold (700): Titles and emphasis

## SVG Elements

### 1. Golden Spiral Background (Full-Page)
- **Purpose**: Persistent content slide atmosphere
- **Elements**: Nested golden rectangles (5 levels) with logarithmic spiral arcs
- **Opacity range**: 0.06 to 0.18
- **Colors**: Primary gold and bronze at low opacity
- **Accent**: Fibonacci proportion lines on left margin (lengths: 20, 50, 100, 180px)

### 2. Fibonacci Rectangle Grid (Full-Page)
- **Purpose**: Section slide and special slide backgrounds
- **Elements**: Nested rectangles subdividing in phi ratio
- **Opacity range**: 0.06 to 0.14
- **Spiral arcs**: Two quarter-circle arcs tracing the spiral path
- **Corner nodes**: 6 circles at key intersection points

### 3. Golden Frame (Bookend)
- **Purpose**: Shared decorative frame for title and ending slides
- **Structure**: Double rectangle border with spiral corner accents
- **Corners**: Each has two arcs — one strong (outer spiral) and one subtle (inner)
- **Corner nodes**: Gold circles at intersection points
- **Mid-edge accents**: Small geometric markers at frame midpoints

### 4. Phi Proportion Divider (Inline)
- **Purpose**: Header underline and section separators
- **Structure**: Horizontal line with nodes at phi-proportional positions
- **Node positions**: 0%, 14.7%, 23.6%, 38.2%, 61.8%, 100% of width
- **Node sizes**: Decrease with Fibonacci from endpoints toward center

### 5. Golden Angle Radial Pattern
- **Purpose**: Decorative element for section slides
- **Structure**: Circles placed at golden angle intervals from center
- **Angle**: 137.5 degrees between each successive element
- **Size decrease**: Each successive circle is slightly smaller
- **Colors**: Alternating primary, secondary, and highlight

### 6. Vitruvian Geometric Icon
- **Purpose**: Small decorative element for ending slide and spiral-box
- **Structure**: Square with inscribed circle, cross-axis lines, center dot
- **References**: Da Vinci's Vitruvian Man proportions

## Component Design

### proportion-card
- Left border: 3pt solid accent
- Remaining borders: 1pt warm border
- White fill for clean reading
- Golden dot (7pt circle) before title
- Inset: 1em horizontal, 0.8em vertical
- Corner radius: 4pt

### spiral-box
- Left border: 4pt solid primary
- Fill: Light gold (#F5E6C8)
- Vitruvian icon (28pt) inline with title
- Title in secondary (bronze) color
- Used for key insights and principles

### phi-tag
- Capsule shape (99pt radius = pill)
- Fill: accent at 88% lightness
- Border: 1pt accent at 40% transparency
- Golden dot (5pt) before text
- Text: 0.75em semibold in deep body ink; the dot and border retain the accent hue

### sequence-card
- Top border: 3pt solid color
- Remaining: 1pt warm border
- White fill with 4pt bottom radius
- One centered `stack(spacing: .8em, ...)`: ratio node > value > label > description
- Value: 1.6em bold in the contrast-safe accent ink
- Four-level hierarchy stays stable for short values and wrapped labels/descriptions

### ratio-divider
- Centered phi-divider SVG at specified width
- Golden ratio markers along the line
- Decorative separator between content sections

### fibonacci-stat
- Full 1pt border in warm neutral
- White fill with 4pt radius
- One centered `stack(spacing: .8em, ...)`: ratio node > value > label
- Label: 0.75em muted
- Value: 1.5em bold in the contrast-safe accent ink so six-character metrics remain inside compact four-card rows

### harmonic-card
- Outer: 1pt border, 4pt radius, clipped overflow
- Three-column grid: left panel | phi divider | right panel
- Left panel: gold-light fill
- Right panel: cream fill
- Center divider: phi symbol in primary color
- Both panels: same inset and typography

### nautilus-grid
- Two-column grid: 1.618fr | 1fr (golden ratio)
- First item: gold-light fill, left accent border
- Remaining items: stacked in right column, white fill
- One-item tuples render one emphasized chamber
- Gutter: 0.8em
- Visually represents the nautilus shell's proportional chambers

### theorem-box
- Full 1.5pt border in accent (sage green default)
- Fill: accent at 92% lightness
- Title in accent color, bold
- Short accent bar (30pt x 2pt) below title
- Corner radius: 6pt
- For precise statements, principles, definitions

### annotation-note
- Left border: 3pt sage green
- Remaining: 1pt warm border
- Cream fill for gentle emphasis
- Green proportion marker (5pt x 10pt rectangle) before title
- Title in green, body in standard text
- Right-side radius only: 4pt

## Slide Layouts

### Title Slide
1. Full cream background
2. Fibonacci grid SVG (full page, low opacity)
3. Golden frame SVG (bookend element)
4. Golden angle decoration (60pt, top-right)
5. Centered content: title > phi-divider > subtitle > author > institution > date

### Content Slide
1. Cream background
2. Golden spiral SVG atmosphere (persistent)
3. Corner accent nodes (3 positions, low opacity)
4. Header: title + phi-divider (160pt)
5. Footer: 3-column grid (footer | gold dot | page numbers)
6. Content area uses the configured `align` value; the spiral atmosphere and alignment are merged in one page setting

### Section Slide
1. Cream background
2. Fibonacci grid SVG
3. Left accent bar (4pt gold, full height)
4. Golden angle decoration (100pt, top-right)
5. Content: section number > phi-divider > section title
6. Bottom proportion line (61.8% width, gold at 50%)

### Focus Slide
1. Deep bronze background
2. Golden spiral SVG (visible on dark)
3. Corner gold nodes (4 positions)
4. Centered in-flow block (72% width): bold light-gold text + phi-divider

### Ending Slide
1. Cream background
2. Fibonacci grid SVG
3. Golden frame SVG (bookend — matches title)
4. Golden angle decoration (60pt, bottom-left)
5. Centered: vitruvian icon > farewell text > phi-divider

## Spacing System (Fibonacci-Based)

| Token | Value | Fibonacci Reference |
|-------|-------|-------------------|
| xs | 2pt | F(1) |
| sm | 4pt | ~F(3) |
| md | 8pt | F(6) |
| lg | 13pt | F(7) |
| xl | 21pt | F(8) |
| 2xl | 34pt | F(9) |

Margins and padding use these values or their em equivalents.

## Accessibility Considerations

- Body text on cream: 11.79:1 (WCAG AAA)
- Deep-gold text on cream: 4.77:1 (WCAG AA for normal text)
- Deep-sage text on cream: 5.25:1 (WCAG AA for normal text)
- Light-gold focus text on bronze: 6.20:1 (WCAG AA)
- Bright gold and sage remain decorative tokens; components switch to their text-safe counterparts for glyphs
- All SVG decorations are at very low opacity (0.06-0.20) to avoid distraction
- Cards use white backgrounds for maximum readability
- No critical information conveyed through color alone

## Animation Notes

This is a static theme (PDF output). All visual interest comes from:
- Layered SVG textures creating depth
- Proportional spacing creating rhythm
- Gold accent guiding the eye through hierarchy
- Bookend framing providing narrative closure
