#import "@preview/zap:0.6.0"

#set page(width: 140mm, height: 70mm, margin: 10mm)
#set text(size: 11pt)

#align(center)[
  *A source-controlled series circuit*
  #v(5mm)

  #zap.circuit({
    import zap: *
    node("input", (0, 0))
    resistor("r1", "input", (rel: (3, 0)), label: $R_1$, i: $i$)
    resistor("r2", (rel: (0, 0)), (rel: (3, 0)), label: $R_2$)
    node("output", (rel: (0, 0)))
  })
]
