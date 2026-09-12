#import "@preview/touying:0.7.4": *
#import "@preview/lovelace:0.3.1": *
#import "template.typ": *

// Font configuration
#set text(font: "Avenir Next", size: 18pt)

// Build the same palette for the theme shell and palette-aware components.
// Override with `typst compile --input preset=midnight` (or `dawn`) to test variants.
#let active-preset = sys.inputs.at("preset", default: "twilight")
#let pal = build-palette(active-preset)

#show: observatory-theme.with(
  aspect-ratio: "16-9",
  preset: active-preset,
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Adaptive Optics & Ground-Based Astronomy],
    subtitle: [Overcoming Atmospheric Turbulence for High-Resolution Imaging],
    author: [Prof. Helena Voss],
    date: datetime.today(),
    institution: [Summit Peak Observatory],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Atmospheric Challenges
// ============================================================

= Atmospheric Turbulence

== The Seeing Problem

#stack(
  spacing: .8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[FUNDAMENTAL LIMITATION],
  cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #text(size: typo.body, fill: pal.text)[
      Ground-based telescopes face a fundamental challenge: atmospheric turbulence
      distorts incoming wavefronts, blurring images far beyond the diffraction limit.
      Without correction, a 10-meter telescope resolves no better than a
      20-centimeter amateur instrument.
    ]
    #v(0.5em)
    #text(size: typo.body, fill: pal.text)[
      The Fried parameter (r#sub[0]) is the atmospheric coherence length: typically
      10–20 cm at visible wavelengths.
    ]
  ]
][
  #stack(
    spacing: 16pt,
    eyepiece-stat([FRIED PARAMETER], [~15 cm], description: [Typical r0 at 500nm wavelength at premier observatory sites], colors: pal),
    eyepiece-stat([ISOPLANATIC ANGLE], [~2"], description: [Angular patch over which AO correction remains valid], colors: pal),
  )
  ],
)


// ============================================================
// Slide: Key Statistics (Dark)
// ============================================================

#dark-slide(
  title: none,
  header-left: [INSTRUMENT BRIEF],
  header-right: [ADAPTIVE OPTICS 2025],
)[
  #text(size: 36pt, weight: "bold")[Diffraction-Limited Performance from the Ground.]

  #v(0.2em)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[CURRENT GENERATION AO SYSTEMS]

  #v(0.6em)

  #cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
    #stack(
      spacing: .8em,
      text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[STREHL RATIO],
      text(size: 42pt, weight: "bold")[>90%],
      text(size: 11pt, fill: pal.dark-text.transparentize(30%))[
        Peak K-band Strehl achieved by modern extreme-AO systems on 8m-class telescopes.
      ],
    )
  ][
    #stack(
      spacing: .8em,
      text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[ACTUATORS],
      text(size: 42pt, weight: "bold")[7,000+],
      text(size: 11pt, fill: pal.dark-text.transparentize(30%))[
        Deformable mirror actuators in next-generation ELT MCAO systems for wide-field correction.
      ],
    )
  ][
    #stack(
      spacing: .8em,
      text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[LOOP SPEED],
      text(size: 42pt, weight: "bold")[2 kHz],
      text(size: 11pt, fill: pal.dark-text.transparentize(30%))[
        Wavefront sensor sampling rate needed to freeze atmospheric evolution at visible wavelengths.
      ],
    )
  ]

  #v(0.4em)

  #block(
    width: 100%,
    stroke: (left: 1.5pt + pal.accent.transparentize(40%)),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: pal.dark-text.transparentize(20%))[
      "Adaptive optics has transformed ground-based astronomy from seeing-limited to diffraction-limited science."
    ]
  ]
]


// ============================================================
// Slide: AO System Components (Cards)
// ============================================================

