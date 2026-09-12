// Laurel Crown Theme Demo — Graph Neural Networks for Molecular Property Prediction
// Thesis Defense Presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *
#import "@preview/lovelace:0.3.1": *
#import "@preview/lilaq:0.6.0" as lq

// ═══ Inline Bibliography ═══

#let bib-data = bytes("
@article{kipf2017semi,
  title={Semi-Supervised Classification with Graph Convolutional Networks},
  author={Kipf, Thomas N. and Welling, Max},
  journal={International Conference on Learning Representations},
  year={2017}
}
@article{velickovic2018graph,
  title={Graph Attention Networks},
  author={Velickovic, Petar and Cucurull, Guillem and Casanova, Arantxa and Romero, Adriana and Lio, Pietro and Bengio, Yoshua},
  journal={International Conference on Learning Representations},
  year={2018}
}
@article{schutt2018schnet,
  title={SchNet: A continuous-filter convolutional neural network for modeling quantum interactions},
  author={Schutt, Kristof T. and Kindermans, Pieter-Jan and Sauceda, Huziel E. and Chmiela, Stefan and Tkatchenko, Alexandre and Muller, Klaus-Robert},
  journal={Nature Communications},
  year={2018}
}
")

#show: laurel-crown-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [MolGNN-Pro · Thesis Defense],
  config-info(
    title: [Graph Neural Networks for Molecular Property Prediction],
    subtitle: [Doctoral Thesis Defense],
    author: [Dr. Candidate Marcus A. Thornton],
    institution: [Department of Computer Science, Kingsley University],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

// Font ownership stays with the deck, not the reusable theme.
#set text(font: ("Libertinus Serif", "Songti SC"))
#show raw: set text(font: "IBM Plex Mono")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Introduction
// ══════════════════════════════════════
= Introduction

== Research Motivation

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chapter-block([The Challenge], [
    Predicting molecular properties (toxicity, solubility, binding affinity) is fundamental to drug discovery, yet experimental measurement is:
    - *Expensive*: \$2.6B average cost per approved drug
    - *Slow*: 10--15 years development timeline
    - *Limited*: cannot exhaustively screen chemical space (#mi(`10^{60}`) drug-like molecules)
  ]),
  laurel-card([Our Approach], [
    We propose *MolGNN-Pro*, a hierarchical graph neural network that:
    - Models atoms as nodes, bonds as edges
    - Captures 3D spatial interactions via geometric message passing
    - Achieves state-of-the-art on QM9 and MoleculeNet benchmarks
  ]),
)

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  milestone-stat([Molecules Screened], [2.1M]),
  milestone-stat([Properties Predicted], [12], color: palette.green),
  milestone-stat([MAE Reduction], [23%], color: palette.primary),
  milestone-stat([Training Time], [4.2h]),
)

== Problem Formulation

#cols[
  #chapter-block([Formal Definition], [
    Given a molecular graph #mi(`G = (V, E, X, E_f)`) where:
    - #mi(`V`): atom nodes with features #mi(`X \in \mathbb{R}^{n \times d}`)
    - #mi(`E`): chemical bonds as edges
    - #mi(`E_f`): edge features (bond type, distance)

    *Goal*: Learn #mi(`f: G \to y`) mapping graphs to property values #mi(`y \in \mathbb{R}`).
  ])
][
  #finding-quote(
    [The molecular graph representation naturally encodes chemical structure, enabling neural networks to learn from topology rather than fixed fingerprints.],
    author: [Gilmer et al., ICML 2017]
  )

  #v(0.5em)

  #grid(columns: (1fr, 1fr), gutter: 0.35em,
    honors-tag([Drug Discovery], color: palette.gold),
    honors-tag([Materials Science], color: palette.green),
    honors-tag([Quantum Chemistry], color: palette.primary),
  )
]

// ══════════════════════════════════════
// Section 2: Literature Review
// ══════════════════════════════════════
= Literature Review

== Graph Neural Network Foundations

#stack(spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    laurel-card([GCN -- Kipf \& Welling (2017)], [
      Spectral-based graph convolution using first-order Chebyshev approximation.

      Layer-wise propagation rule:

      #mitex(`H^{(l+1)} = \sigma(\tilde{D}^{-1/2}\tilde{A}\tilde{D}^{-1/2}H^{(l)}W^{(l)})`)

      where #mi(`\tilde{A} = A + I_N`) is the adjacency with self-loops.
    ]),
    laurel-card([GAT -- Velickovic et al. (2018)], [
      Attention mechanism to weight neighbor contributions:

      #mitex(`\alpha_{ij} = \operatorname{softmax}_j\!\left(a^\mathsf{T}[Wh_i \mathbin{\|} Wh_j]\right)`)

      Multi-head attention with #mi(`K`) heads:

      #mitex(`h_i' = \mathop{\|}_{k=1}^{K}\sigma\!\left(\sum_{j\in\mathcal{N}_i}\alpha_{ij}^{k}W^{k}h_j\right)`)
    ]),
  ),
  vine-divider(width: 70%),
  finding-quote(
    [The choice of aggregation scheme fundamentally determines what structural information a GNN can capture. Expressiveness is bounded by the Weisfeiler-Leman graph isomorphism test.],
    author: [Xu et al., ICLR 2019]
  ),
)

