// Blueprint Theme -- Architectural blueprint / technical drawing Touying presentation theme
// Inspired by cyanotype process: blue backgrounds, white line-art, grid patterns, engineering precision.
// Two modes: "drawing" slides (blue bg, white ink) and "specification" slides (light bg, blue ink).
// 3 presets: classic, dark, invert
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================
// Each preset: bg (blueprint background), ink (line/text color), grid (grid line color), annotation (red-line color)

#let presets = (
  classic: (bg: rgb("#1E3F66"), ink: rgb("#FFFFFF"), grid: rgb("#FFFFFF"), annotation: rgb("#FF4444")),
  dark:    (bg: rgb("#0D1B2A"), ink: rgb("#4FC3F7"), grid: rgb("#4FC3F7"), annotation: rgb("#FF6B6B")),
  invert:  (bg: rgb("#F0F4F8"), ink: rgb("#1E3F66"), grid: rgb("#1E3F66"), annotation: rgb("#CC3333")),
)


// =====================================================================
// Palette Builder
// =====================================================================
// Derives full palette from preset name.

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let grid-color = p.grid
  let annotation = p.annotation
  (
    bg: bg,
    ink: ink,
    grid: grid-color,
    annotation: annotation,
    // Derived tones
    ink-light: ink.transparentize(25%),
    ink-muted: ink.transparentize(50%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(90%),
    // Grid variants
    grid-line: grid-color.transparentize(92%),
    grid-strong: grid-color.transparentize(80%),
    // Light mode (for specification/content slides)
    light-bg: rgb("#F0F4F8"),
    light-ink: rgb("#1E3F66"),
    light-muted: rgb("#1E3F66").transparentize(40%),
    light-faint: rgb("#1E3F66").transparentize(75%),
    // Surface
    surface: ink.transparentize(90%),
    divider: ink.transparentize(70%),
  )
}

// Default palette (classic)
#let palette = build-palette("classic")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 44pt,
  h1: 30pt,
  h2: 22pt,
  body: 16pt,
  kicker-size: 9pt,
  meta-size: 8pt,
)


// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _sans-font = "IBM Plex Sans"


// =====================================================================
// Blueprint Grid Background
// =====================================================================
// Places horizontal and vertical grid lines at low opacity

#let blueprint-grid(color: white, opacity: 8%, major-spacing: 36pt, minor-spacing: none) = {
  let c = color.transparentize(100% - opacity)
  let c-strong = color.transparentize(100% - opacity * 2.5)
  if minor-spacing != none {
    let c-minor = color.transparentize(100% - opacity * 0.45)
    for i in range(0, 50) {
      place(top + left, dy: i * minor-spacing,
        line(length: 100%, stroke: 0.2pt + c-minor))
    }
    for i in range(0, 70) {
      place(top + left, dx: i * minor-spacing,
        line(start: (0pt, 0pt), end: (0pt, 100%), stroke: 0.2pt + c-minor))
    }
  }
  // Major horizontal lines
  for i in range(0, 20) {
    place(top + left, dy: i * major-spacing,
      line(length: 100%, stroke: 0.3pt + c))
  }
  // Major vertical lines
  for i in range(0, 25) {
    place(top + left, dx: i * major-spacing,
      line(start: (0pt, 0pt), end: (0pt, 100%), stroke: 0.3pt + c))
  }
  // Stronger border frame
  place(center + horizon,
    rect(width: 100% - 36pt, height: 100% - 36pt, stroke: 0.6pt + c-strong))
}


// =====================================================================
// Compass Rose SVG
// =====================================================================

