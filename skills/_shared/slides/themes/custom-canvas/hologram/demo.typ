#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Font configuration
#set text(font: _sans-font, size: 18pt)

// Build palette for inline use
#let pal = build-palette()

#show: hologram-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Neural Architecture Search & Autonomous AI Systems],
    subtitle: [Next-Generation Machine Intelligence Infrastructure],
    author: [Dr. Kai Nishimura],
    date: datetime.today(),
    institution: [Nexus AI Research Lab],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Foundation Models
// ============================================================

= Foundation Models

== Large Language Models at Scale

#stack(
  spacing: .8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.primary-text, font: _mono-font)[ARCHITECTURE OVERVIEW],
  cols(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    stack(
    spacing: .8em,
    text(size: typo.body, fill: pal.ink, font: _sans-font)[
      Modern foundation models leverage transformer architectures with
      billions of parameters trained on internet-scale corpora. The key
      innovation is self-supervised pre-training followed by instruction
      tuning and reinforcement learning from human feedback (RLHF).
    ],
    text(size: typo.body, fill: pal.ink, font: _sans-font)[
      Scaling laws reveal predictable performance improvements as compute,
      data, and parameters increase -- enabling strategic resource allocation
      for next-generation model development.
    ],
    ),
    stack(
      spacing: .8em,
      readout-stat([PARAMETERS], [405B], description: [Largest open-weight model released in 2024]),
      readout-stat([CONTEXT WINDOW], [128K], description: [Maximum tokens processable in single inference]),
    ),
  ),
)


// ============================================================
// Slide: Key Statistics (Dark)
// ============================================================

#dark-slide(
  header-left: [DATA BRIEF],
  header-right: [AI INFRASTRUCTURE 2025],
)[
  #stack(
    spacing: .8em,
    text(size: 36pt, weight: "bold")[10x Efficiency Gains in 18 Months.],
    text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.dark-ink-muted, font: _mono-font)[COMPUTE SCALING REPORT],
    cols(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 16pt,
      {
        set std.align(center)
        stack(
          spacing: .8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-ink-muted, font: _mono-font)[TRAINING FLOPS],
          text(size: 42pt, weight: "bold")[10^25],
          text(size: 11pt, fill: pal.dark-ink-dim, font: _sans-font)[
            Total floating point operations for frontier model training runs, doubling every 6 months.
          ],
        )
      },
      {
        set std.align(center)
        stack(
          spacing: .8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-ink-muted, font: _mono-font)[GPU CLUSTERS],
          text(size: 42pt, weight: "bold")[100K+],
          text(size: 11pt, fill: pal.dark-ink-dim, font: _sans-font)[
            H100 GPUs deployed in single training clusters. Custom networking fabric enables linear scaling.
          ],
        )
      },
      {
        set std.align(center)
        stack(
          spacing: .8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-ink-muted, font: _mono-font)[INFERENCE COST],
          text(size: 42pt, weight: "bold")[\$0.002],
          text(size: 11pt, fill: pal.dark-ink-dim, font: _sans-font)[
            Per 1K output tokens for frontier models. 50x reduction from 2023 pricing through optimization.
          ],
        )
      },
    ),
    block(
      width: 100%,
      stroke: (left: 1.5pt + pal.accent),
      inset: (left: 1.2em, y: 0.4em),
    )[
      #text(size: 12pt, style: "italic", fill: pal.dark-ink-dim)[
        "The cost of intelligence is falling faster than any technology in human history."
      ]
    ],
  )
]


// ============================================================
// Slide: Architecture Comparison (Cards)
// ============================================================

== Transformer Variants

#stack(
  spacing: .8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.primary-text, font: _mono-font)[ARCHITECTURE TAXONOMY],
  cols(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 16pt,
    lazy-layout: true,
    holo-card([Dense Transformer], [
    Standard attention over all tokens. Quadratic complexity O(n^2) but
    maximally expressive. Used in GPT-4, Claude, Gemini for reasoning tasks.
    ]),
    holo-card([Mixture of Experts], [
    Routes tokens to specialized sub-networks. Achieves large effective
    capacity with sparse activation. Mixtral and Switch Transformer pioneer this approach.
    ]),
    holo-card([State Space Models], [
    Linear recurrence replacing attention. O(n) complexity enables million-token
    contexts. Mamba and Jamba demonstrate competitive quality.
    ]),
  ),
)


// ============================================================
// Slide: Data Table
// ============================================================

== Model Benchmark Matrix

#stack(
  spacing: .8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.primary-text, font: _mono-font)[PERFORMANCE READOUT],
  figure(
    matrix-grid(
      ("Model", "Params", "MMLU", "HumanEval", "Arena ELO"),
      ([GPT-4o], [~200B], [88.7%], [90.2%], [1287]),
      ([Claude 3.5], [~175B], [88.3%], [92.0%], [1271]),
      ([Llama 3.1], [405B], [87.3%], [89.0%], [1208]),
      ([Gemini Ultra], [~540B], [87.8%], [84.1%], [1243]),
      ([Mistral Large], [~123B], [84.0%], [82.3%], [1157]),
    ),
  ),
  text(size: 11pt, fill: pal.ink-muted, font: _sans-font)[
    Benchmarks as of Q1 2025. Arena ELO from LMSYS Chatbot Arena. HumanEval pass\@1.
  ],
)


