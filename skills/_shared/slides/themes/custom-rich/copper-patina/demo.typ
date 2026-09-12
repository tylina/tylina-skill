// Copper Patina Theme — Demo Presentation
// Topic: The Art & Science of Copper — From Ancient Metallurgy to Modern Engineering

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: copper-patina-theme.with(
  aspect-ratio: "16-9",
  footer: [Copper Patina Theme],
  config-info(
    title: [The Art & Science of Copper],
    subtitle: [From Ancient Metallurgy to Modern Engineering],
    author: [Dr. Helena Ashworth],
    date: datetime.today(),
    institution: [Royal Institute of Materials Science],
  ),
  config-common(breakable: false),
)

#set text(font: ("Arial", "Noto Sans SC"))

#title-slide()
#speaker-note[Open with copper as both an ancient material and a foundation of modern engineering.]

// ================================================================
= Material Fundamentals
#speaker-note[Introduce the first section: copper's physical properties and the protective chemistry of patina.]

== Properties of Copper

#cols[
  #patina-highlight([Why Copper Endures], [
    Copper has been humanity's companion metal for over 10,000 years. Its unique combination of conductivity, malleability, and corrosion resistance makes it indispensable in modern engineering.
  ])
  #v(8pt)
  #cols(columns: (1fr, 1fr, 1fr))[
    #gauge-stat([Conductivity], [401], color: palette.primary)
  ][
    #gauge-stat([Melting Point], [1085], color: palette.accent)
  ][
    #gauge-stat([Density], [8.96], color: palette.steel)
  ]
][
  #rivet-card([Physical Constants], [
    - *Atomic number*: 29
    - *Crystal structure*: Face-centered cubic
    - *Thermal conductivity*: 401 W/(m K)
    - *Electrical resistivity*: 16.78 n$Omega$ m
  ])
  #v(8pt)
  #brass-tag[Cu] #brass-tag[Transition Metal] #brass-tag[Group 11]
]
#speaker-note[Introduce copper's fundamental properties. The conductivity value of 401 is in W per meter-Kelvin. Emphasize the FCC structure enables ductility.]

== The Patina Process

#cols(columns: (1fr, 1fr))[
  #blueprint-box([Oxidation Stages], [
    *Stage 1* -- Fresh copper (bright salmon)

    *Stage 2* -- Cuprous oxide Cu2O (dark brown)

    *Stage 3* -- Cupric oxide CuO (black)

    *Stage 4* -- Basic copper carbonate (verdigris green)
  ])
][
  #stack(
    spacing: .8em,
    patina-highlight([Key Insight], [
      The green patina is not decay but *protection*. The layer of copper carbonate (CuCO3) forms a stable barrier that prevents further corrosion, extending the metal's life by centuries.
    ]),
    [#brass-tag[Self-healing] #brass-tag[100+ years]],
    copper-divider(width: 100%),
  )
]
#speaker-note[Explain how the patina process is actually protective. The Statue of Liberty is a great example -- her copper skin is only 2.4mm thick but has survived since 1886.]

// ================================================================
= Engineering Heritage
#speaker-note[Transition from material fundamentals to the machines and structures that made copper industrially indispensable.]

== The Industrial Revolution

#forge-quote(
  [Give me a lever long enough and a fulcrum on which to place it, and I shall move the world.],
  source: [Archimedes],
)
#v(8pt)
#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #rivet-card([Steam Power Era], [
    The marriage of copper and steam defined an age. Copper's thermal conductivity and workability made it essential for:
    - Boiler tubes and condensers
    - Steam engine cylinders
    - Railway locomotive fireboxes
  ], accent: palette.primary)
][
  #rivet-card([Electrical Revolution], [
    When Faraday discovered electromagnetic induction in 1831, copper became the backbone of a new civilization:
    - Telegraph wires spanning continents
    - Generator windings and transformers
    - The first electrical grids
  ], accent: palette.accent)
]
#speaker-note[Bridge from mechanical to electrical age. Both eras relied heavily on copper's unique properties -- thermal conductivity for steam, electrical conductivity for power.]