== System Architecture

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[CORE SUBSYSTEMS]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
  #dome-card(colors: pal)[Wavefront Sensor][
    Shack-Hartmann or pyramid sensor measures incoming wavefront distortions
    at rates exceeding 1 kHz. Requires natural or laser guide stars as reference beacons.
  ]
][
  #dome-card(colors: pal)[Real-Time Computer][
    Reconstructs wavefront from sensor data and computes actuator commands
    within the atmospheric coherence time (~5ms). GPU-accelerated pipelines.
  ]
][
  #dome-card(colors: pal)[Deformable Mirror][
    Piezoelectric or voice-coil actuator array physically reshapes mirror surface
    to conjugate atmospheric phase errors. Sub-micron precision positioning.
  ]
]


// ============================================================
// Slide: Observation Log Table
// ============================================================

== Observation Log: AO Performance

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[SELECTED TARGETS -- SUMMIT PEAK 4.2m]

#v(0.4em)

#azimuth-grid(
  ("Target", "Band", "Strehl", "FWHM", "Conditions"),
  colors: pal,
  ([NGC 1068], [K], [0.87], [52 mas], [0.6" seeing]),
  ([GJ 876], [H], [0.72], [38 mas], [0.8" seeing]),
  ([HR 8799], [L'], [0.91], [95 mas], [0.5" seeing]),
  ([Sgr A\*], [K], [0.64], [58 mas], [1.0" seeing]),
  ([Beta Pic], [H], [0.81], [40 mas], [0.7" seeing]),
)

#v(0.4em)

#text(size: 11pt, fill: pal.text-muted)[
  FWHM = Full Width at Half Maximum. mas = milliarcseconds. Seeing measured at 500nm zenith.
]


// ============================================================
// Section 2: Laser Guide Stars
// ============================================================

= Laser Guide Stars

== Sodium Layer Beacons

#cols(columns: (2fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #tracking-box(colors: pal)[
      The mesospheric sodium layer at ~90 km altitude provides a natural
      resonant backscatter medium. Tuning a laser to the sodium D#sub[2] line
      at 589 nm creates an artificial guide star that can be positioned anywhere
      on the sky, liberating AO from the constraint of bright natural guide stars.

      #v(0.4em)
      Modern sodium lasers deliver 20--50 W of CW power, creating guide stars
      of magnitude V~10 -- bright enough for high-order wavefront sensing. The
      ELT will employ six laser guide stars simultaneously for tomographic reconstruction.
    ]
  ]
][
  #block(width: 100%)[
    #zenith-tag(colors: pal)[589 nm]
    #v(0.3em)
    #zenith-tag(colors: pal)[90 km]
    #v(0.3em)
    #zenith-tag(colors: pal)[50 W CW]
    #v(0.5em)
    #block(
      width: 100%,
      fill: pal.accent-ghost,
      inset: 10pt,
      stroke: 0.4pt + pal.accent-faint,
    )[
      #text(size: 11pt, fill: pal.text-muted)[
        Key parameters: spot elongation, tip-tilt indeterminacy, fratricide effects
      ]
    ]
  ]
]


// ============================================================
// Slide: Quote (Focus)
// ============================================================

#focus-slide[
  "The atmosphere is not the enemy -- it is the puzzle we have learned to solve in real time."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.primary.transparentize(30%))[
    -- Claire Max, UC Santa Cruz
  ]
]


// ============================================================
// Slide: LGS Challenges
// ============================================================

== LGS Technical Challenges

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #aperture-highlight(colors: pal)[
      *Tip-Tilt Indeterminacy:* The laser beacon traverses the same turbulent column
      as the science light, making it impossible to measure global tip-tilt from
      the LGS alone. A faint natural guide star within the isoplanatic patch
      is still required for tip-tilt correction.
    ]
  ]
][
  #block(width: 100%)[
    #dome-card(colors: pal)[Cone Effect][
      The finite altitude of the sodium layer means the LGS samples a cone
      of atmosphere rather than a cylinder, leaving high-altitude layers uncorrected.
      Solved by laser tomography with multiple beacons.
    ]
  ]
]

#v(0.4em)
#reticle-divider(total-width: 100%, colors: pal)
#v(0.4em)

#text(size: 13pt, fill: pal.text-dim)[
  These limitations drove the development of multi-conjugate and multi-object AO,
  which use multiple guide stars and deformable mirrors to achieve wide-field correction.
]


