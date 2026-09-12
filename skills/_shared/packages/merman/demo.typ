#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/merman:0.1.0": show-mermaid-blocks

#show: simple-theme.with(aspect-ratio: "16-9")
#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 92%)

#set text(size: 18pt)

== Merman Demo — Mermaid to SVG

#align(center)[
  ```mermaid
  flowchart LR
    A[Source brief] --> B{Evidence complete?}
    B -->|Yes| C[Design spec]
    B -->|No| D[Research gap]
    D --> A
    C --> E[Compile and review]
  ```
]

#align(right)[Headless Mermaid rendering during Typst compilation]
