#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

// Font configuration
#set text(font: ("Arial", "Heiti SC"), size: 18pt)

// Build palette for inline use
#let demo-preset = sys.inputs.at("preset", default: "observatory")
#let pal = build-palette(demo-preset)

#show: celestial-theme.with(
  aspect-ratio: "16-9",
  preset: demo-preset,
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Exoplanet Detection Methods & Recent Discoveries],
    subtitle: [A Survey of Techniques from Radial Velocity to Direct Imaging],
    author: [Dr. Cassandra Vega],
    date: datetime.today(),
    institution: [Meridian Observatory],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Detection Methods
// ============================================================

= Detection Methods

== The Transit Method

#stack(
  spacing: 0.8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[PRIMARY TECHNIQUE],
  cols(columns: (1fr, 1fr), column-gutter: 24pt,
    [#stack(
      spacing: 0.8em,
      text(size: typo.body, fill: pal.ink, font: _sans-font)[
        A transit is the periodic dip caused when an exoplanet crosses its host star.
        Its depth reveals planetary radius; its period yields orbital distance.
      ],
      text(size: typo.body, fill: pal.ink, font: _sans-font)[
        Kepler monitored more than 150,000 stars and transformed the field.
      ],
      text(size: typo.body, fill: pal.ink, font: _sans-font)[
        Kepler's third law: #mi(`T^2 = \frac{4\pi^2}{GM_\star} a^3`)
      ],
    )],
    [#stack(
      spacing: 0.8em,
      magnitude-stat([CONFIRMED PLANETS], [5,800+]),
      magnitude-stat([TRANSIT FRACTION], [~75%]),
    )],
  ),
)


// ============================================================
// Slide: Key Statistics (Dark)
// ============================================================

#dark-slide(
  title: none,
  header-left: [DATA BRIEF],
  header-right: [EXOPLANET CENSUS 2025],
)[
  #stack(
    spacing: 0.8em,
    text(size: 36pt, weight: "bold")[4,400+ Worlds Found by Kepler Alone.],
    text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink.transparentize(50%), font: _mono-font)[NASA EXOPLANET ARCHIVE],
    cols(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
      [#stack(
        spacing: 0.8em,
        text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[TESS CANDIDATES],
        text(size: 42pt, weight: "bold")[7,200+],
        text(size: 11pt, fill: pal.ink.transparentize(35%), font: _sans-font)[
          Planet candidates identified by TESS since 2018, with ongoing follow-up confirmation campaigns.
        ],
      )],
      [#stack(
        spacing: 0.8em,
        text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[HABITABLE ZONE],
        text(size: 42pt, weight: "bold")[~60],
        text(size: 11pt, fill: pal.ink.transparentize(35%), font: _sans-font)[
          Rocky exoplanets confirmed within the habitable zone of their host stars. Prime targets for biosignature searches.
        ],
      )],
      [#stack(
        spacing: 0.8em,
        text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[JWST SPECTRA],
        text(size: 42pt, weight: "bold")[24],
        text(size: 11pt, fill: pal.ink.transparentize(35%), font: _sans-font)[
          Exoplanet atmospheres characterized by JWST transmission spectroscopy in its first two years of operation.
        ],
      )],
    ),
    block(
      width: 100%,
      stroke: (left: 1.5pt + pal.ink.transparentize(60%)),
      inset: (left: 1.2em, y: 0.4em),
    )[
      #text(size: 12pt, style: "italic", fill: pal.ink.transparentize(20%))[
        "We are the first generation to know that nearly every star hosts a planetary system."
      ]
    ],
  )
]


// ============================================================
// Slide: Methods Comparison (Cards)
// ============================================================

== Radial Velocity & Astrometry

