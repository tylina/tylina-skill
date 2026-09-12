// Pulse Grid Theme Demo -- Real-Time Environmental Monitoring Research
// Oscilloscope grid aesthetic with ECG traces and digital readout panels
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#show: pulse-grid-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Meridian Research Lab -- Environmental Pulse 2026],
  config-info(
    title: [Global Environmental Signal Analysis],
    subtitle: [Real-Time Monitoring of Atmospheric and Oceanic Indicators],
    author: [Dr. Elena Vasquez, Principal Investigator],
    institution: [Meridian Institute for Environmental Sciences],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("IBM Plex Sans", "Heiti SC"))

// ====================================
// Title Slide
// ====================================
#title-slide()

// ====================================
// Section 1: Signal Overview
// ====================================
= Signal Overview

== Monitoring Network Status

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  readout-card([Stations Online], [2847], unit: [of 3000], accent: palette.primary),
  readout-card([Data Rate], [14.2], unit: [TB/day], accent: palette.secondary),
  readout-card([Latency], [< 340], unit: [ms], accent: palette.primary),
  readout-card([Uptime], [99.97], unit: [%], accent: palette.primary-dark),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  trace-box([Atmospheric Sensors], [
    Global sensor network captures *42 atmospheric parameters* including greenhouse gas concentrations, aerosol distributions, and electromagnetic anomalies. Sampling at 1 Hz continuous.
  ], accent: palette.primary),
  trace-box([Oceanic Buoy Array], [
    Deep-ocean monitoring array spanning all five major basins. Tracks temperature gradients, current velocities, and salinity profiles. Real-time satellite telemetry.
  ], accent: palette.secondary),
)

== Key Indicators Q1 2026

#cols[
  #monitor-card([Atmospheric Channel], (
    ("CO2 (ppm)", "427.3"),
    ("CH4 (ppb)", "1,923"),
    ("N2O (ppb)", "338.7"),
  ), accent: palette.primary)

  #v(0.4em)

  #alert-box([Threshold Exceedance], [
    Arctic methane flux exceeded baseline by *34%* during February. Permafrost data suggests accelerating thaw.
  ], level: "warning")
][
  #monitor-card([Oceanic Channel], (
    ("SST Anomaly", "+0.82 C"),
    ("pH Global", "8.04"),
    ("THC Index", "14.2 Sv"),
  ), accent: palette.secondary)

  #v(0.4em)

  #alert-box([Critical Signal], [
    AMOC showing sustained weakening. 14.2 Sv is the lowest value since 2004 monitoring baseline.
  ], level: "critical")
]

// ====================================
// Section 2: Signal Analysis
// ====================================
= Signal Analysis

== Frequency Domain Results

#spectrum-grid(
  columns: 3,
  accent: palette.primary,
  (
    (label: "11-yr Solar", value: "0.091 Hz"),
    (label: "ENSO", value: "0.25 Hz"),
    (label: "QBO", value: "0.43 Hz"),
    (label: "Annual", value: "1.00 Hz"),
    (label: "Diurnal", value: "365.25"),
    (label: "Tidal M2", value: "1.93 cpd"),
  ),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  channel-card(accent: palette.primary)[01][Temperature Signal][
    Dominant periodicity at annual cycle with emerging trend component. Signal-to-noise ratio exceeds 40 dB for primary harmonic. Phase coherence with solar forcing at 0.87.
  ],
  channel-card(accent: palette.secondary)[02][Pressure Gradient][
    Quasi-biennial oscillation clearly resolved in stratospheric pressure data. Spectral leakage corrected using Hanning window. Cross-spectral density shows coupling to tropical circulation.
  ],
)

== Temporal Correlation Matrix

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  vital-stat([Correlation], [0.94], trend: [Temp-Sea Level], color: palette.primary),
  vital-stat([Lead Time], [4.2 mo], trend: [Predictive Window], color: palette.secondary),
  vital-stat([Channels], [15], trend: [Active], color: palette.primary-dark),
  vital-stat([SNR], [> 40 dB], trend: [Primary], color: palette.primary),
)

#v(.8em)

#trace-box([Cross-Channel Correlations], [
  Strong coupling identified across 15 primary channels:
  *CH01-CH04*: Temperature / sea-level (r = 0.94) |
  *CH02-CH07*: Pressure / wind shear (r = 0.87) |
  *CH05-CH12*: Ocean heat / ice mass (r = -0.91)
], accent: palette.primary)

#v(0.3em)

#stack(dir: ltr, spacing: 0.5em,
  signal-tag([High Confidence], color: palette.primary),
  signal-tag([Peer Reviewed], color: palette.secondary),
  signal-tag([2026 Dataset], color: palette.primary-dark),
)

