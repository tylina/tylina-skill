# solarpunk - Theme Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | solarpunk |
| **Page Format** | 16:9 (presentation-16-9) |
| **Best For** | Sustainability presentations, green technology pitches, urban planning, regenerative design talks, climate-positive initiatives |
| **Style Objective** | General Versatile |
| **Complexity Level** | Canvas |
| **Created Date** | 2026-05-23 |

### Complexity Guide

Canvas-level composition with full SVG decorations, dark/light rhythm, persistent atmosphere on all slides, and preset-based palette system.

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | presentation-16-9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 3.5em, bottom: 1.5em, x: 2em |

## III. Visual Theme

### Design Philosophy

A solarpunk city in 2060. Buildings covered in living plants. Solar panels integrated with garden rooftops. Everything is organic curves meeting clean technology. Art Nouveau meets sustainable engineering. The future is GREEN, WARM, and HOPEFUL. Every slide feels alive and growing.

### Color Scheme -- Palette Factory (Canvas)

| Property | Value |
|----------|-------|
| **Factory function name** | `build-palette` |
| **Exported variable** | `palette` |
| **Base inputs** | `bg`, `ink`, `accent` (green), `secondary` (gold), `secondary-text` |

#### Presets

| Preset Name | BG | Ink | Accent | Secondary | Best For |
|-------------|-----|------|--------|-----------|----------|
| dawn (default) | `#FDF8F0` | `#1A2A1A` | `#2D8A4E` | `#E8A838` | Warm optimistic presentations |
| canopy | `#F0F7F2` | `#1B3A2A` | `#1B5E3A` | `#D4A020` | Environmental science, ecology |
| harvest | `#FBF7F0` | `#2A2010` | `#8B6914` | `#5A8A4A` | Agriculture, community farming |

#### Derived Colors

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `ink-dim` | ink @ 25% transparent | Dimmed text |
| `ink-muted` | ink @ 30% transparent | Secondary text |
| `ink-faint` | ink @ 75% transparent | Borders |
| `ink-ghost` | ink @ 92% transparent | Ghost background elements |
| `accent-dim` | accent @ 25% transparent | Dimmed green |
| `accent-muted` | accent @ 45% transparent | Subtle borders |
| `accent-faint` | accent @ 75% transparent | Card borders |
| `accent-ghost` | accent @ 90% transparent | Background fills |
| `secondary-dim` | secondary @ 30% transparent | Warm accent |
| `secondary-muted` | secondary @ 50% transparent | Gold borders |
| `secondary-faint` | secondary @ 75% transparent | Subtle warmth |
| `secondary-ghost` | secondary @ 92% transparent | Background warmth |
| `bg-warm` | bg.darken(2%) | Slightly warm background |
| `bg-dark` | `#1A2A1A` | Dark slide background (forest night) |
| `secondary-text` | Preset-specific dark secondary | Contrast-safe small accent text |
| `meta-color` | ink @ 25% transparent | Footer/chrome text |
| `night-text`, `night-muted`, `night-accent` | Fixed forest-night tokens | Dark-slide copy, chrome, and labels |
| `focus-text`, `focus-accent` | Fixed focus tokens | Focus body and emphasized copy |
| `glow-gold` | `#E8A838` @ 70% transparent | Warm glow effects |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `pal.accent` | Theme accent (green), alert text, focus-slide bg |
| `neutral-lightest` | `pal.bg` | Light backgrounds |
| `neutral-darkest` | `pal.ink` | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Setting Location |
| ---- | ---------- | ------------- |
| **Primary** | Avenir Next, Arial, Noto Sans SC | `main.typ` / `demo.typ` |
| **Monospace** | Menlo | Internal (kickers, metadata, counters) |

The theme entry sets size and color only; the deck entry owns the verified font stack.

### Typography Constants

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 42pt | Title slide hero text |
| `typo.h1` | 28pt | Slide titles |
| `typo.h2` | 22pt | Card headings |
| `typo.body` | 16pt | Body text |
| `typo.small` | 12pt | Captions, tags |
| `typo.tiny` | 9pt | Kickers, metadata |
| `typo.meta` | 8pt | Footer chrome |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm cream with golden gradient from top
- **Layout**: Centered title, organic divider with seed dot, subtitle + author/date
- **Decorative elements**: Sun ray burst (top-right), growing vine (both sides), solar cell pattern (bottom), organic asymmetric border frame, corner seed/glow markers
- **Bookending**: Shares vine framing + organic border + corner markers with ending slide

### Section Slide (`new-section-slide`)

- **Background**: Cream with section atmosphere (enhanced vine + geodesic dome + sun burst)
- **Layout**: Left-aligned section title with accent bar, section number in top-right with leaf-circuit decoration
- **Decorative elements**: Geodesic dome SVG behind content, growing vine at 30% opacity, eco coordinate label

### Content Slide (`slide`)

