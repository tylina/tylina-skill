// Swiss Grid Theme — International Typographic Style (Swiss Design) for Touying
// Strict mathematical grid systems. Asymmetric layouts with strong alignment.
// Large sans-serif headings flush-left. Generous whitespace as a design element.
// Red as sole accent against white/black. Influenced by Josef Mueller-Brockmann.
// The grid is visible as a design element - thin gray grid lines appear as background.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// === Color Palette ===

#let palette = (
  bg: rgb("#FFFFFF"),
  ink: rgb("#1A1A1A"),
  accent: rgb("#FF0000"),
  grid-line: rgb("#E5E5E5"),
  ink-light: rgb("#1A1A1A").transparentize(70%),
  ink-muted: rgb("#1A1A1A").transparentize(50%),
)

// === SVG Elements ===

// 1. Grid background pattern: 6x4 grid of thin gray lines
#let _grid-bg-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none"><g stroke="#E5E5E5" stroke-width="0.5" fill="none"><line x1="160" y1="0" x2="160" y2="540"/><line x1="320" y1="0" x2="320" y2="540"/><line x1="480" y1="0" x2="480" y2="540"/><line x1="640" y1="0" x2="640" y2="540"/><line x1="800" y1="0" x2="800" y2="540"/><line x1="0" y1="135" x2="960" y2="135"/><line x1="0" y1="270" x2="960" y2="270"/><line x1="0" y1="405" x2="960" y2="405"/></g></svg>```.text

// 2. Geometric circle element: perfect circle in red, accent punctuation
#let _red-circle-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 60"><circle cx="30" cy="30" r="28" fill="#FF0000"/></svg>```.text

// 3. Asymmetric composition element: overlapping rectangles suggesting grid layout
#let _asymmetric-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 120"><rect x="0" y="20" width="80" height="80" fill="none" stroke="#1A1A1A" stroke-width="1"/><rect x="60" y="40" width="100" height="60" fill="none" stroke="#FF0000" stroke-width="1"/><rect x="130" y="10" width="60" height="40" fill="#E5E5E5"/></svg>```.text

// === Helper Functions ===

/// Grid background image element (placed behind content)
#let grid-background() = {
  place(top + left,
    image(bytes(_grid-bg-svg), width: 100%, height: 100%)
  )
}

/// Red circle accent (inline, configurable size)
#let red-circle(size: 24pt) = {
  box(baseline: 20%, image(bytes(_red-circle-svg), width: size, height: size))
}

/// Asymmetric composition decoration
#let asymmetric-decoration(width: 160pt) = {
  image(bytes(_asymmetric-svg), width: width)
}

// === Reusable Components ===

/// grid-card: Card with visible thin border aligned to grid, optional red top-accent line
#let grid-card(title, body, accent-top: false) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (
      top: if accent-top { 3pt + palette.accent } else { 0.5pt + palette.ink },
      rest: 0.5pt + palette.ink,
    ),
    inset: (x: 1em, y: 0.8em),
  )[
    #stack(spacing: .8em,
      text(size: 0.85em, weight: "bold", fill: palette.ink, title),
      {
        set text(size: 0.8em, fill: palette.ink-muted)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// swiss-stat: Centered red indicator, large value, and uppercase caption
#let swiss-stat(value, caption) = {
  block(width: 100%, fill: palette.bg, inset: (x: 0.3em, y: 0.2em))[
    #set std.align(center)
    #stack(spacing: .8em,
      circle(radius: 3.5pt, fill: palette.accent),
      text(size: 2em, weight: "bold", fill: palette.ink, value),
      text(size: 0.65em, fill: palette.ink-muted, upper(caption)),
      lazy-v(1fr),
    )
  ]
}

/// swiss-quote: Large quotation with oversized red opening quote mark
#let swiss-quote(body, attribution: none) = {
  block(width: 100%, inset: (x: 1em, y: 0.5em))[
    #stack(spacing: .8em,
      {
        text(size: 4em, fill: palette.accent, weight: "bold", baseline: -0.2em)["]
        h(-0.3em)
        text(size: 1.2em, fill: palette.ink, style: "italic", body)
      },
      if attribution != none {
        text(size: 0.7em, fill: palette.ink-muted)[\u{2014} #attribution]
      },
    )
  ]
}

/// rule-divider: Thin black horizontal rule (1pt) spanning full width
#let rule-divider() = {
  block(
    width: 100%,
    inset: (y: 0.4em),
    line(length: 100%, stroke: 1pt + palette.ink),
  )
}

