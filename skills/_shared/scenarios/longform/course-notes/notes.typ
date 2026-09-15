#let notes(title: [], subtitle: none, term: none, body) = {
  set page(
    paper: "a4",
    margin: (x: 25mm, top: 22mm, bottom: 24mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: ("Libertinus Serif", "New Computer Modern"), size: 10.8pt)
  set par(leading: 0.72em)
  set heading(numbering: "1.1")

  align(center)[
    #text(size: 23pt, weight: "bold", fill: rgb("#283f59"))[#title]
    #if subtitle != none { v(0.35em); text(size: 13pt, fill: luma(38%), subtitle) }
    #if term != none { v(0.3em); text(fill: luma(45%), term) }
  ]
  v(1em)
  body
}

#let note-box(kind, color, body) = block(
  width: 100%,
  breakable: true,
  inset: 9pt,
  stroke: (left: 2pt + color),
  fill: color.lighten(88%),
)[
  #text(weight: "semibold", fill: color.darken(18%))[#kind]
  #h(0.45em)
  #body
]

#let definition(body) = note-box([Definition], rgb("#3d6d9a"), body)
#let example(body) = note-box([Example], rgb("#6f5a93"), body)
#let question(body) = note-box([Review], rgb("#8a6332"), body)
