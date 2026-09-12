# Golden Script Theme Design Specification

## Design Philosophy

This theme draws inspiration from the aesthetic of beautifully typeset mathematical textbooks -- particularly the precision and elegance found in Knuth's "The Art of Computer Programming" and Springer's Graduate Texts in Mathematics series. The goal is to translate the visual language of formal proof notation into presentation slides while maintaining readability and academic authority.

Key principles:
- **Mathematical precision**: Every visual element has a purpose, echoing the rigor of proof
- **Golden ratio harmony**: Layout proportions follow the golden ratio (1.618...)
- **Typographic clarity**: Deep indigo on warm white for maximum legibility
- **Proof notation vocabulary**: QED tombstones, theorem boxes, proof indentation markers used as UI elements

---

## Visual Identity

### Color System

The palette is inspired by aged mathematical manuscripts and gold-leaf illuminated texts:

- **Background**: Pure warm white (#FDFCFA) -- slight warmth avoids harsh blue-white of screens
- **Text**: Deep indigo (#1B1464) -- richer than pure black, evokes fountain pen ink
- **Primary accent**: Gold/amber (#C8910D) -- highlights theorems and key results, suggests illuminated manuscript headers
- **Secondary accent**: Royal blue (#2B4ACB) -- for lemmas, definitions, and structural elements
- **Proof gray**: (#6B6B7B) -- subdued tone for proofs and examples
- **Conjecture red**: (#D4380D) -- warmth indicating "unproven" or "open"

### Typography

- **Base font**: Caller-selected at 18pt; the demo verifies Helvetica Neue with Arial fallback
- **CJK support**: Caller-selected fallback stack for multilingual mathematical content
- **Monospace**: DejaVu Sans Mono in the demo for raw code elements
- **Weights**: Bold for theorems/headers, semibold for labels, italic for theorem statements
- **Hierarchy**: 2.4em title > 1.3em headers > 0.9em labels > 0.82em body > 0.78em remarks

---

## SVG Decorations

### Golden Spiral (Full-page background)
- Logarithmic spiral centered at page golden-section intersection point (61.8% x 61.8%)
- Three nested spiral arms at decreasing opacity (0.12, 0.10, 0.08)
- Additional geometric curves in corners at very low opacity
- Includes golden-ratio reference lines (horizontal at 61.8% height, vertical at 61.8% width) at near-invisible opacity
- Small QED tombstone markers at mathematically significant positions

### Fibonacci Grid (Section slides)
- Rectangles subdividing the slide following Fibonacci proportions
- Largest rectangle: 519x293px (golden ratio of 840x474)
- Successive golden-ratio subdivisions creating 7+ nested rectangles
- Logarithmic spiral arc connecting the subdivisions
- Focal point at the golden intersection (519, 293)

### Golden Frame (Title/Ending bookend)
- Double frame: outer gold (#C8910D) at 1.8px, inner blue (#2B4ACB) at 0.6px
- Emphasized corners with extended strokes and circular nodes
- Corner circles filled gold at full opacity (0.7)
- Top and bottom center decorative arcs (subtle flourishes)
- Bottom-right QED tombstone as signature mark

### Coordinate Axes (Section decoration)
- Simple x-y axes with arrowheads
- Golden-ratio curve plotted on axes
- Nodal points at intersection with golden proportion lines
- Used as decorative element in top-right of section slides

### Integral Border (Vertical decoration)
- Stylized integral sign as vertical border element
- Serif-like terminals at top and bottom
- Small nodal points along the curve
- Used for emphasis in special layouts

### QED Divider
- Horizontal rules extending from center, broken by tombstone
- Small circular nodes at rule terminations
- Tombstone: filled square (10x10) in deep indigo
- Decorative connecting lines between tombstone and rules

---

## Component Design

### Theorem Box
- **Background**: Light gold (#FDF6E3)
- **Border**: 4pt gold left + 1pt gold-border on other sides
- **Header**: "Theorem" label in gold, optional number, title in dark text
- **Body**: Italic text (following mathematical convention)
- **Separator**: 60pt gold rule between header and body

### Proof Block
- **Background**: White (#FFFFFF)
- **Border**: 2pt gray left border (indentation marker)
- **Header**: Italic "Proof." in gray
- **Body**: Regular text
- **Terminator**: Right-aligned QED tombstone (7x7pt filled square)
- **Padding**: Extra left padding (1.5em) for indentation effect

### Lemma Card
- **Background**: Light indigo (#EDE9FF)
- **Border**: 3pt blue left + 1pt blue (60% transparent) on other sides
- **Header**: "Lemma" in blue with optional number
- **Body**: Italic text

### Corollary Note
- **Background**: White
- **Border**: 3pt semi-transparent gold left + 1pt neutral
- **Header**: "Corollary." in gold + title in dark
- **Body**: Regular text

### Definition Box
- **Background**: Warm white (#F9F7F4)
- **Border**: 4pt dark indigo left + 1pt neutral
- **Header**: "Definition." in dark + term in blue
- **Body**: Regular text with separator rule
- **Distinction**: Uses the darkest border to signify foundational nature

### Axiom Tag
- **Shape**: Capsule (99pt border radius)
- **Background**: Light gold
- **Border**: 1pt gold
- **Content**: "A" + number prefix, then text
- **Size**: Inline, compact

### Proposition Card
- **Background**: White
- **Border**: 3pt gold left + 1pt neutral on other sides
- **Header**: "Proposition" in gold with optional number
- **Body**: Italic text

### Example Box
- **Background**: White
- **Border**: 3pt gray left + 1pt neutral
- **Header**: "Example." in gray + title
- **Body**: Regular text

### Remark Note
- **Background**: Warm white
- **Border**: 2pt muted left
- **Text**: Smaller (0.78em), muted color throughout
- **Character**: Understated, parenthetical

### Conjecture Card
- **Background**: White
- **Border**: 3pt red-orange left + 1pt transparent red-orange
- **Header**: "Conjecture." in red-orange + title
- **Body**: Italic text (unproven, hence visually distinguished)

---

## Slide Layouts

### Title Slide
- Full-page with zero margins
- Stacked layers: warm white bg > golden spiral > golden frame
- Content centered vertically and horizontally
- Hierarchy: title (2.4em bold) > gold rule (200pt) > subtitle (1.05em blue) > author > institution > date

### Content Slide
- Margins: top 4em, bottom 2em, x 2.2em
- Header: title (1.3em bold) + gold underline bar (140pt x 2pt)
- Footer: grid(1fr, auto, 1fr) with text | QED tombstone | page number
- Background atmosphere: golden spiral + golden-ratio positioned markers
- Content aligned to horizon

### Section Slide
- Full-page, zero margins
- Background: warm white + Fibonacci grid
- Left accent: 4pt gold bar (full height)
- Top-right: axes decoration (70pt)
- Content: large section number (3.5em gold) > gold rule > section title (2em)
- Bottom-right: QED tombstone marker

### Focus Slide
- Full-page, zero margins
- Background: warm white + golden spiral
- Gold rectangular frame (82% x 70%, 1.5pt stroke)
- Centered content (70% width) with QED divider below

### Ending Slide
- Full-page, zero margins
- Same golden frame as title slide (bookend consistency)
- QED divider above text, gold rule below, final tombstone (10x10pt)

---

## Golden Ratio Integration

The golden ratio (phi = 1.618...) appears throughout:
- **Page proportions**: Content area split at 61.8% for asymmetric layouts
- **Fibonacci grid**: Section slides use Fibonacci rectangle subdivisions
- **Background markers**: Positioned at 61.8% from edges
- **SVG spiral**: Logarithmic spiral approximating golden spiral
- **Reference lines**: Faint lines at golden section points in background
- **Vertical proportions**: Content positioned using golden ratio of remaining space

---

## Accessibility Notes

- Contrast ratios: deep indigo on warm white exceeds WCAG AA (7:1+)
- Gold accent on white meets AA for large text (3.5:1)
- All components use semantic structure (labels, roles)
- Color is never the sole differentiator -- border weight, style, and labels provide redundancy
- Font sizes remain legible at projection distances (18pt base)
