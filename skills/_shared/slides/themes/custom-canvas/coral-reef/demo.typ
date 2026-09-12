#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

// Font configuration
#set text(font: _sans-font, size: 18pt)

// Build palette for inline use
#let pal = build-palette("deep")

#show: coral-reef-theme.with(
  aspect-ratio: "16-9",
  preset: "deep",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Coral Reef Ecosystems: Biodiversity Under Threat],
    subtitle: [A Deep Dive into Marine Conservation and Bioluminescent Life],
    author: [Dr. Marina Depths],
    date: datetime.today(),
    institution: [Pacific Marine Research Institute],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Reef Ecology
// ============================================================

= Reef Ecology

== The Architecture of Coral Reefs

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.cyan, font: _mono-font)[ECOSYSTEM FOUNDATIONS]

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      Coral reefs are built by colonies of tiny animals called coral polyps,
      which secrete calcium carbonate to form hard exoskeletons. Over millennia,
      these structures accumulate into massive reef formations that support
      extraordinary biodiversity -- often called the "rainforests of the sea."
    ]
    #v(0.5em)
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      The symbiotic relationship between corals and zooxanthellae algae
      provides up to 90% of the coral's energy needs through photosynthesis,
      giving reefs their vibrant colors.
    ]
  ]
][
  #stack(spacing: .8em,
    biolumi-stat([SPECIES SUPPORTED], [25%], description: [Of all marine species depend on coral reefs despite covering less than 1% of the ocean floor]),
    biolumi-stat([REEF AREA], [284k], description: [Square kilometers of coral reef worldwide -- roughly the size of Italy]),
  )
]


// ============================================================
// Slide: Coral Cards -- Reef Types
// ============================================================

== Types of Coral Reefs

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.cyan, font: _mono-font)[MORPHOLOGICAL CLASSIFICATION]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
  #coral-card([Fringing Reefs], [
    Grow directly from the shoreline, forming borders along coastlines
    and surrounding islands. The most common reef type, found in over
    80 countries worldwide.
  ])
][
  #coral-card([Barrier Reefs], [
    Separated from land by a deep lagoon. The Great Barrier Reef extends
    over 2,300 km -- visible from space and home to 1,500+ fish species.
  ])
][
  #coral-card([Atolls], [
    Ring-shaped reefs encircling a lagoon, formed as volcanic islands
    subside. Found primarily in the Pacific and Indian Oceans at depths
    where light still penetrates.
  ])
]


// ============================================================
// Section 2: Bioluminescence
// ============================================================

= Bioluminescence

== Light in the Deep

#cols(columns: (2fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #current-panel(title: [Chemiluminescent Reactions])[
      Bioluminescence is produced through oxidation of a light-emitting molecule
      called luciferin by the enzyme luciferase. This cold light production is
      remarkably efficient -- nearly 100% of the energy is converted to light
      with almost no heat loss, unlike incandescent bulbs which waste 90% as heat.

      #v(0.4em)
      Over 75% of deep-sea organisms produce their own light, using it for
      counter-illumination, prey attraction, communication, and defense against
      predators in the eternal darkness below 200 meters.

      #v(0.4em)
      Bioluminescence reaction:
      #mitex(`\text{Luciferin} + \text{O}_2 \xrightarrow{\text{Luciferase}} \text{Oxyluciferin} + h\nu`)
    ]
  ]
][
  #stack(spacing: .8em,
    bubble-tag([Luciferin]),
    bubble-tag([Luciferase]),
    bubble-tag([GFP]),
    bubble-tag([Coelenterazine]),
    block(
      width: 100%,
      fill: pal.cyan.transparentize(90%),
      inset: 10pt,
      radius: 8pt,
      stroke: 0.4pt + pal.cyan-faint,
    )[
      #text(size: 11pt, fill: pal.ink-muted, font: _sans-font)[
        76% of sea creatures produce bioluminescence
      ]
    ],
  )
]


