# Film Noir - Theme Design Specification

> **Purpose**: Visual and structural design spec for the film-noir Touying theme. Classic 1940s film noir cinema aesthetic with dramatic venetian blind shadows cutting across every slide.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | film-noir |
| **Page Format** | 16:9 (720x405pt) |
| **Best For** | Mystery presentations, crime data analysis, dramatic storytelling, narrative-driven decks |
| **Style Objective** | General Versatile |
| **Complexity Level** | Canvas |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | Presentation 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 4em, bottom: 1.5em, x: 2em |

## III. Visual Theme

### Design Philosophy

A 1940s detective film. Shadows from venetian blinds cut across every surface. Rain on windows. Cigarette smoke curls upward. Everything is high contrast -- deep blacks and stark whites. One color exists in this world: crimson red (like blood on a white shirt). Every slide feels like a FRAME from a film noir movie.

### Color Scheme -- Palette Factory (Canvas)

**Presets**:

| Preset | Background | Ink | Accent | Secondary | Mood |
|--------|-----------|-----|--------|-----------|------|
| `classic` (default) | `#F8F7F5` | `#1A1A1A` | `#8B0000` (crimson) | `#4A4A4A` | Classic B&W with blood-red |
| `sepia` | `#F5F0E8` | `#2C1810` | `#6B1C23` (burgundy) | `#5C4A3A` | Warm aged film |
| `technicolor` | `#F4F6F7` | `#1C1C2A` | `#1B5E6B` (deep teal) | `#3D4A5C` | Slightly desaturated color |

**Derived Colors** (via `build-palette()`):
- `ink-dim`, `ink-muted`, `ink-faint`, `ink-ghost` -- progressively transparent ink
- `accent-dim`, `accent-muted`, `accent-faint`, `accent-ghost` -- progressively transparent accent
- `shadow` (94% transparent ink) -- venetian blind background
- `shadow-strong` (85% transparent ink) -- venetian blind on cards
- `film-frame` (70% transparent ink) -- film frame lines
- `bg-dark` (`#0D0D0D`) -- dark slide near-black

### Typography

| Element | Size | Weight | Notes |
|---------|------|--------|-------|
| Display (title) | 42pt | Bold | Stark white on black |
| H1 (slide title) | 28pt | Bold | Dark ink with crimson underline |
| H2 | 22pt | Bold | Section headings |
| Body | 16pt | Regular | Content text |
| Small | 12pt | Regular | Descriptions |
| Tiny | 9pt | Medium | Labels, kickers |
| Meta | 8pt | Regular | Footer, timestamps |

**Fonts**: `("Georgia", "Heiti SC")` for body, `("Menlo", "Courier New")` for labels/meta.

## IV. SVG Decorations

| SVG | Elements | Purpose | Used On |
|-----|----------|---------|---------|
| **Venetian Blinds** | 14 diagonal polygon bands at 3-8% opacity | Chiaroscuro shadow pattern | EVERY content slide (THE signature) |
| **Venetian Blinds Strong** | 14 bands at 10-22% opacity | Dramatic shadow on cards | blind-card component |
| **Venetian Blinds Light** | 14 white bands at 2-5% opacity | Shadows on dark slides | dark-slide, title, section, ending |
| **Film Strip Border** | 22+ sprocket hole rects + frame lines | Cinema frame | title-slide, ending-slide |
| **Smoke Wisp** | 3 bezier curve trails | Cigarette smoke | voiceover-quote, corners |
| **Rain Streaks** | 24 diagonal lines at varying angles | Rain on glass | dark-slide, focus-slide |
| **Spotlight Cone** | Triangular gradient polygon | Harsh single light source | focus-slide, section, title |
| **Paper Clip** | Single bezier path | Dossier accent | dossier-card |
| **Film Grain** | 36 tiny circles at varying opacities | Noise/grain texture | every content slide |

## V. Background Atmosphere

**EVERY content slide** receives (via `_noir-atmosphere()`):
1. Venetian blind SVG at 3-8% opacity covering the full page
2. Film grain texture (subtle stipple dots)
3. Thin film-frame lines at very top and bottom (2pt)
4. Slight vignette darkening in corners
5. Small smoke wisp in bottom-right corner (barely visible)

**Background color**: `#F8F7F5` (warm grey, like paper under dim light -- NOT pure white)

## VI. Slide Types

| Slide Type | Background | Key Visual Elements |
|------------|-----------|-------------------|
| **title-slide** | Near-black `#0D0D0D` | Film strip border + spotlight + venetian blinds (light) + smoke wisps |
| **new-section-slide** | Near-black | Spotlight + venetian blinds (light) + large ghost number + "ACT" label |
| **slide** (content) | Warm grey `#F8F7F5` | Venetian blinds + film grain + frame lines + smoke wisp |
| **dark-slide** | Near-black `#0D0D0D` | Rain streaks + spotlight + venetian blinds (light) + ghost text |
| **focus-slide** | Near-black | Rain + spotlight + venetian blinds (light) + italic white text |
| **ending-slide** | Near-black | Film strip border + spotlight + venetian blinds + "FIN" ghost + smoke wisps |

**Bookending**: Title and ending share film-strip border + spotlight + smoke wisps (not on content slides).

## VII. Components

| Component | Structure | Visual |
|-----------|-----------|--------|
| `dossier-card` | Rotated (-1deg) block with manila fill | Tab label, paper-clip SVG, brown tones |
| `witness-stat` | Large number with shadow offset | Drop-shadow text effect, crimson label |
| `voiceover-quote` | Left-border block with italic text | Smoke wisp from quote mark |
| `evidence-box` | Two-part: header bar + content | "CLASSIFIED" red header on black bar |
| `suspect-tag` | Inline box with mono font | Typewriter-style evidence label |
| `reel-divider` | Full-width line with dots | Film sprocket-hole dots along divider |
| `spotlight-highlight` | Full-width block with gradient overlay | Spotlight cone + darkened surround |
| `blind-card` | Clipped block with strong venetian overlay | 15-22% opacity blinds across card |
| `flashback-block` | Sepia-toned block with extra grain | Aged film appearance |
| `title-card` | Full-width black block with white text | Silent film intertitle style |

## VIII. Header/Footer Design

**Header**: Bold title + 2pt crimson accent line (50pt width). Uses `stack(spacing: .8em)`.

**Footer**: Three-column grid:
- Left: "NOIR" in tracked mono uppercase
- Center: Vertical bar separator in accent color
- Right: Slide number in mono
