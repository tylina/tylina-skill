// Aurora Research Institute — Annual Science Symposium
// Demo presentation showcasing the Aurora Borealis theme
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: aurora-borealis-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Aurora Research Institute | Symposium 2026],
  config-info(
    title: [Celestial Phenomena & Atmospheric Science],
    subtitle: [Advances in Aurora Borealis Prediction and Space Weather],
    author: [Dr. Elara Nordström],
    institution: [Aurora Research Institute, Tromsø, Norway],
    date: datetime(year: 2026, month: 3, day: 21),
  ),
)

// ═══ Slide 1: Title ═══
#title-slide()

// ═══ Slide 2: Section — Research Overview ═══
= Research Overview

// ═══ Slide 3: Mission & Vision ═══
== Our Mission

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true,
    insight-box([Research Focus], [
      Developing next-generation magnetospheric models to predict aurora borealis activity 72 hours in advance, enabling both scientific study and sustainable aurora tourism.
    ]),
    insight-box([Global Impact], [
      Our predictive models protect satellite infrastructure, power grids, and telecommunications systems from geomagnetic storms while advancing fundamental plasma physics.
    ]),
  ),
  grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
    stat-card([Prediction Accuracy], [94.2%], unit: [72-hour], accent: palette.primary),
    stat-card([Storm Detection], [\<8 min], unit: [lead time], accent: palette.secondary),
    stat-card([Sensor Network], [340+], unit: [stations], accent: palette.accent),
    stat-card([Publications], [127], unit: [peer-reviewed], accent: palette.pink),
  ),
)

// ═══ Slide 4: Research Areas ═══
== Key Research Areas

#grid(columns: (1fr, 1fr), gutter: 1.2em,
  feature-card(1, [Magnetospheric Dynamics], [
    Real-time modeling of Earth's magnetosphere response to solar wind variations. Tracking reconnection events and substorm cycles with sub-minute temporal resolution.
  ]),
  feature-card(2, [Solar Wind Coupling], [
    Characterizing energy transfer mechanisms between interplanetary magnetic field structures and terrestrial magnetic field topology during coronal mass ejections.
  ]),
  feature-card(3, [Ionospheric Chemistry], [
    Spectroscopic analysis of nitrogen and oxygen emissions across the E and F layers, mapping the altitude-dependent colors of auroral displays.
  ]),
  feature-card(4, [Predictive AI Models], [
    Deep learning architectures trained on 40 years of space weather data for probabilistic forecasting of geomagnetic activity indices (Kp, Dst, AE).
  ]),
)

// ═══ Slide 5: Section — Atmospheric Physics ═══
= Atmospheric Physics

// ═══ Slide 6: Aurora Mechanics ═══
== Aurora Formation Process

#cols[
  #stack(
    spacing: .8em,
    text(weight: "bold", fill: palette.text-dark, size: 0.95em)[The Science of Light],
    [
      #set text(size: 0.86em)
      - *Solar particles* cross 150M km in 2--4 days
      - *Magnetic reconnection* drives electrons to 10--100 keV
      - *100 km oxygen* produces green (557.7 nm)
      - *300 km oxygen* produces rare red (630.0 nm)
      - *Nitrogen interactions* create blue-violet bands
    ],
    callout-box([Key Discovery], [
      Our 2025 campaign identified a 427.8 nm N₂⁺ emission pathway that explains the purple-pink fringe at substorm onset.
    ], accent: palette.aurora-violet),
  )
][
  #figure(
    aurora-table(
      ([Emission], [Altitude], [Color], [Energy]),
      (
        ([O ¹S → ¹D], [90--150 km], [Green], [4.17 eV]),
        ([O ¹D → ³P], [200--400 km], [Red], [1.96 eV]),
        ([N₂⁺ 1NG], [80--120 km], [Blue], [3.17 eV]),
        ([N₂ 1PG], [120--200 km], [Pink], [6.17 eV]),
        ([O⁺ 2P], [250--350 km], [Violet], [5.02 eV]),
      ),
    ),
  )
]

// ═══ Slide 7: Data collection ═══
== Observation Network

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    data-card([Ground Stations], [
      - All-sky cameras: 48 sites
      - Magnetometers: 120+ stations
      - Ionosondes: 35 locations
      - Riometers: 60 sites
    ]),
    data-card([Space Assets], [
      - DMSP satellites: 6 active
      - GOES magnetometer data
      - ACE solar wind monitor
      - THEMIS probe constellation
    ]),
    data-card([Computing], [
      - GPU cluster: 2048 A100s
      - Real-time pipeline: 4TB/day
      - Model inference: 500ms
      - Archive: 12 PB historical
    ]),
  ),
  highlight-box([Network Expansion 2026], [
    Deploying 80 new magnetometer stations across Fennoscandia and Northern Canada, increasing spatial resolution to 50 km. Partnership with ESA Swarm-NEXT mission for in-situ validation.
  ]),
)

// ═══ Slide 8: Focus Slide ═══
#focus-slide()[
  #stack(
    spacing: .8em,
    [_"The aurora is the visible signature of\
    the Sun-Earth electromagnetic dialogue."_],
    text(size: 0.5em, weight: "regular")[--- Kristian Birkeland, 1908],
  )
]

// ═══ Slide 9: Section — Predictive Models ═══
= Predictive Models

// ═══ Slide 10: AI Architecture ═══
== Model Architecture

