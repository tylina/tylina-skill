#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#set text(font: ("Helvetica Neue", "Arial"), size: 16pt)

#show: morning-dew-theme.with(
  aspect-ratio: "16-9",
  footer: [Freshwater Ecosystems Lab],
  config-info(
    title: [Ecosystem Resilience in Freshwater Habitats],
    subtitle: [A Multi-Scale Analysis of Biodiversity Recovery Patterns],
    author: [Dr. Elena Marsh & Prof. James Liu],
    date: datetime.today(),
    institution: [Department of Ecology, Riverside University],
  ),
  config-common(breakable: false),
)

#title-slide()

#outline-slide()

= Introduction

== Research Context

#cols[
  Freshwater ecosystems represent only *0.8%* of Earth's surface area yet harbor over *6% of all described species*. Understanding their resilience mechanisms is critical for conservation planning.

  #mist-box([Research Gap], [
    While terrestrial ecosystem resilience has been extensively modeled, freshwater habitats---particularly ephemeral wetlands and headwater streams---remain poorly characterized in terms of recovery dynamics following perturbation events.
  ])
][
  #dew-card([Study Objectives], [
    - Quantify biodiversity recovery rates across five habitat types
    - Identify keystone species that accelerate community reassembly
    - Model threshold effects in nutrient cycling restoration
    - Develop predictive frameworks for management planning
  ])
]

== Study Sites Overview

#cols[
  #leaf-card([Site Selection Criteria], [
    Sites were selected using stratified random sampling across the Columbia River Basin (n=47). Each site experienced documented disturbance events between 2019--2023, with pre-disturbance baseline data available from the National Aquatic Monitoring Program.
  ])

  #v(8pt)

  #dawn-tag([Longitudinal Study]) #h(4pt) #dawn-tag([47 Sites], color: palette.leaf) #h(4pt) #dawn-tag([5-Year Span], color: palette.petal)
][
  #droplet-stat([47], [Study Sites])
  #v(8pt)
  #droplet-stat([5], [Habitat Types], accent: palette.leaf)
]

= Methodology

== Sampling Protocol

#cols[
  #branch-entry([1], [Site Characterization], [
    Physical habitat surveys using EPA Rapid Bioassessment Protocol. Water chemistry sampling at 3 depths per station.
  ])

  #branch-entry([2], [Biological Sampling], [
    Macroinvertebrate collections (Surber sampler, 0.09 m#super[2]). Fish electrofishing in 100m reaches. Periphyton scrapes on natural substrates.
  ], accent: palette.dewdrop)

  #branch-entry([3], [Temporal Replication], [
    Quarterly sampling over 20 months post-disturbance. Additional event-driven sampling within 72 hours of flood/drought episodes.
  ], accent: palette.petal)
][
  #prism-card([Key Metrics], [
    - Shannon-Wiener Diversity Index (H')
    - Functional Dispersion (FDis)
    - Nutrient Spiraling Length (S#sub[w])
    - Ecosystem Metabolism (GPP/ER ratios)
    - Hydrological Connectivity Index
  ])
]

== Statistical Framework

#cols[
  #mist-box([Analytical Approach], [
    Bayesian hierarchical models captured site-level random effects and spatial autocorrelation. We fitted recovery trajectories with generalized additive mixed models (GAMMs).
  ], accent: palette.leaf)

  #v(8pt)

  #petal-quote(
    [Resilience research must distinguish genuine recovery from alternative stable states that only mimic the original community.],
    author: [Holling & Gunderson, 2002],
  )
][
  #specimen-table(
    ([Parameter], [Method], [Software]),
    (
      ([Diversity], [Rarefaction], [vegan 2.6]),
      ([Traits], [FD indices], [FD 1.0]),
      ([Recovery], [GAMM], [mgcv 1.9]),
      ([Thresholds], [Bayesian CP], [mcp 0.3]),
      ([Spatial], [PCNM], [adespatial]),
    ),
  )
]

= Results

== Biodiversity Recovery Patterns

#cols[
  Recovery trajectories differed significantly among habitat types (F#sub[4,42] = 12.7, p < 0.001). Headwater streams showed the fastest recovery (mean = 14.2 months), while isolated wetlands exhibited the slowest (mean = 38.6 months).

  #morning-divider()
  #v(4pt)

  #mist-box([Key Finding], [
    Hydrological connectivity was the strongest predictor of recovery rate (partial R#super[2] = 0.43), exceeding the influence of disturbance intensity, catchment land use, and pre-disturbance diversity.
  ])
][
  #grid(columns: (1fr, 1fr), column-gutter: 10pt, row-gutter: .8em,
    droplet-stat([14.2], [Months (Streams)]),
    droplet-stat([38.6], [Months (Wetlands)], accent: palette.petal),
    droplet-stat([0.43], [R² Connectivity], accent: palette.leaf),
    droplet-stat([87%], [Sites Recovered], accent: palette.gold),
  )
]