== Landmark Structures

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true)[
  #rivet-card([Statue of Liberty], [
    *1886* -- 80 tons of copper sheeting, only 2.4mm thick. The verdigris patina developed over 20 years.
  ], accent: palette.accent)
][
  #rivet-card([Big Ben Clock Tower], [
    *1859* -- Copper roofing and ornamentation. The green patina blends with Portland stone.
  ], accent: palette.primary)
][
  #rivet-card([Sydney Opera House], [
    *1973* -- Bronze (copper alloy) window frames and fittings designed for marine environment.
  ], accent: palette.steel)
]
#speaker-note[Three iconic structures that showcase copper's longevity and aesthetic transformation over time. Each demonstrates a different aspect -- structural, ornamental, and environmental resistance.]

// ================================================================
= Modern Applications
#speaker-note[Shift from historical engineering to the copper demand created by electrification and alloy design.]

== Copper in Renewable Energy

#cols[
  #oxide-section([Wind Energy], [
    A single 3MW wind turbine requires approximately *4.7 tonnes* of copper for generators, transformers, cabling, and grounding systems.
  ])
  #v(8pt)
  #oxide-section([Solar Power], [
    Photovoltaic systems use *5.5 kg of copper per kW* of capacity -- from cell interconnects to inverter wiring and grounding.
  ])
  #v(8pt)
  #oxide-section([Electric Vehicles], [
    An average EV contains *83 kg of copper* -- four times more than a conventional vehicle -- for motors, batteries, and charging infrastructure.
  ])
][
  #cols(columns: (1fr, 1fr))[
    #gauge-stat([Wind], [4.7t], color: palette.primary)
  ][
    #gauge-stat([Solar], [5.5kg], color: palette.accent)
  ]
  #v(8pt)
  #cols(columns: (1fr, 1fr))[
    #gauge-stat([EV], [83kg], color: palette.steel)
  ][
    #gauge-stat([Grid], [12Mt], color: palette.primary)
  ]
  #v(8pt)
  #brass-tag[Renewable] #brass-tag[Electrification] #brass-tag[Net Zero]
]
#speaker-note[Data shows how the green energy transition is actually a copper-intensive transition. Global copper demand for renewables is projected to double by 2035.]

== Alloy Engineering

#stack(
  spacing: .8em,
  figure[
    #table(
      columns: (auto, 1fr, 1fr, 1fr),
      stroke: 0.5pt + palette.border,
      inset: 8pt,
      fill: (x, y) => if y == 0 { palette.primary.lighten(85%) } else { palette.card },
      table.header([*Alloy*], [*Composition*], [*Key Property*], [*Application*]),
      [Bronze], [Cu + Sn (5-12%)], [Wear resistance], [Bearings, gears, marine],
      [Brass], [Cu + Zn (5-45%)], [Machinability], [Valves, fittings, instruments],
      [Cupronickel], [Cu + Ni (10-30%)], [Seawater resistance], [Ship hulls, desalination],
      [Beryllium Cu], [Cu + Be (0.5-3%)], [Spring strength], [Aerospace, non-sparking tools],
    )
  ],
  std.align(center, rivet-row(color: palette.rivet, width: 40%)),
)
#speaker-note[Copper alloys expand the base metal's capabilities enormously. Bronze was so important it named an entire age of civilization. Today, over 400 copper alloys are in commercial use.]

// ================================================================
= Manufacturing Processes
#speaker-note[Introduce the production chain, from ore concentration to precision manufacturing.]

== From Ore to Metal

#blueprint-box([Extraction Pipeline], [
  *1. Mining* #sym.arrow.r Open-pit or underground (0.5-2% Cu ore)

  *2. Crushing* #sym.arrow.r Reduce to 10mm particles

  *3. Flotation* #sym.arrow.r Concentrate to 25-35% Cu

  *4. Smelting* #sym.arrow.r Matte (50-70% Cu) at 1250 degrees C

  *5. Converting* #sym.arrow.r Blister copper (98.5% Cu)

  *6. Electrorefining* #sym.arrow.r Cathode copper (99.99% Cu)
])
#v(6pt)
#cols(columns: (1fr, 1fr))[
  #brass-tag[6 stages] #brass-tag[99.99% purity]
][
  #patina-highlight([Recycling], [
    Copper is 100% recyclable without property loss. Today, 35% of global copper comes from recycled sources.
  ])
]
#speaker-note[Walk through the full extraction process. Emphasize that electrorefining achieves four-nines purity essential for electrical applications. The recycling fact is a key sustainability message.]

