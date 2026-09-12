// Silk Road Theme -- Central Asian/Islamic geometric art inspired Touying presentation theme
// Jewel tones (lapis lazuli, turquoise, gold) on warm ivory backgrounds
// Embedded SVG geometric star patterns and border strips as structural language
// 3 presets: lapis (blue/ivory), emerald (green/cream), desert (terracotta/sand)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  lapis: (
    ink: rgb("#1B2B3A"),
    paper: rgb("#FDF8F0"),
    lapis: rgb("#1E3A5F"),
    turquoise: rgb("#1B8A7A"),
    gold: rgb("#C8963E"),
    terra: rgb("#8B4513"),
  ),
  emerald: (
    ink: rgb("#1A2E1F"),
    paper: rgb("#FDFBF5"),
    lapis: rgb("#1B5E3A"),
    turquoise: rgb("#2A8B6E"),
    gold: rgb("#B8862B"),
    terra: rgb("#6B4423"),
  ),
  desert: (
    ink: rgb("#2A1E13"),
    paper: rgb("#FEF5E7"),
    lapis: rgb("#8B4513"),
    turquoise: rgb("#B87333"),
    gold: rgb("#DAA520"),
    terra: rgb("#A0522D"),
  ),
)


// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  (
    ink: p.ink,
    paper: p.paper,
    lapis: p.lapis,
    turquoise: p.turquoise,
    gold: p.gold,
    terra: p.terra,
    // Derived tones
    ink-light: p.ink.transparentize(35%),
    ink-faint: p.ink.transparentize(80%),
    ink-ghost: p.ink.transparentize(94%),
    ink-muted: p.ink.transparentize(60%),
    meta-color: p.ink.transparentize(35%),
    gold-light: p.gold.transparentize(60%),
    gold-faint: p.gold.transparentize(80%),
    gold-text: p.gold.darken(30%),
    // Card surfaces
    card-dark: p.lapis,
    card-dark-text: p.paper,
  )
}

// Default palette
#let palette = build-palette("lapis")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 20pt,
  lead: 16pt,
  body: 14pt,
  kicker-size: 9pt,
  meta-size: 8pt,
)


// =====================================================================
// Font Constants
// =====================================================================

#let _sans-font = ("Avenir Next", "Arial", "Noto Sans SC")
#let _mono-font = "Menlo"


// =====================================================================
// SVG Geometric Patterns
// =====================================================================

// 8-pointed khatam built from interlocking squares and a sixteen-vertex star
#let _star-8pt-svg = ( ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <polygon points="50,5 59.2,27.8 81.8,18.2 72.2,40.8 95,50 72.2,59.2 81.8,81.8 59.2,72.2 50,95 40.8,72.2 18.2,81.8 27.8,59.2 5,50 27.8,40.8 18.2,18.2 40.8,27.8" fill="currentColor" fill-opacity="0.08" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round" opacity="0.72"/>
  <polygon points="50,13 87,50 50,87 13,50" fill="none" stroke="currentColor" stroke-width="1.1" opacity="0.48"/>
  <polygon points="24,24 76,24 76,76 24,76" fill="none" stroke="currentColor" stroke-width="1.1" opacity="0.42"/>
  <polygon points="50,24 56.6,34.1 68.4,31.6 65.9,43.4 76,50 65.9,56.6 68.4,68.4 56.6,65.9 50,76 43.4,65.9 31.6,68.4 34.1,56.6 24,50 34.1,43.4 31.6,31.6 43.4,34.1" fill="none" stroke="currentColor" stroke-width="1" opacity="0.6"/>
  <circle cx="50" cy="50" r="11" fill="none" stroke="currentColor" stroke-width="0.9" opacity="0.42"/>
  <line x1="50" y1="13" x2="50" y2="87" stroke="currentColor" stroke-width="0.55" opacity="0.25"/>
  <line x1="13" y1="50" x2="87" y2="50" stroke="currentColor" stroke-width="0.55" opacity="0.25"/>
  <line x1="24" y1="24" x2="76" y2="76" stroke="currentColor" stroke-width="0.55" opacity="0.2"/>
  <line x1="76" y1="24" x2="24" y2="76" stroke="currentColor" stroke-width="0.55" opacity="0.2"/>
  <circle cx="50" cy="50" r="2.4" fill="currentColor" opacity="0.65"/>
