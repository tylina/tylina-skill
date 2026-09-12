// Greenhouse Theme Demo — Victorian Botanical Science & Sustainable Innovation
// Demonstrates all slide types and reusable components
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: greenhouse-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Kew Botanical Research Institute],
  config-info(
    title: [Sustainable Futures Through Botanical Innovation],
    subtitle: [Annual Research Symposium 2026],
    author: [Dr. Eleanor Ashworth, PhD],
    institution: [Royal Botanical Research Institute, Cambridge],
    date: datetime(year: 2026, month: 5, day: 23),
  ),
)

#set text(font: ("Avenir Next", "Arial"))
#show raw: set text(font: ("Menlo", "DejaVu Sans Mono"))

// ═══ Title Slide ═══
#title-slide()

// ═══ Section 1: Research Overview ═══
= Research Overview

== Programme Highlights 2025--2026

#cols(columns: (1fr,) * 4, gutter: 12pt,
  growth-stat([Active Projects], [38], trend: [+12% YoY], accent: palette.primary),
  growth-stat([Species Catalogued], [4,217], trend: [+340 new], accent: palette.dark),
  growth-stat([Carbon Sequestered], [2.4M], trend: [tonnes CO2e], accent: palette.accent),
  growth-stat([Global Partners], [67], trend: [across 28 nations], accent: palette.bloom),
)

#v(0.5em)

#propagation-box([Annual Progress Summary], [
  Our research programme has expanded to cover tropical, temperate, and arctic biomes with integrated climate monitoring. Field stations in 12 countries now contribute real-time phenological data. The herbarium digitisation initiative reached 89% completion, making 1.2 million specimens accessible to researchers worldwide.
])

== Core Research Pillars

#cols(columns: (1fr, 1fr, 1fr), gutter: 14pt,
  pane-card([Conservation Genomics], [
    - Population genetics of endangered flora
    - Seed bank viability assessment
    - *Target:* 500 species profiled by 2027
    - CRISPR-assisted resistance breeding
    - Phylogenetic diversity mapping
  ], accent: palette.primary),
  pane-card([Climate Adaptation], [
    - Phenological shift monitoring
    - Drought-tolerant cultivar development
    - *Target:* 30 adapted varieties released
    - Soil microbiome resilience studies
    - Urban canopy modelling
  ], accent: palette.dark),
  pane-card([Sustainable Agriculture], [
    - Agroforestry system design
    - Pollinator habitat corridors
    - *Target:* 10,000 ha restored by 2028
    - Indigenous knowledge integration
    - Carbon credit methodology
  ], accent: palette.accent),
)

// ═══ Section 2: Key Discoveries ═══
= Key Discoveries

== Tropical Canopy Carbon Dynamics

#cols(columns: (3fr, 2fr), gutter: 16pt)[
  #fern-card([Methodology \& Findings], [
    Our LiDAR canopy survey across 14 tropical sites found epiphytes contribute 12--18% more carbon than estimated.

    - *Survey area:* 240,000 hectares across 3 continents
    - *Novel finding:* Moss communities at 30m+ elevation fix 3.2 tonnes CO2/ha/year
    - *Implication:* Current REDD+ models underestimate forest carbon by 8--15%
    - *Publication:* Nature Ecology \& Evolution, 2026
  ], accent: palette.primary)
][
  #stack(spacing: 0.8em,
    growth-stat([New Carbon Est.], [+15%], trend: [above baseline], accent: palette.primary, compact: true),
    growth-stat([Epiphyte Species], [847], trend: [identified], accent: palette.dark, compact: true),
    growth-stat([Forest Sites], [14], trend: [surveyed], accent: palette.accent, compact: true),
  )
]

== Pollinator Network Resilience

