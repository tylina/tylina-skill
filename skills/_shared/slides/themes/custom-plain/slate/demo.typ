#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/mitex:0.2.7": *

#show: slate-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Slate Theme Demo],
    subtitle: [Premium Dark Presentation],
    author: [Product Lead],
    date: datetime.today(),
    institution: [Tech Corp],
  ),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

#title-slide()

= Product Overview

== Introduction

The *Slate* theme delivers a premium dark presentation experience:

- Dark charcoal background with warm amber accents
- Clean typography for maximum readability
- Perfect for product launches and keynotes
- Professional yet modern aesthetic

== Feature Cards

#cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true)[
  #slate-card[Performance][
    Our platform processes 10M+ requests per second with sub-millisecond
    latency. Built on cutting-edge infrastructure for enterprise scale.
  ]
][
  #slate-card(accent: palette.accent2)[Security][
    End-to-end encryption, SOC 2 Type II certified, and GDPR compliant.
    Your data stays protected at every layer.
  ]
]

== Technology Stack

#stack(
  dir: ltr,
  spacing: 6pt,
  badge[Rust],
  badge[PostgreSQL],
  badge(color: palette.accent2)[Kubernetes],
  badge(color: palette.accent2)[gRPC],
)

#accent-line()

#cols(columns: (1fr, 1fr), gutter: 1.5em)[
  *Backend*
  - Rust for performance
  - PostgreSQL for persistence
  - Redis for caching
][
  *Infrastructure*
  - Kubernetes orchestration
  - Multi-region deployment
  - Auto-scaling enabled
]

== Platform Metrics

#let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun")
#let requests = (2.1, 3.4, 5.2, 7.8, 9.1, 10.5)
#let latency = (12, 8, 5, 3, 2.4, 1.8)
#let x = range(6).map(i => i + 1)

#cols(columns: (1fr, 1fr), gutter: 1.8em)[
  #stack(
    spacing: .8em,
    figure[
      #set text(size: 13pt, fill: palette.text-sec)
      #lq.diagram(
        width: 250pt, height: 170pt,
        xaxis: (ticks: range(6).map(i => (i + 1, months.at(i))), subticks: none),
        yaxis: (ticks: ((0, "0"), (4, "4M"), (8, "8M"), (12, "12M")), subticks: none),
        lq.bar(x, requests, fill: palette.accent, width: 60%),
      )
    ],
    align(center, text(fill: palette.text-sec, size: 0.75em)[Requests / second]),
  )
][
  #stack(
    spacing: .8em,
    figure[
      #set text(size: 13pt, fill: palette.text-sec)
      #lq.diagram(
        width: 250pt, height: 170pt,
        xaxis: (ticks: range(6).map(i => (i + 1, months.at(i))), subticks: none),
        yaxis: (ticks: ((0, "0"), (4, "4ms"), (8, "8ms"), (12, "12ms")), subticks: none),
        lq.plot(x, latency, stroke: 2.5pt + palette.accent2, label: none),
      )
    ],
    align(center, text(fill: palette.text-sec, size: 0.75em)[P99 Latency]),
  )
]

= Technical Details

== Architecture

System throughput equation:

#mitex(`T = \frac{N}{S + \frac{P}{N}}`)

where #mi(`T`) is throughput, #mi(`N`) is parallelism, #mi(`S`) is serial fraction.

== Code Sample

```rust
async fn handle_request(req: Request) -> Response {
    let data = db.query(&req.params).await?;
    let result = process(data).await?;
    Response::ok(result)
}
```

#focus-slide[
  _Ship it._
]

#ending-slide[Thank You]