== Molecular GNN Methods

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  laurel-card([SchNet], [
    Continuous-filter CNN for quantum interactions. Models interatomic distances with radial basis functions.

    *Key*: rotation-equivariant representations.
  ]),
  laurel-card([DimeNet], [
    Directional message passing using angles between atom triplets.

    *Key*: angular information for 3D geometry.
  ]),
  laurel-card([SphereNet], [
    Spherical coordinates with torsion angles for complete geometric description.

    *Key*: full 3D spatial awareness.
  ]),
)

#v(0.3em)

#contribution-item(
  [Research Gap],
  [Existing methods either sacrifice geometric completeness for speed or achieve accuracy at prohibitive computational cost. Our work bridges this gap with hierarchical message passing.]
)

// ══════════════════════════════════════
// Section 3: Methodology
// ══════════════════════════════════════
= Methodology

== Message Passing Framework

#cols(columns: (1fr, 1fr), gutter: 1.5em)[
  #chapter-block([MolGNN-Pro Architecture], [
    *1. Message Construction:*
    #mitex(`m_{ij}^{(t)} = \phi_m\!\left(h_i^{(t)}, h_j^{(t)}, e_{ij}, d_{ij}\right)`)

    *2. Aggregation:*
    #mitex(`m_i^{(t)} = \sum_{j\in\mathcal{N}(i)} \alpha_{ij}\,m_{ij}^{(t)}`)

    *3. Node Update:*
    #mitex(`h_i^{(t+1)} = \phi_u\!\left(h_i^{(t)}, m_i^{(t)}\right)`)

    where #mi(`\phi_m`) and #mi(`\phi_u`) are learned MLPs, #mi(`\alpha_{ij}`) are geometric attention weights, and #mi(`d_{ij}`) encodes 3D distance.
  ])
][
  #set text(size: 0.96em)
  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    pseudocode-list(booktabs: true, numbered-title: smallcaps[MPNN Forward Pass])[
      + *Input*: Graph #mi(`G = (V, E)`), features #mi(`X`)
      + *Initialize*: #mi(`h_i^{(0)} = \operatorname{Embed}(x_i)`)
      + *for* #mi(`t = 1`) to #mi(`T`) *do*
        + *for each* edge #mi(`(i, j) \in E`)
          + #mi(`m_{ij} = \operatorname{MLP}_m(h_i, h_j, e_{ij})`)
        + *end*
        + *for each* node #mi(`i \in V`)
          + #mi(`m_i = \sum_{j\in\mathcal{N}(i)} \operatorname{Attn}(i,j)\,m_{ij}`)
          + #mi(`h_i = \operatorname{MLP}_u(h_i, m_i)`)
        + *end*
      + *end*
      + *return* #mi(`\operatorname{Readout}(\{h_i^{(T)}\})`)
    ]
  )
]

== Geometric Attention Mechanism

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chapter-block([Distance-Aware Attention], [
    We encode 3D geometry through radial basis function expansion:

    #mitex(`e_{\mathrm{RBF}}(d) = \frac{\sin(n\pi d / d_{\mathrm{cut}})}{d}`)

    The attention coefficient incorporates spatial information:

    #mitex(`\alpha_{ij} = \operatorname{softmax}_j\!\left(\frac{Q_i \cdot K_j}{\sqrt{d_k}} + \operatorname{bias}_{\mathrm{geo}}(d_{ij})\right)`)

    This allows the model to learn distance-dependent interaction strengths without sacrificing the flexibility of attention.
  ]),
  laurel-card([Readout Function], [
    Global molecular representation via hierarchical pooling:

    #mitex(`h_G = \operatorname{MLP}\!\left(\operatorname{Set2Set}(\{h_i^{(T)} \mid i \in V\})\right)`)

    *Set2Set* provides a permutation-invariant aggregation that captures higher-order node interactions beyond simple sum/mean.

    Final prediction:
    #mitex(`\hat{y} = \operatorname{MLP}_{\mathrm{out}}(h_G)`)
  ]),
)

#v(0.8em)

#stack(dir: ltr, spacing: 0.5em,
  honors-tag([Geometric], color: palette.green),
  honors-tag([Attention-Based], color: palette.gold),
  honors-tag([Hierarchical], color: palette.primary),
)

// ══════════════════════════════════════
// Section 4: Experiments
// ══════════════════════════════════════
= Experiments

== Benchmark Results — QM9

