#import "@preview/touying:0.7.4": *
#import themes.metropolis: *
#import "@preview/mitex:0.2.7": *

#set text(font: ("IBM Plex Sans", "Arial"), weight: "light")
#show math.equation: set text(font: "New Computer Modern Math")
#set strong(delta: 100)
#set par(justify: true)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Metropolis Theme Demo],
    subtitle: [A Modern Presentation Theme],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
    logo: emoji.city,
  ),
)

#title-slide()

#outline-slide(level: 1, numbered: (false,))

= Orientation

== Visual System

Metropolis adapts the Beamer original into a disciplined Typst presentation system.

- Dark title chrome keeps each topic visible
- Orange progress marks show position without adding clutter
- Light sans-serif typography leaves technical content prominent

== Academic Mathematics

The quiet canvas gives display equations a clear focal point:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

#pause

The same system keeps inline notation such as #mi(`E = mc^2`) readable in the surrounding argument.

= Structure

== Deck Anatomy

#cols(columns: (1fr, 1fr), gutter: 3em)[
  *Stable chrome*

  - Current topic in the header
  - Institution and count in the footer
][
  *Purposeful motion*

  - Progress advances with the argument
  - Focus slides pause the numbered flow
]

#speaker-note[
  + Connect each chrome element to its navigation purpose.
  + Notes appear only when `show-notes-on-second-screen` is configured.
]

#focus-slide[Progress should orient the audience, not distract it.]

== Takeaway

Metropolis works best when the visual system remains stable and the content carries the variation.

- Use section dividers for major turns
- Reserve reveals for genuine sequencing
- Keep the footer denominator consistent

= Reference

== Counter Check

The outline, progress bar, and final counter now describe the same nine-slide narrative.
