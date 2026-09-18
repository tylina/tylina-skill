#import "@preview/cetz:0.5.2"

#set page(width: 140mm, height: 75mm, margin: 10mm)
#set text(size: 11pt)

#align(center)[
  *A custom, source-controlled system sketch*
  #v(5mm)

  #cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.35, fill: blue.lighten(70%))
    line((0.4, 0), (3.6, 0), mark: (end: "stealth"))
    content((2, 0.35), [$f(x)$])
    rect((3.6, -0.45), (5, 0.45), radius: 0.1, fill: green.lighten(75%))
    content((4.3, 0), [Output])
  })
]
