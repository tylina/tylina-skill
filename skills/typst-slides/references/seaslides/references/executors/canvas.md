# Executor Canvas — High-Craft Visual Composition

## Contents

- [Role and references](#role-definition)
- [Complexity level](#complexity-level)
- [Canvas architecture](#1-the-canvas-architecture)
- [Seven iron rules](#2-seven-iron-rules-of-canvas-aesthetics)
- [Canvas layout patterns](#3-canvas-layout-patterns-12-registered-patterns)
- [Image composition](#4-image-composition-in-canvas)
- [Quality checklist](#5-canvas-specific-quality-checklist)
- [Speaker notes](#6-speaker-notes-style)
- [Patterns by theme type](#7-common-canvas-patterns-by-theme-type)
- [Anti-patterns](#8-anti-patterns-to-avoid)

## Role Definition

High-craft visual Typst slide executor for editorial magazine, Swiss international, festival, and poster-style presentations. Every slide is a unique layout canvas with per-page composition using `place()`, inline styling, and full-bleed imagery. Restraint over spectacle. Structure over decoration. The benchmark is "indistinguishable from a professional design studio's output."

**Core philosophy**: Canvas = giving the LLM freedom to write visually rich, hand-crafted layouts directly in `main.typ` using fundamental Typst primitives (`text`, `grid`, `block`, `place`, `stack`, `line`) and the theme's palette. Canvas is NOT about relying on a huge library of pre-built components. It is about composing unique pages from first principles.

## References

- `base.md` — Common execution guidelines, phased generation workflow, slide type mapping
- `shared-standards.md` — Typst/Touying technical constraints, layout APIs, package versions
- `template-designer.md` — Theme design patterns, component implementations
- `design-guide.md` — Aesthetic philosophy, anti-patterns, visual excellence principles
- `image-layout-patterns.md` — 72 image-text layout patterns (Primary + Modifier vocabulary)
- `${TYLINA_SKILLS_ROOT}/_shared/packages/index.json` — Additional packages: mitex (math), lilaq (standard charts), gribouille (layered Grammar-of-Graphics plots), merman (Mermaid flowcharts/Gantt), codly (zebra-stripe code), lovelace (pseudocode), cheq (checklists), pinit (annotations), etc.
- `${TYLINA_SKILLS_ROOT}/_shared/icons/index.json` — Icon packages; use emoji by default

> **Rule**: All technical standards (APIs, versions, syntax) are defined in those documents. This file covers **Canvas style-specific** guidance only.

> **One-shot references**: Study the bundled Canvas examples in `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-canvas/` — especially `sugar-rush/demo.typ` (Memphis/pop art with full-bleed imagery and `place()`-heavy compositions), `guizang-magazine/demo.typ` (editorial two-tone with dark/light rhythm), and `guizang-swiss/demo.typ` (Swiss design with precise grid layouts).

---

## Complexity Level

Canvas is the **highest complexity tier**. Each page is an intentional layout composition rather than a template fill; judge complexity by rendered needs and compile stability, not source line count.

| When Canvas is the Right Choice | When Canvas is Overkill |
|-------------------------------|----------------------|
| Magazine editorial decks | Internal status updates |
| Brand launches / keynotes | Quick training materials |
| Festival / gallery presentations | Data-driven consulting |
| Reproductions of professional designs | Academic talks |
| Portfolio / case study showcases | Any deck under 8 slides |

> **Canvas = free-form composition with Typst primitives.** The template provides a palette, base slide functions, and optionally some reusable helper components. But the *content file* (`main.typ`) uses `place()`, per-page `text(size:, fill:)`, `grid()`, `block()`, `stack()`, and unique compositions — all colors referencing `palette.xxx`.

---

## 1. The Canvas Architecture

### What Canvas Is

Canvas mode means every slide in `main.typ` is a unique, hand-crafted composition built from Typst primitives:

- **`place()`** — for overlays, decorative ghost text, floating elements, precise positioning
- **`text(size:, fill:, weight:, tracking:)`** — varied typography per element, not uniform styles
- **`block(fill:, inset:, stroke:)`** — colored containers, cards, banners
- **`grid(columns:, column-gutter:)`** — structural multi-column layouts
- **`stack(spacing:)`** — vertical/horizontal element stacking
- **`line()`** — decorative rules, connectors, timelines
- **`config-page()`** — per-slide backgrounds, margins, header/footer overrides
- **`gradient.linear()`** — scrim overlays for text over images

### What Canvas Is NOT

- A huge library of pre-built "canvas-only" functions
- Using special slide types that may not exist in every theme
- Being restricted to specific layout patterns
- Having rigid function signatures to memorize

### The Two-Level Architecture

**Template provides (small toolkit):**
- Palette dictionary (`palette.ink`, `palette.paper`, `palette.accent`, etc.)
- 5 base slide type functions (`slide`, `title-slide`, `new-section-slide`, `focus-slide`, `ending-slide`)
- Optionally 5-15 small helper components (theme-specific — varies per theme)

**Main.typ composes (the creative work):**
- Unique per-page layouts using `grid()`, `place()`, `block()`
- Inline `text(size:, fill: palette.xxx)` for one-off typographic treatments
- `block(fill: palette.xxx)` for one-off colored containers
- Per-page image compositions with precise positioning
- `config-page()` for per-slide background, margin, header overrides
- Every slide is a different composition — no two content slides should look identical

### The Abstraction Threshold

> **Rule**: Abstract into `template.typ` only what repeats across 3+ slides. Inline what's unique.

```typst
// GOOD — helper used on many slides, defined in template.typ:
#let section-title(color)[body] = {
  text(size: 11pt, weight: "bold", fill: color, tracking: 2pt, upper(body))
}

// GOOD — unique composition, written directly in main.typ:
#block(fill: palette.ink, inset: 12pt)[
  #stack(spacing: .8em,
    text(size: 9pt, fill: palette.paper.transparentize(50%), tracking: 1.5pt)[SPECIAL METRIC],
    text(size: 36pt, weight: 200, fill: palette.paper)[42%],
  )
]
```

---

## 2. Seven Iron Rules of Canvas Aesthetics

These rules separate "AI-generated deck" from "professionally designed presentation."

### Rule 1: Restraint Over Spectacle

- Decorative elements should be **barely noticeable**: 6% opacity ghost numbers, 0.5pt rules, subtle tints
- Hero pages (cover, divider, closing) may have heavier decoration; body pages stay clean
- **Ghost text and accent overlays** belong ONLY on hero pages
- If an element doesn't serve hierarchy, emphasis, or navigation — remove it

### Rule 2: Typography Is the Foundation

Two valid typography systems for Canvas:

**A. Triple-Font System (Editorial/Magazine):**
| Role | Font Type | Usage |
|------|-----------|-------|
| Display / Headlines | Serif | Titles, pull quotes, hero numbers |
| Body / Description | Sans-serif | Paragraphs, card descriptions, labels |
| Metadata / Chrome | Monospace | Kickers, page numbers, timestamps |

Never let the three bleed into each other's roles. Serif title + mono kicker + sans body = clear hierarchy.

**B. Single-Family System (Swiss/Modern):**
| Size Range | Weight | Purpose |
|------------|--------|---------|
| >= 36pt | 200 (ExtraLight) | Display, hero titles |
| 24-35pt | 200-300 | Section titles, large headings |
| 16-23pt | 300-400 | Subtitles, card titles |
| 10-15pt | 400-600 | Body, labels, metadata |

**Inverse weight hierarchy**: Bigger text = lighter weight. This creates elegance that bold headlines cannot match.

### Rule 3: Color Restraint

- **Two-tone systems** (ink + paper) are inherently more elegant than multi-color palettes
- **Single accent color** per deck — if you need emphasis, use weight, size, or opacity, not a second color
- **Derived colors only**: Use `color.transparentize(N%)` for lighter variants, not new hues
- **Custom hex values are forbidden in main.typ** — only use the curated palette from the theme

### Rule 4: Grid Supremacy

- All elements snap to a consistent grid (12-column conceptually)
- **Left-aligned** by default — center alignment is reserved for focus/statement slides only
- **Generous whitespace** creates asymmetric beauty — 60/40 or 70/30 splits over 50/50
- **Margins**: Use the theme's margin system, don't override with ad-hoc padding

### Rule 5: Sharp Geometry (Swiss) / Precise Rules (Editorial)

- **Swiss**: No gradients, no shadows, no border-radius. The rectangle is the fundamental unit
- **Editorial**: Hairline rules (0.5-1pt) divide content. Thick borders signal structure (2-3pt top borders on pillar cards)
- **Both**: No rounded corners on accent elements. If a card has rounded corners, it's not Swiss or editorial

### Rule 6: Image Discipline

- **Images are first-class citizens** — build the layout around the image, not the other way around
- **Standard ratios only**: 16:9, 16:10, 4:3, 3:2, 1:1, 21:9
- **Fixed height containers** (`height: Npt`), not `aspect-ratio` — prevents layout breakage
- **Crop from bottom only** — top and sides carry the image's identity
- **Scrim overlays** for text over images: 2-3 overlapping gradient layers for readable text
- **Generated images must NOT contain slide chrome** (headers, footers, page numbers, titles)

### Rule 7: Visual Rhythm Planning

Before writing any content, create a **theme rhythm table**:

```
Page 1: hero-dark (cover)
Page 2: light (section divider)
Page 3: light (content - text + cards)
Page 4: light (content - data/charts)
Page 5: light (section divider)
Page 6: light (content - text + image)
Page 7: hero-light (focus/quote)
Page 8: light (content)
Page 9: hero-dark (closing)
```

**Review heuristics:**
- Review repeated visual weight and retain it when comparison or sequence benefits from consistency
- Insert a breathing page at a meaningful narrative pause when sustained density causes fatigue

---

## 3. Canvas Layout Patterns (12 Registered Patterns)

> Use these patterns as a starting vocabulary. Combine or depart from them when the content requires a clearer composition and the result survives compile and visual review.

> **Important**: The code examples below use Typst primitives (`place`, `grid`, `block`, `text`) directly. Some themes provide helper functions (e.g., guizang-magazine has `dark-slide()`, `stat-slide()`, `compare-slide()`; sugar-rush has `kpi-card()`, `section-title()`). Always check your theme's `theme.md` for available helpers. The LAYOUT PATTERNS are universal; helper function availability is theme-specific.

### 3.1 Full-Bleed Image with Scrim Overlay

Full-page image with gradient scrim for text legibility. Use for covers, chapter openers, and hero moments.

```typst
// From sugar-rush: cover slide with full-bleed image + scrim + place() overlays
#slide(config: config-page(margin: 0pt, header: none, footer: none, background: {
  set image(width: 100%, height: 100%, fit: "cover")
  image("images/cover_bg.png")
}))[
  // Bottom scrim for text readability
  #place(bottom + left, block(width: 100%, height: 45%,
    fill: gradient.linear(palette.ink.transparentize(100%), palette.ink.transparentize(40%))))

  // Text positioned with place()
  #place(bottom + left, dx: 5%, dy: -16%)[
    #block(width: 60%)[
      #stack(spacing: .8em,
        text(size: 12pt, fill: palette.white, tracking: 1.5pt)[Subtitle text here],
        text(size: 22pt, weight: "black", fill: palette.white)[Main headline.],
      )
    ]
  ]

  // CTA or badge at bottom right
  #place(bottom + right, dx: -5%, dy: -5%)[
    #block(fill: palette.accent, inset: (x: 14pt, y: 8pt))[
      #text(size: 9pt, fill: palette.white, weight: "bold")[LEARN MORE]
    ]
  ]
]
```

### 3.2 Asymmetric Split (60/40 or 70/30)

Large statement/title on the left, supporting detail on the right. The most common Canvas layout.

```typst
// From guizang-swiss: thesis-style split with big statement + detail box
#slide(title: none)[
  #grid(
    columns: (3fr, 2fr),
    column-gutter: 24pt,
    {
      // Left: big statement
      stack(spacing: .8em,
        text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1.5pt, upper[CORE THESIS]),
        text(size: 2.6em, weight: 200)[The \ harness \ #text(fill: palette.accent, style: "italic")[is the] \ product],
      )
    },
    {
      // Right: info box and detail grid
      block(width: 100%, fill: palette.grey-1, inset: 12pt)[
        #set text(size: 9pt)
        Key context paragraph with *bold emphasis* on critical data.
      ]
      grid(columns: (1fr, 1fr), column-gutter: 8pt, row-gutter: 10pt,
        block(stroke: (left: 0.5pt + palette.grey-2), inset: (left: 8pt))[Detail A],
        block(stroke: (left: 0.5pt + palette.grey-2), inset: (left: 8pt))[Detail B],
      )
    },
  )
]
```

### 3.3 Pillar Cards (2-4 Columns)

Equal-width cards with consistent structure. The classic "three pillars" layout. Built inline with `grid()` + `block()`.

```typst
// From guizang-swiss: three content cards built from primitives
#slide(title: none)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    block(width: 100%, fill: palette.grey-1, inset: 12pt)[
      #stack(spacing: .8em,
        text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)[LAYER 01],
        text(size: 14pt, weight: 500, fill: palette.ink)[Innovation],
        {
          set text(size: 9pt, weight: 400, fill: palette.grey-3)
          [Continuous R&D investment driving product differentiation.]
        },
      )
    ],
    block(width: 100%, fill: palette.grey-1, inset: 12pt)[
      #stack(spacing: .8em,
        text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)[LAYER 02],
        text(size: 14pt, weight: 500, fill: palette.ink)[Execution],
        {
          set text(size: 9pt, weight: 400, fill: palette.grey-3)
          [2x faster time-to-market through systematic automation.]
        },
      )
    ],
    block(width: 100%, fill: palette.grey-1, inset: 12pt)[
      #stack(spacing: .8em,
        text(size: 8pt, weight: 600, fill: palette.grey-3, tracking: 1pt)[LAYER 03],
        text(size: 14pt, weight: 500, fill: palette.ink)[Scale],
        {
          set text(size: 9pt, weight: 400, fill: palette.grey-3)
          [10x growth without architectural refactoring.]
        },
      )
    ],
  )
]
```

### 3.4 Data Dashboard (KPI Row + Hairline + Detail)

Top row of stat values, hairline divider, bottom detail section. For performance/metrics pages.

```typst
// From guizang-swiss: KPI layout with big numbers + hairline + detail
#slide(title: none)[
  #grid(
    columns: (5fr, 2fr, 2fr, 2fr),
    column-gutter: 12pt,
    text(size: 1.8em, weight: 200, fill: palette.ink)[General \ performance \ basis],
    stack(spacing: .8em,
      { set text(size: 7pt, weight: 600, fill: palette.grey-3, tracking: 1pt); upper[operations] },
      text(size: 36pt, weight: 200, fill: palette.ink)[530],
      { set text(size: 8pt, weight: 400, fill: palette.grey-3); [calls / hour] },
    ),
    stack(spacing: .8em,
      { set text(size: 7pt, weight: 600, fill: palette.grey-3, tracking: 1pt); upper[throughput] },
      text(size: 36pt, weight: 200, fill: palette.ink)[60],
      { set text(size: 8pt, weight: 400, fill: palette.grey-3); [hz baseline] },
    ),
    stack(spacing: .8em,
      { set text(size: 7pt, weight: 600, fill: palette.grey-3, tracking: 1pt); upper[RT / time] },
      text(size: 36pt, weight: 200, fill: palette.ink)[\~13],
      { set text(size: 8pt, weight: 400, fill: palette.grey-3); [seconds / cycle] },
    ),
  )
  #line(length: 100%, stroke: 0.5pt + palette.grey-2)
  // Detail content below the hairline...
]
```

### 3.5 Dark Statement Page (Ink Background + Ghost Text)

Full dark background with large statement text, optional ghost number/text in background at very low opacity. Used for section dividers and emphasis moments.

```typst
// From guizang-magazine: dark section divider with ghost number
#slide(config: config-page(
  fill: palette.ink,
  header: none, footer: none,
  margin: (x: 2.5em, top: 2.5em, bottom: 1.2em),
))[
  // Ghost number at very low opacity
  #place(top + right, dx: -1em, dy: -0.5em)[
    #text(size: 220pt, weight: "bold", fill: palette.paper.transparentize(94%))[05]
  ]

  #set text(fill: palette.paper)
  #v(1fr)

  #stack(
    spacing: .8em,
    text(size: 9pt, weight: "medium", tracking: 1.8pt,
      fill: palette.paper.transparentize(50%), font: "Noto Sans Mono")[SECTION 05],
    text(size: 36pt, weight: "bold")[
      The key insight goes here--spanning multiple lines.
    ],
    block(width: 60pt, height: 3pt, fill: palette.paper),
  )

  #v(2fr)
]
```

### 3.6 Dark Stat Page (Ink Background + Giant Numbers)

Dark background with huge numbers as the visual anchor. Numbers should be >=48pt bold, with small mono labels above and sans description below.

```typst
// From guizang-magazine: stat page with three giant numbers
#slide(config: config-page(fill: palette.ink, header: none, footer: none,
  margin: (x: 2.5em, top: 2.5em, bottom: 1.2em)))[
  #set text(fill: palette.paper)

  // Title
  #stack(
    spacing: .8em,
    text(size: 9pt, tracking: 1.8pt, fill: palette.paper.transparentize(50%),
      font: "Noto Sans Mono")[OBSERVATORY],
    text(size: 28pt, weight: "bold")[Key metrics that matter.],
  )

  // Three stat blocks with HUGE numbers
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    block(width: 100%)[
      #align(center, stack(
        spacing: .8em,
        text(size: 9pt, tracking: 1.2pt, fill: palette.paper.transparentize(50%),
          font: "Noto Sans Mono")[TOTAL FILES],
        text(size: 46pt, weight: "bold")[512,000],
        text(size: 11pt, fill: palette.paper.transparentize(40%))[
          Lines of code across six thousand files.
        ],
      ))
    ],
    block(width: 100%)[
      #align(center, stack(
        spacing: .8em,
        text(size: 9pt, tracking: 1.2pt, fill: palette.paper.transparentize(50%),
          font: "Noto Sans Mono")[PLAYERS],
        text(size: 46pt, weight: "bold")[3],
        text(size: 11pt, fill: palette.paper.transparentize(40%))[
          Major companies building agent harnesses.
        ],
      ))
    ],
    block(width: 100%)[
      #align(center, stack(
        spacing: .8em,
        text(size: 9pt, tracking: 1.2pt, fill: palette.paper.transparentize(50%),
          font: "Noto Sans Mono")[INNOVATION],
        text(size: 46pt, weight: "bold")[0%],
        text(size: 11pt, fill: palette.paper.transparentize(40%))[
          Model-internal innovation in harness code.
        ],
      ))
    ],
  )
]
```

### 3.7 Two-Column Comparison (Light Background)

Two equal columns comparing concepts. Built with `grid()` + `block()` with left-border accents.

```typst
// From guizang-magazine: comparison layout inline with primitives
== Comparison Title

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  // Left column
  block(width: 100%)[
    #stack(
      spacing: .8em,
      text(size: 18pt, weight: "bold", fill: palette.ink)[Left Concept],
      text(size: 13pt, fill: palette.ink-light)[
        Point one -- first distinction \
        Point two -- second distinction \
        Point three -- key difference
      ],
    )
  ],
  // Right column
  block(width: 100%)[
    #stack(
      spacing: .8em,
      text(size: 18pt, weight: "bold", fill: palette.ink)[Right Concept],
      text(size: 13pt, fill: palette.ink-light)[
        Point one -- contrasting aspect \
        Point two -- alternative approach \
        Point three -- outcome difference
      ],
    )
  ],
)

#v(1fr)

// Pull quote at bottom
#block(
  width: 100%,
  stroke: 1pt + palette.ink.transparentize(60%),
  inset: (x: 1em, y: 0.7em),
)[
  #text(size: 12pt, style: "italic")[
    "A key insight connecting both sides."
  ]
]
```

### 3.8 Chapter Divider (Full-Bleed Image + Watermark)

Full-page background with giant watermark text, chapter badge, and subtitle strip. Used for section transitions.

```typst
// From sugar-rush: chapter divider page
#slide(config: config-page(margin: 0pt, header: none, footer: none, background: {
  set image(width: 100%, height: 100%, fit: "cover")
  image("images/chapter_bg.png")
}))[
  // Large semi-transparent watermark
  #place(center + horizon, dy: -12%)[
    #text(size: 160pt, weight: "black", fill: palette.ink.transparentize(90%),
      tracking: 10pt)[WHAT.]
  ]

  // Chapter badge
  #place(top + left, dx: 4%, dy: 6%)[
    #block(fill: palette.accent, inset: (x: 12pt, y: 6pt), radius: 2pt)[
      #text(size: 9pt, fill: palette.paper, tracking: 3pt, weight: "bold")[CH . 01]
    ]
  ]

  // Subtitle strip
  #place(center + horizon, dy: 14%)[
    #block(fill: palette.paper, inset: (x: 32pt, y: 14pt),
      stroke: (bottom: 3pt + palette.accent))[
      #text(size: 18pt, fill: palette.ink)[Chapter subtitle goes here.]
    ]
  ]

  // Footer
  #place(bottom + right, dx: -4%, dy: -3%)[
    #text(size: 7pt, fill: palette.paper.transparentize(30%))[02 / DECK NAME]
  ]
]
```

### 3.9 Focus Quote (Full-Page Centered Statement)

Centered large text on light or dark background. Minimal chrome. Use for key quotes, provocative questions, or transition moments.

```typst
// From guizang-swiss: focus statement
#focus-slide[
  #text(size: 2.4em, weight: 200)[
    Open in #text(fill: palette.accent, style: "italic")[blue]. \
    Close in #text(fill: palette.accent, style: "italic")[blue].
  ]
]
```

### 3.10 Numbered Items with Diagram

Left column: numbered items with accent-colored numbers. Right column: diagram or illustration built from Typst shapes.

```typst
// From guizang-swiss: numbered items + loop diagram
#slide(title: none)[
  #text(size: 1.5em, weight: 300)[System reads its own output.]
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    {
      // Left: numbered items
      grid(columns: (auto, 1fr), column-gutter: 14pt, row-gutter: 16pt,
        text(size: 20pt, weight: 200, fill: palette.ink)[01],
        stack(spacing: .8em,
          text(size: 11pt, weight: 500)[Data Collection],
          { set text(size: 8.5pt, fill: palette.grey-3); [Read NPS scores, identify low ratings] },
        ),
        text(size: 20pt, weight: 200, fill: palette.ink)[02],
        stack(spacing: .8em,
          text(size: 11pt, weight: 500)[Feature Extraction],
          { set text(size: 8.5pt, fill: palette.grey-3); [Find common patterns in failures] },
        ),
        text(size: 20pt, weight: 200, fill: palette.ink)[03],
        stack(spacing: .8em,
          text(size: 11pt, weight: 500)[Action],
          { set text(size: 8.5pt, fill: palette.grey-3); [Rewrite skill file automatically] },
        ),
      )
    },
    {
      // Right: cycle diagram using place()
      set align(center)
      block(width: 100%, height: 200pt)[
        #place(center + horizon,
          circle(radius: 72pt, stroke: 1pt + palette.grey-2, fill: none))
        #place(center + horizon,
          text(size: 14pt, weight: 300, fill: palette.accent)[improves])
        #place(center + top, dy: 6pt)[
          #text(size: 7pt, weight: 500, fill: palette.grey-3)[Read]
        ]
        #place(right + horizon, dx: -6pt)[
          #text(size: 7pt, weight: 500, fill: palette.grey-3)[Extract]
        ]
        #place(center + bottom, dy: -6pt)[
          #text(size: 7pt, weight: 500, fill: palette.grey-3)[Rewrite]
        ]
        #place(left + horizon, dx: 6pt)[
          #text(size: 7pt, weight: 500, fill: palette.grey-3)[Run]
        ]
      ]
    },
  )
]
```

### 3.11 Three-Column Card + Large Numbers

Three columns of detail cards at top, oversized numbers (01/02/03) at bottom. The "Context. Opportunity. Impact." pattern.

```typst
// From guizang-swiss: three cards + numbered anchors
#slide(title: none)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12pt,
    block(width: 100%, fill: palette.grey-1, inset: 14pt)[
      #stack(spacing: .8em,
        text(size: 16pt, weight: 300, fill: palette.ink)[Context.],
        {
          set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
          [Background description explaining the current situation.]
        },
      )
    ],
    block(width: 100%, fill: palette.grey-1, inset: 14pt)[
      #stack(spacing: .8em,
        text(size: 16pt, weight: 300, fill: palette.ink)[Opportunity.],
        {
          set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
          [Market gap or technical opportunity to exploit.]
        },
      )
    ],
    block(width: 100%, fill: palette.grey-1, inset: 14pt)[
      #stack(spacing: .8em,
        text(size: 16pt, weight: 300, fill: palette.accent)[Impact.],
        {
          set text(size: 8.5pt, weight: 400, fill: palette.grey-3)
          [Expected outcome and strategic advantage.]
        },
      )
    ],
  )
  #v(1fr)
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    text(size: 48pt, weight: 200)[01],
    text(size: 48pt, weight: 200)[02],
    text(size: 48pt, weight: 200, fill: palette.accent)[03],
  )
]
```

### 3.12 Hub-Spoke Layout (Place-Based Spatial Diagram)

A central element with satellite elements positioned around it using `place()`. For org charts, architecture diagrams, or map-style layouts.

```typst
// From sugar-rush: hub-spoke stage layout
#slide(config: config-page(margin: (top: 2em, bottom: 1.2em, x: 2em),
  header: none, footer: none))[
  #text(size: 11pt, weight: "bold", fill: palette.accent, tracking: 2pt)[5 STAGES]

  #block(width: 100%, height: 320pt)[
    // Top-left spoke
    #place(top + left, dx: 0%, dy: 0%)[
      #block(width: 30%)[
        #block(fill: palette.pink.transparentize(90%), inset: 8pt,
          stroke: (left: 3pt + palette.pink))[
          #stack(spacing: .8em,
            text(size: 9pt, weight: "bold")[CHERRY STAGE],
            text(size: 8pt, fill: palette.ink.transparentize(30%))[5,000 capacity],
          )
        ]
      ]
    ]
    // Top-right spoke
    #place(top + right, dx: 0%, dy: 0%)[
      #block(width: 30%)[
        #block(fill: palette.blue.transparentize(90%), inset: 8pt,
          stroke: (left: 3pt + palette.blue))[
          #stack(spacing: .8em,
            text(size: 9pt, weight: "bold")[NEON GRID],
            text(size: 8pt, fill: palette.ink.transparentize(30%))[5,000 capacity],
          )
        ]
      ]
    ]
    // Center hub
    #place(center + horizon)[
      #block(fill: palette.ink, inset: 16pt, radius: 50%)[
        #text(size: 14pt, weight: "bold", fill: palette.paper)[MAIN]
      ]
    ]
    // Dashed connectors
    #place(center + horizon)[
      #line(start: (-40pt, -30pt), end: (-160pt, -110pt),
        stroke: (dash: "dashed", paint: palette.pink, thickness: 1.5pt))
    ]
    #place(center + horizon)[
      #line(start: (40pt, -30pt), end: (160pt, -110pt),
        stroke: (dash: "dashed", paint: palette.blue, thickness: 1.5pt))
    ]
  ]
]
```

### 3.13 Palette Variable Naming

Different themes export their palette under different names:
- guizang-magazine: `#let pal = build-palette("monocle")`
- guizang-swiss: uses `palette.xxx` (via theme show rule)
- sugar-rush: uses `palette.xxx` (via theme show rule)
- Other themes: Check theme.md for the palette factory function name

In these examples, `pal.xxx` and `palette.xxx` refer to the same concept — your theme's palette dictionary. Use whichever name your theme exports.

---

## 4. Image Composition in Canvas

Canvas mode treats images as architectural elements, not decorative afterthoughts. Reference `image-layout-patterns.md` for the full 72-pattern vocabulary.

### Image Placement Hierarchy

Even at Canvas complexity, the placement hierarchy from `image-layout-patterns.md` applies:

| Goal | Use This | NOT This |
|------|----------|----------|
| Full-bleed background | `config-page(background: image(..., fit: "cover"))` | `place(image(...))` as first element |
| Image + text side-by-side | `#cols(columns: (1fr, 2fr))[#image(...)][text]` | Ad-hoc absolute placement for normal flow |
| Text/shapes over an image | `place(...)` inside slide body | Baking text into the generated image |

> `place()` is the Canvas workhorse for **text overlays, annotations, and floating elements** — not for ordinary image placement. The image goes into `config-page(background:)`, `#cols`, or a documented theme-specific composer; `place()` positions native Typst elements on top.

### AI Image Generation for Canvas

When generating images for Canvas decks, follow `image-generator.md` for prompt assembly. Key Canvas-specific requirements:

**Prompt discipline** (see `image-generator.md` for full rules):
- One coherent prose paragraph (100-200 words), never tag soup or keyword lists
- Prepend the deck's Style Anchor (from `content_design_spec.md`)
- Include the deck's color palette as rendering guidance (HEX values, not visible text)
- Specify aspect ratio explicitly per the Image Type table below
- Append hard constraints: no slide chrome, no text, simplified figures

**Image types for Canvas:**
| Type | Aspect Ratio | Usage |
|------|-------------|-------|
| Full-bleed hero | 16:9 | Cover slides, section dividers, closing |
| Documentary photo | 16:9 or 3:2 | Editorial content, case studies |
| Infographic | 4:3 or 1:1 | Data visualization, process diagrams |
| Grid asset | 1:1 | Multi-image compositions (3x2, 2x3 grids) |
| Cinematic band | 21:9 | Top-of-page hero image + overlay |

### Scrim Overlay Technique

For text legibility over images, use multi-layer gradient scrims:

```typst
// 2-layer scrim for maximum readability (from sugar-rush)
#place(bottom + left, block(width: 100%, height: 45%,
  fill: gradient.linear(
    palette.ink.transparentize(100%),  // fully transparent at top
    palette.ink.transparentize(40%),   // semi-transparent at bottom
  ),
))
```

For stronger legibility (3-layer):
```typst
#place(bottom + left,
  block(width: 100%, height: 60%,
    fill: gradient.linear(
      palette.ink.transparentize(100%),  // fully transparent at top
      palette.ink.transparentize(40%),   // semi-transparent middle
      palette.ink.transparentize(10%),   // nearly opaque at bottom
      angle: 180deg,
    ),
  ),
)
```

---

## 5. Canvas-Specific Quality Checklist

### P0 — Must never violate

- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ
- [ ] Colors reference `palette.xxx`, never hardcoded hex values in `main.typ`
- [ ] No overflow warnings — every slide fits within page bounds
- [ ] Title slide uses theme's `title-slide()` function (not manual composition)
- [ ] Section dividers use theme's `new-section-slide` (via `= Heading`) OR manual dark-page composition
- [ ] Font sizes respect the theme's hierarchy (display > h1 > h2 > body > kicker)
- [ ] No serif fonts in Swiss themes; no mixing of font roles in editorial themes
- [ ] Image containers use fixed heights, not `aspect-ratio`
- [ ] All `place()` elements have explicit coordinates — no overlapping content
- [ ] `config-common(breakable: false)` is set
- [ ] All generated images match their target aspect ratio
- [ ] All images in a group share consistent style, density, and margins
- [ ] Color palette in images aligns with deck color scheme (Style Anchor enforced)
- [ ] No photorealistic faces (simplified figures only, unless `editorial-photo` anchor)
- [ ] No text in images unless `text_policy: embedded` — all text is Typst-native

### P1 — Rhythm rules

- [ ] Visual rhythm table created before writing content
- [ ] Repeated visual weight is intentional and content-driven
- [ ] Hero pages mark meaningful openings, transitions, or emphasis points
- [ ] Breathing pages appear where pacing or comprehension needs them
- [ ] Sustained data-heavy sequences include synthesis or breathing room where needed

### P2 — Visual polish

- [ ] Inverse weight hierarchy applied (bigger = lighter weight) for Swiss themes
- [ ] Triple-font system correctly separated for editorial themes
- [ ] Decorative elements (ghost text, dot matrix) appear ONLY on hero pages
- [ ] Hairline rules (0.5pt) used for content division, not thick borders
- [ ] Accent color remains scarce enough to preserve a clear focal hierarchy
- [ ] Whitespace is generous and intentional, not accidental

### P3 — Aesthetic excellence

- [ ] The deck passes the "Monocle test" (editorial) or "Vignelli test" (Swiss)
- [ ] No element exists purely for decoration — every mark earns its place
- [ ] Composition varies where it improves hierarchy or pacing, while purposeful comparison/sequence layouts remain stable
- [ ] Images are compositionally strong, not generic stock photography
- [ ] Speaker notes are polished, TTS-ready, and match the deck's tone

---

## 6. Speaker Notes Style

### Narrative Tone

Canvas presentations use a **confident, measured** speaking style — editorial clarity, not jargon. Think magazine editor presenting to an engaged audience.

### Writing Guidelines

- Use present tense, active voice
- Let the visual do the heavy lifting — notes provide context the audience can't see
- One core message per slide, expanded into 2-4 sentences
- Transitions are natural prose, not meta-commentary
- For Swiss/editorial: use precise language, avoid superlatives
- For creative/festival: more energy, more storytelling, more rhetorical questions

---

## 7. Common Canvas Patterns by Theme Type

### Editorial Magazine (guizang-magazine)

Key primitives used: `place()` for ghost text at 6% opacity, `grid()` for multi-column layouts, `block(stroke: (left: 3pt + ...))` for pull-quote borders, `text(font: "Noto Sans Mono")` for kicker labels, `config-page(fill: palette.ink)` for dark pages.

```
Cover (title-slide)
-> Dark stat page (config-page fill:ink + giant serif numbers in grid)
-> Light pillar cards (grid + block(fill:) for each card)
-> Light comparison (grid 1fr 1fr + bullet lists)
-> Dark section divider (ghost number via place + statement text)
-> Light detail page (grid + block with border-left accent)
-> Focus slide (centered large text)
-> Ending (ending-slide)
```

### Swiss International (guizang-swiss)

Key primitives used: `grid()` for everything, `text(weight: 200)` for inverse-weight display text, `block(fill: palette.grey-1)` for cards, `line(stroke: 0.5pt + palette.grey-2)` for hairlines, `circle()` and `place()` for diagrams.

```
Cover (accent background + inverse-weight title)
-> Section divider (ghost number + accent bar)
-> Text + stat layout (60/40 grid split)
-> Three-column cards (grid + blocks)
-> KPI dashboard (stats row + hairline + detail)
-> Numbered items + diagram (grid + place)
-> Focus slide (centered text with accent line)
-> Ending (accent split)
```

### Festival / Pop Art (sugar-rush)

Key primitives used: `config-page(background: image())` for full-bleed photos, `place()` extensively for overlays/badges/pills, `gradient.linear()` for scrims, `block(fill:, radius:, stroke:)` for decorative pills and badges, `grid()` for card rows.

```
Cover (full-bleed image + scrim + place() overlays)
-> Chapter divider (full-bleed + watermark text + badge)
-> KPI cards page (grid of colored card blocks)
-> Pillar page (3-column grid of styled blocks)
-> Chapter divider
-> Image + cards (block(clip:true) image + grid of cards below)
-> Hub-spoke diagram (place() spatial layout)
-> Timeline (grid + place + line connectors)
-> Full-bleed closing (image + scrim + CTA blocks)
```

---

## 8. Anti-Patterns to Avoid

> Common failures that make Canvas decks look AI-generated rather than human-designed.

| Anti-Pattern | Why It Fails | Correct Approach |
|-------------|-------------|-----------------|
| Every card rounded corners | Breaks Swiss geometry; looks "template-y" | Sharp rectangles (Swiss) or subtle hairline borders (editorial). **Zero `radius:` in Swiss/editorial themes.** |
| Full-width solid-color header bar | #1 indicator of AI-generated output. Makes every slide look identical. | Title directly on background with margin + thin accent line (30-60pt wide, 2-3pt tall). Or thin top accent bar (≤ 4pt height, NOT full header). |
| `weight: "bold"` on text ≥ 28pt | Contradicts inverse weight hierarchy. Kills elegance. | Weight 200-300 for display (≥36pt), 300-400 for headings (24-35pt). Bold ONLY for body emphasis and small labels (≤14pt). |
| Rainbow color scheme | Destroys the palette's coherence | Single accent + derived tones via `.transparentize()` only |
| Accent color competes across unrelated elements | Destroys emphasis — if everything is highlighted, nothing is | Pick the most important application and remove competing accents. |
| Decorative elements on every page | "AI-generated" look | Decoration (ghost numbers, dot matrix) ONLY on hero/section pages |
| Centered everything | Removes visual tension | Left-aligned with deliberate whitespace. Center ONLY for: focus statements, closing slides, section dividers (<10 words). |
| Same layout repeated without a comparison or sequence rationale | Visual monotony | Change composition where it improves hierarchy or pacing; preserve repetition where it communicates equivalence. |
| Symmetric grid (1fr, 1fr, 1fr) everywhere | Mechanical, undesigned feel | Use asymmetric splits: (3fr, 2fr), (5fr, 2fr, 2fr, 2fr). Equal columns ONLY for genuinely equal-weight items. |
| Content fills 80%+ of every slide | No breathing room, exhausting | Reduce sustained density and add breathing/hero pages at meaningful pauses. |
| Mode remains unchanged even when a major transition needs contrast | Flat hierarchy | Use a dark or otherwise contrasting page when it carries a key stat, statement, or section transition. |
| `#v(40pt)` to "fix" positioning | Fragile, breaks on content changes | Use `grid()` or `place()` with proper anchoring |
| Inline `rgb("#...")` in main.typ | Breaks TCS, prevents theme switching | Always use `palette.xxx` |
| Stock photo handshakes/lightbulbs | Generic, meaningless imagery | Purpose-shot documentary or infographic imagery |
| Serif fonts in Swiss themes | Violates "sans-serif only" rule | Sans-serif family exclusively |
| Inventing functions that don't exist | Runtime errors, hallucinated APIs | Only use primitives + functions from theme.md |
| Monolithic page functions | Inflexible, hard to maintain | Small composable components + inline composition |
| Circular number badges (1,2,3) | "SaaS dashboard" / "ChatGPT presentation" look | Use weight/size hierarchy for numbering instead. Ghost numbers or large typographic numerals for Canvas. |
| Drop shadows on any element | Incompatible with editorial/Swiss aesthetic | Depth from fill + opacity differences only. Zero shadows in Canvas. |
