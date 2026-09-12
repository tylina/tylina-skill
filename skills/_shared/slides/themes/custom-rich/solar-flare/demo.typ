// Solar Flare Theme Demo — Helios Energy Corporation Annual Report
// Showcases all slide types and all 8+ components
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Arial")

#show: solar-flare-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Helios Energy Corp -- Annual Report 2026],
  config-info(
    title: [Helios Energy Corporation],
    subtitle: [Powering Tomorrow: Annual Report & Strategic Vision 2026],
    author: [Dr. Amara Okafor, Chief Executive Officer],
    institution: [Helios Energy Corporation],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ==========================================
// Title Slide
// ==========================================
#title-slide()

// ==========================================
// Section 1: Company Overview
// ==========================================
= Company Overview

== Our Mission

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Solar-First Strategy], [
    Helios Energy leads the global transition to renewable power through breakthrough photovoltaic technology. Our mission: make solar energy the most accessible, affordable, and efficient power source on Earth.

    - 14 GW installed capacity worldwide
    - Operating across 32 countries
    - 100% carbon-neutral operations since 2024
  ]),
  concept-card([Innovation Engine], [
    Our R&D division drives continuous advances in cell efficiency, energy storage, and grid integration. We invest 18% of revenue in frontier research, yielding 340+ active patents.

    - Perovskite-silicon tandem cells at 33.7% efficiency
    - Solid-state battery integration
    - AI-driven predictive maintenance
  ], accent: palette.sunset),
)

== Key Performance

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  stat-card([Annual Revenue], [\$18.4B], trend: [+28% YoY]),
  stat-card([Installed GW], [14.2], trend: [+3.8 GW]),
  stat-card([Efficiency Record], [33.7%], trend: [+2.1pts]),
  stat-card([Countries], [32], trend: [+5 new]),
)

#v(0.4em)

#insight-box([Market Leadership], [
  Helios Energy has captured the #1 position in utility-scale solar deployment globally for the third consecutive year. Our vertically integrated supply chain -- from polysilicon production to installation services -- provides a structural cost advantage of 15-20% versus competitors.
])

// ==========================================
// Section 2: Technology & Innovation
// ==========================================
= Technology & Innovation

== Breakthrough Research

#cols[
  *Next-Generation Cell Architecture*

  #energy-card([Perovskite-Silicon Tandem], [
    Our tandem architecture reaches *33.7% conversion efficiency*, a new NREL-certified record. Mass production begins Q3 2026 at Atacama.
  ])

][
  *Energy Storage Integration*

  #concept-card([Solid-State Battery Array], [
    Paired with our solar installations, the Helios PowerVault system delivers 8-hour discharge capacity using proprietary solid-state lithium-metal cells.

    - 450 Wh/kg energy density
    - 10,000+ cycle life
    - 5 MWh modular blocks
  ])

]

== Research Timeline

#radiance-box([R&D Roadmap 2024--2028], [
  Our research pipeline spans fundamental materials science through commercial deployment:
])

#v(0.4em)

#grid(columns: (1fr, 1fr), column-gutter: 2em,
  {
    timeline-entry([2024], [Gen-3 Perovskite Prototype],
      description: [31.2% tandem-cell demonstration])
    timeline-entry([2025], [Pilot Manufacturing Line],
      description: [50 MW pilot validates production yield])
    timeline-entry([2026], [Atacama Gigafactory],
      description: [5 GW automated production capacity])
  },
  {
    timeline-entry([2027], [Quantum Dot Enhancement],
      description: [Spectral splitting targets 36% efficiency])
    timeline-entry([2028], [Space-Grade Deployment],
      description: [Ultra-lightweight orbital panels])
  },
)

// ==========================================
// Section 3: Global Operations
// ==========================================
= Global Operations

