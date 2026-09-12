#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("Libertinus Serif", "Songti SC"), size: 18pt)

#show: data-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Global Economic Indicators],
  config-info(
    title: [Global Economic Indicators Q4 2025],
    subtitle: [Quarterly Macro Dashboard],
    author: [Research Division \u{2014} Capital Economics],
    date: datetime(year: 2025, month: 12, day: 15),
  ),
  config-common(breakable: false),
)

#title-slide()

= Macro Overview

== Key Economic Indicators

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
  tufte-stat([3.2%], [GDP Growth YoY], trend: "up"),
  tufte-stat([2.1%], [Core CPI], trend: "down"),
  tufte-stat([4.1%], [Unemployment], trend: "plateau"),
  tufte-stat([5.25%], [Fed Funds Rate], trend: "volatile"),
)

#hairline-divider()

#small-multiple(
  (label: "ISM Mfg", value: "52.4", trend: "up"),
  (label: "PMI Svcs", value: "54.1", trend: "up"),
  (label: "Housing", value: "-8.2%", trend: "down"),
  (label: "Retail", value: "+1.4%", trend: "recovery"),
  (label: "Indust.", value: "+0.3%", trend: "plateau"),
  (label: "Exports", value: "+2.8%", trend: "up"),
)

#annotation[Source: Bureau of Economic Analysis, Federal Reserve. Seasonally adjusted. Sparklines show 8-quarter trailing trend.]

== Labor Market Deep Dive

#margin-note[Non-farm payrolls revised upward by 42K for Oct. participation rate highest since Feb 2020.]

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    data-card([Employment by Sector])[
      #data-table(
        ([Sector], [Jobs (K)], [\ MoM]),
        (
          ([Healthcare], [+58], [+0.4%]),
          ([Technology], [+42], [+0.6%]),
          ([Construction], [+31], [+0.3%]),
          ([Manufacturing], [-12], [-0.1%]),
          ([Retail], [-8], [-0.1%]),
        ),
      )
    ]
  },
  {
    evidence-box([Key Finding])[
      Wage growth decelerated to 3.8% YoY, the lowest reading in 18 months. This disinflationary signal supports the Fed's rate-cut thesis for Q1 2026.

      #v(0.3em)
      #sparkline(trend: "down", color: palette.red, width: 100pt) #h(0.5em) #text(size: 0.7em, fill: palette.gray)[Wage growth trajectory]
    ]
    v(0.8em)
    data-card([Participation Metrics])[
      Prime-age (25\u{2013}54): *83.2%* #h(1em) Youth (16\u{2013}24): *56.1%*

      Long-term unemployed share: *18.4%* (down from 22.1%)
    ]
  },
)

== Macro Trends: 8-Quarter View

#let quarters = ("Q1'24", "Q2'24", "Q3'24", "Q4'24", "Q1'25", "Q2'25", "Q3'25", "Q4'25")
#let q-x = range(8).map(i => i + 1)
#let gdp-growth = (2.8, 3.0, 3.1, 2.9, 3.0, 3.1, 3.2, 3.2)
#let core-cpi  = (3.9, 3.6, 3.3, 3.0, 2.8, 2.6, 2.3, 2.1)
#let unemp     = (3.9, 3.8, 3.8, 3.9, 4.0, 4.1, 4.1, 4.1)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    figure[
      #lq.diagram(
        width: 300pt, height: 160pt,
        ylim: (1.5, 5.0),
        xaxis: (ticks: range(8).map(i => (i + 1, quarters.at(i))), subticks: none),
        yaxis: (ticks: ((2.0, "2.0"), (3.0, "3.0"), (4.0, "4.0"), (5.0, "5.0")), subticks: none, label: [% YoY]),
        lq.plot(q-x, gdp-growth, stroke: 2pt + palette.ink,  label: [GDP Growth]),
        lq.plot(q-x, core-cpi,   stroke: 2pt + palette.red,  label: [Core CPI]),
        lq.plot(q-x, unemp,      stroke: (thickness: 1.5pt, paint: palette.gray, dash: "dashed"), label: [Unemployment]),
      )
    ]
    v(0.15em)
    stack(dir: ltr, spacing: 10pt,
      stack(dir: ltr, spacing: 3pt, line(length: 16pt, stroke: 2pt + palette.ink),   text(size: 0.6em, fill: palette.gray)[GDP Growth]),
      stack(dir: ltr, spacing: 3pt, line(length: 16pt, stroke: 2pt + palette.red),   text(size: 0.6em, fill: palette.gray)[Core CPI]),
      stack(dir: ltr, spacing: 3pt, line(length: 16pt, stroke: (thickness: 1.5pt, paint: palette.gray, dash: "dashed")), text(size: 0.6em, fill: palette.gray)[Unemployment]),
    )
    v(0.1em)
    annotation[Source: BEA, BLS. Seasonally adjusted annualized rates. Q4 2025 preliminary.]
  },
  {
    grid(columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
      tufte-stat([2.1%], [Core CPI], trend: "down", accent: palette.ink),
      tufte-stat([3.8%], [Shelter], trend: "plateau", accent: palette.gray),
      tufte-stat([-1.2%], [Energy], trend: "volatile", accent: palette.red),
    )
    hairline-divider()
    evidence-box([Disinflation Thesis])[
      New lease indices show rents are flat to declining, so shelter CPI should move toward the 2% target by mid-2026.\
      *CPI basket:* Shelter 36.2% · Transport 15.1% · Food 8.2% · Medical 8.4%.
    ]
  },
)

