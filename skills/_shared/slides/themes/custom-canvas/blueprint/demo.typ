#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: blueprint-theme.with(
  aspect-ratio: "16-9",
  footer: [NET-ZERO DESIGN],
  preset: "classic",
  config-info(
    title: [Sustainable Architecture],
    subtitle: [Net-Zero Building Design Principles],
    author: [Studio Verde Architects],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#set text(font: "IBM Plex Sans", size: 20pt)

#title-slide()

= Passive Design Strategies

== Thermal Mass and Orientation

Building orientation is the single most impactful passive design decision. Proper solar geometry analysis reduces energy demand by 30-40% before any active systems are considered.

- *South-facing glazing* maximizes winter solar gain
- *Thermal mass* in floor slabs stores and releases heat
- *Cross-ventilation* paths aligned with prevailing winds
- *Earth sheltering* on north facades reduces heat loss

== Performance Metrics

#cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true)[
  #spec-card([Thermal Performance])[
    U-value target: 0.15 W/m2K\
    Air changes: 0.6 ACH \@ 50Pa\
    Thermal bridge free design\
    Triple-glazed argon-filled units
  ]
][
  #spec-card([Energy Balance])[
    Heating demand: < 15 kWh/m2/yr\
    Cooling demand: < 10 kWh/m2/yr\
    Primary energy: < 60 kWh/m2/yr\
    On-site generation: > 80%
  ]
]

== Envelope Design Analysis

#dark-slide(title: [Envelope Section Detail])[
  #stack(
    spacing: 0.8em,
    cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
      #grid-stat([0.15], [U-VALUE W/m2K])
    ][
      #grid-stat([300mm], [INSULATION])
    ][
      #grid-stat([0.6], [ACH \@ 50Pa])
    ],
    drawing-note([NOTE: All thermal bridges must be modelled in 3D. Junction psi-values < 0.01 W/mK required at all interfaces.]),
  )
]

= Structural Innovation

== Mass Timber Construction

#cols(columns: (3fr, 2fr))[
  Cross-laminated timber (CLT) offers a structural system with embodied carbon 60-75% lower than reinforced concrete. Modern mass timber buildings reach 18+ stories.

  - *CLT panels*: walls, floors, and roof elements
  - *Glulam beams*: long-span structural members
  - *Dowel-laminated timber*: metal-free connections
  - *Carbon sequestration*: stored biogenic carbon
][
  #spec-card([Material Data])[
    Density: 500 kg/m3\
    Strength class: C24\
    Carbon stored: 0.9 tCO2/m3\
    Fire rating: 90 min (charring)
  ]
]

== Structural Performance

#dark-slide(title: [Load Path Analysis])[
  #cols(columns: (1fr, 1fr), gutter: 20pt)[
    #stack(
      spacing: .8em,
      blueprint-kicker([PRIMARY STRUCTURE]),
      text(size: 14pt, fill: white)[
        CLT core with glulam portal frames. Lateral stability via diaphragm action in floor plates. Foundation: raft on piles to minimize excavation.
      ],
      dimension-line(width: 100pt, color: white)[12,000 mm span],
    )
  ][
    #stack(
      spacing: .8em,
      blueprint-kicker([CONNECTIONS]),
      text(size: 14pt, fill: white)[
        Self-tapping screws for panel-to-panel joints. Steel angle brackets at beam-column nodes. Acoustic isolation pads between floor layers.
      ],
      revision-mark([UPDATED REV.C]),
    )
  ]
]

= Energy Systems

== Integrated Renewables

#hero-slide(scrim: false)[
  #place(top + right, dx: -32pt, dy: 24pt, compass-rose(size: 100pt))
  #pad(x: 4em, y: 3em)[
    #set std.align(left + horizon)
    #block(width: 78%)[
      #stack(
        spacing: .8em,
        blueprint-kicker([ENERGY DETAIL / 03.1]),
        text(size: 38pt, weight: "bold", fill: white)[Integrated Renewables],
        block(width: 72pt, height: 2pt, fill: white.transparentize(30%)),
        text(size: 16pt, fill: white.transparentize(12%))[
          The net-zero energy balance integrates on-site generation with demand reduction through a fabric-first systems strategy.
        ],
        text(size: 14pt, fill: white)[
          • Building-integrated photovoltaics on the south facade\
          • Rooftop PV array — 40 kWp capacity\
          • Ground-source heat pump — COP 4.2 seasonal average\
          • Heat-recovery ventilation — 92% efficiency
        ],
      )
    ]
  ]
]

== System Sizing

#dark-slide(title: [Energy System Overview])[
  #stack(
    spacing: .8em,
    cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt)[
      #grid-stat([40], [kWp PV])
    ][
      #grid-stat([4.2], [GSHP COP])
    ][
      #grid-stat([92%], [MVHR EFF.])
    ][
      #grid-stat([80%], [SELF-USE])
    ],
    drawing-note([NOTE: Battery storage (13.5 kWh) provides peak shaving and grid export optimization. Annual yield modelled at 950 kWh/kWp.]),
  )
]

== Annual Energy Balance

#cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true)[
  #spec-card([Generation])[
    PV yield: 38,000 kWh/yr\
    Self-consumption: 30,400 kWh/yr\
    Grid export: 7,600 kWh/yr\
    Feed-in tariff revenue
  ]
][
  #spec-card([Demand])[
    Space heating: 8,200 kWh/yr\
    Hot water: 4,100 kWh/yr\
    Lighting: 3,800 kWh/yr\
    Equipment: 12,400 kWh/yr
  ]
]

== Design Philosophy

#focus-slide[
  Architecture must work with climate, not against it. Every watt saved through passive design is a watt that never needs generating.
]

== Project Summary

#dark-slide(title: [Project Data Sheet])[
  #stack(
    spacing: .8em,
    title-block(
      [NET-ZERO RESEARCH CENTER],
      number: "A-101",
      date: "2026-05-23",
      scale-text: "1:200",
    ),
    cols(columns: (1fr, 1fr), gutter: 20pt)[
      #stack(
        spacing: .8em,
        blueprint-kicker([CERTIFICATION TARGET]),
        text(size: 14pt, fill: white)[
          Passivhaus Classic\
          BREEAM Outstanding\
          LEED Platinum\
          WELL Gold
        ],
      )
    ][
      #stack(
        spacing: .8em,
        blueprint-kicker([KEY DATES]),
        text(size: 14pt, fill: white)[
          Planning: Q3 2026\
          Construction: Q1 2027\
          Completion: Q4 2028\
          Post-occupancy: Q4 2029
        ],
      )
    ],
  )
]

#ending-slide[Thank You]
