#import "@preview/typsium:0.3.2": ce

#set page(width: 210mm, height: 297mm, margin: 22mm)
#set text(size: 11pt)

= Typsium chemical-notation example

These examples demonstrate the package grammar; they are not a chemistry validation.

- Reaction: #ce("2H2 + O2 -> 2H2O")
- Aggregation states: #ce("NaCl(aq) + He(g) + C(s)")
- Isotope and charge: #ce("^227_90Th+")
- Labeled equilibrium: #ce("A <=>[condition] B")