/// index-label: Small all-caps label with tracking, for categorization
#let index-label(body) = {
  text(size: 0.6em, fill: palette.ink-muted, tracking: 2pt, weight: "medium", upper(body))
}

/// color-swatch: Swiss palette sample with label, color field, and code
#let color-swatch(label, color, code, outline: false) = {
  block(width: 100%)[
    #stack(spacing: .8em,
      index-label(label),
      block(
        width: 100%,
        height: 40pt,
        fill: color,
        stroke: if outline { 0.5pt + palette.grid-line } else { none },
      ),
      text(size: 0.7em, fill: palette.ink-muted, code),
    )
  ]
}

/// poster-block: Large text block with asymmetric placement (left-aligned, large type)
#let poster-block(body, size: 1.4em) = {
  block(width: 100%, inset: (y: 0.2em))[
    #set text(size: size, weight: "bold", fill: palette.ink)
    #set par(leading: 0.5em)
    #body
  ]
}

// === Slide Functions ===

/// slide: white bg, subtle grid background SVG, content flush-left
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.ink, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      line(length: 100%, stroke: 1pt + palette.ink),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        box(circle(radius: 2.5pt, fill: palette.accent))
      },
      {
        set std.align(right)
        context { text(fill: palette.ink-muted, size: 0.85em)[#utils.slide-counter.display() / #utils.last-slide-number] }
      }
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    // Grid background
    grid-background()
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

/// title-slide: enormous flush-left title, red circle accent, author small at bottom
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Grid background
    grid-background()
    // Red circle accent — top right area
    place(top + right, dx: -60pt, dy: 60pt,
      image(bytes(_red-circle-svg), width: 80pt, height: 80pt)
    )
    // Asymmetric decoration — bottom right
    place(bottom + right, dx: -40pt, dy: -60pt,
      image(bytes(_asymmetric-svg), width: 140pt)
    )
    // Main content flush-left
    set std.align(left + horizon)
    pad(left: 4em, right: 6em, top: 3em, bottom: 3em)[
      #stack(spacing: .8em,
        stack(spacing: 1em,
          index-label[Presentation],
          {
            set par(leading: 0.6em)
            text(size: 3em, weight: "medium", fill: palette.ink, info.title)
          },
        ),
        line(length: 80pt, stroke: 2pt + palette.accent),
        if info.subtitle != none {
          text(size: 1.1em, fill: palette.ink-muted, info.subtitle)
        },
        // Elastic normal-flow spacer keeps metadata at the lower edge.
        v(1fr),
        stack(dir: ltr, spacing: 2em,
          if info.author != none {
            text(size: 0.8em, fill: palette.ink-muted, info.author)
          },
          if info.date != none {
            text(size: 0.7em, fill: palette.ink-light, utils.display-info-date(self))
          },
        ),
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide: section number huge in red, title flush-left, grid bg
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Grid background
    grid-background()
    // Large section number in red (top-left)
    place(top + left, dx: 3em, dy: 2em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 8em, weight: "medium", fill: palette.accent, num-str)
      }
    )
    // Keep the title in normal flow so diagnostics can measure the slide.
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      #block(width: 60%)[
        #set std.align(left)
        #stack(spacing: .8em,
          index-label[Section],
          {
            set text(size: 2.4em, weight: "medium", fill: palette.ink)
            utils.display-current-heading(level: 1, numbered: false)
          },
          line(length: 60pt, stroke: 1.5pt + palette.accent),
        )
      ]
    ]
    // Red circle — bottom right accent
    place(bottom + right, dx: -80pt, dy: -60pt,
      image(bytes(_red-circle-svg), width: 40pt, height: 40pt)
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide: white bg, single large black text, red period at end
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Grid background
    grid-background()
    set text(fill: palette.ink, size: 2.2em, weight: "medium")
    set std.align(center + horizon)
    block(width: 80%, inset: (x: 1em))[
      #set par(leading: 0.6em)
      #body#text(fill: palette.accent)[.]
    ]
  }
  touying-slide(self: self, main-body)
})

/// ending-slide: minimal "Danke" flush-left, red dot, grid visible
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Grid background visible
    grid-background()
    // Content flush-left, vertically centered
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      #stack(spacing: 1em,
        stack(dir: ltr, spacing: 0.3em,
          text(size: 4em, weight: "medium", fill: palette.ink, body),
          red-circle(size: 20pt),
        ),
        line(length: 120pt, stroke: 1pt + palette.ink),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

// === Theme Entry Point ===

#let swiss-grid-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  set par(leading: 0.8em)
  set heading(numbering: "1.")

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.bg,
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