= Financial Markets

== Equity & Fixed Income

#let sectors    = ("Tech", "Health", "Finance", "Energy", "Utilities", "RE")
#let sec-x      = range(6).map(i => i + 1)
#let q3-returns = (4.2, 2.8, 3.1, -1.4, 0.6, -0.9)
#let q4-returns = (8.4, 5.1, 6.2, -3.1, 1.8, -0.4)

#grid(columns: (1fr, 1fr), column-gutter: 14pt,
  {
    figure[
      #set text(.7em)
      #lq.diagram(
        width: 290pt, height: 170pt,
        ylim: (-5, 11),
        xaxis: (ticks: range(6).map(i => (i + 1, sectors.at(i))), subticks: none),
        yaxis: (ticks: ((-4, "-4%"), (0, "0%"), (4, "4%"), (8, "8%")), subticks: none, label: [Return]),
        lq.bar(sec-x.map(x => x - 0.17), q3-returns, fill: palette.light-gray, width: 30%, label: [Q3 2025]),
        lq.bar(sec-x.map(x => x + 0.17), q4-returns, fill: palette.ink,        width: 30%, label: [Q4 2025]),
      )
    ]
    v(0.2em)
    stack(dir: ltr, spacing: 10pt,
      stack(dir: ltr, spacing: 3pt, rect(width: 14pt, height: 10pt, fill: palette.light-gray, stroke: none), text(size: 0.6em, fill: palette.gray)[Q3 2025]),
      stack(dir: ltr, spacing: 3pt, rect(width: 14pt, height: 10pt, fill: palette.ink, stroke: none),        text(size: 0.6em, fill: palette.gray)[Q4 2025]),
    )
    v(0.2em)
    annotation[Total return (price + dividends), USD. S&P 500 GICS sectors.]
  },
  {
    stack(spacing: .8em,
      small-multiple(
        (label: "S&P 500", value: "5,842", trend: "up"),
        (label: "10Y UST", value: "3.92%", trend: "down"),
        (label: "VIX", value: "14.2", trend: "plateau"),
      ),
      small-multiple(
        (label: "DXY", value: "102.4", trend: "volatile"),
        (label: "Gold", value: "$2,180", trend: "up"),
        (label: "WTI", value: "$71.40", trend: "down"),
      ),
    )
    v(0.5em)
    data-card([Yield Curve Snapshot])[
      #grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 4pt,
        block(inset: 4pt)[
          #text(size: 0.65em, fill: palette.gray)[2Y] \
          #text(size: 0.9em, weight: "bold")[3.85%]
        ],
        block(inset: 4pt)[
          #text(size: 0.65em, fill: palette.gray)[5Y] \
          #text(size: 0.9em, weight: "bold")[3.78%]
        ],
        block(inset: 4pt)[
          #text(size: 0.65em, fill: palette.gray)[10Y] \
          #text(size: 0.9em, weight: "bold")[3.92%]
        ],
        block(inset: 4pt)[
          #text(size: 0.65em, fill: palette.gray)[30Y] \
          #text(size: 0.9em, weight: "bold")[4.18%]
        ],
      )
      #v(0.2em)
      #annotation[Curve un-inverted Nov 2025. 2s10s spread: +7bp.]
    ]
  },
)

