#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

// Font setup: verified local sans families with CJK coverage
#set text(font: ("Avenir Next", "Arial", "Noto Sans SC"), size: 18pt)

// Build palette for inline use in demo
#let pal = build-palette("lapis")

// Self-contained facade study for the star-frame component demo.
#let demo-arch-svg = bytes(
  "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 640 360'>" +
  "<rect width='640' height='360' fill='" + pal.lapis.to-hex() + "'/>" +
  "<rect x='28' y='28' width='584' height='304' fill='none' stroke='" + pal.gold.to-hex() + "' stroke-width='4'/>" +
  "<path d='M70 304V185Q145 70 220 185V304' fill='none' stroke='" + pal.paper.to-hex() + "' stroke-width='7' opacity='.9'/>" +
  "<path d='M242 304V160Q320 38 398 160V304' fill='none' stroke='" + pal.gold.to-hex() + "' stroke-width='8'/>" +
  "<path d='M420 304V185Q495 70 570 185V304' fill='none' stroke='" + pal.paper.to-hex() + "' stroke-width='7' opacity='.9'/>" +
  "<polygon points='320,76 332,108 366,96 352,128 384,140 352,152 366,184 332,172 320,204 308,172 274,184 288,152 256,140 288,128 274,96 308,108' fill='" + pal.turquoise.to-hex() + "' opacity='.82'/>" +
  "<circle cx='320' cy='140' r='18' fill='none' stroke='" + pal.paper.to-hex() + "' stroke-width='4'/>" +
  "<circle cx='145' cy='220' r='12' fill='" + pal.gold.to-hex() + "'/>" +
  "<circle cx='495' cy='220' r='12' fill='" + pal.gold.to-hex() + "'/>" +
  "<line x1='52' y1='306' x2='588' y2='306' stroke='" + pal.turquoise.to-hex() + "' stroke-width='6'/>" +
  "<line x1='52' y1='318' x2='588' y2='318' stroke='" + pal.gold.to-hex() + "' stroke-width='3'/>" +
  "</svg>",
)

#show: silk-road-theme.with(
  aspect-ratio: "16-9",
  preset: "lapis",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Mathematics of Islamic Art],
    subtitle: [Geometry, Architecture, and Pattern Theory on the Silk Road],
    author: [Dr. Amina Khalil],
    date: datetime.today(),
    institution: [Silk Road Institute],
  ),
)

// ===== Cover =====

#title-slide()

// ============================================================
// Section 1: Geometry
// ============================================================

= Sacred Geometry

== The Language of Infinite Pattern

#text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: _mono-font)[FOUNDATIONS OF ISLAMIC GEOMETRIC ART]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #mosaic-card([Circle Division], [
    Every Islamic pattern begins with the division of a circle. Compass and straightedge -- the only tools needed to generate infinite complexity from simple axioms.
  ])
][
  #mosaic-card([Symmetry Groups], [
    Exactly 17 wallpaper groups exist in mathematics. Islamic artisans discovered all 17 through pure intuition centuries before group theory formalized them.
  ], accent: pal.lapis)
][
  #mosaic-card([Star Polygons], [
    The 8-pointed star (khatam) emerges from two overlapping squares. The 12-pointed star from three. Each encodes a different rotational symmetry.
  ], accent: pal.gold)
]

// ============================================================
// Slide: Dark slide -- Key Statistics
// ============================================================

