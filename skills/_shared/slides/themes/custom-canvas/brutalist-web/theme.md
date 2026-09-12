# Brutalist-Web Theme Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "IBM Plex Sans", size: 20pt)

#show: brutalist-web-theme.with(
  aspect-ratio: "16-9",
  preset: "classic",
  config-info(
    title: [My Presentation],
    subtitle: [A Brutalist Statement],
    author: [Author Name],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

= Section Title

== Slide Title
Content here.

#focus-slide[Bold Statement]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Options | Description |
|-----------|---------|---------|-------------|
| aspect-ratio | "16-9" | "16-9", "4-3" | Slide format |
| align | horizon | top, horizon, bottom | Vertical alignment |
| footer | none | content | Footer text |
| preset | "classic" | "classic", "dark", "paper" | Color preset |

## Presets

| Preset | Background | Ink | Accent | Secondary |
|--------|-----------|-----|--------|-----------|
| classic | #FFFFFF (white) | #000000 (black) | #FFDE00 (yellow) | #0000FF (blue) |
| dark | #000000 (black) | #FFFFFF (white) | #FFDE00 (yellow) | #FF3399 (pink) |
| paper | #FFF8E7 (cream) | #000000 (black) | #FF6600 (orange) | #009900 (green) |

## Slide Types

### Standard Slides
| Function | Description | Key Feature |
|----------|-------------|-------------|
| `slide(title:)` | Default content slide | White bg, 3pt black frame border |
| `dark-slide(title:)` | Dark background | Black bg, white frame border |

### Special Slides
| Function | Description | Key Feature |
|----------|-------------|-------------|
| `title-slide()` | Cover page (reads config-info) | Enormous title, yellow/blue accent blocks |
| `new-section-slide` | Auto on `= Heading` | Yellow bg, giant section number |
| `focus-slide[...]` | Bold statement | Blue bg, white text, no border |
| `ending-slide[...]` | Farewell slide | White bg, corner accent blocks |
| `hero-slide(fill:)[...]` | Full color canvas | Custom fill, frame border |

## Components

### Cards & Containers

```typst
// Basic card with optional yellow header
#brutalist-card(title: [HEADER])[Content here]

// Use lazy layout only with one card per column.
#cols(lazy-layout: true)[
  #brutalist-card(title: [LEFT])[Content here]
][
  #brutalist-card(title: [RIGHT])[Content here]
]

// Card without header
#brutalist-card()[Just content, bordered]

// Browser window frame
#browser-frame(url: "https://example.com")[Website content]

// Stacked card with offset shadow
#stack-card[Content with depth effect]

// Universal frame wrapper
#frame-block(fill: white)[Framed content]
// Optional `inset:` calibrates a dense one-off composition.
```

### Data & Stats

```typst
// Big number with yellow highlight
#raw-stat([42], [the answer])

// Big number without highlight
#raw-stat([99%], [uptime], highlight: false)
```

### Inline Elements

```typst
// Blue hyperlink-style text
#link-text[Click here]

// Yellow highlighter box
#highlight-box[Important]

// Monospace label
#mono-label[Category]

// Thick black divider
#brutalist-divider()
```

## Layout Patterns

### Two-Column with Cards
```typst
== Title
#grid(columns: (1fr, 1fr), column-gutter: 20pt,
  brutalist-card(title: [LEFT])[Content],
  brutalist-card(title: [RIGHT])[Content],
)
```

### Stats Row
```typst
#grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
  raw-stat([100], [metric one]),
  raw-stat([0px], [border radius]),
  raw-stat([3pt], [border weight]),
)
```

### Dark Slide with Cards
```typst
#dark-slide(title: [Dark Title])[
  #grid(columns: (1fr, 1fr), column-gutter: 16pt,
    block(stroke: 3pt + rgb("#FFFFFF"), inset: 12pt, radius: 0pt)[
      #text(fill: rgb("#FFFFFF"))[White-bordered card on dark]
    ],
    block(stroke: 3pt + rgb("#FFFFFF"), inset: 12pt, radius: 0pt)[
      #text(fill: rgb("#FFFFFF"))[Another card]
    ],
  )
]
```

## Design Rules

1. **ZERO** rounded corners -- `radius: 0pt` everywhere
2. **3pt** black borders on all cards and frames
3. Pure **#000000** black, pure **#FFFFFF** white
4. **Yellow** (#FFDE00) for highlights, headers, section backgrounds
5. **Blue** (#0000FF) for links, subtitles, focus slides
6. Monospace font for all metadata and labels
7. No gradients, no blur shadows, no decorative curves