== Keystone Species Analysis

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  dew-card([Primary Facilitators], [
    - _Gammarus lacustris_ (detritivore) --- accelerates leaf litter processing by 340%
    - _Rhithrogena_ spp. (grazer) --- maintains periphyton in early successional state
    - _Cottus cognatus_ (predator) --- top-down regulation of invertebrate community structure
  ]),
  dew-card([Functional Redundancy], [
    Sites with higher functional redundancy (FRed > 0.6) recovered 2.3× faster than functionally depauperate systems. This suggests that *trait diversity*, not species richness alone, drives resilience.
  ], accent: palette.leaf),
)

#dawn-tag([Facilitation Cascade]) #h(4pt) #dawn-tag([Functional Traits], color: palette.leaf) #h(4pt) #dawn-tag([Trophic Interactions], color: palette.petal) #h(4pt) #dawn-tag([Recovery Acceleration], color: palette.gold)

== Nutrient Cycling Thresholds

#cols[
  #leaf-card([Threshold Detection], [
    Bayesian change-point analysis identified a critical nitrogen-cycling threshold at about 60% of baseline invertebrate biomass. Below it, spiraling lengths rise exponentially.

    Nutrient uptake length (spiraling length):
    #mitex(`S_w = \frac{Q \cdot C}{v_f \cdot C \cdot w} = \frac{Q}{v_f \cdot w}`)
  ])

][
  #prism-card([Implications], [
    These thresholds define *minimum viable populations* for ecosystem function recovery. Management actions that maintain invertebrate communities above 60% of baseline biomass can prevent prolonged nutrient cycling disruption.
  ])

  #v(8pt)

  #petal-quote(
    [Ecosystems resist, then collapse. Locating those tipping points is central to restoration ecology.],
    author: [Scheffer et al., 2012],
  )
]

== Threshold Evidence

#cols[
  #mist-box([Recovery Signal], [
    Thresholds were estimated from four nutrient pools. Recovery time lengthened most sharply where biomass remained below the observed change point.
  ], accent: palette.leaf)
][
  #specimen-table(
    ([Nutrient], [Threshold], [Recovery (days)], [p-value]),
    (
      ([NH₄-N], [58% biomass], [127 ± 23], [< 0.001]),
      ([NO₃-N], [62% biomass], [156 ± 31], [< 0.001]),
      ([SRP], [71% biomass], [89 ± 18], [0.003]),
    ),
  )
]

= Discussion

== Synthesis & Implications

#cols[
  #mist-box([Conservation Implications], [
    Our findings support prioritizing hydrological connectivity restoration over direct species reintroduction. Maintaining corridor connectivity between refugia allows natural recolonization processes to drive recovery more effectively than active intervention in most cases.
  ], accent: palette.dewdrop)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    leaf-card([Short-term], [
      Protect refugia and maintain minimum flows.
    ]),
    leaf-card([Medium-term], [
      Restore lateral connectivity and remove barriers.
    ], accent: palette.dewdrop),
    leaf-card([Long-term], [
      Build redundancy and plan for climate adaptation.
    ], accent: palette.petal),
  )
][
  #dew-card([Management Framework], [
    We propose a three-tiered decision framework:

    + *Monitor*: Track functional trait composition as early warning indicator
    + *Maintain*: Ensure connectivity above critical threshold (> 3 corridors per patch)
    + *Intervene*: Active restoration only when natural recovery stalls beyond 24 months
  ])
]

== Limitations & Future Directions

#cols[
  #petal-quote(
    [Every model is wrong, but some models are useful. The key is knowing which assumptions matter most for the questions we are asking.],
    author: [Box, 1976],
  )


  #grid(columns: (1fr, 1fr), column-gutter: 14pt,
    mist-box([Study Limitations], [
      - Geographic scope limited to Pacific Northwest
    ]),
    mist-box([Future Research], [
      - Expand to Mediterranean-climate freshwater systems
    ], accent: palette.leaf),
  )
][
  #prism-card([Emerging Questions], [
    - How do climate-driven flow regime shifts interact with connectivity thresholds?
    - Can functional trait databases predict recovery trajectories _a priori_?
    - What is the minimum monitoring effort required for early warning detection?
  ])

  #v(8pt)

  #dawn-tag([Open Science]) #h(4pt) #dawn-tag([Reproducible], color: palette.leaf) #h(4pt) #dawn-tag([Data: Zenodo], color: palette.gold)
]

#focus-slide[
  Resilience is not the absence of disturbance, \
  but the capacity for renewal. \
  \
  Freshwater ecosystems teach us that connectivity \
  --- not control --- drives recovery.
]

#ending-slide[Thank You]
