#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: sunset-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Sunset Theme Demo],
    subtitle: [Warm Colors for Inspiring Presentations],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

= Introduction

== Welcome to Sunset

This is a demo of the *Sunset* custom theme — a warm, gradient-rich presentation theme inspired by sunset colors.

- Deep amber and orange gradients
- Golden yellow accents
- Deep purple highlights
- Warm cream backgrounds

== Components: Warm Cards

#warm-card[Key Insight][
  The Sunset theme uses warm orange-to-amber gradients and golden accents to create an inviting, energetic atmosphere for your presentations.
]

#pause

#warm-card(accent: palette.tertiary)[Purple Accent][
  You can customize the accent color of cards — this one uses the deep purple tertiary color.
]

== Components: Two Columns

#cols[
  *Left Column*
  - Gradient headers
  - Decorative sun circles on title slide
  - Timeline components
  - Callout boxes
][
  *Right Column*
  - Warm card components
  - Focus slides with gradient
  - Section dividers
  - Ending slides
]

= Features

== Timeline Component

#stack(
  spacing: .8em,
  timeline-item[2023][Project Kickoff][Initial research and design phase began with stakeholder interviews.],
  timeline-item[2024][Development][Core features built and tested with early adopters.],
  timeline-item[2025][Launch][Public release with full documentation and support.],
)

== Callout Box

#callout(icon: "!")[
  This is an important callout box. Use it to highlight warnings, tips, or key takeaways in your presentation.
]

#pause

#callout(icon: "?")[
  Callouts support custom icons — use them for questions, tips, or any emphasis you need.
]

== Mathematics

The Sunset theme supports math natively:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

#pause

And inline math: #mi(`E = mc^2`)

== Code Example

```python
def sunset_gradient(start, end, steps):
    """Generate a color gradient from start to end."""
    return [
        interpolate(start, end, i / steps)
        for i in range(steps + 1)
    ]
```

#focus-slide[
  _Let the warmth of ideas shine through._
]

#ending-slide[Thank You!]
