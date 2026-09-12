// Tidal Pool Theme Demo — Marine Biology Research
// Showcasing all slide types and components
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: tidal-pool-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Coastal Ecology Lab -- Intertidal Biodiversity Survey 2026],
  config-info(
    title: [Intertidal Zone Biodiversity],
    subtitle: [A Multi-Year Survey of Rocky Shore Tidal Pools],
    author: [Dr. Marina Ashworth],
    institution: [Pacific Marine Research Station, Monterey Bay],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("New Computer Modern", "Heiti SC"))
#show raw: set text(font: "IBM Plex Mono")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Introduction
// ══════════════════════════════════════
= Introduction

== Research Overview

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Study Design], [
    This longitudinal study tracks *species richness and community composition* across 48 intertidal pools along the Central California coast.

    - Monthly surveys spanning 36 months
    - Photo-quadrat and point-count methods
    - Environmental sensors (temperature, salinity, pH)
    - eDNA metabarcoding validation
  ]),
  concept-card([Key Questions], [
    How do tidal pool communities respond to thermal stress?

    - Does pool volume predict species persistence?
    - Are keystone species (ochre sea stars) recovering?
    - What role does microhabitat heterogeneity play?
    - Can we predict community collapse thresholds?
  ], accent: palette.navy),
)

#v(0.5em)

#wave-box[
  *Central Finding:* Pools with volume > 50 L and depth > 30 cm retained 94% of baseline species richness even during the 2025 marine heatwave event.
]

== Study Sites & Methods

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  insight-box([Site Selection], [
    - *12 rocky platforms* spanning 40 km coastline
    - *4 pools per platform* (high, mid-high, mid-low, low intertidal)
    - Selected for consistent substrate (granite/sandstone)
    - Wave exposure classified: sheltered, moderate, exposed
    - All sites within Monterey Bay National Marine Sanctuary
  ]),
  specimen-card([Sampling Protocol], [
    *Phase 1:* Visual census of all macrofauna > 5 mm

    *Phase 2:* Photo-quadrat (50 x 50 cm) for sessile organisms

    *Phase 3:* Water chemistry (YSI ProDSS multi-parameter)

    *Phase 4:* eDNA collection (1 L filtered, 0.45 um)
  ]),
)

#v(0.3em)

#stack(dir: ltr, spacing: 0.5em,
  tide-tag([Intertidal Ecology], color: palette.primary),
  tide-tag([Biodiversity], color: palette.navy),
  tide-tag([Climate Resilience], color: palette.coral),
  tide-tag([Conservation], color: palette.sand),
)

// ══════════════════════════════════════
// Section 2: Results
// ══════════════════════════════════════
= Key Results

== Species Richness by Zone

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
  stat-card([High Intertidal], [18 spp.], color: palette.coral),
  stat-card([Mid-High], [34 spp.], color: palette.sand),
  stat-card([Mid-Low], [52 spp.], color: palette.primary),
  stat-card([Low Intertidal], [67 spp.], color: palette.navy),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  concept-card([Zonation Patterns], [
    Species richness follows a strong vertical gradient, increasing *3.7x* from high to low intertidal zones.

    The mid-low zone showed the *highest functional diversity* (Shannon H' = 3.42), suggesting this ecotone maximizes niche availability.

    Shannon diversity index: #mi(`H' = -\sum_{i=1}^{S} p_i \ln p_i`)
  ], accent: palette.primary),
  quote-card(
    [The tidal pool is a window into the ocean — a miniature ecosystem where the dramas of predation, competition, and survival play out in crystal clarity.],
    author: [Ed Ricketts, Between Pacific Tides]
  ),
)

== Thermal Stress Response

#set text(size: 17pt)

