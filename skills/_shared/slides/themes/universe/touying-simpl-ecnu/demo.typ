// ===============================================================
// Touying ECNU Simpl Theme Demo
// Universe package: @preview/touying-simpl-ecnu:0.0.1
// Touying version: 0.6.1 (required by the universe package)
// Theme for East China Normal University (华东师范大学)
// Based on the Stargazer theme with ECNU branding
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-ecnu:0.0.1": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: ecnu-theme.with(
  aspect-ratio: "16-9",
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Noto Sans SC",
  ),
  config-info(
    title: [自然语言处理中的预训练模型研究],
    subtitle: [从词向量到大语言模型的演进],
    author: [王晨曦],
    date: datetime.today(),
    institution: [East China Normal University],
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
// Section 1: Background
// =========================================================
= Research Background

== Evolution of Language Representations

The development of language representations has progressed through several paradigms:

- *One-hot encoding* — sparse, high-dimensional, no semantic information
- *Word2Vec / GloVe* — dense embeddings capturing semantic similarity
- *ELMo* — context-dependent representations via BiLSTM
- *Transformer-based models* — self-attention for parallel computation
- *Large Language Models* — emergent abilities at scale

== Attention Mechanism

The core of modern NLP is the scaled dot-product attention:

#mitex(`\text{Attention}(\mathbf{Q}, \mathbf{K}, \mathbf{V}) = \text{softmax}\left(\frac{\mathbf{Q} \mathbf{K}^T}{\sqrt{d_k}}\right) \mathbf{V}`)

Multi-head attention allows the model to attend to different representation subspaces:

#mitex(`\text{MultiHead}(\mathbf{Q}, \mathbf{K}, \mathbf{V}) = \text{Concat}(\text{head}_1, \ldots, \text{head}_h) \mathbf{W}^O`)

where #mi(`\text{head}_i = \text{Attention}(\mathbf{Q} \mathbf{W}_i^Q, \mathbf{K} \mathbf{W}_i^K, \mathbf{V} \mathbf{W}_i^V)`).

// =========================================================
// Section 2: Methodology
// =========================================================
= Pre-training Framework

== Model Architecture

#tblock(title: [Encoder-Decoder Design])[
  We propose a unified pre-training framework that combines masked language modeling (MLM) with sequence-to-sequence generation, enabling both understanding and generation tasks within a single model.
]

The training objective combines two losses:

#mitex(`\mathcal{L} = \lambda \mathcal{L}_{\text{MLM}} + (1 - \lambda) \mathcal{L}_{\text{Seq2Seq}}`)

== Pre-training Tasks

#slide(composer: (1fr, 1fr))[
  === Understanding Tasks

  - *Masked Language Modeling*
    - Random 15% token masking
    - 80/10/10 mask/random/keep
  - *Next Sentence Prediction*
    - Binary classification
    - Sentence coherence modeling
  - *Sentence Order Prediction*
    - Contrastive learning objective
][
  === Generation Tasks

  - *Prefix Language Modeling*
    - Bidirectional prefix context
    - Autoregressive generation
  - *Span Corruption*
    - Sentinel token replacement
    - Variable-length span masking
  - *Document Summarization*
    - Extract-then-abstract pipeline
]

== Scaling Laws

Model performance follows predictable scaling laws:

#mitex(`\mathcal{L}(N) = \left(\frac{N_c}{N}\right)^{\alpha_N}`)

where #mi(`N`) is the number of parameters and #mi(`\alpha_N \approx 0.076`) for language models.

Key findings:
- Compute-optimal training: #mi(`D \propto N`) (Chinchilla scaling)
- Emergent abilities appear at #mi(`N > 10^{10}`) parameters
- In-context learning improves log-linearly with model size

// =========================================================
// Section 3: Experiments
// =========================================================
= Experimental Results

== Benchmark Performance

Evaluation on standard NLP benchmarks:

#table(
  columns: (1.5fr, 1fr, 1fr, 1fr),
  align: center,
  table.header(
    [*Benchmark*], [*BERT-base*], [*RoBERTa*], [*Ours*],
  ),
  [GLUE (avg)], [79.6], [86.4], [*88.2*],
  [SQuAD 2.0 (F1)], [76.3], [89.4], [*91.1*],
  [MNLI (acc)], [84.6], [87.6], [*89.3*],
  [SST-2 (acc)], [93.5], [96.4], [*97.1*],
)

== Ablation Study

Impact of pre-training objectives on downstream performance:

- Removing MLM: -3.2% average GLUE score
- Removing Seq2Seq: -1.8% on generation tasks
- Removing sentence-level tasks: -0.9% on NLI benchmarks
- Reducing model size by 50%: -2.1% across all tasks

The combined objective consistently outperforms single-task pre-training.

// =========================================================
// Section 4: Conclusion
// =========================================================
= Conclusion

== Summary and Outlook

*Key contributions:*
+ A unified pre-training framework combining understanding and generation
+ Empirical validation of scaling laws for the proposed architecture
+ State-of-the-art results on 8 NLP benchmarks

*Future directions:*
- Multimodal pre-training (vision + language)
- Efficient fine-tuning with parameter-efficient methods (LoRA, Adapter)
- Alignment with human preferences via RLHF
- Multilingual and cross-lingual transfer

// =========================================================
// Focus Slide
// =========================================================
#focus-slide[
  Unified pre-training bridges\
  language understanding and generation.
]

// =========================================================
// Ending Slide
// =========================================================
#ending-slide(
  config: config-page(header: none, footer: none),
  title: [Thank You],
)[
  Questions & Discussion \
  East China Normal University
]