// ============================================================
// Section 3: Future Telescopes
// ============================================================

= Extremely Large Telescopes

== The Next Generation of Ground-Based Giants

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[FACILITY ROADMAP]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt)[
  #eyepiece-stat([ELT], [39m], description: [ESO Extremely Large Telescope, Cerro Armazones, Chile], colors: pal)
][
  #eyepiece-stat([TMT], [30m], description: [Thirty Meter Telescope, Mauna Kea / La Palma], colors: pal)
][
  #eyepiece-stat([GMT], [25m], description: [Giant Magellan Telescope, Las Campanas, Chile], colors: pal)
][
  #eyepiece-stat([Resolution], [5 mas], description: [ELT diffraction limit at H-band with AO], colors: pal)
]

#v(0.4em)
#reticle-divider(total-width: 100%, colors: pal)
#v(0.4em)

#text(size: 13pt, fill: pal.text-dim)[
  Each ELT will surpass JWST in angular resolution by factors of 5--6x, enabling
  resolved spectroscopy of exoplanet atmospheres and stellar populations in distant galaxies.
]


// ============================================================
// Slide: Dark comparative
// ============================================================

#dark-slide(
  title: none,
  header-left: [COMPARATIVE ANALYSIS],
  header-right: [GROUND vs. SPACE],
)[
  #text(size: 28pt, weight: "bold")[Ground-Based AO vs. Space Telescopes]
  #v(0.15em)
  #block(width: 50pt, height: 1.5pt, fill: pal.accent)
  #v(0.5em)

  #cols(columns: (1fr, 1fr), gutter: 28pt)[
    #block(width: 100%, stroke: (left: 1.5pt + pal.accent), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[GROUND + AO]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: pal.dark-text)[Resolution + Aperture]
      #v(0.3em)
      #text(size: 12pt, fill: pal.dark-text.transparentize(30%))[
        Larger collecting area, higher angular resolution, serviceable instruments.
        Limited by atmosphere (thermal background, sky coverage, weather).
        Cost-effective per unit area.
      ]
    ]
  ][
    #block(width: 100%, stroke: (left: 1.5pt + pal.dark-text.transparentize(70%)), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[SPACE-BASED]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: pal.dark-text)[Stability + Sensitivity]
      #v(0.3em)
      #text(size: 12pt, fill: pal.dark-text.transparentize(30%))[
        Diffraction-limited at all wavelengths, no atmospheric emission.
        Smaller apertures but deeper sensitivity. Extremely stable PSF
        ideal for coronagraphy and precision photometry.
      ]
    ]
  ]

  #v(0.6em)
  #text(size: 11pt, fill: pal.dark-text.transparentize(20%))[
    The ELT era will demonstrate that ground and space are complementary:
    ELTs provide resolution while JWST/Roman provide depth and wavelength coverage.
  ]
]


// ============================================================
// Slide: Observation Logbook
// ============================================================

== Engineering Night Log

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[SUMMIT PEAK 4.2m -- UT 2025-03-15]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 16pt,
  logbook-note([UTC 01:32], [
    AO loop closed on NGS (V=8.2). Seeing 0.65". Achieved Strehl 0.84 in K-band.
    Beginning science exposure on HR 8799 system.
  ], observer: [H. Voss], colors: pal),
  logbook-note([UTC 02:15], [
    Companion d detected at separation 14.5 AU. Contrast ratio 1.2e-5.
    Switching to L' for thermal characterization.
  ], observer: [H. Voss], colors: pal),
  logbook-note([UTC 03:48], [
    LGS activated for faint target program. Tip-tilt star 45" off-axis.
    Reduced Strehl to 0.61 due to anisoplanatism at large offset angle.
  ], observer: [M. Chen], colors: pal),
  logbook-note([UTC 04:22], [
    Humidity rising above 80%. Dome closed per safety protocol.
    Calibration frames acquired during closure. Resume at 05:00 if clear.
  ], observer: [M. Chen], colors: pal),
)


// ============================================================
// Slide: Instrumentation types
// ============================================================