== Regional Performance

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  concept-card([Americas], [
    The Americas region delivered exceptional growth driven by the US Inflation Reduction Act and Brazil's solar auction program.

    - Revenue: \$7.2B (+34%)
    - New installations: 1.8 GW
    - Key project: Nevada Solar Ranch (800 MW)
  ]),
  energy-card([Asia-Pacific], [
    APAC remains our fastest-growing region with massive demand from India, Australia, and Southeast Asia.

    - Revenue: \$6.8B (+42%)
    - New installations: 2.1 GW
    - Key project: Rajasthan Solar Park (1.2 GW)
  ]),
  concept-card([EMEA], [
    European markets stabilized with strong growth in Middle East and North Africa greenfield projects.

    - Revenue: \$4.4B (+18%)
    - New installations: 1.4 GW
    - Key project: Sahara Gateway (600 MW)
  ], accent: palette.deep-amber),
)

== Strategic Partnerships

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  radiance-box([Government Alliances], [
    Helios partners with 12 governments on energy-transition plans:

    - *India*: 5 GW deployment under National Solar Mission Phase IV
    - *Saudi Arabia*: NEOM hydrogen integration
    - *Brazil*: Amazon distributed solar
  ]),
  {
    quote-card(
      [Helios Energy represents the gold standard in utility-scale solar. Their technology leadership and execution capability are unmatched in the industry.],
      author: [Bloomberg New Energy Finance, Q1 2026 Report],
    )
  },
)

// ==========================================
// Section 4: Sustainability Impact
// ==========================================
= Sustainability Impact

== Environmental Metrics

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  stat-card([CO₂ Avoided], [48M tons], trend: [Annual]),
  stat-card([Water Saved], [12B liters], trend: [vs. thermal]),
  stat-card([Land Efficiency], [+40%], trend: [Bifacial tech]),
)


#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  insight-box([Circular Economy], [
    Helios Rebirth recovers 97% of materials from 200,000 end-of-life panels each year.

    *Target*: Zero landfill by 2028 across all product lines.
  ], accent: palette.deep-amber),
  insight-box([Biodiversity Integration], [
    Every solar farm uses EcoSolar methodology:

    - Pollinator-friendly ground cover beneath panels
    - Wildlife corridors through array spacing
    - Native vegetation restoration
  ]),
)

== Community Investment

#cols[
  *Solar Access Program*

  #concept-card([Powering Communities], [
    The Helios Foundation has deployed 450 MW of community solar, serving 2.8 million people.
  ])

  #cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    stat-card([People Served], [2.8M], trend: [+800K this year]),
    stat-card([Schools Powered], [4,200], trend: [12 countries]),
    stat-card([Jobs Created], [18,500], trend: [Local hiring]),
  )
][
  *Education & Training*

  #energy-card([Solar Academy Network], [
    Solar Academy runs 24 centers and graduates 6,000 technicians annually.
  ])

  #callout-box([Impact Highlight], [
    92% of graduates are employed within three months; income rises 3.4x.
  ], kind: "success")

]

// ==========================================
// Focus Slide
// ==========================================

#focus-slide[
  _"The sun delivers more energy to Earth in one hour than humanity consumes in an entire year. Our job is simply to capture it."_

  #text(size: 0.5em, weight: "regular")[-- Dr. Amara Okafor, Helios Energy CEO]
]

// ==========================================
// Section 5: Financial Outlook
// ==========================================
= Financial Outlook

== 2027 Guidance

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  {
    concept-card([Revenue Targets], [
      Fiscal 2027 guidance reflects continued momentum:

      - *Revenue*: \$22--24B
      - *EBITDA margin*: 28--30%
      - *CapEx*: \$6B (Gigafactory expansion)
    ])
    callout-box([Analyst Consensus], [
    Consensus is \$23.1B revenue; 18 of 22 analysts rate HLSE a Buy.
    ], kind: "info")
  },
  {
    radiance-box([Growth Catalysts], [
      Three structural tailwinds:

      *1. Policy momentum* -- IRA, EU Green Deal, India's PLI

      *2. Technology leadership* -- Gen-4 cells cut costs 20%

      *3. Storage attachment* -- PowerVault rises from 35% to 65%
    ])
  },
)

// ==========================================
// Ending Slide
// ==========================================

#ending-slide[Thank You]
