#let data-table(
  caption: none,
  columns: auto,
  header: (),
  rows: (),
  align: left,
  source: none,
  note: none,
) = figure(
  block(width: 100%)[
    #table(
      columns: columns,
      align: align,
      inset: (x: 7pt, y: 6pt),
      stroke: (x: none, y: 0.45pt + luma(72%)),
      fill: (_, y) => if y == 0 {
        rgb("#e8eef6")
      } else if calc.odd(y) {
        luma(97%)
      },
      table.header(..header.map(cell => strong(cell))),
      ..rows.flatten(),
    )
    #if source != none {
      v(5pt)
      text(size: 8.5pt, fill: luma(35%), source)
    }
    #if note != none {
      linebreak()
      text(size: 8.5pt, fill: luma(35%), note)
    }
  ],
  caption: caption,
)
