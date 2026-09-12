// ===============================================================
// Sano Presentation Template Demo
// Universe package: @preview/sano-presentation-template:1.0.0
// Touying version: 0.6.1
// Minimal and Elegant Academic Theme
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/sano-presentation-template:1.0.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: sano.with(
  config-common(breakable: false),
  config-info(
    title: [Graph Neural Networks for Molecular Property Prediction],
    author: [Dr. Sarah Chen],
    date: datetime.today(),
  ),
)

// Keep ordinary list items at the 0.8em minimum vertical rhythm.
#set list(spacing: .8em)

// === Title Slide ===
#title-slide[]

// ============================================================
= Background
// ============================================================

== The Drug Discovery Challenge

Modern drug discovery faces significant *computational bottlenecks* in
predicting molecular properties from structure:

- Virtual screening of #mi(`> 10^9`) candidate compounds
- Quantum-chemical calculations (#mi(`\text{DFT}`)) are prohibitively expensive
- Traditional QSAR models rely on hand-crafted descriptors
- Need for data-driven, learnable molecular representations

== Molecules as Graphs

A molecule #mi(`\mathcal{G} = (\mathcal{V}, \mathcal{E})`) is naturally represented as a
graph where:

- *Nodes* #mi(`v_i \in \mathcal{V}`): atoms with feature vectors #mi(`\mathbf{x}_i \in \mathbb{R}^d`)
  (element type, charge, hybridisation)
- *Edges* #mi(`e_{ij} \in \mathcal{E}`): chemical bonds with attributes
  (bond order, aromaticity, stereochemistry)

The graph representation is invariant to atom indexing, a crucial
inductive bias for molecular learning.

// ============================================================
= Methodology
// ============================================================

== Message Passing Framework

Our model follows the *Message Passing Neural Network* (MPNN) paradigm.
At each layer #mi(`\ell`), node representations are updated:

#mitex(`\mathbf{h}_i^{(\ell+1)} = \phi \left( \mathbf{h}_i^{(\ell)}, \bigoplus_{j \in \mathcal{N}(i)} \psi(\mathbf{h}_i^{(\ell)}, \mathbf{h}_j^{(\ell)}, \mathbf{e}_{ij}) \right)`)

where #mi(`\psi`) is the message function, #mi(`\bigoplus`) is a
permutation-invariant aggregation, and #mi(`\phi`) is the update function.

== Readout and Prediction

After #mi(`L`) layers of message passing, a graph-level representation is
obtained via global pooling:

#mitex(`\mathbf{h}_{\mathcal{G}} = \text{ReadOut}(\{\mathbf{h}_i^{(L)} \mid v_i \in \mathcal{V}\}) = \frac{1}{|\mathcal{V}|} \sum_{i \in \mathcal{V}} \mathbf{h}_i^{(L)}`)

The property prediction is computed as:

#mitex(`\hat{y} = \text{MLP}(\mathbf{h}_{\mathcal{G}}) \in \mathbb{R}`)

Training minimises the mean squared error:

#mitex(`\mathcal{L} = \frac{1}{N} \sum_{i=1}^N \| \hat{y}_i - y_i \|^2`)

== Architecture Details

Key design choices for our molecular GNN:

+ Edge-conditioned convolutions with bond-type embeddings
+ Multi-head attention pooling (#mi(`K = 4`) heads)
+ Residual connections and layer normalisation
+ Dropout regularisation (#mi(`p = 0.1`)) after each MPNN layer

Training hyperparameters:

- Optimiser: AdamW with weight decay #mi(`10^{-5}`)
- Learning rate: #mi(`3 \times 10^{-4}`) with cosine annealing
- Batch size: 128 graphs
- Training epochs: 300 with early stopping (patience = 20)

// ============================================================
= Experiments
// ============================================================

== Benchmark Results

Evaluation on the MoleculeNet benchmark suite (MAE, lower is better):

#figure[
  #table(
    columns: (2fr, 1fr, 1fr, 1fr),
    align: center,
    inset: 0.5em,
    table.header[*Model*][*ESOL*][*FreeSolv*][*Lipophilicity*],
    [Random Forest], [1.074], [2.082], [0.876],
    [SchNet], [0.821], [1.583], [0.724],
    [DimeNet++], [0.756], [1.312], [0.681],
    [*Ours*], [*0.692*], [*1.148*], [*0.643*],
  )
]

All results averaged over 3 random seeds with scaffold splitting.

== Ablation Study

Contribution of each architectural component:

+ Removing edge features increases MAE by 12%
+ Attention pooling vs. mean pooling: 7% improvement
+ Residual connections prevent performance degradation beyond 6 layers
+ Pre-training on unlabelled conformations improves data efficiency by 18%

== Computational Efficiency

Inference speed comparison on a single NVIDIA A100 GPU:

- *Our model*: 12,400 molecules/second
- *DimeNet++*: 3,200 molecules/second (3.9x slower)
- *SchNet*: 8,100 molecules/second (1.5x slower)
- *DFT (B3LYP)*: ~2 molecules/hour (6,200x slower)

// ============================================================
= Conclusion
// ============================================================

== Summary

*Key contributions of this work:*

- Edge-conditioned message passing with multi-head attention readout
- State-of-the-art results on three MoleculeNet property prediction tasks
- 3.9x faster inference than DimeNet++ with better accuracy
- Pre-training strategy that improves data efficiency by 18%

*Limitations and future work:*

- Extension to 3D geometric information (equivariant architectures)
- Multi-task learning across diverse molecular endpoints
- Application to reaction property prediction
- Integration with active learning for experimental design