== Precision Machining

#cols[
  #rivet-card([CNC Milling], [
    Modern 5-axis CNC machines achieve tolerances of plus/minus 0.005mm on copper alloys. Critical for:
    - Heat sink fin geometries
    - Waveguide components
    - Particle accelerator cavities
  ], accent: palette.primary)
  #v(6pt)
  #rivet-card([Additive Manufacturing], [
    Laser powder bed fusion (L-PBF) now produces complex copper geometries impossible with subtractive methods:
    - Conformal cooling channels
    - Topology-optimized heat exchangers
    - Micro-lattice structures
  ], accent: palette.accent)
][
  #gauge-stat([Tolerance], [5], color: palette.primary)
  #v(8pt)
  #gauge-stat([Density], [99.8%], color: palette.accent)
  #v(8pt)
  #forge-quote(
    [The machine does not create; it realizes the engineer's vision in metal.],
    source: [Henry Maudslay],
  )
]
#speaker-note[Contrast traditional subtractive with modern additive approaches. The tolerance of 5 refers to micrometers. The density of 99.8 percent refers to L-PBF part density relative to wrought copper.]

// ================================================================
= Future Frontiers
#speaker-note[Close the technical arc with health and quantum applications that keep copper relevant at the frontier.]

== Antimicrobial Copper

#patina-highlight([EPA Registered], [
  In 2008, copper became the first solid antimicrobial material registered by the US EPA. Copper surfaces eliminate 99.9% of bacteria within 2 hours through contact killing.
])
#v(8pt)
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #rivet-card([Mechanism], [
    Copper ions disrupt cell membranes, generate reactive oxygen species, and destroy genomic DNA -- a multi-target approach that prevents resistance.
  ])
][
  #rivet-card([Healthcare], [
    Hospital trials show 58% reduction in healthcare-acquired infections when copper surfaces replace standard materials on high-touch points.
  ])
][
  #rivet-card([Transit], [
    Copper-alloy handrails, buttons, and grab bars are being deployed across metro systems in Santiago, New York, and Shanghai.
  ])
]
#speaker-note[Antimicrobial copper is a growing application area post-pandemic. The EPA registration was a landmark. The 58 percent reduction statistic comes from a multi-site clinical trial published in Infection Control and Hospital Epidemiology.]

== Quantum Computing & Beyond

#cols[
  #blueprint-box([Cryogenic Copper], [
    Quantum computers operate at 15 millikelvin. Copper wiring carries control signals between room temperature electronics and qubit chips through carefully staged thermal intercepts.
  ])
  #v(6pt)
  #blueprint-box([Superconducting Cavities], [
    High-purity copper (RRR > 300) serves as the substrate for niobium-sputtered superconducting RF cavities in particle accelerators at CERN and Fermilab.
  ])
][
  #patina-highlight([The Copper Paradox], [
    As computing pushes toward quantum limits, this ancient metal remains irreplaceable. No discovered material matches copper's combination of thermal and electrical conductivity at practical cost.
  ])
  #v(8pt)
  #cols(columns: (1fr, 1fr))[
    #gauge-stat([RRR], [>300], color: palette.primary)
  ][
    #gauge-stat([Temp], [15mK], color: palette.accent)
  ]
]
#speaker-note[Connect the ancient material to cutting-edge technology. RRR stands for Residual Resistivity Ratio -- a measure of copper purity where higher means purer. The paradox framing makes for a memorable takeaway.]

// ================================================================

#focus-slide[
  In the patina of time, copper reveals its greatest truth: that endurance is not resistance to change, but graceful transformation.
]
#speaker-note[This is the key philosophical message -- copper's patina is a metaphor for resilient adaptation, not mere durability.]

#ending-slide[Thank You]
#speaker-note[Close the presentation. Invite questions about specific applications or material science topics covered.]
