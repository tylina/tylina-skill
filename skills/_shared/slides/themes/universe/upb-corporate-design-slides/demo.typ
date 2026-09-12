// ===============================================================
// UPB Corporate Design Slides Demo
// Universe package: @preview/upb-corporate-design-slides:0.1.3
// Touying version: 0.6.1
// Presentation template for Universität Paderborn
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/upb-corporate-design-slides:0.1.3": *
#import "@preview/mitex:0.2.7": *

#show: upb-theme.with(
  lang: "en",
  footer: [Faculty of Computer Science, Electrical Engineering and Mathematics],
  config-common(breakable: false),
  config-info(
    title: [Graph Neural Networks for Combinatorial Optimization],
    author: [Prof. Dr. Sabine Hartmann],
    date: datetime.today(),
  ),
)

// The upstream package fixes Karla internally; use an installed local substitute.
#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

// ---- Title Slide ----

#title-slide()[
  Collaborative Research Centre SFB 901 — On-The-Fly Computing
]

// ---- Section 1: Introduction ----

= Motivation

== Combinatorial Optimization Challenges

Many real-world problems reduce to combinatorial optimization:

- *Routing* — vehicle routing, network design, logistics
- *Scheduling* — job shop, resource allocation, timetabling
- *Partitioning* — graph cuts, clustering, circuit layout
- *Selection* — facility location, set cover, portfolio optimization

Classical solvers (ILP, CP) guarantee optimality but scale poorly.
Can machine learning offer faster approximate solutions?

== Research Questions

Our work at Universität Paderborn addresses three key questions:

+ Can graph neural networks (GNNs) learn structural properties of
  optimization instances?
+ How do learned heuristics compare with state-of-the-art solvers
  on real-world benchmarks?
+ Can we provide _approximation guarantees_ for GNN-based methods?

// ---- Section 2: Background ----

= Background

== Graph Representation

We represent optimization instances as graphs #mi(`G = (V, E)`):

- *Nodes* #mi(`v \in V`): decision variables or constraints
- *Edges* #mi(`(u,v) \in E`): relationships or dependencies
- *Features* #mi(`\mathbf{x}_v \in \mathbb{R}^d`): coefficients, costs, capacities

The GNN learns node embeddings:

#mitex(`\mathbf{h}_v^{(\ell+1)} = \sigma(\mathbf{W}^{(\ell)} \cdot \text{AGG}(\{\mathbf{h}_u^{(\ell)} : u \in \mathcal{N}(v)\}))`)

where #mi(`\mathcal{N}(v)`) is the neighborhood of #mi(`v`) and #mi(`\text{AGG}`) is a permutation-invariant aggregation function.

== Problem Formulation

Given an optimization instance encoded as graph #mi(`G`), find:

#mitex(`\mathbf{x}^* = \arg\min_{\mathbf{x} \in \mathcal{X}} c^\top \mathbf{x} \quad \text{s.t.} \quad A\mathbf{x} \leq b`)

The GNN produces a probability distribution over feasible solutions:

#mitex(`p(x_i = 1 | G) = \sigma(\mathbf{w}^\top \mathbf{h}_i^{(L)})`)

Solutions are constructed via autoregressive sampling or beam search.

// ---- Section 3: Method ----

= Proposed Method

== Architecture Overview

Our GNN-based solver consists of three stages:

+ *Encoder*: #mi(`L`)-layer message-passing GNN produces node embeddings
+ *Decoder*: Attention-based autoregressive construction of solutions
+ *Search*: Beam search with learned value function for refinement

== Training Procedure

We use a hybrid training strategy:

- *Supervised pre-training* on optimal solutions from small instances
- *Reinforcement learning* fine-tuning via REINFORCE with baseline:

#mitex(`\nabla_\theta J(\theta) = \mathbb{E}_{\tau \sim p_\theta} [(R(\tau) - b) \nabla_\theta \log p_\theta(\tau)]`)

- *Curriculum learning*: gradually increase instance difficulty

== Theoretical Guarantees

We establish approximation bounds under certain graph properties:

#mitex(`\text{OPT} \leq c^\top \mathbf{x}_{\text{GNN}} \leq (1 + \epsilon) \cdot \text{OPT}`)

for #mi(`\epsilon = O(1/\sqrt{L})`) where #mi(`L`) is the number of GNN layers.

#focus-slide[
  GNNs can achieve #mi(`(1+\epsilon)`)-approximation with polynomial computation.
]

// ---- Section 4: Experiments ----

= Experimental Evaluation

== Benchmark Problems

We evaluate on standard CO benchmarks:

#table(
  columns: (1fr, auto, auto, auto),
  align: (left, center, center, center),
  table.header(
    [*Problem*], [*Instances*], [*Max Size*], [*Optimal Known*],
  ),
  [TSP], [10,000], [#mi(`n = 500`)], [Yes],
  [CVRP], [5,000], [#mi(`n = 200`)], [Partial],
  [MIS], [8,000], [#mi(`n = 1000`)], [Yes],
  [Set Cover], [3,000], [#mi(`m = 500`)], [Yes],
)

== Key Results

Performance comparison (optimality gap vs. exact solver):

- *TSP-100*: Gap #mi(`= 0.34\%`), speedup #mi(`= 850 \times`)
- *CVRP-200*: Gap #mi(`= 1.12\%`), speedup #mi(`= 320 \times`)
- *MIS-500*: Gap #mi(`= 0.87\%`), speedup #mi(`= 1200 \times`)
- *Set Cover*: Gap #mi(`= 2.03\%`), speedup #mi(`= 450 \times`)

Our method achieves near-optimal solutions with orders-of-magnitude speedup.

== Generalization Study

Models trained on small instances generalize to larger ones:

- Trained on TSP-50, tested on TSP-500: gap increases only to #mi(`1.2\%`)
- Trained on MIS-200, tested on MIS-1000: gap increases to #mi(`1.8\%`)

This demonstrates the structural learning capability of GNNs.

// ---- Section 5: Conclusion ----

= Conclusion

== Summary and Outlook

*Contributions:*
+ GNN architecture for learning combinatorial optimization heuristics
+ Theoretical approximation bounds for GNN-based solvers
+ State-of-the-art results on four standard CO benchmarks

*Future directions:*
- Extension to dynamic and online optimization settings
- Integration with UPB's SFB 901 On-The-Fly Computing framework
- Hardware acceleration on the Noctua 2 HPC system at PC²

== References

- S. Hartmann et al., "GNNs for Combinatorial Optimization," _NeurIPS_, 2024.
- M. Becker, "Approximation Bounds for Graph Networks," _ICML_, 2023.
- UPB IRB Technical Report TR-2024-09.

#focus-slide[
  Thank you! \
  Questions?
]
