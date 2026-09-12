#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/primaviz:0.8.0": bullet-chart

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== 2025 Annual KPI Achievement Status

#let kpis = (
  ("Sales Revenue",         "Target: $100M",  92,  100, (60, 80, 120)),
  ("New Customers",         "Target: 500",    97,  100, (60, 80, 120)),
  ("Customer Satisfaction", "Target: 90%",    98,  100, (60, 80, 120)),
  ("Market Share",          "Target: 25%",    72,  100, (60, 80, 120)),
  ("Cost Control",          "Budget: $80M",   119, 80,  (60, 80, 120)),
)

#let get-status-color(pct, is-reverse) = {
  if is-reverse { rgb("#E74C3C") }
  else if pct >= 90 { rgb("#4CAF50") }
  else if pct >= 60 { rgb("#FF9800") }
  else { rgb("#E74C3C") }
}

#figure[
  #grid(columns: (170pt, 1fr, 70pt), gutter: 12pt,
    ..kpis.map(kpi => {
      let (name, target-desc, actual, target, ranges) = kpi
      let pct = calc.round(actual / target * 100)
      let is-reverse = name == "Cost Control"
      let status-color = get-status-color(pct, is-reverse)
      (
        align(right + horizon)[
          *#name* \
          #text(fill: rgb("#7F8C8D"))[#target-desc]
        ],
        align(horizon)[
          #bullet-chart(
            actual, target, ranges,
            width: 500pt,
            title: none,
            theme: (background: none, border-color: none),
          )
        ],
        align(left + horizon)[
          #text(weight: "bold", fill: status-color)[#pct%]
        ],
      )
    }).flatten()
  )
]

#block(fill: rgb("#E3F2FD"), stroke: rgb("#2196F3") + 1.5pt, radius: 6pt, inset: (x: 14pt, y: 8pt), width: 100%)[
  *Summary:* 3 KPIs exceeded targets. Market share growth needs strengthening. Cost control requires attention. \
  _Recommendation: Prioritize cutting non-core project expenses while increasing marketing budget._
]