#cols(columns: (1fr, 1fr), gutter: 16pt,
  propagation-box([Network Analysis Results], [
    Pollinator networks in restored meadows reached 78% structural complexity of ancient meadows within just 5 years:
    - *Connectance:* 0.34 (restored) vs. 0.42 (ancient reference)
    - *Nestedness:* NODF = 0.61 (indicating robust generalist core)
    - *Species richness:* 142 pollinator species recorded
    - *Functional redundancy:* High -- 3.2 species per functional role

    Restoration protocol now adopted by 8 UK wildlife trusts.
  ], accent: palette.primary),
  terracotta-box([Critical Vulnerability], [
    Despite high resilience metrics, 23% of restored networks showed single-point dependencies on one keystone plant species:
    - *Centaurea scabiosa* -- supports 34 specialist visitors
    - Loss of keystone triggers 40% network collapse in models
    - *Recommendation:* Ensure minimum 3 keystone species per hectare
    - Emergency propagation protocol activated for 5 threatened keystones
  ]),
)

== Seed Bank Viability Assessment

#figure(
  botanical-table(
    ([Species], [Family], [Storage Years], [Germination Rate], [Viability Status]),
    (
      ([_Rafflesia arnoldii_], [Rafflesiaceae], [12], [*67%*], [Stable]),
      ([_Wollemia nobilis_], [Araucariaceae], [8], [*89%*], [Excellent]),
      ([_Amorphophallus titanum_], [Araceae], [15], [*43%*], [Declining]),
      ([_Encephalartos woodii_], [Zamiaceae], [20], [*72%*], [Stable]),
    ),
  )
)

#v(0.3em)

#bloom-box([Urgent Action Required], [
  _Amorphophallus titanum_ is declining 3.2% annually; revise cryopreservation before Q3 2026.
])

// ═══ Section 3: Technology & Methods ═══
= Technology \& Methods

== Environmental DNA Monitoring

#cols(columns: (1fr, 1fr), gutter: 16pt,
  conservatory-highlight([eDNA Metabarcoding Pipeline], [
    Our automated eDNA monitoring system deploys across 200+ aquatic and terrestrial sites:

    - *Sample processing:* 48-hour turnaround via robotic extraction
    - *Barcode coverage:* ITS2, rbcL, matK, trnL markers
    - *Detection limit:* 10 copies/litre water sample
    - *Species per sample:* Mean 47 taxa detected
    - *False positive rate:* \<0.3% with dual-index decontamination
  ], accent: palette.primary),
  conservatory-highlight([Real-Time Biodiversity Dashboard], [
    Live data feeds from field stations provide continuous species monitoring:

    - *Update frequency:* Every 6 hours from autonomous samplers
    - *Alert system:* Invasive species detection within 24 hours
    - *Historical comparison:* 10-year baseline for trend analysis
    - *API access:* Open data for 340 registered research groups
    - *Machine learning:* 94.7% accuracy in automated identification
  ], accent: palette.dark),
)

== Drone-Based Canopy Mapping

#cols[
  #cols(columns: (2fr, 1fr), gutter: 16pt)[
    #pane-card([Survey Specifications], [
      Our fleet of 12 autonomous survey drones covers 500 hectares per day with sub-centimetre resolution:

      - *Sensors:* Multispectral (5-band), LiDAR, thermal
      - *Flight altitude:* 40--120m adaptive to canopy height
      - *Point cloud density:* 200 points/m\u{00B2} minimum
      - *Revisit cycle:* Monthly for phenological tracking
      - *AI classification:* 97.3% accuracy at genus level from imagery
    ], accent: palette.primary)
  ][
    #seed-tag([Multispectral], accent: palette.primary)
    #v(0.4em)
    #seed-tag([LiDAR], accent: palette.dark)
    #v(0.4em)
    #seed-tag([Thermal IR], accent: palette.accent)
    #v(0.4em)
    #seed-tag([RGB 8K], accent: palette.bloom)
    #v(1em)
    #growth-stat([Coverage], [6,200 ha], trend: [per month], accent: palette.primary)
  ]
]

// ═══ Section 4: Conservation Impact ═══
= Conservation Impact

== Species Recovery Programmes

