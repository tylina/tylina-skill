#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("IBM Plex Sans", "Hiragino Sans GB"), size: 20pt)

#show: topographic-theme.with(
  aspect-ratio: "16-9",
  footer: [TERRAIN SURVEY 2026],
  preset: "forest",
  config-info(
    title: [Climate Change & Global Terrain Transformation],
    subtitle: [Geological Survey Analysis Report],
    author: [Dr. Elena Vasquez],
    date: datetime(year: 2026, month: 5, day: 23),
  ),
  config-common(breakable: false),
)

#title-slide()

#speaker-note[Set the report scope: global terrain is changing through linked climate, coastal, and land-use pressures.]

= Geological Survey Overview

#speaker-note[Introduce the baseline survey section and the indicators used to identify terrain transformation.]

== Current State of Global Terrain

#cols(align: top)[
  #cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true,
    elevation-card([Permafrost Degradation], [
      Active layer thickness has increased by 30cm since 1990 in Arctic regions. Thermokarst formation accelerating across Siberian plateau.
    ]),
    elevation-card([Coastal Erosion], [
      Shoreline retreat averaging 1.2m per year along vulnerable coastlines. Salt marsh ecosystems facing unprecedented loss rates.
    ]),
  )
  #v(0.6em)
  #coordinate-tag[LAT 71.2N | LON 156.8W | DATUM: WGS84]
][
  #terrain-quote([The landscape is not merely changing -- it is transforming at rates unprecedented in the geological record.], cite: [USGS Terrain Report, 2025])
  #v(0.8em)
  #survey-note([Field Observation], [
    Ground subsidence of 4--8cm annually observed at monitoring stations across the North Slope. Infrastructure stability compromised in 23% of surveyed zones.
  ])
]

#speaker-note[Pair the Arctic and coastal examples with the field observation to make the abstract trend tangible.]

== Elevation Change Data

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #depth-stat([+3.2], [Global mean sea level rise since 1993], unit: [mm/yr])
][
  #depth-stat([-2.4], [Antarctic ice sheet mass balance], unit: [Gt/yr])
][
  #depth-stat([+0.8], [Thermal expansion contribution], unit: [mm/yr])
]

#v(0.4em)

#{
  set text(size: 10pt)
  lq.diagram(
    width: 90%,
    // Include axes and labels in the height budget; a bare length sizes only the data area.
    height: 0% + 125pt,
    xaxis: (
      ticks: ((1993, [1993]), (2001, [2001]), (2009, [2009]), (2017, [2017]), (2025, [2025])),
      subticks: none,
    ),
    yaxis: (subticks: none),
    xlabel: [Year],
    ylabel: [Cumulative Sea Level Rise (mm)],
    lq.plot(
      (1993, 1997, 2001, 2005, 2009, 2013, 2017, 2021, 2025),
      (0, 12, 26, 44, 62, 84, 108, 138, 170),
      stroke: palette.water + 2pt,
      mark: "o",
      mark-size: 3pt,
    ),
  )
}

#contour-divider()

#coordinate-tag[REF: TOPEX/POSEIDON | EPOCH: 1993-2025 | RESOLUTION: 0.25deg]

#speaker-note[Read the three drivers together, then use the chart to show acceleration rather than a one-time shift.]

== Survey Methodology

- *Satellite Altimetry*: CryoSat-2 and ICESat-2 providing sub-centimeter elevation precision
- *Ground Truthing*: 847 permanent survey markers installed across monitoring networks
- *LiDAR Mapping*: Airborne surveys covering 2.3 million hectares of vulnerable terrain
- *InSAR Analysis*: Differential interferometry detecting ground deformation at millimeter scale

#speaker-note[Briefly establish why the evidence is robust: the survey combines orbital, airborne, and ground observations.]

#dark-slide(title: [Critical Findings])[
  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      text(size: typo.lead, weight: "bold", fill: palette.paper)[Permafrost Thaw Zones]
      v(0.6em)
      set text(size: 13pt, fill: palette.paper.transparentize(20%))
      [
        - 67% of continuous permafrost shows thermal instability
        - Active layer depth exceeds 3m in newly identified zones
        - Methane emission hotspots correlate with terrain subsidence
      ]
    },
    {
      text(size: typo.lead, weight: "bold", fill: palette.paper)[Sea Level Projections]
      v(0.6em)
      set text(size: 13pt, fill: palette.paper.transparentize(20%))
      [
        - RCP 8.5 scenario: +0.84m by 2100
        - Greenland contribution accelerating beyond models
        - Tipping point threshold identified at +1.5C warming
      ]
    },
  )
]