#let _compass-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="45" fill="none" stroke="white" stroke-width="1" opacity="0.3"/>
  <circle cx="50" cy="50" r="35" fill="none" stroke="white" stroke-width="0.5" opacity="0.2"/>
  <line x1="50" y1="5" x2="50" y2="95" stroke="white" stroke-width="0.5" opacity="0.3"/>
  <line x1="5" y1="50" x2="95" y2="50" stroke="white" stroke-width="0.5" opacity="0.3"/>
  <line x1="18" y1="18" x2="82" y2="82" stroke="white" stroke-width="0.3" opacity="0.2"/>
  <line x1="82" y1="18" x2="18" y2="82" stroke="white" stroke-width="0.3" opacity="0.2"/>
  <polygon points="50,8 46,22 54,22" fill="white" opacity="0.6"/>
  <polygon points="50,92 46,78 54,78" fill="white" opacity="0.3"/>
  <polygon points="8,50 22,46 22,54" fill="white" opacity="0.3"/>
  <polygon points="92,50 78,46 78,54" fill="white" opacity="0.3"/>
  <text x="50" y="5" text-anchor="middle" font-size="7" fill="white" opacity="0.5" font-family="monospace">N</text>
  <text x="50" y="99" text-anchor="middle" font-size="7" fill="white" opacity="0.4" font-family="monospace">S</text>
  <text x="97" y="52" text-anchor="middle" font-size="7" fill="white" opacity="0.4" font-family="monospace">E</text>
  <text x="3" y="52" text-anchor="middle" font-size="7" fill="white" opacity="0.4" font-family="monospace">W</text>
