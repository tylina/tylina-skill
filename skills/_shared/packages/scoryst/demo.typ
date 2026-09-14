#import "@preview/scoryst:0.2.0": score, pages

#set page(width: 210mm, height: 297mm, margin: 20mm)
#set text(size: 11pt)

#let tune = "X:1\nT:Scale study\nM:4/4\nL:1/4\nK:C\nCDEF|GABc|cBAG|FEDC|"

= Scoryst staff-notation example

The ABC source remains editable text. The score below is rendered by the package's bundled
Verovio WebAssembly plugin.

#score(
  tune,
  width: 100%,
  alt: "A short C-major scale study in staff notation",
)

Rendered score pages: #pages(tune)

