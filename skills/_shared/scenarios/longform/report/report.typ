#let report(
  title: [],
  subtitle: none,
  author: [],
  organization: none,
  date: [],
  body,
) = {
  set page(
    paper: "a4",
    margin: (x: 24mm, top: 23mm, bottom: 24mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: ("Libertinus Serif", "New Computer Modern"), size: 10.8pt)
  set par(justify: true, leading: 0.72em)
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => block(
    above: 1.5em,
    below: 0.7em,
    stroke: (bottom: 0.7pt + rgb("#7593ae")),
    inset: (bottom: 5pt),
  )[#text(size: 15pt, weight: "semibold", it)]

  page(
    margin: (x: 28mm, top: 34mm, bottom: 28mm),
    numbering: none,
  )[
    #block(width: 32mm, height: 3pt, fill: rgb("#32648e"))
    #v(1.1cm)
    #text(size: 25pt, weight: "bold", fill: rgb("#18354c"))[#title]
    #if subtitle != none { v(0.4cm); text(size: 14pt, fill: luma(38%), subtitle) }
    #v(1fr)
    #grid(
      columns: (auto, 1fr),
      column-gutter: 12pt,
      row-gutter: 8pt,
      text(weight: "semibold")[Prepared by], author,
      text(weight: "semibold")[Organization], if organization == none { [—] } else { organization },
      text(weight: "semibold")[Date], date,
    )
  ]
  body
}

#let callout(title, body) = block(
  width: 100%,
  inset: 10pt,
  fill: rgb("#f2f6f9"),
  stroke: 0.6pt + rgb("#b9cbd9"),
  radius: 3pt,
)[
  #text(weight: "semibold", fill: rgb("#244b69"))[#title]
  #v(0.25em)
  #body
]
