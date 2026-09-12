// ===============================================================
// INERIS Slide Theme Demo
// Universe package: @preview/ineris-slide:0.1.0
// Touying version: 0.6.1 (owned by the external package)
// Template for INERIS — French Institute for Industrial
// Environment and Risks
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/ineris-slide:0.1.0": *
#import "@preview/mitex:0.2.7": *

#let installed-font-init(self: none, body) = {
  set text(
    font: "Arial",
    size: 20pt,
    weight: "light",
    lang: "fr",
    region: "FR",
  )

  set list(
    indent: 1em,
    tight: false,
    marker: (
      [#set text(fill: self.colors.primary-darker);▶],
      [#set text(fill: self.colors.secondary-darker);--],
      [#sym.star.filled],
    ),
  )
  show list: it => {
    show list: set text(size: 0.8em)
    show enum: set text(size: 0.8em)
    it
  }

  set enum(
    indent: 1em,
    tight: false,
    numbering: n => text(fill: self.colors.primary-darker, [#n.]),
  )
  show enum: it => {
    show list: set text(size: 0.8em)
    show enum: set text(size: 0.8em)
    it
  }

  set heading(numbering: "1.a")
  show heading.where(level: 1): set heading(numbering: "1.")

  body
}

#show: ineris-slideshow.with(
  aspect-ratio: "16-9",
  config-methods(init: installed-font-init),
  config-info(
    title: [Risk Assessment of Hydrogen Storage Facilities],
    subtitle: [Accidental Risk Division — Annual Review],
    author: [Dr. Claire Dupont, Dr. Marc Lefèvre],
    date: datetime.today(),
  ),
)

// ---- Title and Outline ----

#title-slide()

#outline-slide()

// ---- Section 1: Context ----

= Context and Objectives

== Industrial Context

Hydrogen is a key enabler of the energy transition in France:

- *Production*: Green hydrogen via water electrolysis
- *Storage*: Compressed gas (350–700 bar) or cryogenic liquid
- *Transport*: Pipeline networks and tube trailers
- *Usage*: Fuel cells, industrial feedstock, power-to-gas

#pause

As hydrogen infrastructure scales up, quantitative risk assessment
becomes essential to ensure public safety and regulatory compliance.

== INERIS Mission

INERIS provides expertise in industrial and environmental risk prevention:

+ Conduct experimental research on accidental phenomena
+ Develop quantitative risk assessment methodologies
+ Support French regulatory authorities (DREAL, DGPR)
+ Contribute to European and international safety standards

Our objective: establish science-based safety distances for new
hydrogen storage installations in France.

== Regulatory Framework

The Seveso III Directive (2012/18/EU) classifies hydrogen storage above
5 tonnes as an upper-tier establishment, requiring:

- A safety report (_étude de dangers_)
- An internal emergency plan
- Quantitative risk assessment with probability and severity analysis
- Demonstration that individual risk is below #mi(`10^{-5}`) per year

// ---- Section 2: Methodology ----

= Methodology

== Risk Assessment Approach

We follow the INERIS bowtie methodology:

+ *Hazard identification* — systematic review of failure scenarios
+ *Frequency analysis* — fault tree analysis for initiating events
+ *Consequence modeling* — dispersion, jet fire, explosion overpressure
+ *Risk quantification* — individual and societal risk calculation

== Consequence Modeling

For a high-pressure hydrogen release, the mass flow rate is:

#mitex(`\dot{m} = C_d A_{\text{orifice}} P_{\text{tank}} \sqrt{\frac{\gamma}{RT} \left(\frac{2}{\gamma + 1}\right)^{(\gamma+1)/(\gamma-1)}}`)

where #mi(`C_d`) is the discharge coefficient, #mi(`A_{\text{orifice}}`) the orifice area,
#mi(`P_{\text{tank}}`) the tank pressure, #mi(`\gamma`) the heat capacity ratio, #mi(`R`) the gas
constant, and #mi(`T`) the temperature.

The resulting jet flame length is estimated using the Chamberlain model.

== Scenario Matrix

#matrix-slide(
  title: [Failure Scenarios],
  columns: 2,
  rows: (1fr, 1fr, 36pt),
)[
  === Small Leak

  Orifice: 5 mm \
  Flow rate: 0.3 kg/s \
  Frequency: #mi(`3 \times 10^{-3}`)/yr
][
  === Medium Leak

  Orifice: 25 mm \
  Flow rate: 7.5 kg/s \
  Frequency: #mi(`5 \times 10^{-4}`)/yr
][
  === Large Leak

  Orifice: 100 mm \
  Flow rate: 120 kg/s \
  Frequency: #mi(`1 \times 10^{-4}`)/yr
][
  === Catastrophic Rupture

  Full bore release \
  Flow rate: Total inventory \
  Frequency: #mi(`5 \times 10^{-6}`)/yr
]

// ---- Section 3: Results ----

= Results

== Experimental Validation

INERIS conducted large-scale hydrogen release experiments at the
Verneuil-en-Halatte test site:

#styled-table(
  columns: (1fr, auto, auto, auto),
  table.header(
    text(fill: white, weight: "bold")[Test],
    text(fill: white, weight: "bold")[Pressure (bar)],
    text(fill: white, weight: "bold")[Orifice (mm)],
    text(fill: white, weight: "bold")[Flame Length (m)],
  ),
  [H2-01], [200], [5], [4.2],
  [H2-02], [400], [10], [11.8],
  [H2-03], [700], [5], [7.1],
  [H2-04], [700], [25], [38.5],
)

Model predictions agree within #mi(`\pm 15\%`) of measured flame lengths.

== Safety Distances

Computed safety distances for lethal thermal radiation (#mi(`5 \text{ kW/m}^2`)):

- *Small leak (5 mm)*: Safety distance #mi(`= 12`) m
- *Medium leak (25 mm)*: Safety distance #mi(`= 45`) m
- *Large leak (100 mm)*: Safety distance #mi(`= 135`) m
- *Catastrophic rupture*: Safety distance #mi(`= 280`) m

#pause

These distances are consistent with international guidelines (NFPA 2,
ISO/TR 15916) and have been integrated into French regulatory guidance.

== Individual Risk Contours

The individual risk analysis shows:

- #mi(`10^{-5}`)/yr contour: #mi(`85`) m from the storage vessel
- #mi(`10^{-6}`)/yr contour: #mi(`165`) m from the storage vessel
- All residential areas fall below the acceptable risk threshold

#focus-slide[
  Hydrogen storage at 700 bar requires a minimum safety distance
  of 85 m for compliance with French risk criteria.
]

// ---- Section 4: Conclusion ----

= Conclusion and Perspectives

== Key Findings

*Principal results:*
+ Validated consequence models for high-pressure hydrogen releases
+ Established quantitative safety distances for French regulatory use
+ Experimental data from 4 large-scale release campaigns

#pause

*Recommendations for operators:*
- Implement leak detection systems with response time #mi(`< 30`) s
- Use blast walls for installations near public areas
- Conduct periodic integrity testing of high-pressure components

== Future Work

- Extension to liquid hydrogen ($"LH"_2$) storage scenarios
- Modeling of delayed ignition and vapor cloud explosions
- Development of simplified screening tools for regulators
- Contribution to ISO TC 197 hydrogen safety standards

== Acknowledgments

- French Ministry of Ecological Transition (funding)
- INERIS Verneuil-en-Halatte experimental platform
- European HySafe network and HyTunnel-CS project partners

#focus-slide[
  Thank you for your attention. \
  Questions?
]