#cols(columns: (3fr, 2fr), gutter: 1.5em)[
  #set text(size: 0.75em)
  #figure[
    #lq.diagram(
      width: 310pt, height: 200pt,
      xaxis: (ticks: ((1, "SchNet"), (2, "DimeNet"), (3, "SphereNet"), (4, "Ours")), subticks: none),
      yaxis: (ticks: ((0, "0"), (20, "20"), (40, "40"), (60, "60"), (80, "80")), subticks: none, label: [MAE (meV)]),
      lq.bar(
        (1, 2, 3, 4),
        (63.0, 45.2, 38.7, 29.8),
        fill: (palette.ink-muted, palette.green, palette.primary, palette.gold),
        label: none,
      ),
    )
  ]
][
  #chapter-block([Key Findings], [
    On QM9 molecular property prediction:
    - *23% lower MAE* vs. SphereNet on HOMO-LUMO gap
    - *18% improvement* on dipole moment prediction
    - *2.3x faster* inference than DimeNet++
    - Consistent gains across all 12 properties
  ])

  #v(0.5em)

  #milestone-stat([Best MAE (eV)], [0.0298], color: palette.gold)
]

== Ablation Study

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  laurel-card([Component Ablation], [
    Removing each component from MolGNN-Pro:

    - Full model: *29.8 meV*
    - w/o geometric attention: 35.1 meV (+18%)
    - w/o RBF encoding: 37.4 meV (+25%)
    - w/o hierarchical pooling: 33.2 meV (+11%)
    - w/o multi-head: 31.9 meV (+7%)

    Geometric attention provides the largest contribution.
  ]),
  laurel-card([Scalability Analysis], [
    Training efficiency on varying dataset sizes:

    - 10K molecules: 12 min (GPU)
    - 100K molecules: 48 min
    - 1M molecules: 4.2 hours
    - 2.1M molecules: 8.7 hours

    Linear scaling with dataset size; sub-linear with graph size due to sparse attention.
  ]),
)

#v(0.3em)

#finding-quote(
  [The geometric attention mechanism is crucial: it allows the model to distinguish between spatial conformations that share identical 2D topology but differ in 3D arrangement -- a common scenario in drug-receptor binding.],
)

== MoleculeNet Benchmarks

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  milestone-stat([BBBP (AUC)], [0.941], color: palette.primary),
  milestone-stat([Tox21 (AUC)], [0.862], color: palette.green),
  milestone-stat([ESOL (RMSE)], [0.478]),
  milestone-stat([FreeSolv (RMSE)], [0.912], color: palette.primary),
)

#v(0.4em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chapter-block([Classification Tasks], [
    BBBP (blood-brain barrier penetration) and Tox21 (toxicity):
    - Outperforms AttentiveFP by 2.3% AUC
    - Competitive with 3D-pretrained models
    - Robust to scaffold splits (OOD generalization)
  ]),
  chapter-block([Regression Tasks], [
    ESOL (solubility) and FreeSolv (solvation free energy):
    - State-of-the-art RMSE on ESOL
    - 15% improvement on FreeSolv vs. MPNN baseline
    - Uncertainty estimates via MC dropout well-calibrated
  ]),
)

// ══════════════════════════════════════
// Section 5: Contributions
// ══════════════════════════════════════
= Contributions

== Summary of Contributions

#contribution-item(
  [Geometric Attention Mechanism],
  [A novel distance-aware attention scheme that incorporates 3D spatial information through radial basis function encodings, enabling the model to distinguish between spatial conformers with identical 2D topology.]
)

#contribution-item(
  [Hierarchical Message Passing],
  [A multi-scale architecture that processes local bond interactions and global molecular context through separate message passing channels, unified via a learnable gating mechanism.]
)

#contribution-item(
  [Comprehensive Benchmark Study],
  [Systematic evaluation across 12 QM9 properties and 8 MoleculeNet datasets, demonstrating consistent improvements over prior methods with detailed ablation analysis.]
)

#contribution-item(
  [Open-Source Implementation],
  [Released MolGNN-Pro as an open-source PyTorch Geometric library with pre-trained models, enabling reproducibility and adoption by the computational chemistry community.]
)

== Future Directions

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  laurel-card([Short-Term Goals], [
    - Extend to protein-ligand binding affinity prediction
    - Incorporate quantum mechanical priors (orbital symmetries)
    - Scale to million-atom systems via graph coarsening
    - Active learning for targeted molecular exploration
  ]),
  laurel-card([Long-Term Vision], [
    - Foundation model for molecular science
    - Generative molecular design with property constraints
    - Integration with robotic chemistry labs
    - Multi-fidelity learning across theory levels
  ]),
)

#v(0.4em)

#vine-divider(width: 65%)

#v(0.3em)

#stack(dir: ltr, spacing: 0.5em,
  honors-tag([Published at NeurIPS 2025], color: palette.gold),
  honors-tag([Best Paper Nomination], color: palette.primary),
  honors-tag([2100+ Citations], color: palette.green),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"By encoding the fundamental symmetries of physical law into neural architecture, we transform molecular property prediction from pattern matching into principled scientific inference."_

  #text(size: 0.6em, weight: "regular", fill: palette.bg.transparentize(28%))[-- Thesis Statement]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]

== Bibliography

// ═══ Bibliography ═══
#set bibliography(style: "ieee")
#bibliography(bib-data, title: none, full: true)
