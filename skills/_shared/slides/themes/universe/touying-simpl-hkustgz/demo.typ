// ===============================================================
// HKUST(GZ) Simpl Theme Demo
// Universe package: @preview/touying-simpl-hkustgz:0.1.2
// Touying version: 0.6.1 (required by the universe package)
// Theme for HKUST Guangzhou (香港科技大学(广州))
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-hkustgz:0.1.2": *
#import "@preview/mitex:0.2.7": *

#show: hkustgz-theme.with(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif",),
  config-info(
    title: [Variational Quantum Algorithms for Combinatorial Optimization],
    subtitle: [Thrust of Microelectronics — Information Hub],
    author: [Dr. Zhao Yusheng],
    date: datetime.today(),
    institution: [Hong Kong University of Science and Technology (Guangzhou)],
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

== Quantum Computing Landscape

The noisy intermediate-scale quantum (NISQ) era presents unique opportunities:

- *50--1000 qubit* processors now available from multiple vendors
- Error rates decreasing but still far from fault-tolerant thresholds
- Hybrid classical-quantum algorithms show practical promise
- Combinatorial optimization is a leading application domain

HKUST(GZ) advances quantum-information research in the Greater Bay Area.

== Problem Formulation

Many NP-hard optimization problems can be mapped to finding the ground state of an Ising Hamiltonian:

#mitex(`H_C = \sum_{\langle i,j \rangle} J_{ij} \sigma_i^z \sigma_j^z + \sum_i h_i \sigma_i^z`)

The goal is to find the bitstring #mi(`\mathbf{z}^*`) that minimizes:

#mitex(`\mathbf{z}^* = \arg\min_{\mathbf{z} \in \{0,1\}^n} \mathbf{z}^\top Q \mathbf{z}`)

where #mi(`Q`) is the QUBO (Quadratic Unconstrained Binary Optimization) matrix.

// ---------------------------------------------------------------
// Section 2: Methodology
// ---------------------------------------------------------------
= Methodology

== QAOA Framework

The Quantum Approximate Optimization Algorithm (QAOA) operates in #mi(`p`) layers:

+ Initialize qubits in uniform superposition: #mi(`|+\rangle^{\otimes n}`)
+ Apply problem unitary: #mi(`U(C, \gamma) = e^{-i\gamma H_C}`)
+ Apply mixer unitary: #mi(`U(B, \beta) = e^{-i\beta H_B}`)
+ Measure and optimize parameters #mi(`(\boldsymbol{\gamma}, \boldsymbol{\beta})`) classically

The variational ansatz at depth #mi(`p`) is:

#mitex(`|\boldsymbol{\gamma}, \boldsymbol{\beta}\rangle = \prod_{l=1}^p U(B, \beta_l) U(C, \gamma_l) |+\rangle^{\otimes n}`)

== Benchmark Problems

We evaluate QAOA on three benchmark problem classes:

#figure[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header([*Problem*], [*Size*], [*Qubits*], [*Depth #mi(`p`)*]),
    [MaxCut], [#mi(`n = 12`)], [12], [3--8],
    [Graph Coloring], [#mi(`n = 8`)], [24], [4--10],
    [Portfolio Opt.], [#mi(`n = 10`)], [10], [2--6],
    [TSP], [#mi(`n = 5`)], [25], [5--12],
  )
]

// ---------------------------------------------------------------
// Section 3: Results
// ---------------------------------------------------------------
= Results

== Approximation Ratios

Our improved parameter initialization strategy yields significant gains:

- *MaxCut*: Approximation ratio #mi(`r = 0.942`) at #mi(`p = 5`) (vs. #mi(`0.871`) baseline)
- *Portfolio Optimization*: Achieved optimal solution in 87% of runs
- *Graph Coloring*: Valid colorings found for all test instances with #mi(`p \geq 6`)
- *TSP*: Tour quality within 8% of optimal on 5-city instances

== Convergence Analysis

The expected cost function value converges as:

#mitex(`\langle H_C \rangle_{p} = E_{\text{opt}} - O(1/p)`)

Key observations:

+ Parameter transferability across problem instances of similar structure
+ Linear interpolation initialization reduces optimization iterations by #mi(`\approx 60\%`)
+ Symmetry-based parameter reduction from #mi(`2p`) to #mi(`p + 1`) free parameters

// ---------------------------------------------------------------
// Section 4: Applications
// ---------------------------------------------------------------
= Applications

== Greater Bay Area Use Cases

Practical applications relevant to the GBA technology ecosystem:

- *Supply Chain Optimization* — Route planning for cross-border logistics
  - Shenzhen--Hong Kong--Guangzhou corridor scheduling
  - Multi-modal transportation network design
- *Financial Portfolio Selection* — Asset allocation under constraints
  - Risk-return optimization with cardinality constraints
  - Real-time rebalancing for GBA fintech platforms
- *Chip Design / EDA* — Placement and routing optimization
  - Gate-level layout for HKUST(GZ) microelectronics research
  - Timing-driven optimization with quantum annealing

== Comparison with Classical Methods

#figure[
  #table(
    columns: (1fr, 1fr, 1fr),
    align: center,
    table.header([*Method*], [*Quality*], [*Runtime*]),
    [QAOA (#mi(`p=5`))], [94.2%], [12.3s],
    [Simulated Annealing], [96.1%], [45.7s],
    [Gurobi (exact)], [100%], [> 3600s],
    [Random Search], [72.4%], [0.8s],
  )
]

// ---------------------------------------------------------------
// Focus Slide
// ---------------------------------------------------------------
#focus-slide[
  Quantum advantage is not about replacing classical methods —\
  it is about expanding the frontier of tractable problems.
]

// ---------------------------------------------------------------
// Section 5: Conclusion
// ---------------------------------------------------------------
= Conclusion

== Summary and Future Work

*Key contributions:*

- Improved QAOA parameter initialization reducing convergence time by 60%
- Demonstrated competitive approximation ratios on standard benchmarks
- Identified practical GBA applications for near-term quantum devices

*Future directions:*

+ Extend to quantum error mitigation techniques (ZNE, PEC)
+ Scale benchmarks to 50+ qubit problems on real hardware
+ Collaborate with GBA industry partners for domain-specific applications

*Acknowledgments:* Research Grants Council of Hong Kong; HKUST(GZ) Information Hub.

== References

+ Farhi, E. et al. (2014). "A quantum approximate optimization algorithm." _arXiv:1411.4028_.
+ Zhou, L. et al. (2020). "Quantum approximate optimization algorithm: Performance, mechanism, and implementation." _Phys. Rev. X_, 10, 021067.
+ Zhao, Y. et al. (2025). "Parameter transfer in QAOA." _Quantum Sci. Technol._, 10(2), 025012.

// ---------------------------------------------------------------
// Ending Slide
// ---------------------------------------------------------------
#ending-slide(
  config: config-page(header: none, footer: none),
  title: [Thank You],
)[
  Questions & Discussion \
  HKUST(GZ) · Information Hub
]
