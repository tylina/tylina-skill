// ===============================================================
// Touying SJTU Simpl Theme Demo
// Universe package: @preview/touying-simpl-sjtu:0.1.0
// Touying version: 0.6.1
// Theme for Shanghai Jiao Tong University (上海交通大学)
// Based on the Dewdrop theme with SJTU branding
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-sjtu:0.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: sjtu-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides",
  font: ("Libertinus Serif", "Noto Serif SC", "Songti SC"),
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [大规模图神经网络的高效训练方法],
    subtitle: [基于采样与分布式计算的加速策略],
    author: [李思远],
    date: datetime.today(),
    institution: [上海交通大学],
  ),
)

// =========================================================
// Title Slides (two variants)
// =========================================================
#title-slide()
#title-slide-red()

// =========================================================
// Outline
// =========================================================
#outline-slide(depth: 1)

// =========================================================
// Section 1: Introduction
// =========================================================
= Introduction

== Research Motivation

Graph Neural Networks (GNNs) have achieved state-of-the-art results in:

- *Social network analysis* — community detection, influence prediction
- *Molecular property prediction* — drug discovery, material science
- *Recommendation systems* — collaborative filtering at scale
- *Knowledge graphs* — link prediction, entity alignment

However, scaling GNNs to graphs with billions of nodes remains a fundamental challenge.

== Problem Definition

Given a graph #mi(`G = (V, E)`) with node features #mi(`\mathbf{X} \in \mathbb{R}^{|V| \times d}`):

#mitex(`\mathbf{H}^{(l+1)} = \sigma\left( \tilde{\mathbf{D}}^{-1/2} \tilde{\mathbf{A}} \tilde{\mathbf{D}}^{-1/2} \mathbf{H}^{(l)} \mathbf{W}^{(l)} \right)`)

where:
- #mi(`\tilde{\mathbf{A}} = \mathbf{A} + \mathbf{I}_N`) is the adjacency matrix with self-loops
- #mi(`\tilde{\mathbf{D}}`) is the degree matrix of #mi(`\tilde{\mathbf{A}}`)
- #mi(`\mathbf{W}^{(l)}`) is the learnable weight matrix at layer #mi(`l`)

*Challenge*: Full-batch training requires #mi(`O(|V| \cdot L \cdot d)`) memory for #mi(`L`) layers.

// =========================================================
// Section 2: Methodology
// =========================================================
= Proposed Method

== Sampling-Based Training

#block(
  fill: luma(240),
  inset: 1em,
  radius: 4pt,
  width: 100%,
)[
  *Mini-Batch Sampling* \
  We propose a layer-wise importance sampling strategy that reduces the neighbor expansion factor from exponential to constant while maintaining unbiased gradient estimation.
]

The sampling probability for node #mi(`v`) at layer #mi(`l`):

#mitex(`p^{(l)}(v) = \frac{\|\mathbf{a}_v^{(l)}\|_2}{\sum_{u \in \mathcal{N}(v)} \|\mathbf{a}_u^{(l)}\|_2}`)

== System Architecture

#slide(composer: (1fr, 1fr))[
  === Graph Partitioner
  - METIS-based balanced partitioning
  - Minimizes cross-partition edges
  - Supports dynamic re-partitioning

  === Gradient Aggregator
  - Asynchronous AllReduce
  - Gradient compression (Top-K)
  - Staleness-bounded updates
][
  === Computation Pipeline
  + Partition assignment
  + Local forward pass
  + Boundary feature exchange
  + Backward pass with gradient sync
  + Weight update

  === Communication Optimizer
  - Overlap computation and communication
  - Priority-based message scheduling
]

== Convergence Guarantee

#block(
  fill: luma(240),
  inset: 1em,
  radius: 4pt,
  width: 100%,
)[
  *Theorem (Convergence Rate)* \
  Under Assumptions 1--3 (smoothness, bounded variance, bounded staleness), the proposed algorithm converges at rate #mi(`O(1 / \sqrt{T})`) where #mi(`T`) is the number of iterations.
]

The variance-reduced gradient estimator satisfies:

#mitex(`\mathbb{E}[\|\nabla \tilde{\mathcal{L}}_t - \nabla \mathcal{L}(\boldsymbol{\theta}_t)\|^2] \leq \frac{\sigma^2}{B} + \frac{\rho^2 \tau^2}{T}`)

where #mi(`B`) is batch size, #mi(`\tau`) is maximum staleness, and #mi(`\rho`) is the Lipschitz constant.

// =========================================================
// Section 3: Experiments
// =========================================================
= Experimental Results

== Benchmark Comparison

Performance on large-scale graph datasets:

#table(
  columns: (1.5fr, 1fr, 1fr, 1fr, 1fr),
  align: center,
  table.header(
    [*Dataset*], [*Nodes*], [*GCN*], [*GraphSAGE*], [*Ours*],
  ),
  [ogbn-products], [2.4M], [75.6%], [78.7%], [*80.2%*],
  [ogbn-papers100M], [111M], [OOM], [65.3%], [*68.1%*],
  [MAG240M], [240M], [OOM], [OOM], [*71.4%*],
)

== Scalability Analysis

Training time scales near-linearly with graph size:

- *2 GPUs*: 1.9x speedup (95% efficiency)
- *4 GPUs*: 3.6x speedup (90% efficiency)
- *8 GPUs*: 6.8x speedup (85% efficiency)

Memory footprint reduction compared to full-batch:
#mitex(`\text{Memory ratio} = \frac{O(B \cdot k^L)}{O(|V| \cdot L \cdot d)}`)

where #mi(`k`) is the sampling fan-out and #mi(`B`) is the mini-batch size.

// =========================================================
// Section 4: Conclusion
// =========================================================
= Conclusion

== Summary

*Key contributions of this work:*

+ Layer-wise importance sampling with variance reduction
+ Distributed training framework with staleness-bounded synchronization
+ Near-linear scalability demonstrated on graphs with 240M+ nodes

*Future research directions:*
- Heterogeneous graph support
- Dynamic graph streaming updates
- Integration with graph foundation models

// =========================================================
// Focus Slide
// =========================================================
== Closing <touying:unoutlined>

#focus-slide[
  Thank You! \
  Questions & Discussion
]

// =========================================================
// End Slides (two variants)
// =========================================================
#end-slide[
  Thank You for Listening!
]

#end-slide-red[
  Thank You for Listening!
]
