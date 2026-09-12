#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Build palette for inline use
#let pal = build-palette("arctic")

#show: aurora-theme.with(
  aspect-ratio: "16-9",
  preset: "arctic",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Science of Aurora Borealis],
    subtitle: [Magnetospheric Physics and Solar Wind Interactions],
    author: [Dr. Astrid Nordstrom],
    date: datetime.today(),
    institution: [Arctic Research Institute],
  ),
)

// Font configuration belongs to the deck, not the theme entry point.
#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 18pt)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Solar Physics
// ============================================================

= Solar Physics

== The Sun-Earth Connection

#aurora-kicker([FUNDAMENTAL MECHANISM])

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      The aurora borealis originates from interactions between
      the solar wind -- a continuous stream of charged particles
      ejected from the Sun's corona -- and Earth's magnetosphere.
      When solar wind particles are funneled along magnetic field
      lines toward the poles, they collide with atmospheric gases,
      exciting atoms that then emit photons at characteristic wavelengths.
    ]
    #v(0.5em)
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      The primary colors arise from specific atomic transitions:
      green from oxygen at 557.7 nm, red from oxygen at 630 nm,
      and blue-purple from nitrogen ions.
    ]
  ]
][
  #block(width: 100%)[
    #frost-stat([SOLAR WIND SPEED], [400-800], description: [km/s typical velocity at Earth's orbit])
    #frost-stat([PARTICLE ENERGY], [1-10], description: [keV typical electron energy during substorms])
  ]
]


// ============================================================
// Slide: Key Statistics (Dark)
// ============================================================

#dark-slide(
  title: none,
  header-left: [DATA BRIEF],
  header-right: [SOLAR CYCLE 25],
)[
  #text(size: 36pt, weight: "bold")[Solar Maximum: Peak Aurora Activity.]

  #v(0.2em)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink.transparentize(50%), font: _mono-font)[NOAA SPACE WEATHER PREDICTION CENTER]

  #v(0.6em)

  #cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
    #frost-stat([KP INDEX MAX], [9], description: [Maximum geomagnetic disturbance level during extreme storms, visible at mid-latitudes.])
  ][
    #frost-stat([ALTITUDE RANGE], [90-300], description: [Kilometers above Earth's surface where auroral emissions primarily occur in the ionosphere.])
  ][
    #frost-stat([OVAL WIDTH], [500+], description: [Kilometers typical width of the auroral oval during active geomagnetic conditions.])
  ]

  #v(0.4em)

  #block(
    width: 100%,
    stroke: (left: 1.5pt + pal.accent),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: pal.ink.transparentize(20%))[
      "The aurora is Earth's own light show, powered by the violent breath of our nearest star."
    ]
  ]
]


// ============================================================
// Slide: Aurora Types (Cards)
// ============================================================

== Types of Auroral Displays

#aurora-kicker([MORPHOLOGICAL CLASSIFICATION])

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
  #aurora-card([Discrete Arcs], [
    Thin, well-defined bands stretching east-west across the sky.
    The most common form, often appearing as a single green arc
    low on the northern horizon during moderate activity.
  ])
][
  #aurora-card([Diffuse Aurora], [
    Broad, featureless glow lacking sharp boundaries.
    Caused by scattered electrons in the central plasma sheet.
    Often visible as a faint green wash across large sky areas.
  ])
][
  #aurora-card([Pulsating Aurora], [
    Patches that switch on and off with periods of 2-20 seconds.
    Driven by wave-particle interactions in the magnetosphere.
    Typically occurs in the post-midnight sector during recovery.
  ])
]


// ============================================================
// Slide: Data Table
// ============================================================

== Auroral Emission Wavelengths

#aurora-kicker([SPECTROSCOPIC DATA])

#v(0.4em)

#figure[
  #aurora-data-table(
    align: (left + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
    ("Species", "Wavelength", "Color", "Altitude", "Mechanism"),
    ([O (1S)], [557.7 nm], [Green], [100-200 km], [Forbidden transition]),
    ([O (1D)], [630.0 nm], [Red], [200-400 km], [Forbidden transition]),
    ([N2+ (1NG)], [391.4 nm], [Blue-violet], [90-150 km], [Ionization]),
    ([N2 (1PG)], [670 nm], [Red-pink], [80-120 km], [Excitation]),
    ([O+ (2P)], [732 nm], [Deep red], [250+ km], [Charge exchange]),
  )
]

#v(0.4em)

#text(size: 11pt, fill: pal.ink-muted, font: _sans-font)[
  Forbidden transitions have long radiative lifetimes (0.7s for green, 110s for red), requiring low collision rates at altitude.
]


// ============================================================
// Section 2: Magnetosphere
// ============================================================

= Magnetospheric Dynamics

== Substorm Phases