#dark-slide(
  title: none,
  ghost: [17],
  ghost-dy: 10pt,
  ghost-dx: -24pt,
  ghost-size: 190pt,
  header-left: [Geometry in Numbers],
  header-right: [SILK ROAD INSTITUTE 2025],
)[
  #text(size: 38pt, weight: "bold")[17 wallpaper groups.#linebreak()All discovered by artisans.]

  #v(0.3em)

  #text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.paper.transparentize(40%), font: _mono-font)[MATHEMATICAL COMPLETENESS]

  #v(0.5em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    block(width: 100%)[
      #text(size: 42pt, weight: "bold", fill: pal.gold)[1400+]
      #v(0.1em)
      #text(size: 11pt, fill: pal.paper.transparentize(40%), font: _sans-font)[
        Years of continuous geometric tradition, from 7th century Damascus to modern Marrakech.
      ]
    ],
    block(width: 100%)[
      #text(size: 42pt, weight: "bold", fill: pal.gold)[5]
      #v(0.1em)
      #text(size: 11pt, fill: pal.paper.transparentize(40%), font: _sans-font)[
        Primary star types form the vocabulary: 6, 8, 10, 12, and 16-pointed constructions.
      ]
    ],
    block(width: 100%)[
      #text(size: 42pt, weight: "bold", fill: pal.gold)[#sym.infinity]
      #v(0.1em)
      #text(size: 11pt, fill: pal.paper.transparentize(40%), font: _sans-font)[
        Tessellations extend infinitely in all directions -- a visual metaphor for divine infinity.
      ]
    ],
  )
]

// ============================================================
// Section 2: Architecture
// ============================================================

= Architecture

== Samarkand: Jewel of the Silk Road

#text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: _mono-font)[REGISTAN SQUARE]

#v(0.3em)

#grid(columns: (2fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: typo.lead, fill: pal.ink)[
      The Registan in Samarkand represents the apex of Timurid architecture. Three madrasas face each other across a public square, each facade a symphony of geometric tilework.
    ]
    #v(0.5em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      The tilework employs a technique called *girih* -- interlocking geometric shapes that create apparently complex patterns from simple repeated units. Recent research has shown these patterns exhibit quasi-crystalline symmetry, predating Penrose tiles by five centuries.
    ]
  ],
  block(width: 100%)[
    #stack(
      spacing: .8em,
      star-frame(demo-arch-svg, height: 88pt, caption: [Geometric facade study]),
      minaret-stat([HEIGHT], [50m], description: [Ulugh Beg Madrasa minaret]),
      stack(
        dir: ltr,
        spacing: 4pt,
        tile-tag([Timurid], color: pal.lapis),
        tile-tag([15th Century], color: pal.turquoise),
        tile-tag([UNESCO], color: pal.gold),
      ),
    )
  ],
)

// ============================================================
// Slide: Architectural Elements
// ============================================================

== Structural Mathematics

#text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: _mono-font)[MUQARNAS AND VAULTING]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: typo.lead, weight: "bold", fill: pal.ink)[Muqarnas Vaulting]
    #v(0.3em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      Muqarnas are three-dimensional geometric compositions used to fill the zone of transition between a square base and a circular dome. Each cell is a mathematically precise fragment that contributes to the whole. The system is modular -- a finite set of tile shapes generates infinite variation.
    ]
    #v(0.5em)
    #arabesque-quote([Architecture is frozen music -- and Islamic architecture is frozen mathematics.], cite: [Oleg Grabar])
  ],
  block(width: 100%)[
    #text(size: typo.lead, weight: "bold", fill: pal.ink)[Pointed Arches]
    #v(0.3em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      The pointed arch -- predating Gothic architecture by centuries -- distributes weight more efficiently than the semicircular Roman arch. Its geometry is generated by two intersecting circles, with their centers offset along the spring line.
    ]
    #v(0.4em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      Rotational symmetry order of a regular star polygon #mi(`\{n/k\}`):
      #mitex(`\text{Symmetry order} = \frac{n}{\gcd(n,k)}`)
    ]
    #v(0.5em)
    #mosaic-card([Key Insight], [
      The ratio of height to span in the pointed arch is variable, allowing architects to cover rectangular spaces with vaults of equal height -- impossible with semicircular arches.
    ], accent: pal.terra)
  ],
)

// ============================================================
// Section 3: Pattern Theory
// ============================================================

= Pattern Theory

== The Grammar of Ornament

