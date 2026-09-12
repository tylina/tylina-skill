#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: nordic-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Nordic Design Principles],
    subtitle: [Simplicity, Function, and Beauty],
    author: [Astrid Lindqvist],
    date: datetime.today(),
    institution: [Stockholm Design Institute],
    contact: [astrid\@nordic-design.se],
  ),
)
#set text(font: ("Avenir Next", "Avenir", "Arial"), size: 20pt)

#title-slide()

= Design Philosophy

== The Nordic Way

Scandinavian design is defined by simplicity, minimalism, and functionality.
Born from the harsh northern climate, it embraces light, space, and natural materials.

The philosophy can be summarized in one word: _lagom_ -- just the right amount.

== Core Principles

#hygge-card([Hygge & Harmony])[
  The Danish concept of _hygge_ -- creating warmth and togetherness -- extends beyond interiors into how we communicate ideas. A good presentation should feel inviting, not overwhelming.
]

#separator()

- *Simplicity* -- Remove everything unnecessary

- *Function* -- Every element must serve a purpose

- *Nature* -- Draw from organic forms and muted tones

== Two Perspectives

#cols[
  === Form

  - Clean typography
  - Generous whitespace
  - Muted color palettes
  - Rounded, soft edges
  - Natural light emphasis
][
  === Function

  - Intuitive navigation
  - Clear visual hierarchy
  - Accessible contrast
  - Readable at any size
  - Content-first approach
]

= Practical Application

== Design in Practice

Scandinavian design has shaped global aesthetics across many domains:

+ *Architecture* -- Open floor plans, large windows, natural wood
+ *Product design* -- IKEA's democratic approach to furniture
+ *Digital interfaces* -- Spotify's clean dark UI

#mitex(`\text{Beauty} = \lim_{n \to \infty} (\text{Simplicity}_n + \text{Function}_n)`)

== Working with Type

Typography in Nordic design favors sans-serif faces with generous tracking.

#hygge-card([Typography Guidelines])[
  Use a limited type scale. Two weights are sufficient: *regular* for body text and *bold* for emphasis. Let whitespace do the heavy lifting.
]

#separator()

```python
# Nordic design in code: do more with less
def nordic_palette():
    return {
        "primary": "#37474F",
        "accent": "#80CBC4",
        "background": "#ECEFF1",
    }
```

= Conclusion

== Key Takeaways

#cols(lazy-layout: true)[
  #hygge-card([Less is More])[
    Restraint is the hallmark of Nordic design.
    Every element earns its place. Remove until
    you cannot remove anything else.
  ]
][
  #hygge-card([Light & Space])[
    Embrace whitespace as a design element,
    not empty space. Let content breathe and
    the eye rest between ideas.
  ]
]

#focus-slide[
  _"Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away."_

  #text(size: 0.5em, weight: "regular")[— Antoine de Saint-Exupery]
]

#ending-slide[Tack sa mycket!]
