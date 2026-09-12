#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: solarpunk-theme.with(
  aspect-ratio: "16-9",
  footer: [Solarpunk Cities Initiative],
  preset: "dawn",
  config-info(
    title: [Building the Living City],
    subtitle: [Urban Architecture for a Regenerative Future],
    author: [Dr. Maya Greenwood],
    date: datetime.today(),
    institution: [Institute for Regenerative Urbanism],
  ),
  config-common(breakable: false),
)

#set text(font: ("Avenir Next", "Arial", "Noto Sans SC"), size: 20pt)

#title-slide()

#speaker-note[Open by framing the city as a living system rather than a conventional built environment.]

= Foundations of Solarpunk Urbanism

#speaker-note[Introduce the first section: the design principles that let architecture regenerate ecological capacity.]

== Living Architecture Principles

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  canopy-card([Biophilic Integration], [
    Every building surface becomes habitat. Green walls produce oxygen, filter air, and provide food. The boundary between indoor and outdoor dissolves.
  ]),
  canopy-card([Solar Symbiosis], [
    Photovoltaic cells embedded in leaf-shaped panels follow the sun. Energy generation mimics the forest canopy -- layered, distributed, resilient.
  ]),
)

#v(0.5em)

#solarium-highlight[
  *Key Insight:* A solarpunk city generates 140% of its energy needs through distributed solar, wind, and biogas -- the excess powers vertical farms and community workshops.
]

#speaker-note[Emphasize that distributed production creates surplus for shared civic infrastructure.]

== The Energy Ecosystem

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  solar-stat([Solar Yield], [4.2], description: [TWh per district annually]),
  solar-stat([Green Cover], [87%], description: [of all roof surfaces]),
  solar-stat([Carbon Neg.], [-12], description: [tonnes CO2 per capita]),
)

#v(0.4em)

#vine-divider()

#seed-quote([
  The city does not consume nature -- it *is* nature. Every wall breathes, every roof photosynthesizes, every street drains and filters.
], cite: "Lena Okoro, Urban Ecologist")

#speaker-note[Use the metrics to connect ecological coverage with everyday energy reliability, then let the quote land.]

== Urban Biomes Classification

#cols(columns: (1fr, 1fr), gutter: 14pt,
  biome-box([Canopy District], [
    High-rise food forests integrated with residential towers. Vertical farms produce 60% of district food. Elevated walkways connect tree-level communities.
  ]),
  biome-box([Solar Commons], [
    Open plazas with photovoltaic shade structures. Community workshops powered by overhead panels. Markets operate on local energy credits.
  ]),
)

#v(0.4em)

#cols(columns: (1fr, 1fr), gutter: 14pt,
  biome-box([Mycelium Quarter], [
    Underground networks connect buildings through fungal-based communication systems. Waste becomes nutrient. Nothing is discarded -- only transformed.
  ]),
  biome-box([Waterfall Corridor], [
    Cascading rain gardens along transit routes. Greywater recycled through living walls. Every storm feeds the city rather than flooding it.
  ]),
)

#speaker-note[Describe the four districts as complementary habitats, not isolated urban projects.]

= Technology & Nature Fusion

#speaker-note[Transition from spatial patterns to the biological technologies that make them operational.]

== The Photosynthesis Engine

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  photosynthesis-card([Artificial Leaf Cells], [
    Bio-mimetic solar cells that replicate chloroplast efficiency. Each panel converts CO2 directly into biofuel while generating electricity. Efficiency: 34%.
  ]),
  photosynthesis-card([Mycelium Networks], [
    Fungal computing substrates replace silicon for local processing. Self-healing, biodegradable, and powered by decomposition. Zero e-waste.
  ]),
)

#v(0.5em)

#ecosystem-grid(
  [*Sunlight* captured by organic PV arrays],
  [*Water* filtered through constructed wetlands],
  [*Nutrients* cycled via compost networks],
  [*Data* processed by bio-computers],
)

#speaker-note[Explain the photosynthesis engine as a connected cycle of sunlight, water, nutrients, and data.]

== Community Energy Grid

