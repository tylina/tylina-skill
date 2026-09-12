#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/merman:0.1.0": show-mermaid-blocks

#show: checklist.with(stroke: palette.blue, radius: 0.2em)
#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 100%)

#set text(font: ("Charter", "Arial Unicode MS"), size: 18pt)

#show: blueprint-theme.with(
  aspect-ratio: "16-9",
  footer: [Structural Engineering \u{2014} Design Review],
  config-info(
    title: [Sustainable Tower Design],
    subtitle: [Structural Analysis & Material Specification],
    author: [Meridian Engineering Group],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
  config-common(breakable: false),
)

#title-slide()

= Structural Overview

== Design Parameters

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
  stat-card([42], [Total Floors], unit: [fl]),
  stat-card([186], [Height], unit: [m]),
  stat-card([98.7], [Efficiency], unit: [%]),
  stat-card([2.4], [Aspect Ratio], unit: [H/W]),
)

#blueprint-divider()

#insight-box[The structural system achieves a 23% reduction in embodied carbon compared to conventional steel-frame towers of equivalent height, through optimized material placement guided by topology analysis.]

== Core Structural System

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 14pt,
  concept-card([Diagrid Exoskeleton], [
    Primary lateral and gravity load path via external diagrid. Steel nodes at 4.5m intervals with bolted connections rated to 2400kN.
  ], zone: "A1"),
  concept-card([Post-Tensioned Core], [
    Central RC core walls with unbonded post-tensioning providing 60% of overturning resistance. Wall thickness varies from 800mm to 400mm.
  ], zone: "B2"),
  concept-card([Outrigger System], [
    Belt trusses at levels 14, 28, and 38 connecting core to perimeter columns. Reduces drift by 35% under design wind.
  ], zone: "C1"),
)

== Material Specifications

#grid(columns: (2fr, 1fr), column-gutter: 20pt,
  {
    spec-card([Structural Steel], [
      - Grade: S460 high-strength\
      - Yield: 460 MPa minimum\
      - Diagrid members: CHS 508\u{00D7}25\
      - Connection type: Bolted end-plates\
      - Fire rating: R120 via intumescent
    ], rev: "C")
    v(0.6em)
    spec-card([Concrete], [
      - Core: C80/95 high-performance\
      - Slabs: C40/50 lightweight\
      - Post-tension: 1860 MPa strand\
      - Cover: 40mm (internal), 50mm (external)
    ], rev: "B")
  },
  {
    schematic-card([Design Codes], [
      - EN 1990 \u{2014} Basis of Design\
      - EN 1991 \u{2014} Actions on Structures\
      - EN 1992 \u{2014} Concrete Design\
      - EN 1993 \u{2014} Steel Design\
      - EN 1998 \u{2014} Seismic Design
    ])
    v(0.6em)
    callout-box([Critical Note], [
      Seismic design category D applies. All connections must achieve full ductility classification per EN 1998-1 \u{00A7}6.
    ])
  },
)

= Load Analysis

== Wind Engineering

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    quote-card(attribution: [ASCE 7-22 Commentary])[Wind tunnel testing is recommended for buildings with height-to-width ratios exceeding 5:1 or with unusual geometric configurations.]
    v(0.6em)
    grid(columns: (1fr, 1fr), column-gutter: 10pt,
      stat-card([1.82], [Peak Pressure], unit: [kPa]),
      stat-card([H/500], [Drift Limit]),
    )
  },
  {
    dimension-box([Wind Tunnel Results], [
      Peak base moment: 1,240 MN\u{00B7}m\
      Peak base shear: 18.6 MN\
      Vortex shedding period: 4.2s\
      Acceleration (10-yr return): 12 milli-g\
      Along-wind response factor: 0.78
    ])
    v(0.5em)
    blueprint-tag[VERIFIED]
    h(4pt)
    blueprint-tag[PEER REVIEWED]
    h(4pt)
    blueprint-tag[REV C]
  },
)

== Seismic Performance

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  spec-card([Performance Objectives], [
    - DBE: Immediate Occupancy\
    - MCE: Life Safety\
    - Importance factor: 1.25\
    - Response modification: R\=8
  ], rev: "A"),
  concept-card([Damping Strategy], [
    Viscous dampers in outrigger connections provide supplemental damping ratio of 4%. Total effective damping: 6.5% at design-level response.
  ], zone: "D3"),
  schematic-card([Analysis Methods], [
    - Response spectrum (all load combos)\
    - Nonlinear time-history (7 records)\
    - Pushover (validation)\
    - Soil-structure interaction included
  ]),
)

#focus-slide[Every structural member is precisely sized to carry exactly the forces demanded of it \u{2014} nothing more, nothing less]

