// Meridian Theme Demo — Global Climate Data Analysis
// Research presentation style
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("Helvetica Neue", "Noto Sans SC"), size: 18pt)
#show raw: set text(font: "DejaVu Sans Mono")

#show: meridian-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Global Climate Observatory -- Annual Research Briefing 2026],
  config-info(
    title: [Global Temperature Anomalies],
    subtitle: [A Meridian Analysis of Decadal Warming Patterns],
    author: [Dr. Elara Voss],
    institution: [Geophysical Research Institute, Zurich],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Introduction
// ══════════════════════════════════════
= Introduction

== Research Context

#stack(
  spacing: 0.8em,
  block(height: 190pt)[
    #cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
      coordinate-card([Study Overview], [
        This research examines *global surface temperature anomalies* across all major meridian zones over the past three decades.

        - 42 monitoring stations along prime meridian
        - Satellite cross-validation (MODIS, AIRS)
        - Statistical significance at $p < 0.001$
      ], accent: palette.primary),
      coordinate-card([Key Hypothesis], [
        Temperature amplification is not uniform across longitudes. We hypothesize that:

        - Continental meridians show 1.4x warming vs. oceanic
        - Polar amplification varies by hemisphere
        - Urban heat islands distort zonal averages
      ], accent: palette.secondary),
    )
  ],
  cartograph-highlight[
    *Central Finding:* The 2015--2025 decade showed a mean anomaly of +1.21 degrees C relative to the 1951--1980 baseline, with meridian-dependent variation of $plus.minus$ 0.34 degrees C.
  ],
)

== Methodology

#stack(
  spacing: 0.8em,
  block(height: 250pt)[
    #cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
      azimuth-box([Data Sources], [
        - NASA GISS Surface Temperature Analysis (GISTEMP v4)
        - HadCRUT5 global temperature dataset
        - ERA5 reanalysis fields (ECMWF)
        - NOAA Global Historical Climatology Network
        - Direct radiosonde measurements (1991--2025)
      ], accent: palette.primary),
      waypoint-list[
        + Collect raw station data across 180 meridian transects
        + Apply homogenization and quality control filters
        + Compute zonal anomalies relative to 1951--1980 mean
        + Run spatial regression with meridian-latitude interaction
        + Validate against independent satellite observations
      ],
    )
  ],
  stack(
    dir: ltr,
    spacing: 0.5em,
    compass-tag([Spatial Statistics], color: palette.primary),
    compass-tag([Kriging], color: palette.secondary),
    compass-tag([GIS Analysis], color: palette.accent),
  ),
)

// ══════════════════════════════════════
// Section 2: Findings
// ══════════════════════════════════════
= Key Findings

== Temperature Anomalies by Zone

#stack(
  spacing: 0.8em,
  block(height: 68pt)[
    #cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      bearing-stat([Northern Continental], [+1.54 C]),
      bearing-stat([Northern Oceanic], [+0.98 C], color: palette.secondary),
      bearing-stat([Southern Continental], [+1.12 C], color: palette.primary),
      bearing-stat([Southern Oceanic], [+0.87 C], color: palette.ink),
    )
  ],
  cols(columns: (1fr, 1fr), gutter: 1.2em)[
    #coordinate-card([Zonal Summary], [
      The asymmetry between hemispheres is consistent with greater land mass in the Northern Hemisphere. Continental amplification factor: *1.57x* relative to adjacent ocean zones at the same latitude.
    ], accent: palette.accent)
  ][
    #stack(
      spacing: 0.8em,
      projection-quote(
        [The warming signal is not merely a global mean -- it is a geographically structured phenomenon that demands meridian-resolved analysis.],
        author: [Hansen et al., 2023],
      ),
      azimuth-box([Statistical Note], [
        All zonal comparisons passed the Kolmogorov-Smirnov test for distribution differences ($p < 0.001$). Effect sizes (Cohen's $d$) ranged from 0.42 to 1.87 across zones.
      ], accent: palette.primary),
    )
  ],
)

== Decadal Trends

