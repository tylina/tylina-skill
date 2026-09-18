#import "@preview/fretwork:0.4.0": tab, theme

#set page(width: 180mm, height: 110mm, margin: 14mm)
#set text(font: "Libertinus Serif", size: 10pt)

#let tab-theme = theme(
  font: "Libertinus Serif",
  staff-space: 2.8mm,
)

= Guitar tablature

This source keeps frets, strings, rhythm, repeats, and chord labels editable.

#tab(
  theme: tab-theme,
  time: (4, 4),
  ```
  |: q 0/6 3/6 5/6 3/6 | @G5 q 3/6 5/6 3/6 0/6 :|
  ```,
)
