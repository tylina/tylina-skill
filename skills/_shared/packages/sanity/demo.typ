#import "@preview/sanity:0.2.0": sanity

#set page(paper: "a5", margin: 17mm)
#set text(size: 10.5pt)
#show: sanity.with(bibliography: read("references.bib"))

= Manuscript preflight

This compile-verified example cites one synthetic record @used-example.

#figure(
  rect(width: 100%, height: 18mm, fill: rgb("e9f1f7"), radius: 2mm),
  caption: [A deliberately unreferenced figure for the audit report],
) <fig:unreferenced>

#bibliography("references.bib")
