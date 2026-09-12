#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: lavender-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Lavender Theme],
    subtitle: [Soft Elegance for Modern Presentations],
    author: [Dr. Iris Bloom],
    date: datetime.today(),
    institution: [Amethyst Institute of Design],
    contact: [iris\@amethyst.edu],
  ),
)

#title-slide()

= Foundations

== Welcome to Lavender

This is the *Lavender* theme — a soft, elegant presentation style built on purple and lilac tones.

- Designed for wellness, education, psychology, and design topics
- Calming color palette with refined typography
- Full Touying 0.7.4 feature support

== Petal Card Component

#stack(
  spacing: .8em,
  [
    #petal-card([Core Principle])[
      The lavender theme brings a sense of calm and focus to your presentations. Every element is designed with intentional softness and visual harmony.
    ]
  ],
  [
    #petal-card([Secondary Insight], accent: palette.secondary)[
      You can customize the accent color of each card to match your content's emphasis.
    ]
  ],
)

== Step-by-Step Process

+ Define your presentation goals and key messages
+ Organize content into clear, logical sections
+ Apply visual hierarchy with cards, boxes, and columns
+ Rehearse and refine your delivery for impact

= Visual Elements

== Soft Box & Side-by-Side Layout

#cols(lazy-layout: true)[
  #soft-box[
    *Soft boxes* provide gentle visual grouping without hard borders — perfect for quotes, highlights, or side notes.
  ]
][
  #soft-box[
    Use `#cols` to place content in cols with balanced spacing.
  ]
]

== Mathematics

Lavender handles mathematical expressions beautifully:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

Inline math also works seamlessly: #mi(`E = mc^2`) and #mi(`\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}`).

== Code Example

```python
class MindfulPresenter:
    def __init__(self, topic: str):
        self.topic = topic
        self.slides = []

    def add_slide(self, title: str, content: str):
        self.slides.append({"title": title, "body": content})

    def present(self):
        for slide in self.slides:
            print(f"--- {slide['title']} ---")
            print(slide['body'])
```

#focus-slide[
  _Breathe. Focus. Communicate._
]

#ending-slide[Thank You]
