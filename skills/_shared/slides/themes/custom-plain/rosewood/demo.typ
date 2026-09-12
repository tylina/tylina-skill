#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: rosewood-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Art of Rosewood],
    subtitle: [Timeless Elegance in Design],
    author: [Eleanor Whitfield],
    date: datetime.today(),
    institution: [Whitfield & Associates],
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#title-slide()

= Heritage & Craft

== Introduction

Welcome to the *Rosewood* theme — a warm, earthy presentation style inspired by the rich tones of rosewood furniture.

- Rich browns and warm cream tones
- Deep red-orange accents for emphasis
- Sophisticated, classic aesthetic

#ornament-divider()

Ideal for architecture, interior design, history, and premium brand presentations.

== Design Components

#wood-card[Material Palette][
  The Rosewood theme draws on natural materials: warm timber tones, aged leather browns, and the deep red heartwood of _Dalbergia_ species. Every element evokes craft and permanence.
]

#cols(columns: (1fr, 1fr), gutter: 1.5em)[
  *Structure*
  - Solid brown header bars
  - Cream background canvas
  - Warm accent borders
][
  *Typography*
  - Serif fonts for elegance
  - Dark brown body text
  - Red-orange highlights
]

= Architecture & Form

== Chapter Headings

#stack(
  spacing: .8em,
  chapter-heading(1, [Foundations]),
  [The foundation of great design begins with understanding materials, proportion, and the interplay of light and shadow.],
  chapter-heading(2, [Structure]),
  [From foundation to form — each layer adds meaning and strength to the final composition.],
)

== Inspiration

#stack(
  spacing: .8em,
  quote-block(author: [Frank Lloyd Wright])[
    Every great architect is — necessarily — a great poet. He must be a great original interpreter of his time, his day, his age.
  ],
  quote-block(author: [Ludwig Mies van der Rohe])[
    Architecture is the will of an epoch translated into space.
  ],
)

== Detailed Cards

#stack(
  spacing: .8em,
  wood-card(accent: palette.warm-red)[Historical Context][
    Rosewood has been prized since the 18th century for fine furniture, musical instruments, and architectural details. Its distinctive grain and rich color have made it a symbol of luxury.
  ],
  wood-card(accent: palette.secondary)[Modern Application][
    Contemporary designers continue to draw on rosewood's warmth, using its color palette in digital interfaces, presentation design, and brand identities.
  ],
)

= Technical Details

== Mathematics

The golden ratio appears throughout classical architecture:

#mitex(`\phi = \frac{1 + \sqrt{5}}{2} \approx 1.618`)

Fibonacci sequence in structural harmony:

#mitex(`F_n = F_{n-1} + F_{n-2}, \quad F_0 = 0, \quad F_1 = 1`)

== Code Example

```python
class RosewoodPalette:
    """A warm, earthy color palette."""

    PRIMARY = "#5D4037"
    ACCENT  = "#BF360C"
    CREAM   = "#FFF8E1"

    def gradient(self, steps=5):
        return [self.lerp(self.PRIMARY, self.CREAM, i / steps)
                for i in range(steps + 1)]
```

#ornament-divider()

Clean code with a classic feel.

== Two-Column Layout

#cols(lazy-layout: true)[
  #wood-card[Left Panel][
    Rosewood's grain patterns are unique — no two pieces are identical, much like every great presentation tells its own story.
  ]
][
  #wood-card[Right Panel][
    The warm red-orange accent color draws attention to key points without overwhelming the natural, earthy palette.
  ]
]

#focus-slide[
  _"Simplicity is the ultimate sophistication."_

  #sym.dash.em Leonardo da Vinci
]

#ending-slide[Thank You]