#cols[
  #stack(spacing: .8em,
    depth-card([Heatwave Impact Analysis], [
      During the July 2025 marine heatwave (+3.2 C above mean):

      - *High pools:* 42% species loss within 2 weeks
      - *Mid pools:* 12% species loss, full recovery by October
      - *Low pools:* < 3% measurable impact

      Recovery time correlated strongly with pool volume ($r^2 = 0.87$, $p < 0.001$).
    ], depth-label: [Critical]),
    cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
      stat-card([Peak Temp.], [28.4 C], color: palette.coral),
      stat-card([Recovery Time], [68 days], color: palette.sand),
      stat-card([Resilient Pools], [83%], color: palette.primary),
    ),
  )
][
  #stack(spacing: .8em,
    insight-box([Thermal Refugia], [
      Pools with overhanging rock ledges (shading > 40% of surface) showed *significantly lower* maximum temperatures ($Delta T$ = -4.1 C) during aerial exposure.

      These "thermal refugia" maintained invertebrate communities even at the highest intertidal elevations.

      Logistic recovery model for keystone species: #mi(`\frac{dN}{dt} = rN\!\left(1 - \frac{N}{K}\right)`)
    ], accent: palette.navy),
    callout-box([Management Implication], [
      Artificial shading structures (removable canopies) deployed at three experimental sites reduced maximum pool temperatures by 2.8 C and prevented mass mortality during the August heatwave peak.
    ], accent: palette.sand),
  )
]

#set text(size: 18pt)

== Keystone Species Recovery

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  specimen-card([Pisaster ochraceus (Ochre Sea Star)], [
    *Population status:* Recovering (post-SSWD)

    - 2022 density: 0.3 per $m^2$ (historic: 2.1 per $m^2$)
    - 2025 density: 1.4 per $m^2$ (67% recovery)
    - Juvenile recruitment: 12.3 per $m^2$ (2025 cohort)
    - Size distribution normalizing (modal arm radius: 8.2 cm)

    *Cascade effect:* Mussel bed expansion reversed at sites with sea star recovery (Mytilus cover $arrow.b$ 34% from peak).
  ], accent: palette.coral),
  specimen-card([Strongylocentrotus purpuratus (Purple Urchin)], [
    *Population status:* Overabundant (barren-forming)

    - Density at affected sites: 68 per $m^2$
    - Kelp grazing rate: 4.2 g per urchin per day
    - "Urchin barren" coverage: 23% of low intertidal
    - Sunflower star absence driving hyperabundance

    *Management trial:* Targeted removal (> 50 per $m^2$) restored kelp canopy within 4 months at pilot sites.
  ], accent: palette.navy),
)

#v(0.3em)

#tide-divider(color: palette.primary)

// ══════════════════════════════════════
// Section 3: Environmental Drivers
// ══════════════════════════════════════
= Environmental Drivers

== Physical Parameters

#set text(size: 17pt)

#cols(lazy-layout: true, columns: (1fr, 1fr, 1.15fr), gutter: 0.9em,
  concept-card([Temperature Regime], [
    *Aerial exposure patterns:*
    - High pools: 6-8 hrs emersion / tidal cycle
    - Mid pools: 3-4 hrs emersion / tidal cycle
    - Low pools: 0.5-1.5 hrs emersion / tidal cycle

    *Temperature extremes:*
    - Maximum recorded: 32.1 C (high pool, August)
    - Minimum recorded: 8.4 C (low pool, January)
    - Diurnal range in high pools: up to 18 C
  ]),
  concept-card([Water Chemistry], [
    *Salinity variation:*
    - Evaporative concentration up to 42 ppt in high pools
    - Rain dilution events: as low as 12 ppt
    - Low pools stable: 33.2 $plus.minus$ 0.8 ppt

    *pH dynamics:*
    - Photosynthesis-driven diel cycling
    - Daytime peaks: pH 8.6-8.9 (high pools)
    - Nighttime troughs: pH 7.4-7.6
    - Calcifiers stressed below pH 7.8
  ], accent: palette.navy),
  depth-card([Upwelling Influence], [
    Periodic upwelling events (April-September) deliver cold, nutrient-rich water to the lower intertidal:

    - Nitrate pulses: 15-25 $mu$mol/L (vs. 2-5 baseline)
    - Temperature drops: 8-10 C within hours
    - Drives phytoplankton blooms feeding filter-feeders
    - Supplies larvae to pools during relaxation events

    *Key driver:* The interaction between upwelling frequency and thermal stress explains 71% of variance in community composition across all 48 study pools.
  ], depth-label: [Deep]),
)

#set text(size: 18pt)

