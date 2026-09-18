#import "@preview/chronos:0.3.0"

#set page(width: 190mm, height: 120mm, margin: 13mm)
#set text(size: 10pt)

#align(center)[
  #text(size: 19pt, weight: "bold")[Document validation round trip]
]
#v(4mm)

#chronos.diagram({
  import chronos: *
  _par("Browser")
  _par("Tylina")
  _par("Compiler")

  _seq("Browser", "Tylina", comment: "edit source")
  _seq("Tylina", "Compiler", comment: "compile", enable-dst: true)
  _seq("Compiler", "Tylina", comment: "diagnostics", disable-src: true, dashed: true)
  _seq("Tylina", "Browser", comment: "preview", dashed: true)
})