</svg>
``` ).text

// Geometric border strip (repeating diamond pattern)
#let _border-strip-svg = ( ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 30">
  <path d="M0,15 L15,0 L30,15 L15,30 Z M40,15 L55,0 L70,15 L55,30 Z M80,15 L95,0 L110,15 L95,30 Z M120,15 L135,0 L150,15 L135,30 Z M160,15 L175,0 L190,15 L175,30 Z M200,15 L215,0 L230,15 L215,30 Z M240,15 L255,0 L270,15 L255,30 Z M280,15 L295,0 L310,15 L295,30 Z M320,15 L335,0 L350,15 L335,30 Z M360,15 L375,0 L390,15 L375,30 Z" fill="none" stroke="currentColor" stroke-width="1" opacity="0.25"/>
</svg>
``` ).text

// Small ornament star for inline use
#let _ornament-svg = ( ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
  <polygon points="20,2 24,14 37,14 27,22 30,35 20,27 10,35 13,22 3,14 16,14" fill="currentColor" opacity="0.4"/>
</svg>
``` ).text


// =====================================================================
// SVG Rendering Helpers
// =====================================================================

/// geometric-star -- Renders an 8-pointed geometric star
#let geometric-star(color: palette.gold, size: 60pt) = {
  image(bytes(
    _star-8pt-svg.replace("currentColor", color.to-hex())),
    width: size,
    height: size,
  )
}

/// border-strip -- Renders a geometric border strip
#let border-strip(color: palette.gold, width: 100%, height: 20pt) = {
  box(
    width: width,
    height: height,
    clip: true,
    image(bytes(
      _border-strip-svg.replace("currentColor", color.to-hex())),
      width: width,
      height: height,
      fit: "cover",
    ),
  )
}

/// ornament-star -- Small decorative star
#let ornament-star(color: palette.gold, size: 16pt) = {
  image(bytes(
    _ornament-svg.replace("currentColor", color.to-hex())),
    width: size,
    height: size,
  )
}


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// mosaic-card -- Card with geometric top border
#let mosaic-card(title, body, accent: palette.turquoise) = {
  block(
    width: 100%,
    fill: palette.paper,
    stroke: (top: 2.5pt + accent, rest: 0.5pt + accent.transparentize(70%)),
    inset: (x: 1em, top: 0.8em, bottom: 0.7em),
  )[
    #stack(spacing: .8em,
      text(size: typo.lead, weight: "bold", fill: palette.ink, title),
      [
        #set text(size: 12pt, fill: palette.ink-light, font: _sans-font)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// minaret-stat -- Tall stat card with gold number
#let minaret-stat(label, value, description: none) = {
  block(
    width: 100%,
    fill: palette.paper,
    stroke: (left: 3pt + palette.gold),
    inset: (x: 1em, y: 0.5em),
  )[
    #stack(spacing: .8em,
      text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 1.2pt,
        fill: palette.meta-color,
        font: _mono-font,
        upper(label),
      ),
      text(size: 36pt, weight: "bold", fill: palette.gold-text, value),
      if description != none {
        text(size: typo.body, fill: palette.ink-light, font: _sans-font, description)
      },
      lazy-v(1fr),
    )
  ]
}

/// arabesque-quote -- Quote with geometric side decoration
#let arabesque-quote(body, cite: none) = {
  block(width: 100%, stroke: (left: 3pt + palette.gold), inset: (left: 1em, right: 1em, y: 0.4em))[
    #stack(
      spacing: .8em,
      {
        set text(size: typo.lead, style: "italic", fill: palette.ink)
        body
      },
      if cite != none { text(
        size: typo.kicker-size,
        style: "normal",
        weight: "medium",
        fill: palette.meta-color,
        font: _mono-font,
        [-- #cite],
      ) },
    )
  ]
}

/// tile-tag -- Tag in jewel tone
#let tile-tag(body, color: palette.turquoise) = {
  box(
    fill: color.transparentize(85%),
    stroke: 0.5pt + color.transparentize(50%),
    inset: (x: 8pt, y: 4pt),
    radius: 2pt,
    text(size: 10pt, weight: "medium", fill: color.darken(30%), body),
  )
}

/// caravan-divider -- Geometric border strip divider
#let caravan-divider(color: palette.gold) = {
  block(width: 100%, inset: (y: 0.4em))[
    #std.align(center, border-strip(color: color, width: 80%, height: 16pt))
  ]
}

/// star-frame -- Image frame with geometric corner ornaments
#let star-frame(path, height: 180pt, caption: none) = {
  stack(
    spacing: .8em,
    block(
      width: 100%,
      height: height,
      clip: true,
      stroke: 1pt + palette.gold.transparentize(50%),
    )[
      #image(path, width: 100%, height: 100%, fit: "cover")
      #place(top + left, dx: 4pt, dy: 4pt, ornament-star(color: palette.gold, size: 14pt))
      #place(bottom + right, dx: -4pt, dy: -4pt, ornament-star(color: palette.gold, size: 14pt))
    ],
    if caption != none {
      text(size: typo.meta-size, fill: palette.meta-color, font: _mono-font, caption)
    },
  )
}


// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _light-header -- Standard header for light (ivory) slides
#let _light-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    // Chrome metadata line
    {
      set text(size: 8pt, fill: pal.meta-color, font: _mono-font)
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
    // Title
    {
      set text(fill: pal.ink, size: 1.5em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2pt, fill: pal.gold),
  )
}

/// _light-footer -- Standard footer for light slides
#let _light-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[SILK ROAD]
    },
    ornament-star(color: pal.gold, size: 8pt),
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Inverted header for dark (lapis) slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.paper.transparentize(40%), font: _mono-font)
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
  set text(fill: pal.paper.transparentize(40%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[SILK ROAD]
    },
    ornament-star(color: pal.gold, size: 8pt),
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

/// slide -- Standard LIGHT content slide with geometric star decorations
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _light-header(self)
  let footer(self) = _light-footer(self)
  let setting(body) = {
    let pal = self.store.palette
    // Geometric star decorations at low opacity in corners
    place(top + right, dx: -24pt, dy: 14pt,
      geometric-star(color: pal.gold.transparentize(52%), size: 80pt))
    place(bottom + left, dx: 14pt, dy: -14pt,
      geometric-star(color: pal.turquoise.transparentize(62%), size: 60pt))
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

/// dark-slide -- Lapis blue background, gold text, geometric patterns visible
#let dark-slide(
  title: auto,
  align: auto,
  ghost: none,
  ghost-dx: -20pt,
  ghost-dy: 10pt,
  ghost-size: 200pt,
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
    // Geometric star patterns visible on dark background
    place(top + right, dx: -28pt, dy: 14pt,
      geometric-star(color: pal.gold.transparentize(34%), size: 100pt))
    place(bottom + left, dx: 16pt, dy: -14pt,
      geometric-star(color: pal.turquoise.transparentize(45%), size: 70pt))
    // Ghost text if provided
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "bold", fill: pal.paper.transparentize(92%), ghost),
      )
    }
    set text(fill: pal.paper)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.lapis,
      header: header,
      footer: footer,
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Cover with geometric star header, gold accent lines, warm ivory bg
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))

    // Geometric star header decorations
    place(top + left, dx: 30pt, dy: 20pt,
      geometric-star(color: pal.gold.transparentize(40%), size: 90pt))
    place(top + right, dx: -30pt, dy: 20pt,
      geometric-star(color: pal.turquoise.transparentize(50%), size: 70pt))
    place(bottom + right, dx: -40pt, dy: -30pt,
      geometric-star(color: pal.gold.transparentize(50%), size: 80pt))

    // Border strip at top
    place(top + left, dy: 0pt,
      box(width: 100%, height: 22pt, clip: true,
        image(bytes(
          _border-strip-svg.replace("currentColor", pal.gold.to-hex())),
          width: 100%,
          height: 22pt,
          fit: "cover",
        ),
      ),
    )

    // Gold accent line at bottom
    place(bottom + left, block(width: 100%, height: 3pt, fill: pal.gold))

    // Title content
    set std.align(left + horizon)
    pad(x: 4em, y: 3em)[
      #if info.institution != none {
        text(
          size: 9pt,
          weight: "medium",
          tracking: 1.8pt,
          fill: pal.meta-color,
          font: _mono-font,
          upper(info.institution),
        )
        v(1em)
      }
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.5em)
      // Gold accent line under title
      #block(width: 80pt, height: 3pt, fill: pal.gold)
      #v(0.6em)
      #if info.subtitle != none {
        text(size: 18pt, weight: "regular", fill: pal.ink-light, info.subtitle)
        v(0.8em)
      }
      #{
        set text(size: 9pt, fill: pal.meta-color, font: _mono-font)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          box(baseline: 15%, ornament-star(color: pal.gold, size: 8pt))
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with geometric border strip and section numbering
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))

    // Geometric border strip at top
    place(top + left, dy: 0pt,
      box(width: 100%, height: 22pt, clip: true,
        image(bytes(
          _border-strip-svg.replace("currentColor", pal.gold.to-hex())),
          width: 100%,
          height: 22pt,
          fit: "cover",
        ),
      ),
    )

    // Large section number ghost
    place(top + right, dx: -70pt, dy: 64pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(text(fill: pal.ink.transparentize(90%), size: 128pt, weight: "bold", num-str))
      },
    )

    // Geometric star decoration
    place(bottom + left, dx: 30pt, dy: -30pt,
      geometric-star(color: pal.gold.transparentize(50%), size: 70pt))

    // Gold line at bottom
    place(bottom + left, block(width: 100%, height: 3pt, fill: pal.gold))

    pad(left: 4em, right: 6em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: 9pt,
        weight: "medium",
        tracking: 1.8pt,
        fill: pal.meta-color,
        font: _mono-font,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.8em)
      #{
        set text(fill: pal.ink, size: 2.2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.4em)
      #block(width: 60pt, height: 3pt, fill: pal.gold)
      #v(3fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Turquoise background, ivory text
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.turquoise.darken(10%),
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Geometric stars in corners
    place(top + left, dx: 10pt, dy: 18pt,
      geometric-star(color: pal.paper.transparentize(58%), size: 80pt))
    place(bottom + right, dx: -10pt, dy: -12pt,
      geometric-star(color: pal.gold.transparentize(38%), size: 70pt))
    // Border strip at top
    place(top + left,
      box(width: 100%, height: 18pt, clip: true,
        image(bytes(
          _border-strip-svg.replace("currentColor", pal.paper.transparentize(60%).to-hex())),
          width: 100%,
          height: 18pt,
          fit: "cover",
        ),
      ),
    )
    set text(fill: pal.paper, size: 1.6em, weight: "regular")
    std.align(center + horizon, block(width: 80%, inset: (x: 1em))[
      #set std.align(center)
      #body
    ])
  }
  touying-slide(self: self, main-body)
})

/// ending-slide -- Closing page with centered geometric star ornament
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.paper))

    // Border strip at top and bottom
    place(top + left, dy: 0pt,
      box(width: 100%, height: 22pt, clip: true,
        image(bytes(
          _border-strip-svg.replace("currentColor", pal.gold.to-hex())),
          width: 100%,
          height: 22pt,
          fit: "cover",
        ),
      ),
    )
    place(bottom + left, dy: 0pt,
      box(width: 100%, height: 22pt, clip: true,
        image(bytes(
          _border-strip-svg.replace("currentColor", pal.gold.to-hex())),
          width: 100%,
          height: 22pt,
          fit: "cover",
        ),
      ),
    )

    // Centered geometric star ornament
    place(center + horizon,
      geometric-star(color: pal.gold.transparentize(30%), size: 120pt))

    // Smaller surrounding stars
    place(center + horizon, dx: -80pt, dy: -60pt,
      geometric-star(color: pal.turquoise.transparentize(60%), size: 50pt))
    place(center + horizon, dx: 80pt, dy: 60pt,
      geometric-star(color: pal.turquoise.transparentize(60%), size: 50pt))

    set std.align(center + horizon)
    pad(x: 4em)[
      #v(1fr)
      #v(60pt)
      #text(size: 2.2em, weight: "bold", fill: pal.ink, body)
      #v(0.6em)
      #std.align(center, block(width: 60pt, height: 2pt, fill: pal.gold))
      #v(0.8em)
      #text(size: 8pt, fill: pal.meta-color, font: _mono-font, tracking: 1pt)[SILK ROAD]
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let silk-road-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "lapis",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.paper,
      margin: (top: 4em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.lapis,
      neutral-lightest: pal.paper,
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
