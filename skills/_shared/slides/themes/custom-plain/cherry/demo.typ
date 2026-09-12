#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: cherry-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Cherry Blossom Theme],
    subtitle: [Elegant presentations inspired by sakura],
    author: [Hanami Sakura],
    date: datetime.today(),
    institution: [Tokyo Institute of Arts],
  ),
)

#set text(font: ("New Computer Modern", "Hiragino Mincho ProN", "Libertinus Serif"))

#title-slide()

= The Art of Sakura

== Welcome

This is the *Cherry* theme — a Touying presentation theme inspired by Japanese cherry blossoms.

- Soft pinks and warm reds
- Elegant and poetic aesthetics
- Perfect for cultural, art, and literary topics

== Sakura Card

#sakura-card[Hanami Tradition][
  _Hanami_ (花見) is the Japanese tradition of enjoying the beauty of cherry blossoms.
  Each spring, people gather under blooming sakura trees to celebrate the fleeting nature of life.
]

#sakura-card(accent: palette.gold)[Wabi-Sabi][
  The Japanese aesthetic of _wabi-sabi_ embraces imperfection and transience — much like the brief bloom of cherry blossoms.
]

== Haiku Poetry

A haiku captures a moment in nature:

#haiku-box(
  [An old silent pond],
  [A frog jumps into the pond],
  [Splash! Silence again.],
)

#text(size: 0.85em, fill: palette.text-light)[— Matsuo Bashō (松尾芭蕉)]

== Tags and Dividers

Use #accent-tag[accent tags] to highlight key terms inline.

Topics: #accent-tag[Art] #accent-tag[Culture] #accent-tag[Poetry] #accent-tag[Nature]

#petal-divider()

The petal divider adds a decorative sakura-inspired separator between content sections.

= Design Elements

== Two-Column Layout

#block(width: 30em)[
  #cols(columns: (1fr, 1fr), gutter: 2em, align: top)[
    *Cherry Blossom Facts*
    - Bloom lasts 1–2 weeks
    - Over 200 cultivars in Japan
    - Somei Yoshino is most popular
    - National flower of Japan
  ][
    *Symbolism*
    - Renewal and hope
    - Beauty in impermanence
    - The cycle of life
    - Mono no aware (物の哀れ)
  ]
]

== Mathematics

The beauty of mathematics is universal:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

Golden ratio, found in nature and sakura petal arrangements:

#mitex(`\phi = \frac{1 + \sqrt{5}}{2} \approx 1.618`)

== Code Example

```python
def sakura_season(temperature, month):
    """Predict cherry blossom blooming"""
    if month in [3, 4] and temperature > 15:
        return "Full bloom! 🌸"
    elif month == 3 and temperature > 10:
        return "Buds forming..."
    else:
        return "Waiting for spring"
```

#focus-slide[
  _Mono no aware_ \
  The bittersweet awareness \
  of impermanence
]

#ending-slide[
  Thank You \
  ありがとうございました
]
