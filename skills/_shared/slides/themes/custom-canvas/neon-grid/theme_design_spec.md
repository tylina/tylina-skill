# Neon-Grid - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Neon-Grid Touying theme. Retro-futuristic wireframe grid aesthetic inspired by 80s/90s tech magazine covers -- perspective grids, wireframe geometry, neon accent lines on light backgrounds. Earnest retro-futurism, not ironic vaporwave.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | neon-grid |
| **Page Format** | 16:9 Presentation (254mm x 142.9mm) |
| **Best For** | Tech presentations, spatial computing, 3D/graphics talks, product launches, innovation showcases |
| **Style Objective** | Retro-futuristic wireframe grid / 80s tech magazine |
| **Complexity Level** | Canvas |
| **Created Date** | 2025-05-24 |

### Complexity Guide

This theme is **Canvas** level:
- `place()` + inline styling per page
- 9 reusable components referencing `palette.xxx`
- 40-100+ lines/slide for complex compositions
- Perspective grids, wireframe SVGs, neon corner brackets, scanline textures

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 Presentation |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 4em, bottom: 1.5em, x: 2em (standard slides) |

## III. Visual Theme

### Design Philosophy

"Every surface begins as a wireframe."

Inspired by 80s/90s tech magazine illustrations -- perspective grids converging to vanishing points, wireframe 3D objects floating in space, neon-colored accent lines on clean light backgrounds. The aesthetic is earnest retro-futurism: forward-looking, geometric, energetic. NOT vaporwave (which is pastel, ironic, melancholic). This is the optimistic future as imagined by engineers.

Four-color system (bg/ink/accent/secondary) creates a crisp, high-contrast look with hot magenta and electric cyan as the neon accents against light gray.

### Color Scheme (palette dictionary)

#### Preset: `light` (default)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Background** | Light Gray | `#F2F0F5` | `palette.bg` | Light page background |
| **Ink** | Charcoal | `#1A1A2A` | `palette.ink` | Primary text |
| **Accent** | Hot Magenta | `#E91E8C` | `palette.accent` | Primary neon accent |
| **Secondary** | Electric Cyan | `#00BCD4` | `palette.secondary` | Secondary neon accent |
| **Card** | White | `#FFFFFF` | `palette.card` | Card backgrounds |
| **Deep Purple** | Deep Purple | `#4A148C` | `palette.deep-purple` | Tertiary emphasis |
| **Ink Muted** | -- | ink@50% | `palette.ink-muted` | Metadata, labels |
| **Ink Ghost** | -- | ink@90% | `palette.ink-ghost` | Ghost text |
| **Accent Ghost** | -- | accent@92% | `palette.accent-ghost` | Faint accent fills |
| **Surface** | -- | ink@94% | `palette.surface` | Subtle surface fill |

#### Preset: `dark`

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#1A1A2A` charcoal | Dark mode base |
| **Ink** | `#F2F0F5` light gray | Light text on dark |
| **Accent** | `#E91E8C` hot magenta | Same neon accent |
| **Secondary** | `#00BCD4` electric cyan | Same secondary |

#### Preset: `vapor`

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#F5F0FA` lavender white | Softer light base |
| **Ink** | `#2A1A3A` deep charcoal | Purple-tinted text |
| **Accent** | `#9C27B0` purple | Purple accent |
| **Secondary** | `#00E5FF` bright cyan | High-energy cyan |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Alert text, focus highlights |
| `neutral-lightest` | `palette.bg` | Light backgrounds |
| `neutral-darkest` | `palette.ink` | Dark text |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | IBM Plex Sans, Noto Sans SC | Set in `demo.typ` / the consuming deck |
| **Mono** | IBM Plex Mono | Used internally for kickers/metadata/labels |

> **Important**: The reusable theme entry point is font-family agnostic. Set the document font in `demo.typ` or the consuming deck.

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 20pt | Set via `set text(size: 20pt)` in theme entry point |

### Weight Hierarchy

| Element | Weight | Rationale |
|---------|--------|-----------|
| Display/Title | `"bold"` (700) | Strong but not overwhelming |
| Headings | `"bold"` (700) | Clear hierarchy |
| Body text | `"regular"` (400) | Readable baseline |
| Kickers/Meta | `"bold"` (700) | Monospace + bold for technical feel |
| Stats | `"bold"` (700) | Data emphasis |
| Tags | `"bold"` (700) | Small but visible |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Preset `bg` color with full-page perspective grid SVG
- **Layout**: Centered. Institution kicker, massive title, neon divider, subtitle, author/date
- **Decorative elements**: Full wireframe corner brackets frame, triangle cluster (top-right), wireframe sphere (bottom-left), scanline texture overlay, ghost "GRID" text
- **Typography**: Title at 44pt bold weight
- **Bookending**: Shares full wireframe frame with ending-slide

