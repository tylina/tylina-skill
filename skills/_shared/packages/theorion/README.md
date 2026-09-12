# Theorion — Theorem Environments

**Package**: `@preview/theorion:0.6.0`
**Category**: Math / Academic

## Description

Out-of-the-box, customizable and multilingual theorem environment package. Supports theorem, definition, lemma, corollary, example, proof, and many more presets.

## Usage in Touying Slides

```typst
#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/theorion:0.6.0": *
#import cosmos.clouds: *  // or cosmos.simple, cosmos.fancy, cosmos.rainbow

#show: simple-theme.with(aspect-ratio: "16-9")
#show: show-theorion

#set text(size: 18pt)

== Fundamental Results

#theorem[Euclid's Theorem][
  There are infinitely many prime numbers.
] <thm:euclid>

#proof[
  Suppose finitely many primes $p_1, ..., p_n$. Then $N = p_1 dot ... dot p_n + 1$ is not divisible by any $p_i$. Contradiction.
]
```

## Available Styles

| Style | Import | Visual Description | Best For |
|-------|--------|-------------------|----------|
| **Simple** | `cosmos.simple` | Clean, minimal — similar to LaTeX default `amsthm` | Academic papers, minimalist themes |
| **Clouds** | `cosmos.clouds` | Rounded-rectangle background, soft fill | Most Touying presentations — readable, modern |
| **Rainbow** | `cosmos.rainbow` | Left colored border (like GitHub Markdown quotes/warnings) | Technical slides, admonition-style |
| **Fancy** | `cosmos.fancy` | Decorated frames with colored borders (similar to `tcolorbox`/`elegant-book`) | Formal presentations, heavy theorem usage |

**Recommendation**: Use `cosmos.simple` for Plain-tier decks or themes mimicking LaTeX. Use `cosmos.clouds` (rounded rectangle) or `cosmos.rainbow` (left-border accent) for Rich-tier decks. `cosmos.fancy` is visually heavy — use only if the theme warrants it.

## Available Environments

### Mathematical
`theorem`, `definition`, `lemma`, `corollary`, `proposition`, `axiom`, `postulate`, `conjecture`, `claim`, `property`, `assumption`

### Proof & Solution
`proof`, `example`, `exercise`, `problem`, `solution`, `conclusion`

### Block/Admonition
`remark-block`, `tip-block`, `important-block`, `warning-block`, `note-block`, `caution-block`, `quote-block`, `emph-block`

## Syntax Patterns

### Basic (auto-numbered)

```typst
#theorem[Content without title]

#theorem[Title][Content with title] <label>

#definition[Prime Number][
  A natural number $p > 1$ is *prime* if its only divisors are $1$ and $p$.
]
```

### Custom Number or Supplement

```typst
// Specify a number explicitly
#theorem(title: "Euclid's Theorem", number: "233", supplement: [Theorion])[
  There are infinitely many prime numbers.
]

// Counter continuation: array number continues numbering from 2.3
#theorem(number: (2, 3))[
  This theorem is explicitly numbered 2.3.
  The next auto-numbered theorem continues as 2.4.
]
```

### Custom Full-Title Override

```typst
#theorem(full-title: [Fundamental Theorem])[
  Overrides the auto-generated "Theorem 1.1" title entirely.
]
```

### Without Numbering

```typst
#theorem-box(outlined: false)[Unnumbered Theorem][
  This theorem is not numbered.
]
```

### References

```typst
// Standard reference
See @thm:euclid for the proof.

// Reference without title
@thm:euclid[-]

// Reference with title and number
@thm:euclid[!!]
```

### QED Placement

```typst
#proof[
  The proof proceeds by contradiction.
  $ a^2 + b^2 = c^2 $ #qedhere  // QED symbol placed at equation
]
```

## Configuration

### Numbering

```typst
#set-inherited-levels(1)          // Inherit N heading levels in numbering
#set-zero-fill(true)              // Zero-fill shorter numbers
#set-leading-zero(true)           // Leading zero in numbering
#set-theorion-numbering("1.1")    // Numbering format string
```

### Appendix Numbering

```typst
#counter(heading).update(0)
#set heading(numbering: "A.1")
#set-theorion-numbering("A.1")
```

### Outline of Theorems

```typst
#outline(title: none, target: figure.where(kind: "theorem"))
```

### Theorem Restatement

```typst
// Restate a specific labeled theorem
#theorion-restate(filter: <thm:euclid>)

// Restate all theorems
#theorion-restate(
  filter: it => it.outlined and it.identifier == "theorem",
  render: it => it.render,
)
```

## Integration Notes

- The `#show: show-theorion` rule must be placed **after** the theme's `#show:` rule
- Theorion works with Touying's animation system
- Multilingual: auto-detects document language for "Theorem", "定理", etc.
- Configurable paragraph indentation via `#set-indent-mode(auto)`