#stack(
  spacing: 0.8em,
  block(height: 190pt)[
    #cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
      coordinate-card([Acceleration Pattern], [
        *2005--2015:* +0.18 C / decade

        *2015--2025:* +0.27 C / decade

        The rate increased by *50%* in the latest decade, led by continental meridians in the 60N--90N band.
      ], accent: palette.primary),
      coordinate-card([Meridian Hotspots], [
        - *75 E* (Central Asia): +2.1 C
        - *30 E* (Eastern Europe): +1.9 C
        - *120 W* (Western N. America): +1.7 C

        Each hotspot overlaps a region of permafrost degradation.
      ], accent: palette.accent),
    )
  ],
  meridian-divider(color: palette.primary, width: 68%),
  cartograph-highlight[
    The latest decade warmed *50% faster* than 2005--2015, led by continental meridians in the 60N--90N band.
  ],
)

== Acceleration Over Time

#stack(
  spacing: 0.8em,
  std.align(center,
    lq.diagram(
      width: 90%,
      height: 210pt,
      lq.plot(
        (1985, 1990, 1995, 2000, 2005, 2010, 2015, 2020, 2025),
        (0.12, 0.14, 0.15, 0.16, 0.18, 0.21, 0.25, 0.27, 0.31),
        stroke: palette.primary + 2pt,
        mark: "o",
        mark-size: 3pt,
      ),
      lq.xaxis(label: [Year], ticks: ((1985, [1985]), (1995, [1995]), (2005, [2005]), (2015, [2015]), (2025, [2025]))),
      lq.yaxis(label: [Warming Rate (°C/decade)]),
    ),
  ),
  projection-quote(
    [Meridian-stratified analysis reveals that the global mean masks critical spatial heterogeneity in warming rates.],
    author: [Voss & Yamamoto, Nature Geoscience, 2025],
  ),
)

// ══════════════════════════════════════
// Section 3: Implications
// ══════════════════════════════════════
= Implications

== Policy Implications

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  #stack(
    spacing: 0.8em,
    azimuth-box([Climate Adaptation], [
      Regions along high-anomaly meridians require *accelerated adaptation planning*:

      - Infrastructure resilience assessments
      - Agricultural transition strategies
      - Water resource reallocation
      - Heat-health early warning systems
    ], accent: palette.accent),
    block(height: 88pt)[
      #cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
        bearing-stat([Adaptation Cost], [\$2.4T], color: palette.accent),
        bearing-stat([At-Risk Population], [1.2B], color: palette.primary),
        bearing-stat([Tipping Points], [4 of 9], color: palette.secondary),
      )
    ],
  )
][
  #stack(
    spacing: 0.8em,
    coordinate-card([Mitigation Targets], [
      To limit meridian-zone warming to 1.5 C:

      - Global emissions must peak before 2027
      - Net-zero by 2045 (not 2050)
      - Carbon removal of 8--10 Gt CO2/year by 2040
      - Methane reduction of 45% by 2030
    ], accent: palette.primary),
    stack(
      dir: ltr,
      spacing: 0.5em,
      compass-tag([Paris Agreement], color: palette.primary),
      compass-tag([IPCC AR7], color: palette.secondary),
      compass-tag([NDCs], color: palette.accent),
    ),
  )
]

== Future Research Directions

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  waypoint-list[
    + Extend analysis to 50-year hindcast (1975--2025)
    + Incorporate ocean heat content along meridian transects
    + Develop high-resolution (0.25 degree) meridian grid model
    + Cross-validate with paleoclimate proxy records
  ],
  coordinate-card([Collaboration Network], [
    *Partner Institutions:*
    - ETH Zurich Climate Physics
    - NASA Goddard Institute
    - UK Met Office Hadley Centre
    - Max Planck Institute for Meteorology
  ], accent: palette.secondary),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  #stack(
  spacing: 0.8em,
    [_“The climate system does not warm uniformly -- understanding its meridian structure is essential for equitable adaptation.”_],
    text(size: 0.6em, weight: "regular", fill: white.transparentize(30%))[-- Dr. Elara Voss, 2026],
  )
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