#text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: _mono-font)[CONSTRUCTION PRINCIPLES]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
  block(width: 100%, stroke: (left: 3pt + pal.gold), inset: (left: 1em, y: 0.4em))[
    #text(size: 28pt, weight: "bold", fill: pal.gold-text, style: "italic")[1.]
    #v(0.1em)
    #text(size: typo.lead, weight: "bold", fill: pal.ink)[Tessellation]
    #v(0.2em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      The plane must be covered without gaps or overlaps. This constraint limits possible base geometries to triangles, squares, and hexagons.
    ]
  ],
  block(width: 100%, stroke: (left: 3pt + pal.turquoise), inset: (left: 1em, y: 0.4em))[
    #text(size: 28pt, weight: "bold", fill: pal.turquoise, style: "italic")[2.]
    #v(0.1em)
    #text(size: typo.lead, weight: "bold", fill: pal.ink)[Interlace]
    #v(0.2em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      Lines weave over and under each other, creating the illusion of depth. This transforms flat geometry into spatial complexity.
    ]
  ],
  block(width: 100%, stroke: (left: 3pt + pal.lapis), inset: (left: 1em, y: 0.4em))[
    #text(size: 28pt, weight: "bold", fill: pal.lapis, style: "italic")[3.]
    #v(0.1em)
    #text(size: typo.lead, weight: "bold", fill: pal.ink)[Arabesque]
    #v(0.2em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      Organic vegetal forms (islimi) intertwine with geometric frames, representing the complementarity of natural and mathematical order.
    ]
  ],
)

// ============================================================
// Slide: Dark -- Girih Tiles
// ============================================================

#dark-slide(
  title: none,
  ghost: [5],
  ghost-size: 200pt,
  ghost-dy: 8pt,
  header-left: [Pattern Theory],
  header-right: [GIRIH TILES],
)[
  #text(size: 34pt, weight: "bold")[Five shapes.#linebreak()Infinite patterns.]

  #v(0.15em)

  #text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.paper.transparentize(40%), font: _mono-font)[THE GIRIH TILE SET]

  #v(0.5em)

  #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
    block(width: 100%, stroke: (top: 2pt + pal.gold), inset: (top: 0.5em))[
      #text(size: 12pt, weight: "bold", fill: pal.paper)[Decagon]
      #v(0.2em)
      #text(size: 10pt, fill: pal.paper.transparentize(40%), font: _sans-font)[10 sides, 144 degrees]
    ],
    block(width: 100%, stroke: (top: 2pt + pal.gold), inset: (top: 0.5em))[
      #text(size: 12pt, weight: "bold", fill: pal.paper)[Pentagon]
      #v(0.2em)
      #text(size: 10pt, fill: pal.paper.transparentize(40%), font: _sans-font)[5 sides, regular]
    ],
    block(width: 100%, stroke: (top: 2pt + pal.gold), inset: (top: 0.5em))[
      #text(size: 12pt, weight: "bold", fill: pal.paper)[Hexagon]
      #v(0.2em)
      #text(size: 10pt, fill: pal.paper.transparentize(40%), font: _sans-font)[Elongated, bowtie]
    ],
    block(width: 100%, stroke: (top: 2pt + pal.gold), inset: (top: 0.5em))[
      #text(size: 12pt, weight: "bold", fill: pal.paper)[Rhombus]
      #v(0.2em)
      #text(size: 10pt, fill: pal.paper.transparentize(40%), font: _sans-font)[Thin, 72/108 deg]
    ],
    block(width: 100%, stroke: (top: 2pt + pal.gold), inset: (top: 0.5em))[
      #text(size: 12pt, weight: "bold", fill: pal.paper)[Bowtie]
      #v(0.2em)
      #text(size: 10pt, fill: pal.paper.transparentize(40%), font: _sans-font)[Non-convex hexagon]
    ],
  )

  #v(0.6em)

  #block(
    width: 100%,
    stroke: (left: 3pt + pal.gold.transparentize(40%)),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: pal.paper.transparentize(20%))[
      "In 2007, physicists Lu and Steinhardt demonstrated that girih patterns on the Darb-i Imam shrine in Isfahan exhibit quasi-crystalline Penrose tiling -- 500 years before its Western discovery."
    ]
  ]
]

