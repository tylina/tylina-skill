#import "@preview/quill:0.8.0": quantum-circuit, lstick, rstick, ctrl, targ

#set page(width: 210mm, height: 297mm, margin: 22mm)
#set text(size: 11pt)

= Quill quantum-circuit example

The supplied gate sequence remains the semantic source of this rendered circuit.

#align(center)[
  #quantum-circuit(
    lstick($|0〉$), $H$, ctrl(1), rstick($(|00〉 + |11〉) / sqrt(2)$, n: 2), [\ ],
    lstick($|0〉$), 1, targ(), 1,
  )
]
