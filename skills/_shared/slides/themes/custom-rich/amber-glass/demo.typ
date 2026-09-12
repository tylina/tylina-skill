// Amber Glass Theme Demo — Aurelian Spirits Annual Collection 2025
// Showcases all slide types and components
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: amber-glass-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Aurelian Spirits -- Premium Collection 2025],
  config-info(
    title: [Aurelian Spirits],
    subtitle: [Premium Collection & Brand Strategy 2025],
    author: [Sebastian Aldridge, Creative Director],
    institution: [Aurelian Spirits Group],
    date: datetime(year: 2025, month: 11, day: 8),
  ),
)

#set text(font: ("Arial", "Noto Sans SC", "Libertinus Serif"))

// ==========================================
// Slide 1: Title Slide
// ==========================================
#title-slide()

// ==========================================
// Section 1: Brand Heritage
// ==========================================
= Brand Heritage

== Our Story

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  honey-card([Founded in Tradition], [
    Aurelian Spirits traces its origins to 1897, when master distiller Henri Aurelian first captured the essence of aged amber in a single malt. Over 125 years of craftsmanship define our approach.

    - 5 generations of master distillers
    - Single estate grain sourcing since 1920
    - Hand-blown glass decanters
  ]),
  honey-card([The Amber Philosophy], [
    Like light passing through amber, every expression in our portfolio reveals layers of depth and warmth. Our aging process uses rare Mizunara oak, imparting a luminous golden character.

    - Minimum 18-year aging process
    - Proprietary amber-char cask finish
    - Temperature-controlled warehouses
  ], accent: palette.accent),
)

== Heritage Milestones

#cols[
  #stack(spacing: 0.8em,
    [*A Legacy of Excellence*],
    glass-panel([Timeline Highlights], [
      *1897* -- Henri Aurelian establishes the distillery in the Scottish Highlands \
      *1924* -- First Gold Medal at the International Spirits Competition \
      *1958* -- Royal Warrant granted by appointment \
      *1987* -- Heritage Reserve 50-Year released to global acclaim \
      *2015* -- Sustainability program launches with zero-waste distilling \
      *2025* -- Amber Glass Collection unveiled at Art Basel
    ]),
    stack(dir: ltr, spacing: 0.6em,
      amber-tag([Est. 1897]),
      amber-tag([Royal Warrant], color: palette.accent),
      amber-tag([5th Generation]),
    ),
  )
][
  #stack(spacing: 0.8em,
    amber-quote(
      [Every drop tells the story of time itself -- patient, luminous, irreplaceable.],
      author: [Henri Aurelian III, Master Distiller],
    ),
    honey-card([Awards & Recognition], [
      - *World's Best Single Malt* -- 2024 World Spirits Awards
      - *Distillery of the Decade* -- Spirits Business Magazine
      - *Sustainability Leader* -- Green Spirits Alliance
      - *Design Excellence* -- Luxury Packaging Awards
    ]),
  )
]

// ==========================================
// Section 2: Collection Overview
// ==========================================
= Collection Overview

== Key Performance Indicators

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    warm-stat([Annual Revenue], [\$2.8B], trend: [+24% YoY]),
    warm-stat([Bottles Sold], [4.2M], trend: [+18% YoY]),
    warm-stat([Brand Value], [\$9.6B], trend: [+31% YoY]),
    warm-stat([Markets], [67], trend: [+8 new]),
  ),
  amber-divider(),
  glass-panel([Record Year], [
    The 2025 fiscal year represents a watershed moment for Aurelian Spirits. Driven by the launch of our Amber Glass Collection and expansion into Southeast Asian markets, we achieved record revenue while maintaining our commitment to slow, artisanal production.
  ], accent: palette.primary),
)