#cols(columns: (2fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #shimmer-quote([
      A magnetospheric substorm represents the fundamental cycle of energy storage
      and explosive release in Earth's magnetotail. The growth phase accumulates
      magnetic flux in the tail lobes over 30-60 minutes, followed by sudden
      reconnection that launches earthward plasma flows, precipitating electrons
      into the auroral oval within minutes.
    ], cite: "Akasofu, 1964")
  ]
][
  #block(width: 100%)[
    #polar-tag([GROWTH])
    #v(0.3em)
    #polar-tag([ONSET])
    #v(0.3em)
    #polar-tag([EXPANSION])
    #v(0.3em)
    #polar-tag([RECOVERY])
    #v(0.5em)
    #frost-box[
      Typical substorm duration: 1-3 hours from growth phase onset to recovery completion.
    ]
  ]
]


// ============================================================
// Slide: Focus Quote
// ============================================================

#focus-slide[
  "The aurora is the visible manifestation of space weather -- a reminder that we live inside the atmosphere of a star."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink.transparentize(30%))[
    -- Dr. Elizabeth MacDonald, NASA
  ]
]


// ============================================================
// Slide: Horizon Panel + Cards
// ============================================================

== Observation Sites

#grid(columns: (1fr, 1fr), column-gutter: 20pt,
  horizon-panel([Tromso, Norway], [
    Located at 69.6N latitude, directly beneath the auroral oval.
    The Tromso Geophysical Observatory has monitored aurora
    continuously since 1928. EISCAT radar facility nearby.
  ]),
  horizon-panel([Fairbanks, Alaska], [
    At 64.8N, positioned under the statistical auroral oval.
    Clear continental climate provides excellent viewing conditions.
    Home to the Poker Flat Research Range for sounding rockets.
  ]),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 20pt)[
  #aurora-card([Svalbard], [
    Unique polar location at 78N enables dayside aurora observation
    during polar night. The Kjell Henriksen Observatory operates
    year-round optical instruments monitoring cusp aurora.
  ])
][
  #aurora-card([Yellowknife, Canada], [
    Positioned beneath the auroral oval at 62.5N with flat terrain
    offering unobstructed views. Statistically, 240+ aurora-visible
    nights per year under clear skies.
  ])
]


// ============================================================
// Section 3: Space Weather
// ============================================================

= Space Weather

== Coronal Mass Ejections

#aurora-kicker([PRIMARY STORM DRIVER])

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #aurora-card([CME Characteristics], [
      Coronal mass ejections are massive expulsions of magnetized plasma
      from the solar corona. Traveling at 300-3000 km/s, they carry
      billions of tons of material and embedded magnetic fields. When
      the southward component of the CME magnetic field interacts with
      Earth's northward field, reconnection occurs, injecting energy
      into the magnetosphere.
    ])
    #v(0.5em)
    #block(width: 100%)[
      #polar-badge([Halo CME])
      #h(0.4em)
      #polar-tag([ICME])
      #h(0.4em)
      #polar-tag([Sheath])
    ]
  ]
][
  #block(width: 100%)[
    #frost-stat([TRANSIT TIME], [1-4 days], description: [Sun to Earth travel time for typical CME])
    #frost-stat([PEAK SPEED], [3,000], description: [km/s maximum recorded CME velocity])
  ]
]


// ============================================================
// Slide: Dark comparative
// ============================================================

#dark-slide(
  title: none,
  header-left: [COMPARATIVE ANALYSIS],
  header-right: [GEOMAGNETIC STORMS],
)[
  #text(size: 28pt, weight: "bold")[Moderate vs. Extreme Storms: Visibility Impact]
  #v(0.15em)
  #block(width: 50pt, height: 2pt, fill: gradient.linear(pal.accent, pal.tertiary))
  #v(0.5em)

  #cols(columns: (1fr, 1fr), gutter: 28pt)[
    #block(width: 100%, stroke: (left: 2pt + pal.accent), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[G1-G2 MODERATE]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: pal.ink)[Kp 5-6 | Auroral Oval Expansion]
      #v(0.3em)
      #text(size: 12pt, fill: pal.ink.transparentize(30%), font: _sans-font)[
        Aurora visible at 60-65 degrees latitude. Typical green arcs and
        occasional curtain forms. Power grid fluctuations possible at
        high latitudes. Satellite drag increases.
      ]
    ]
  ][
    #block(width: 100%, stroke: (left: 2pt + pal.secondary), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[G4-G5 EXTREME]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: pal.ink)[Kp 8-9 | Full Oval Displacement]
      #v(0.3em)
      #text(size: 12pt, fill: pal.ink.transparentize(30%), font: _sans-font)[
        Aurora visible at 40-45 degrees latitude. All-sky red and green
        displays with rapid motion. Power transformers at risk.
        GPS degradation. HF radio blackouts at high latitudes.
      ]
    ]
  ]

  #v(0.5em)
  #text(size: 11pt, fill: pal.ink.transparentize(25%), font: _sans-font)[
    The May 2024 G5 event produced aurora visible from Florida and the Mediterranean -- the strongest storm in 20 years.
  ]
]


// ============================================================
// Slide: Impact Grid
// ============================================================

== Societal Impacts of Space Weather

