#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Font configuration (serif + sans + mono system)
#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 18pt)

// Build palette for inline use in canvas-level content
#let pal = build-palette("forest")

#show: botanical-theme.with(
  aspect-ratio: "16-9",
  preset: "forest",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Medicinal Plants of the Royal Conservatory],
    subtitle: [A Survey of Ethnobotanical Heritage and Conservation Strategies],
    author: [Dr. Helena Ashworth],
    date: datetime.today(),
    institution: [Royal Botanical Gardens],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Introduction
// ============================================================

= The Living Apothecary

== A Heritage in Green

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[HISTORICAL CONTEXT]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      For millennia, humans have relied on the botanical world for remedies.
      From the willow bark that gave us aspirin to the Madagascar periwinkle
      that revolutionized leukemia treatment, plants remain our most prolific
      pharmaceutical partners.
    ]
    #v(0.5em)
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      Today, over 28,000 plant species are recorded as having medicinal use,
      yet fewer than 15% have been fully characterized by modern pharmacology.
    ]
  ],
  block(width: 100%)[
    #root-stat([SPECIES CATALOGUED], [28,187], description: [Plant species with documented medicinal properties worldwide])
    #v(0.5em)
    #root-stat([UNDER THREAT], [4,000+], description: [Medicinal species facing habitat loss or overharvesting])
  ],
)


// ============================================================
// Slide: Key Statistics (Dark)
// ============================================================

#dark-slide(
  title: none,
  ghost: [72],
  ghost-dy: -30pt,
  ghost-dx: -20pt,
  ghost-size: 200pt,
  header-left: [DATA BRIEF],
  header-right: [CONSERVATION METRICS 2025],
)[
  #text(size: 38pt, weight: "bold")[72% of Traditional Remedies#linebreak()Remain Unvalidated.]

  #v(0.2em)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.paper.transparentize(30%), font: _mono-font)[GLOBAL ETHNOBOTANY ASSESSMENT]

  #v(0.6em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.paper.transparentize(30%), font: _mono-font)[ACTIVE COMPOUNDS]
      #v(0.15em)
      #text(size: 42pt, weight: "bold")[1,562]
      #v(0.15em)
      #text(size: 11pt, fill: pal.paper.transparentize(35%), font: _sans-font)[
        Novel alkaloids, terpenes, and flavonoids isolated from traditional medicine plants since 2000.
      ]
    ],
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.paper.transparentize(30%), font: _mono-font)[SEED BANKS]
      #v(0.15em)
      #text(size: 42pt, weight: "bold")[340]
      #v(0.15em)
      #text(size: 11pt, fill: pal.paper.transparentize(35%), font: _sans-font)[
        Dedicated medicinal plant seed banks operating across 67 countries for ex-situ preservation.
      ]
    ],
    block(width: 100%)[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.paper.transparentize(30%), font: _mono-font)[FUNDING GAP]
      #v(0.15em)
      #text(size: 42pt, weight: "bold")[\$2.1B]
      #v(0.15em)
      #text(size: 11pt, fill: pal.paper.transparentize(35%), font: _sans-font)[
        Annual shortfall in conservation funding for medicinal plant biodiversity hotspots.
      ]
    ],
  )

  #v(0.4em)

  #block(
    width: 100%,
    stroke: (left: 2.5pt + pal.paper.transparentize(60%)),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: pal.paper.transparentize(20%))[
      "Every species lost is a library burned -- an irreplaceable record of evolutionary solutions."
    ]
  ]
]


// ============================================================
// Slide: Three Pillars (Light)
// ============================================================

== Conservation Approaches

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[THREE PILLARS OF PRESERVATION]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #leaf-card([In-Situ Protection], [
    Maintaining plants within their natural habitat. Includes protected reserves,
    community-managed forests, and sacred groves that have sheltered species for centuries.
  ])
][
  #leaf-card([Ex-Situ Banking], [
    Seed vaults, tissue culture facilities, and living collections in botanical gardens.
    The Millennium Seed Bank holds seeds of 40,000+ species as insurance against extinction.
  ])
][
  #leaf-card([Ethnobotanical Documentation], [
    Recording indigenous knowledge before it disappears. Working with traditional healers
    to document preparation methods, dosages, and seasonal harvesting protocols.
  ])
]


// ============================================================
// Section 2: Case Studies
// ============================================================

= Specimens of Note