== The Amber Glass Collection

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  honey-card([Solstice 25], [
    A 25-year expression finished in Sauternes wine casks. Notes of honeycomb, apricot, and toasted almond. Limited to 3,000 bottles worldwide.

    *Tasting:* Rich amber, viscous texture, endless finish.
  ]),
  honey-card([Eclipse 40], [
    Our ultra-premium 40-year expression. Matured in first-fill Oloroso sherry butts, then finished in rare Japanese Mizunara oak. Deep mahogany with burnished gold highlights.

    *Tasting:* Profound, meditative, transcendent.
  ], accent: palette.accent),
  honey-card([Prism NAS], [
    A no-age-statement innovation blending vintages from 12 to 30 years. Created by our youngest master blender, it refracts tradition through a modern lens.

    *Tasting:* Vibrant, layered, surprising.
  ]),
)

// ==========================================
// Section 3: Market Strategy
// ==========================================
= Market Strategy

== Global Expansion

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    glass-panel([Asia-Pacific Growth], [
      The region represents our fastest-growing market with *+42%* revenue increase. Key initiatives:

      - Shanghai flagship experience center
      - Tokyo private members club
      - Singapore duty-free exclusives
      - South Korea collector's editions
    ], accent: palette.primary),
    glass-panel([European Prestige], [
      Maintaining our heritage position with *+15%* steady growth across mature markets:

      - London Mayfair tasting gallery renovation
      - Paris collaboration with Maison luxury houses
      - Zurich private banking partnerships
      - Bordeaux cross-category innovation lab
    ], accent: palette.accent),
  ),
  amber-divider(),
  amber-quote(
    [Luxury is not about scarcity alone -- it is about the generosity of time invested in pursuit of perfection.],
    author: [Sebastian Aldridge, Creative Director],
  ),
)

== Digital & Experience Strategy

#cols[
  #stack(spacing: 0.8em,
    [*Immersive Brand Experiences*],
    honey-card([Virtual Distillery Tours], [
      Our award-winning VR experience transports guests to the Scottish Highlands. Over 180,000 virtual visitors in the first quarter. Available through partnership with premium hotels and private aviation lounges.
    ]),
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      warm-stat([VR Visitors], [180K], trend: [Q1 2025]),
      warm-stat([Conversion], [12.4%], trend: [+3.2pts]),
    ),
  )
][
  #stack(spacing: 0.8em,
    [*Collector's Platform*],
    honey-card([Aurelian Vault], [
      A blockchain-authenticated platform for collectors. Each bottle receives a digital twin NFT, ensuring provenance and enabling secondary market trading.

      - 8,400 registered collectors
      - Average portfolio value: \$45,000
      - Secondary market premium: +340%
    ], accent: palette.accent),
    stack(dir: ltr, spacing: 0.5em,
      amber-tag([Blockchain]),
      amber-tag([NFT Provenance], color: palette.accent),
      amber-tag([Web3]),
    ),
  )
]

// ==========================================
// Section 4: Sustainability
// ==========================================
= Sustainability

== Environmental Commitment

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    warm-stat([Carbon Reduction], [-62%], trend: [vs. 2019]),
    warm-stat([Water Recycled], [94%], trend: [+8% YoY]),
    warm-stat([Renewable Energy], [100%], trend: [Achieved]),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    honey-card([Circular Packaging], [
      Every bottle in the Amber Glass Collection uses 100% recycled glass. Our proprietary amber tint is achieved through iron oxide recovered from local geological formations rather than synthetic dyes.
    ]),
    glass-panel([Regenerative Agriculture], [
      Our estate farms practice regenerative agriculture, sequestering 2,400 tonnes of carbon annually. Heritage grain varieties support local biodiversity, and our spent grain feeds a cooperative of 45 local farms.
    ], accent: palette.success),
  ),
)

// ==========================================
// Focus Slide
// ==========================================

#focus-slide[
  _"To hold a glass of Aurelian is to hold time itself -- golden, luminous, and infinitely patient."_

  #text(size: 0.55em, weight: "regular")[-- The Spirits Connoisseur, November 2025]
]

// ==========================================
// Ending Slide
// ==========================================

#ending-slide[Thank You]
