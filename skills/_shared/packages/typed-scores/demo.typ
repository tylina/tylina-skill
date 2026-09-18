#import "@preview/typed-scores:0.5.1": bar, score

#set page(width: 210mm, height: 297mm, margin: 22mm)
#set text(size: 11pt)

= Typed Scores Western-notation example

#bar(
  "g4:e a4:e b4:e c5:e d5:e e5:e f#5:e g5:e",
  lyrics: "Sing __ through _ the _ night __",
  clef: "treble",
  key: "G",
  time: "4/4",
)

#score(
  clef: "treble",
  time: "4/4",
  bars: (
    (notes: "c5:q d5:q e5:q f5:q"),
    (notes: "g5:h e5:h"),
  ),
)

The 0.5.1 cue group keeps a small quoted passage's rhythm while rendering it at cue size:

#score(
  clef: "treble",
  time: "4/4",
  bars: (
    (notes: "cue { c5:e d } e5:q f5:q g5:q"),
  ),
)