#speaker-note[Summarize the two highest-consequence findings: unstable permafrost and accelerating sea-level risk.]

= Sea Level Rise Analysis

#speaker-note[Move from global baseline evidence to coastal exposure and the consequences below the waterline.]

== Coastal Vulnerability Assessment

#cols(align: top)[
  #elevation-card([High-Risk Zones], [
    *Bangladesh Delta*: 17 million people below 1m elevation. Annual flooding extent increasing 12% per decade.

    *Pacific Islands*: Tuvalu, Kiribati facing existential threat. Freshwater lens contamination at critical levels.
  ])
][
  #elevation-card([Infrastructure at Risk], [
    *Global Ports*: 14 of world's 20 largest ports vulnerable to 2m storm surge by 2050.

    *Coastal Roads*: 340,000 km of roadway within 5m of current sea level across 89 nations.
  ])
  #v(0.4em)
  #coordinate-tag[SURVEY REF: NOAA/CO-OPS #sym.dot.c VDATUM 2024]
]

#speaker-note[Compare social exposure in low-lying regions with the infrastructure systems that must remain functional.]

== Bathymetric Changes

#cols(columns: (2fr, 1fr), align: top)[
  #terrain-quote([Ocean floor mapping reveals submarine landslide scars that correlate with periods of rapid sea level change. The continental shelves bear witness to millennial-scale terrain transformation.], cite: [Marine Geology Review, 2025])
  #v(0.6em)
  - Submarine canyon erosion rates doubled since 1980
  - Continental shelf sedimentation patterns disrupted
  - Deep ocean temperature anomalies affecting benthic terrain stability
][
  #survey-note([Alert], [
    Methane hydrate destabilization detected at depths below 400m on Arctic continental margins.
  ])
  #v(0.5em)
  #depth-stat([412], [monitoring stations globally], unit: [active])
]

#speaker-note[Explain that bathymetry records both long-term change and emerging hazards such as hydrate destabilization.]

#focus-slide[
  The terrain beneath our feet and beneath our seas is responding to climate forcing at rates that demand immediate, coordinated global survey action.
]

#speaker-note[Pause here to make the urgency explicit: terrain response now requires coordinated, continuous observation.]

= Land Use Change

#speaker-note[Start the third section by connecting land conversion directly to terrain instability and runoff.]

== Deforestation & Terrain Impact

#cols(align: top)[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true,
    elevation-card([Amazon Basin], [
      Soil erosion increased 340% in deforested areas. Laterite exposure creating irreversible terrain degradation.
    ], accent: palette.contour),
    elevation-card([Southeast Asia], [
      Peatland drainage causing land subsidence of 2--5cm per year. Fire risk multiplied in drained terrain.
    ], accent: palette.water),
    elevation-card([Central Africa], [
      Congo Basin losing 0.5% canopy per year. Watershed hydrology altered across 3 major river systems.
    ], accent: palette.grid-brown),
  )
][
  #survey-note([Critical Data], [
    Remote sensing analysis of 12,847 terrain monitoring plots reveals that deforested land experiences 4x the surface runoff and 7x the topsoil loss compared to intact forest.
  ])
  #v(0.5em)
  #contour-divider()
  #v(0.3em)
  #coordinate-tag[DATASET: HANSEN/GFW v1.10 | PERIOD: 2001-2025]
]

#speaker-note[Use the three regional examples to show that deforestation has different local mechanisms but a shared terrain cost.]

== Urban Expansion on Vulnerable Terrain

- *Floodplain Development*: 89M people added to flood-prone areas since 2000
- *Coastal Megacities*: Jakarta, Lagos, Mumbai -- subsidence compounding sea level rise

#speaker-note[Stress that urban growth increases exposure precisely where subsidence and flooding are already compounding.]

