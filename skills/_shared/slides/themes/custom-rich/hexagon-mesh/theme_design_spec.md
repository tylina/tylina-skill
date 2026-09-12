# Hexagon Mesh Theme — Design Specification

## Concept

The Hexagon Mesh theme draws visual inspiration from molecular structures, honeycomb patterns, carbon nanotubes, graphene lattices, and crystallography — celebrating the beauty of hexagonal geometry found in nature and engineering. It combines the precision of materials science visualization with the elegant tessellation patterns of hexagonal close-packing.

The theme presents a clean, scientific aesthetic on **light grey-white backgrounds** — professional and readable while maintaining visual richness through carefully crafted hexagonal decorative elements, molecular bond lines, and vertex node markers.

**Theme Name Rationale**: "Hexagon Mesh" references the fundamental geometric pattern found across chemistry (benzene rings), biology (honeycombs), materials science (graphene), and network theory — making it versatile for any science/technology presentation without being pigeonholed into a single discipline.

---

## Visual Identity

### Color Philosophy

The palette is built around the natural association of teal/cyan with scientific visualization, paired with dark slate for authority and amber for selective emphasis — evoking the color language of molecular modeling software and crystallography diagrams.

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Light grey-white | `#F9FAFB` | Clean, neutral, minimal visual noise |
| Primary accent | Teal | `#0D9488` | Molecular bonds, node highlights, scientific precision |
| Secondary | Dark slate | `#334155` | Text authority, structural elements, bond lines |
| Accent | Amber | `#D97706` | Selective emphasis, energy states, warnings |
| Body text | Cool grey | `#374151` | Readable, professional, not harsh |
| Muted text | Medium grey | `#6B7280` | Captions, footnotes, metadata |
| Card background | Pure white | `#FFFFFF` | Content separation, card surfaces |
| Borders | Light grey | `#D1D5DB` | Subtle structure without heaviness |

Teal and amber remain bright decorative tokens. Normal-size semantic text uses dark slate or a darkened accent; Touying alert text receives a darkened teal so it clears normal-text contrast on the light surfaces.

### Typography

- **Theme entry**: Font-agnostic; it sets only size and semantic color
- **Demo primary font**: IBM Plex Sans — an installed geometric sans-serif with technical precision
- **Demo monospace**: IBM Plex Mono — for code and data
- **Base size**: 18pt
- **Heading style**: Semibold dark-slate section and slide headings; bold is reserved for the cover

### Key Visual Elements

1. **Hexagonal Grid Patterns**: Tessellating hexagons at various scales and opacities as background texture
2. **Molecular Bonds**: Connecting lines between hexagon centers — single and double bond styles
3. **Node Dots**: Small circles at hexagonal vertices representing atomic positions
4. **Crystalline Borders**: Frame elements made of connected hexagons with vertex nodes
5. **Lattice Mesh Backgrounds**: Full-page hexagonal tessellation at very low opacity

---

## SVG Architecture

### 1. Hexagonal Mesh Background (Full-page)
- 20+ hexagons of varying sizes distributed across 840x474 viewport
- Mix of stroked hexagons (most) and lightly filled ones (rare, for depth)
- Bond lines connecting nearby hexagon centers
- Node dots at select vertices
- Opacity range: 0.05-0.15 for subtlety

### 2. Lattice Frame (Bookend — Title + Ending)
- Corner clusters of 2 connected hexagons at each corner
- Connecting lines between corner clusters forming a border
- Node dots at hexagon vertices with varying sizes
- Center-top/bottom amber accent hexagons
- Shared between title and ending slides (bookend element)

### 3. Bond Divider
- Horizontal molecular bond line with alternating single/double bonds
- Atom nodes (circles) at connection points
- Central amber node as focal point
- Terminal nodes slightly larger

### 4. Crystal Accent
- Compact cluster of 3-4 hexagons
- Bond lines connecting centers
- Vertex nodes with varying colors
- Used for corner decorations on content slides

---

## Component Design Language

All components follow these principles:
- Clean geometric borders (no rounded excess)
- Node/dot indicators for visual anchoring
- Hexagonal motifs in headers and accents
- `lazy-v(1fr)` only in the flexible `hex-card`, `lattice-quote`, and `mesh-card`; each must be the sole child of a `cols(lazy-layout: true)` column
- Natural-height `molecule-box`, `node-stat`, `structure-box`, and `electron-list` for ordinary flow and stacked regions
- `node-stat` uses one centered icon → value → label `stack` with no intervening `v()`; regular KPI rows use `grid`
- `electron-list` scopes standard Typst `- item` syntax rather than accepting an item array
- Palette-based coloring with accent parameter overrides

---

## Slide Types

| Slide | Background | Key Elements |
|-------|-----------|--------------|
| Title | bg + hex mesh + lattice frame | Centered title, bond divider, metadata |
| Content | bg + hex mesh + crystal accents | Header with bond divider, persistent atmosphere |
| Section | bg + hex mesh + left bar | Large section number, teal accent |
| Focus | Dark slate + hex mesh | Centered light text, corner nodes |
| Ending | bg + hex mesh + lattice frame | Centered farewell, bond divider above |

---

## Best For

- Chemistry and materials science presentations
- Nanotechnology and biotech research talks
- Network architecture and system design
- Tech company branding (non-generic)
- Scientific conference presentations
- Engineering and crystallography
