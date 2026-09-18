#import "@preview/unify:0.8.1": num, unit

#set page(width: 15cm, height: 8.5cm, margin: 1.2cm)
#set text(size: 11pt)

// Unify 0.8.1's compact quantity and range helpers own parentheses and spacing.
// Compose semantic number and unit primitives when supplied presentation is evidence.
#let exact-quantity(value, unit-name) = [
  #num(value)#h(0.166667em)#unit(unit-name)
]

#let exact-uncertainty(value, uncertainty, unit-name) = [
  #num(value)#h(0.166667em)#sym.plus.minus#h(0.166667em)
  #num(uncertainty)#h(0.166667em)#unit(unit-name)
]

#let exact-range(lower, upper, unit-name, delimiter: [–]) = [
  #num(lower)#delimiter#num(upper)#h(0.166667em)#unit(unit-name)
]

= Source-faithful quantities

#table(
  columns: (1fr, 1fr),
  inset: 7pt,
  table.header([Source meaning], [Semantic Typst output]),
  [Symmetric uncertainty], [#exact-uncertainty("12.50", "0.08", "g")],
  [Temperature], [#exact-quantity("23.4", "celsius")],
  [Tight range], [#exact-range("1.20", "1.80", "mL")],
)
