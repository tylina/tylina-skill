// Aurora Borealis Theme -- Northern Lights / Arctic Sky aesthetic
// Shimmering curtains of green/purple/cyan dancing across deep navy-black
// Stars scattered behind the aurora, ice crystals, mountain horizon silhouettes
// Bold maximalism: luminous aurora contrast against arctic darkness
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  arctic: (bg: rgb("#0B0E1F"), ink: rgb("#E8F0F2"), accent: rgb("#00E676"), secondary: rgb("#7C4DFF"), tertiary: rgb("#00BCD4")),
  solar-storm: (bg: rgb("#0F0A1A"), ink: rgb("#FFF3E0"), accent: rgb("#FF6D00"), secondary: rgb("#E040FB"), tertiary: rgb("#FFAB00")),
  midnight: (bg: rgb("#050A14"), ink: rgb("#B0BEC5"), accent: rgb("#18FFFF"), secondary: rgb("#448AFF"), tertiary: rgb("#69F0AE")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  let secondary = p.secondary
  let tertiary = p.tertiary
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    tertiary: tertiary,
    // Derived from ink
    ink-dim: ink.transparentize(25%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(72%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent (aurora green)
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(55%),
    accent-faint: accent.transparentize(78%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary (aurora purple)
    secondary-dim: secondary.transparentize(35%),
    secondary-faint: secondary.transparentize(75%),
    secondary-ghost: secondary.transparentize(92%),
    // Derived from tertiary (aurora cyan)
    tertiary-dim: tertiary.transparentize(35%),
    tertiary-faint: tertiary.transparentize(75%),
    // Deeper background
    bg-deep: bg.darken(40%),
    // Meta
    meta-color: ink.transparentize(60%),
  )
}

// Default palette
#let palette = build-palette("arctic")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 30pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 8pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = ("IBM Plex Mono", "Menlo")
#let _sans-font = ("IBM Plex Sans", "Arial", "PingFang SC")

// =====================================================================
// SVG Definitions
// =====================================================================

// Aurora curtain: wavy vertical gradient bands (organic bezier curves)
#let _aurora-curtain-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 450\"><defs><linearGradient id=\"ag1\" x1=\"0\" y1=\"0\" x2=\"0\" y2=\"1\"><stop offset=\"0%\" stop-color=\"currentColor\" stop-opacity=\"0\"/><stop offset=\"40%\" stop-color=\"currentColor\" stop-opacity=\"0.3\"/><stop offset=\"70%\" stop-color=\"currentColor\" stop-opacity=\"0.15\"/><stop offset=\"100%\" stop-color=\"currentColor\" stop-opacity=\"0\"/></linearGradient></defs><path d=\"M 80 0 C 85 80 60 160 90 240 C 120 320 70 380 95 450\" stroke=\"url(#ag1)\" stroke-width=\"40\" fill=\"none\" opacity=\"0.25\"/><path d=\"M 180 0 C 200 100 160 180 195 280 C 230 380 175 420 210 450\" stroke=\"url(#ag1)\" stroke-width=\"55\" fill=\"none\" opacity=\"0.2\"/><path d=\"M 320 0 C 310 90 340 200 305 300 C 270 400 330 430 310 450\" stroke=\"url(#ag1)\" stroke-width=\"45\" fill=\"none\" opacity=\"0.3\"/><path d=\"M 460 0 C 480 70 440 170 475 260 C 510 350 450 400 485 450\" stroke=\"url(#ag1)\" stroke-width=\"50\" fill=\"none\" opacity=\"0.18\"/><path d=\"M 600 0 C 580 110 620 200 590 310 C 560 420 610 440 585 450\" stroke=\"url(#ag1)\" stroke-width=\"35\" fill=\"none\" opacity=\"0.22\"/><path d=\"M 720 0 C 740 60 710 180 745 270 C 780 360 720 410 750 450\" stroke=\"url(#ag1)\" stroke-width=\"42\" fill=\"none\" opacity=\"0.15\"/></svg>"

// Star scatter: random dots at varied sizes (no connecting lines)
#let _star-scatter-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 450\"><circle cx=\"45\" cy=\"30\" r=\"1.2\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"120\" cy=\"65\" r=\"0.8\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"200\" cy=\"20\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.9\"/><circle cx=\"280\" cy=\"90\" r=\"0.6\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"350\" cy=\"40\" r=\"1.0\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"420\" cy=\"75\" r=\"1.3\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"510\" cy=\"25\" r=\"0.9\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"580\" cy=\"55\" r=\"1.1\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"650\" cy=\"35\" r=\"1.4\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"730\" cy=\"80\" r=\"0.7\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"80\" cy=\"140\" r=\"0.9\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"160\" cy=\"180\" r=\"1.3\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"250\" cy=\"150\" r=\"0.7\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"340\" cy=\"200\" r=\"1.1\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"430\" cy=\"160\" r=\"0.8\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"540\" cy=\"190\" r=\"1.5\" fill=\"currentColor\" opacity=\"0.9\"/><circle cx=\"620\" cy=\"130\" r=\"0.6\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"700\" cy=\"170\" r=\"1.0\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"760\" cy=\"210\" r=\"1.2\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"55\" cy=\"280\" r=\"1.0\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"130\" cy=\"320\" r=\"0.8\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"220\" cy=\"290\" r=\"1.4\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"310\" cy=\"350\" r=\"0.9\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"400\" cy=\"300\" r=\"1.1\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"490\" cy=\"340\" r=\"0.7\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"570\" cy=\"310\" r=\"1.3\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"660\" cy=\"360\" r=\"0.8\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"740\" cy=\"290\" r=\"1.0\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"100\" cy=\"400\" r=\"1.1\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"250\" cy=\"420\" r=\"0.9\" fill=\"currentColor\" opacity=\"0.5\"/><circle cx=\"400\" cy=\"380\" r=\"1.2\" fill=\"currentColor\" opacity=\"0.6\"/><circle cx=\"550\" cy=\"410\" r=\"0.8\" fill=\"currentColor\" opacity=\"0.8\"/><circle cx=\"680\" cy=\"430\" r=\"1.0\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// Ice crystal: hexagonal snowflake ornament
#let _ice-crystal-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><line x1=\"50\" y1=\"10\" x2=\"50\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.8\"/><line x1=\"15\" y1=\"30\" x2=\"85\" y2=\"70\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.8\"/><line x1=\"15\" y1=\"70\" x2=\"85\" y2=\"30\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.8\"/><line x1=\"50\" y1=\"10\" x2=\"42\" y2=\"22\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"50\" y1=\"10\" x2=\"58\" y2=\"22\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"50\" y1=\"90\" x2=\"42\" y2=\"78\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"50\" y1=\"90\" x2=\"58\" y2=\"78\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"30\" x2=\"27\" y2=\"28\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"30\" x2=\"22\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"85\" y1=\"70\" x2=\"73\" y2=\"72\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"85\" y1=\"70\" x2=\"78\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"70\" x2=\"27\" y2=\"72\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"15\" y1=\"70\" x2=\"22\" y2=\"60\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"85\" y1=\"30\" x2=\"73\" y2=\"28\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><line x1=\"85\" y1=\"30\" x2=\"78\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><circle cx=\"50\" cy=\"50\" r=\"4\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><circle cx=\"50\" cy=\"50\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/></svg>"

// Northern horizon: mountain/tree silhouette at bottom edge
#let _horizon-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 120\"><path d=\"M 0 120 L 0 95 L 30 80 L 60 88 L 90 65 L 120 72 L 150 50 L 180 58 L 210 42 L 240 55 L 270 38 L 300 48 L 330 30 L 360 40 L 390 25 L 420 35 L 450 45 L 480 32 L 510 50 L 540 42 L 570 55 L 600 48 L 630 60 L 660 52 L 690 70 L 720 62 L 750 78 L 780 85 L 800 90 L 800 120 Z\" fill=\"currentColor\" opacity=\"0.7\"/><line x1=\"155\" y1=\"50\" x2=\"155\" y2=\"42\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.9\"/><line x1=\"152\" y1=\"44\" x2=\"155\" y2=\"38\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/><line x1=\"158\" y1=\"44\" x2=\"155\" y2=\"38\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/><line x1=\"335\" y1=\"30\" x2=\"335\" y2=\"22\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.9\"/><line x1=\"332\" y1=\"24\" x2=\"335\" y2=\"18\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/><line x1=\"338\" y1=\"24\" x2=\"335\" y2=\"18\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/><line x1=\"510\" y1=\"50\" x2=\"510\" y2=\"42\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.9\"/><line x1=\"507\" y1=\"44\" x2=\"510\" y2=\"38\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/><line x1=\"513\" y1=\"44\" x2=\"510\" y2=\"38\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.8\"/></svg>"

// Aurora shimmer: subtle horizontal waves for accents
#let _shimmer-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 20\"><path d=\"M 0 10 Q 25 4 50 10 Q 75 16 100 10 Q 125 4 150 10 Q 175 16 200 10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.6\"/><path d=\"M 0 10 Q 25 6 50 10 Q 75 14 100 10 Q 125 6 150 10 Q 175 14 200 10\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.3\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let aurora-curtain(color: palette.accent, width: 100%, height: 100%) = {
  let svg = _aurora-curtain-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let star-scatter(color: palette.ink, width: 100%, height: 100%) = {
  let svg = _star-scatter-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let ice-crystal(color: palette.accent, size: 30pt) = {
  let svg = _ice-crystal-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let horizon-silhouette(color: palette.bg.lighten(15%), width: 100%, height: 60pt) = {
  let svg = _horizon-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let shimmer-line(color: palette.accent, width: 120pt) = {
  let svg = _shimmer-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// aurora-dot -- Small glowing dot representing a star
#let aurora-dot(color: palette.ink, size: 3pt) = {
  circle(radius: size / 2, fill: color)
}

/// aurora-glow -- Layered circles simulating glow (like star-marker)
#let aurora-glow(color: palette.accent, size: 5pt) = {
  box(width: size * 2, height: size * 2)[
    #place(center + horizon, circle(radius: size, fill: color.transparentize(75%)))
    #place(center + horizon, circle(radius: size * 0.6, fill: color.transparentize(40%)))
    #place(center + horizon, circle(radius: size * 0.3, fill: color))
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// aurora-card -- Card with aurora-colored left border and subtle glow
#let aurora-card(title, body) = {
  block(
    width: 100%,
    stroke: (left: 2.5pt + palette.accent, rest: 0.4pt + palette.accent-faint),
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
    fill: palette.bg.lighten(4%),
  )[
    // Subtle top-right glow
    #place(top + right, dx: -4pt, dy: 4pt, aurora-glow(color: palette.accent, size: 3pt))
    // Title
    #stack(spacing: .8em,
      text(size: typo.body, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// frost-stat -- Large number display with shimmer underline (like frozen metric)
#let frost-stat(label, value, description: none) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(3%),
    stroke: 0.4pt + palette.tertiary-faint,
    inset: (x: 0.6em, y: 0.5em),
  )[
    #set align(center)
    #stack(spacing: .8em,
      ice-crystal(color: palette.tertiary, size: 18pt),
      text(size: 44pt, weight: "bold", fill: palette.ink, value),
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.tertiary,
        font: _mono-font,
        upper(label),
      ),
      shimmer-line(color: palette.accent, width: 60pt),
      if description != none {
        text(
          size: 13pt,
          weight: "regular",
          fill: palette.ink-muted,
          font: _sans-font,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// crystal-divider -- Horizontal line with ice crystal in center
#let crystal-divider(total-width: 100%) = {
  block(width: total-width, height: 20pt)[
    #place(left + horizon, line(length: 42%, stroke: 0.5pt + palette.accent-muted))
    #place(right + horizon, line(length: 42%, stroke: 0.5pt + palette.accent-muted))
    #place(center + horizon, ice-crystal(color: palette.accent, size: 18pt))
  ]
}

/// polar-tag -- Small labeled badge with aurora glow style
#let polar-tag(body) = {
  box(
    fill: palette.accent-ghost,
    stroke: 0.4pt + palette.accent-muted,
    inset: (x: 8pt, y: 3pt),
    radius: 2pt,
  )[
    #text(size: typo.small, fill: palette.accent, weight: "medium", font: _mono-font, body)
  ]
}

/// shimmer-quote -- Quote with aurora shimmer ornament
#let shimmer-quote(body, cite: none) = {
  let citation = if cite != none {
    text(
      size: typo.tiny,
      style: "normal",
      weight: "medium",
      tracking: 1.2pt,
      fill: palette.meta-color,
      font: _mono-font,
      [-- #upper(cite)],
    )
  } else {
    none
  }
  block(
    width: 100%,
    fill: palette.bg.lighten(3%),
    stroke: (left: 2pt + palette.secondary),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(spacing: .8em,
      grid(columns: (auto, 1fr), column-gutter: 8pt, align: horizon,
        ice-crystal(color: palette.secondary-dim, size: 16pt),
        text(size: typo.body, style: "italic", fill: palette.ink, body),
      ),
      citation,
    )
  ]
}

/// horizon-panel -- Wide panel with mountain horizon silhouette at bottom
#let horizon-panel(title, body) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(3%),
    stroke: 0.4pt + palette.ink-faint,
    inset: 0pt,
    clip: true,
  )[
    #block(width: 100%, inset: (x: 1.2em, top: 1em, bottom: 0.6em))[
      #place(bottom + left, dy: .6em,
        horizon-silhouette(color: palette.bg.darken(10%), width: 100%, height: 28pt))
      #stack(spacing: .8em,
        text(size: typo.body, weight: "bold", fill: palette.ink, title),
        [
        #set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
        #body
        ],
      )
    ]
  ]
}

/// aurora-data-table -- Data table styled with aurora aesthetic
#let aurora-data-table(align: center + horizon, headers, ..rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.accent-ghost }
      else if calc.odd(row) { palette.bg.lighten(3%) } else { palette.bg.lighten(1%) },
    stroke: 0.4pt + palette.accent-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(
      size: 9pt,
      weight: "bold",
      tracking: 1pt,
      fill: palette.accent,
      font: _mono-font,
      upper(h),
    ))),
    ..rows.pos().flatten().map(cell => text(
      size: 11pt,
      fill: palette.ink-dim,
      font: _mono-font,
      cell,
    )),
  )
}

