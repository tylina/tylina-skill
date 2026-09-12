// Editorial Grid Theme -- Bloomberg/Monocle/Economist style presentation theme
// Strict typographic grid, inverse weight hierarchy, single accent color system
// NO gradients, NO shadows, NO rounded corners. Precision typography + surgical whitespace.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Color Palette
// =====================================================================

#let palette = (
  ink: rgb("#1A1A1A"),        // Near-black primary
  paper: rgb("#FAFAF8"),      // Warm off-white
  accent: rgb("#E63946"),     // Editorial red (single accent)
  gray: rgb("#8C8C8C"),       // Metadata color
  rule: rgb("#D4D4D2"),       // Hairline rule color
  ink-light: rgb("#1A1A1A").transparentize(40%),
  ink-faint: rgb("#1A1A1A").transparentize(75%),
  ink-ghost: rgb("#1A1A1A").transparentize(94%),
)

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 44pt,
  h1: 28pt,
  h2: 22pt,
  lead: 16pt,
  body: 14pt,
  small: 11pt,
  kicker-size: 9pt,
  meta-size: 8pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = ("IBM Plex Mono", "Menlo", "DejaVu Sans Mono")
#let _sans-font = ("IBM Plex Sans", "Noto Sans SC", "Arial")

// =====================================================================
// 1. Reusable Components
// =====================================================================

/// hairline -- Thin 0.3pt line across full width
#let hairline(color: palette.rule) = {
  block(width: 100%, above: 0.5em, below: 0.5em,
    line(length: 100%, stroke: 0.3pt + color)
  )
}

/// byline -- Monospace uppercase tracked author/source attribution
#let byline(body) = {
  text(
    size: typo.kicker-size,
    weight: "medium",
    tracking: 1.6pt,
    fill: palette.gray,
    font: _mono-font,
    upper(body),
  )
}

/// metric-block -- Huge light-weight number + monospace label below
#let metric-block(value, label, accent: palette.ink) = {
  block(width: 100%, inset: (x: 0.4em, y: 0.4em))[
    #stack(
      spacing: 0.8em,
      text(
        size: 48pt,
        weight: "light",
        fill: accent,
        value,
      ),
      text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.gray,
        font: _mono-font,
        upper(label),
      ),
      lazy-v(1fr),
    )
  ]
}

/// data-card -- NO rounded corners, hairline border, monospace label top, bold number, description
#let data-card(label, value, description: none) = {
  block(
    width: 100%,
    fill: palette.paper,
    stroke: 0.5pt + palette.rule,
    inset: (x: 1em, y: 0.8em),
    radius: 0pt,
  )[
    #stack(
      spacing: 0.8em,
      text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.gray,
        font: _mono-font,
        upper(label),
      ),
      text(
        size: 28pt,
        weight: "bold",
        fill: palette.ink,
        value,
      ),
      if description != none {
        text(
          size: typo.body,
          weight: "regular",
          fill: palette.ink-light,
          description,
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// red-callout -- Left red border 3pt, no bg fill, just border + text
#let red-callout(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + palette.accent),
    inset: (left: 1em, y: 0.6em),
    radius: 0pt,
  )[
    #set text(size: typo.body, fill: palette.ink)
    #body
    #lazy-v(1fr)
  ]
}

/// pull-quote -- Large italic text + thin left rule
#let pull-quote(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 1.5pt + palette.ink-faint),
    inset: (left: 1.2em, y: 0.6em),
    radius: 0pt,
  )[
    #stack(
      spacing: 0.8em,
      {
        set text(size: typo.h2, style: "italic", fill: palette.ink, weight: "light")
        body
      },
      if cite != none { text(
        size: typo.kicker-size,
        style: "normal",
        weight: "medium",
        fill: palette.gray,
        font: _mono-font,
        upper(cite),
      ) },
    )
  ]
}

/// dot-grid-bg -- Subtle dot grid background at 4% opacity
#let dot-grid-bg(color: rgb("#1a1a1a"), dot-opacity: 4%) = {
  let c = color.transparentize(100% - dot-opacity)
  // Place small circles in a grid pattern
  place(top + left,
    block(width: 100%, height: 100%, clip: true)[
      #for row in range(14) {
        for col in range(24) {
          place(top + left, dx: col * 36pt + 18pt, dy: row * 36pt + 18pt,
            circle(radius: 0.6pt, fill: c)
          )
        }
      }
    ]
  )
}

// =====================================================================
// 2. Internal Helpers (header/footer)
// =====================================================================

/// _page-number -- Two-digit slide counter without the literal-zero "010" bug
#let _page-number() = context {
  let number = utils.slide-counter.get().first()
  if number < 10 { "0" + str(number) } else { str(number) }
}

/// _content-header -- Standard header for content slides
#let _content-header(self) = {
  let pal = palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  // Top hairline
  place(top + left, dx: -2em, dy: -0.6em,
    line(length: 200%, stroke: 0.3pt + pal.rule))
  // Page number top-right in monospace
  place(top + right,
    text(size: typo.meta-size, fill: pal.gray, font: _mono-font, _page-number())
  )
  stack(
    spacing: 0.8em,
    {
      // Title in large LIGHT weight (inverse hierarchy)
      set text(fill: pal.ink, size: 1.5em, weight: "light")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // Red accent underline (60pt, not full-width)
    block(width: 60pt, height: 2pt, fill: pal.accent),
  )
}

