// Atlas Trade Theme Demo — The Silk Road & Global Trade Networks
// Strategic presentation on historical and modern trade routes
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist

#show: checklist.with(stroke: palette.primary, radius: 0.2em)

#show: atlas-trade-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Global Trade Networks -- Strategic Overview],
  config-info(
    title: [The Silk Road & Global Trade Networks],
    subtitle: [Historical Patterns, Modern Corridors, and Strategic Implications],
    author: [Dr. Marcus Thornfield],
    institution: [Institute for Global Economic Studies],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Arial", "Arial Unicode MS"))

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Historical Routes
// ══════════════════════════════════════
= Historical Routes

== The Ancient Silk Road

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  route-card([Overland Route], [
    The ancient Silk Road stretched *6,400 km* from Chang'an to the Mediterranean:
    - Crossed the Taklamakan Desert via oasis towns
    - Traversed the Pamir Mountains at 4,000m
    - Connected to Samarkand, Bukhara, and Baghdad
  ], accent: palette.primary),
  route-card([Maritime Route], [
    The *Maritime Silk Road* complemented overland trade:
    - Indian Ocean monsoon-driven navigation
    - Key ports: Guangzhou, Malacca, Calicut, Aden
    - Connected Song Dynasty China to East Africa
  ], accent: palette.secondary),
)

#latitude-divider(width: 24%)

#logbook-note(
  [The Silk Road was never a single route, but a vast network of paths facilitating trade, ideas, religions, and technologies across civilizations.],
  author: [Peter Frankopan, The Silk Roads, 2015]
)

== Key Trading Posts

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    port-box([Samarkand], [
      Central hub of the overland Silk Road. Major market for silk, paper, and horses.
    ]),
    port-box([Malacca], [
      Maritime chokepoint controlling the spice trade between East and West.
    ]),
    port-box([Alexandria], [
      Mediterranean terminus handling 120 ship arrivals monthly at peak.
    ]),
  ),
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    tonnage-stat([Annual Trade], [\$250B equiv.]),
    tonnage-stat([Route Length], [6,400 km], color: palette.primary),
    tonnage-stat([Active Period], [~1,500 yrs], color: palette.accent-copper),
    tonnage-stat([Civilizations], [40+], color: palette.rose-red),
  ),
  stack(dir: ltr, spacing: 0.6em,
    waypoint-tag([Overland], color: palette.primary),
    waypoint-tag([Maritime], color: palette.secondary),
    waypoint-tag([Hybrid], color: palette.accent-copper),
  ),
)

// ══════════════════════════════════════
// Section 2: Modern Corridors
// ══════════════════════════════════════
= Modern Corridors

== Belt and Road Initiative

#cols[
  #compass-card([Strategic Overview], [
    China's Belt and Road Initiative (BRI) represents the largest infrastructure investment program in history:

    - *Silk Road Economic Belt*: rail and road networks across Central Asia to Europe
    - *21st Century Maritime Silk Road*: port development from South China Sea to Mediterranean
    - Investment exceeding \$1 trillion across 140+ countries
  ], accent: palette.primary)

  #v(0.5em)

  #stack(dir: ltr, spacing: 0.6em,
    waypoint-tag([Infrastructure], color: palette.primary),
    waypoint-tag([Connectivity], color: palette.secondary),
    waypoint-tag([Geopolitics], color: palette.accent-copper),
  )
][
  #manifest-box([Investment Portfolio], [
    - *Transport*: 42% of total investment
    - *Energy*: 28% (pipelines, power plants)
    - *Digital*: 15% (fiber optics, data centers)
    - *Industrial*: 10% (special economic zones)
    - *Other*: 5% (cultural, educational)
  ], accent: palette.primary)

  #v(0.5em)

  #tonnage-stat([Total Investment], [\$1.3T], color: palette.secondary)
]