/// aurora-kicker -- Small uppercase label used above titles
#let aurora-kicker(body) = {
  text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: palette.accent, font: _mono-font, upper(body))
}

/// frost-box -- Outlined box with frost-like appearance
#let frost-box(body) = {
  block(
    width: 100%,
    fill: palette.bg.lighten(3%),
    stroke: 0.5pt + palette.tertiary-faint,
    inset: (x: 1em, y: 0.8em),
    radius: 0pt,
  )[
    #set text(size: 13pt, fill: palette.ink-dim, font: _sans-font)
    #body
  ]
}

/// polar-badge -- Accent-colored inline badge
#let polar-badge(body) = {
  box(
    fill: palette.secondary-ghost,
    stroke: 0.4pt + palette.secondary-faint,
    inset: (x: 6pt, y: 2pt),
    radius: 1pt,
  )[
    #text(size: typo.small, fill: palette.secondary, weight: "medium", body)
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2pt, fill: gradient.linear(pal.accent, pal.tertiary)),
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[AURORA]
    },
    text(fill: pal.accent-muted, size: 6pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides with custom labels
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.ink.transparentize(50%), font: _mono-font)
    grid(
      columns: (1fr, 1fr),
      {
        if custom-left != none {
          custom-left
        } else if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(right)
        if custom-right != none {
          custom-right
        } else {
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        }
      },
    )
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.ink.transparentize(60%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[AURORA]
    },
    text(fill: pal.accent-muted, size: 6pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Arctic night bg, faint star scatter, aurora glow accents
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let setting(body) = {
    // Faint star scatter background
    place(top + left,
      box(width: 100%, height: 100%,
        star-scatter(color: pal.ink.transparentize(40%), width: 100%, height: 100%),
      ),
    )
    // Subtle aurora glow at top edge (very faint)
    place(top + left,
      block(width: 100%, height: 40%,
        fill: gradient.linear(pal.accent.transparentize(96%), pal.accent.transparentize(100%), angle: 180deg)))
    // Corner accent dots
    place(top + right, dx: -1.5em, dy: 0.4em,
      aurora-dot(color: pal.accent-muted, size: 3pt),
    )
    place(bottom + left, dx: 1.5em, dy: -0.6em,
      aurora-dot(color: pal.tertiary-dim, size: 2.5pt),
    )
    show: std.align.with(self.store.align)
    body
  }
self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deep arctic darkness with bright aurora accents
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Aurora curtain in background (faint)
    place(top + left,
      box(width: 100%, height: 100%,
        aurora-curtain(color: pal.accent.transparentize(40%), width: 100%, height: 100%),
      ),
    )
    // Secondary aurora layer (purple tint)
    place(top + left,
      box(width: 100%, height: 100%,
        aurora-curtain(color: pal.secondary.transparentize(60%), width: 100%, height: 100%),
      ),
    )
    // Scattered stars
    place(top + right, dx: -40pt, dy: 25pt, aurora-dot(color: pal.ink.transparentize(55%), size: 2pt))
    place(top + right, dx: -90pt, dy: 45pt, aurora-dot(color: pal.accent.transparentize(30%), size: 2.5pt))
    place(top + right, dx: -140pt, dy: 20pt, aurora-dot(color: pal.ink.transparentize(65%), size: 1.5pt))
    place(bottom + left, dx: 50pt, dy: -35pt, aurora-dot(color: pal.ink.transparentize(60%), size: 2pt))
    place(bottom + left, dx: 100pt, dy: -20pt, aurora-dot(color: pal.tertiary.transparentize(40%), size: 2pt))
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg-deep,
      header: header,
      footer: footer,
      margin: (top: 2.3em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Full aurora spectacle: layered curtains, stars, horizon, frame
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Layer 1: Deep arctic sky
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Layer 2: Star scatter
    place(top + left,
      box(width: 100%, height: 100%,
        star-scatter(color: pal.ink.transparentize(20%), width: 100%, height: 100%),
      ),
    )

    // Layer 3: Aurora curtain (green, main)
    place(top + left,
      box(width: 100%, height: 100%,
        aurora-curtain(color: pal.accent, width: 100%, height: 100%),
      ),
    )

    // Layer 4: Aurora curtain (purple, secondary)
    place(top + left, dx: 50pt,
      box(width: 90%, height: 100%,
        aurora-curtain(color: pal.secondary.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Layer 5: Aurora curtain (cyan, tertiary, faint)
    place(top + left, dx: -30pt,
      box(width: 85%, height: 100%,
        aurora-curtain(color: pal.tertiary.transparentize(50%), width: 100%, height: 100%),
      ),
    )

    // Layer 6: Horizon silhouette at bottom
    place(bottom + left,
      horizon-silhouette(color: pal.bg.darken(20%), width: 100%, height: 50pt),
    )

    // Layer 7: Frame border
    place(center + horizon,
      rect(width: 94%, height: 90%, stroke: 0.5pt + pal.accent-muted, fill: none)
    )

    // Corner ice crystals
    place(top + left, dx: 2%, dy: 3%, ice-crystal(color: pal.accent.transparentize(40%), size: 22pt))
    place(top + right, dx: -2%, dy: 3%, ice-crystal(color: pal.tertiary.transparentize(50%), size: 18pt))
    place(bottom + left, dx: 2%, dy: -3%, ice-crystal(color: pal.secondary.transparentize(50%), size: 18pt))
    place(bottom + right, dx: -2%, dy: -3%, ice-crystal(color: pal.accent.transparentize(40%), size: 22pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      #stack(spacing: 0.8em,
        {
          if info.institution != none {
            text(
              size: typo.tiny,
              weight: "medium",
              tracking: 2pt,
              fill: pal.accent,
              font: _mono-font,
              upper(info.institution),
            )
          }
        },
        text(size: typo.display, weight: "bold", fill: pal.ink, info.title),
        block(width: 180pt, height: 16pt)[
          #place(left + horizon, line(length: 70pt, stroke: 0.5pt + pal.accent))
          #place(center + horizon, ice-crystal(color: pal.accent, size: 14pt))
          #place(right + horizon, line(length: 70pt, stroke: 0.5pt + pal.accent))
        ],
        {
          if info.subtitle != none {
            text(size: 18pt, weight: "regular", style: "italic", fill: pal.ink-dim, info.subtitle)
          }
        },
        {
          set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font)
          if info.author != none {
            upper[#info.author]
          }
          if info.author != none and info.date != none {
            h(1.5em)
            text(fill: pal.accent, size: 6pt)[#sym.diamond.filled]
            h(1.5em)
          }
          if info.date != none {
            utils.display-info-date(self)
          }
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Aurora sweep behind section number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Star field background
    place(top + left,
      box(width: 100%, height: 100%,
        star-scatter(color: pal.ink.transparentize(30%), width: 100%, height: 100%),
      ),
    )

    // Aurora curtain sweep (right side)
    place(top + right, dx: 0pt,
      box(width: 50%, height: 100%,
        aurora-curtain(color: pal.accent.transparentize(20%), width: 100%, height: 100%),
      ),
    )

    // Large ghost section number
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 140pt, weight: "bold", fill: pal.ink.transparentize(92%), num-str)
      },
    )

    // Ice crystal ornament
    place(top + right, dx: -3em, dy: 1.5em,
      ice-crystal(color: pal.accent.transparentize(50%), size: 36pt),
    )

    // Top accent gradient line
    place(top + left, dx: 3em, dy: 3em,
      block(width: 80pt, height: 2pt, fill: gradient.linear(pal.accent, pal.tertiary)))

    // Horizon at bottom
    place(bottom + left,
      horizon-silhouette(color: pal.bg.darken(15%), width: 100%, height: 40pt),
    )

    // Content
    pad(left: 4em, right: 10em, top: 5em, bottom: 3em)[
      #v(1fr)
      #stack(spacing: 0.8em,
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 1.8pt,
          fill: pal.accent,
          font: _mono-font,
        )[SECTION #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }],
        {
          set text(fill: pal.ink, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 60pt, height: 2pt, fill: gradient.linear(pal.accent, pal.secondary)),
      )
      #v(3fr)
    ]

    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[AURORA],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single statement on deep space with scattered aurora dots
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg-deep,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Aurora curtain very faint in background
    place(top + left,
      box(width: 100%, height: 100%,
        aurora-curtain(color: pal.accent.transparentize(60%), width: 100%, height: 100%),
      ),
    )

    // Scattered aurora dots around edges
    place(top + left, dx: 20pt, dy: 20pt, aurora-dot(color: pal.accent, size: 3pt))
    place(top + left, dx: 70pt, dy: 40pt, aurora-dot(color: pal.ink-muted, size: 2pt))
    place(top + right, dx: -35pt, dy: 25pt, aurora-dot(color: pal.tertiary, size: 3.5pt))
    place(top + right, dx: -80pt, dy: 50pt, aurora-dot(color: pal.ink-muted, size: 2pt))
    place(bottom + left, dx: 45pt, dy: -30pt, aurora-dot(color: pal.secondary, size: 3pt))
    place(bottom + right, dx: -55pt, dy: -35pt, aurora-dot(color: pal.accent, size: 4pt))
    place(bottom + right, dx: -100pt, dy: -20pt, aurora-dot(color: pal.ink-faint, size: 2pt))

    // Corner accent lines (aurora gradient)
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 40pt, height: 2pt, fill: gradient.linear(pal.accent, pal.accent.transparentize(100%))))
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 2pt, height: 30pt, fill: gradient.linear(pal.accent, pal.accent.transparentize(100%), angle: 180deg)))
    place(bottom + right, dx: 0pt, dy: 0pt,
      block(width: 40pt, height: 2pt, fill: gradient.linear(pal.tertiary.transparentize(100%), pal.tertiary)))
    place(bottom + right, dx: 0pt, dy: -30pt + 2pt,
      block(width: 2pt, height: 30pt, fill: gradient.linear(pal.tertiary.transparentize(100%), pal.tertiary, angle: 180deg)))

    set text(fill: pal.ink, size: 1.4em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    block(width: 80%, inset: (x: 1em), body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Final farewell with full aurora display
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Stars
    place(top + left,
      box(width: 100%, height: 100%,
        star-scatter(color: pal.ink.transparentize(25%), width: 100%, height: 100%),
      ),
    )

    // Aurora layers
    place(top + left,
      box(width: 100%, height: 100%,
        aurora-curtain(color: pal.accent.transparentize(10%), width: 100%, height: 100%),
      ),
    )
    place(top + left, dx: 40pt,
      box(width: 80%, height: 100%,
        aurora-curtain(color: pal.secondary.transparentize(40%), width: 100%, height: 100%),
      ),
    )

    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost)[AURORA],
    )

    // Frame border
    place(center + horizon,
      rect(width: 94%, height: 92%, stroke: 0.5pt + pal.accent-muted, fill: none)
    )

    // Corner ice crystals
    place(top + left, dx: 2em, dy: 1.2em, ice-crystal(color: pal.accent, size: 20pt))
    place(top + right, dx: -2em, dy: 1.2em, ice-crystal(color: pal.tertiary, size: 16pt))
    place(bottom + left, dx: 2em, dy: -1.2em, ice-crystal(color: pal.secondary, size: 16pt))
    place(bottom + right, dx: -2em, dy: -1.2em, ice-crystal(color: pal.accent, size: 20pt))

    // Horizon
    place(bottom + left,
      horizon-silhouette(color: pal.bg.darken(25%), width: 100%, height: 45pt),
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(spacing: 0.8em,
        std.align(center, ice-crystal(color: pal.accent, size: 32pt)),
        text(size: 2em, weight: "bold", fill: pal.ink, body),
        std.align(center, block(width: 160pt, height: 14pt)[
          #place(left + horizon, line(length: 60pt, stroke: 0.5pt + pal.accent))
          #place(center + horizon, aurora-glow(color: pal.accent, size: 4pt))
          #place(right + horizon, line(length: 60pt, stroke: 0.5pt + pal.accent))
        ]),
        text(size: 10pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[AURORA BOREALIS],
      )
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let aurora-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "arctic",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      primary-dark: pal.accent.darken(30%),
      neutral-lightest: pal.bg,
      neutral-darkest: pal.ink,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