== First-Light Instruments

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 12pt,
  dome-card([HARMONI -- IFU Spectrograph], [
    Integral field spectroscopy at R=3500--20000 covering 0.47--2.45 micron.
    Combined with LTAO and SCAO modes. Primary ELT workhorse instrument
    for resolved stellar populations and high-z galaxy kinematics.
  ], colors: pal),
  dome-card([MICADO -- Imager], [
    Near-infrared astrometric imager with 1.5 mas/pixel sampling.
    50 microarcsecond astrometric precision goal. SCAO and MCAO modes
    for both high-Strehl and wide-field science.
  ], colors: pal),
  dome-card([METIS -- Mid-IR Imager/Spectrograph], [
    Thermal infrared (3--13 micron) imaging and high-resolution spectroscopy.
    Includes vortex coronagraph for direct detection of rocky exoplanets
    in the habitable zones of nearby M-dwarfs.
  ], colors: pal),
  dome-card([ANDES -- High-Res Spectrograph], [
    Optical/NIR echelle spectrograph at R=100,000. Fed by SCAO module.
    Science cases: exoplanet atmosphere characterization, stellar abundances,
    fundamental constants, cosmic acceleration (Sandage test).
  ], colors: pal),
)


// ============================================================
// Slide: Focus -- Key Question
// ============================================================

#focus-slide[
  "With adaptive optics, we do not merely observe the universe -- we sharpen our gaze until the cosmos reveals its finest details."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.primary.transparentize(30%))[
    -- Roberto Gilmozzi, ELT Project Scientist
  ]
]


// ============================================================
// Dark section transition
// ============================================================

#dark-slide(
  title: none,
  header-left: [OBSERVATION 04],
  header-right: [OBSERVATORY 2025],
)[
  #v(1fr)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.dark-text.transparentize(50%), font: _mono-font)[LOOKING AHEAD]
  #v(0.6em)

  #text(size: 34pt, weight: "bold")[
    From Photons#linebreak()to Precision.
  ]
  #v(0.4em)
  #block(width: 60pt, height: 1.5pt, fill: pal.accent)

  #v(2fr)
]


// ============================================================
// Slide: Technology showcase with badges
// ============================================================

== Advanced AO Concepts

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[NEXT-GENERATION TECHNIQUES]

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #stack(
    spacing: .8em,
    dome-card([Multi-Conjugate AO (MCAO)], [
      Multiple deformable mirrors conjugated to different atmospheric layers
      provide uniform correction over fields exceeding 1 arcminute.
      GeMS on Gemini South demonstrated 2' corrected field with 3 DMs.
    ], colors: pal),
    block(width: 100%)[
      #finder-badge(colors: pal)[MCAO]
      #h(0.4em)
      #finder-badge(colors: pal)[LTAO]
      #h(0.4em)
      #finder-badge(colors: pal)[GLAO]
    ],
  )
][
  #stack(
    spacing: .8em,
    dome-card([Predictive Control], [
      Machine learning algorithms predict atmospheric evolution
      to compensate for the 1--2 ms latency in the AO control loop.
      Demonstrated 20--30% Strehl improvement in median conditions.
    ], colors: pal),
    block(width: 100%)[
      #finder-badge(colors: pal)[RNN]
      #h(0.4em)
      #finder-badge(colors: pal)[Kalman]
      #h(0.4em)
      #finder-badge(colors: pal)[ESN]
    ],
  )
]


== Wavefront Reconstruction

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(booktabs: true, numbered-title: smallcaps[Closed-Loop AO Wavefront Correction])[
    + Initialize deformable mirror commands $u arrow.l 0$
    + *loop* at 2 kHz *do*
      + Read slopes $s arrow.l "WFS"()$
      + Reconstruct phase $phi arrow.l R dot s$
      + Predict $hat(phi) arrow.l "RNN"_theta (phi_(t-k : t))$
      + Apply commands $u arrow.l -g dot C dot hat(phi)$
    + *end loop*
  ]
)


// ============================================================
// Ending
// ============================================================

#ending-slide[Clear Skies]
