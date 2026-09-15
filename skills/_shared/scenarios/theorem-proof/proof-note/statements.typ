#let statement(kind, title: none, body) = {
  figure(
    kind: "statement",
    supplement: kind,
    numbering: "1",
    outlined: false,
    block(
      width: 100%,
      breakable: true,
      inset: (left: 10pt, right: 10pt, top: 8pt, bottom: 8pt),
      stroke: (left: 2pt + rgb("#315b87")),
      fill: rgb("#f4f7fa"),
    )[
      #context text(weight: "semibold")[(#kind #counter(figure.where(kind: "statement")).display("1"))#if title != none { [: #title] }]
      #h(0.45em)
      #body
    ],
  )
}

#let definition(title: none, body) = statement("Definition", title: title, body)
#let lemma(title: none, body) = statement("Lemma", title: title, body)
#let theorem(title: none, body) = statement("Theorem", title: title, body)

#let proof(body) = block(
  width: 100%,
  breakable: true,
  inset: (left: 10pt, top: 5pt, bottom: 5pt),
)[
  #text(style: "italic", weight: "semibold")[Proof.]
  #h(0.45em)
  #body
  #h(1fr)
  #sym.square.stroked
]
