# Tensor Field Theme - Design Specification

## Design Philosophy

The Tensor Field theme visualizes the aesthetic of mathematical field theory --- flowing streamlines, gradient fields, coordinate systems, and tensor notation. It targets audiences in mathematics, physics, machine learning, and computational science who appreciate rigorous visual metaphors.

## Visual Identity

### Background Treatment
- **Base**: Warm cream/ivory (#FFFEF7) providing a paper-like reading surface
- **Atmosphere**: Full-page vector field SVG with coherent streamlines following a saddle-point/dipole flow pattern
- **Streamline variation**: Multiple curves with varying stroke widths (0.6-1.5pt) encode field magnitude
- **Opacity layering**: Lines at 6-12% opacity ensure readability while maintaining visual interest

### Color System

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Primary | Deep Indigo | #312E81 | Titles, structural elements, coordinate axes |
| Secondary | Amber | #B45309 | Accents, alternate flow lines, highlights |
| Accent | Blue | #3B82F6 | Interactive elements, equipotential lines |
| Text | Dark Stone | #1C1917 | Body copy |
| Text Muted | Stone | #57534E | Captions, footers |
| Card BG | White | #FFFFFF | Content cards |
| Border | Light Stone | #D6D3D1 | Card borders, dividers |

### Typography
- **Body**: IBM Plex Sans with Arial and Helvetica fallbacks at 18pt in the demo
- **Code**: IBM Plex Mono with Menlo and Courier fallbacks
- **Ownership**: The presentation sets its installed font stack; `template.typ` owns size, color, and hierarchy only
- **Titles**: Bold, 1.3em in primary color
- **Section numbers**: 3em, secondary color, bold

## Decorative Elements

### Flow Field Background (SVG)
- Saddle-point/dipole pattern with 8 streamlines
- Arrow tips on select streamlines indicate flow direction
- 3 concentric equipotential circles centered at slide midpoint
- Colors: primary (most lines), secondary (2 accent lines), accent (contour circles)

### Field Frame (SVG)
- Double border: outer 1.8pt primary, inner 0.6pt secondary
- Coordinate axes in top-left and bottom-right corners with arrow tips
- Axis labels (italic x, y) near arrows
- Wave-pattern flow lines along top and bottom edges

### Gradient Divider (SVG)
- Horizontal line with arrow tip
- 6 perpendicular hash marks of increasing size (showing gradient magnitude)
- Origin dot at start
- Width: scalable, default 300 units

### Manifold Accent (SVG)
- Small curved surface mesh (120x80)
- U-direction curves in primary, v-direction in secondary
- Intersection node dots in accent color

### Bookend Mark (SVG)
- Tensor bracket corner (L-shape)
- Double line: outer primary (2.5pt), inner secondary (1.2pt)
- Index dots at corner and midpoints

## Slide Layout Specifications

### Title Slide
- Full background: cream + flow field + field frame
- Bookend corners at top-left and bottom-right (32pt)
- Center-aligned content block (padded 5em horizontal)
- Vertical stack: title (2.4em bold primary) -> divider -> subtitle -> author -> institution -> date
- No header/footer, zero margin

### Content Slide (default)
- Header: title (1.3em bold primary) + gradient divider (160pt)
- Footer: 3-column grid with custom footer text, manifold accent (28pt center), page counter
- Body margin: top 4em, bottom 2em, x 2.2em
- Background: cream fill + flow field atmosphere

### Section Slide
- Left accent bar: 6pt indigo
- Content area padded left 5em, right 4em
- Section number (3em secondary) above section title (2em bold)
- Gradient divider below title
- Bottom accent line: full-width 3pt border color

### Focus Slide
- Background: solid deep indigo (primary)
- Field frame overlay
- Centered content block (76% width)
- White text, 1.4em bold
- Gradient divider below content

### Ending Slide
- Background: solid deep indigo
- Flow field + field frame overlay
- Bookend corners (matching title slide)
- Centered content (60% width)
- Gradient divider above, accent line below
- White text, 2.4em bold

## Component Design Patterns

### Cards (field-card, basis-card)
- White background, rounded corners
- Left border accent (3.5pt for field-card, 1pt all for basis-card)
- Title with indicator element
- Decorative overlays (flow dots, coordinate axes)

### Boxes (manifold-box, eigenvalue-box, theorem-box)
- Tinted background matching accent
- Prominent border styling (left emphasis)
- Decorative elements (manifold mesh, lambda symbol, kind label)
- Clear title/body separation

### Indicators (magnitude-stat, vector-tag)
- Compact, high-information-density
- Gradient bars or arrow icons
- Color-coded to category

### Structural (flow-divider, topology-quote)
- Visual separation elements
- Quote styling with manifold decoration and attribution

## Technical Notes

- All SVGs use viewBox for proper scaling
- Transparency values chosen to avoid interference with text readability
- Components use `lazy-v(1fr)` for flexible vertical spacing in grid layouts
- Theme entry point: `tensor-field-theme`
- Compatible with Touying 0.7.4
- Single-file architecture: all palette, SVGs, components, slide functions, and entry point in `template.typ`
