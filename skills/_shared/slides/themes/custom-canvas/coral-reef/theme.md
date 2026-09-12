# Coral Reef Theme -- API Summary

## Overview

**Name**: coral-reef
**Display Name**: Coral Reef
**Category**: custom-canvas
**Style**: Underwater marine biology, organic shapes, deep blue-to-teal gradients, bioluminescence
**Best For**: Marine science, oceanography, environmental talks, marine conservation, aquarium presentations, biology

## Entry Point

```typst
#import "template.typ": *

#show: coral-reef-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  preset: "deep",          // "deep", "shallow", or "abyss"
  footer: none,            // Custom footer content or function
  config-info(
    title: [...],
    subtitle: [...],
    author: [...],
    date: datetime.today(),
    institution: [...],
  ),
)
```

## Presets

| Preset    | Background  | Description                                   |
|-----------|-------------|-----------------------------------------------|
| `deep`    | #0A1628     | Default dark ocean, high contrast             |
| `shallow` | #0D2B3E     | Lighter turquoise-tinged, slightly warmer      |
| `abyss`   | #050D18     | Near-black, maximum depth, extreme contrast    |

## Color Palette

| Token        | Hex (deep preset) | Role                          |
|--------------|-------------------|-------------------------------|
| bg           | #0A1628           | Page background               |
| ink          | #E0F4FF           | Primary text color            |
| coral        | #FF6B6B           | Secondary accent (coral pink) |
| cyan         | #00E5FF           | Bioluminescent accent         |
| ocean-blue   | #006994           | Primary structural color      |
| bg-deep      | darker            | Focus slide background        |
| ink-dim      | 25% transparent   | De-emphasized text            |
| ink-muted    | 50% transparent   | Subtle text                   |
| ink-faint    | 75% transparent   | Ghost text                    |
| coral-dim    | 40% transparent   | Soft coral accents            |
| coral-faint  | 75% transparent   | Very subtle coral             |
| cyan-dim     | 35% transparent   | Soft cyan accents             |
| cyan-muted   | 55% transparent   | Medium cyan                   |
| cyan-faint   | 80% transparent   | Very subtle cyan              |
| ocean-dim    | 40% transparent   | Soft ocean accents            |
| ocean-faint  | 75% transparent   | Very subtle ocean             |
| meta-color   | 65% transparent   | Footer/meta text              |

## Slide Functions

### `title-slide(..args)`
Full-bleed title slide with coral branches, jellyfish, bubble decorations, and frame border.

### `new-section-slide(self: none, body)`
Section transition with wave pattern, bubble cluster, and bioluminescent section number.

### `slide(title: auto, ..args)`
Default content slide with subtle wave pattern background and bioluminescent dot accents.

### `focus-slide(body)`
Width-constrained focus statement on deep background with scattered bioluminescent dots and corner coral accents.

### `ending-slide(body)`
Farewell slide with coral branches, jellyfish, ghost text, and "PROTECT OUR OCEANS" footer.

## Components

### `coral-card(title, body)`

Card with organic rounded corners (12pt radius) and a restrained coral border. Use for categorized content blocks, including height-equalized `cols(lazy-layout: true)` rows.

### `biolumi-stat(label, value, description: none)`
Large statistic display with glowing cyan dot accent. Label is uppercased in monospace.

### `current-panel(title: none, body)`
Panel with wave-like top border and ocean-blue left accent. Good for longer text blocks.

### `bubble-tag(body)`
Small rounded pill-shaped tag (14pt radius) with cyan styling. Use for keywords and labels.

### `reef-divider(total-width: 100%)`
Horizontal decorative divider with alternating coral and cyan bioluminescent dots.

### `depth-quote(body, cite: none)`
Block quote with cyan left border and optional citation in monospace.

## SVG Decorative Helpers

### `coral-branch(color, size-w, size-h)`
Organic branching coral silhouette.

### `bubble-cluster(color, size-w, size-h)`
Rising bubble cluster (9 bubbles of decreasing size).

### `jellyfish(color, size-w, size-h)`
Jellyfish bell with trailing tentacles.

### `wave-pattern(color, width, height)`
Flowing horizontal wave/current lines (3 layers).

### `biolumi-dot(color, size)`
Small layered glowing dot (3 concentric circles with transparency).

## Typography

| Level   | Size |
|---------|------|
| display | 40pt |
| h1      | 28pt |
| h2      | 22pt |
| body    | 16pt |
| small   | 12pt |
| tiny    | 9pt  |
| meta    | 8pt  |

## Fonts

- Body: Avenir Next, Arial Unicode MS fallback
- Mono: IBM Plex Mono
