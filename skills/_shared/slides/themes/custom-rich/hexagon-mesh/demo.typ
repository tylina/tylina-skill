// Hexagon Mesh Theme Demo — Materials Science & Nanotechnology Presentation
// Molecular structures, honeycomb patterns, crystalline lattice aesthetics
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#set text(font: "IBM Plex Sans")
#show raw: set text(font: "IBM Plex Mono")

#show: hexagon-mesh-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [NanoMaterials Conference 2026 -- Advanced Materials Track],
  config-info(
    title: [Graphene-Based Metamaterials for Next-Generation Energy Storage],
    subtitle: [Hexagonal Lattice Engineering at the Atomic Scale],
    author: [Dr. Kenji Nakamura, Materials Science Division],
    institution: [National Institute for Advanced Materials Research],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

// ======================================
// Title Slide
// ======================================
#title-slide()

// ======================================
// Section 1: Introduction
// ======================================
= Introduction

== The Promise of 2D Materials

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    hex-card([Graphene Revolution], [
      Since its isolation in 2004, graphene has demonstrated extraordinary properties: *200x stronger than steel*, electron mobility of 200,000 cm^2/Vs, and thermal conductivity of 5,000 W/mK.

      The hexagonal carbon lattice provides a perfect scaffold for engineering metamaterials.
    ], accent: palette.primary),
    hex-card([Beyond Single Layers], [
      Stacking and twisting 2D materials creates *moire superlattices* with emergent properties not found in constituent layers.

      Magic-angle twisted bilayer graphene exhibits unconventional superconductivity at 1.1 degrees.
    ], accent: palette.secondary),
)

== Key Insight