#hero-slide(background-image: "assets/artemisia-hero.svg", scrim: true)[
  #place(bottom + left, dx: 54pt, dy: -48pt,
    block(
      width: 590pt,
      fill: pal.paper,
      stroke: (left: 3pt + pal.accent, rest: 0.6pt + pal.ink-faint),
      inset: (x: 22pt, y: 18pt),
    )[
      #stack(
        spacing: .8em,
        text(size: typo.tiny, weight: "medium", tracking: 1.8pt,
          fill: pal.accent-text, font: _mono-font)[SPECIMEN 001],
        text(size: 28pt, weight: "bold", fill: pal.ink)[Artemisia annua -- Sweet Wormwood],
        gold-rule(width: 52pt, height: 2pt),
        text(size: 13pt, fill: pal.ink-light, font: _sans-font)[
          Used in traditional Chinese medicine (Qinghao) for over 2,000 years to treat fevers.
          In 1972, Tu Youyou isolated artemisinin, revolutionizing malaria treatment and earning
          the 2015 Nobel Prize in Physiology or Medicine.
        ],
        grid(columns: (auto, auto, 1fr), column-gutter: 18pt,
          text(size: 11pt, fill: pal.ink-muted)[*Family:* Asteraceae],
          text(size: 11pt, fill: pal.ink-muted)[*Origin:* Temperate Asia],
          align(right, text(size: 10pt, fill: pal.ink-muted)[
            Annual global demand: 200+ tonnes of artemisinin for ACT therapies.
          ]),
        ),
        stack(dir: ltr, spacing: 8pt,
          seed-tag([Antimalarial]),
          seed-tag([Nobel Prize 2015]),
          seed-tag([TCM Heritage]),
        ),
      )
    ],
  )
]


// ============================================================
// Slide: Quote (Focus)
// ============================================================

#focus-slide[
  "In every walk with nature, one receives far more than he seeks."

  #v(0.5em)
  #text(size: 0.5em, style: "normal", weight: "medium", fill: pal.paper.transparentize(30%))[
    -- John Muir, naturalist
  ]
]


// ============================================================
// Slide: Taxus brevifolia (Light with components)
// ============================================================

== Taxus brevifolia -- Pacific Yew

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: typo.body, fill: pal.ink, font: _sans-font)[
      The bark of the Pacific Yew yielded paclitaxel (Taxol), one of the most
      effective chemotherapy agents ever discovered. Its isolation in 1971 sparked
      a conservation crisis: harvesting bark killed the slow-growing trees.
    ]
    #v(0.6em)
    #herbarium-quote([
      The Pacific Yew story is a cautionary tale of how pharmaceutical success
      can imperil the very species that provides the cure.
    ], cite: "Goodman & Walsh, 2001")
  ],
  block(width: 100%)[
    #plate-frame(
      "assets/taxus-plate.svg",
      caption: [Plate II -- Taxus branch with arils],
      height: 205pt,
    )
    #v(0.5em)
    #text(size: 12pt, fill: pal.ink-light, font: _sans-font)[
      The development of semi-synthetic paclitaxel from needles of the European
      Yew (T. baccata) resolved the supply crisis, demonstrating how chemical
      innovation can reduce pressure on wild populations.
    ]
  ],
)


// ============================================================
// Slide: Dark comparative
// ============================================================

#dark-slide(
  title: none,
  ghost: none,
  header-left: [COMPARATIVE ANALYSIS],
  header-right: [BOTANICAL GARDENS 2025],
)[
  #text(size: 28pt, weight: "bold")[Traditional vs. Modern Approaches]
  #v(0.15em)
  #block(width: 50pt, height: 2pt, fill: pal.accent)
  #v(0.5em)

  #grid(columns: (1fr, 1fr), column-gutter: 28pt,
    block(width: 100%, stroke: (left: 2.5pt + pal.accent), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.paper.transparentize(30%), font: _mono-font)[TRADITIONAL PRACTICE]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: pal.paper)[Whole-Plant Preparation]
      #v(0.3em)
      #text(size: 12pt, fill: pal.paper.transparentize(30%), font: _sans-font)[
        Decoctions, tinctures, and poultices using the whole plant or plant part.
        Synergistic compounds work together. Knowledge transmitted orally across generations.
      ]
    ],
    block(width: 100%, stroke: (left: 2.5pt + pal.paper.transparentize(70%)), inset: (left: 1em, y: 0.4em))[
      #text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.paper.transparentize(30%), font: _mono-font)[MODERN PHARMACOLOGY]
      #v(0.4em)
      #text(size: 14pt, weight: "bold", fill: pal.paper)[Isolated Compound]
      #v(0.3em)
      #text(size: 12pt, fill: pal.paper.transparentize(30%), font: _sans-font)[
        Single-molecule drugs derived from plant compounds. Precise dosing and
        controlled trials. Patentable but may miss synergistic effects of whole-plant use.
      ]
    ],
  )

  #v(0.6em)
  #text(size: 11pt, fill: pal.paper.transparentize(25%), font: _sans-font)[
    Integrative approaches now seek to combine the rigor of modern pharmacology with the
    holistic wisdom embedded in traditional plant-based medicine systems.
  ]
]


// ============================================================
// Section 3: Garden Design
// ============================================================

= The Conservatory Plan

