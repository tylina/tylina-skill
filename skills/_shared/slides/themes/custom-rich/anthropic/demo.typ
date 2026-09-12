#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#show: anthropic-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Claude: Next-Generation AI Assistant],
    subtitle: [Safe, Helpful & Honest — Pushing the Frontier of Responsible AI],
    author: [Anthropic Research Team],
    date: datetime.today(),
    institution: [Anthropic],
  ),
)

// ═══ Cover ═══

#title-slide()

= Architecture

== System Architecture Overview

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #metric-card(
    [Model Parameters],
    [175B+],
    trend: [Next-gen],
    accent: palette.orange,
  )
][
  #metric-card(
    [Context Window],
    [200K],
    trend: [#sym.arrow.t 4x],
    accent: palette.blue,
  )
][
  #metric-card(
    [Languages],
    [100+],
    trend: [Global],
    accent: palette.green,
  )
][
  #metric-card(
    [API Latency],
    [#sym.lt 250ms],
    trend: [P99],
    accent: palette.red,
  )
]

#v(0.6em)

#insight-box([Architecture Philosophy])[\
  Claude is built on a transformer-based architecture with Constitutional AI (CAI) training. The system combines large-scale pretraining with RLHF and principle-based self-improvement to achieve both high capability and strong alignment with human values.
]

== Core Technical Stack

#v(-1em)
#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #feature-card(1, [Foundation Model], [\
    Custom transformer with mixture-of-experts routing, optimized attention, and KV-cache management.
  ])
][
  #feature-card(3, [Retrieval & Grounding], [\
    Real-time knowledge retrieval with citation generation and source attribution.
  ])
]
#v(-.5em)
#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #feature-card(2, [Constitutional AI], [\
    Principle-based critique and revision — models evaluate and improve outputs against safety criteria.
  ])
][
  #feature-card(4, [Tool Use & Agents], [\
    Native function calling, multi-step planning, code execution, and agent capabilities.
  ])
]

== Infrastructure & Serving

#cols(columns: (3fr, 2fr))[
  #data-table(
    ([Component], [Technology], [Scale]),
    (
      ([Training], [Custom TPU/GPU], [10K+ accelerators]),
      ([Inference], [Optimized serving], [#sym.lt 250ms P99]),
      ([Context], [KV-cache mgmt], [200K tokens]),
      ([Safety], [Multi-layer filters], [Real-time]),
      ([Monitoring], [Full observability], [99.9% uptime]),
    ),
  )
][
  #code-block([API Request])[
    ```http
    POST /v1/messages
    {
      "model": "claude-sonnet-4",
      "max_tokens": 4096,
      "messages": [{
        "role": "user",
        "content": "Explain..."
      }]
    }
    ```
  ]
]

= Safety & Alignment

== Constitutional AI Framework

#stat-row(
  (value: [16], label: [Core Principles]),
  (value: [98.7%], label: [Safety Compliance]),
  (value: [#sym.lt 0.1%], label: [Harmful Output Rate]),
  (value: [3x], label: [vs. Industry Avg]),
)

#v(0.3em)

#cols(columns: (1fr, 1fr))[
  === Training Pipeline

  - *Pretraining* — Web corpus curation
  - *SL Fine-tuning* — Human demonstrations
  - *RLHF* — Preference optimization
  - *CAI* — Principle-based self-improvement
][
  === Safety Principles

  - Be helpful, harmless, and honest
  - Refuse dangerous or illegal requests
  - Acknowledge uncertainty explicitly
  - Avoid deception and manipulation
]

== Safety Evaluation Results

#cols(columns: (3fr, 2fr))[
  #data-table(
    ([Benchmark], [Claude 3.5], [GPT-4o], [Delta]),
    (
      ([TruthfulQA], [94.2%], [89.1%], [+5.1%]),
      ([BBQ Bias], [97.8%], [93.4%], [+4.4%]),
      ([Toxicity], [99.1%], [96.7%], [+2.4%]),
      ([Refusal Accuracy], [98.7%], [95.2%], [+3.5%]),
      ([Factual Grounding], [92.5%], [88.3%], [+4.2%]),
    ),
  )
][
  #success-box([Safety Leadership])[\
    - Industry-leading benchmarks
    - Lowest harmful output rates
    - Published safety research & evals
  ]

  #v(0.3em)

  #warning-box([Ongoing Challenges])[\
    - Jailbreak resilience improvements
    - Multilingual safety parity
  ]
]

= Performance

