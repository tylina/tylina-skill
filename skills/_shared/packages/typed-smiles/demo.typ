#import "@preview/typed-smiles:0.11.0": smiles

#set page(width: 190mm, height: 105mm, margin: 14mm)
#set text(size: 10.5pt)

#align(center)[
  #text(size: 19pt, weight: "bold")[Molecular structures from source]
]
#v(5mm)

#table(
  columns: (1fr, 1fr, 1fr),
  gutter: 8mm,
  align: center + horizon,
  stroke: none,
  [*Ethanol*], [*Alanine*], [*Benzene*],
  [#smiles("CCO", scale: 1.1)],
  [#smiles(
    "CC(N)C(=O)O",
    style: "acs",
    font: "New Computer Modern",
    scale: 1.1,
  )],
  [#smiles("c1ccccc1", aromatic: "circle", scale: 1.1)],
)
