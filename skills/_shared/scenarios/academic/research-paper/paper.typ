#let research-paper(
  title: [],
  authors: (),
  date: none,
  abstract: [],
  body,
) = {
  set page(
    paper: "a4",
    margin: (x: 24mm, top: 22mm, bottom: 24mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: ("Libertinus Serif", "New Computer Modern"), size: 10.5pt)
  set par(justify: true, leading: 0.68em)
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")
  show heading.where(level: 1): it => block(above: 1.4em, below: 0.65em)[
    #text(size: 14pt, weight: "semibold")[#it]
  ]
  show heading.where(level: 2): it => block(above: 1.05em, below: 0.45em)[
    #text(size: 11.5pt, weight: "semibold")[#it]
  ]

  align(center)[
    #text(size: 19pt, weight: "bold")[#title]
    #v(0.8em)
    #authors.map(author => author).join([ #sym.dot ])
    #if date != none { v(0.35em); text(fill: luma(38%), date) }
  ]

  block(
    inset: (x: 11pt, y: 9pt),
    fill: luma(96%),
    stroke: 0.5pt + luma(82%),
    radius: 3pt,
  )[
    #text(weight: "semibold")[Abstract.] #abstract
  ]
  v(0.65em)
  body
}