/// _content-footer -- Standard footer for content slides
#let _content-footer(self) = {
  let pal = palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.gray, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    {
      // Small red square as separator (not circle -- editorial precision)
      box(rect(width: 4pt, height: 4pt, fill: pal.accent, radius: 0pt))
    },
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      [#_page-number() / #utils.last-slide-number]
    },
  )
}

// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard content slide
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _content-header(self)
  let footer(self) = _content-footer(self)
  let setting(body) = {
    // Carry the theme's grid metaphor through ordinary content slides.
    dot-grid-bg(dot-opacity: 3%)
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

/// title-slide -- Pure editorial cover
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = palette
  let body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    // Dot grid background
    dot-grid-bg()
    // Small red square mark (8pt x 8pt)
    place(top + left, dx: 4em, dy: 3em,
      rect(width: 8pt, height: 8pt, fill: pal.accent, radius: 0pt)
    )
    // Title content
    set std.align(left + horizon)
    pad(x: 4em, y: 3em)[
      // Title in HUGE LIGHT weight (44pt+)
      #text(size: 44pt, weight: "light", fill: pal.ink, info.title)
      #v(0.6em)
      // Thin red line
      #block(width: 60pt, height: 2pt, fill: pal.accent)
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 18pt, weight: "light", fill: pal.ink-light, info.subtitle)
        v(1em)
      }
      // Author in monospace uppercase tracking
      #{
        set text(size: typo.kicker-size, fill: pal.gray, font: _mono-font, tracking: 1.8pt, weight: "medium")
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(2em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
    // Bottom hairline
    place(bottom + left, line(length: 100%, stroke: 0.3pt + pal.rule))
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with large number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    // Dot grid
    dot-grid-bg()
    // Enormous light-weight section NUMBER (100pt+, weight 200)
    place(top + right, dx: -3em, dy: 1em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink.transparentize(88%), size: 140pt, weight: "extralight", num-str)
      },
    )
    // One thin red horizontal rule across the page
    place(top + left, dy: 50%, line(length: 100%, stroke: 1.5pt + pal.accent))
    // Section TITLE in bold 14pt monospace uppercase tracking
    pad(left: 4em, right: 6em, top: 4em, bottom: 2em)[
      #v(1fr)
      // Section number label
      #text(
        size: typo.kicker-size,
        weight: "semibold",
        tracking: 1.8pt,
        fill: pal.gray,
        font: _mono-font,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.6em)
      // Section title in bold monospace uppercase
      #{
        set text(fill: pal.ink, size: 14pt, weight: "bold", font: _mono-font, tracking: 1.2pt)
        upper(utils.display-current-heading(level: 1, numbered: false))
      }
      #v(3fr)
    ]
    // Bottom hairline
    place(bottom + left, line(length: 100%, stroke: 0.3pt + pal.rule))
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Dark background, white text, red accent line
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Red accent line at top
    place(top + left, dx: -3em, dy: -3em,
      block(width: 60pt, height: 2pt, fill: pal.accent)
    )
    set text(fill: pal.paper, size: 1.6em, weight: "light")
    set std.align(horizon + left)
    body
  }
  touying-slide(self: self, main-body)
})

/// ending-slide -- Paper bg, large light-weight farewell text, red square mark
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Paper bg
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))
    // Dot grid
    dot-grid-bg()
    // Top hairline
    place(top + left, line(length: 100%, stroke: 0.3pt + pal.rule))
    // Content centered
    set std.align(center + horizon)
    pad(x: 4em)[
      // Red square mark
      #std.align(center, rect(width: 8pt, height: 8pt, fill: pal.accent, radius: 0pt))
      #v(1em)
      // Large light-weight text
      #text(size: 36pt, weight: "light", fill: pal.ink, body)
      #v(0.8em)
      // Thin rule
      #std.align(center, block(width: 60pt, height: 1pt, fill: pal.rule))
    ]
    // Bottom hairline
    place(bottom + left, line(length: 100%, stroke: 0.3pt + pal.rule))
  }
  touying-slide(self: self, main-body)
})

/// outline-slide -- Clean TOC with monospace numbering
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  let pal = palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: (x: 4em, y: 3em)),
  )
  let main-body = {
    // Title
    text(size: 28pt, weight: "light", fill: pal.ink, title)
    v(0.4em)
    block(width: 60pt, height: 2pt, fill: pal.accent)
    v(1.5em)
    // TOC using built-in outline
    {
      set text(size: typo.lead, fill: pal.ink, font: _mono-font, weight: "regular")
      outline(title: none, depth: 1)
    }
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let editorial-grid-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.paper,
      margin: (top: 5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.paper,
      neutral-darkest: palette.ink,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
    ),
    ..args,
  )

  body
}
