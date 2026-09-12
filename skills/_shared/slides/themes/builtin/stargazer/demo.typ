#import "@preview/touying:0.7.4": *
#import themes.stargazer: *
#import "@preview/mitex:0.2.7": *

#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Stargazer Theme Demo],
    subtitle: [Versatile and Polished],
    author: [SeaSlides Team],
    date: datetime.today(),
    institution: [Open Presentation Lab],
    logo: emoji.school,
  ),
  config-common(breakable: false),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#outline-slide()

= Foundations

== A Reliable Core

This is a demo of the *Stargazer* theme — versatile and suitable for everyday use.

#tblock(title: [Theorem])[
  A simple theorem.

  #mitex(`x_{n+1} = \frac{x_n + \frac{a}{x_n}}{2}`)
]

#slide(title: none)[
  *Title-free emphasis* keeps the canvas quiet while the theme chrome preserves context.

  - Navigation remains visible
  - The four-part footer keeps metadata stable
  - The progress bar communicates position
]

= Delivery

== Reading Rhythm

#cols(columns: (1fr, 1fr), gutter: 2em)[
  *Signal*

  - One clear claim per slide
  - Stable navigation across sections
  - Strong blue for structural emphasis
][
  *Support*

  - Theorem blocks for formal statements
  - Compact metadata in the footer
  - Progressive disclosure when timing matters
]

#focus-slide[
  Keep the signal visible.
]

== Progressive Disclosure

We can use `#pause` to #pause display something later.

#pause

Just like this.

#meanwhile

Meanwhile, #pause we can also use `#meanwhile` to #pause display other content synchronously.

#show: appendix

= Appendix

== Appendix

Please pay attention to the current slide number.
