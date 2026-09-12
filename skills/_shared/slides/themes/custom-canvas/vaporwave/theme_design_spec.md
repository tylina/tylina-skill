# Vaporwave Theme Design Specification

## Overview

| Property | Value |
|----------|-------|
| Theme Name | vaporwave |
| Display Name | Vaporwave |
| Complexity | Canvas |
| Style | Retro-futuristic vaporwave aesthetic - gradient pinks and purples, cyan highlights, sunset orange. Grid-line patterns. 80s/90s nostalgia meets digital future. Pastel neons on dark backgrounds. |
| Best For | Music/entertainment, retro gaming, social media, creative tech, pop culture, internet culture presentations |

## Color Palette

### Presets

| Preset | Ink (BG dark) | Paper (Text/Light) | Description |
|--------|---------------|-------------------|-------------|
| `sunset` | `#1A0A2E` (deep purple-black) | `#FFF0F5` (lavender blush) | Default. Deep purple darkness with pink blush highlights. |
| `ocean` | `#0A1628` (dark navy) | `#E0F7FA` (cyan tint) | Deep ocean blue with cyan/teal highlights. |
| `neon` | `#0D0D0D` (near black) | `#FFB6C1` (electric pink) | Maximum contrast - black with hot pink text. |

### Accent Colors

| Name | Hex | Usage |
|------|-----|-------|
| Hot Pink | `#FF6B9D` | Primary accent, borders, highlights |
| Purple | `#C084FC` | Secondary accent, gradients |
| Cyan | `#06B6D4` | Tertiary accent, attribution text, tech highlights |
| Sunset Orange | `#FF8C42` | Warm accent, ending slides, CTA elements |

For small text on light slides, use contrast-safe dark variants: pink `#981344`, purple `#76259C`, cyan `#005B6D`, and orange `#7A3B00`. The brighter base accents remain the display palette for dark surfaces, borders, and gradients.

### Derived Palette (from build-palette)

| Token | Derivation | Usage |
|-------|-----------|-------|
| `ink` | Preset ink color | Deep background |
| `paper` | Preset paper color | Light text/surfaces |
| `pink` | `#FF6B9D` | Primary accent |
| `purple` | `#C084FC` | Secondary accent |
| `cyan` | `#06B6D4` | Tertiary accent |
| `orange` | `#FF8C42` | Warm accent |
| `pink-light` | pink at 40% transparency | Subtle pink overlays |
| `pink-ghost` | pink at 90% transparency | Ghost decorations |
| `purple-light` | purple at 40% transparency | Subtle purple overlays |
| `purple-ghost` | purple at 90% transparency | Ghost text |
| `ink-muted` | ink at 30% transparency | Readable metadata/body text on light |
| `paper-muted` | paper at 35% transparency | Readable secondary text on dark across presets |
| `grid-color` | pink at 85% transparency | Grid line decoration |

## Typography

Primary demo family: `Avenir Next`; multilingual fallback: `Arial Unicode MS`.

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 44pt | Black (900) | Cover title, hero text |
| H1 | 32pt | Bold | Section titles |
| H2 | 24pt | Bold | Slide titles |
| Body | 18pt | Regular | Body text |
| Small | 14pt | Regular | Captions, metadata |
| Tiny | 10pt | Bold | Tags, labels, footer |

## Slide Types

### slide() - Light Content Slide
- Light paper background
- Subtle gradient bar at top (pink to purple, 3pt height)
- Placed grid-line decoration at bottom at low opacity
- Standard header with title + footer with page numbers

### dark-slide() - Dark Content Slide
- Deep purple/black background (ink color)
- Placed gradient wash (pink to purple at low opacity) as background decoration
- Ghost grid lines placed at bottom
- Text in pink/cyan colors
- Header with custom left/right labels

### title-slide() - Cover Slide
- Full gradient background (pink to purple to dark)
- Placed decorative grid lines vanishing to center
- Title with "glitch shadow" effect (text placed twice with slight offset in different colors at low opacity)
- Subtitle in cyan
- No header/footer

### new-section-slide() - Section Divider
- Dark gradient background
- Large ghost section text (very transparent)
- Pink accent line below section title
- Minimal chrome

### focus-slide() - Statement Slide
- Full gradient wash background (pink to purple)
- Centered text with glow effect (placed shadow text in pink behind main text)
- No header/footer

### ending-slide() - Closing Slide
- Sunset gradient (orange to pink to purple)
- Centered farewell message
- Aesthetic spacing
- Theme branding

### hero-slide() - Full-Bleed Image
- Full-bleed background image
- Gradient overlay (dark to transparent) from bottom
- Floating text positioned with place()

### grid-slide() - Grid Pattern Slide
- Dark background
- Prominent placed grid-line pattern (horizontal lines narrowing toward bottom for perspective)
- Content floating above the grid
- Retro-futuristic aesthetic

## Components

### retro-card(title, body, accent)
- Card with gradient border using stroke
- Semi-transparent dark fill
- Title in accent color
- Body text in paper color
- Rounded corners

### glitch-stat(value, label)
- Big number display
- Color-offset shadow effect (pink offset left, cyan offset right at low opacity)
- Label below in muted color

### wave-box(title, body)
- Callout box with pink/purple gradient left border
- Semi-transparent background
- Title in pink, body in paper

### sunset-divider()
- Gradient line from pink through purple to orange
- Full width, 2pt height
- Decorative separator

### pixel-tag(body, color)
- Tag with gradient background (pink to purple)
- Small pill shape
- Bold uppercase text in dark color

### vapor-quote(body, attribution)
- Quote with aesthetic wide letter-spacing
- Cyan attribution text
- Left border in gradient

### grid-pattern(rows, opacity)
- Decorative background grid made with placed lines
- Horizontal lines with decreasing spacing to simulate perspective
- Used as background decoration in multiple slide types

### vapor-meter(label, ratio, caption)
- Borderless dark-slide metric with label, gradient progress bar, and readable caption
- Uses precise stack spacing to keep repeated data rows compact and aligned

### glitch-text(body, size)
- Text placed multiple times with slight offset
- Pink and cyan copies at low opacity
- Creates chromatic aberration / glitch effect

## Layout Parameters

| Parameter | Value |
|-----------|-------|
| Aspect Ratio | 16:9 |
| Default Margin | top: 4em, bottom: 1.5em, x: 2em |
| Dark Slide Margin | top: 3em, bottom: 1.5em, x: 2.5em |
| Grid Line Count | 8-12 lines per pattern |
| Gradient Bar Height | 3pt |
| Card Border Width | 1.5pt |
| Ghost Text Transparency | 90-95% |

## Design Philosophy

A E S T H E T I C S. The visual language of Miami Vice meets Windows 95. Gradient washes from pink to purple. Grid lines that recede to a vanishing point. Glitch-inspired text effects via offset shadows. Palm trees as decorative silhouettes. Sunsets as gradients. Every slide is a portal to the retro-digital dreamscape.