#cols(columns: (1fr, 1fr), gutter: 16pt)[
  #fern-card([Success Stories], [
    - *Wollemia nobilis:* Wild population +340% since 2019 intervention
    - *Nymphaea thermarum:* 6 new populations established (3 countries)
    - *Sophora toromiro:* Reintroduction to Rapa Nui -- 200 seedlings thriving
    - *Medusagyne oppositifolia:* Seychelles population doubled via tissue culture
  ], accent: palette.primary)
][
  #fern-card([Ongoing Challenges], [
    - *Encephalartos woodii:* Only male specimens exist -- exploring biotech solutions
    - *Franklinia alatamaha:* Phytophthora resistance still insufficient for wild release
    - *Cyanea superba:* Pollinator absence limits natural reproduction
    - *Kokia cookei:* Graft success rate remains at 23% -- protocol revision underway
  ], accent: palette.accent)
]

#v(0.3em)

#specimen-quote(
  [Biodiversity safeguards four billion years of innovation.],
  attribution: [Prof. David Bellamy, Opening Address 2024],
)

== Global Restoration Metrics

#figure(
  botanical-table(
    ([Region], [Hectares Restored], [Species Planted], [Survival Rate], [Carbon (tCO2e)]),
    (
      ([Southeast Asia], [4,200], [89 native species], [*82%*], [12,400]),
      ([East Africa], [3,800], [67 native species], [*76%*], [9,800]),
      ([Atlantic Forest], [2,900], [112 native species], [*84%*], [8,200]),
      ([Mediterranean], [1,600], [45 native species], [*91%*], [4,100]),
    ),
  )
)

#v(0.7em)

#propagation-box([Restoration Milestone], [
  13,390 hectares restored across five bioregions; 20,000-hectare target for 2028.
], accent: palette.primary, compact: true)

// ═══ Section 5: Future Directions ═══
= Future Directions

== Strategic Priorities 2026--2030

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt,
  conservatory-highlight([Genomic Conservation], [
    - Whole-genome sequencing of 1,000 threatened species
    - Cryopreservation tech upgrade (vitrification)
    - Gene drive assessment for invasive control
    - *Budget:* \u{00A3}4.2M over 4 years
  ], accent: palette.primary),
  conservatory-highlight([Climate Intelligence], [
    - AI-powered species distribution modelling
    - Assisted migration decision framework
    - Phenological prediction at 1km resolution
    - *Budget:* \u{00A3}3.8M over 4 years
  ], accent: palette.dark),
  conservatory-highlight([Community Science], [
    - Mobile app for 500,000 citizen botanists
    - School partnership programme (2,000 schools)
    - Indigenous land stewardship integration
    - *Budget:* \u{00A3}2.1M over 4 years
  ], accent: palette.accent),
)

== Funding and Partnerships

#cols(columns: (1fr, 1fr), gutter: 16pt)[
  #stack(spacing: 0.8em,
    growth-stat([Total Funding], [\u{00A3}24.8M], trend: [secured for 2026--2030], accent: palette.primary, compact: true),
    growth-stat([New Partners], [12], trend: [signed this year], accent: palette.accent, compact: true),
    growth-stat([PhD Students], [42], trend: [across 8 universities], accent: palette.dark, compact: true),
  )
][
  #pane-card([Key Funding Sources], [
    - UKRI Future Leaders: \u{00A3}8.2M (genomics programme)
    - Wellcome Trust: \u{00A3}5.1M (One Health biodiversity)
    - EU Horizon Europe: \u{00A3}4.8M (restoration monitoring)
    - Corporate partnerships: \u{00A3}3.9M (carbon credit validation)
    - Philanthropic: \u{00A3}2.8M (citizen science)
  ], accent: palette.primary)
]

== Key Takeaway

#focus-slide()[
  Every species we preserve is a library of solutions\
  refined over millions of years of evolution.\

  #v(0.5em)
  #text(size: 0.6em, weight: "regular")[
    38 active projects | 4,217 species catalogued | 13,390 hectares restored
  ]
]

// ═══ Ending Slide ═══
#ending-slide()[Thank You]