#stack(spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 16pt,
    [#aurora-card([Power Infrastructure], [
      Geomagnetically induced currents (GICs) flow through long conductors
      during storms, potentially saturating power transformers. The 1989
      Quebec blackout affected 6 million people for 9 hours.
    ])],
    [#aurora-card([Satellite Operations], [
      Increased atmospheric drag at LEO alters orbits. Enhanced radiation
      degrades solar panels and electronics. The February 2022 storm
      caused loss of 40 Starlink satellites shortly after deployment.
    ])],
  ),
  cols(columns: (1fr, 1fr), gutter: 16pt,
    [#aurora-card([Aviation & Navigation], [
      HF radio communication disruptions force polar flight rerouting.
      GPS accuracy degrades during ionospheric scintillation events.
      Airlines lose millions annually from storm-related diversions.
    ])],
    [#aurora-card([Scientific Opportunity], [
      Extreme events provide unique opportunities to study magnetospheric
      dynamics at their most energetic. Citizen science aurora reports
      complement ground-based and satellite measurements.
    ])],
  ),
)


// ============================================================
// Dark section transition
// ============================================================

#dark-slide(
  title: none,
  header-left: [SECTION 04],
  header-right: [AURORA 2025],
)[
  #v(1fr)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink.transparentize(50%), font: _mono-font)[LOOKING AHEAD]
  #v(0.6em)

  #text(size: 34pt, weight: "bold")[
    Forecasting the#linebreak()Northern Lights.
  ]
  #v(0.4em)
  #block(width: 60pt, height: 2pt, fill: gradient.linear(pal.accent, pal.secondary))

  #v(2fr)
]


// ============================================================
// Slide: Future Technology
// ============================================================

== Prediction & Monitoring Systems

#aurora-kicker([NEXT-GENERATION FORECASTING])

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
  frost-stat([DSCOVR], [L1], description: [Real-time solar wind monitor at Sun-Earth Lagrange point]),
  frost-stat([SWFO-L1], [2025], description: [Next-gen space weather observatory replacing aging DSCOVR]),
  frost-stat([AI MODELS], [30+], description: [Minutes advance warning for substorm onset using ML]),
  frost-stat([SMILE], [2025], description: [ESA-CAS X-ray imaging of magnetopause reconnection]),
)

#v(0.4em)
#crystal-divider(total-width: 100%)
#v(0.4em)

#text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
  Machine learning models trained on decades of magnetometer data can now predict substorm onset
  30-45 minutes in advance, enabling real-time aurora forecasts for photographers and power grid operators alike.
]


// ============================================================
// Slide: Technologies - Two Column
// ============================================================

== Ground-Based Instrumentation

#aurora-kicker([OBSERVATION NETWORKS])

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #aurora-card([All-Sky Cameras], [
      Fish-eye lens cameras capture the full sky dome every 10-30 seconds.
      Networks like THEMIS-ASI (20+ stations across North America) provide
      continent-scale aurora mapping for substorm tracking.
    ])
    #v(0.5em)
    #block(width: 100%)[
      #polar-tag([THEMIS])
      #h(0.4em)
      #polar-tag([MIRACLE])
      #h(0.4em)
      #polar-tag([TREx])
    ]
  ]
][
  #block(width: 100%)[
    #aurora-card([Magnetometer Chains], [
      Ground magnetometers measure perturbations in Earth's magnetic field
      caused by auroral electrojet currents. SuperMAG combines 500+ stations
      globally, providing real-time geomagnetic indices.
    ])
    #v(0.5em)
    #block(width: 100%)[
      #polar-tag([SuperMAG])
      #h(0.4em)
      #polar-tag([IMAGE])
      #h(0.4em)
      #polar-tag([INTERMAGNET])
    ]
  ]
]


// ============================================================
// Slide: Focus -- Key Message
// ============================================================

#focus-slide[
  "Every photon of aurora light tells the story of a collision between the solar wind and our planet's magnetic shield."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink.transparentize(30%))[
    -- Auroral Physics Handbook
  ]
]


// ============================================================
// Slide: Cultural Significance
// ============================================================

== Aurora in Human Culture

#shimmer-quote([
  For millennia, the northern lights have inspired awe and mythology across Arctic cultures.
  The Sami people of Scandinavia believed the aurora was the energies of departed souls,
  while the Inuit saw them as spirits playing ball with a walrus skull.
], cite: "Eather, Majestic Lights, 1980")

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Indigenous Perspectives]
    #v(0.3em)
    #text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
      #sym.diamond.filled #h(0.3em) Norse: Bifrost bridge to Asgard \
      #sym.diamond.filled #h(0.3em) Finnish: Revontulet (fox fires) \
      #sym.diamond.filled #h(0.3em) Cree: Dance of the spirits \
      #sym.diamond.filled #h(0.3em) Japanese: Harbinger of good fortune
    ]
  ]
][
  #block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Modern Aurora Tourism]
    #v(0.3em)
    #text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
      #sym.diamond.filled #h(0.3em) 8+ million aurora tourists annually \
      #sym.diamond.filled #h(0.3em) Northern Norway revenue: \$1.5B/year \
      #sym.diamond.filled #h(0.3em) Real-time apps: Aurora Alerts, My Aurora \
      #sym.diamond.filled #h(0.3em) Citizen science: Aurorasaurus project
    ]
  ]
]


// ============================================================
// Ending
// ============================================================

#ending-slide[Sub Aurora Boreali]
