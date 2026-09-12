# Coral Reef Theme -- Visual Design Specification

## Design Philosophy

The Coral Reef theme draws inspiration from the deep ocean environment -- specifically the mesophotic and twilight zones where bioluminescent creatures illuminate the darkness and vibrant coral formations create organic architecture. The design uses a dark canvas (deep ocean) illuminated by strategic color accents that mimic bioluminescence, creating a sense of depth, wonder, and natural beauty.

## Aesthetic Metaphor

**Deep sea coral reef** -- the dark depths illuminated by bioluminescent creatures, vibrant coral formations, and the organic flowing shapes of sea life. Dark background with luminous color accents that appear to glow against the darkness.

## Color System

### Primary Palette

| Color         | Hex     | Role                | Inspiration                     |
|---------------|---------|---------------------|---------------------------------|
| Ocean Blue    | #006994 | Primary structural  | Mid-depth ocean water           |
| Coral Pink    | #FF6B6B | Secondary accent    | Living coral polyps             |
| Bio Cyan      | #00E5FF | Highlight/glow      | Bioluminescent organisms        |
| Deep Ocean    | #0A1628 | Background          | Abyssal zone darkness           |
| Light Azure   | #E0F4FF | Text/ink            | Scattered light in shallow water|

### Contrast Ratios (on #0A1628 background)

- #E0F4FF (ink): ~14:1 -- excellent readability
- #00E5FF (cyan): ~9:1 -- strong accent visibility
- #FF6B6B (coral): ~5:1 -- adequate for decorative/bold text
- #006994 (ocean): ~3:1 -- structural/decorative only

### Transparency Layers

The theme uses systematic transparency to create depth:
- **Full opacity**: Headlines, primary content
- **25% transparent (dim)**: Secondary text
- **50% transparent (muted)**: Tertiary text, borders
- **75% transparent (faint)**: Subtle backgrounds, far accents
- **90%+ transparent (ghost)**: Background textures, watermarks

## Typography

### Font Stack
- **Body**: Avenir Next (Latin), Arial Unicode MS (broad-script fallback)
- **Mono**: IBM Plex Mono (labels, metadata, technical)

### Scale
- Display: 40pt -- Title slides only
- H1: 28pt -- Section headings
- H2: 22pt -- Slide titles
- Body: 16pt -- Content text
- Small: 12pt -- Tags, secondary info
- Tiny: 9pt -- Labels, kickers
- Meta: 8pt -- Footers, minimal metadata

### Text Treatment
- Labels/kickers: Uppercase, letter-spacing 1.2-2pt, monospace, cyan
- Body: Regular weight, dim ink
- Headings: Bold weight, full ink
- Quotes: Italic, full ink with cyan left border

## Layout Grid

### Page Setup
- Ratio: 16:9 (presentation-16-9)
- Margins: top 4em, bottom 1.5em, x 2em
- Header ascent: 30%
- Footer descent: 30%

### Content Areas
- Standard slides: 2-column grid with 24pt gutter
- Stats grid: 4-column with 12pt gutter
- Cards: 3-column with 16pt gutter
- Focus slides: Centered with 3em padding on all sides

## Decorative Elements

### SVG Decorations (4 inline SVGs)

1. **Coral Branch** (200x200 viewBox)
   - Organic branching paths with rounded caps
   - Terminal dots (polyp tips)
   - Used: title-slide corners, ending-slide bottom

2. **Bubble Cluster** (120x180 viewBox)
   - 9 circles of decreasing size ascending
   - Stroke-only with subtle interior fill on largest
   - Used: section slides, title-slide accent

3. **Jellyfish** (160x200 viewBox)
   - Bell shape (filled path) with 5 trailing tentacles
   - Internal dot details (gonads)
   - Used: title-slide, ending-slide, decorative

4. **Wave Pattern** (400x80 viewBox)
   - 3 sinusoidal curves (offset vertically)
   - Decreasing opacity for depth illusion
   - Used: slide backgrounds, section transitions, panels

### Bioluminescent Dot
- 3 concentric circles: outer (80% transparent), middle (50%), core (opaque)
- Creates glowing point-light effect
- Used throughout as scattered ambient decoration

## Component Design

### coral-card
- Border: 1pt coral-dim, 12pt radius
- Fill: bg lightened 5%
- Content: bold title + dim body text

### biolumi-stat
- Label: tiny uppercase monospace cyan
- Value: 42pt bold ink
- Accent: biolumi-dot beside value
- Underline: 30pt x 2pt cyan bar
- Description: 13pt muted text

### current-panel
- Top: wave-pattern SVG (clipped to 20pt height)
- Body: ocean-blue left border (1.5pt), faint ocean fill
- Right/bottom: faint ocean stroke

### bubble-tag
- Pill shape: 14pt radius
- Fill: cyan 85% transparent
- Border: 0.5pt cyan-muted
- Text: small monospace cyan

## Slide-Specific Design

### Title Slide
- Full bleed (margin: 0)
- Decorative: coral branches (2), jellyfish (1), bubble cluster (1), waves
- Frame: 96% x 94% rect with ocean-dim stroke
- Content: centered, institution kicker -> title -> divider -> subtitle -> author/date

### Section Slide
- Full bleed
- Wave pattern top
- Bubble cluster top-right
- Section number: layered translucent circles (glow) + bold number
- Depth marker text (decorative metadata)
- Coral accent line top-left

### Focus Slide
- Deep background (bg-deep = bg darkened 30%)
- Scattered bioluminescent dots (7 placed)
- Corner L-shaped coral accent lines
- Width-constrained: 3em horizontal padding
- Text: 1.4em italic centered

### Ending Slide
- Full bleed
- Wave pattern bottom
- Coral branches: bottom-left and bottom-right
- Jellyfish: top-left and top-right (floating)
- Ghost watermark text: "DEEP BLUE" at 100pt, ink-ghost
- Frame: 96% x 94% rect
- Content: biolumi-dot ornament + title + coral divider + "PROTECT OUR OCEANS"

## Motion and Rhythm

The theme creates visual rhythm through:
- **Vertical flow**: Bubbles and jellyfish suggest upward movement
- **Horizontal flow**: Wave patterns create lateral continuity
- **Organic curves**: All decorative elements use curved paths (no sharp geometry)
- **Depth layers**: Multiple transparency levels create z-axis depth

## Accessibility Notes

- All text meets WCAG AA contrast requirements against dark background
- Decorative SVGs use opacity to avoid competing with content
- Color is never the sole means of conveying information
- Coral pink + cyan combination avoids common colorblindness confusion (both remain visible to protanopia/deuteranopia)
