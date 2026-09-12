#import "@preview/touying:0.7.4": *
#import themes.aqua: *

#show: aqua-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Aqua Theme Demo],
    author: [Author Name],
    date: datetime.today(),
  ),
)

#title-slide(extra: [Decorative structure with a calm blue palette])

#outline-slide(config: config-common(detect-overflow: false))

= The Section

== Slide Title

This is a demo of the *Aqua* theme — beautiful backgrounds made with Typst's visualization capabilities.

Aqua reserves its bubbles and wave forms for structural moments, then uses a clear blue title ribbon on content slides. This keeps the deck recognizable without distracting from the message.

== Features

#cols(columns: (1fr, 1fr), gutter: 2em)[
  *Visual structure*

  - Decorative structural backgrounds
  - Calm, high-contrast blue palette
  - Restrained content-slide chrome
][
  *Presentation behavior*

  - Section-aware headers
  - Automatic outline and numbering
  - Full-frame focus slides
]

#focus-slide[Use decoration to mark the story's turning points.]

== Summary

#slide(self => [
  #align(center + horizon)[
    #stack(
      spacing: .8em,
      text(size: 3em, weight: "bold", fill: self.colors.primary)[Thank you],
      text(size: 1.1em, fill: self.colors.primary-light)[Questions and discussion],
    )
  ]
])
