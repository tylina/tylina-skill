#import "@preview/eggs:0.9.0": *
#import abbreviations: pl, ins

#set page(width: 210mm, height: 297mm, margin: 22mm)
#set text(size: 11pt)
#show: eggs

= Eggs linguistic-example demo

#example[
  + - primer  s    gloss-ami
    - example with gloss-#pl.#ins
    'an/the example with glosses' #ex-label(<gl>)
  + \*example without glosses
]

The first supplied example is referenced as @gl.
