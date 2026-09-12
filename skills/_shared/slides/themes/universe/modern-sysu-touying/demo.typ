// ===============================================================
// Modern SYSU Touying Theme Demo
// Universe package: @preview/modern-sysu-touying:0.1.0
// Touying version: 0.6.1
// Theme for Sun Yat-sen University (中山大学)
// Based on the Stargazer theme with SYSU branding
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/modern-sysu-touying:0.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: sysu-theme.with(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif", "Songti SC"),
  config-common(breakable: false),
  config-info(
    title: [热带海洋生态系统碳循环机制研究],
    subtitle: [基于遥感与现场观测的综合分析],
    author: [陈海洋],
    date: datetime.today(),
    institution: [中山大学],
  ),
)

// =========================================================
// Title Slide
// =========================================================
#title-slide()

// =========================================================
// Outline
// =========================================================
#outline-slide()

// =========================================================
// Section 1: Introduction
// =========================================================
= Research Background

== Carbon Cycle in Marine Ecosystems

The ocean absorbs approximately 25% of anthropogenic CO#sub[2] emissions annually:

- *Biological pump* — phytoplankton photosynthesis and organic matter export
- *Solubility pump* — CO#sub[2] dissolution at high latitudes
- *Carbonate pump* — formation and dissolution of CaCO#sub[3]

Understanding the tropical ocean's role is critical for:
+ Accurate global carbon budget estimation
+ Climate change prediction models
+ Marine ecosystem management strategies

== Governing Equations

The marine carbon cycle can be described by the advection-diffusion-reaction equation:

#mitex(`\frac{\partial C}{\partial t} + \mathbf{u} \cdot \nabla C = \nabla \cdot (\kappa \nabla C) + J_{\text{bio}} + J_{\text{air-sea}}`)

where:
- #mi(`C`) is the dissolved inorganic carbon (DIC) concentration
- #mi(`\mathbf{u}`) is the ocean current velocity field
- #mi(`\kappa`) is the eddy diffusion coefficient
- #mi(`J_{\text{bio}}`) represents biological source/sink terms
- #mi(`J_{\text{air-sea}}`) is the air-sea CO#sub[2] flux

The air-sea flux is parameterized as:

#mitex(`J_{\text{air-sea}} = k_w (C_{\text{sat}} - C_{\text{surf}})`)

// =========================================================
// Section 2: Methods
// =========================================================
= Methodology

== Observation Framework

#tblock(title: [Multi-Scale Observation Strategy])[
  We combine satellite remote sensing with in-situ measurements from moored buoys and research cruises to characterize carbon dynamics across the South China Sea.
]

Data sources and temporal coverage:
- MODIS-Aqua chlorophyll-a: 2002--2024 (daily, 4 km)
- Argo float profiles: 2010--2024 (10-day cycle)
- Research cruises: 4 seasonal surveys per year
- Moored pCO#sub[2] buoys: continuous hourly data

== Satellite vs. In-Situ Comparison

#slide(composer: (1fr, 1fr))[
  === Remote Sensing Products

  - Chlorophyll-a (OC3M algorithm)
  - Sea surface temperature (SST)
  - Photosynthetically active radiation
  - Colored dissolved organic matter
  - Particulate organic carbon
][
  === In-Situ Measurements

  - Dissolved inorganic carbon (DIC)
  - Total alkalinity (TA)
  - Partial pressure of CO#sub[2]
  - Dissolved oxygen profiles
  - Nutrient concentrations (N, P, Si)
]

== Primary Production Model

Net primary production (NPP) is estimated using the VGPM model:

#mitex(`\text{NPP} = 0.66125 \times P_{\text{opt}}^B \times \frac{E_0}{E_0 + 4.1} \times C_{\text{sat}} \times Z_{\text{eu}} \times D_{\text{irr}}`)

where #mi(`P_{\text{opt}}^B`) is the optimal photosynthetic rate, #mi(`E_0`) is surface PAR, #mi(`C_{\text{sat}}`) is satellite chlorophyll, and #mi(`Z_{\text{eu}}`) is the euphotic depth.

// =========================================================
// Section 3: Results
// =========================================================
= Results and Discussion

== Spatial Distribution of Carbon Flux

Annual mean air-sea CO#sub[2] flux across the study area:

#table(
  columns: (1.5fr, 1fr, 1fr, 1fr),
  align: center,
  table.header(
    [*Region*], [*Area (10#super[4] km#super[2])*], [*Flux (mol/m#super[2]/yr)*], [*Status*],
  ),
  [Northern SCS], [85], [-1.2], [Sink],
  [Central SCS], [120], [+0.3], [Weak source],
  [Southern SCS], [95], [-0.8], [Sink],
  [Luzon Strait], [15], [-2.1], [Strong sink],
)

== Seasonal Variability

Key findings on seasonal patterns:

- *Winter* (DJF): Enhanced CO#sub[2] uptake due to monsoon-driven mixing
  - Deep nutrient supply fuels phytoplankton blooms
  - Low SST increases CO#sub[2] solubility
- *Summer* (JJA): Reduced uptake, localized outgassing
  - Stratification limits nutrient supply
  - Higher SST decreases gas solubility
- *Annual net flux*: #mi(`-0.6 \text{ mol} \cdot \text{m}^{-2} \cdot \text{yr}^{-1}`) (net carbon sink)

// =========================================================
// Section 4: Conclusion
// =========================================================
= Conclusion

== Summary and Implications

*Key findings:*
+ The South China Sea acts as a net annual CO#sub[2] sink of approximately 15 Tg C/yr
+ Monsoon-driven circulation is the primary driver of seasonal carbon flux variability
+ Remote sensing-based NPP estimates agree within 18% of in-situ measurements

*Future research:*
- Mesoscale eddy impacts on carbon export
- Deep-sea carbon sequestration efficiency
- Climate change projections under SSP scenarios
- Integration with biogeochemical Earth system models

// =========================================================
// Focus Slide
// =========================================================
#focus-slide[
  Thank You! \
  Questions & Discussion
]