#cols[
  #stack(
    spacing: .8em,
    concept-card([AuroraNet v3], [
      Transformer with 1.2B parameters, trained on 40 years of multi-instrument observations. It fuses solar wind, magnetometer, and satellite-imagery inputs.
    ], accent: palette.primary),
    concept-card([Storm Classifier], [
      Gradient-boosted ensemble for rapid G-scale classification. Delivers 97\% accuracy on G3+ events with a 45-minute lead time.
    ], accent: palette.secondary),
  )
][
  #stack(
    spacing: .8em,
    concept-card([Emission Predictor], [
      Physics-informed network predicts spectral emissions using ionospheric chemistry and learned corrections across a 12-model ensemble.
    ], accent: palette.accent),
    stat-card([Training Data], [4.2 PB], accent: palette.secondary),
  )
]

// ═══ Slide 11: Prediction Results ═══
== Prediction Performance

#stack(
  spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
    stat-card([Kp Index RMSE], [0.42], unit: [72-hour], accent: palette.primary),
    stat-card([Storm Onset], [94%], unit: [detection rate], accent: palette.secondary),
    stat-card([False Alarm], [3.1%], unit: [rate (G3+)], accent: palette.accent),
  ),
  cols(columns: (3fr, 2fr), gutter: 1.2em,
    figure(
      aurora-table(
        ([Metric], [v2 (2024)], [v3 (2026)], [Gain]),
        (
          ([72h Kp RMSE], [0.68], [0.42], [-38%]),
          ([Storm onset lead], [25 min], [45 min], [+80%]),
          ([Oval boundary], [±3.2°], [±1.1°], [-66%]),
          ([Color prediction], [72%], [89%], [+24%]),
        ),
      ),
    ),
    insight-box([Breakthrough], [
      AuroraNet v3 is the first model to predict discrete auroral-arc morphology, enabling photography planning with 85\% location accuracy at a four-hour lead.
    ]),
  ),
)

// ═══ Slide 12: Section — Applications ═══
= Applications

// ═══ Slide 13: Industry Impact ═══
== Industry Applications

#grid(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Space Weather Defense], [
    Real-time GIC (geomagnetically induced current) predictions for power grid operators. Prevented an estimated \$340M in transformer damage during the March 2025 G4 storm.
  ], accent: palette.primary),
  concept-card([Satellite Operations], [
    Radiation environment forecasting for LEO constellation operators. Automated safe-mode triggers reduced anomaly rates by 62\% for partner fleet of 1,200 satellites.
  ], accent: palette.secondary),
  concept-card([Aviation Safety], [
    HF radio blackout predictions for polar flight routes. Airlines using our forecasts save 12\% fuel by optimizing great-circle routing during geomagnetically quiet periods.
  ], accent: palette.accent),
  concept-card([Aurora Tourism], [
    Consumer-facing app with 2.3M users. 4-day aurora probability maps with street-level cloud cover integration. 91\% user satisfaction on "aurora visible" predictions.
  ], accent: palette.pink),
)

// ═══ Slide 14: Metrics ═══
== Impact Metrics

#stack(
  spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
    stat-card([Infrastructure Protected], [\$2.1B], unit: [annual value], accent: palette.primary),
    stat-card([Satellite Anomalies], [-62%], unit: [reduction], accent: palette.secondary),
    stat-card([App Users], [2.3M], unit: [active monthly], accent: palette.accent),
    stat-card([Research Partners], [47], unit: [institutions], accent: palette.aurora-violet),
    stat-card([API Calls], [8.4M], unit: [daily], accent: palette.pink),
    stat-card([Alert Accuracy], [96.8%], unit: [actionable], accent: palette.secondary),
  ),
  highlight-box([Recognition], [
    2025 WMO Prize winner and ICAO Space Weather Advisory Centre provider.
  ]),
)

// ═══ Slide 15: Quote ═══
== Testimonials

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true,
    quote-card([
      The Aurora Research Institute's predictions have fundamentally changed how we manage our Nordic power grid. During the 2025 Carrington-class near-miss, their 6-hour warning saved our infrastructure.
    ], attribution: [Magnus Eriksson, CEO NordGrid]),
    quote-card([
      Our aurora tourism revenue increased 340\% after integrating their prediction API. Guests now book with confidence, and our 4-night packages have 94\% aurora-sighting success rates.
    ], attribution: [Sigrid Halvorsen, Arctic Adventures Ltd.]),
  ),
  grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 0.8em, align: center,
    aurora-tag([Space Weather], color: palette.primary),
    aurora-tag([Machine Learning], color: palette.secondary),
    aurora-tag([Ionospheric Physics], color: palette.accent),
    aurora-tag([Climate Science], color: palette.aurora-violet),
    aurora-tag([Sustainable Tourism], color: palette.pink),
  ),
)

// ═══ Slide 16: Section — Future ═══
= Future Directions

// ═══ Slide 17: Roadmap ═══
== Research Roadmap 2026--2028

#stack(
  spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
    roadmap-card([2026], [Foundation], [
      - AuroraNet v4 (3B params)\
      - Swarm-NEXT integration\
      - Arctic drone fleet (20)\
      - Public API v3 launch
    ], accent: palette.primary),
    roadmap-card([2027], [Expansion], [
      - Southern hemisphere net\
      - Quantum sensing pilot\
      - 7-day Kp forecasts\
      - Industry consortium
    ], accent: palette.secondary),
    roadmap-card([2028], [Breakthrough], [
      - Real-time 3D modeling\
      - Mars aurora prediction\
      - Global coverage (±50°)\
      - Open-source platform
    ], accent: palette.accent),
  ),
  callout-box([Funding Secured], [
    EUR 28M from European Research Council Advanced Grant + EUR 15M from ESA Space Safety Programme for 2026--2028 research programme. Additional NOK 45M from Research Council of Norway.
  ], accent: palette.secondary),
)

// ═══ Slide 18: Ending ═══
#ending-slide()[Thank You]
