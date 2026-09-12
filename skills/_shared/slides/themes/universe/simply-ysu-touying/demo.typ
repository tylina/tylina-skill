// ===============================================================
// Simply YSU Theme Demo
// Universe package: @preview/simply-ysu-touying:0.1.0
// Touying version: 0.6.3
// Theme for Yanshan University (燕山大学)
// ===============================================================

#import "@preview/touying:0.6.3": *
#import "@preview/simply-ysu-touying:0.1.0": *
#import "@preview/mitex:0.2.7": *

#show: ysu-theme.with(
  aspect-ratio: "16-9",
  progress-bar: true,
  config-common(breakable: false),
  config-info(
    title: [Fatigue Life Prediction of Heavy Rolling Mill Components],
    short-title: [Fatigue Life Prediction],
    author: [Prof. Wang Jianguo],
    institution: [School of Mechanical Engineering, Yanshan University],
    date: datetime.today(),
  ),
)

// ---------------------------------------------------------------
// Title Slide
// ---------------------------------------------------------------
#title-slide()

// ---------------------------------------------------------------
// Outline
// ---------------------------------------------------------------
#outline-slide()

// ---------------------------------------------------------------
// Section 1: Introduction
// ---------------------------------------------------------------
= Introduction

== Research Background

Yanshan University has a distinguished history in heavy machinery and rolling equipment research. Critical failure modes in rolling mill components include:

- *Fatigue cracking* in backup rolls under cyclic Hertzian contact
- *Thermal fatigue* of work rolls from repeated heating-cooling cycles
- *Bearing failure* in roll chock assemblies under dynamic loads
- *Gear tooth fracture* in mill drive systems

These failures cause unplanned downtime costing #mi(`>`) \$500K per incident in modern steel plants.

== Problem Formulation

The fatigue life #mi(`N_f`) under variable-amplitude loading follows the cumulative damage rule:

#mitex(`D = \sum_{i=1}^k \frac{n_i}{N_{f_i}} = 1`)

where #mi(`n_i`) is the number of cycles at stress level #mi(`\sigma_i`) and #mi(`N_{f_i}`) is the fatigue life from the S-N curve:

#mitex(`\sigma_a = \sigma'_f (2N_f)^b + \epsilon'_f E (2N_f)^c`)

This is the Coffin-Manson relationship combining elastic and plastic strain contributions.

// ---------------------------------------------------------------
// Section 2: Digital Twin Framework
// ---------------------------------------------------------------
= Digital Twin Framework

== System Architecture

#{
  set text(size: 18pt)
  [
    Our digital twin framework integrates three key components:

    + *Physical Layer* — Sensor network on the rolling mill
      - Strain gauges on roll necks (sampling at 10 kHz)
      - Vibration accelerometers on bearing housings
      - Infrared pyrometers for roll surface temperature
      - Torque transducers on drive spindles
    + *Virtual Layer* — Multi-physics simulation model
      - Finite element model of roll-strip contact (Abaqus)
      - Thermal model for roll temperature distribution
      - Bearing dynamics model with clearance effects
    + *Cognitive Layer* — Data-driven decision engine
      - Real-time damage accumulation tracking
      - Remaining useful life (RUL) estimation
      - Maintenance scheduling optimization
  ]
}

== Finite Element Modeling

The contact pressure distribution between work roll and strip follows Hertz theory:

#mitex(`p(x) = p_0 \sqrt{1 - (x/a)^2}, \quad p_0 = \frac{2F}{\pi a L}`)

where #mi(`a`) is the half-contact width:

#mitex(`a = \sqrt{\frac{4FR^*}{\pi L E^*}}`)

with #mi(`R^*`) the equivalent radius and #mi(`E^*`) the equivalent modulus:

#mitex(`\frac{1}{E^*} = \frac{1 - \nu_1^2}{E_1} + \frac{1 - \nu_2^2}{E_2}`)

// ---------------------------------------------------------------
// Section 3: Experimental Validation
// ---------------------------------------------------------------
= Experimental Validation

== Test Rig Configuration

