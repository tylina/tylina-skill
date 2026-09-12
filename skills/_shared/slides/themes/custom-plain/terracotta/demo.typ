#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: terracotta-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Terracotta Theme],
    subtitle: [Mediterranean Warmth],
    author: [Designer Name],
    date: datetime.today(),
    institution: [Design Studio],
  ),
)

#title-slide()

= Mediterranean Design

== Introduction

The *Terracotta* theme draws inspiration from Mediterranean architecture:

- Warm burnt orange and clay tones
- Sandy backgrounds evoking sun-baked walls
- Olive green accents from coastal landscapes
- Perfect for travel, culture, and food presentations

== Components

#stack(
  spacing: .8em,
  clay-card[Key Insight][
    Terracotta has been used in architecture for thousands of years,
    from ancient Roman tiles to modern Mediterranean villas.
  ],
  [Tags: #olive-tag[Architecture] #h(6pt) #olive-tag[Culture] #h(6pt) #olive-tag[Design]],
)

== Two Columns

#cols[
  *Materials*

  Clay, stone, and wood form the
  foundation of Mediterranean design.
  Natural materials create warmth.
][
  *Colors*

  Earth tones dominate: terracotta,
  ochre, olive, and cream. These
  colors evoke the landscape.
]

= Examples

== Decorative Elements

#stack(
  spacing: .8em,
  arch-divider(),
  [The arch is a defining element of Mediterranean architecture,
  from Roman aqueducts to Moorish palaces.],
  arch-divider(),
)

== Mathematics

The golden ratio in architecture:

#mitex(`\phi = \frac{1 + \sqrt{5}}{2} \approx 1.618`)

== Code

```python
def golden_spiral(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b
```

#focus-slide[
  _Beauty in simplicity._
]

#ending-slide[Grazie!]
