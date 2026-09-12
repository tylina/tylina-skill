#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: emerald-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Emerald Wealth Partners],
    subtitle: [Q4 2024 Portfolio Review],
    author: [Victoria Ashworth, CFA],
    date: datetime.today(),
    institution: [Emerald Wealth Management],
  ),
)

#title-slide()

= Market Overview

== Current Market Landscape

The global equity markets showed resilience in Q4, with strong performance across key sectors.

- S&P 500 reached new all-time highs in November
- Emerging markets outperformed expectations
- Fixed income yields stabilized after Q3 volatility

#gem-card([Key Takeaway])[
  Diversification across asset classes continues to be the cornerstone of our investment philosophy. Our balanced approach delivered consistent returns throughout the quarter.
]

== Portfolio Performance

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  value-display([Total AUM], [\$2.4B]),
  value-display([Alpha Generated], [+2.3%]),
  value-display([YTD Return], [+14.7%]),
  value-display([Sharpe Ratio], [1.42]),
)

= Strategic Initiatives

== Investment Checklist

Our Q4 strategic priorities were executed according to plan:

#gold-divider()

- [x] Rebalanced equity allocation to 60/40 target

- [x] Reduced duration risk in fixed income portfolio

- [x] Initiated ESG integration across all mandates

- [x] Completed annual risk assessment review

- [x] Onboarded 12 new institutional clients

== Sector Allocation

#cols(lazy-layout: true)[
  #gem-card([Growth Sectors])[
    - Technology: *28%* allocation
    - Healthcare: *15%* allocation
    - Clean Energy: *8%* allocation
  ]
][
  #gem-card([Value Sectors], accent: palette.accent)[
    - Financials: *18%* allocation
    - Industrials: *12%* allocation
    - Consumer Staples: *9%* allocation
  ]
]

#gold-divider()

Remaining *10%* held in cash and short-term instruments for tactical opportunities.

= Quantitative Analysis

== Risk Model

Our proprietary risk model uses the following framework:

#mitex(`\sigma_p = \sqrt{\sum_{i=1}^n \sum_{j=1}^n w_i w_j \sigma_i \sigma_j \rho_{ij}}`)

Where #mi(`\sigma_p`) is portfolio volatility, #mi(`w_i`) are asset weights, and #mi(`\rho_{ij}`) is the correlation matrix.

#pause

#gem-card([Model Output])[
  Current portfolio VaR (95%, 1-day): *\$3.2M* \
  Expected Shortfall: *\$4.8M* \
  Maximum Drawdown (trailing 12m): *-6.2%*
]

== Code: Data Pipeline

```python
import pandas as pd

def calculate_portfolio_returns(weights, returns):
    """Calculate weighted portfolio returns."""
    portfolio = (weights * returns).sum(axis=1)
    sharpe = portfolio.mean() / portfolio.std() * (252 ** 0.5)
    return {"returns": portfolio, "sharpe": sharpe}
```

#focus-slide[
  _Excellence is not a destination._ \
  _It is a continuous journey._
]

#ending-slide[
  Thank You for Your Trust

  #text(size: 0.5em, fill: palette.gold-light)[
    Emerald Wealth Partners | Confidential
  ]
]
