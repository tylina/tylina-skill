// Letterpress Guild Theme -- Demo
// "The Art of the Printed Word: A History of Typography & Publishing"
// Publishing, editorial, and typographic craft content

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("New Computer Modern", "Songti SC"), size: 20pt)

#show: letterpress-guild-theme.with(
  aspect-ratio: "16-9",
  footer: [LETTERPRESS GUILD],
  config-common(breakable: false),
  config-info(
    title: [The Art of the Printed Word],
    subtitle: [A Journey Through Typography, Publishing, and the Craft of Print],
    author: [The Letterpress Guild Society],
    date: datetime.today(),
    institution: [Guild of Master Printers],
  ),
)

#title-slide()

#outline-slide()

= The Gutenberg Revolution

== The Birth of Movable Type

#cols(columns: (2fr, 1fr), gutter: 1.2em)[
  Johannes Gutenberg's invention of movable type around 1440 fundamentally
  transformed Western civilization. The ability to mass-produce books reduced
  the cost of knowledge by orders of magnitude and democratized literacy
  across Europe within a single century.

  #v(0.4em)
  #impression-box[
    Before Gutenberg, a single book required months of hand-copying by scribes.
    After: a press could produce 3,600 pages per day. The economics of
    knowledge changed overnight.
  ]
][
  #stack(
    spacing: 0.8em,
    broadside-stat([1440], [year of invention]),
    broadside-stat([3,600], [pages per workday]),
  )
]

== The Economics of Early Printing

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true)[
  #type-card([Investment], [
    A complete printing press with type required approximately 20 guilders
    -- equivalent to three years' wages for a laborer.
  ])
][
  #type-card([Output], [
    The Gutenberg Bible (1455) had a print run of 180 copies, each selling
    for 30 florins -- still costly, but transformative.
  ])
][
  #type-card([Spread], [
    By 1500, over 1,000 print shops operated across Europe, producing
    an estimated 20 million volumes.
  ])
]

== The Compositor's Art

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  === The Type Case

  #galley-card([Compositor's Tools], [
    The upper case held capital letters; the lower case held minuscules.
    This physical arrangement gave us the terms we still use today:
    "uppercase" and "lowercase."
  ])
][
  === Setting Type

  #compositor-list[
    - Sort individual letters from the type case into a composing stick
    - Justify each line by inserting thin lead spacers between words
    - Lock the assembled forme into a metal chase for the press bed
    - Ink the forme with leather balls, then pull the press lever
  ]
]

= The Golden Age of Typography

== Master Typographers

#stack(
  spacing: 0.8em,
  pull-quote([
    Type is a beautiful group of letters, not a group of beautiful letters.
  ], cite: [Matthew Carter, Type Designer]),
  leading-divider(),
  cols(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    [
      === Renaissance Masters

      - Nicolas Jenson (Venice, 1470)
      - Aldus Manutius (italic type, 1501)
      - Claude Garamond (Paris, 1530s)
      - William Caslon (London, 1722)
    ],
    [
      === Modern Pioneers

      - Giambattista Bodoni (Parma, 1798)
      - John Baskerville (Birmingham, 1757)
      - Frederic Goudy (USA, 1903)
      - Jan Tschichold (Switzerland, 1928)
    ],
  ),
)

== Typeface Classification

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true)[
  #type-card([Serif / Roman], [
    Originated from inscribed Roman capitals. Features: bracketed serifs,
    moderate stroke contrast, classical proportions. Examples: Garamond,
    Caslon, Times New Roman.
  ])
][
  #type-card([Sans Serif], [
    Emerged in the 19th century for display. Features: no serifs, uniform
    stroke width, geometric or humanist forms. Examples: Futura, Helvetica,
    Gill Sans.
  ])
][
  #type-card([Blackletter], [
    Dominant in Northern Europe until 1940s. Features: angular strokes,
    heavy texture, dense page color. Examples: Textura, Fraktur,
    Schwabacher.
  ])
]

== The Anatomy of Type