- **Background**: Warm cream with persistent living atmosphere
- **Atmosphere**: Growing vine left edge (10% opacity) + warm gradient from top + leaf-circuit bottom-right (6% opacity)
- **Header**: Bold title + rounded green accent bar
- **Footer**: Full-width three-column grid: configured footer text (or "SOLARPUNK") | seed dot | page number

### Dark Slide (`dark-slide`)

- **Background**: Warm dark `#1A2A1A` (forest at night, NOT cold black)
- **Atmosphere**: Bioluminescent vine (glowing green), scattered glow dots (bioluminescent spores)
- **Ghost element**: Large "GROW" at 4% opacity
- **Text colors**: Light green-white `#E8F0E8`

### Focus Slide (`focus-slide`)

- **Background**: Deep green (accent darkened 15%) with radial warm glow
- **Decorative**: Vine accents, scattered glow/seed dots
- **Text**: Large white-green bold centered text with warm-gold emphasized words for contrast

### Ending Slide (`ending-slide`)

- **Background**: Warm cream (matches title)
- **Decorative**: Shares title slide elements -- vine framing, sun burst, organic border frame, corner markers (bookending)
- **Ghost element**: Large "GROW" at 4% opacity
- **Content**: Leaf-circuit ornament + bold text + organic divider + "THE FUTURE IS GROWING" tagline

## VI. SVG Definitions

| SVG | Elements | Purpose | Usage |
|-----|----------|---------|-------|
| Growing Vine | 30+ paths, 11 leaves, 6 node circles | Art Nouveau tendril with branches and leaves at intervals | Left edge atmosphere on ALL slides, vine accents in components |
| Sun Ray Burst | 14 triangular rays + 4 circles | Radiating golden rays | Title/ending slides, solar-stat component background |
| Leaf-Circuit | Leaf outline + 7 circuit traces + 6 node circles + 4 IC pads | Nature meets technology motif | Bottom-right atmosphere, section slide number decoration, ending ornament |
| Geodesic Dome | 2 arch paths + base line + 8 structural lines + 7 node circles | Triangulated dome outline | Section slide background |
| Solar Cell Pattern | 16 hexagonal polygons | Honeycomb array | Title slide decoration, biome-box header texture |

## VII. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| canopy-card | `canopy-card(title, body)` | Primary content card | Asymmetric rounded corners + seed dot accent + green top bar |
| solar-stat | `solar-stat(label, value, description: none)` | Large metric display | One centered icon -> value -> label -> description stack + gold rule |
| seed-quote | `seed-quote(body, cite: none)` | Quotation block | Left vine border + growing vine emerging from quote mark |
| biome-box | `biome-box(title, body)` | Categorized content | Hexagonal pattern header band + rounded bottom |
| spore-tag | `spore-tag(body)` | Inline pill tag | Organic pill shape with green gradient fill |
| vine-divider | `vine-divider(total-width: 100%)` | Section divider | Gradient line with leaf dots (NOT straight rule) |
| solarium-highlight | `solarium-highlight(body)` | Featured content | Warm golden glow gradient + sun glow dot accent |
| ecosystem-grid | `ecosystem-grid(..items)` | Multi-item connected layout | Grid of organic cards connected by vine line below |
| photosynthesis-card | `photosynthesis-card(title, body)` | Energy/transformation content | Opaque green-to-gold gradient + energy flow bar |
| community-label | `community-label(body)` | Warm inline label | Seed-packet style box with gold top border |
| night-card | `night-card(title, body)` | Dark-slide supporting content | Opaque forest-night card + bioluminescent label + equalized body |

## VIII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Living atmosphere everywhere | Every slide carries the vine + warmth + leaf motifs. Never "leave" the solarpunk world |
| 2 | Organic over geometric | Asymmetric rounded corners, varying thicknesses, Art Nouveau curves -- no sharp corporate rectangles |
| 3 | Warm, not cold | Gold/cream/green palette. Dark mode is forest-at-night, not corporate-black |
| 4 | Nature + Technology fusion | Leaf-circuit motif embodies the core philosophy: biology and engineering are one |
| 5 | Hopeful and growing | Visual metaphors of growth, seeds, photosynthesis -- the future is literally growing on slides |

## IX. Design References

| Reference | Description |
|-----------|-------------|
| Art Nouveau organic curves | Mucha, Guimard -- flowing natural forms meet functional design |
| Solarpunk genre fiction | Becky Chambers, Kim Stanley Robinson -- optimistic green futures |
| Biophilic architecture | Bosco Verticale (Milan), Gardens by the Bay (Singapore) |
| Geodesic domes | Buckminster Fuller -- efficient organic structure |
| Circuit board aesthetics | PCB trace patterns reinterpreted as leaf veins |

---

## Output Files

```
solarpunk/
+-- template.typ          # Theme definition (750+ lines)
+-- demo.typ              # Compilable demonstration (15+ slides)
+-- theme_design_spec.md  # This specification document
+-- theme.md              # API summary
```