== Shipping Corridors

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  route-card([Suez Canal Route], [
    - *12% of global trade* passes through Suez
    - Connects Mediterranean to Indian Ocean
    - Saves 7,000 km vs. Cape route
    - 50+ ships transit daily
    - Widened in 2015 to allow two-way traffic
  ], accent: palette.primary),
  route-card([Panama Canal Route], [
    - *5% of global trade* passes through Panama
    - Connects Atlantic to Pacific
    - Expanded in 2016 (Neopanamax locks)
    - Critical for US-Asia container trade
    - 14,000+ transits annually
  ], accent: palette.accent-copper),
)

#v(0.4em)

#hemisphere-grid(
  [Eastern Hemisphere], [
    - Suez Canal: 1.2B tons/year
    - Strait of Malacca: 25% of global trade
    - Strait of Hormuz: 21M barrels/day
  ],
  [Western Hemisphere], [
    - Panama Canal: 500M+ tons/year
    - Mississippi River: 600M tons inland
    - US West Coast: 40% of US imports
  ],
)

// ══════════════════════════════════════
// Section 3: Trade Economics
// ══════════════════════════════════════
= Trade Economics

== Global Cargo Volumes

#cols[
  #voyage-card([2020 -- Pandemic Disruption], [
    Global supply chains face unprecedented disruption. Container shipping rates spike 400%. Port congestion creates 2-week backlogs worldwide.
  ], accent: palette.rose-red)

  #v(0.3em)

  #voyage-card([2022 -- Recovery & Reshoring], [
    Near-shoring and friend-shoring trends emerge. Regional trade blocs strengthen. Mexico becomes top US trade partner.
  ], accent: palette.secondary)

  #v(0.3em)

  #voyage-card([2025 -- Digital Trade Corridors], [
    AI-optimized logistics reduce transit times 15%. Digital trade documentation cuts customs delays by 60%.
  ], accent: palette.primary)
][
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    tonnage-stat([Container Volume], [860M TEU], color: palette.primary),
    tonnage-stat([Bulk Cargo], [12.3B tons], color: palette.secondary),
  )

  #v(0.5em)

  #compass-card([Fleet Composition], [
    - Container ships: 5,500+ vessels
    - Bulk carriers: 12,000+ vessels
    - Tankers: 8,000+ vessels
    - Average vessel age: 12.4 years
    - New builds on order: 3,200+
  ], accent: palette.accent-copper)
]

== Cost Analysis

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  manifest-box([Shipping Cost Factors], [
    - *Fuel (bunker)*: 35-50% of operating cost
    - *Port charges*: 15-20%
    - *Crew wages*: 10-15%
    - *Insurance*: 5-8%
    - *Canal tolls*: 3-5% (varies by route)
    - *Maintenance*: 8-12%
  ], accent: palette.primary),
  compass-card([Route Optimization], [
    Modern route planning uses:
    - Real-time weather satellite data
    - Ocean current modeling (fuel savings 8-12%)
    - AI-driven port congestion prediction
    - Dynamic speed adjustment algorithms
    - Carbon emission pathway optimization
  ], accent: palette.secondary),
)

#v(0.4em)

#logbook-note(
  [A single large container ship burning 150 tons of fuel per day can carry enough goods to fill 10,000 trucks, making maritime shipping the most carbon-efficient form of long-distance freight transport per ton-kilometer.],
  author: [IMO Fourth Greenhouse Gas Study, 2024]
)

// ══════════════════════════════════════
// Section 4: Strategic Chokepoints
// ══════════════════════════════════════
= Strategic Chokepoints

== Critical Passages

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  port-box([Strait of Hormuz], [
    Handles *21M barrels/day* of oil. Width just 33km at narrowest. Iran and Oman control both shores.
  ]),
  port-box([Strait of Malacca], [
    *25% of global trade*. Only 2.7km wide at Phillips Channel. Singapore, Malaysia, Indonesia share control.
  ]),
  port-box([Bab el-Mandeb], [
    Gateway to Red Sea and Suez Canal. Just 26km wide. Yemen and Djibouti flank the strait.
  ]),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  route-card([Geopolitical Risks], [
    - Military confrontation potential
    - Piracy and maritime terrorism
    - Political instability in littoral states
    - Climate change affecting water levels
    - Trade war escalation and sanctions
  ], accent: palette.rose-red),
  route-card([Mitigation Strategies], [
    - Alternative route development (Arctic)
    - Strategic petroleum reserves
    - Naval coalition patrols
    - Pipeline bypass infrastructure
    - Supply chain diversification
  ], accent: palette.primary),
)

