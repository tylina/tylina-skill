// Art Deco Theme Demo — Maison Dorée Annual Report 2025
// Showcases all slide types and components
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Georgia", "Noto Serif SC"))

#show: art-deco-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Maison Dorée -- Annual Report 2025],
  config-info(
    title: [Maison Dorée],
    subtitle: [Annual Report & Strategic Vision 2025],
    author: [Victoria Ashworth, CEO],
    institution: [Maison Dorée Holdings Ltd.],
    date: datetime(year: 2025, month: 12, day: 15),
  ),
)

// ══════════════════════════════════════
// Slide 1: Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Slide 2: Table of Contents
// ══════════════════════════════════════
#outline-slide()

// ══════════════════════════════════════
// Section 1: Financial Performance
// ══════════════════════════════════════
= Financial Performance

== Revenue Highlights

#stack(
  spacing: 0.8em,
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 0.8em,
    trophy-stat([Revenue], [\$4.2B], trend: [+18% YoY]),
    trophy-stat([EBITDA], [\$1.1B], trend: [+22% YoY]),
    trophy-stat([Net Income], [\$780M], trend: [+15% YoY]),
    trophy-stat([Global Market Cap], [\$28B], trend: [+31% YoY]),
  ),
  chevron-divider(),
  deco-box([Record-Breaking Year], [
    Fiscal year 2025 marks the strongest financial performance in Maison Dorée's 97-year history, driven by exceptional growth in Asia-Pacific markets and the successful launch of our Heritage Collection.
  ], accent: palette.gold),
)

== Regional Performance

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  gilded-card([Asia-Pacific], [
    Revenue growth of *42%* driven by flagship openings in Shanghai, Tokyo, and Singapore. The region now represents 38% of global revenue, surpassing Europe for the first time.

    - China: +55% (Heritage Collection resonance)
    - Japan: +28% (renewed luxury demand)
    - Southeast Asia: +35% (emerging affluence)
  ]),
  gilded-card([Europe & Americas], [
    Steady growth of *12%* in mature markets with strong digital acceleration. Americas showed particular strength in experiential retail.

    - Europe: +8% (sustainable luxury focus)
    - North America: +18% (new flagship NYC)
    - Latin America: +22% (Brazil expansion)
  ], accent: palette.emerald),
)

// ══════════════════════════════════════
// Section 2: Brand Portfolio
// ══════════════════════════════════════
= Brand Portfolio

== Heritage Collection Launch

#cols(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  stack(
    spacing: 0.8em,
    [The Heritage Collection celebrates our Art Deco origins with pieces inspired by the 1920s golden age of design.],
    deco-box([Collection Overview], [
      A 47-piece capsule spanning haute couture, fine jewelry, and decorative arts. Each piece references geometric motifs from our 1928 founding atelier. Limited to 500 units worldwide, with 92% sell-through in the first quarter.
    ]),
    grid(
      columns: (auto, auto),
      gutter: 0.45em,
      row-gutter: 0.35em,
      gatsby-tag([Haute Couture], color: palette.gold),
      gatsby-tag([Fine Jewelry], color: palette.emerald),
      gatsby-tag([Decorative Arts], color: palette.navy),
    ),
  ),
  stack(
    spacing: 0.8em,
    marquee-quote(
      [The Heritage Collection is not merely fashion -- it is architecture you can wear. Every angle, every proportion speaks to the geometry of desire.],
      author: [Vogue, December 2025],
    ),
    deco-box([Critical Acclaim], [
      Named "Collection of the Year" by the International Luxury Council. Featured on 14 global magazine covers. Generated \$340M in earned media value.
    ], accent: palette.gold),
  ),
)

== Brand Health Metrics

#stack(
  spacing: 0.8em,
  grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    trophy-stat([Brand Value], [\$12.4 billion], trend: [+24%]),
    trophy-stat([Global Desirability Index], [94/100], trend: [+7pts]),
    trophy-stat([客户留存率 / Client Retention], [87%], trend: [+5pts]),
  ),
  grid(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    deco-box([Digital Engagement], [
      Social following surpassed 45M across platforms. Average engagement rate reached 6.8% -- three times the luxury industry average. The virtual atelier attracted 2.3M unique visitors.
    ], accent: palette.gold),
    deco-box([Sustainability Score], [
      Achieved an A+ rating from the Luxury Sustainability Alliance. 78% of materials are ethically sourced, with carbon-neutral operations on track for 2027.
    ], accent: palette.emerald),
  ),
)

// ══════════════════════════════════════
// Section 3: Strategic Vision
// ══════════════════════════════════════
= Strategic Vision

== Five-Year Growth Pillars

#stack(
  spacing: 0.8em,
  cols(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    lazy-layout: true,
    gilded-card([Digital Luxury], [
      Invest \$500M in immersive commerce, a virtual flagship, authenticated editions, and AI styling for VIP clients.
    ], accent: palette.gold),
    gilded-card([Sustainable Opulence], [
      Lead with lab-grown gemstones, regenerative silk, zero-waste ateliers by 2028, and a circular resale platform.
    ], accent: palette.emerald),
    gilded-card([Cultural Capital], [
      Expand museum partnerships, annual art commissions, and the heritage fund -- positioning Maison Dorée beyond commerce.
    ], accent: palette.navy),
  ),
  chevron-divider(),
  marquee-quote(
    [Luxury elevates human creativity and craft to its highest expression.],
    author: [Victoria Ashworth, CEO],
  ),
)

== Market Expansion Roadmap

#cols(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  stack(
    spacing: 0.8em,
    [*2025--2027: Foundation*],
    [
      - 12 new flagship stores globally
      - Digital commerce platform 2.0
      - Heritage preservation initiative launch
      - Sustainability certification program
    ],
    stack(dir: ltr, spacing: 0.3em,
      gatsby-tag([In Progress], color: palette.gold),
      gatsby-tag([On Track], color: palette.emerald),
    ),
  ),
  stack(
    spacing: 0.8em,
    [*2027--2030: Acceleration*],
    [
      - Expansion into 8 new markets
      - Virtual reality atelier experiences
      - Autonomous luxury concierge AI
      - Carbon-positive operations target
    ],
    deco-box([Investment Thesis], [
      Total strategic investment of \$2.8B over five years, targeting 25% compound revenue growth and sector-leading margins of 28%.
    ], accent: palette.gold),
  ),
)

// ══════════════════════════════════════
// Section 4: Excellence & Recognition
// ══════════════════════════════════════
= Excellence & Recognition

== Awards & Accolades

#stack(
  spacing: 0.8em,
  cols(
    columns: (1fr, 1fr),
    gutter: 1.2em,
    lazy-layout: true,
    gilded-card([Industry Recognition], [
      - *Luxury Brand of the Year* -- Global Luxury Awards
      - *Best Sustainability Initiative* -- Fashion Council
      - *Design Excellence Award* -- International Design Forum
      - *Innovation in Retail* -- Retail Excellence Summit
    ]),
    gilded-card([Cultural Impact], [
      - Met Gala presenting sponsor
      - Venice Biennale installation partnership
      - Smithsonian permanent collection acquisition
      - UNESCO heritage craft preservation grant
    ], accent: palette.emerald),
  ),
  deco-box([Client Excellence], [
    Net Promoter Score reached 82. The private client program serves 12,000 members, with annual spend averaging \$185,000.
  ]),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"In every line we draw and every stone we set, we honor the legacy of those who dared to make beauty their life's work."_

  #text(size: 0.6em, weight: "regular")[-- Victoria Ashworth, Founder's Day Address 2025]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
