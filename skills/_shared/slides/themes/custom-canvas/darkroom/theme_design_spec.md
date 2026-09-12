# Darkroom Theme — Design Specification

## 1. Visual Identity

**Metaphor**: Analog photography darkroom — the red safelight glow, chemical developer trays, contact sheets pinned on lines, the magic of an image slowly appearing in the developer bath.

**Character**: Intimate, craft-focused, warm red-black. The only light in the void is the deep red safelight. Content emerges from darkness like a photograph developing.

**Aesthetic Principles**:
- RED IS THE ONLY LIGHT: red accent is the safelight — the only warm color in the void
- Emergence: content appears from darkness (generous dark margins, content as focal point)
- Film/photo craft: grid structures suggest contact sheets and film strips
- Intimacy: quiet, focused, artisanal — not dramatic like neon-noir
- High contrast BUT warm: whites are cream/warm, not clinical cold white
- Typography: monospace for technical data, serif for artistic expression

## 2. Color Palette

### Primary Palette (Safelight preset)

| Role | Hex | Usage |
|------|-----|-------|
| Background | `#1A0A0A` | Deep darkroom red-black |
| Ink | `#F0E8E0` | Photo paper white (warm cream) |
| Accent | `#CC2200` | Safelight red (the ONLY warm color) |
| Accent text | `#F04A2A` | Contrast-safe red for small labels |
| Secondary | `#A67B5B` | Sepia/chemical stain |
| Secondary text | `#A67B5B` | Contrast-safe sepia for small labels |
| Surface | `#201010` | Darker red-black (dark-slide bg) |

### Presets

| Preset | Character | Background | Decorative accent | Text-safe accent |
|--------|-----------|------------|-------------------|------------------|
| safelight | Default red-lit room | `#1A0A0A` | `#CC2200` | `#F04A2A` |
| developer | Deeper, more subdued | `#0F0808` | `#991100` | `#D9492C` |
| print | Inverted (light mode) | `#F5F0E8` | `#CC2200` | `#A71900` |

### Derived Colors

All derived via `transparentize()` from ink/accent/secondary:
- `ink-dim` (25%), `ink-muted` (40%), `ink-faint` (72%), `ink-ghost` (92%)
- `accent-dim` (30%), `accent-muted` (55%), `accent-faint` (78%), `accent-ghost` (92%)
- `secondary-dim` (35%), `secondary-muted` (55%), `secondary-faint` (78%)
- `meta-color` (ink transparentized 40%), `rule-color` (ink transparentized 75%)

Decorative `accent` / `secondary` tokens are distinct from `accent-text` /
`secondary-text`. Across all three presets, the smallest verified semantic-text
contrast on its shipped background or surface is 4.50:1.

## 3. Typography

| Level | Size | Weight | Font |
|-------|------|--------|------|
| Display | 42pt | Bold | Serif (body font) |
| H1 | 28pt | Bold | Sans |
| H2 | 22pt | Medium | Sans |
| Body | 16pt | Regular | Sans |
| Small | 12pt | Regular | Sans |
| Tiny | 9pt | Medium | Mono |
| Meta | 7.5pt | Regular | Mono |

**Font Strategy**:
- Body: `("Avenir Next", "Arial Unicode MS")`
- Technical/Labels: `"IBM Plex Mono"` (film metadata, processing times)
- Quotes/Artistic: `("Iowan Old Style", "Arial Unicode MS")`
- The theme entry sets size and color only; the demo/project entry owns the base font

## 4. SVG Decorations

| Element | Description | Usage |
|---------|-------------|-------|
| Film strip | Perforated rectangle with sprocket holes top/bottom | Title/ending/section borders |
| Contact sheet grid | Thin grid lines suggesting photo thumbnails | Content slide backgrounds |
| Developer drip | Irregular descending droplet shape | Dark-slide atmosphere |
| Aperture | Hexagonal iris (camera aperture blades) | Section numbers, ending |
| Clothespin | Simple clip shape | Ending slide (photos drying) |

## 5. Slide Types

| Type | Background | Decoration | Purpose |
|------|-----------|------------|---------|
| `title-slide` | Deep bg | Film strips + aperture + drips + safelight | Cover |
| `new-section-slide` | Deep bg | Aperture with number + film strip bottom | Section divider |
| `slide` | Standard bg | Faint contact sheet grid | Content |
| `dark-slide` | Surface (darker) | Developer drips + safelight glows | Emphasis |
| `focus-slide` | Deep bg | Corner frame marks + safelight dots | Statement |
| `ending-slide` | Deep bg | Clothesline + ghost FIN text + aperture | Farewell |

## 6. Components

| Component | Purpose | Visual Treatment |
|-----------|---------|-----------------|
| `exposure-card` | Info card | White on dark (photo emerging from developer) |
| `f-stop-stat` | Large number | Bold stat with accent label + underline |
| `film-divider` | Horizontal rule | Line with sprocket hole circles |
| `developer-tag` | Small label | Red accent box (darkroom processing note) |
| `proof-quote` | Quote | Red left border, serif italic, mono citation |
| `negative-panel` | Inverted panel | Light bg within dark theme, red top border |
| `contact-card` | Small info card | Frame-numbered thumbnail card |
| `chemical-table` | Data table | Processing log style, mono headers |
| `tray-card` | Feature card | Chemical tray style, drip icon, colored bottom border |
| `darkroom-note` | Annotation | Sepia italic note, left sepia border |
| `exposure-strip` | Visual gradient | Progressive tonal strip with labels |
| `timer-badge` | Time display | Small red-bordered badge |
| `developer-formula` | Processing formula | Name + description + timer in a semantic formula panel |

## 7. Layout Rules

- **Margins**: top 4em, bottom 1.5em, x 2.2em (standard), x 2.5em (dark-slide)
- **Content emerges from darkness**: generous margins create the feeling of light appearing in void
- **Grid as contact sheet**: the faint background grid reinforces photographic structure
- **Red sparingly**: accent only on labels, underlines, borders — never as large fills
- **Warm whites**: ink color is cream `#F0E8E0`, not pure white

## 8. Aspect Ratio

Default: 16:9 (presentation-16-9)