== The Arctic Route

#cols[
  #compass-card([Northern Sea Route], [
    As Arctic ice recedes, the Northern Sea Route offers a *40% shorter* path between East Asia and Northern Europe compared to the Suez Canal route.

    - Distance: 14,000 km vs. 21,000 km (via Suez)
    - Transit time: 18 days vs. 30 days
    - Navigable window expanding yearly
    - Russian icebreaker escort required
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.6em,
    waypoint-tag([Arctic], color: palette.primary),
    waypoint-tag([Climate], color: palette.rose-red),
    waypoint-tag([Russia], color: palette.accent-copper),
    waypoint-tag([LNG], color: palette.secondary),
  )
][
  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    tonnage-stat([Transits 2023], [92 vessels], color: palette.primary),
    tonnage-stat([Cargo Volume], [36M tons], color: palette.secondary),
  )

  #v(0.5em)

  #voyage-card([2030 Projection], [
    Arctic shipping volume projected to reach 150M tons annually. Ice-free summer passage expected by 2040-2050.
  ], accent: palette.secondary)

  #v(0.3em)

  #voyage-card([Infrastructure Needed], [
    Deep-water ports, search and rescue stations, and environmental monitoring systems along the entire 5,600 km Russian Arctic coastline.
  ], accent: palette.accent-copper)
]

// ══════════════════════════════════════
// Section 5: Future Outlook
// ══════════════════════════════════════
= Future Outlook

== Digital Trade & Automation

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  route-card([Autonomous Shipping], [
    - *Fully autonomous* cargo vessels by 2030
    - Remote operation centers in Singapore, Rotterdam
    - 12% fuel savings through AI navigation
    - Reduced crew costs (70% of operating expense)
    - Enhanced safety through sensor fusion
  ], accent: palette.primary),
  route-card([Blockchain Trade Finance], [
    - *Smart contracts* eliminate letter of credit delays
    - Digital bills of lading reduce fraud 90%
    - Real-time cargo tracking and provenance
    - Automated customs clearance
    - Cross-border payment settlement in minutes
  ], accent: palette.secondary),
)

#v(0.4em)

#hemisphere-grid(
  [Near-Term (2025-2030)], [
    - Semi-autonomous coastal vessels
    - Digital trade corridors (ASEAN, EU)
    - Green methanol bunkering infrastructure
    - AI-optimized port operations
  ],
  [Long-Term (2030-2050)], [
    - Fully autonomous ocean-going vessels
    - Hydrogen fuel cell propulsion
    - Space-based logistics monitoring
    - Hyperloop cargo connections to ports
  ],
)

== Digital Transformation Milestones

#stack(
  spacing: 0.8em,
  logbook-note(
    [Key milestones tracking the industry's transition to autonomous shipping and digital trade finance.],
    author: [IMO Digital Strategy Report, 2025],
  ),
  block(height: 190pt)[
    #compass-card([Automation Readiness Checklist], [
      - [x] IMO regulatory framework for remote-operation vessels adopted
      - [x] Major ports in Rotterdam and Singapore with AI berth allocation
      - [/] Blockchain bill-of-lading pilots across ASEAN and EU corridors
      - [ ] First fully autonomous deep-sea vessel commercial voyage
      - [ ] Hydrogen bunkering infrastructure at five major hub ports
    ], accent: palette.primary)
  ],
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"The sea, once it casts its spell, holds one in its net of wonder forever."_

  #text(size: 0.6em, weight: "regular", fill: palette.bg.transparentize(20%))[-- Jacques Cousteau]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Fair Winds and Following Seas]