// ============================================================
// Slide: Focus -- Ocean Quote
// ============================================================

#focus-slide[
  "The sea, once it casts its spell, holds one in its net of wonder forever."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink.transparentize(30%))[
    -- Jacques Cousteau
  ]
]


// ============================================================
// Section 3: Conservation
// ============================================================

= Conservation

== Threats to Coral Reefs

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.cyan, font: _mono-font)[GLOBAL ASSESSMENT]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt)[
  #biolumi-stat([WARMING], [1.5C], description: [Temperature rise causing mass bleaching events globally])
][
  #biolumi-stat([LOSS RATE], [14%], description: [Of coral cover lost worldwide between 2009 and 2018])
][
  #biolumi-stat([ACIDIFICATION], [30%], description: [Increase in ocean acidity since pre-industrial era])
][
  #biolumi-stat([AT RISK], [75%], description: [Of reefs threatened by local and global stressors combined])
]

#v(0.4em)
#reef-divider(total-width: 100%)
#v(0.4em)

#text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
  Without significant intervention, projections indicate that 90% of coral reefs
  may experience severe annual bleaching by 2050 under current emission trajectories.
]


// ============================================================
// Slide: Depth Quote + Card
// ============================================================

== Bleaching and Recovery

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #depth-quote([
      Coral bleaching occurs when stressed corals expel their symbiotic
      zooxanthellae algae, turning white. While not immediately fatal,
      prolonged bleaching leads to starvation and eventual death of the colony.
      Recovery requires 10-15 years of stable conditions.
    ], cite: "IPCC Ocean Report, 2022")
  ]
][
  #block(width: 100%)[
    #coral-card([Super Corals: Hope for the Future], [
      Researchers have identified heat-resistant coral genotypes that survive
      temperatures 2C above local bleaching thresholds. These "super corals"
      are being used in assisted gene flow programs to bolster reef resilience.
    ])
  ]
]

#v(0.4em)

#stack(dir: ltr, spacing: 8pt,
  bubble-tag([Restoration]),
  bubble-tag([MPA Networks]),
  bubble-tag([Gene Flow]),
  bubble-tag([Reef Stars]),
  bubble-tag([Coral IVF]),
)


// ============================================================
// Section 4: Deep Sea Exploration
// ============================================================

= Deep Sea

== Exploring the Abyss

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.cyan, font: _mono-font)[SUBMERSIBLE MISSIONS]

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #block(width: 100%)[
    #current-panel(title: [Hadal Zone Discoveries])[
      The hadal zone (6,000-11,000m) was once thought to be lifeless. Recent
      expeditions with full-ocean-depth submersibles have revealed thriving
      communities of amphipods, snailfish, and xenophyophores -- single-celled
      organisms the size of a human fist.

      #v(0.4em)
      Hydrothermal vents at mid-ocean ridges support ecosystems entirely
      independent of sunlight, powered by chemosynthesis. These extremophile
      communities may provide models for life on ocean worlds like Europa.
    ]
    #v(0.5em)
    #stack(dir: ltr, spacing: 8pt,
      bubble-tag([ROVs]),
      bubble-tag([AUVs]),
      bubble-tag([eDNA]),
    )
  ]
][
  #stack(spacing: .8em,
    biolumi-stat([DEEPEST DIVE], [10,928], description: [Meters -- Challenger Deep, Mariana Trench, reached by Victor Vescovo in 2019]),
    biolumi-stat([UNEXPLORED], [80%], description: [Of the ocean floor remains unmapped at high resolution]),
  )
]


// ============================================================
// Focus -- Key Message
// ============================================================

#focus-slide[
  "We know more about the surface of Mars than the depths of our own ocean."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink.transparentize(30%))[
    -- National Oceanic and Atmospheric Administration
  ]
]


// ============================================================
// Ending
// ============================================================

#ending-slide[Thank You]