// ============================================================
// Section 2: Autonomous Agents
// ============================================================

= Autonomous Agents

== Multi-Agent Systems

#cols(columns: (2fr, 1fr), column-gutter: 24pt)[
  #projection-box[
    #stack(
      spacing: .8em,
      [Autonomous AI agents combine foundation models with tool use, memory,
      and planning capabilities. Multi-agent architectures enable complex
      workflows where specialized agents collaborate -- a coder, a reviewer,
      a planner, and an executor working in concert.],
      [Key challenges include reliable tool calling, long-horizon planning,
      error recovery, and maintaining coherent state across extended interactions.
      The agent paradigm transforms LLMs from question-answerers into task-completers.],
    )
  ]
][
  #stack(
    spacing: .8em,
    beacon-tag([Tool Use]),
    beacon-tag([Memory]),
    beacon-tag([Planning]),
    beacon-tag([Reflection]),
    terminal-badge([LOOP ACTIVE]),
    datastream-note([
      Agent loop: \
      Observe > Think > Act > Reflect
    ]),
  )
]


// ============================================================
// Slide: Quote (Focus)
// ============================================================

#focus-slide[
  #stack(
    spacing: .8em,
    ["The next breakthrough is not a better model -- it is a system that knows when to use one."],
    text(size: 0.5em, style: "normal", weight: "medium", fill: pal.dark-ink-muted)[
      -- Demis Hassabis, Google DeepMind
    ],
  )
]


// ============================================================
// Slide: Agent Architecture
// ============================================================

== Agent Architecture Patterns

#stack(
  spacing: .8em,
  cols(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    interface-highlight([
      ReAct (Reasoning + Acting) agents interleave chain-of-thought reasoning
      with environment actions. Each step generates a thought, selects an action,
      and observes the result -- creating an auditable decision trace.
    ], cite: "Yao et al., 2023"),
    holo-card([Cognitive Architecture], [
      Modern agents implement working memory (context window), long-term memory
      (vector stores), and procedural memory (learned tool patterns). This mirrors
      human cognitive systems enabling flexible problem-solving.
    ]),
  ),
  scanline-divider(total-width: 100%),
  text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
    The convergence of reliable tool use, retrieval-augmented generation, and code execution
    environments creates agents capable of end-to-end software engineering, research synthesis,
    and autonomous experimentation.
  ],
)


// ============================================================
// Section 3: Infrastructure
// ============================================================

= Infrastructure

== The AI Compute Stack

#stack(
  spacing: .8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.primary-text, font: _mono-font)[SYSTEM ARCHITECTURE],
  cols(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 12pt,
    readout-stat([ACCELERATORS], [H200], description: [Next-gen GPU with 141GB HBM3e memory bandwidth]),
    readout-stat([INTERCONNECT], [900G], description: [NVLink bandwidth per GPU enabling model parallelism]),
    readout-stat([EFFICIENCY], [4.2x], description: [Performance per watt improvement over H100 generation]),
    readout-stat([LATENCY], [\<50ms], description: [Time to first token for 100B+ parameter models]),
  ),
  scanline-divider(total-width: 100%),
  text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
    Custom silicon (TPUs, Trainium, Inferentia) and novel architectures (photonic, neuromorphic)
    promise further efficiency gains as transformer workloads become the dominant compute demand.
  ],
)


// ============================================================
// Dark slide: Comparison
// ============================================================

#dark-slide(
  header-left: [COMPARATIVE ANALYSIS],
  header-right: [DEPLOYMENT STRATEGIES],
)[
  #stack(
    spacing: .8em,
    text(size: 28pt, weight: "bold")[Cloud vs. On-Premise: The Inference Dilemma],
    block(width: 50pt, height: 2pt, fill: pal.accent),
    cols(
      columns: (1fr, 1fr),
      column-gutter: 28pt,
      block(width: 100%, stroke: (left: 1.5pt + pal.accent), inset: (left: 1em, y: 0.4em))[
        #stack(
          spacing: .8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-ink-muted, font: _mono-font)[CLOUD API],
          text(size: 14pt, weight: "bold", fill: pal.dark-ink)[Elastic + Managed],
          text(size: 12pt, fill: pal.dark-ink-dim, font: _sans-font)[
            Zero infrastructure overhead. Pay-per-token economics. Access to frontier models
            without capital expenditure. Ideal for variable workloads and rapid prototyping.
          ],
        )
      ],
      block(width: 100%, stroke: (left: 1.5pt + pal.dark-ink-muted), inset: (left: 1em, y: 0.4em))[
        #stack(
          spacing: .8em,
          text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: pal.dark-ink-muted, font: _mono-font)[ON-PREMISE],
          text(size: 14pt, weight: "bold", fill: pal.dark-ink)[Sovereign + Optimized],
          text(size: 12pt, fill: pal.dark-ink-dim, font: _sans-font)[
            Full data control and compliance. Custom fine-tuning pipelines. Lower marginal cost
            at scale. Required for regulated industries and classified workloads.
          ],
        )
      ],
    ),
    text(size: 11pt, fill: pal.dark-ink-dim, font: _sans-font)[
      Hybrid architectures route queries by sensitivity, latency requirements, and model capability --
      using local models for routine tasks and frontier APIs for complex reasoning.
    ],
  )
]