</svg>```.text

#let compass-rose(size: 100pt) = {
  image(bytes(_compass-svg), width: size)
}


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// dimension-line -- Decorative measurement line with arrows and label
#let dimension-line(label, width: 80pt, color: white) = {
  let c = color.transparentize(40%)
  block(width: width)[
    // Line with end marks
    // Coupled measurement geometry uses a fixed optical gap, not content rhythm.
    #stack(spacing: 2pt,
      {
        box(width: 100%)[
          #place(left + horizon, line(length: 100%, stroke: 0.5pt + c))
          #place(left + horizon, line(start: (0pt, -3pt), end: (0pt, 3pt), stroke: 0.5pt + c))
          #place(right + horizon, line(start: (0pt, -3pt), end: (0pt, 3pt), stroke: 0.5pt + c))
        ]
      },
      std.align(center, text(size: 6.5pt, fill: c, font: _mono-font, label)),
    )
  ]
}

/// spec-card -- White background card with thin blue border for technical specs
#let spec-card(title, body) = {
  block(
    width: 100%,
    fill: white,
    stroke: 1pt + rgb("#1E3F66").transparentize(30%),
    inset: (x: 0.8em, y: 0.6em),
  )[
    #stack(spacing: .8em,
      [#text(size: typo.kicker-size, weight: "bold", tracking: 1pt, fill: rgb("#1E3F66"), font: _mono-font, upper(title))],
      [#set text(size: 13pt, fill: rgb("#1E3F66").transparentize(20%))
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// drawing-note -- Callout styled like a drawing annotation
#let drawing-note(body, color: white, background: rgb("#1E3F66")) = {
  let c = color.transparentize(20%)
  block(
    width: 100%,
    fill: background,
    stroke: (left: 2pt + c),
    inset: (left: 0.8em, y: 0.3em),
  )[
    #set text(size: 12pt, fill: c, font: _mono-font)
    #body
    #lazy-v(1fr)
  ]
}

/// revision-mark -- Small red annotation mark for emphasis
#let revision-mark(body) = {
  box(
    inset: (x: 0.3em, y: 0.1em),
    stroke: 1pt + rgb("#FF4444"),
    radius: 1pt,
  )[
    #text(size: typo.meta-size, weight: "bold", fill: rgb("#FF4444"), font: _mono-font, body)
  ]
}

/// title-block -- Like the title block on architectural drawings
#let title-block(
  project,
  number: none,
  date: none,
  scale-text: none,
  background: rgb("#1E3F66"),
) = {
  block(
    width: 100%,
    fill: background,
    stroke: 1pt + white.transparentize(40%),
    inset: (x: 0.8em, y: 0.5em),
  )[
    #set text(fill: white, font: _mono-font)
    #grid(columns: (1fr, auto),
      {
        text(size: 7pt, fill: white.transparentize(40%), tracking: 1pt)[PROJECT:]
        linebreak()
        text(size: 14pt, weight: "bold", project)
      },
      {
        set text(size: 7pt, fill: white.transparentize(40%))
        if number != none [DWG: #number \ ]
        if date != none [DATE: #date \ ]
        if scale-text != none [SCALE: #scale-text]
      },
    )
  ]
}

/// _grid-stat-icon -- Technical target mark used by grid-stat
#let _grid-stat-icon(color) = {
  block(width: 18pt, height: 18pt)[
    #place(center + horizon,
      circle(radius: 6pt, stroke: 0.7pt + color.transparentize(35%)))
    #place(center + horizon,
      circle(radius: 1.5pt, fill: color))
  ]
}

/// grid-stat -- Centered technical KPI: icon, value, then label
#let grid-stat(
  value,
  label,
  icon: auto,
  color: white,
  background: rgb("#1E3F66"),
) = {
  let resolved-icon = if icon == auto { _grid-stat-icon(color) } else { icon }
  block(
    width: 100%,
    fill: background,
    stroke: 0.5pt + color.transparentize(78%),
    inset: (x: 0.5em, y: 0.55em),
  )[
    #std.align(center, stack(
      spacing: .8em,
      resolved-icon,
      text(size: 34pt, weight: "bold", fill: color, font: _mono-font, value),
      text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 1pt,
        fill: color.transparentize(40%),
        font: _mono-font,
        upper(label),
      ),
      lazy-v(1fr),
    ))
  ]
}

/// blueprint-kicker -- Small tracked uppercase label
#let blueprint-kicker(body, color: white) = {
  text(
    size: typo.kicker-size,
    weight: "medium",
    tracking: 1.8pt,
    fill: color.transparentize(40%),
    font: _mono-font,
    upper(body),
  )
}


// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _light-header -- Header for light/specification slides
#let _light-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  // Meta line
  stack(
    spacing: 1em,
    {
      set text(size: 8pt, fill: pal.light-muted, font: _mono-font, tracking: 0.5pt)
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
      set text(fill: pal.light-ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2pt, fill: pal.light-ink),
  )
}

/// _light-footer -- Footer for light slides
#let _light-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.light-muted, size: 0.6em, font: _mono-font)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[SPECIFICATION]
    },
    block(width: 4pt, height: 4pt, fill: pal.light-ink.transparentize(60%)),
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for blueprint (dark/drawing) slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
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

/// _dark-footer -- Footer for blueprint slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.ink-muted, size: 0.6em, font: _mono-font)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[DRAWING]
    },
    block(width: 4pt, height: 4pt, fill: pal.ink.transparentize(60%)),
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard LIGHT content slide (specification mode)
/// Blue text on light background for readability
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _light-header(self)
  let footer(self) = _light-footer(self)
  let setting(body) = {
    blueprint-grid(
      color: pal.light-ink,
      opacity: 2%,
      major-spacing: 36pt,
      minor-spacing: 18pt,
    )
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: self.store.palette.light-bg,
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Blueprint blue background with white grid and white text
/// "Drawing" mode slide
#let dark-slide(
  title: auto,
  align: auto,
  show-grid: true,
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
    // Grid background
    if show-grid {
      blueprint-grid(color: pal.ink, opacity: 8%)
    }
    // Title display
    if self.store.title != none and self.store.title != auto {
      stack(
        spacing: .8em,
        text(
          size: 1.4em,
          weight: "bold",
          fill: pal.ink,
          font: _mono-font,
          utils.call-or-display(self, self.store.title),
        ),
        block(width: 50pt, height: 1.5pt, fill: pal.ink.transparentize(40%)),
      )
      v(0.5em)
    }
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      header: header,
      footer: footer,
      margin: (top: 2.1em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Blueprint blue bg, compass rose, PROJECT: label
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Blueprint blue background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Grid
    blueprint-grid(color: pal.ink, opacity: 8%)
    // Compass rose top-right
    place(top + right, dx: -30pt, dy: 20pt, compass-rose(size: 120pt))
    // Dimension marks as decoration
    place(bottom + left, dx: 40pt, dy: -50pt,
      dimension-line(width: 60pt, color: pal.ink)[420 mm])
    place(bottom + right, dx: -60pt, dy: -50pt,
      dimension-line(width: 50pt, color: pal.ink)[297 mm])
    // Small red accent mark
    place(top + left, dx: 30pt, dy: 25pt,
      text(size: 7pt, fill: pal.annotation, font: _mono-font)[REV.A])
    // Content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 3em)[
      #stack(
        spacing: .8em,
        text(
          size: typo.kicker-size,
          weight: "medium",
          tracking: 2pt,
          fill: pal.ink.transparentize(40%),
          font: _mono-font,
          [PROJECT:],
        ),
        text(size: typo.display, weight: "bold", fill: pal.ink, info.title),
        block(width: 80pt, height: 2pt, fill: pal.ink.transparentize(30%)),
        if info.subtitle != none {
          text(size: typo.h2, weight: "regular", fill: pal.ink-light, info.subtitle)
        },
        {
          set text(size: 9pt, fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
          if info.author != none {
            upper[#info.author]
          }
          if info.author != none and info.date != none {
            h(1.5em)
            text(fill: pal.ink.transparentize(60%))[|]
            h(1.5em)
          }
          if info.date != none {
            utils.display-info-date(self)
          }
        },
      )
    ]
    // Bottom border line
    place(bottom + left, dy: -18pt,
      block(width: 100%, height: 0.5pt, fill: pal.ink.transparentize(70%)))
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with large number and grid
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Grid
    blueprint-grid(color: pal.ink, opacity: 8%)
    // Large section number in technical style
    place(top + right, dx: -50pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink.transparentize(80%), size: 140pt, weight: "bold", font: _mono-font, num-str)
      },
    )
    // Content
    pad(left: 3.5em, right: 5em, top: 3.5em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: .8em,
        text(
          size: typo.kicker-size,
          weight: "medium",
          tracking: 2pt,
          fill: pal.ink-muted,
          font: _mono-font,
        )[SECTION #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }],
        {
          set text(fill: pal.ink, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 60pt, height: 1.5pt, fill: pal.ink.transparentize(40%)),
      )
      #v(3fr)
    ]
    // Bottom border
    place(bottom + left, dy: -18pt,
      block(width: 100%, height: 0.5pt, fill: pal.ink.transparentize(70%)))
    // Footer annotation
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.ink-muted, size: 7pt, font: _mono-font, tracking: 0.5pt)[DRAWING SET],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Blueprint blue bg, centered white bold text, grid background
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: 0pt,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Grid
    blueprint-grid(color: pal.ink, opacity: 6%)
    // Border frame
    place(center + horizon,
      rect(width: 100% - 48pt, height: 100% - 48pt, stroke: 0.5pt + pal.ink.transparentize(60%)))
    set text(fill: pal.ink, size: 1.6em, weight: "bold")
    set std.align(horizon + center)
    pad(x: 4em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- "END OF DRAWINGS" in technical style
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Grid
    blueprint-grid(color: pal.ink, opacity: 6%)
    // Ghost text
    place(center + horizon,
      text(size: 120pt, weight: "bold", fill: pal.ink.transparentize(92%), font: _mono-font, [END]),
    )
    // Dimension marks as decoration
    place(top + left, dx: 60pt, dy: 60pt,
      dimension-line(width: 80pt, color: pal.ink)[841.89 pt])
    place(bottom + right, dx: -80pt, dy: -60pt,
      dimension-line(width: 70pt, color: pal.ink)[473.56 pt])
    // Content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: 0.8em,
        text(
          size: typo.kicker-size,
          weight: "medium",
          tracking: 2pt,
          fill: pal.ink-muted,
          font: _mono-font,
          [END OF DRAWINGS],
        ),
        block(width: 60pt, height: 1pt, fill: pal.ink.transparentize(50%)),
        text(size: 2em, weight: "bold", fill: pal.ink, body),
        block(width: 40pt, height: 1pt, fill: pal.ink.transparentize(50%)),
        text(size: 8pt, fill: pal.ink-muted, font: _mono-font, tracking: 1pt)[BLUEPRINT],
      )
    ]
    // Bottom border
    place(bottom + left, dy: -18pt,
      block(width: 100%, height: 0.5pt, fill: pal.ink.transparentize(70%)))
  }
  touying-slide(self: self, main-body)
})

/// hero-slide -- Full-bleed with overlay
#let hero-slide(background-image: none, scrim: true, ..args) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    if background-image != none {
      place(top + left, image(background-image, width: 100%, height: 100%, fit: "cover"))
    } else {
      blueprint-grid(color: pal.ink, opacity: 8%, minor-spacing: 18pt)
    }
    if scrim {
      place(bottom + left,
        block(width: 100%, height: 60%,
          fill: gradient.linear(
            pal.bg.transparentize(100%),
            pal.bg.transparentize(30%),
            pal.bg.transparentize(5%),
            angle: 180deg,
          ),
        ),
      )
    }
    args.pos().join()
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let blueprint-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "classic",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.light-ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.light-bg,
      margin: (top: 5.5em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.bg,
      neutral-lightest: pal.ink,
      neutral-darkest: pal.light-ink,
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
