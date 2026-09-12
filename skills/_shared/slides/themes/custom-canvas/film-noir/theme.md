# Film Noir

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `film-noir-theme`
**Style**: Classic 1940s film noir cinema with dramatic venetian blind shadows
**Primary color**: `#8B0000` (crimson)
**Best For**: Mystery presentations, crime data analysis, dramatic storytelling, narrative decks
**Style Objective**: General Versatile
**Complexity Level**: Canvas

## Description

A cinematic film noir theme where venetian blind shadows cut diagonally across every slide like dramatic chiaroscuro. Deep blacks, stark whites, and a single crimson accent create a world of a 1940s detective film. Film-grain texture and smoke wisps maintain atmospheric immersion throughout. Three presets offer classic B&W, warm sepia, and desaturated technicolor moods.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: film-noir-theme.with(
  aspect-ratio: "16-9",
  footer: [Case File],
  preset: "classic",  // "classic", "sepia", or "technicolor"
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Studio Name],
  ),
  config-common(breakable: false),
)

#title-slide()

= Section Title

== Slide Title

Content goes here.

#focus-slide[Key statement in the spotlight.]

#ending-slide[Case Closed]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content | `none` | Footer content (left side) |
| `preset` | string | `"classic"` | Color preset: `"classic"`, `"sepia"`, or `"technicolor"` |

## Fonts

| Role | Font | Set In |
|------|------|--------|
| Body text | Georgia, Heiti SC | template.typ |
| Monospace (labels) | Menlo, Courier New | template.typ |

## Available Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual | Film strip frame, spotlight, cinematic credits |
| `new-section-slide` | `= Heading` | Dark ACT card with spotlight and ghost number |
| `slide` | `== Heading` | Content with venetian blind shadows + film grain |
| `dark-slide` | Manual | Near-black with rain, spotlight, ghost text |
| `focus-slide` | Manual | Rain + spotlight + italic white statement |
| `ending-slide` | Manual | Film strip frame, "FIN" ghost, smoke wisps |

### dark-slide Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title |
| `ghost` | content/none | `"NOIR"` | Large ghost text (96% transparent) |
| `header-left` | content | `none` | Custom left header |
| `header-right` | content | `none` | Custom right header |

## Reusable Components

### dossier-card(title, body)
Manila folder-styled card with tab label and paper-clip SVG. Slight rotation (-1deg).

### witness-stat(label, value, description: none)
Large number with dramatic drop-shadow offset. Crimson label above, description below.

### voiceover-quote(body, cite: none)
Italic quote with crimson left border and smoke wisp trailing from quote mark.

### evidence-box(title, body)
Two-part card with black "CLASSIFIED" header bar (red text) and content below.

### suspect-tag(body)
Inline monospace tag (typewriter-style evidence label).

### reel-divider(total-width: 100%)
Film-strip inspired divider line with sprocket-hole dots.

### spotlight-highlight(body)
Content block with spotlight cone gradient from top and darkened surround.

### blind-card(title, body)
Card with strong (15-22%) venetian blind shadows cutting across it.

### flashback-block(body)
Sepia-toned block with extra film-grain texture (aged film appearance).

### title-card(body)
Full-width cinematic intertitle: black background, white centered text.

## Color Presets

| Preset | Accent | Mood |
|--------|--------|------|
| `classic` | `#8B0000` (crimson) | Classic B&W noir with blood-red |
| `sepia` | `#6B1C23` (burgundy) | Warm aged film |
| `technicolor` | `#1B5E6B` (deep teal) | Slightly desaturated color |

## Visual Signature

The venetian blind shadows (14 diagonal polygon bands at varying opacities) are rendered on EVERY content slide via `_noir-atmosphere()`. This is the theme's defining visual -- without it, slides would be generic corporate. With it, every slide feels like a frame from a 1940s movie.
