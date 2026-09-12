#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/mitex:0.2.7": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== MiTeX Demo — LaTeX Equations in Typst

Inline LaTeX: The Euler identity is #mi(`e^{i\pi} + 1 = 0`).

Block LaTeX equation:

#mitex(`
  \int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
`)

Another example with fractions and sums:

#mitex(`
  \sum_{k=0}^{n} \binom{n}{k} = 2^n
`)

Code-mode call:

#let energy = mitex(`E = mc^2`)
#block(energy)
