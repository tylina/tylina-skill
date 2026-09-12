# Aurora Prism Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `aurora-prism-theme`
**Style**: Academic conference, clean, professional, information-dense
**Primary color**: `#3F51B5` (Indigo)
**Best For**: ICML/NeurIPS oral presentations, academic conference talks, research presentations
**Style Objective**: Academic Conference
**Complexity Level**: Rich

## Description

A clean, restrained academic conference theme inspired by "northern lights refracted through crystal." Pure white background with a single sharp indigo accent for all structural elements. The signature "aurora" effect is a subtle rainbow-gradient bar (5pt height) at the top of every content slide, with title/ending slides featuring full geometric aurora crystal bands. Designed for information-dense ICML/NeurIPS oral-style presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: aurora-prism-theme.with(
  aspect-ratio: "16-9",
  footer: [ICML 2026 -- Oral Presentation],
  config-info(
    title: [Your Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

Set a safe Latin/CJK font stack in the deck (not in `template.typ`), for example
`#set text(font: ("Arial", "Noto Sans SC"))` after the theme show rule.

## Components

| Component | Function | Description |
|-----------|----------|-------------|
| `prism-card` | `prism-card(title, body, accent: ..)` | Clean card with indigo left border + category label |
| `aurora-stat` | `aurora-stat(label, value, color: ..)` | Large number with aurora gradient underline |
| `refraction-highlight` | `refraction-highlight[body]` | Block with rainbow-gradient top edge + light fill |
| `beam-tag` | `beam-tag(label, color: ..)` | Inline pill badge with color fill |
| `spectrum-divider` | `spectrum-divider()` | SVG gradient horizontal line |
| `crystal-quote` | `crystal-quote(quote, author: ..)` | Left rainbow border, italic content |
| `data-panel` | `data-panel(title: .., body)` | White card with subtle border for charts |

## Slide Types

- `title-slide()` — Crystal band header/footer, centered info
- `slide` — Standard content with aurora bar at top
- `new-section-slide` — Section transition with number
- `focus-slide` — Centered quote/statement
- `ending-slide` — Crystal bands top/bottom, thank you