== Community Interactions

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  insight-box([Trophic Cascade], [
    The loss of apex predators (sea stars, large crabs) triggered a measurable cascade:

    + Sea star decline $arrow.r$ urchin proliferation
    + Urchin overgrazing $arrow.r$ coralline algae loss
    + Habitat simplification $arrow.r$ fish/invertebrate decline
    + Reduced bioerosion $arrow.r$ altered pool morphology

    This cascade reversed at sites where Pisaster density exceeded 0.8 per $m^2$.
  ], accent: palette.navy),
  callout-box([Facilitation Networks], [
    *Positive interactions* dominate in high-stress zones:

    - *Mussels* create moisture refugia for gastropods
    - *Coralline algae* buffer pH for juvenile abalone
    - *Anemones* provide settlement substrate for barnacles
    - *Rockweed canopy* reduces desiccation stress by 60%

    Facilitation networks collapse above 28 C threshold.
  ], accent: palette.coral),
)

#v(0.3em)

#stack(dir: ltr, spacing: 0.5em,
  tide-tag([Trophic Dynamics], color: palette.navy),
  tide-tag([Facilitation], color: palette.primary),
  tide-tag([Keystone Effects], color: palette.coral),
  tide-tag([Resilience], color: palette.sand),
)

// ══════════════════════════════════════
// Section 4: Conservation
// ══════════════════════════════════════
= Conservation Implications

== Management Recommendations

#set text(size: 16pt)

#cols[
  #stack(spacing: .8em,
    concept-card([Priority Actions], [
      Based on three years of monitoring data, we recommend:

      + *Protect thermal refugia* — Map and designate shaded pools as critical habitat
      + *Urchin management* — Targeted removal in barren areas (> 50 per $m^2$)
      + *Visitor impact mitigation* — Boardwalks at high-traffic sites
      + *Pollution reduction* — Stormwater filtration at 6 priority outfalls
      + *Monitoring expansion* — Add 12 sentinel pools for early warning
    ]),
    cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
      stat-card([Protected Pools], [24 / 48], color: palette.primary),
      stat-card([Annual Budget], [\$340K], color: palette.sand),
      stat-card([Volunteer Hours], [2,400], color: palette.navy),
    ),
  )
][
  #stack(spacing: .8em,
    depth-card([Climate Adaptation Strategy], [
      Under RCP 4.5 projections, high intertidal pools will exceed lethal thresholds (> 35 C) during 40% of summer low tides by 2040.

      *Adaptive measures:*
      - Assisted migration of heat-tolerant genotypes
      - Artificial pool construction at optimal elevations
      - Living shoreline restoration to increase habitat
      - Community science monitoring network
    ], depth-label: [2040]),
    quote-card(
      [We cannot save every tide pool, but we can ensure the processes that create and sustain them remain intact for generations to come.],
      author: [Dr. Marina Ashworth, 2026]
    ),
  )
]

#set text(size: 18pt)

== Long-Term Monitoring Plan

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  specimen-card([Phase 2 Expansion (2027-2030)], [
    *New capabilities:*
    - Autonomous temperature/pH loggers (hourly)
    - Underwater time-lapse cameras (4 pools)
    - Acoustic monitoring for fish/invertebrate activity
    - Citizen science app for visitor observations
    - Integration with MPA monitoring network

    *Target:* Expand from 48 to 120 sentinel pools spanning Big Sur to Point Reyes.
  ]),
  specimen-card([Data Products], [
    *Public deliverables:*
    - Annual Tidal Pool Health Report Card
    - Interactive species distribution maps
    - Real-time pool temperature dashboard
    - Educational curricula for K-12 schools
    - Open-access biodiversity database (GBIF)

    *Research outputs:*
    - Predictive models for community resilience
    - Thermal tolerance database (45 species)
    - Management effectiveness assessments
  ], accent: palette.navy),
)

#v(0.3em)

#wave-box[
  *Next milestone:* Deployment of 24 autonomous monitoring stations across the expanded network by March 2027, enabling real-time early warning for thermal stress events.
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"Every tide pool is a universe — a self-contained world where life persists against the relentless rhythm of the sea."_

  #text(size: 0.6em, weight: "regular", fill: palette.navy)[-- Rachel Carson, The Edge of the Sea]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
