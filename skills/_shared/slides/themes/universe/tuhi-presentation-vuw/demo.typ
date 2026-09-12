// ===============================================================
// Tuhi Presentation VUW Theme Demo
// Universe package: @preview/tuhi-presentation-vuw:0.1.0
// Touying version: 0.6.1 (owned internally by the Universe package)
// Te Herenga Waka — Victoria University of Wellington Theme
// ===============================================================

#import "@preview/tuhi-presentation-vuw:0.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: tuhi-vuw-theme.with(
  font: ("Helvetica Neue", "Arial"),
  math-font: ("New Computer Modern Math",),
  mono-font: "Menlo",
  code-font: "Menlo",
  config-info(
    title: [Seismicity and Slow-Slip Events Along the Hikurangi Margin],
    subtitle: [Insights from Dense Seismic Arrays],
    author: [Dr. Aroha Williams],
    date: datetime.today(),
    institution: smallcaps[phys412: advanced geophysics],
  ),
  config-common(
    datetime-format: "[day] [month repr:long] [year]",
    breakable: false,
  ),
)

#set par(justify: false)

// === Title Slide ===
#title-slide()

// ============================================================
= Tectonic Setting
// ============================================================

== The Hikurangi Subduction Zone

The *Hikurangi subduction zone* is where the Pacific Plate subducts beneath
the Australian Plate along the east coast of the North Island:

- Convergence rate: 40--50 mm/yr at the southern end
- Shallow plate interface (#mi(`< 15`) km depth in the north)
- Transition from locked to creeping behaviour along strike
- Host to some of the world's best-documented slow-slip events (SSEs)

Understanding the mechanics of this margin has direct implications for
*seismic hazard assessment* across Aotearoa New Zealand.

== Slow-Slip Events: Definition

=== What are SSEs?

Slow-slip events are episodes of *accelerated fault slip* that occur
over days to months, releasing energy equivalent to #mi(`M_w`) 6--7
earthquakes but without generating destructive seismic waves:

#mitex(`M_0 = \mu A \overline{d}`)

where #mi(`\mu`) is the shear modulus, #mi(`A`) is the rupture area, and
#mi(`\overline{d}`) is the average displacement.

=== Why do they matter?

- SSEs may modulate stress on adjacent locked zones
- Potential triggering relationship with large earthquakes
- Provide a natural laboratory for studying fault mechanics

// ============================================================
= Data and Methods
// ============================================================

== Seismic Network

We deployed a *dense temporary array* of 52 broadband seismometers across
the southern Hikurangi margin, complementing the GeoNet permanent network:

- Station spacing: 8--12 km
- Recording period: January 2023 -- December 2024
- Instruments: Trillium Compact 120s broadband sensors
- Sampling rate: 100 Hz continuous recording

== Two-Column Layout Example

#slide(composer: (1fr, 1fr), align: top)[
  *Detection Method*

  Matched-filter technique using template events:

  + Select high-quality template waveforms (#mi(`\text{SNR} > 5`))
  + Cross-correlate across all stations
  + Stack correlation coefficients
  + Declare detection at #mi(`\text{CC} \geq 8 \times \text{MAD}`)
][
  *Location Algorithm*

  Double-difference relocation (hypoDD):

  + Catalogue differential times (P and S)
  + Waveform cross-correlation delays
  + Iterative least-squares inversion
  + Final location uncertainty: #mi(`< 500`) m
]

== Detection Statistics

#figure[
  #table(
    columns: (2fr, 1fr, 1fr, 1fr),
    align: center,
    inset: 0.5em,
    table.header[*Period*][*Templates*][*Detections*][*Unique Events*],
    [Pre-SSE (6 months)], [142], [1,840], [1,420],
    [During SSE (3 months)], [142], [4,210], [3,680],
    [Post-SSE (6 months)], [142], [2,150], [1,720],
    [*Total*], [*142*], [*8,200*], [*6,820*],
  )
]

// ============================================================
= Results
// ============================================================

== Seismicity Rate Changes