== Medicinal Garden Zones

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[LANDSCAPE ARCHITECTURE]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
  root-stat([ZONE A], [Temp], description: [European & Asian herbals -- lavender, valerian, ginseng]),
  root-stat([ZONE B], [Tropical], description: [Rainforest canopy species -- cinchona, curare vines]),
  root-stat([ZONE C], [Arid], description: [Desert adaptogens -- aloe, frankincense, myrrh]),
  root-stat([ZONE D], [Aquatic], description: [Wetland remedies -- lotus, watercress, mangrove]),
)

#v(0.4em)

#vine-divider(total-width: 100%)

#v(0.4em)

#text(size: 13pt, fill: pal.ink-light, font: _sans-font)[
  Each zone replicates the bioclimatic conditions of its source region, enabling
  living collections to serve as both conservation repositories and public education spaces.
  The garden receives over 450,000 visitors annually.
]


// ============================================================
// Slide: Specimen cards grid
// ============================================================

== Priority Species for Propagation

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 12pt,
  specimen-box([PRIORITY A], [Hoodia gordonii], [
    Southern African succulent. Appetite suppressant used by San people.
    Wild populations declining 30% per decade due to overharvesting.
  ]),
  specimen-box([PRIORITY B], [Prunus africana], [
    African cherry. Bark extract treats prostate conditions.
    CITES Appendix II listed. Sustainable harvesting programs underway.
  ]),
  specimen-box([PRIORITY C], [Nardostachys jatamansi], [
    Himalayan spikenard. Used in Ayurveda for neurological conditions.
    Critically endangered due to habitat degradation and overharvesting.
  ]),
  specimen-box([PRIORITY D], [Aquilaria malaccensis], [
    Agarwood. Resinous heartwood used in traditional medicine and perfumery.
    Wild populations severely depleted across Southeast Asia.
  ]),
)


// ============================================================
// Slide: Vine divider + quote
// ============================================================

#slide(title: [The Ethics of Bioprospecting], align: top)[

#herbarium-quote([
  Access and benefit-sharing frameworks must ensure that indigenous communities
  who have stewarded medicinal plant knowledge for generations receive fair
  compensation when their knowledge leads to commercial products.
], cite: "Nagoya Protocol, CBD 2010")

#v(0.5em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Key Principles]
    #v(0.3em)
    #text(size: 13pt, fill: pal.ink-light, font: _sans-font)[
      #sym.circle.filled.small #h(0.3em) Prior informed consent from indigenous holders \
      #sym.circle.filled.small #h(0.3em) Mutually agreed terms for benefit sharing \
      #sym.circle.filled.small #h(0.3em) Technology transfer to source countries \
      #sym.circle.filled.small #h(0.3em) Recognition of traditional knowledge in patents
    ]
  ],
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Challenges Remaining]
    #v(0.3em)
    #text(size: 13pt, fill: pal.ink-light, font: _sans-font)[
      #sym.circle.filled.small #h(0.3em) Digital sequence information (DSI) governance gaps \
      #sym.circle.filled.small #h(0.3em) Enforcement across jurisdictions \
      #sym.circle.filled.small #h(0.3em) Defining "traditional" vs. "novel" knowledge \
      #sym.circle.filled.small #h(0.3em) Balancing open science with indigenous rights
    ]
  ],
)
]


// ============================================================
// Dark section divider
// ============================================================

#dark-slide(
  title: none,
  ghost: [04],
  ghost-size: 200pt,
  ghost-dy: -50pt,
  header-left: [SECTION 04],
  header-right: [BOTANICAL 2025],
)[
  #v(1fr)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.paper.transparentize(30%), font: _mono-font)[LOOKING FORWARD]
  #v(0.6em)

  #text(size: 34pt, weight: "bold")[
    From Pressed Specimens#linebreak()to Living Pharmacies.
  ]
  #v(0.4em)
  #block(width: 60pt, height: 2.5pt, fill: pal.accent)

  #v(2fr)
]


// ============================================================
// Slide: Tags and Components showcase
// ============================================================

== Propagation Methods in Practice

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent-text, font: _mono-font)[TECHNIQUES OVERVIEW]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #leaf-card([Tissue Culture], [
      Micropropagation enables rapid multiplication of endangered species from
      small tissue samples. A single explant can yield thousands of genetically
      identical plantlets within months.
    ])
    #v(0.5em)
    #block(width: 100%)[
      #seed-tag([In Vitro])
      #h(0.4em)
      #seed-tag([Sterile])
      #h(0.4em)
      #seed-tag([High Yield])
    ]
  ],
  block(width: 100%)[
    #leaf-card([Seed Banking], [
      Orthodox seeds are dried to 3-7% moisture content and stored at -20 C.
      Recalcitrant seeds require cryopreservation in liquid nitrogen at -196 C.
      Viability testing occurs on 5-year cycles.
    ])
    #v(0.5em)
    #block(width: 100%)[
      #seed-tag([Cryogenic])
      #h(0.4em)
      #seed-tag([Long-term])
      #h(0.4em)
      #seed-tag([Orthodox])
    ]
  ],
)


// ============================================================
// Ending
// ============================================================

#ending-slide[Thank You]