#press-box[
  #grid(columns: (1fr, 1fr), column-gutter: 2em,
    [
      === Vertical Metrics

      #compositor-list[
        - Ascender: the stroke rising above x-height (b, d, h, k)
        - X-height: the height of lowercase letters without ascenders
        - Baseline: the invisible line on which letters rest
        - Descender: the stroke falling below baseline (g, p, q, y)
      ]
    ],
    [
      === Horizontal Measures

      #compositor-list[
        - Em: a unit equal to the current point size of the typeface
        - Set width: the total horizontal space a character occupies
        - Kerning: adjustment of space between specific letter pairs
        - Tracking: uniform spacing adjustment across a text block
      ]
    ],
  )
]

= The Press Room

== A Day in the Print Shop

#focus-slide[
  The smell of ink and oil, the clatter of type being sorted,
  the deep thud of the press -- these were the sounds and
  sensations of a revolution in human communication.
]

== Production Metrics: Historical Print Shops

#stack(
  spacing: 0.8em,
  cols(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [#broadside-stat([250], [sheets per hour], accent: palette.secondary)],
    [#broadside-stat([12], [hours per workday])],
    [#broadside-stat([6], [months per Bible])],
  ),
  fleuron-divider(),
  cols(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    [
      #impression-box(accent: palette.secondary)[
        *Hand press era (1450--1800)*: A skilled pressman and his partner could
        produce 250 impressions per hour, working a grueling 12-hour day.
      ]
    ],
    [
      #impression-box(accent: palette.accent)[
        *Steam press era (1814+)*: Friedrich Koenig's steam press for The Times
        multiplied output to 1,100 sheets per hour -- a 4x improvement overnight.
      ]
    ],
  ),
)

== The Printer's Marks

#cols(columns: (1fr, 1fr), gutter: 1.4em)[
  === Guild Marks and Devices

  Printers used distinctive devices as trademarks and quality guarantees,
  evolving from simple monograms into elaborate emblems:

  #compositor-list[
    - The orb and cross (divine authority over knowledge)
    - The anchor and dolphin (Aldus Manutius -- festina lente)
    - The tree of knowledge (Elzevir family of Amsterdam)
    - The hand and star (early German printers)
  ]
][
  === Colophon Tradition

  #galley-card([The Colophon], [
    The colophon -- from Greek "finishing touch" -- appeared at the end of
    early printed books. It recorded the printer, date, location, and often
    a brief prayer or motto. Modern publishers continue this tradition on
    their copyright pages.
  ])

  #v(0.4em)
  #colophon-tag[Impressum: Guild of Master Printers, Anno MMXXV]
]

= The Modern Era

== Digital Typography Revolution

#stack(
  spacing: 0.8em,
  pull-quote([
    The computer has not replaced the art of typography -- it has
    democratized it. But democracy without education is merely chaos
    with better tools.
  ], cite: [Erik Spiekermann, typographer]),
  cols(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    lazy-layout: true,
    [
      #type-card([The PostScript Era], [
        Adobe's PostScript (1984) and the LaserWriter made professional typography
        accessible. Suddenly, anyone with a Macintosh could set type -- for
        better or worse.
      ])
    ],
    [
      #type-card([The OpenType Era], [
        OpenType (1996) unified font technology across platforms and enabled
        advanced features: ligatures, swashes, small caps, and contextual
        alternates -- all in a single font file.
      ])
    ],
  ),
)

== Publishing Industry Today

#stack(
  spacing: 0.8em,
  cols(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [#broadside-stat([2.2M], [titles per year], accent: palette.primary)],
    [#broadside-stat([\$28B], [US book revenue])],
    [#broadside-stat([32%], [digital share])],
  ),
  impression-box(accent: palette.secondary)[
    The global publishing industry produces over 2.2 million new titles annually.
    Despite predictions of print's demise, physical books still account for 68%
    of trade revenue. The codex format -- invented around 100 CE -- remains
    humanity's most durable information technology.
  ],
)

== The Future of the Printed Word

#cols(columns: (1fr, 1fr), gutter: 1.5em)[
  === Enduring Print

  - Fine press and letterpress revival
  - Artist's books and limited editions
  - Print-on-demand economics
  - Tactile luxury in a digital age

  #v(0.3em)
  #colophon-tag[Est. 1455 -- Print Lives On]
][
  === New Frontiers

  - Variable fonts and responsive typography
  - AI-assisted typesetting and layout
  - Augmented reality overlays on print
  - Sustainable printing technologies

  #v(0.3em)
  #colophon-tag[The Guild Endures]
]

#ending-slide[Finis Coronat Opus.]
