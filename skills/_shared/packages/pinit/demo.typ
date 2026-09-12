#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/pinit:0.2.2": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Pinit Demo — Relative Positioning

A simple #pin(1)highlighted text#pin(2) example.

#pinit-highlight(1, 2)

#pinit-point-from(2)[This is pinit!]

#v(2em)

The equation #pin(3)$E = m c^2$#pin(4) is famous.

#pinit-highlight(3, 4, fill: rgb("#ff000030"))

#pinit-point-from(4, body-dx: 8pt)[Einstein's mass-energy equivalence]
