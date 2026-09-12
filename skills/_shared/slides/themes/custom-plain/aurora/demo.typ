#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/mitex:0.2.7": *

#show: aurora-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Aurora Theme],
    subtitle: [Inspired by the Northern Lights],
    author: [Presenter Name],
    date: datetime.today(),
    institution: [Aurora Research Lab],
  ),
)

#set text(font: ("New Computer Modern", "Libertinus Serif"))

#title-slide()

= The Aurora

== Welcome to Aurora

This is the *Aurora* theme -- a dark, vibrant presentation theme inspired by the Northern Lights (Aurora Borealis).

- Dark background with luminous accents
- Green, purple, and cyan gradient effects
- Designed for maximum visual impact

#gradient-line()

== Aurora Card Component

#aurora-card[Northern Lights][
  The aurora borealis is a natural light display predominantly seen in high-latitude regions. This theme captures its ethereal beauty with gradient accents and glowing text effects.
]

#aurora-card(accent: palette.cyan)[Key Features][
  Cards feature a gradient left border transitioning from green to purple, set against a dark navy background with subtle borders.
]

== Feature Grid

#feature-grid((
  (title: "Dark Mode", desc: "Optimized for dark backgrounds with carefully chosen contrast ratios"),
  (title: "Gradients", desc: "Beautiful green-to-purple-to-cyan gradient accents throughout"),
  (title: "Readable", desc: "Light text on dark backgrounds ensures excellent readability"),
  (title: "Customizable", desc: "Easy to adjust colors and components to match your brand"),
))

== Two-Column Layout

#block(width: 35em)[
  #cols(columns: (1fr, 1fr), gutter: 2em, align: top)[
    *Left Column*
    - Gradient accent lines
    - Custom card components
    - Feature grid layout
    - Dark code blocks
  ][
    *Right Column*
    - Section dividers with green accents
    - Focus slides for emphasis
    - Ending slides with decoration
    - Full Touying 0.7.4 compatibility
  ]
]

== Aurora Activity Index

#let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
#let kp-index = (3.2, 4.1, 5.8, 3.5, 2.9, 2.1, 1.8, 2.4, 4.5, 6.2, 7.1, 5.4)
#let x = range(12).map(i => i + 1)

#align(center)[
  #stack(
    spacing: .8em,
    lq.diagram(
      width: 520pt, height: 170pt,
      xaxis: (ticks: range(12).map(i => (i + 1, months.at(i))), subticks: none),
      yaxis: (ticks: ((0, "0"), (2, "2"), (4, "4"), (6, "6"), (8, "8")), subticks: none),
      lq.plot(x, kp-index, stroke: 2.5pt + palette.green, label: none),
      lq.bar(x, kp-index, fill: palette.green.transparentize(70%), width: 50%),
    ),
    text(fill: palette.text-secondary, size: 0.75em)[Kp Geomagnetic Index · 2024 Monthly Averages],
  )
]

= Mathematics & Code

== Mathematics

Aurora renders mathematics beautifully against its dark background:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

Inline math works seamlessly: #mi(`E = mc^2`) and #mi(`\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}`)

== Code Example

```python
import numpy as np

def simulate_aurora(particles=1000):
    """Simulate charged particle paths in magnetosphere."""
    positions = np.random.randn(particles, 3)
    velocities = np.random.randn(particles, 3) * 0.1
    for step in range(500):
        B = magnetic_field(positions)
        velocities += np.cross(velocities, B) * 0.01
        positions += velocities
    return positions
```

#gradient-line()

#focus-slide[
  _The night sky comes alive._
]

#ending-slide[Thank You!]
