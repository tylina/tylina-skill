# Copper Circuit Theme -- Visual Design Specification

## Overview

**Theme Name**: copper-circuit
**Style Objective**: Engineering Elegance / PCB Art
**Complexity Level**: Rich (custom SVG decorations, multi-layer backgrounds, 10+ components)
**Best For**: Engineering presentations, hardware product launches, IoT demos, electronics courses, maker presentations

The copper-circuit theme draws direct inspiration from Printed Circuit Board (PCB) design. It renders the beauty of electronics engineering -- copper traces on cream FR4 substrate, solder pads, via holes, and component outlines -- as a cohesive presentation aesthetic. The theme is deliberately warm and distinctive, NOT dark, using a cream/FR4 substrate as the primary background.

---

## Design Philosophy

### Source Inspiration
- **FR4 substrate** (fiberglass-reinforced epoxy): warm cream background color
- **Copper traces**: right-angle and 45-degree routing paths as decorative accents
- **Solder pads**: circular and rectangular pads with drill holes
- **Via holes**: through-hole connections represented as circles with center dots
- **IC packages**: DIP/QFP chip silhouettes with pin outlines
- **Edge connectors**: gold-plated finger contacts along board edges
- **Solder mask**: green protective coating (muted sage green accent)
- **ENIG finish**: gold plating on exposed pads (gold accent)

### Design Principles
1. **Warmth over coldness**: Unlike typical tech themes, this uses warm earth tones derived from actual PCB materials
2. **Structural clarity**: PCB design requires precision; the theme mirrors this with clean grid-based layouts
3. **Layered depth**: Like a multi-layer PCB, visual elements build in layers (substrate, traces, pads, components)
4. **Functional decoration**: Every decorative element references a real PCB feature
5. **Engineering precision**: Consistent spacing, alignment, and proportions

---

## Color Palette

### Primary Colors

