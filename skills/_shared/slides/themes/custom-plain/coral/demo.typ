#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: coral-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Coral Theme Demo],
    subtitle: [Warm, Vibrant & Modern Presentations],
    author: [Jane Cooper],
    date: datetime.today(),
    institution: [Creative Studio Inc.],
    contact: [hello\@coralstudio.com],
  ),
)

#set text(font: ("IBM Plex Sans", "Arial", "Helvetica"))

#title-slide()

= Getting Started

== Why Coral?

The *Coral* theme brings energy and warmth to your presentations with its vibrant palette.

- Warm coral and salmon tones for a friendly feel
- Teal accent for contrast and visual pop
- Clean, modern typography
- Perfect for pitches, marketing decks, and creative work

== Components Showcase

#stack(
  spacing: 0.8em,
  highlight-box[Key Insight][
    The Coral theme includes several reusable components that make building beautiful slides effortless.
  ],
  highlight-box(variant: "accent")[Pro Tip][
    Use the *accent* variant for tips, and the *neutral* variant for secondary information.
  ],
)

== Metrics & Tags

#stack(
  spacing: 0.8em,
  metric-row((
    (label: "Users", value: "12K"),
    (label: "Revenue", value: "\$2.4M"),
    (label: "Growth", value: "+68%"),
    (label: "NPS", value: "92"),
  )),
  [Tags for categorization:
   #tag[Marketing]
   #tag[Q4 2024]
   #tag(color: palette.accent)[Growth]
   #tag(color: palette.secondary)[Priority]],
)

= Design & Layout

== Two-Column Layout

#block(width: 30em)[
  #cols(columns: (1fr, 1fr), gutter: 2em, align: top)[
    *Left Column*
    - Template-content separation
    - Reusable components
    - Clean slide markup
    - Gradient header bars
  ][
    *Right Column*

    #highlight-box(variant: "neutral")[Note][
      Columns can contain any content including components, images, and math.
    ]
  ]
]

== Mathematics

Coral handles mathematical expressions beautifully:

#mitex(`E = mc^2`)

The normal distribution density function:

#mitex(`f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{(x - \mu)^2}{2\sigma^2}}`)

== Code Example

```python
import coral

def create_presentation(title, slides):
    """Generate a vibrant presentation."""
    deck = coral.Deck(title, theme="coral")
    for slide in slides:
        deck.add(slide)
    return deck.render()
```

#focus-slide[
  #stack(
    spacing: 0.8em,
    [_"Design is not just what it looks like. Design is how it works."_],
    [— Steve Jobs],
  )
]

#ending-slide[
  #stack(
    spacing: 0.8em,
    [Thank You!],
    text(size: 0.5em, weight: "regular")[Let's build something beautiful together.],
  )
]
