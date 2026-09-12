# Risograph - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Risograph Touying theme, inspired by the distinctive aesthetic of risograph printing - limited spot colors, misregistration offsets, halftone patterns, and paper texture.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | risograph |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Creative industry presentations, art talks, design lectures, indie publishing, gallery events, DIY culture |
| **Style Objective** | General Versatile (Creative/Artistic) |
| **Complexity Level** | Canvas |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 5em, bottom: 1.5em, x: 2em |

## III. Visual Theme

### Design Philosophy

Channels the visual language of risograph printing: limited spot colors with slight misregistration (offset), halftone dot patterns, ink that bleeds slightly, paper texture showing through, overprinting where colors overlap to create new colors. The aesthetic evokes indie music posters, art zines, and gallery invitations.

### Color Scheme - Preset System

The theme uses a preset-based palette builder with three options:

#### Classic Preset (Default)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Paper** | Cream | `#F4ECD8` | `palette.paper` | Background - recycled paper feel |
| **Spot 1** | Federal Blue | `#0078BF` | `palette.spot1` | Primary spot color |
| **Spot 2** | Fluorescent Pink | `#F5638B` | `palette.spot2` | Secondary spot color |
| **Spot 3** | Bright Yellow | `#FFE800` | `palette.spot3` | Tertiary accent |
| **Ink** | Rich Black | `#1A1A1A` | `palette.ink` | Text, borders |

#### Tropical Preset

| Role | Color Name | HEX | Purpose |
| ---- | ---------- | --- | ------- |
| **Paper** | Off White | `#FEFEFA` | Clean white paper |
| **Spot 1** | Green | `#00A676` | Primary spot |
| **Spot 2** | Orange | `#FF6B35` | Secondary spot |
| **Spot 3** | Gold | `#FFD23F` | Tertiary accent |

#### Mono Preset

| Role | Color Name | HEX | Purpose |
| ---- | ---------- | --- | ------- |
| **Paper** | Newsprint | `#EDE8D5` | Aged paper feel |
| **Spot 1** | Black | `#1A1A1A` | Primary (monochrome) |
| **Spot 2** | Dark Gray | `#6B6B6B` | Secondary |
| **Spot 3** | Light Gray | `#B0B0B0` | Tertiary |

### Key Design Techniques

1. **Misregistration Effect**: Elements placed twice with 2-3pt offset in different spot colors, creating the characteristic riso overprint look
2. **Halftone Blocks**: Low-opacity color bands suggesting halftone dot patterns
3. **Registration Marks**: Crosshair decorative elements (printer marks)
4. **No Rounded Corners**: All elements use sharp corners - risograph is rough, not polished
5. **Thick Borders**: 2-3pt black strokes on all card/frame elements
6. **Limited Spot Colors**: Max 2 per slide composition, mimicking real riso constraints

## IV. Typography

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 48pt | Black | Title slide headings |
| H1 | 32pt | Black | Section titles |
| H2 | 24pt | Bold | Slide titles |
| Body | 16pt | Regular | Content text |
| Small | 12pt | Bold | Labels, tags |
| Tiny | 9pt | Bold | Footer, metadata |

## V. Slide Types

| Slide | Background | Key Feature |
|-------|-----------|-------------|
| `slide()` | Cream paper | Title with pink misregistration shadow, blue accent mark |
| `dark-slide()` | Rich black | Spot color overlay blocks at low opacity, cream text |
| `title-slide()` | Cream paper | Bold misregistered title (blue+pink), yellow circle, black frame |
| `new-section-slide()` | Cream paper | Large misregistered section number, spot-tag kicker |
| `focus-slide()` | Spot color fill | Black bold text, border frame |
| `ending-slide()` | Cream paper | Misregistered farewell text, decorative shapes |

## VI. Components

| Component | Purpose | Visual |
|-----------|---------|--------|
| `riso-card()` | Content card | Thick black border, spot color header band, no rounding |
| `overprint-stat()` | Big number display | Number in one color with ghost offset in another |
| `spot-tag()` | Inline label | Filled rectangle in spot color, black text |
| `zine-quote()` | Pull quote | Rotated -1.5deg, thick left border in spot color |
| `halftone-divider()` | Section separator | Low-opacity color band |
| `registration-mark()` | Decorative element | Crosshair marks printers use |
| `misregister()` | Text effect | Duplicated text with color offset |
| `misregister-display()` | Large text effect | Larger offset for display text |
