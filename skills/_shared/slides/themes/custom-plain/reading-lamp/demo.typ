// Reading Lamp Theme Demo — Parameter-Efficient Fine-Tuning
// A reading group / seminar talk surveying LoRA, Adapter, and Prompt Tuning
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: reading-lamp-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Parameter-Efficient Fine-Tuning: LoRA, Adapter, and Prompt Tuning],
    subtitle: [A Survey for the Reading Group],
    author: [Maya Chen],
    date: datetime(year: 2026, month: 5, day: 26),
    institution: [NLP Reading Group, Spring 2026],
  ),
)
#set text(font: ("Charter", "Iowan Old Style", "Georgia"), size: 20pt)

// ==============================
// Title Slide
// ==============================
#title-slide()

// ==============================
// Section 1: Motivation
// ==============================
= Motivation

== Full fine-tuning is expensive and fragile

- GPT-3 has 175B parameters -- storing one copy per task is impractical
- Full fine-tuning risks catastrophic forgetting
- Gradient memory scales linearly with parameter count

#paper-divider()

#annotation[
  Key question: Can we adapt a frozen pretrained model with a _small_ number of trainable parameters and still match full fine-tuning quality?
]

== Three families of parameter-efficient methods

+ *Low-Rank Adaptation (LoRA)* -- Hu et al., ICLR 2022. Inject trainable low-rank matrices into attention layers.
+ *Adapter Modules* -- Houlsby et al., ICML 2019. Insert small bottleneck layers between transformer blocks.
+ *Prompt Tuning* -- Lester et al., EMNLP 2021. Prepend learnable soft tokens to the input.

// ==============================
// Section 2: LoRA Family
// ==============================
= LoRA Family

== LoRA decomposes weight updates into low-rank factors

The core idea: freeze #mi(`W_0`) and learn a low-rank update:

#mitex(`W = W_0 + BA`)

where #mi(`B \in \mathbb{R}^{d \times r}`) and #mi(`A \in \mathbb{R}^{r \times k}`) with rank #mi(`r \ll \min(d, k)`).

#paper-divider()

#annotation[
  Typical rank: #mi(`r = 4`) or #mi(`r = 8`). For GPT-3 175B, LoRA trains only 0.01% of parameters.
]

== LoRA achieves full fine-tuning quality at fraction of cost

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  lamp-card([Advantages], [
    - No additional inference latency (merge #mi(`BA`) into #mi(`W_0`))
    - Task-switching by swapping small #mi(`B, A`) matrices
    - Works with any linear layer
    - Memory: only store #mi(`r(d + k)`) params per layer
  ]),
  lamp-card([Limitations], [
    - Rank selection is a hyperparameter
    - Not all layers benefit equally
    - Cannot change model architecture
    - Performance degrades for very dissimilar tasks
  ]),
)

== Variants extend the LoRA principle

#cols[
  *LoRA* (Hu 2022) -- Fixed rank, applied to #mi(`W_q, W_v`)

  *QLoRA* (Dettmers 2023) -- 4-bit quantized base + LoRA adapters

  *LoRA-FA* (Zhang 2023) -- Freeze #mi(`A`), train only #mi(`B`)

  *AdaLoRA* (Zhang 2023) -- Adaptive rank allocation via SVD
][
  #margin-quote(author: [Hu et al., 2022])[
    We show that a low-rank adaptation of GPT-3 175B performs on par with full fine-tuning on RTE, MRPC, and STS-B while training 10,000x fewer parameters.
  ]
]

// ==============================
// Section 3: Adapter Methods
// ==============================
= Adapter Methods

== Adapters insert bottleneck modules after each sublayer

The adapter architecture:

#mitex(`h \leftarrow h + f(h W_{\text{down}}) W_{\text{up}}`)

where #mi(`W_{\text{down}} \in \mathbb{R}^{d \times m}`) projects down and #mi(`W_{\text{up}} \in \mathbb{R}^{m \times d}`) projects back up, with bottleneck #mi(`m \ll d`).

#paper-divider()

- Placed after attention and FFN sublayers
- Nonlinearity #mi(`f`) is typically ReLU or GELU
- Skip connection preserves original representation

== Serial vs. parallel adapter placement matters

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  lamp-card([Serial Adapters (Houlsby 2019)], [
    - Two adapters per layer (post-attention + post-FFN)
    - Sequential bottleneck with residual
    - Adds latency proportional to adapter depth
    - Strong performance with #mi(`m = 64`)
  ]),
  lamp-card([Parallel Adapters (He 2022)], [
    - Adapter runs in parallel with sublayer
    - Output summed: #mi(`\mathrm{out} = \mathrm{sublayer}(x) + \mathrm{adapter}(x)`)
    - Lower latency than serial
    - Often matches serial quality
  ]),
)

// ==============================
// Section 4: Prompt-based
// ==============================
= Prompt-Based Methods

== Prompt tuning prepends learnable tokens to the input

#cols[
  Prepend #mi(`p`) learnable embeddings to the input instead of modifying model weights:

  #mitex(`[\underbrace{e_1, \ldots, e_p}_{\text{learnable}}, x_1, \ldots, x_n]`)

  Only the #mi(`p`) embeddings are trained; the entire model stays frozen.

  #paper-divider()

  - Scales cleanly to billion-scale models
  - Task identity encoded in the prompt
][
  #lamp-card([Key Results (Lester 2021)], [
    - With T5-XXL (11B), prompt tuning _matches_ full fine-tuning on SuperGLUE
    - #mi(`p = 20`) soft tokens (~20K parameters)
    - Performance gap closes as model size grows
  ])
]

== Prefix tuning vs. prompt tuning: a subtle distinction

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  lamp-card([Prompt Tuning (Lester 2021)], [
    - Learnable tokens at input layer only
    - Simplest form: optimize #mi(`p`) embeddings
    - ~20K trainable parameters
    - Best with very large models (10B+)
  ]),
  lamp-card([Prefix Tuning (Li & Liang 2021)], [
    - Learnable prefixes at _every_ layer's key/value
    - Reparameterized via MLP during training
    - ~250K trainable parameters
    - Works well at smaller model scales
  ]),
)

// ==============================
// Section 5: Comparison
// ==============================
= Comparison

== Parameter efficiency varies by orders of magnitude

+ *LoRA (#mi(`r = 8`))*: \~0.01% of params. No inference overhead. Best general-purpose choice.
+ *Adapter (#mi(`m = 64`))*: \~2--4% of params. Small latency cost. Strong on structured tasks.
+ *Prompt Tuning (#mi(`p = 20`))*: \~0.001% of params. Zero weight modification. Needs large base model.

#paper-divider()

#annotation[
  All three methods converge to full fine-tuning performance as model scale increases (Hu 2022, Lester 2021).
]

== When to use which method

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  lamp-card([Choose LoRA when...], [
    - You need zero inference overhead
    - Multiple tasks share one base model
    - You want a drop-in replacement for fine-tuning
    - Model size is moderate (1B--70B)
  ]),
  lamp-card([Choose Prompt Tuning when...], [
    - Base model is very large (10B+)
    - Storage per task must be minimal
    - You want maximal simplicity
    - Inference latency from extra tokens is acceptable
  ]),
)

// ==============================
// Focus Slide
// ==============================

#focus-slide[
  _"Adapt the representation, not the parameters."_
]

// ==============================
// Ending Slide
// ==============================

#ending-slide[Thank You]
