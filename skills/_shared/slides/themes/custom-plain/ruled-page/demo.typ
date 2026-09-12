// Ruled-Page Theme Demo — Attention Is All You Need (Paper Reading)
// Academic lab meeting presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: ruled-page-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Attention Is All You Need],
    subtitle: [Paper Reading -- Lab Meeting],
    author: [Zhang Wei],
    date: datetime(year: 2026, month: 3, day: 15),
    institution: [NLP Research Group],
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#title-slide()

= Background

== Sequence-to-sequence models relied on recurrence until 2017

Prior dominant approaches:

- *RNN/LSTM encoders-decoders* process tokens sequentially -- $O(n)$ sequential steps @bahdanau2015
- Long-range dependencies decay over distance despite gating mechanisms
- Parallelization limited by sequential nature of recurrence

#divider()

The Transformer eliminates recurrence entirely, relying solely on attention @vaswani2017.

== Attention was originally an add-on to recurrent models

#cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true)[
  #ruled-card([Bahdanau Attention (2015)])[
    - Additive attention over encoder hidden states
    - Allows decoder to "look back" at relevant positions
    - Still requires sequential RNN computation
  ]
][
  #ruled-card([Transformer Attention (2017)])[
    - Self-attention replaces recurrence entirely
    - All positions computed in parallel
    - $O(1)$ sequential operations for any distance
  ]
]

= Architecture

== The Transformer uses stacked self-attention and feed-forward layers

#cols(columns: (3fr, 2fr), gutter: 1.5em)[
  + *Input embedding* + positional encoding
  + *Multi-head self-attention* sublayer
  + *Feed-forward network* sublayer (per position)
  + *Layer normalization* + residual connections
][
  #margin-note[
    Both encoder (6 layers) and decoder (6 layers) follow this pattern. The decoder adds cross-attention to encoder outputs.
  ]
]

== Scaled dot-product attention is the core computation

The attention function maps queries, keys, and values to an output:

#mitex(`
\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V
`)

#divider()

- *Q, K, V* are linear projections of the input
- Scaling by #mi(`\sqrt{d_k}`) prevents softmax saturation for large #mi(`d_k`)
- Dot-product attention is faster than additive attention in practice

== Multi-head attention attends to different representation subspaces

#mitex(`
\text{MultiHead}(Q,K,V) = \text{Concat}(\text{head}_1, \ldots, \text{head}_h) W^O
`)

where each head is:

#mitex(`
\text{head}_i = \text{Attention}(QW_i^Q,\; KW_i^K,\; VW_i^V)
`)

#divider()

#cols(columns: (1fr, 1fr), gutter: 1.5em)[
  - $h = 8$ parallel attention heads
  - $d_k = d_v = d_"model" \/ h = 64$
][
  - Allows the model to jointly attend to information from different positions at different subspaces
]

= Results

== The Transformer achieves state-of-the-art translation with less training

#cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true)[
  #ruled-card([WMT 2014 English-German])[
    - *28.4 BLEU* -- best single model
    - +2.0 BLEU over previous best ensemble
    - Training: 3.5 days on 8 GPUs
  ]
][
  #ruled-card([WMT 2014 English-French])[
    - *41.0 BLEU* -- new single-model SOTA
    - Training cost: 1/4 of previous SOTA
    - Big model: only 3.5 days of training
  ]
]

== Self-attention enables downstream breakthroughs

Key subsequent work building on the Transformer:

- *BERT* @devlin2019 -- bidirectional pre-training with masked language modeling
- *GPT series* -- autoregressive language modeling at scale
- *Vision Transformer (ViT)* -- self-attention for image patches

#divider()

The architecture is now standard across NLP, vision, speech, and multi-modal AI.

#focus-slide[
  _Self-attention computes all positions simultaneously -- replacing sequential recurrence with parallel computation._
]

= Discussion

== Three key insights explain the Transformer's success

+ *Parallelism*: Self-attention removes the sequential bottleneck, enabling massive GPU utilization
+ *Expressiveness*: Multi-head attention captures diverse relational patterns between all position pairs
+ *Scalability*: The architecture scales gracefully with data and compute -- foundation for billion-parameter models

== References

#bibliography(title: none, bytes(`
@inproceedings{vaswani2017,
  title={Attention is All You Need},
  author={Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, Lukasz and Polosukhin, Illia},
  booktitle={Advances in Neural Information Processing Systems},
  year={2017}
}
@article{bahdanau2015,
  title={Neural Machine Translation by Jointly Learning to Align and Translate},
  author={Bahdanau, Dzmitry and Cho, Kyunghyun and Bengio, Yoshua},
  journal={ICLR},
  year={2015}
}
@inproceedings{devlin2019,
  title={BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding},
  author={Devlin, Jacob and Chang, Ming-Wei and Lee, Kenton and Toutanova, Kristina},
  booktitle={NAACL},
  year={2019}
}
`.text))

#ending-slide[Thank You]