// ============================================================
// Slide: Safety & Alignment
// ============================================================

== AI Safety & Alignment

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 12pt,
  holo-card([Constitutional AI], [
    Self-supervision through principles rather than human labels. The model
    critiques and revises its own outputs according to a constitution of values,
    reducing reliance on expensive RLHF annotation.
  ]),
  holo-card([Interpretability], [
    Mechanistic interpretability maps neural network computations to human-understandable
    algorithms. Sparse autoencoders and circuit analysis reveal how models represent
    knowledge and make decisions.
  ]),
  holo-card([Red Teaming], [
    Adversarial evaluation at scale identifies failure modes before deployment.
    Automated red-teaming uses AI to generate diverse attack vectors testing
    robustness, truthfulness, and safety boundaries.
  ]),
  holo-card([Governance], [
    Responsible scaling policies define capability thresholds triggering additional
    safety measures. Structured access, model cards, and external audits create
    accountability frameworks for frontier AI systems.
  ]),
)


// ============================================================
// Slide: Focus -- Key Insight
// ============================================================

#focus-slide[
  #stack(
    spacing: .8em,
    ["Intelligence is not dangerous. Unaligned intelligence deployed without oversight is dangerous."],
    text(size: 0.5em, style: "normal", weight: "medium", fill: pal.dark-ink-muted)[
      -- Dario Amodei, Anthropic
    ],
  )
]


// ============================================================
// Slide: Emerging Capabilities
// ============================================================

== Emerging Capabilities

#stack(
  spacing: .8em,
  interface-highlight([
    Multimodal reasoning, extended thinking, and tool orchestration represent
    qualitative capability jumps -- not merely incremental improvements. Models
    now demonstrate genuine compositional generalization across modalities.
  ], cite: "Anthropic Research, 2025"),
  cols(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    stack(
      spacing: .8em,
      text(size: 14pt, weight: "bold", fill: pal.ink)[Demonstrated Abilities],
      text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
        #sym.diamond.filled #h(0.3em) Multi-step mathematical proof construction \
        #sym.diamond.filled #h(0.3em) Full-stack software development from specs \
        #sym.diamond.filled #h(0.3em) Scientific literature synthesis and hypothesis generation \
        #sym.diamond.filled #h(0.3em) Real-time multimodal understanding (vision + audio + text)
      ],
    ),
    stack(
      spacing: .8em,
      text(size: 14pt, weight: "bold", fill: pal.ink)[Active Research Frontiers],
      text(size: 13pt, fill: pal.ink-dim, font: _sans-font)[
        #sym.diamond.filled #h(0.3em) World models and physical reasoning \
        #sym.diamond.filled #h(0.3em) Continual learning without catastrophic forgetting \
        #sym.diamond.filled #h(0.3em) Causal reasoning and counterfactual simulation \
        #sym.diamond.filled #h(0.3em) Formal verification of AI system behavior
      ],
    ),
  ),
)


// ============================================================
// Dark section transition
// ============================================================

#dark-slide(
  header-left: [SECTION 04],
  header-right: [HOLOGRAM 2025],
)[
  #v(1fr)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.dark-ink-muted, font: _mono-font)[PROJECTION]
  #v(0.6em)

  #text(size: 34pt, weight: "bold")[
    From Language Models#linebreak()to World Models.
  ]
  #v(0.4em)
  #block(width: 60pt, height: 2pt, fill: pal.accent)

  #v(2fr)
]


// ============================================================
// Slide: Future directions
// ============================================================

== The Road to AGI

#stack(
  spacing: .8em,
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.primary-text, font: _mono-font)[CAPABILITY MILESTONES],
  cols(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    lazy-layout: true,
    holo-card([Near-Term (2025-2026)], [
      Reliable agentic workflows. Models that can autonomously complete multi-hour
      research tasks. Code generation with full test coverage. Personalized AI tutors
      matching expert human instruction quality.
    ]),
    holo-card([Medium-Term (2027-2030)], [
      Autonomous scientific discovery. AI systems that propose hypotheses, design
      experiments, interpret results, and iterate. Formal mathematical reasoning
      at research-level. Real-time embodied intelligence.
    ]),
  ),
  cols(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    stack(dir: ltr, spacing: 8pt,
      beacon-tag([Agents]),
      beacon-tag([Reasoning]),
      beacon-tag([Multimodal]),
    ),
    stack(dir: ltr, spacing: 8pt,
      beacon-tag([Discovery]),
      beacon-tag([Embodied]),
      beacon-tag([Formal]),
    ),
  ),
)


// ============================================================
// Ending
// ============================================================

#ending-slide[Signal Received]
