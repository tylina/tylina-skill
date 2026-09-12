// ===============================================================
// NUDT Simpl Theme Demo
// Universe package: @preview/touying-simpl-nudt:0.1.0
// Touying version: 0.6.1 (required by the Universe package)
// Theme for National University of Defense Technology (国防科技大学)
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-nudt:0.1.0": *
#import "@preview/mitex:0.2.7": *

#show: nudt-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides",
  font: ("Libertinus Serif", "Songti SC"),
  config-common(breakable: false),
  config-info(
    title: [Parallel Algorithms for Large-Scale Computational Fluid Dynamics],
    subtitle: [College of Computer Science and Technology],
    author: [Dr. Chen Haifeng],
    date: datetime.today(),
    institution: [National University of Defense Technology, Changsha],
  ),
)

// ---------------------------------------------------------------
// Title Slide
// ---------------------------------------------------------------
#title-slide(
  title: [Parallel Algorithms for Large-Scale\
    Computational Fluid Dynamics],
)

// To use the alternative photographic title treatment instead, replace the
// preceding call with `#title-slide-green(...)`.

// ---------------------------------------------------------------
// Outline
// ---------------------------------------------------------------
#outline-slide()

// ---------------------------------------------------------------
// Section 1: Introduction
// ---------------------------------------------------------------
= Introduction

== Research Context

High-fidelity computational fluid dynamics (CFD) simulations are essential for:

- *Aerospace engineering* — Hypersonic vehicle design and thermal protection
- *Weather forecasting* — High-resolution atmospheric modeling
- *Marine engineering* — Submarine and ship hull optimization
- *National defense* — Missile aerodynamics and blast simulation

NUDT's Tianhe supercomputer series provides the computational backbone for these applications, consistently ranking among the world's fastest systems.

== Challenge: Scaling to Exascale <slide:scaling>

As mesh sizes grow beyond #mi(`10^9`) elements, key bottlenecks emerge:

- Communication overhead in MPI-based domain decomposition
- Load imbalance due to adaptive mesh refinement (AMR)
- Memory bandwidth limitations on heterogeneous architectures
- I/O bottlenecks for checkpoint and visualization data

Our goal: achieve #mi(`> 80\%`) parallel efficiency at #mi(`10^4+`) GPU scale on Tianhe-3.

// ---------------------------------------------------------------
// Section 2: Mathematical Foundation
// ---------------------------------------------------------------
= Mathematical Foundation <sec:mathematics>

== Governing Equations

The compressible Navier-Stokes equations in conservative form:

#mitex(`\frac{\partial \mathbf{U}}{\partial t} + \nabla \cdot \mathbf{F}(\mathbf{U}) = \nabla \cdot \mathbf{F}_v(\mathbf{U}, \nabla \mathbf{U})`)

where the state vector #mi(`\mathbf{U} = (\rho, \rho \mathbf{v}, \rho E)^\top`) and the inviscid flux:

#mitex(`\mathbf{F} = \begin{pmatrix} \rho \mathbf{v} \\ \rho \mathbf{v} \otimes \mathbf{v} + p\mathbf{I} \\ (\rho E + p)\mathbf{v} \end{pmatrix}`)

The system is closed by the equation of state: #mi(`p = (\gamma - 1)(\rho E - \frac{1}{2} \rho \|\mathbf{v}\|^2)`)

== Spatial Discretization

We employ a high-order discontinuous Galerkin (DG) method:

#mitex(`\int_{\Omega_e} \frac{\partial \mathbf{U}_h}{\partial t} \phi_i \, d\Omega + \int_{\partial \Omega_e} \hat{\mathbf{F}} \cdot \mathbf{n} \phi_i \, dS - \int_{\Omega_e} \mathbf{F} \cdot \nabla \phi_i \, d\Omega = 0`)

Key properties of the DG formulation:

+ *Local conservation* — Mass, momentum, and energy conserved element-wise
+ *High-order accuracy* — Polynomial degree #mi(`p`) yields #mi(`(p+1)`)-th order convergence
+ *Compact stencil* — Communication limited to face-adjacent elements
+ *GPU-friendly* — Element-local operations map naturally to GPU threads

// ---------------------------------------------------------------
// Section 3: Parallel Implementation
// ---------------------------------------------------------------
= Parallel Implementation <sec:parallel>

