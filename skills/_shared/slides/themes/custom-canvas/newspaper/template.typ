// Newspaper Theme -- Classic broadsheet newspaper layout for Touying presentations
// Multi-column typesetting, serif headlines, justified body text, rule lines.
// "Above the fold" prominence hierarchy. Masthead-style title slides.
// Presets: broadsheet (NYT), tabloid (red-top), financial (FT salmon)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  broadsheet: (
    bg: rgb("#FBF9F1"),
    ink: rgb("#1A1A1A"),
    accent: rgb("#8B0000"),
    secondary: rgb("#003366"),
  ),
  tabloid: (
    bg: rgb("#FFFFFF"),
    ink: rgb("#000000"),
    accent: rgb("#FF0000"),
    secondary: rgb("#FFD700"),
  ),
  financial: (
    bg: rgb("#FFF5F0"),
    ink: rgb("#1A1A1A"),
    accent: rgb("#1A1A1A"),
    secondary: rgb("#8B4513"),
  ),
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
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    // Derived tones
    ink-light: ink.transparentize(30%),
    ink-muted: ink.transparentize(55%),
    ink-faint: ink.transparentize(80%),
    ink-ghost: ink.transparentize(93%),
    rule-color: ink.transparentize(65%),
    rule-thin: ink.transparentize(50%),
    // Card surfaces
    card-bg: bg.darken(3%),
    meta-color: ink.transparentize(45%),
  )
}

// Default palette
#let palette = build-palette("broadsheet")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  masthead: 48pt,
  headline: 32pt,
  subhead: 22pt,
  lead: 16pt,
  body: 13pt,
  caption: 10pt,
  dateline: 8pt,
  classified: 9pt,
)


// =====================================================================
// Font Constants
// =====================================================================

#let _serif-font = "Libertinus Serif"
#let _mono-font = "DejaVu Sans Mono"


// =====================================================================
// SVG Inline Assets
// =====================================================================

/// Column rule SVG: vertical thin line with decorative diamond at center
#let _column-rule-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 200" width="12" height="200"><line x1="6" y1="0" x2="6" y2="90" stroke="#1A1A1A" stroke-width="0.7" opacity="0.5"/><polygon points="6,94 9,100 6,106 3,100" fill="#1A1A1A" opacity="0.45"/><line x1="6" y1="110" x2="6" y2="200" stroke="#1A1A1A" stroke-width="0.7" opacity="0.5"/></svg>
```.text

/// Masthead ornament SVG: typographic flourish
#let _masthead-ornament-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 20" width="120" height="20"><line x1="0" y1="10" x2="35" y2="10" stroke="#1A1A1A" stroke-width="0.8" opacity="0.6"/><circle cx="40" cy="10" r="2" fill="#1A1A1A" opacity="0.5"/><line x1="45" y1="10" x2="55" y2="10" stroke="#1A1A1A" stroke-width="0.8" opacity="0.6"/><polygon points="60,6 63,10 60,14 57,10" fill="#1A1A1A" opacity="0.6"/><line x1="65" y1="10" x2="75" y2="10" stroke="#1A1A1A" stroke-width="0.8" opacity="0.6"/><circle cx="80" cy="10" r="2" fill="#1A1A1A" opacity="0.5"/><line x1="85" y1="10" x2="120" y2="10" stroke="#1A1A1A" stroke-width="0.8" opacity="0.6"/></svg>
```.text