#stack(
  spacing: 0.8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[COMPLEMENTARY APPROACHES],
  // A regular comparison matrix: native grid row sizing keeps the three bordered cards equal.
  grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    star-card([Radial Velocity], [
      Measures Doppler shift in stellar spectra caused by gravitational tug of orbiting planets.
      Yields minimum mass (M sin i). HARPS and ESPRESSO achieve sub-m/s precision.
    ]),
    star-card([Astrometry], [
      Detects tiny positional wobble of the star on the sky plane.
      Gaia mission expected to reveal thousands of Jupiter-mass planets via astrometric signatures.
    ]),
    star-card([Direct Imaging], [
      Captures photons from the planet itself using coronagraphs or starshades.
      Best suited for young, massive planets at wide orbital separations from their host stars.
    ]),
  ),
)


// ============================================================
// Slide: Ephemeris Data Table
// ============================================================

== Notable Exoplanet Ephemerides

#stack(
  spacing: 0.8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[SELECTED TARGETS],
  ephemeris-table(
    ("Designation", "Period (d)", "Radius", "Method", "Distance"),
    ([Kepler-442b], [112.31], [1.34 R_E], [Transit], [1,206 ly]),
    ([Proxima Cen b], [11.19], [~1.1 R_E], [RV], [4.24 ly]),
    ([TRAPPIST-1e], [6.10], [0.92 R_E], [Transit], [39.5 ly]),
    ([TOI-700d], [37.42], [1.19 R_E], [Transit], [101.4 ly]),
    ([Ross 128 b], [9.87], [~1.1 R_E], [RV], [11.0 ly]),
  ),
  text(size: 11pt, fill: pal.ink-dim, font: _sans-font)[
    R_E = Earth radii. RV = Radial Velocity. Distances in light-years. All values from NASA Exoplanet Archive.
  ],
)


// ============================================================
// Section 2: Atmospheric Characterization
// ============================================================

= Atmospheric Science

== Transmission Spectroscopy

#cols(columns: (2fr, 1fr), column-gutter: 24pt)[
  #nebula-box[
    #stack(
      spacing: 0.8em,
      [During a transit, starlight filters through the planet's atmosphere,
      imprinting absorption features from molecular species. JWST's NIRSpec
      and MIRI instruments have detected H#sub[2]O, CO#sub[2], SO#sub[2], and even
      dimethyl sulfide in exoplanet atmospheres -- molecules that on Earth
      are associated with biological processes.],
      [The challenge lies in distinguishing biotic from abiotic sources and
      accounting for stellar contamination effects on the measured spectra.],
    )
  ]
][
  #stack(
    spacing: 0.8em,
    orbit-tag([NIRSpec]),
    orbit-tag([MIRI]),
    orbit-tag([G395H]),
    block(
      width: 100%,
      fill: pal.accent-ghost,
      inset: 10pt,
      stroke: 0.4pt + pal.accent-faint,
    )[
      #text(size: 11pt, fill: pal.ink-dim, font: _sans-font)[
        Key molecules: H#sub[2]O, CO#sub[2], CH#sub[4], O#sub[3], NH#sub[3]
      ]
    ],
  )
]


// ============================================================
// Slide: Quote (Focus)
// ============================================================

#focus-slide[
  #stack(
    spacing: 0.8em,
    ["Are we alone? The answer may lie in the spectra of worlds we can barely see."],
    text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink.transparentize(30%))[
      -- Sara Seager, MIT
    ],
  )
]


// ============================================================
// Slide: JWST Discoveries
// ============================================================

== JWST Atmospheric Detections

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr), column-gutter: 24pt,
    [#celestial-quote([
      The detection of CO#sub[2] in the atmosphere of WASP-39b marked the first
      unambiguous identification of a molecule in an exoplanet atmosphere from
      space-based observations -- a watershed moment for the field.
    ], cite: "JWST Transiting Exoplanet ERS Team, 2023")],
    [#star-card([K2-18b: A Hycean World?], [
      JWST detected CH#sub[4] and CO#sub[2] while finding no NH#sub[3] -- consistent
      with a hydrogen-rich atmosphere over a liquid water ocean.
      Tentative detection of dimethyl sulfide awaits confirmation.
    ])],
  ),
  constellation-divider(total-width: 100%),
  text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
    These findings represent the opening chapter of comparative exoplanet climatology --
    a field that will mature dramatically as JWST accumulates more transit observations
    and the Ariel mission comes online in the early 2030s.
  ],
)