// ============================================================
// Slide: Quote / Focus
// ============================================================

#focus-slide[
  #text(style: "italic", size: 1.2em)[
    "The artist does not draw what he sees, but what he knows to be there."
  ]
  #v(0.5em)
  #text(size: 0.5em, weight: "medium", style: "normal")[-- Owen Jones, The Grammar of Ornament, 1856]
]

// ============================================================
// Slide: Light -- Modern Applications
// ============================================================

== Contemporary Resonance

#text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: _mono-font)[PATTERN THEORY IN MODERN SCIENCE]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #mosaic-card([Quasi-Crystals], [
      Dan Shechtman won the 2011 Nobel Prize in Chemistry for discovering quasi-crystals -- materials whose atomic arrangement mirrors the aperiodic patterns found in medieval Islamic tilework.
    ], accent: pal.turquoise)
    #v(0.4em)
    #mosaic-card([Computational Design], [
      Algorithms now generate Islamic-inspired patterns procedurally, using subdivision rules that artisans encoded empirically. The grammar is finally being formalized.
    ], accent: pal.lapis)
  ],
  block(width: 100%)[
    #mosaic-card([Topology], [
      The interlace patterns of Islamic art form mathematical knots. Knot theory -- central to modern physics (string theory, quantum computing) -- finds visual precedent in 9th-century stucco.
    ], accent: pal.gold)
    #v(0.4em)
    #grid(columns: (1fr, 1fr), column-gutter: 12pt,
      minaret-stat([NOBEL], [2011], description: [Quasi-crystal discovery]),
      minaret-stat([YEARS], [500+], description: [Before Penrose tiles]),
    )
  ],
)

// ============================================================
// Slide: Caravan divider usage
// ============================================================

== The Silk Road Network

#text(size: typo.kicker-size, weight: "medium", tracking: 1.8pt, fill: pal.meta-color, font: _mono-font)[TRANSMISSION OF KNOWLEDGE]

#text(size: 13pt, fill: pal.ink-light, font: _sans-font)[
  Geometric knowledge traveled the caravan routes alongside silk, spices, and paper. Each city added its own vocabulary to the shared grammar.
]

#caravan-divider()

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
  block(width: 100%, inset: (y: 0.3em))[
    #text(size: typo.body, weight: "bold", fill: pal.lapis)[Damascus]
    #v(0.2em)
    #text(size: 10pt, fill: pal.ink-light, font: _sans-font)[6-fold geometry, early knotwork]
    #v(0.2em)
    #tile-tag([7th C.], color: pal.lapis)
  ],
  block(width: 100%, inset: (y: 0.3em))[
    #text(size: typo.body, weight: "bold", fill: pal.turquoise)[Isfahan]
    #v(0.2em)
    #text(size: 10pt, fill: pal.ink-light, font: _sans-font)[Quasi-crystalline girih]
    #v(0.2em)
    #tile-tag([15th C.], color: pal.turquoise)
  ],
  block(width: 100%, inset: (y: 0.3em))[
    #text(size: typo.body, weight: "bold", fill: pal.gold-text)[Samarkand]
    #v(0.2em)
    #text(size: 10pt, fill: pal.ink-light, font: _sans-font)[Polychrome tilework]
    #v(0.2em)
    #tile-tag([14th C.], color: pal.gold)
  ],
  block(width: 100%, inset: (y: 0.3em))[
    #text(size: typo.body, weight: "bold", fill: pal.terra)[Alhambra]
    #v(0.2em)
    #text(size: 10pt, fill: pal.ink-light, font: _sans-font)[All 17 wallpaper groups]
    #v(0.2em)
    #tile-tag([14th C.], color: pal.terra)
  ],
)

// ===== Ending =====

#ending-slide[Thank You]