// ====================================
// Section 3: Field Observations
// ====================================
= Field Observations

== Station Deployment Log

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  {
    log-entry([2026-01-15], [Station ARC-47 Online], detail: [Methane sensor deployed at 72.4N], accent: palette.primary)
    v(0.4em)
    log-entry([2026-02-03], [Buoy PAC-112 Serviced], detail: [Battery replaced; 0.02C drift corrected], accent: palette.secondary)
    v(0.4em)
    log-entry([2026-02-14], [Alert: Methane Event], detail: [Multi-station detection; field team dispatched], accent: palette.alert)
    v(0.4em)
    log-entry([2026-03-22], [Array Expansion], detail: [12 new South Atlantic stations commissioned], accent: palette.primary)
  },
  {
    trace-box([Network Coverage Assessment], [
      Current deployment achieves *94.9%* coverage. Remaining gaps:

      - South Atlantic (6 stations planned Q3)
      - Central Pacific abyssal plain (2 buoys)
      - Antarctic interior (logistics pending)
    ], accent: palette.secondary)
  },
)

== Instrument Performance

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  readout-card([Mean MTBF], [14200], unit: [hrs], accent: palette.primary),
  readout-card([Cal. Drift], [0.003], unit: [%/mo], accent: palette.secondary),
  readout-card([Data Yield], [98.4], unit: [%], accent: palette.primary-dark),
)

#v(0.5em)

#baseline-divider(width: 60%)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  channel-card(accent: palette.primary)[SN][Sensor Health][
    All critical parameters within spec. Firmware v4.2 resolved ADC noise issue in cold environments.
  ],
  channel-card(accent: palette.secondary)[TX][Telemetry Quality][
    Satellite uplink at 99.3% success. Ground station redundancy provides seamless failover.
  ],
)

// ====================================
// Section 4: Predictions
// ====================================
= Predictive Models

== Ensemble Forecast Output

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  monitor-card([12-Month Forecast], (
    ("Global Temp", "+0.12 C"),
    ("Sea Level", "+3.9 mm"),
    ("AMOC", "13.8 Sv"),
    ("Arctic Ice", "-8.2%"),
  ), accent: palette.primary),
  monitor-card([Model Confidence], (
    ("Ensemble Size", "24 models"),
    ("Skill Score", "0.89"),
    ("Reliability", "92%"),
    ("Spread", "0.04 C"),
  ), accent: palette.secondary),
)

#v(.6em)

#cols(columns: (3fr, 2fr), gutter: 1.2em)[
  #lq.diagram(
    width: 100%,
    height: 136pt,
    lq.plot(
      (2021, 2022, 2023, 2024, 2025, 2026),
      (0.18, 0.21, 0.23, 0.25, 0.27, 0.29),
      stroke: palette.primary + 2pt,
      mark: "o",
      mark-size: 4pt,
    ),
    lq.xaxis(label: [Year], ticks: (2021, 2022, 2023, 2024, 2025, 2026)),
    lq.yaxis(label: [Warming Rate (°C/decade)]),
  )
][
  #alert-box([Forecast Advisory], [
    Ensemble median projects continued AMOC weakening with high confidence (>90%). If trend persists beyond 2027, European climate impacts become significantly more likely.
  ], level: "warning")
]

== Model Validation

#cols[
  #trace-box([Hindcast Performance], [
    Model ensemble validated against 1980-2020 record:

    - *Temperature*: RMSE 0.08 C (skill score 0.92)
    - *Precipitation*: Pattern correlation 0.87
    - *Sea Ice*: September extent within 5% of observed
    - *AMOC*: Captures 2010-2015 slowdown accurately
  ], accent: palette.primary)
][
  #stack(
    spacing: .8em,
    spectrum-grid(
      columns: 2,
      accent: palette.secondary,
      (
        (label: "Training Period", value: "1980-2020"),
        (label: "Validation", value: "2020-2025"),
        (label: "RMSE Temp", value: "0.08 C"),
        (label: "Skill Score", value: "0.92"),
      ),
    ),
    vital-stat([Ensemble Agreement], [22/24], trend: [Models agree on direction], color: palette.primary),
    pulse-divider(width: 50%),
    [#signal-tag([Published], color: palette.primary) #h(0.3em) #signal-tag([Nature 2025], color: palette.secondary)],
  )
]

// ====================================
// Focus Slide
// ====================================

#focus-slide[
  _"Every signal tells a story. Our task is to listen before the noise becomes irreversible."_

  #v(0.3em)
  #text(size: 0.6em, weight: "regular", fill: palette.grid-faint.transparentize(20%))[-- Meridian Institute Research Charter]
]

// ====================================
// Ending Slide
// ====================================

#ending-slide[Thank You]