| Swatch | Name | Hex | RGB | Usage |
|--------|------|-----|-----|-------|
| ![#FDF8F0] | Substrate | `#FDF8F0` | 253, 248, 240 | Main background -- FR4 board material |
| ![#C87941] | Copper | `#C87941` | 200, 121, 65 | Primary accent -- copper trace color |
| ![#A8B5A0] | Solder | `#A8B5A0` | 168, 181, 160 | Secondary accent -- solder mask green |
| ![#D4A843] | Gold Pin | `#D4A843` | 212, 168, 67 | Tertiary accent -- gold plating |

### Text Colors

| Swatch | Name | Hex | RGB | Usage |
|--------|------|-----|-----|-------|
| ![#2A2420] | Dark Text | `#2A2420` | 42, 36, 32 | Headings, titles |
| ![#4D4540] | Body Text | `#4D4540` | 77, 69, 64 | Body copy, descriptions |
| ![#7B6B5A] | Via | `#7B6B5A` | 123, 107, 90 | Muted text, connector marks |

### Surface Colors

| Swatch | Name | Hex | RGB | Usage |
|--------|------|-----|-----|-------|
| ![#FFFEF9] | Card BG | `#FFFEF9` | 255, 254, 249 | Card backgrounds |
| ![#F5F0E5] | Pad Fill | `#F5F0E5` | 245, 240, 229 | Subtle fills, component areas |
| ![#E0D5C5] | Border | `#E0D5C5` | 224, 213, 197 | PCB edge borders, separators |

### Color Relationships
- Substrate and Card BG are very close (cream family) for subtle card elevation
- Copper is the dominant accent -- used for traces, borders, and interactive elements
- Solder (muted green) provides contrast without competing with copper
- Gold Pin is reserved for highlights and special elements
- Via color serves as the "quiet" color for secondary information

---

## SVG Decorations

### 1. Circuit Trace (`_circuit-trace-svg`)
- Full-page background overlay (840x474)
- Right-angle and 45-degree copper trace paths
- Square pads at trace endpoints
- Via holes (circle + center dot) at intersections
- Opacity: 0.06-0.10 (subtle background atmosphere)
- Used on: every content slide

### 2. Via Pattern (`_via-pattern-svg`)
- Full-page background overlay (840x474)
- Scattered via holes across the page
- Each via: outer circle (stroke) + inner dot (fill)
- Variable sizes (3-4px radius) for organic feel
- Opacity: 0.05-0.10
- Used on: every slide type

### 3. Solder Pads (`_solder-pads-svg`)
- Corner decoration (100x100)
- Grid of square and circular pads
- Each pad has a drill hole (cream fill center)
- Mix of copper and gold-colored pads
- Opacity: 0.09-0.15
- Used on: content slide corners

### 4. Component Outline (`_component-outline-svg`)
- IC package decoration (200x160)
- DIP package silhouette with rectangular body
- Pin lines extending from both sides (6 pins each)
- Orientation notch (semicircle on body)
- Center marking area
- Opacity: 0.12-0.18
- Used on: title-slide, ending-slide (bookending)

### 5. PCB Frame (`_pcb-frame-svg`)
- Full-page board outline (840x474)
- Double border (outer edge + inner copper pour)
- Four corner mounting holes (circle + center dot)
- Top edge connector (array of gold finger pads)
- Used on: title-slide, ending-slide, focus-slide

### 6. PCB Title Traces (`_pcb-title-trace-svg`)
- Full-page decorative traces for title areas (840x474)
- Symmetrical traces from left/right edges converging toward center
- Endpoint via pads with drill holes
- Secondary gold-colored trace branches
- Used on: title-slide, ending-slide

### 7. Edge Connector (`_edge-connector-svg`)
- Vertical panel (60x474)
- Solder mask green background fill
- Right-side copper trace line
- Array of gold-plated finger contacts
- Contacts at top and bottom regions
- Used on: new-section-slide (left panel)

### 8. Trace Divider (`_trace-divider-svg`)
- Inline separator (400x12)
- Horizontal copper trace with via interruptions
- Three vias spaced along the trace
- Used as: content separator between sections

---

## Slide Type Specifications

### Title Slide
- **Background**: Substrate fill + via pattern + PCB frame + title traces
- **Decorations**: Component outlines (top-right, bottom-left)
- **Content**: Centered title block with copper accent bar
- **Typography**: 2.4em bold title, 1.05em copper subtitle
- **Margins**: 0pt (full bleed decorations)

### Content Slide
- **Background**: Substrate fill (via page config) + via pattern + circuit traces
- **Decorations**: Corner solder pads (top-right, bottom-left)
- **Header**: Bold title + copper trace accent bar
- **Footer**: Grid layout -- footer text | via marker | page counter
- **Margins**: top: 4em, bottom: 2em, x: 2.2em

### New Section Slide
- **Background**: Substrate fill + via pattern
- **Left panel**: Edge connector (60pt wide, full height)
- **Content**: Section number in circular solder pad + section title + copper bar
- **Bottom**: 2pt border line (PCB edge)
- **Margins**: 0pt (custom padding)

### Outline Slide
- **Background**: Substrate fill + via pattern
- **Title**: 1.8em bold + copper accent bar
- **Bullets**: Via markers (circle + center dot)
- **Content**: Auto-generated from level-1 headings

### Focus Slide
- **Background**: Copper fill (primary accent as background)
- **Overlays**: Circuit traces + PCB frame
- **Content**: Centered cream text on copper, 1.4em bold
- **Accent**: Translucent cream bar below content

### Ending Slide
- **Background**: Substrate fill + via pattern + PCB frame + title traces
- **Decorations**: Component outlines (bookending with title slide)
- **Content**: Centered text + trace divider below
- **Typography**: 2.4em bold dark text

---

## Component Specifications

### IC Card
- **Metaphor**: Integrated circuit DIP package
- **Border**: 1.5pt solid border all around
- **Pins**: 3 horizontal bars on left + right edges (accent color)
- **Orientation**: Small circle (notch) at top-left
- **Fill**: card-bg (opaque white)
- **Height equalization**: terminal `lazy-v(1fr)` supports valid one-card-per-column `cols(lazy-layout: true)` groups

### Trace Box
- **Metaphor**: Signal trace connecting to a component
- **Left border**: 3pt accent color (represents copper trace)
- **Title**: Preceded by small trace marker (12pt bar)
- **Fill**: card-bg (opaque)
- **Corner radius**: right side only (3pt)

### Pad Stat
- **Metaphor**: Solder pad with measurement annotation
- **Layout**: Centered vertical -- pad icon, value, label
- **Pad icon**: Circle ring (5pt radius) + center dot
- **Value**: 1.7em bold in accent color
- **Label**: Uppercased, muted body text

### Signal Quote
- **Metaphor**: Oscilloscope signal display
- **Left border**: 3pt accent (signal line)
- **Wave indicator**: Tilde character at top-left
- **Background**: pad-fill (warm subtle)
- **Attribution**: Prefixed with em-dash

### Component Card
- **Metaphor**: Electronic component on PCB
- **Header**: Pad-fill background with resistor zigzag symbol
- **Body**: card-bg background
- **Structure**: stack(spacing: 0pt) with clip: true
- **Symbol**: 5-segment zigzag line mimicking resistor

### Solder Tag
- **Metaphor**: Component label / reference designator
- **Shape**: Pill-shaped (10pt border radius)
- **Fill**: Color lightened 85%
- **Border**: 1.2pt with 40% transparency
- **Text**: 0.72em semibold

### Bus Entry
- **Metaphor**: Data bus connection point
- **Step indicator**: Circular pad (28pt) with step number
- **Layout**: Horizontal -- step pad + content
- **Content rhythm**: Title and description use `stack(spacing: 0.8em)`; no manual `v()` separator
- **Equalization**: One direct `bus-entry` per `cols(lazy-layout: true)` column; separate process rows remain separate semantic groups
- **Bus lines**: Three fading horizontal bars at bottom
- **Fill**: card-bg (opaque)

### Datasheet Table
- **Metaphor**: Component datasheet specification table
- **Header row**: Solder mask green (lightened 60%)
- **Alternating rows**: pad-fill / card-bg
- **Border**: 0.5pt border color between cells
- **Container**: 1pt border, 3pt radius, clipped

### Trace Divider
- **Metaphor**: Copper trace with via interruptions
- **Implementation**: SVG inline image
- **Default width**: 70% of container
- **Height**: 10pt rendered

### Module Card
- **Metaphor**: PCB sub-module (SOM, daughter board)
- **Corner notches**: 4 small squares at corners (module mounting points)
- **Title**: Preceded by module icon (nested square)
- **Border**: 1.5pt solid, minimal radius (2pt)
- **Fill**: card-bg (opaque)

---

## Typography

### Font Stack (set in demo.typ, not template)
- Primary: Arial (available system sans-serif)

### Size Scale
- Base: 20pt
- Title slide heading: 2.4em (48pt)
- Section heading: 2em (40pt)
- Slide title: 1.3em (26pt)
- Card title: 0.92em (18.4pt)
- Body text: 0.82em (16.4pt)
- Labels/tags: 0.72em (14.4pt)
- Footer: 0.6em (12pt)

### Weight Usage
- Titles: bold
- Card titles: bold
- Body: regular
- Labels: medium/semibold
- Tags: semibold

---

## Spacing System

- Card inset: x: 0.8em-1.4em, y: 0.35em-0.8em
- Column gutter: 0.8em-1.2em (varies by density)
- Vertical gaps between sections: 0.4em-0.5em
- Header padding: x: 1.8em, top: 0.6em, bottom: 0.2em; title-to-trace stack gap: 0.8em
- Footer padding: x: 1.8em, y: 0.4em
- Page margins: top: 2.7em, bottom: 0.95em, x: 2.2em

---

## Bookending Strategy

The title-slide and ending-slide share the following decorative elements:
1. PCB frame (mounting holes + edge connectors)
2. Title traces (copper routes converging to center)
3. Component outlines (IC packages at opposite corners)
4. Via pattern background atmosphere

Content slides have a lighter treatment:
1. Via pattern (subtle atmosphere)
2. Circuit traces (faint background)
3. Corner solder pads (small decorations)

This creates visual cohesion while maintaining hierarchy between special slides and content slides.

---

## Accessibility Notes

- All text maintains WCAG AA contrast against substrate background
- Copper accent on cream passes 3:1 contrast for large text
- Dark text (#2A2420) on substrate (#FDF8F0) achieves 12.5:1 contrast ratio
- Body text (#4D4540) on substrate achieves 7.2:1 contrast ratio
- SVG decorations are purely atmospheric (opacity 0.05-0.20) and do not interfere with readability
