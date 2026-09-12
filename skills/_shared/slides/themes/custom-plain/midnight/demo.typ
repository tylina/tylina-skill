#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/mitex:0.2.7": *

#show: midnight-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Midnight Theme Demo],
    subtitle: [A Dark Elegant Theme for Modern Presentations],
    author: [Jane Doe],
    date: datetime.today(),
    institution: [TechConf 2025],
  ),
)

#title-slide()

= Introduction

== Welcome

This is the *Midnight* theme -- a dark, elegant presentation theme inspired by the midnight sky.

- Deep navy blue tones for a professional look
- Light blue and purple accent colors for visual interest
- Designed for tech conferences and modern presentations
- Full dark-mode support for code and math

== Components Showcase

#stack(
  spacing: .8em,
  [
    #glow-card([Key Insight])[
      The Midnight theme uses a carefully crafted dark color palette that reduces eye strain while maintaining excellent readability and visual hierarchy.
    ]
  ],
  [
    #cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
      [#stat-card([Downloads], [12.4K], trend: [Up 23%])],
      [#stat-card([Stars], [3.2K], trend: [Up 15%])],
      [#stat-card([Contributors], [89], trend: [Up 8%])],
    )
  ],
)

== Side-by-Side Layout

#cols[
  *Design Principles*

  - Contrast-aware dark palette

  - Consistent accent usage

  - Readable typography

  - Minimal visual noise
][
  #glow-card([Purple Accent], accent: palette.accent2)[
    Cards can be customized with different accent colors to create visual variety and draw attention to specific content.
  ]
]

== Growth Trends

#let quarters = ("Q1", "Q2", "Q3", "Q4")
#let users = (2.4, 5.1, 8.7, 12.4)
#let stars = (0.8, 1.5, 2.3, 3.2)
#let x = range(4).map(i => i + 1)

#cols(columns: (1fr, 1fr), gutter: 2em)[
  #stack(
    spacing: .8em,
    [
      #figure[
        #set text(size: 0.7em)
        #lq.diagram(
          width: 240pt, height: 165pt,
          xaxis: (ticks: range(4).map(i => (i + 1, quarters.at(i))), subticks: none),
          yaxis: (ticks: ((0, "0"), (5, "5K"), (10, "10K"), (15, "15K")), subticks: none),
          lq.bar(x, users, fill: palette.accent, width: 55%),
        )
      ]
    ],
    [#align(center, text(fill: palette.text-sec, size: 0.68em)[Downloads per Quarter])],
  )
][
  #stack(
    spacing: .8em,
    [
      #figure[
        #set text(size: 0.7em)
        #lq.diagram(
          width: 240pt, height: 165pt,
          xaxis: (ticks: range(4).map(i => (i + 1, quarters.at(i))), subticks: none),
          yaxis: (ticks: ((0, "0"), (1, "1K"), (2, "2K"), (3, "3K"), (4, "4K")), subticks: none),
          lq.plot(x, stars, stroke: 2.5pt + palette.accent2, label: none),
        )
      ]
    ],
    [#align(center, text(fill: palette.text-sec, size: 0.68em)[GitHub Stars])],
  )
]

= Technical Content

== Mathematics

The Midnight theme renders mathematics beautifully against the dark background:

#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`)

And inline math works too: #mi(`E = mc^2`), #mi(`\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}`)

== Code Example

```rust
fn main() {
    let stars: Vec<Star> = generate_sky(1000);
    for star in &stars {
        star.render(Brightness::High);
    }
    println!("The midnight sky is ready.");
}
```

#focus-slide[
  _"The darkest skies reveal the brightest stars."_
]

#ending-slide[Thank You!]
