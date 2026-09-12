// Bauhaus Theme Demo -- Showcasing bold geometric design
// All slide types + all components demonstrated

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: bauhaus-theme.with(
  aspect-ratio: "16-9",
  footer: [Bauhaus Design System],
  config-info(
    title: [The Bauhaus Manifesto],
    subtitle: [Form Follows Function -- Art and Technology United],
    author: [Walter Gropius Workshop],
    institution: [Staatliches Bauhaus, Weimar],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#set text(font: ("Avenir Next", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")

#title-slide()

= Foundations

== Core Principles of Bauhaus Design

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.2em,
  form-card([Unity of Art and Craft], [
    The Bauhaus dissolved the boundary between fine art and applied craft. Every student learned both workshop techniques and artistic theory.
  ], shape: "circle", accent: palette.bauhaus-red),
  form-card([Form Follows Function], [
    Ornamentation for its own sake was rejected. Every design element must serve a structural or functional purpose.
  ], shape: "square", accent: palette.bauhaus-blue),
)

#v(0.6em)

#color-block([The ultimate aim of all creative activity is the building! -- Walter Gropius, 1919], color: palette.dark)

== The Bauhaus by Numbers

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
  primary-stat([Years Active], [14], accent: palette.bauhaus-red),
  primary-stat([Master Teachers], [39], accent: palette.bauhaus-blue),
  primary-stat([Students Enrolled], [1\,250+], accent: palette.bauhaus-yellow),
)

#v(0.8em)

#manifesto-quote([Architecture, sculpture, and painting are returning to their fundamental unity. One day they will rise toward heaven as a crystalline symbol of a new faith.], author: [Walter Gropius])

== Workshop Structure

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  grid-box([Preliminary Course], [
    - Color theory (Itten, Klee, Kandinsky)
    - Material studies and texture
    - Composition and spatial relationships
    - 6-month mandatory foundation
  ]),
  grid-box([Specialized Workshops], [
    - Metal workshop (Moholy-Nagy)
    - Weaving (Gunta Stolzl)
    - Furniture (Marcel Breuer)
    - Typography (Herbert Bayer)
  ], accent: palette.bauhaus-red),
)

= Visual Language

== Geometric Vocabulary

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
  module-highlight([Circle], [
    Represents cosmic energy, fluid movement, and the color blue in Kandinsky's theory. The most dynamic of the three primary forms.
  ], accent: palette.bauhaus-blue),
  module-highlight([Triangle], [
    Associated with aggression, sharpness, and yellow. Points upward toward aspiration. The most directional form.
  ], accent: palette.bauhaus-yellow),
  module-highlight([Square], [
    Stability, weight, and red. The most grounded form. Represents matter and earthbound existence.
  ], accent: palette.bauhaus-red),
)

== Design Classification

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  stack(spacing: 0.8em,
    form-card([Typography], [
      Universal typeface: geometric sans-serif. No capitals. Asymmetric layouts. Red and black ink on white stock.
    ], shape: "triangle", accent: palette.bauhaus-yellow),
    {
      werkstatt-divider(count: 5)
    },
  ),
  stack(spacing: 0.8em,
    form-card([Architecture], [
      Flat roofs, glass curtain walls, white surfaces, pilotis. The International Style emerged directly from Bauhaus principles.
    ], shape: "square", accent: palette.accent),
    {
      stack(dir: ltr, spacing: 6pt,
        shape-tag([Dessau], shape: "circle", color: palette.bauhaus-red),
        shape-tag([Weimar], shape: "square", color: palette.bauhaus-blue),
        shape-tag([Berlin], shape: "triangle", color: palette.bauhaus-yellow),
      )
    },
  ),
)

== Timeline of the Movement

#grid-box([Three Cities, Three Directors], [
    #grid(columns: (auto, 1fr, auto), column-gutter: 1em, row-gutter: 0.5em,
      text(weight: "bold", fill: palette.bauhaus-red.darken(40%))[1919--1925],
      [Weimar: Walter Gropius founds the school],
      shape-tag([Foundation], shape: "circle", color: palette.bauhaus-red),
      text(weight: "bold", fill: palette.bauhaus-blue.darken(40%))[1925--1932],
      [Dessau: Purpose-built campus, Hannes Meyer then Mies van der Rohe],
      shape-tag([Golden Era], shape: "square", color: palette.bauhaus-blue),
      text(weight: "bold", fill: palette.bauhaus-yellow.darken(40%))[1932--1933],
      [Berlin: Final year under political pressure, forced closure],
      shape-tag([Closure], shape: "triangle", color: palette.bauhaus-yellow),
    )
])

= Impact

== Global Legacy

#cols[
  #grid-box([Influence Map], [
    The Bauhaus diaspora after 1933 spread its principles worldwide:
    - #text(fill: palette.bauhaus-red.darken(40%), weight: "bold")[USA]: Moholy-Nagy founded the New Bauhaus in Chicago (1937)
    - #text(fill: palette.bauhaus-red.darken(40%), weight: "bold")[Israel]: Tel Aviv's White City -- 4,000+ Bauhaus buildings
    - #text(fill: palette.bauhaus-red.darken(40%), weight: "bold")[Japan]: Kawakita influenced by Bauhaus color theory
    - #text(fill: palette.bauhaus-red.darken(40%), weight: "bold")[Brazil]: Oscar Niemeyer adapted Bauhaus into tropical modernism
  ])
][
  #stack(spacing: 0.8em,
    primary-stat([UNESCO Sites], [4], accent: palette.bauhaus-red),
    primary-stat([Countries Influenced], [30+], accent: palette.bauhaus-blue),
    manifesto-quote([Less is more.], author: [Mies van der Rohe]),
  )
]

== Key Figures and Contributions

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
  form-card([Kandinsky], [
    Point and Line to Plane. Taught the relationship between geometric forms and color. Blue = circle, yellow = triangle, red = square.
  ], shape: "circle", accent: palette.bauhaus-blue),
  form-card([Paul Klee], [
    Pedagogical Sketchbook. Color gradients, rhythm in nature, the generative line. "Art does not reproduce the visible; it makes visible."
  ], shape: "triangle", accent: palette.bauhaus-yellow),
  form-card([Moholy-Nagy], [
    Light-Space Modulator. Photography, film, kinetic sculpture. Pioneered new media integration in design education.
  ], shape: "square", accent: palette.bauhaus-red),
)

== Modern Applications

#module-highlight([Contemporary Relevance], [
  #cols(columns: (1fr, 1fr), gutter: 1em)[
    - UI/UX design grids descend from Bauhaus modular systems
    - Flat design (iOS 7+, Material Design) echoes Bauhaus minimalism
    - Design thinking methodology traces to Bauhaus workshop pedagogy
  ][
    - Responsive grids = Bauhaus proportion systems
    - Component-based design = Bauhaus standardization
    - Design systems = Bauhaus Vorkurs (preliminary course)
  ]
], accent: palette.dark)

#v(0.5em)

#color-block([Every Bauhaus student must learn: you cannot separate art from technology, form from function, individual from collective.])

#focus-slide[
  Art and technology --\
  a new unity.
]

#ending-slide[Danke]