#dark-slide(title: [Global Land Cover Transition])[
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    {
      text(size: 36pt, weight: "bold", fill: palette.paper)[23%]
      v(0.3em)
      text(size: 11pt, fill: palette.paper.transparentize(30%), font: _mono-font)[FOREST LOSS SINCE 1990]
      v(0.4em)
      set text(size: 11pt, fill: palette.paper.transparentize(20%))
      [Global forest area decreased from 4.128 to 3.999 billion hectares]
    },
    {
      text(size: 36pt, weight: "bold", fill: palette.paper)[+178%]
      v(0.3em)
      text(size: 11pt, fill: palette.paper.transparentize(30%), font: _mono-font)[URBAN AREA GROWTH]
      v(0.4em)
      set text(size: 11pt, fill: palette.paper.transparentize(20%))
      [Built-up area tripled in developing nations between 1990-2025]
    },
    {
      text(size: 36pt, weight: "bold", fill: palette.marker)[1.2B]
      v(0.3em)
      text(size: 11pt, fill: palette.paper.transparentize(30%), font: _mono-font)[PEOPLE AT RISK]
      v(0.4em)
      set text(size: 11pt, fill: palette.paper.transparentize(20%))
      [Living on degraded land with high vulnerability to terrain hazards]
    },
  )
]

#speaker-note[Turn the headline statistics into a single message: land-cover change is simultaneously environmental and social risk.]

= Monitoring & Response

#speaker-note[Introduce the response section: a monitoring network must be global, timely, and connected to action.]

== Global Terrain Monitoring Network

#cols(columns: (3fr, 2fr), align: top)[
  === Satellite Constellation

  #grid(columns: (1fr, 1fr), column-gutter: 12pt, row-gutter: 12pt,
    coordinate-tag[SENTINEL-6],
    coordinate-tag[ICESAT-2],
    coordinate-tag[CRYOSAT-2],
    coordinate-tag[GRACE-FO],
    coordinate-tag[TERRASAR-X],
    coordinate-tag[ALOS-2],
  )

  #v(0.8em)

  Combined coverage provides daily global elevation monitoring with sub-centimeter vertical precision.
][
  #survey-note([Network Status], [
    *Active Stations*: 4,281 globally \
    *Data Latency*: < 24 hours \
    *Coverage*: 94% of vulnerable zones \
    *Uptime*: 99.7% (2025 average)
  ])
  #v(0.5em)
  #elevation-card([Next Generation], [
    NISAR mission (2025) will provide L-band and S-band radar coverage for terrain deformation mapping.
  ])
]

#speaker-note[Describe how the satellite constellation and ground network combine broad coverage with usable operational data.]

== Recommended Actions

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #elevation-card([Immediate (0-2 years)], [
    - Deploy 200 additional permanent markers
    - Establish real-time subsidence alert system
    - Complete LiDAR baseline for all coastal zones
    - Integrate Indigenous land knowledge databases
  ])
][
  #elevation-card([Strategic (2-10 years)], [
    - Develop predictive terrain change models
    - Build climate-resilient infrastructure codes
    - Create global terrain vulnerability index
    - Fund managed retreat planning for 50 highest-risk zones
  ])
]

#speaker-note[Distinguish immediate measurement and alert investments from the longer-term institutional and planning work.]

#hero-slide(bg-color: palette.terrain)[
  #pad(x: 4em, y: 3em)[
    #set std.align(left + horizon)
    #text(size: 11pt, fill: white.transparentize(40%), font: _mono-font, tracking: 1.5pt)[SURVEY CONCLUSION]
    #v(0.6em)
    #text(size: 28pt, weight: "bold", fill: white)[
      The Earth's terrain is our most fundamental infrastructure. Understanding its transformation is not optional -- it is existential.
    ]
    #v(1em)
    #text(size: 12pt, fill: white.transparentize(30%), font: _mono-font)[
      REF: IPCC AR7 | USGS NATIONAL MAP | ESA CCI LAND COVER
    ]
  ]
]

#speaker-note[End with the governing principle: terrain is essential infrastructure, so understanding change is a non-optional public capability.]

#ending-slide[Thank You]

#speaker-note[Thank the audience and direct questions toward monitoring priorities, regional exposure, and implementation pathways.]
