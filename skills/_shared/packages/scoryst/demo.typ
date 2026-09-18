#import "@preview/scoryst:0.2.0": score, pages

#set page(width: 210mm, height: 148mm, margin: (x: 18mm, y: 14mm))
#set text(size: 10.5pt)

#let tune = ```abc
X:1
M:4/4
L:1/4
K:C
C C G G | A A G2 | F F E E | D D C2 |
w: Twin-kle twin-kle lit-tle star how I won-der what you are
G G F F | E E D2 | G G F F | E E D2 |
w: Up a-bove the world so high like a dia-mond in the sky
C C G G | A A G2 | F F E E | D D C2 |]
w: Twin-kle twin-kle lit-tle star how I won-der what you are
```.text

#align(center)[
  #text(size: 20pt, weight: "bold")[Twinkle, Twinkle, Little Star]
  #v(3pt)
  #text(size: 10pt, fill: luma(42%))[Traditional melody · simple C-major arrangement]
]

#v(6mm)

#let score-options = (
  breaks: "line",
  footer: "none",
  page-margin-top: 0,
  page-margin-bottom: 0,
)

#for page in range(1, pages(tune, options: score-options) + 1) {
  score(
    tune,
    page: page,
    options: score-options,
    width: 100%,
    alt: "Twinkle, Twinkle, Little Star in C major",
  )
}

#v(4mm)
#align(center, text(size: 8.5pt, fill: luma(48%))[
  Editable ABC source · C major · 4/4
])