// ============================================================
// Section 3: Future Missions
// ============================================================

= Future Missions

== The Next Generation of Planet Hunters

#stack(
  spacing: 0.8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[MISSION ROADMAP],
  cols(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
    [#magnitude-stat([ARIEL], [2029], description: [ESA mission: atmospheric survey of 1000 exoplanets])],
    [#magnitude-stat([PLATO], [2026], description: [ESA: rocky planets in habitable zones of solar-type stars])],
    [#magnitude-stat([HWO], [2040s], description: [NASA Habitable Worlds Observatory: direct imaging of Earth twins])],
    [#magnitude-stat([LIFE], [2035+], description: [Large Interferometer: mid-IR characterization of temperate planets])],
  ),
  constellation-divider(total-width: 100%),
  text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
    Each mission addresses a different piece of the puzzle: from bulk demographics (PLATO)
    to atmospheric chemistry (Ariel) to the ultimate goal of imaging Earth-like worlds (HWO).
  ],
)


// ============================================================
// Slide: Dark comparative
// ============================================================

#dark-slide(
  title: none,
  header-left: [COMPARATIVE ANALYSIS],
  header-right: [DETECTION SENSITIVITY],
)[
  #stack(
    spacing: 0.8em,
    text(size: 28pt, weight: "bold")[Transit vs. Radial Velocity: Complementary Windows],
    block(width: 50pt, height: 1.5pt, fill: pal.accent),
    cols(columns: (1fr, 1fr), column-gutter: 28pt,
      [#block(width: 100%, stroke: (left: 1.5pt + pal.accent), inset: (left: 1em, y: 0.4em))[
        #stack(
          spacing: 0.8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[TRANSIT PHOTOMETRY],
          text(size: 14pt, weight: "bold", fill: pal.ink)[Radius + Atmosphere],
          text(size: 12pt, fill: pal.ink.transparentize(30%), font: _sans-font)[
            Geometric probability decreases with orbital distance. Favors short-period planets.
            Provides radius and density (with RV mass). Enables atmospheric characterization.
          ],
        )
      ]],
      [#block(width: 100%, stroke: (left: 1.5pt + pal.ink.transparentize(70%)), inset: (left: 1em, y: 0.4em))[
        #stack(
          spacing: 0.8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.ink.transparentize(50%), font: _mono-font)[RADIAL VELOCITY],
          text(size: 14pt, weight: "bold", fill: pal.ink)[Mass + Orbit],
          text(size: 12pt, fill: pal.ink.transparentize(30%), font: _sans-font)[
            No geometric bias. Sensitive to massive planets at any inclination.
            Provides minimum mass and full orbital elements including eccentricity.
          ],
        )
      ]],
    ),
    text(size: 11pt, fill: pal.ink.transparentize(25%), font: _sans-font)[
      The combination of transit photometry and radial velocity yields the most complete
      characterization: radius, mass, density, and atmospheric composition.
    ],
  )
]


// ============================================================
// Slide: Planet Types
// ============================================================

== Exoplanet Taxonomy

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 12pt,
  star-card([Hot Jupiters], [
    Gas giants with orbital periods under 10 days. Tidally locked with extreme
    day-night temperature contrasts exceeding 1000 K. First class discovered via RV.
  ]),
  star-card([Super-Earths], [
    Rocky or volatile-rich planets between 1--2 Earth radii. No solar system analog.
    May possess thick H/He envelopes or be stripped rocky cores.
  ]),
  star-card([Sub-Neptunes], [
    The most common planet type in the galaxy (2--4 Earth radii). Likely possess
    hydrogen-rich envelopes over rocky/icy interiors. Radius gap at ~1.8 R_E.
  ]),
  star-card([Hycean Worlds], [
    Hypothetical class: hydrogen atmosphere over a global water ocean.
    K2-18b is the leading candidate. Potentially habitable despite large size.
  ]),
)