/// Edition marker SVG: Vol./No. decorative frame
#let _edition-marker-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 24" width="80" height="24"><rect x="1" y="1" width="78" height="22" fill="none" stroke="#1A1A1A" stroke-width="0.8" opacity="0.5"/><rect x="3" y="3" width="74" height="18" fill="none" stroke="#1A1A1A" stroke-width="0.4" opacity="0.3"/></svg>
```.text


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// column-rule -- Vertical separator with center diamond ornament
#let column-rule(height: 160pt) = {
  box(width: 12pt, height: height,
    image(bytes(_column-rule-svg), width: 12pt, height: height),
  )
}

/// masthead-ornament -- Decorative flourish for headers
#let masthead-ornament() = {
  image(bytes(_masthead-ornament-svg), width: 100pt, height: 16pt)
}

/// edition-marker -- Vol./No. decorative frame element
#let edition-marker(vol: "I", no: "1") = {
  box(inset: (x: 8pt, y: 3pt))[
    #set text(size: typo.dateline, font: _mono-font, fill: palette.ink-muted)
    #image(bytes(_edition-marker-svg), width: 70pt, height: 20pt)
    #place(center + horizon,
      text(size: 7pt, tracking: 1pt, font: _mono-font, fill: palette.ink-light,
        [VOL.#vol ~ NO.#no]
      ),
    )
  ]
}

/// headline-card -- Card with bold serif headline, thin rule below, justified body text
#let headline-card(title, body, accent-rule: true) = {
  block(
    width: 100%,
    inset: (x: 0.5em, y: 0.4em),
  )[
    #stack(
      spacing: .8em,
      text(size: typo.lead, weight: "bold", font: _serif-font, fill: palette.ink, title),
      if accent-rule {
        block(width: 100%, height: 0.7pt, fill: palette.rule-color)
      },
      {
        set text(size: typo.body, font: _serif-font, fill: palette.ink-light)
        set par(justify: true, leading: 0.55em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// edition-stat -- Large bold serif number with small edition/issue label
#let edition-stat(value, label, description: none) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.4em))[
    #stack(
      spacing: .8em,
      text(
        size: typo.dateline,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.ink-muted,
        font: _mono-font,
        style: "italic",
        upper(label),
      ),
      stack(
        spacing: 18pt,
        text(
          size: 42pt,
          weight: "bold",
          fill: palette.ink,
          font: _serif-font,
          value,
        ),
        if description != none {
          text(
            size: typo.caption,
            weight: "regular",
            fill: palette.ink-light,
            font: _serif-font,
            description,
          )
        },
        lazy-v(1fr),
      ),
    )
  ]
}

/// pull-quote -- Large italic quote with vertical rule on left
#let pull-quote(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 2.5pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.4em),
  )[
    #set text(size: typo.body, style: "italic", fill: palette.ink, font: _serif-font)
    #body
    #if cite != none {
      h(1em)
      text(
        size: typo.dateline,
        style: "normal",
        weight: "medium",
        fill: palette.ink-muted,
        font: _mono-font,
        [-- #cite],
      )
    }
  ]
}

/// byline-tag -- Small caps author/date attribution tag
#let byline-tag(author, date: none) = {
  block(width: 100%, inset: (y: 0.2em))[
    #set text(size: typo.dateline, font: _mono-font, fill: palette.ink-muted, tracking: 0.8pt)
    #smallcaps(upper(author))
    #if date != none {
      h(1em)
      text(fill: palette.ink-faint)[|]
      h(1em)
      date
    }
  ]
}

/// masthead-block -- Full-width header with newspaper name styling, date, edition
#let masthead-block(name, date: none, edition: none, subtitle: none) = {
  block(width: 100%, inset: (x: 0pt, y: 0.3em))[
    // Top rule
    #block(width: 100%, height: 1.5pt, fill: palette.ink)
    #v(0.3em)
    #block(width: 100%, height: 0.5pt, fill: palette.rule-color)
    #v(0.6em)
    // Center content
    #std.align(center)[
      #if date != none or edition != none {
        set text(size: typo.dateline, font: _mono-font, fill: palette.ink-muted, tracking: 0.6pt)
        if date != none { date }
        if date != none and edition != none { h(2em) }
        if edition != none { edition }
        v(0.4em)
      }
      #text(size: typo.masthead, weight: "bold", font: _serif-font, fill: palette.ink, tracking: 2pt,
        upper(name),
      )
      #if subtitle != none {
        v(0.3em)
        text(size: typo.caption, font: _serif-font, style: "italic", fill: palette.ink-light, subtitle)
      }
    ]
    #v(0.6em)
    // Bottom rules
    #block(width: 100%, height: 0.5pt, fill: palette.rule-color)
    #v(0.3em)
    #block(width: 100%, height: 1.5pt, fill: palette.ink)
  ]
}

/// news-grid -- 2 or 3 column layout with column-rule separators
#let _newspaper-cols = cols
#let _newspaper-column(item, divider: false) = block(width: 100%)[
  #item
  #if divider {
    place(right + horizon, dx: 12pt, column-rule(height: 90%))
  }
]
#let news-grid(cols: 2, ..children) = {
  let items = children.pos()
  assert(cols >= 1, message: "news-grid: `cols` must be at least 1")
  assert(
    items.len() == cols,
    message: "news-grid: expected " + str(cols) + " children, got " + str(items.len()),
  )
  let content-items = items.enumerate().map(
    ((i, item)) => _newspaper-column(item, divider: i < items.len() - 1),
  )
  _newspaper-cols(
    lazy-layout: true,
    columns: range(cols).map(_ => 1fr),
    gutter: 24pt,
    ..content-items,
  )
}

/// classified-box -- Dense small-text box with border (like classified ads)
#let classified-box(title, body) = {
  block(
    width: 100%,
    stroke: 0.7pt + palette.rule-color,
    inset: (x: 0.5em, y: 0.3em),
  )[
    #text(size: typo.classified, weight: "bold", font: _serif-font, fill: palette.ink,
      upper(title),
    )
    #h(0.8em)
    #{
      set text(size: 8pt, font: _serif-font, fill: palette.ink-light)
      set par(justify: true, leading: 0.4em)
      body
    }
  ]
}


// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _news-header -- Dateline header for standard slides
#let _news-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.5em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    // Dateline metadata
    {
      set text(size: typo.dateline, fill: pal.meta-color, font: _mono-font, tracking: 0.5pt)
      grid(
        columns: (1fr, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          set std.align(right)
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        },
      )
    },
    // Title in bold serif
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold", font: _serif-font)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 100%, height: 0.7pt, fill: pal.rule-color),
  )
}

/// _news-footer -- Footer for standard slides
#let _news-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.2em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.55em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[THE DAILY REPORT]
    },
    text(fill: pal.ink-faint, size: 7pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Inverted header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: typo.dateline, fill: pal.bg.transparentize(40%), font: _mono-font, tracking: 0.5pt)
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

/// _dark-footer -- Inverted footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.bg.transparentize(50%), size: 0.55em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[THE DAILY REPORT]
    },
    text(fill: pal.bg.transparentize(70%), size: 7pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard newsprint slide with dateline header and content columns
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _news-header(self)
  let footer(self) = _news-footer(self)
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Inverted dark background slide (printing plate/negative style)
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-size: 180pt,
  ghost-dx: -20pt,
  ghost-dy: -30pt,
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
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "bold", fill: pal.bg.transparentize(92%), font: _serif-font, ghost),
      )
    }
    set text(fill: pal.bg)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      header: header,
      footer: footer,
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Full masthead with newspaper name, date, headline story style
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Fill background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Masthead area
    place(top + left, dx: 0pt, dy: 0pt,
      block(width: 100%, inset: (x: 3em, top: 1.5em))[
        // Top double rule
        #block(width: 100%, height: 1.5pt, fill: pal.ink)
        #v(3pt)
        #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
        #v(0.6em)
        // Date line and edition
        #grid(columns: (1fr, 1fr, 1fr),
          {
            set text(size: typo.dateline, font: _mono-font, fill: pal.ink-muted, tracking: 0.5pt)
            if info.date != none {
              utils.display-info-date(self)
            }
          },
          {
            set std.align(center)
            set text(size: typo.dateline, font: _mono-font, fill: pal.ink-muted)
            if info.institution != none [#info.institution]
          },
          {
            set std.align(right)
            set text(size: typo.dateline, font: _mono-font, fill: pal.ink-muted, tracking: 0.5pt)
            [EDITION No. 1]
          },
        )
        #v(0.4em)
        // Masthead title
        #std.align(center,
          text(size: typo.masthead, weight: "bold", font: _serif-font, fill: pal.ink, tracking: 3pt,
            upper(if info.title != none { info.title } else { [THE DAILY] }),
          ),
        )
        #v(0.2em)
        // Ornament
        #std.align(center, masthead-ornament())
        #v(0.3em)
        // Subtitle as sub-headline
        #if info.subtitle != none {
          std.align(center,
            text(size: typo.lead, font: _serif-font, style: "italic", fill: pal.ink-light, info.subtitle),
          )
          v(0.3em)
        }
        // Bottom rule
        #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
        #v(3pt)
        #block(width: 100%, height: 1.5pt, fill: pal.ink)
      ],
    )

    // Byline area (below the fold)
    place(center, dy: 66%,
      block(width: 70%, inset: (x: 1em))[
        #set std.align(center)
        // Author byline
        #{
          set text(size: typo.dateline, font: _mono-font, fill: pal.ink-muted, tracking: 0.8pt)
          if info.author != none {
            upper[By #info.author]
          }
        }
      ],
    )

    // Bottom rule
    place(bottom + left, dx: 3em, dy: -1.5em,
      block(width: 100% - 6em, height: 0.7pt, fill: pal.rule-color),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section header like newspaper section front
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Top rules
    place(top + left, dx: 3em, dy: 2em,
      block(width: 100% - 6em)[
        #block(width: 100%, height: 1.5pt, fill: pal.ink)
        #v(3pt)
        #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
      ],
    )
    // Section label
    place(top + left, dx: 3em, dy: 4em,
      text(
        size: typo.dateline,
        weight: "medium",
        tracking: 2pt,
        fill: pal.ink-muted,
        font: _mono-font,
      )[SECTION],
    )
    // Large section name
    place(left + horizon, dx: 3em,
      block(width: 70%)[
        #text(
          size: 56pt,
          weight: "bold",
          fill: pal.ink,
          font: _serif-font,
          tracking: 1pt,
        )[
          #utils.display-current-heading(level: 1, numbered: false)
        ]
        #v(0.3em)
        #block(width: 80pt, height: 2pt, fill: pal.accent)
      ],
    )
    // Bottom rules
    place(bottom + left, dx: 3em, dy: -2em,
      block(width: 100% - 6em)[
        #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
        #v(3pt)
        #block(width: 100%, height: 1.5pt, fill: pal.ink)
      ],
    )
    // Page indicator
    place(bottom + right, dx: -3em, dy: -3em,
      text(fill: pal.ink-muted, size: 7pt, font: _mono-font)[
        #context [#utils.slide-counter.display()]
      ],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single large headline quote, editorial style
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: (x: 3em, top: 3em, bottom: 3em),
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Top rule
    place(top + left, dx: -3em, dy: -2em, block(width: 100% + 6em, height: 1.5pt, fill: pal.ink))
    // Bottom rule
    place(bottom + left, dx: -3em, dy: 2em, block(width: 100% + 6em, height: 1.5pt, fill: pal.ink))
    // Large quotation mark
    place(top + left, dx: -0.5em, dy: -0.3em,
      text(size: 120pt, weight: "bold", fill: pal.ink-ghost, font: _serif-font, [#sym.quote.l.double]),
    )
    // Content
    set text(fill: pal.ink, size: 1.6em, weight: "regular", style: "italic", font: _serif-font)
    set std.align(horizon + center)
    block(width: 85%)[#body]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Colophon-style ending with journalism "30" tradition
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Top rules
    place(top + left, dx: 3em, dy: 2em,
      block(width: 100% - 6em)[
        #block(width: 100%, height: 1.5pt, fill: pal.ink)
        #v(3pt)
        #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
      ],
    )
    // Ghost "30" (journalism end-mark)
    place(center + horizon,
      text(size: 180pt, weight: "bold", fill: pal.ink-ghost, font: _serif-font, [-- 30 --]),
    )
    // Main content centered
    set std.align(center + horizon)
    pad(x: 4em)[
      #std.align(center, block(width: 60pt, height: 1pt, fill: pal.ink))
      #v(1em)
      #text(size: 2em, weight: "bold", fill: pal.ink, font: _serif-font, body)
      #v(0.6em)
      #std.align(center, masthead-ornament())
      #v(1em)
      #std.align(center, block(width: 60pt, height: 1pt, fill: pal.ink))
      #v(1.2em)
      #text(size: typo.dateline, fill: pal.ink-muted, font: _mono-font, tracking: 1pt)[END OF EDITION]
    ]
    // Bottom rules
    place(bottom + left, dx: 3em, dy: -2em,
      block(width: 100% - 6em)[
        #block(width: 100%, height: 0.5pt, fill: pal.rule-color)
        #v(3pt)
        #block(width: 100%, height: 1.5pt, fill: pal.ink)
      ],
    )
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let newspaper-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "broadsheet",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 18pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 4em, bottom: 3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.ink,
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
