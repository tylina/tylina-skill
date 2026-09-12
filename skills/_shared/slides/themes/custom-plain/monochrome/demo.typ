#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: monochrome-theme.with(
  aspect-ratio: "16-9",
  footer: [MONOCHROME],
  config-common(breakable: false),
  config-info(
    title: [Monochrome Theme],
    subtitle: [Swiss Design Minimalism],
    author: [Designer Name],
    date: datetime.today(),
    institution: [Design Studio],
  ),
)
#set text(font: ("Helvetica Neue", "Arial"), size: 20pt)

#title-slide()

= Design Principles

== Introduction

The *Monochrome* theme embraces the principles of Swiss/International design:

- Strong typographic hierarchy
- Clean geometric forms
- Maximum contrast with minimal color
- Content-first approach

== Core Components

#stack(spacing: .8em,
  mono-card[Design Philosophy][
    Less is more. Every element on the slide serves a purpose.
    Remove anything that doesn't directly communicate your message.
  ],
  quote-block(author: [Dieter Rams])[
    Good design is as little design as possible.
  ],
)

== Side-by-Side Layout

#cols[
  *Simplicity*

  The monochrome palette forces clarity.
  Without color to rely on, structure and
  typography must carry the message.
][
  *Contrast*

  Black on white creates the strongest
  possible contrast, ensuring readability
  in any lighting condition.
]

= Content Examples

== Numbered Steps

+ *Define* — Identify the core message of your presentation
+ *Reduce* — Strip away every non-essential element
+ *Refine* — Polish typography and spacing
+ *Present* — Deliver with confidence and clarity

== Mathematics

The beauty of mathematical notation in monochrome:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

#divider()

Euler's identity: #mi(`e^{i\pi} + 1 = 0`)

== Code Example

```rust
fn fibonacci(n: u64) -> u64 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}
```

#focus-slide[
  _Form follows function._
]

#ending-slide[Thank You]
