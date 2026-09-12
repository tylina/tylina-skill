// ===============================================================
// Clear TUB Theme Demo
// Universe package: @preview/clear-tub:0.2.0
// Touying version: 0.6.1
// Unofficial TU Berlin corporate design presentation slides
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/clear-tub:0.2.0": *
#import "@preview/mitex:0.2.7": *

#show: tub-theme.with(
  aspect-ratio: "16-9",
  progress-bar: false,
  config-common(breakable: false),
  department: [Department of Electrical Engineering and Computer Science],
  config-info(
    title: [Robust Optimization in Cyber-Physical Systems],
    short-title: [Robust CPS Optimization],
    subtitle: [Faculty VI — Seminar on Systems Engineering],
    author: [Dr. Anna Müller],
    date: datetime.today(),
    institution: [Technische Universität Berlin],
  ),
)

// ---- Title and Outline ----

#title-slide()

#outline-slide()

// ---- Section 1: Introduction ----

= Introduction

== Research Context

Cyber-physical systems (CPS) integrate computational and physical processes:

- *Autonomous vehicles* — sensor fusion and real-time control
- *Smart grids* — distributed energy management
- *Industry 4.0* — adaptive manufacturing systems
- *Medical devices* — closed-loop physiological monitoring

#pause

These systems require optimization under uncertainty and strict safety constraints.

== Problem Statement

#tub-definition[
  A *cyber-physical system* is a tuple #mi(`\mathcal{S} = (\mathcal{C}, \mathcal{P}, \mathcal{I})`)
  where #mi(`\mathcal{C}`) is the computational subsystem, #mi(`\mathcal{P}`) the physical plant,
  and #mi(`\mathcal{I}`) the interface layer.
]

The optimization problem under uncertainty:

#mitex(`\min_{u \in \mathcal{U}} \max_{\delta \in \Delta} J(x, u, \delta)`)

where #mi(`\Delta`) is the uncertainty set and #mi(`J`) is the performance cost.

== Key Challenges

#alert-box[
  Standard optimization methods fail when disturbances are adversarial
  or when the model is only partially known.
]

Our approach addresses three fundamental challenges:

+ Model uncertainty — parametric and structural
+ Real-time constraints — solutions needed within milliseconds
+ Safety guarantees — formal verification of control actions

// ---- Section 2: Methodology ----

= Methodology

== Robust Control Framework

#tub-theorem[
  Under Assumptions (A1)--(A3), the robust optimal control law
  #mi(`u^*(t) = Kx(t)`) stabilizes the system for all #mi(`\delta \in \Delta`)
  with performance bound #mi(`J^* \leq \gamma`).
]

The feedback gain is computed via semidefinite programming:

#mitex(`\min_{K, P} \text{trace}(P) \quad \text{s.t.} \quad A_{\text{cl}}^\top P + P A_{\text{cl}} + Q + K^\top R K \preceq 0`)

== Algorithm Overview

#slide(composer: (1fr, 1fr))[
  === Offline Phase

  + Identify uncertainty bounds from data
  + Formulate robust SDP
  + Compute optimal feedback gains
  + Verify closed-loop stability
][
  === Online Phase

  + Measure current state #mi(`x(t)`)
  + Apply control law #mi(`u(t) = Kx(t)`)
  + Monitor constraint satisfaction
  + Update uncertainty estimates
]

== Computational Considerations

#highlight-box[
  Key insight: The SDP can be decomposed into smaller sub-problems,
  reducing computation from #mi(`O(n^6)`) to #mi(`O(n^3 \log n)`).
]

Implementation details:
- Solver: MOSEK via JuMP.jl interface
- Average solve time: #mi(`2.3`) ms for #mi(`n = 50`) states
- Certified optimality gap: #mi(`< 10^{-8}`)

// ---- Section 3: Results ----

= Experimental Results

== Benchmark Systems

We evaluate on three CPS benchmarks:

#table(
  columns: (1fr, auto, auto, auto),
  align: (left, center, center, center),
  table.header(
    [*System*], [*States*], [*Inputs*], [*Uncertain Params*],
  ),
  [Quadrotor UAV], [12], [4], [6],
  [Power Inverter], [8], [3], [4],
  [Robot Manipulator], [14], [7], [9],
)

== Performance Comparison

Our robust controller vs. nominal MPC:

- *Quadrotor*: #mi(`32\%`) reduction in worst-case tracking error
- *Inverter*: Zero constraint violations (vs. #mi(`4.7\%`) for nominal)
- *Robot*: Maintains stability for #mi(`\pm 15\%`) mass uncertainty

#pause

#tub-example[
  On the quadrotor benchmark, the robust controller achieves a mean
  position error of #mi(`0.08`) m while guaranteeing collision avoidance
  for wind gusts up to #mi(`12`) m/s.
]

== Scalability Analysis

#quote-block(attribution: [Simulation results on TU Berlin HPC cluster])[
  The decomposed SDP scales to systems with up to 200 states while
  maintaining real-time feasibility at 100 Hz control rate.
]

// ---- Section 4: Conclusion ----

= Conclusion

== Summary and Outlook

*Contributions:*
+ A robust optimization framework for safety-critical CPS
+ Efficient SDP decomposition for real-time computation
+ Validated on three benchmark systems with formal guarantees

#pause

*Future directions:*
- Learning-based uncertainty set refinement
- Extension to networked multi-agent CPS
- Integration with TU Berlin's CPS research testbed

== References

- A. Müller et al., "Robust SDP for CPS," _Automatica_, 2024.
- B. Schmidt, "Real-Time Optimization Under Uncertainty," _IEEE TAC_, 2023.
- TU Berlin CPS Lab Technical Report TR-2024-12.

#ending-slide(title: [Thank You!])[
  Contact: anna.mueller\@tu-berlin.de \
  CPS Lab, TEL Building, Room 1205
]
