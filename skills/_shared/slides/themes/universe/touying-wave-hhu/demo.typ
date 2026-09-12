// ===============================================================
// Touying Wave HHU Theme Demo
// Universe package: @preview/touying-wave-hhu:0.2.0
// Touying version: 0.6.3 (owned internally by the Universe package)
// Theme for Hohai University (河海大学)
// Modified from Metropolis theme with wave decoration
// ===============================================================

#import "@preview/touying-wave-hhu:0.2.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: hhu-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [城市洪涝灾害风险评估与预警系统],
    subtitle: [
      #stack(
        spacing: 0.8em,
        [基于水文-水动力耦合模型的研究],
        text(size: 0.62em, weight: "regular")[
          刘水文 · 河海大学 · #datetime.today().display("[year] 年 [month] 月 [day] 日")
        ],
      )
    ],
  ),
  config-common(breakable: false),
  config-page(
    footer: (self) => {
      self.info.title
    },
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

== Urban Flood Challenges

Urbanization intensifies flood risks through multiple mechanisms:

- *Impervious surface expansion* — reduces infiltration, increases surface runoff
- *Drainage system overload* — aging infrastructure cannot handle extreme events
- *Climate change* — increasing frequency of extreme precipitation events
- *Urban heat island effect* — enhanced convective rainfall over cities

Recent flood events in Chinese cities highlight the urgent need for improved prediction systems.

== Hydrological Framework

The rainfall-runoff process in urban catchments is governed by:

#mitex(`Q(t) = \int_0^t (P(\tau) - I(\tau) - E(\tau)) \cdot u(t - \tau) \, d\tau`)

where:
- #mi(`Q(t)`) is the discharge at time #mi(`t`)
- #mi(`P(\tau)`) is the rainfall intensity
- #mi(`I(\tau)`) is the infiltration rate (Green-Ampt model)
- #mi(`E(\tau)`) is the evapotranspiration loss
- #mi(`u(t - \tau)`) is the unit hydrograph response function

#slide-aligned(
  title: [Saint-Venant Equations],
)[
  The Saint-Venant equations for 1D open channel flow:
][
  #mitex(`\begin{cases} \frac{\partial A}{\partial t} + \frac{\partial Q}{\partial x} = q_l \\ \frac{\partial Q}{\partial t} + \frac{\partial (Q^2/A)}{\partial x} + gA\frac{\partial h}{\partial x} = gA(S_0 - S_f) \end{cases}`)
]

// =========================================================
// Section 2: Methodology
// =========================================================
= Coupled Modeling Framework

#slide-mc(
  title: [Model Architecture],
)[
  === Surface Hydrology Module

  - SCS-CN method for runoff generation
  - Kinematic wave for overland flow
  - Green-Ampt infiltration model
  - Horton equation for initial losses
  - GIS-based sub-catchment delineation
][
  === Pipe Network Module

  - SWMM-based drainage simulation
  - Preissmann slot for pressurized flow
  - Junction storage and overflow
  - Pump station and gate operations
  - Real-time control rules
]

== Coupling Strategy

The surface and subsurface models are coupled through:

+ *Inlet exchange*: surface runoff enters the pipe network via manholes and gully inlets
+ *Surcharge flooding*: when pipe capacity is exceeded, water returns to the surface
+ *Bidirectional flux*: at each time step, exchange volumes are computed as:

#mitex(`Q_{\text{exchange}} = C_d A_{\text{inlet}} \sqrt{2g\Delta h} \cdot \text{sgn}(h_{\text{surface}} - h_{\text{pipe}})`)

where #mi(`C_d`) is the discharge coefficient and #mi(`\Delta h`) is the head difference.

== Data Fusion for Real-Time Prediction

The ensemble Kalman filter assimilates multi-source observations:

#mitex(`\mathbf{x}_t^a = \mathbf{x}_t^f + \mathbf{K}_t (\mathbf{y}_t - \mathbf{H} \mathbf{x}_t^f)`)

Data sources integrated into the system:
- Rain gauge network (5-min resolution)
- Weather radar (C-band, 6-min scan)
- IoT water level sensors at key nodes
- Satellite precipitation products (GPM IMERG)

// =========================================================
// Section 3: Results
// =========================================================
= Case Study and Results

== Study Area: Nanjing City

Validation against the July 2024 extreme rainfall event:

#figure[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    align: center,
    table.header(
      [*Metric*], [*Hydrology Only*], [*Coupled Model*], [*Coupled + DA*],
    ),
    [Peak flow error], [32%], [15%], [*8%*],
    [Flood extent (F1)], [0.62], [0.78], [*0.89*],
    [Lead time (hours)], [1.0], [2.0], [*3.5*],
    [NSE], [0.55], [0.76], [*0.88*],
  )
]

== Flood Risk Mapping

#note(title: [Spatial risk summary])[
  Key findings from spatial risk assessment:

  - *High-risk zones*: 12% of urban area, concentrated in low-lying districts
  - *Critical infrastructure*: 3 subway stations and 8 road underpasses identified
  - *Population exposure*: approximately 150,000 residents in high-risk areas
  - *Economic loss estimation*: potential damage reduced by 35% with 3-hour early warning
]

// =========================================================
// Section 4: Conclusion
// =========================================================
= Conclusion

== Summary and Future Work

*Key contributions:*
+ A tightly coupled hydrology-hydraulic model for urban flood simulation
+ Real-time data assimilation framework integrating multi-source observations
+ 3.5-hour flood forecast lead time validated for Nanjing

*Future directions:*
- Integration with numerical weather prediction ensembles
- Machine learning surrogate models for rapid scenario analysis
- Climate change impact assessment under SSP2-4.5 and SSP5-8.5
- Smart city digital twin for operational flood management

// =========================================================
// Focus Slide
// =========================================================
#focus-slide[
  Thank You! \
  Questions & Discussion
]