= Sustainability

== Embodied Carbon Analysis

#grid(columns: (3fr, 2fr), column-gutter: 20pt,
  {
    concept-card([Carbon Reduction Strategy], [
      Through material optimization, recycled content specification, and biogenic material substitution, the project achieves a 42% reduction in whole-life carbon compared to the RIBA 2030 baseline target.
    ], zone: "E1")
    v(0.6em)
    grid(columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
      stat-card([680], [Structure], unit: [kgCO\u{2082}/m\u{00B2}]),
      stat-card([42], [Reduction], unit: [%]),
      stat-card([A1\u{2013}A5], [Stages]),
    )
  },
  {
    dimension-box([Material Breakdown], [
      Steel (60% recycled): 38% of total\
      Concrete (30% GGBS): 45% of total\
      Timber (CLT floors): 12% of total\
      Other (connections, etc.): 5% of total
    ])
    v(0.5em)
    callout-box([Target Alert], [
      LETI 2025 target is 600 kgCO\u{2082}/m\u{00B2} for commercial towers. Current design at 680 requires further optimization.
    ], accent: palette.red)
  },
)

== Embodied Carbon Profile

#lq.diagram(
  width: 82%,
  height: 190pt,
  lq.bar(
    (1, 2, 3, 4),
    (258, 306, 82, 34),
    width: 0.6,
    fill: palette.blue,
  ),
  lq.xaxis(label: [Material], ticks: ((1, [Steel]), (2, [Concrete]), (3, [Timber]), (4, [Other]))),
  lq.yaxis(label: [Embodied Carbon (kgCO₂/m²)]),
)

== Circular Design Principles

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    schematic-card([Design for Disassembly], [
      All primary connections are bolted (not welded). Steel diagrid members can be unbolted and reused. Floor cassettes are prefabricated CLT panels with mechanical fixings only.
    ])
    v(0.5em)
    insight-box[Estimated material recovery rate at end-of-life: 87% by mass. Steel members designed for direct reuse without reprocessing in 65% of cases.]
  },
  {
    quote-card(attribution: [Ellen MacArthur Foundation])[A circular economy for buildings requires designing out waste from the start, keeping materials in use, and regenerating natural systems.]
    v(0.5em)
    grid(columns: (1fr, 1fr), column-gutter: 10pt,
      stat-card([87], [Recovery], unit: [%]),
      stat-card([65], [Direct Reuse], unit: [%]),
    )
  },
)

= Construction

== Phasing Strategy

#figure[
  ```mermaid
  gantt
    title Construction Schedule
    dateFormat YYYY-MM-DD
    axisFormat %b '%y

    section Foundation
    Piling (42 piles to rock)   : f1, 2026-03-01, 90d
    Raft & basement             : f2, after f1, 90d
    Foundation complete         : milestone, m1, after f2, 0d

    section Superstructure
    Core slipform (4m/day)      : s1, after f2, 180d
    Diagrid erection (3-storey lifts) : s2, 2026-10-01, 360d
    Floor slabs (5 days/floor)  : s3, 2026-11-01, 300d

    section Envelope
    Curtain wall (from L8)      : e1, 2027-03-01, 420d
    Completion                  : milestone, m2, 2028-06-30, 0d
  ```
]

== Phasing Specifications

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  spec-card([Phase 1: Foundation], [
    - Piled raft: 1.2m dia \u{00D7} 45m\
    - 42 piles to competent rock\
    - Dewatering to -18m\
    - Duration: 6 months
  ], rev: "D"),
  spec-card([Phase 2: Superstructure], [
    - Core: slipform at 4m/day\
    - Diagrid: 3-storey lifts\
    - Floor cycle: 5 days/floor\
    - Duration: 18 months
  ], rev: "C"),
  spec-card([Phase 3: Envelope], [
    - Unitized curtain wall\
    - Installed from level 8 onward\
    - Parallel with structure\
    - Duration: 14 months
  ], rev: "B"),
)


== Pre-Construction Checklist

#callout-box([Construction Readiness Gates], [
  All items must be cleared before groundbreaking is authorised.
])

#v(0.5em)

#insight-box[
  - [x] Structural peer review and sign-off by independent engineer complete
  - [x] Planning consent granted and Section 106 agreements executed
  - [/] Enabling works contractor mobilised and site hoarding installed
  - [/] Piling rig procurement and logistics schedule confirmed
  - [ ] Slipform subcontractor contract finalised and design freeze achieved
  - [ ] Insurances, bonds, and parent company guarantees in place
]

#focus-slide[Precision in planning yields precision in execution]

#ending-slide[Thank You]