#molecule-box([Key Insight], [
    By precisely controlling the hexagonal lattice geometry at nanometer scales, we can engineer materials with *programmable* electronic, thermal, and mechanical properties -- enabling a new paradigm in energy storage.

    The theoretical specific surface area of a perfect graphene monolayer:
    #mitex(`
      A_{\mathrm{sp}} = \frac{2 N_A a^2 \sqrt{3}}{2 M_C} \approx 2630 \; \mathrm{m^2\,g^{-1}}
    `)
])

== Current State of the Art

#grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 0.8em,
    node-stat([Capacity], [1,850 mAh/g], color: palette.primary),
    node-stat([Cycle Life], [12,000+], color: palette.secondary),
    node-stat([Charge Rate], [6C], color: palette.accent),
    node-stat([Efficiency], [99.2%], color: palette.primary),
)

== Research Landscape

#cols[
    #structure-box([Research Landscape], [
      *Established Approaches*: Lithium-ion intercalation, solid-state electrolytes, silicon anodes, sulfur cathodes.

      *Emerging Frontiers*: Graphene supercapacitors, MXene hybrid electrodes, metal-organic frameworks, covalent organic frameworks.

      *Our Contribution*: A novel hexagonal mesh architecture that combines the surface area of graphene with the ion channels of MOFs.
    ])
  ][
    #stack(
      spacing: .8em,
      mesh-card([Performance Targets], [
        Our hexagonal mesh metamaterial aims to achieve:
        - *Energy density*: >500 Wh/kg (vs. 250 current Li-ion)
        - *Power density*: >10 kW/kg (supercapacitor-class)
        - *Cycle stability*: >50,000 cycles at 80% retention
        - *Cost*: <\$50/kWh at scale production
      ], accent: palette.primary),
      electron-list([
        - Graphene nanomesh scaffold (2nm pore size)
        - Transition metal oxide active sites
        - Ionic liquid electrolyte channels
        - Self-healing polymer binder network
      ], color: palette.primary),
    )
]

// ======================================
// Section 2: Hexagonal Architecture
// ======================================
= Hexagonal Architecture

== Lattice Design Principles

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    mesh-card([Pore Geometry], [
      Hexagonal pores maximize surface-to-volume ratio. Block copolymer lithography precisely etches 2nm pores for uniform ion transport across the electrode.
    ], accent: palette.primary),
    mesh-card([Node Chemistry], [
      Vertex nodes are functionalized with transition metal oxides (MnO2, RuO2) serving as pseudocapacitive active sites.

      Each node contributes both Faradaic and non-Faradaic charge storage.
    ], accent: palette.accent),
    mesh-card([Bond Engineering], [
      C-C bonds along hexagonal edges are selectively modified to create preferential ion pathways.

      Nitrogen doping at strategic positions enhances conductivity by 40%.
    ], accent: palette.secondary),
  ),
  bond-divider(width: 60%),
  grid(columns: (1fr, 1fr), gutter: 1em,
    node-stat([Pore Density], [10^12 /cm^2], color: palette.primary),
    node-stat([Surface Area], [2,630 m^2/g], color: palette.secondary),
  ),
)

== Synthesis Process

#cols[
  #stack(
    spacing: .8em,
    hex-card([Step 1: Template Formation], [
      ```
      CVD graphene on Cu foil (1050C, CH4/H2)
      Transfer to SiO2/Si substrate
      Spin-coat PS-b-PMMA (45nm period)
      Anneal at 250C for 24h (hex ordering)
      ```
      Block copolymer self-assembly creates a hexagonal template with 2nm precision.
    ], accent: palette.primary),
    hex-card([Step 2: Pore Etching], [
      ```
      O2 plasma etch (10W, 30s)
      Remove PMMA domains selectively
      HF rinse to clean residues
      Verify with TEM (hex pattern)
      ```
      Selective removal of minority block creates uniform hexagonal nanopores.
    ], accent: palette.secondary),
  )
]

== Functionalization & Scale-up

#stack(
    spacing: .8em,
    hex-card([Step 3: Node Functionalization], [
      ```
      ALD of MnO2 (100 cycles, 150C)
      Selective deposition at vertices
      Electrochemical activation (0.5M H2SO4)
      XPS confirmation of oxidation state
      ```
      Atomic layer deposition ensures conformal coating at hex vertices.
    ], accent: palette.accent),
    molecule-box([Process Advantage], [
      Our synthesis is *scalable* -- the block copolymer approach works on roll-to-roll systems. Current pilot line produces 100 m^2/day of hexagonal nanomesh graphene.

      Cost per electrode: *\$0.12/cm^2* (target: \$0.03/cm^2 at full scale).
    ], accent: palette.primary),
)

// ======================================
// Section 3: Results
// ======================================
= Results

== Electrochemical Performance

#stack(
  spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
    node-stat([Energy Density], [523 Wh/kg], color: palette.primary),
    node-stat([Power Density], [14.2 kW/kg], color: palette.accent),
    node-stat([Coulombic Eff.], [99.7%], color: palette.secondary),
    node-stat([Retention], [94% \@50k], color: palette.primary),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    hex-card([Charge/Discharge Profile], [
      - *Voltage window*: 0.01 -- 3.0 V vs. Li/Li+
      - *Rate capability*: 85% capacity retained at 10C
      - *First-cycle loss*: Only 3.2% (vs. typical 15-25%)
      - *Voltage hysteresis*: \<50 mV at 1C rate
      - *Self-discharge*: \<2% per month at room temperature
    ], accent: palette.primary),
    hex-card([Stability Analysis], [
      - *Calendar aging*: \<5% degradation over 5 years (predicted)
      - *Thermal stability*: Operational from -40C to 80C
      - *Mechanical integrity*: Withstands 10,000 flex cycles
      - *Dendrite prevention*: Zero short circuits in 1,000 cell tests
      - *Gas evolution*: Negligible above 4.2V cutoff
    ], accent: palette.secondary),
  ),
)

== Comparative Analysis

#stack(
  spacing: .8em,
    structure-box([vs. Commercial Li-ion (NMC 811)], [
      Our hexagonal mesh electrode demonstrates:
      - *2.1x* higher gravimetric energy density
      - *5.7x* higher power density
      - *8.3x* longer cycle life
      - *0.4x* material cost per kWh

      The hexagonal pore architecture enables simultaneous high energy and high power -- breaking the traditional trade-off.
    ], accent: palette.secondary),
    stack(dir: ltr, spacing: 0.5em,
      atom-tag([Graphene], color: palette.primary),
      atom-tag([MnO2], color: palette.accent),
      atom-tag([2nm Pores], color: palette.secondary),
    ),
)

== Key Differentiator

#stack(
  spacing: .8em,
    lattice-quote([
      "The hexagonal nanomesh architecture represents a fundamental shift in how we think about electrode design -- moving from bulk materials to precisely engineered atomic scaffolds."
    ], attribution: [Nature Energy, Peer Review 2026]),
    molecule-box([Key Differentiator], [
      Unlike conventional porous carbons with *random* pore distributions, our hexagonal mesh provides:
      - Uniform ion diffusion length (1nm to any active site)
      - No dead pores or bottlenecks
      - Predictable tortuosity factor (1.05 vs. typical 3-5)
    ], accent: palette.primary),
)

// ======================================
// Section 4: Applications
// ======================================
= Applications

== Target Markets

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    mesh-card([Electric Vehicles], [
      *Problem*: Current EV batteries trade range for charging speed.

      *Our Solution*: Hex-mesh cells deliver 500+ km range with 10-minute charging (10C rate).

      - Compatible with existing pack designs
      - 40% weight reduction at pack level
      - Thermal runaway risk eliminated
    ], accent: palette.primary),
    mesh-card([Grid Storage], [
      *Problem*: Renewable intermittency requires massive, long-lived storage.

      *Our Solution*: 50,000+ cycle lifetime with negligible degradation.

      - 30-year operational lifetime
      - No rare earth metals required
      - Fully recyclable at end of life
      - LCOE: \$0.02/kWh (projected)
    ], accent: palette.accent),
)

== Additional Markets

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    mesh-card([Aerospace], [
      Ultra-high power density enables:
      - Electric aircraft propulsion
      - Satellite power systems
      - Launch vehicle energy recovery
    ], accent: palette.secondary),
    mesh-card([Medical Devices], [
      Biocompatible and flexible:
      - Implantable power sources
      - Wearable health monitors
      - Neural interface energy supply
    ], accent: palette.primary),
)

== Manufacturing Roadmap

#cols[
  #stack(
    spacing: .8em,
    hex-card([Phase 1: Lab Scale (Current)], [
      - 10 cm^2 electrode area
      - Batch process (24h/batch)
      - 100 cells/month capacity
      - Full characterization pipeline
    ], accent: palette.primary),
    hex-card([Phase 2: Pilot Line (2027)], [
      - Roll-to-roll processing
      - 100 m^2/day throughput
      - 10,000 cells/month capacity
      - Automated quality control
    ], accent: palette.accent),
  )
][
  #stack(
    spacing: .8em,
    hex-card([Phase 3: Full Scale (2028)], [
      - Gigafactory integration
      - 10,000 m^2/day throughput
      - 1M cells/month capacity
      - <\$50/kWh production cost
    ], accent: palette.secondary),
    electron-list([
      - Block copolymer supplier confirmed (BASF)
      - CVD equipment ordered (Veeco GenXcel)
      - Pilot facility construction underway (Tsukuba)
      - First customer samples Q4 2026
    ], color: palette.primary),
  )
]

// ======================================
// Section 5: Outlook
// ======================================
= Outlook

== Next Steps

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    hex-card([2026 H2], [
      - 50 cm^2 full cells demonstrated
      - Third-party validation complete
      - Patent portfolio secured (8 filed)
      - Series B funding close
    ], accent: palette.primary),
    hex-card([2027], [
      - Pilot line operational
      - First automotive partner cells
      - Grid storage prototype (1 MWh)
      - ISO 62660 certification
    ], accent: palette.accent),
    hex-card([2028-2029], [
      - Gigafactory construction
      - Commercial EV cell delivery
      - Grid storage deployment
      - Next-gen hex-mesh v2.0
    ], accent: palette.secondary),
)

== Open Research Questions

#stack(
  spacing: .8em,
  bond-divider(color: palette.secondary, width: 60%),
  molecule-box([Open Research Questions], [
    Three fundamental challenges remain for the community:
    + *Defect tolerance*: How many missing hex nodes can the lattice sustain before performance degrades?
    + *Scalability limits*: Can sub-nm pore precision be maintained at >1000 m^2/day production rates?
    + *Interface engineering*: Optimal solid-electrolyte interphase composition on hex-mesh surfaces.
  ], accent: palette.secondary),
)

== Collaboration & Funding

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    hex-card([For Academic Partners], [
      *Opportunities*:
      - Joint publications on hex-mesh characterization
      - Shared access to pilot-line samples
      - Student exchange program (3-6 months)
      - Co-PI grants (JST, NEDO, EU Horizon)

      Contact: collaborations\@nanomat-institute.jp
    ], accent: palette.primary),
    hex-card([For Industry Partners], [
      *Offerings*:
      - Custom hex-mesh formulations for specific applications
      - Joint development agreements (12-18 month programs)
      - Licensing of core patents for non-competing fields
      - Technical advisory services

      Contact: partnerships\@nanomat-institute.jp
    ], accent: palette.secondary),
  ),
  structure-box([Acknowledgments], [
    This work is supported by JST CREST Grant No. JPMJCR2024, NEDO Green Innovation Fund, and the EU Horizon Europe GraphHex Consortium. We thank Prof. A. Geim (Manchester) and Prof. Y. Zhang (Tsinghua) for fruitful discussions.
  ], accent: palette.secondary),
)

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  #stack(
    spacing: .8em,
    [_"Nature chose the hexagon for a reason -- from honeycombs to carbon rings, it is geometry's most efficient tiling. We are learning to speak that language at the atomic scale."_],
    text(size: 0.6em, weight: "regular", fill: palette.primary-light)[-- Dr. Kenji Nakamura, NanoMaterials Conference 2026],
  )
]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Thank You]
