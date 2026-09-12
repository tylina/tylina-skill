#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [Simple Theme Demo],
  config-common(breakable: false),
)

#title-slide[
  = Simple Theme Demo
  #v(2em)

  SeaSlides Team #h(1em)
  Typst Community #h(1em)

  #datetime.today().display()
]

= Section One

== Introduction

This is a demo of the *Simple* theme from Touying.

- Clean and minimal design
- Good for quick presentations
- Easy to customize

#pause

Key features:
- Header shows current section
- Footer shows custom text
- Focus slides for emphasis

== Two-column Content

#cols(columns: (1fr, 1fr), gutter: 2em)[
  *Structure*

  - Section context stays visible
  - Slide titles anchor the reading order
  - Generous whitespace separates ideas
][
  *Restraint*

  - One teal accent carries emphasis
  - Lightweight chrome protects attention
  - Standard Typst content stays portable
]

#focus-slide[
  _Focus on this!_

  This is very important.
]

= Section Two

== Progressive Disclosure

- Establish the context
- Reveal the decision criteria
- Hold the conclusion for emphasis

#pause

The final reveal confirms the recommended direction.
