#import "@preview/unify:0.8.1": num, qty, numrange, qtyrange

#set page(width: 210mm, height: 297mm, margin: 22mm)
#set text(size: 11pt)

= Unify scientific-notation example

The strings below keep their supplied precision and uncertainty explicit.

- Measurement: $qty("12.50+-0.08", "g")$
- Scientific value: $num("-1.32865+-0.50273e-6")$
- Numeric interval: $numrange("1.20", "1.80")$
- Quantity interval: $qtyrange("1e3", "2e3", "meter per second squared", per: "/")$
