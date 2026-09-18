#import "@preview/synkit:0.1.0": tree

#set page(width: 150mm, height: 110mm, margin: 10mm)
#set text(size: 11pt)

#align(center)[
  *A bracket-authored phrase-structure tree*
  #v(4mm)

  #tree(
    "[S [NP [Det the] [N cat]] [VP [V sat] [PP [P on] [NP [Det the] [N mat]]]]]",
  )
]
