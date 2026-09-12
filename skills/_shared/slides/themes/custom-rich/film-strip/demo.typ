#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 20pt)

#show: film-strip-theme.with(
  aspect-ratio: "16-9",
  footer: [PORTRA 400],
  config-info(
    title: [The Revival of Analog Photography],
    subtitle: [Film Stocks, Darkroom Techniques & Street Culture],
    author: [Leica M. Goldstein],
    institution: [School of Visual Arts],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

#outline-slide()

= Film Stocks & Color Science

== The Kodak Legacy

#cols(lazy-layout: true)[
  #contact-card([Portra 400], [
    - World's most popular portrait film stock
    - Exceptional skin tone rendering with warm bias
    - Wide exposure latitude (2 stops over, 1 under)
    - Fine grain at box speed, beautiful at 800
  ], caption: [KODAK PROFESSIONAL / 135-36])
][
  #contact-card([Ektar 100], [
    - Finest grain color negative film available
    - Ultra-vivid saturation, punchy colors
    - Ideal for landscapes and architecture
    - Low speed demands tripod or bright light
  ], caption: [KODAK PROFESSIONAL / 135-36])
]

== Fujifilm Classics

- *Superia 400* -- The everyday workhorse, slightly cool tones
- *Pro 400H* -- Discontinued legend, pastel highlights
- *Velvia 50* -- Slide film, extreme saturation for landscapes
- *Acros 100 II* -- Finest grain B\&W, beautiful tonal range

#developer-quote([There is nothing worse than a sharp image of a fuzzy concept.], author: [Ansel Adams])

== Film Stock Comparison

#figure[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, center, center, center, center),
    table.header(
      [*Stock*], [*ISO*], [*Grain*], [*Tone*], [*Best For*],
    ),
    [Portra 400], [400], [Fine], [Warm], [Portraits],
    [Ektar 100], [100], [Ultra-fine], [Vivid], [Landscape],
    [HP5 Plus], [400], [Medium], [Neutral], [Street],
    [Tri-X 400], [400], [Pronounced], [Punchy], [Journalism],
    [Velvia 50], [50], [Ultra-fine], [Saturated], [Nature],
  )
]

= Darkroom Techniques

== The Development Process

#cols[
  #stack(
    spacing: 0.8em,
    exposure-stat([6:30], [Development Time], annotation: [HC-110 Dilution B \@ 20C]),
    exposure-stat([68F], [Temperature], annotation: [+/- 0.5 degrees]),
  )
][
  #darkroom-box([Critical Steps], [
    + Load film onto reel in complete darkness
    + Pre-soak for 60 seconds in water at temp
    + Pour developer, agitate first 30 seconds
    + Gentle inversion every 30s thereafter
    + Stop bath for 30 seconds
    + Fix for 5 minutes, wash for 10
  ])
]

== Printing in the Darkroom

- *Contact sheets* -- Full roll printed 1:1 for editing
- *Enlarger alignment* -- Critical for sharp prints
- *Dodging and burning* -- Selective exposure control
- *Split-grade printing* -- Using contrast filters for tonal range
- *Selenium toning* -- Archival protection and warm tone shift

#fuji-box([Pro Tip: The Zone System], [
  Expose for the shadows, develop for the highlights. Ansel Adams' Zone System divides tonal range into 11 zones (0-X), giving precise control over negative density and print contrast.
])

= Street Photography Culture

== The Decisive Moment

#focus-slide[
  "To photograph is to hold one's breath, when all faculties converge to capture fleeting reality."

  -- Henri Cartier-Bresson
]

== Why Film for Street

#cols(lazy-layout: true)[
  #contact-card([The Mechanical Advantage], [
    - No chimping -- forces commitment to the frame
    - 36 exposures demand discipline and patience
    - Mechanical shutters work without batteries
    - Zone focusing enables fast hip shooting
  ], caption: [LEICA M6 / 35mm f\/2])
][
  #contact-card([The Aesthetic Advantage], [
    - Organic grain structure vs digital noise
    - Natural highlight rolloff prevents blown whites
    - Film latitude forgives metering mistakes
    - Each frame has physical, tangible value
  ], caption: [CONTAX T2 / ZEISS 38mm])
]

== Essential Street Cameras

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #exposure-stat([M6], [Leica], annotation: [f\/1.4 -- f\/2.8])
][
  #exposure-stat([T2], [Contax], annotation: [38mm f\/2.8])
][
  #exposure-stat([XA], [Olympus], annotation: [35mm f\/2.8])
]

== The Film Community Today

- *Lomography* -- Experimental, cross-processing, multiple exposures
- *Film Twitter/Instagram* -- Sample sharing, stock reviews
- *Lab culture* -- Independent labs offering hand-processing
- *Camera fairs* -- Trading vintage gear, bulk film sales
- *Zine scene* -- Self-published photo books on film

#film-tag([SHOOT FILM] ) #film-tag([BUY FILM NOT MEGAPIXELS]) #film-tag([GRAIN IS BEAUTIFUL])

= The Future of Analog

== Market Revival

#cols[
  #stack(
    spacing: 0.8em,
    exposure-stat([+300%], [Film Sales Growth], annotation: [2015 -- 2024 compound]),
    exposure-stat([40+], [New Film Stocks], annotation: [Launched since 2019]),
  )
][
  #fuji-box([Industry Response], [
    Kodak restarted Ektachrome E100 production in 2018. Ilford expanded capacity. New manufacturers like CineStill, Lomography, and Silberra are creating entirely new emulsions. The supply chain is rebuilding.
  ])
]

== Why Analog Endures

#developer-quote(
  [In an age of infinite digital copies, a physical negative is irreplaceable. Each frame is an unrepeatable moment frozen in silver halide crystals.],
  author: [Film Photography Quarterly],
)

#v(0.5em)

#darkroom-box([The Tangible Appeal], [
  Film photography offers what digital cannot: constraint as creative catalyst, process as meditation, and a physical artifact that connects the photographer to their craft in ways a memory card never will.
])

#ending-slide[Thank You]