== Global GDP Growth Comparison

#margin-note[Eurozone data from ECB Statistical Warehouse. China NBS official figures; market estimates in parentheses.]

#let economies = ("US", "India", "China", "Japan", "UK", "Eurozone")
#let gdp-vals  = (3.2, 6.8, 4.8, 1.4, 1.1, 0.8)
#let econ-x    = range(6).map(i => i + 1)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    figure[
      #set text(.8em)
      #lq.diagram(
        width: 300pt, height: 180pt,
        ylim: (0, 8.5),
        xaxis: (ticks: range(6).map(i => (i + 1, economies.at(i))), subticks: none),
        yaxis: (ticks: ((0, "0%"), (2, "2%"), (4, "4%"), (6, "6%"), (8, "8%")), subticks: none, label: [GDP YoY]),
        lq.bar(econ-x, gdp-vals, fill: palette.ink, width: 55%),
      )
    ]
    v(0.2em)
    annotation[Annualized GDP growth, latest available quarter. All figures seasonally adjusted.]
  },
  {
    data-table(
      ([Economy], [GDP], [CPI], [Rates], [Outlook]),
      (
        ([United States], [+3.2%], [2.1%], [5.25%], [Soft landing]),
        ([Eurozone],      [+0.8%], [2.4%], [3.75%], [Stagnation]),
        ([China],         [+4.8%], [0.2%], [3.10%], [Deflation risk]),
        ([Japan],         [+1.4%], [2.8%], [0.25%], [Normalization]),
        ([UK],            [+1.1%], [3.2%], [4.75%], [Stagflation]),
        ([India],         [+6.8%], [4.9%], [6.50%], [Overheating]),
      ),
    )
    v(0.3em)
    annotation[Policy rate = central bank benchmark rate as of Dec 2025.]
  },
)

= Outlook

== Risk Assessment Matrix

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    evidence-box([Upside Risks])[
      - AI productivity gains exceed estimates (+0.5\u{2013}1.0pp GDP)
      - Faster shelter disinflation (CPI \u{2192} 1.8% by Q2)
      - China stimulus exceeds expectations
      - Supply chain normalization complete
    ]
  },
  {
    evidence-box([Downside Risks])[
      - Geopolitical escalation (oil >\$100)
      - Commercial real estate cascade
      - Labor hoarding reversal (rapid layoffs)
      - Fiscal cliff: debt ceiling impasse
    ]
  },
)

#hairline-divider()

#small-multiple(
  (label: "Base Case", value: "60%", trend: "up"),
  (label: "Bull Case", value: "20%", trend: "up"),
  (label: "Bear Case", value: "15%", trend: "down"),
  (label: "Tail Risk", value: "5%", trend: "volatile"),
)

#annotation[Scenario probabilities as of Dec 15, 2025. Updated quarterly by research committee.]

== Forward Guidance & Positioning

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
  data-card([Duration])[
    *Overweight* \
    Target: 6.5Y avg duration \
    Rationale: rate cuts priced insufficiently \
    #sparkline(trend: "up", color: palette.ink, width: 80pt)
  ],
  data-card([Equities])[
    *Neutral* \
    Preference: quality, cash flow \
    Avoid: high-leverage, meme \
    #sparkline(trend: "plateau", color: palette.ink, width: 80pt)
  ],
  data-card([Alternatives])[
    *Selective* \
    Gold: strategic allocation \
    PE: vintage year discipline \
    #sparkline(trend: "volatile", color: palette.ink, width: 80pt)
  ],
)

#v(0.5em)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  {
    small-multiple(
      (label: "Fed Cuts '26", value: "3\u{2013}4x"),
      (label: "Recession P", value: "15%"),
      (label: "EPS Growth", value: "+8%"),
    )
  },
  {
    annotation[Consensus estimates from 42 sell-side shops. Median forecast. Range: 2\u{2013}6 cuts for 2026.]
  },
)

#focus-slide[
  Above all else, show the data.

  #v(0.5em)
  #text(size: 0.5em, fill: palette.gray)[\u{2014} Edward Tufte]
]

#ending-slide[Thank you.]
