#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set page(width: 190mm, height: 105mm, margin: 14mm)
#set text(size: 11pt)

#align(center)[
  #text(size: 20pt, weight: "bold")[An editable review flow]
  #v(4mm)

  #diagram(
    node-stroke: 0.8pt + rgb("35536f"),
    node-fill: rgb("eef5fb"),
    spacing: 4em,
    edge-stroke: 0.9pt + rgb("35536f"),
    node((0, 0), [Draft], radius: 1.8em),
    edge([validate], "-|>"),
    node((1, 0), [Review], radius: 1.8em),
    edge([publish], "-|>"),
    node((2, 0), [Release], radius: 1.8em),
    edge((1, 0), (0, 0), [revise], "-|>", bend: 42deg),
  )
]