// ============================================================
// Slide: Focus -- Key Question
// ============================================================

#focus-slide[
  #stack(
    spacing: 0.8em,
    ["Every star you see in the night sky likely hosts its own family of worlds."],
    text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink.transparentize(30%))[
      -- Kepler Mission Legacy Summary
    ],
  )
]


// ============================================================
// Slide: Biosignatures
// ============================================================

== The Search for Biosignatures

#stack(
  spacing: 0.8em,
  celestial-quote([
    A biosignature is not a single molecule but a disequilibrium -- the coexistence
    of species like O#sub[2] and CH#sub[4] that should not persist together without
    a continuous biological source replenishing them.
  ], cite: "Meadows et al., 2018"),
  cols(columns: (1fr, 1fr), column-gutter: 24pt,
    [#stack(
      spacing: 0.8em,
      text(size: 14pt, weight: "bold", fill: pal.ink)[Promising Indicators],
      text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
        #sym.star.filled #h(0.3em) O#sub[2] + CH#sub[4] coexistence (thermodynamic disequilibrium) \
        #sym.star.filled #h(0.3em) O#sub[3] (ozone) as proxy for O#sub[2] \
        #sym.star.filled #h(0.3em) N#sub[2]O (nitrous oxide -- biological denitrification) \
        #sym.star.filled #h(0.3em) Dimethyl sulfide (marine biology marker)
      ],
    )],
    [#stack(
      spacing: 0.8em,
      text(size: 14pt, weight: "bold", fill: pal.ink)[False Positive Risks],
      text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
        #sym.star.filled #h(0.3em) Abiotic O#sub[2] from photolysis of H#sub[2]O or CO#sub[2] \
        #sym.star.filled #h(0.3em) Geological CH#sub[4] from serpentinization \
        #sym.star.filled #h(0.3em) Stellar contamination mimicking molecular features \
        #sym.star.filled #h(0.3em) Cloud opacity masking atmospheric composition
      ],
    )],
  ),
)


// ============================================================
// Dark section transition
// ============================================================

#dark-slide(
  title: [Looking Forward],
  header-right: [CELESTIAL 2025],
)[
  #v(1fr)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.ink.transparentize(50%), font: _mono-font)[SECTION 04]
  #v(0.6em)

  #text(size: 34pt, weight: "bold")[
    From Detection#linebreak()to Characterization.
  ]
  #v(0.4em)
  #block(width: 60pt, height: 1.5pt, fill: pal.accent)

  #v(2fr)
]


// ============================================================
// Slide: Technology showcase
// ============================================================

== Coronagraph & Starshade Technology

#stack(
  spacing: 0.8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[ENABLING DIRECT IMAGING],
  cols(columns: (1fr, 1fr), column-gutter: 24pt,
    [#stack(
      spacing: 0.8em,
      star-card([Internal Coronagraph], [
        Suppresses starlight within the telescope using shaped pupils,
        vortex phase masks, or band-limited Lyot stops. Roman Space Telescope
        will demonstrate 10#super[-8] contrast in the 2020s.
      ]),
      stack(dir: ltr, spacing: 0.4em,
        orbit-tag([CGI]),
        orbit-tag([HLC]),
        orbit-tag([SPC]),
      ),
    )],
    [#stack(
      spacing: 0.8em,
      star-card([External Starshade], [
        A separate spacecraft flying tens of thousands of km ahead blocks starlight
        before it enters the telescope. Achieves deeper contrasts over broader
        bandwidths but requires precise formation flying.
      ]),
      stack(dir: ltr, spacing: 0.4em,
        orbit-tag([Starshade]),
        orbit-tag([IWA]),
        orbit-tag([Formation]),
      ),
    )],
  ),
)


// ============================================================
// Ending
// ============================================================

#ending-slide[Ad Astra]