During the 2023 southern Hikurangi SSE, we observe a *dramatic increase*
in micro-seismicity:

- Background rate: #mi(`\approx 8`) events/day
- Peak SSE rate: #mi(`\approx 47`) events/day (5.9x increase)
- Rate increase onset precedes geodetic detection by #mi(`\approx 5`) days
- Seismicity migration velocity: 8--12 km/day along strike

== Stress Transfer Model

The Coulomb stress change from slow slip onto surrounding faults:

#mitex(`\Delta \text{CFF} = \Delta \tau + \mu' \Delta \sigma_n`)

where #mi(`\Delta \tau`) is the shear stress change, #mi(`\Delta \sigma_n`) is the
normal stress change, and #mi(`\mu' \approx 0.4`) is the effective friction
coefficient.

Key findings:

+ Positive #mi(`\Delta \text{CFF}`) (#mi(`> 0.01`) MPa) on the locked Wairarapa segment
+ Correlation between #mi(`\Delta \text{CFF}`) and observed seismicity migration
+ Stress loading rate during SSE: #mi(`\approx 0.5`) kPa/day

== Depth Distribution

=== Shallow Events (#mi(`< 10`) km)

Predominantly within the overriding plate, clustered near known
active faults. Focal mechanisms show strike-slip and thrust faulting.

=== Intermediate Events (10--20 km)

Located near the plate interface, consistent with SSE-triggered
slip on the subduction megathrust.

=== Deep Events (#mi(`> 20`) km)

Rare, possibly related to dehydration reactions in the subducting slab.

// ============================================================
= Themed Content Boxes
// ============================================================

== Theorem and Definition Examples

#theorem-box(title: [Gutenberg-Richter Law])[
  The frequency-magnitude distribution of earthquakes follows:
  #mitex(`\log_{10} N = a - bM`)
  where #mi(`N`) is the cumulative number of events with magnitude #mi(`\geq M`),
  #mi(`a`) is the productivity, and #mi(`b \approx 1.0`) for tectonic seismicity.
]

#definition-box(title: [Slow-Slip Event])[
  A transient episode of fault displacement occurring at rates
  intermediate between tectonic loading (#mi(`\approx`) mm/yr) and seismic
  slip (#mi(`\approx`) m/s), typically lasting days to months.
]

== Warning and Neutral Examples

#warning-box(title: [#text(fill: tuhi-palette.neutral-darkest)[Hazard Implication]])[
  SSE-induced stress transfer may advance the timing of large
  earthquakes on the locked Wairarapa fault by 5--15 years.
]

#neutral-box(title: [Monitoring Practice])[
  Treat seismicity-rate changes as one line of evidence alongside
  geodetic and geological observations.
]

// ============================================================
= Discussion and Conclusions
// ============================================================

== Summary

*Key findings from this study:*

- Micro-seismicity increases 5.9x during the 2023 Hikurangi SSE
- Seismicity rate changes precede geodetic detection by #mi(`\approx 5`) days
- Coulomb stress modelling explains the spatial migration pattern
- Dense arrays improve detection completeness by 3x over GeoNet alone

*Implications for hazard assessment:*

- SSE monitoring as a potential short-term earthquake forecasting tool
- Revised probabilistic seismic hazard models for the Wellington region
- Input for the National Seismic Hazard Model update (NSHM 2027)

== Acknowledgements

This research is supported by the Marsden Fund (VUW-XXXX) and the
Earthquake Commission (EQC). Seismic instruments provided by the
IRIS PASSCAL Instrument Center. We thank GNS Science for GeoNet data
access and the School of Chemical and Physical Sciences at VUW for
computational resources.

// === Focus Slides (all 4 styles) ===
#focus-slide[
  Ngā mihi nui -- Thank you!
]

#focus-slide(style: "primary")[
  #text(fill: tuhi-palette.primary-darker)[Questions and Discussion]
]

#focus-slide(style: "secondary")[
  Seismicity responds before geodetic detection
]

#focus-slide(style: "tertiary")[
  #text(fill: tuhi-palette.tertiary-darkest)[Monitor the margin in real time]
]