Experiments were conducted on the YSU 4-high cold rolling mill test rig:

#table(
  columns: (1fr, 1fr),
  align: (left, center),
  table.header([*Parameter*], [*Value*]),
  [Work roll diameter], [200 mm],
  [Backup roll diameter], [450 mm],
  [Strip width], [300 mm],
  [Maximum rolling force], [5,000 kN],
  [Rolling speed], [0.5--2.0 m/s],
  [Strip material], [Q235 carbon steel],
)

== Damage Accumulation Results

Comparison of predicted vs. measured damage indices after 50,000 rolling cycles:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  table.header([*Component*], [*Predicted #mi(`D`)*], [*Measured #mi(`D`)*], [*Error*]),
  [Work roll surface], [0.342], [0.361], [5.3%],
  [Roll neck fillet], [0.187], [0.201], [7.0%],
  [Bearing inner race], [0.098], [0.105], [6.7%],
  [Drive spindle], [0.056], [0.052], [7.7%],
)

== Key Findings

The digital twin model achieves high prediction accuracy:

- *Overall damage prediction error*: #mi(`< 8\%`) across all critical components
- *Crack initiation detection*: Successfully predicted in 92% of test cases
- *RUL estimation*: Within #mi(`\pm 15\%`) of actual service life
- *Real-time capability*: Model update cycle #mi(`< 500`) ms

// ---------------------------------------------------------------
// Section 4: Industrial Application
// ---------------------------------------------------------------
= Industrial Application

== Deployment at Shougang Qian'an Steel

The digital twin system was deployed on a 2,150 mm hot strip mill:

- *Monitoring period*: 18 months of continuous operation
- *Components tracked*: 12 work rolls, 4 backup rolls, 48 bearings
- *Maintenance events prevented*: 7 unplanned shutdowns
- *Cost savings*: Estimated #mi(`>`) \$3.2M in avoided downtime

Yanshan University's proximity to the steel industry in Hebei Province enables close industry-academia collaboration for system deployment and validation.

== Predictive Maintenance Strategy

The optimal maintenance interval #mi(`T^*`) minimizes total cost:

#mitex(`T^* = \arg\min_T \left[\frac{C_p}{T} + C_f \cdot h(T)\right]`)

where #mi(`C_p`) is preventive maintenance cost, #mi(`C_f`) is failure cost, and #mi(`h(T)`) is the hazard function:

#mitex(`h(T) = \frac{\beta}{\eta} \left(\frac{T}{\eta}\right)^{\beta - 1}`)

using a Weibull failure model with shape parameter #mi(`\beta`) and scale parameter #mi(`\eta`).

// ---------------------------------------------------------------
// Section 5: Conclusion
// ---------------------------------------------------------------
= Conclusion

== Summary and Outlook

*Key contributions:*

- Multi-physics digital twin framework for rolling mill fatigue monitoring
- Damage prediction accuracy within 8% validated on 4-high mill test rig
- Industrial deployment preventing 7 unplanned shutdowns over 18 months

*Future directions:*

+ Transfer learning for rapid deployment across different mill configurations
+ Integration with fleet-level prognostics for multi-plant management
+ Extension to hot rolling conditions with thermomechanical coupling

*Acknowledgments:*
- National Natural Science Foundation of China (Grant No. 52175110)
- Hebei Provincial Key Laboratory of Heavy Machinery Fluid Power Transmission
- Shougang Group Co., Ltd. for industrial collaboration and data access

== References

+ Paris, P. & Erdogan, F. (1963). "A critical analysis of crack propagation laws." _J. Basic Eng._, 85(4), 528--533.
+ Wang, J. et al. (2024). "Digital twin for rolling mill fatigue monitoring." _Mech. Syst. Signal Process._, 198, 110421.
+ Li, H. & Zhang, K. (2025). "Predictive maintenance in steel manufacturing." _Reliability Eng._, 245, 110035.

// ---------------------------------------------------------------
// Ending Slide
// ---------------------------------------------------------------
#ending-slide[
  Thank you for your attention!
]
