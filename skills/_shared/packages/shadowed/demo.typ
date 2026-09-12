#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/shadowed:0.3.0": shadow

#show: simple-theme.with(aspect-ratio: "16-9")

= shadowed — Box Shadows

== Basic Shadow

#shadow(dx: 3pt, dy: 3pt, blur: 6pt, fill: rgb(0, 0, 0, 12%), radius: 4pt)[
  #block(fill: white, radius: 4pt, inset: 12pt, width: 80%)[
    This block has a soft drop shadow behind it. The shadow is rendered
    using `place()` so it doesn't affect layout flow.
  ]
]

== Shadow Variations

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 24pt,
  shadow(dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 8%), radius: 6pt)[
    #block(fill: white, radius: 6pt, inset: 10pt, width: 100%)[
      *Subtle*\
      dy: 2pt, blur: 4pt
    ]
  ],
  shadow(dx: 3pt, dy: 3pt, blur: 6pt, fill: rgb(0, 0, 0, 14%), radius: 4pt)[
    #block(fill: white, radius: 4pt, inset: 10pt, width: 100%)[
      *Medium*\
      dx/dy: 3pt, blur: 6pt
    ]
  ],
  shadow(dx: 5pt, dy: 5pt, blur: 8pt, fill: rgb(0, 0, 0, 20%), radius: 4pt)[
    #block(fill: white, radius: 4pt, inset: 10pt, width: 100%)[
      *Strong*\
      dx/dy: 5pt, blur: 8pt
    ]
  ],
)

== With Custom Radius

#shadow(
  blur: 5pt,
  fill: rgb(0, 0, 0, 12%),
  radius: (top-left: 12pt, top-right: 12pt, bottom-left: 0pt, bottom-right: 0pt),
)[
  #block(
    fill: white,
    radius: (top-left: 12pt, top-right: 12pt, bottom-left: 0pt, bottom-right: 0pt),
    inset: 12pt,
    width: 60%,
  )[
    Custom corner radii — top corners rounded, bottom corners sharp.
  ]
]