== Hybrid MPI + GPU Architecture <slide:hybrid>

Our solver employs a three-level parallelism hierarchy:

- *Level 1 — Inter-node*: MPI for distributed memory across compute nodes
  - Graph-based partitioning via METIS for load balance
  - Asynchronous halo exchange overlapping computation
- *Level 2 — Intra-node*: One GPU per MPI rank
  - CUDA kernels for DG operator evaluation
  - Shared memory for intra-element data reuse
- *Level 3 — Thread-level*: Warp-level parallelism within GPU kernels
  - Coalesced memory access patterns for element data
  - Register tiling for polynomial evaluation

== Performance Model

The parallel execution time follows Amdahl's extended model:

#mitex(`T(N) = \frac{T_{\text{comp}}}{N} + T_{\text{comm}} \cdot \log_2 N + T_{\text{sync}}`)

where:
- #mi(`T_{\text{comp}} / N`) is the parallelizable computation
- #mi(`T_{\text{comm}} \cdot \log_2 N`) accounts for collective communication
- #mi(`T_{\text{sync}}`) represents synchronization overhead

The parallel efficiency is:

#mitex(`\eta(N) = \frac{T(1)}{N \cdot T(N)} = \frac{1}{1 + N \cdot \frac{T_{\text{comm}} \log_2 N + T_{\text{sync}}}{T_{\text{comp}}}}`)

// ---------------------------------------------------------------
// Section 4: Results
// ---------------------------------------------------------------
= Results

== Scaling Benchmarks

Weak scaling results on Tianhe-3 prototype (AMD MI250X GPUs):

#figure[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header([*GPU Count*], [*Elements*], [*Time/Step*], [*Efficiency*]),
    [64], [#mi(`6.4 \times 10^7`)], [0.82 s], [100%],
    [512], [#mi(`5.1 \times 10^8`)], [0.87 s], [94.3%],
    [4,096], [#mi(`4.1 \times 10^9`)], [0.95 s], [86.3%],
    [16,384], [#mi(`1.6 \times 10^{10}`)], [1.08 s], [75.9%],
  )
]

== Application: Hypersonic Vehicle <slide:hypersonic>

Simulation of a hypersonic glide vehicle at Mach 8, altitude 30 km:

- *Mesh*: 2.4 billion hexahedral elements
- *Polynomial degree*: #mi(`p = 4`) (fifth-order accuracy)
- *Reynolds number*: #mi(`\text{Re} = 1.2 \times 10^7`)
- *Computation*: 8,192 GPUs, 72 hours wall-clock time
- *Key result*: Heat flux predictions within 5% of wind tunnel data

// ---------------------------------------------------------------
// Focus Slide
// ---------------------------------------------------------------
== Key Takeaway <touying:unoutlined>

#focus-slide[
  Exascale computing opens new frontiers in\
  high-fidelity simulation for national defense.
]

// ---------------------------------------------------------------
// Section 5: Conclusion
// ---------------------------------------------------------------
= Conclusion

== Summary and Future Directions <slide:summary>

#grid(columns: (1fr, 1fr), column-gutter: 1.4em)[
  *Key contributions:*

  - DG CFD solver: 86% efficiency on 4,096 GPUs
  - Asynchronous MPI strategy: 35% lower overhead
  - Validated against hypersonic experiments
][
  *Future directions:*

  + Scale Tianhe-3 deployments beyond 100,000 GPUs
  + Integrate real-time ML surrogate models
  + Couple CFD with structural mechanics

  *Acknowledgments:*

  - China National Key R&D Program (2021YFB0300100)
  - NUDT Supercomputing Center
  - AVIC Aerodynamics Research Institute
]

== References

+ Hesthaven, J. & Warburton, T. (2008). _Nodal Discontinuous Galerkin Methods_. Springer.
+ Chen, H. et al. (2024). "GPU-accelerated DG methods for hypersonic flows." _J. Comput. Phys._, 512, 113145.
+ Yang, X. et al. (2025). "Exascale CFD on Tianhe-3." _Parallel Computing_, 118, 103056.

// ---------------------------------------------------------------
// Ending Slide
// ---------------------------------------------------------------
== Closing <touying:unoutlined>

#end-slide[
  Thank you\
  for your attention!
]

// To use the green ending treatment instead, replace the preceding call with
// `#end-slide-green[...]`.