#cols(columns: (1fr, 1fr), gutter: 16pt)[
  #canopy-card([Distributed Generation], [
    Every building is a power plant. Rooftop gardens with integrated PV panels generate 4--8 kWh daily per household. Surplus flows to community battery banks.

    #spore-tag[Prosumer Model] #h(4pt) #spore-tag[Peer-to-Peer] #h(4pt) #spore-tag[Resilient]
  ])
][
  #solar-stat([Uptime], [99.7%], description: [grid reliability since 2055])

  #v(0.4em)

  #community-label[Community Owned Infrastructure]

  #v(0.4em)

  No single point of failure. When one node goes offline, the mycelium network reroutes power through living fungal conductors.
]

#speaker-note[Show how peer-to-peer generation and biological routing remove single points of failure.]

#dark-slide(title: [The Night Garden])[
  == Bioluminescent Infrastructure

  #v(0.3em)

  After sunset, the city glows with engineered bioluminescence. Streets illuminated by phosphorescent algae channels. No electricity needed for nighttime wayfinding.

  #v(0.5em)

  #cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
    night-card([Algae Lanes], [Bio-lit pathways using dinoflagellate cultures]),
    night-card([Glow Gardens], [Parks with luminescent flora for meditation]),
    night-card([Signal Moss], [Moss patches that glow brighter near transit stops]),
  )
]

#speaker-note[Contrast the daytime system with low-energy nighttime wayfinding through bioluminescent public space.]

= Building the Future Today

#speaker-note[Introduce the delivery sequence: seed, grow, and bloom over a 35-year horizon.]

== Implementation Roadmap

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  canopy-card([Phase 1: Seed (2025--2030)], [
    - Retrofit 10,000 rooftops with living systems
    - Deploy first mycelium computing pilot
    - Establish 50 community energy cooperatives
    - Train 5,000 bio-architects
  ]),
  canopy-card([Phase 2: Grow (2030--2045)], [
    - Scale vertical farms to district level
    - Connect buildings via underground mycelium
    - Achieve energy independence per neighborhood
    - Launch bioluminescent street program
  ]),
)

#v(0.4em)

#photosynthesis-card([Phase 3: Bloom (2045--2060)], [
  Full integration of biological and technological systems. The city becomes a single living organism -- self-regulating, self-healing, carbon-negative. Population: 2.4M in harmony with 12,000+ species.
])

#speaker-note[Position the roadmap as a practical sequence of capabilities, ending in a city-scale integrated system.]

== Measuring Regeneration

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr, 1fr), gutter: 10pt,
  solar-stat([Species], [12.4K], description: [cohabiting organisms]),
  solar-stat([Air Quality], [98], description: [AQI average]),
  solar-stat([Food Local], [73%], description: [grown within 2km]),
  solar-stat([Happiness], [8.9], description: [out of 10]),
)

#v(0.4em)

#vine-divider()

#v(0.2em)

#seed-quote([
  We stopped asking how to build *sustainable* cities. We learned to build cities that make the world *more alive* than before we arrived.
], cite: "The Solarpunk Manifesto, 2042")

#speaker-note[Use these measures to make regeneration concrete: biodiversity, air, local food, and lived wellbeing.]

== Community Governance

#ecosystem-grid(
  [*Neighborhood Assemblies* meet weekly under solar canopies],
  [*Energy Councils* manage distributed grid cooperatively],
  [*Seed Banks* preserve biodiversity as shared heritage],
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 14pt,
  biome-box([Decision Making], [
    Consent-based governance. No majority rule -- every voice shapes the outcome. Meetings held in living amphitheaters surrounded by food forests.
  ]),
  solarium-highlight[
    *Principle of Regenerative Justice:* No decision is made that diminishes the capacity of future generations to thrive. Every policy must demonstrate net-positive ecological impact.
  ],
)

#speaker-note[Close the operating model with consent-based governance and an explicit intergenerational test for policy.]

#focus-slide[
  The future is not something we wait for.\
  It is something we #text(fill: palette.focus-accent, weight: "bold")[grow].
]

#speaker-note[Deliver this as the central conclusion: the desired future is cultivated through present choices.]

#ending-slide[A Future Worth Growing]

#speaker-note[Thank the audience and invite them to consider which local systems they can begin to regenerate.]