== Benchmark Results

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #metric-card(
    [MMLU Score],
    [92.0%],
    trend: [#sym.arrow.t SOTA],
    accent: palette.orange,
  )
][
  #metric-card(
    [HumanEval],
    [92.4%],
    trend: [#sym.arrow.t 8%],
    accent: palette.blue,
  )
][
  #metric-card(
    [MATH],
    [71.1%],
    trend: [#sym.arrow.t 12%],
    accent: palette.green,
  )
][
  #metric-card(
    [GPQA],
    [59.4%],
    trend: [Expert-level],
    accent: palette.red,
  )
]

#v(0.6em)

#insight-box([Performance Highlights])[\
  Claude achieves state-of-the-art results across reasoning, coding, and knowledge benchmarks while maintaining the highest safety scores in the industry. The model demonstrates strong generalization from academic benchmarks to real-world tasks.
]

== Capability Deep Dive

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #feature-card(1, [Advanced Reasoning], [\
    Multi-step logical reasoning, mathematical proofs, and problem decomposition with chain-of-thought.
  ])
][
  #feature-card(2, [Code Generation], [\
    Full-stack development across 20+ languages with debugging, refactoring, and test generation.
  ])
]
#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #feature-card(3, [Long Document Analysis], [\
    Process 200K token contexts — codebases, legal docs, research papers — with cross-references.
  ])
][
  #feature-card(4, [Multilingual Fluency], [\
    Native-quality understanding across 100+ languages with cultural awareness.
  ])
]

= Deployment

== Enterprise Integration

#cols[
  #data-table(
    ([Feature], [Availability], [SLA]),
    (
      ([Messages API], [GA], [99.9%]),
      ([Tool Use], [GA], [99.9%]),
      ([Vision], [GA], [99.5%]),
      ([Batch API], [GA], [99.0%]),
    ),
  )
][
  #metric-card([Enterprise Clients], [150K+],
    trend: [#sym.arrow.t 3x YoY], accent: palette.orange, inset-y: .35em)

  #v(0.3em)

  #metric-card([API Calls / Day], [2B+],
    trend: [#sym.arrow.t 5x YoY], accent: palette.blue, inset-y: .35em)

  #v(0.3em)

  #metric-card([Developer Satisfaction], [4.8/5],
    trend: [NPS 82], accent: palette.green, inset-y: .35em)
]

== Deployment Architecture

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #phase-card([Layer 1], [API Gateway], [\
    - Rate limiting
    - Authentication
    - Request routing
    - Load balancing
  ], accent: palette.orange)
][
  #phase-card([Layer 2], [Safety Filters], [\
    - Input screening
    - Content classification
    - Policy enforcement
    - Audit logging
  ], accent: palette.blue)
][
  #phase-card([Layer 3], [Model Serving], [\
    - Auto-scaling
    - Model routing
    - KV-cache optimization
    - Batch processing
  ], accent: palette.green)
][
  #phase-card([Layer 4], [Monitoring], [\
    - Quality metrics
    - Latency tracking
    - Cost analytics
    - Safety dashboards
  ], accent: palette.red)
]

== Customer Success Stories

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #feature-card(1, [Notion — AI Writing], [\
    Intelligent document creation, summarization, and knowledge management. 40% productivity gain.
  ])
][
  #feature-card(2, [DuckDuckGo — AI Search], [\
    DuckAssist instant answers with source attribution and privacy-first design. 10M+ queries daily.
  ])
]
#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #feature-card(3, [Quora — Poe Platform], [\
    Flagship model on Poe, serving millions with high-quality, safe conversational AI.
  ])
][
  #feature-card(4, [Robin AI — Legal Tech], [\
    Contract analysis powered by long-context understanding. 60% faster legal review.
  ])
]

== Roadmap & Future Directions

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #phase-card([Q1 2025], [Foundation], [\
    - Claude 4 launch
    - Context to 500K
    - Multi-modal expansion
  ], accent: palette.orange)
][
  #phase-card([Q2 2025], [Agents], [\
    - Computer use GA
    - Autonomous workflows
    - MCP ecosystem
  ], accent: palette.blue)
][
  #phase-card([Q3 2025], [Enterprise], [\
    - On-premise deploy
    - Custom training
    - Compliance certs
  ], accent: palette.green)
][
  #phase-card([Q4 2025], [Scale], [\
    - Global inference
    - Industry models
    - Research partners
  ], accent: palette.red)
]

#v(0.2em)

#insight-box([2025 Vision])[\
  Building AI that is safe, beneficial, and understandable — scaling *responsible deployment* while advancing *alignment research*.
]

#focus-slide[
  _"The development of full artificial intelligence could spell the end of the human race... or it could be the best thing ever to happen to humanity."_

  We choose to build for the best outcome — safely.
]

#ending-slide[Thank You]
