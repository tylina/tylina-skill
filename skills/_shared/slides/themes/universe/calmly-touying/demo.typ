// ═══════════════════════════════════════════════════════════════
// Calmly Touying Theme — Comprehensive Feature Demo
// Universe package: @preview/calmly-touying:0.2.0
// A modern, minimalist presentation theme with Moloch-inspired design
// ═══════════════════════════════════════════════════════════════

#import "@preview/calmly-touying:0.2.0": *
#import "@preview/touying:0.6.1": config-common
#import "@preview/mitex:0.2.7": *

#let demo-colors = get-theme-colors(theme: "tomorrow", variant: "light")
#demo-colors.insert("text-muted", demo-colors.at("text-secondary"))
#demo-colors.insert("text-light", demo-colors.at("text-secondary"))

#show: calmly.with(
  config-info(
    title: [Calmly Touying Feature Showcase],
    subtitle: [A Modern Minimalist Theme for Typst],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution Name],
  ),
  config-common(breakable: false),
  variant: "light",          // "light" | "dark"
  colortheme: "tomorrow",    // "tomorrow" | "warm-amber" | "paper" | "dracula"
  progressbar: "foot",       // "foot" | "head" | "frametitle" | "none"
  header-style: "moloch",    // "moloch" | "minimal"
)

#set text(font: ("IBM Plex Sans", "PingFang SC"))

// ── Title Slide ──────────────────────────────────────────────
#title-slide(layout: "moloch", colors: demo-colors)

// ══════════════════════════════════════════════════════════════
= Introduction
// ══════════════════════════════════════════════════════════════

== Welcome to Calmly Touying

This is a comprehensive demo of the *Calmly Touying* theme.

- *4 color themes*: Tomorrow, Warm Amber, Paper, Dracula
- *2 variants*: Light and Dark mode
- *3 title layouts*: Moloch, Centered, Split
- *14 slide types* for every presentation need
- *30+ reusable components* for rich content
- *Golden ratio* spacing throughout

== Box Components

The theme provides three semantic box types:

#stack(
  spacing: 0.8em,
  highlight-box(title: "Key Point")[
    Use `highlight-box` for important information you want to emphasize.
    It uses the primary accent color with a left border and gradient fill.
  ],
  alert-box(title: "Warning")[
    Use `alert-box` for critical warnings and cautionary notes.
    Styled with red accents to draw attention.
  ],
  example-box(title: "Example")[
    Use `example-box` for demonstrations and worked examples.
    Styled with green accents for positive association.
  ],
)

== More Box Components

#themed-block(title: "Themed Block")[
  A generic themed container with default styling.
]

#themed-block(title: "Filled Block", fill-mode: "fill")[
  A themed block with filled background for stronger emphasis.
]

#algorithm-box(title: "Algorithm 1: Euclidean GCD")[
  1. If #mi(`b = 0`), return #mi(`a`) \
  2. Otherwise, return #mi(`\gcd(b, a \mod b)`) \
  3. The algorithm terminates because #mi(`a \mod b < b`)
]

== Text Helpers & Visual Elements

The theme provides inline text styling helpers:

- This is #alert[accent-colored alert text] for emphasis
- This is #muted(colors: demo-colors)[muted grey text] for secondary information
- This is #subtle(colors: demo-colors)[subtle secondary text] for minor details

#soft-divider()

Visual elements for structure:

#accent-line()

#pill(colors: demo-colors)[Tag A] #pill(colors: demo-colors)[Tag B] #pill(colors: demo-colors)[Category]

// ══════════════════════════════════════════════════════════════
= Layout & Content
// ══════════════════════════════════════════════════════════════

== Two-Column Layout

#grid(
  columns: (golden-split-left, golden-split-right),
  column-gutter: 1.5em,
  [
    *Left Column (~38.2%)*

    This example uses a golden-ratio split for visual emphasis.

    - Concise points
    - Supporting details
    - Visual balance
  ],
  [
    *Right Column (~61.8%)*

    The wider column naturally draws the eye and holds the primary content.

    #mitex(`f(x) = \int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)
  ],
)

== Three-Column Layout

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  [
    *Column 1*

    Introduction and context for the topic.
  ],
  [
    *Column 2*

    Core content and main argument.
  ],
  [
    *Column 3*

    Conclusions and next steps.
  ],
)

== Mathematics

#stack(
  spacing: 1em,
  [Calmly Touying renders mathematics with clean typography:],
  mitex(`\sum_{k=0}^n \binom{n}{k} x^k y^{n-k} = (x + y)^n`),
  [The Euler identity, often called the most beautiful equation:],
  mitex(`e^{i\pi} + 1 = 0`),
)

== Reveal-Compatible Content

Content can be revealed incrementally:

- This point is always visible
- This point appears on the second click
- This point appears on the third click

#highlight-box(title: "Revealed Box")[
  This demo keeps all content visible. Verify `#pause` separately with this
  package version before using it in a delivered deck.
]

// ══════════════════════════════════════════════════════════════
= Specialized Slides
// ══════════════════════════════════════════════════════════════

== Field Equation

#stack(
  spacing: 0.8em,
  [The `equation-slide` type centers an equation with variable definitions:],
  mitex(`\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}`),
  [
    Where:
    - #mi(`\mathbf{E}`) — Electric field vector
    - #mi(`\mathbf{B}`) — Magnetic field vector
    - #mi(`t`) — Time
  ],
)

== Quote & Code Blocks

#stack(
  spacing: 1em,
  quote-block(attribution: [Richard Hamming], colors: demo-colors)[
    "The purpose of computing is insight, not numbers."
  ],
  code-block(
    lang: "python",
    ```python
    def fibonacci(n):
        a, b = 0, 1
        for _ in range(n):
            a, b = b, a + b
        return a
    ```.text,
  ),
)

== Soft Shadow Box

#stack(
  spacing: 1em,
  soft-shadow-box()[
    This content is displayed in an elevated box with a subtle stroke,
    creating a card-like appearance that lifts off the slide background.
  ],
  [Use `soft-shadow-box` when you want content to feel distinct
  from the main slide surface without heavy borders or colors.],
)

// ══════════════════════════════════════════════════════════════
= Emphasis Slides
// ══════════════════════════════════════════════════════════════

== Summary

Calmly Touying provides a complete toolkit for professional presentations:

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  [
    *Design System*
    - 4 color themes × 2 variants
    - Golden-ratio spacing
    - Moloch-inspired headers
    - Configurable progress bars
  ],
  [
    *Components*
    - Semantic box types
    - Native grid layouts
    - Text styling
    - Visual elements
    - Card components
  ],
)

// ── Focus Slide ──────────────────────────────────────────────
#focus-slide[
  The best presentations are clear, \
  focused, and visually calm.
]

// ── Standout Slide ───────────────────────────────────────────
#standout-slide[
  Make your key message \
  impossible to miss.
]

// ── Ending Slide ─────────────────────────────────────────────
#ending-slide(
  title: "Thank You",
  subtitle: "Questions & Discussion",
  contact: ("email\@example.com", "github.com/username"),
  colors: demo-colors,
)