### Section Slide (`new-section-slide`)

- **Background**: Preset `bg` color with perspective grid
- **Layout**: Left-aligned section title with secondary accent rule below
- **Decorative elements**: Corner brackets (top-left, bottom-right), triangle cluster (top-right), ghost section number (140pt mono), accent line at top
- **Numbering**: Via `utils.display-current-heading-number(level: 1, numbering: "01")`

### Content Slide (`slide`)

- **Background**: `palette.bg`
- **Persistent elements**: Faint perspective grid + neon corner accents (top-left magenta, bottom-right cyan)
- **Header**: Bold title + magenta accent rule (50pt)
- **Footer**: NEON-GRID label + neon dot + page number
- **Content area**: Standard margins

### Dark Slide (`dark-slide`)

- **Background**: `#1A1A2A` (charcoal)
- **Layout**: Full-page perspective grid + scanline texture + wireframe sphere
- **Decorative elements**: Corner neon brackets, sphere (top-right)
- **Text**: White card color
- **Purpose**: High-contrast technical data, vision statements

### Focus Slide (`focus-slide`)

- **Background**: `palette.bg`, no header/footer
- **Layout**: Centered text, horizontally and vertically
- **Typography**: 1.6em bold weight
- **Decorative elements**: Perspective grid (subtle), L-bracket corners in alternating accent/secondary colors

### Ending Slide (`ending-slide`)

- **Background**: Preset `bg` with full perspective grid + scanline texture
- **Layout**: Centered heavy title with neon divider lines above and below
- **Decorative elements**: Full wireframe corner brackets frame (bookend with title), ghost "END" text, wireframe sphere, triangle cluster
- **Bookending**: Shares full wireframe frame with title-slide
- **Meta**: NEON-GRID label

## VI. SVG Assets (5 total)

| SVG | Element Count | Description |
|-----|--------------|-------------|
| `_perspective-grid-svg` | 15 elements | Converging lines to vanishing point + horizontal cross-lines + center dot |
| `_wireframe-sphere-svg` | 12 elements | Geodesic wireframe sphere with axis lines and pole dots |
| `_corner-brackets-svg` | 12 elements | L-shaped corner brackets with accent dots at corners |
| `_triangle-cluster-svg` | 11 elements | Overlapping wireframe triangles with vertex dots |
| `_scanline-svg` | 30 elements | Horizontal scan lines at alternating opacities |

## VII. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `wire-card` | `wire-card(title, body)` | Content card | White card with magenta top line and faint border |
| `pixel-stat` | `pixel-stat(label, value, description)` | Data counter | Large number with mono label and cyan underline |
| `vector-box` | `vector-box(body)` | Content block | Surface-fill box with magenta left border |
| `grid-divider` | `grid-divider(total-width)` | Section separator | Line with crosshair marks at intervals |
| `glow-tag` | `glow-tag(body, color)` | Inline label | Translucent pill with neon border |
| `frame-highlight` | `frame-highlight(body)` | Emphasis block | Bordered box with corner bracket accents |
| `render-note` | `render-note(body)` | Aside/note | Purple-tinted note with NOTE prefix |
| `vertex-badge` | `vertex-badge(body, color)` | Circular badge | Numbered circle with neon stroke |
| `polygon-list` | `polygon-list(..items)` | Numbered list | Items with vertex-badge numbering |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| 80s tech magazine covers | Wireframe 3D, perspective grids, neon on light |
| Tron (1982) aesthetic | Wireframe landscapes, neon edge lighting |
| Scientific American illustrations | Technical wireframes, clean line art |
| CAD software interfaces | Grid backgrounds, vertex markers, edge highlighting |
| Retro-futurism art | Optimistic technological future, geometric forms |

---

## Output Files

```
neon-grid/
  template.typ          # Theme definition -- palette, components, slide functions
  demo.typ              # Compilable demonstration showcasing all components
  theme_design_spec.md  # This specification document
  theme.md              # API summary and reference
```

> **Template-Content Separation**: `template.typ` contains ZERO content text. It defines colors, components, and slide types. Switching topics requires ZERO template changes.
