// Aurora Prism Theme — Northern lights refracted through crystal
// Pure white background, sharp indigo accent, rainbow-gradient aurora bar
// Clean, restrained, information-dense academic conference style (ICML/NeurIPS oral)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FFFFFF"),
  ink: rgb("#212121"),
  accent: rgb("#3F51B5"),
  ink-muted: rgb("#757575"),
  accent-light: rgb("#3F51B5").transparentize(90%),
  border-light: rgb("#E0E0E0"),
)


// ═══ SVG Definitions ═══

// Aurora gradient bar — horizontal rainbow gradient (blue→indigo→violet→magenta→rose→amber)
#let _aurora-bar-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="10" viewBox="0 0 800 10">
  <defs>
    <linearGradient id="aurora" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#1565C0" stop-opacity="0.9"/>
      <stop offset="12%" stop-color="#283593" stop-opacity="0.95"/>
      <stop offset="25%" stop-color="#3F51B5" stop-opacity="1"/>
      <stop offset="38%" stop-color="#5C6BC0" stop-opacity="0.95"/>
      <stop offset="50%" stop-color="#7B1FA2" stop-opacity="0.9"/>
      <stop offset="62%" stop-color="#AD1457" stop-opacity="0.85"/>
      <stop offset="75%" stop-color="#E91E63" stop-opacity="0.8"/>
      <stop offset="87%" stop-color="#FF6F00" stop-opacity="0.85"/>
      <stop offset="100%" stop-color="#FFB300" stop-opacity="0.9"/>
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="800" height="10" fill="url(#aurora)"/>
</svg>
```.text

// Geometric crystal pattern — angular facets for title/ending decoration
#let _crystal-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="60" viewBox="0 0 800 60">
  <defs>
    <linearGradient id="crystal-grad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#1565C0" stop-opacity="0.7"/>
      <stop offset="15%" stop-color="#283593" stop-opacity="0.8"/>
      <stop offset="30%" stop-color="#3F51B5" stop-opacity="0.9"/>
      <stop offset="45%" stop-color="#5C6BC0" stop-opacity="0.85"/>
      <stop offset="55%" stop-color="#7B1FA2" stop-opacity="0.8"/>
      <stop offset="70%" stop-color="#AD1457" stop-opacity="0.7"/>
      <stop offset="82%" stop-color="#E91E63" stop-opacity="0.65"/>
      <stop offset="92%" stop-color="#FF6F00" stop-opacity="0.7"/>
      <stop offset="100%" stop-color="#FFB300" stop-opacity="0.75"/>
    </linearGradient>
  </defs>
  <polygon points="0,0 120,0 80,60 0,60" fill="url(#crystal-grad)" opacity="0.3"/>
  <polygon points="80,60 120,0 240,0 200,60" fill="url(#crystal-grad)" opacity="0.5"/>
  <polygon points="200,60 240,0 360,0 320,60" fill="url(#crystal-grad)" opacity="0.7"/>
  <polygon points="320,60 360,0 500,0 460,60" fill="url(#crystal-grad)" opacity="0.9"/>
  <polygon points="460,60 500,0 620,0 580,60" fill="url(#crystal-grad)" opacity="0.7"/>
  <polygon points="580,60 620,0 720,0 700,60" fill="url(#crystal-grad)" opacity="0.5"/>
  <polygon points="700,60 720,0 800,0 800,60" fill="url(#crystal-grad)" opacity="0.3"/>
  <line x1="120" y1="0" x2="80" y2="60" stroke="#FFFFFF" stroke-width="1" opacity="0.4"/>
  <line x1="240" y1="0" x2="200" y2="60" stroke="#FFFFFF" stroke-width="1" opacity="0.4"/>
  <line x1="360" y1="0" x2="320" y2="60" stroke="#FFFFFF" stroke-width="1" opacity="0.4"/>
  <line x1="500" y1="0" x2="460" y2="60" stroke="#FFFFFF" stroke-width="1" opacity="0.4"/>
  <line x1="620" y1="0" x2="580" y2="60" stroke="#FFFFFF" stroke-width="1" opacity="0.4"/>
  <line x1="720" y1="0" x2="700" y2="60" stroke="#FFFFFF" stroke-width="1" opacity="0.4"/>
</svg>
```.text


// ═══ SVG Rendering Helpers ═══

/// Render the aurora gradient bar at a given height
#let aurora-bar(height: 5pt) = {
  image(bytes(_aurora-bar-svg), width: 100%, height: height)
}

/// Render the crystal geometric band
#let crystal-band(height: 40pt) = {
  image(bytes(_crystal-pattern-svg), width: 100%, height: height)
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — white bg, aurora gradient bar at top, indigo title
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 0pt, top: 0pt, bottom: 0pt))
    stack(
      spacing: 0pt,
      // Aurora gradient bar at very top
      box(width: 100%, aurora-bar(height: 5pt)),
      // Title area
      pad(x: 2em, top: 0.5em, bottom: 0.2em)[
        #stack(
          spacing: .8em,
          {
            set text(fill: palette.accent, size: 1.3em, weight: "bold")
            if self.store.title != none {
              utils.call-or-display(self, self.store.title)
            } else {
              utils.display-current-heading(level: 2)
            }
          },
          line(length: 60pt, stroke: 1.5pt + palette.accent),
        )
      ],
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.65em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      std.align(right, context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]),
    )
  }
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

/// Title slide — crystal geometric band, clean centered layout
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Crystal band at top
    place(top + left, box(width: 100%, crystal-band(height: 50pt)))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #text(size: 2.2em, weight: "bold", fill: palette.ink, info.title)
      #v(0.4em)
      #line(length: 80pt, stroke: 2pt + palette.accent)
      #v(0.6em)
      #if info.subtitle != none {
        text(size: 1em, fill: palette.ink-muted, info.subtitle)
        v(0.5em)
      }
      #if info.author != none {
        text(size: 1em, fill: palette.ink, weight: "regular", info.author)
        v(0.2em)
      }
      #if info.institution != none {
        text(size: 0.8em, fill: palette.ink-muted, info.institution)
        v(0.2em)
      }
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.accent)[#utils.display-info-date(self)]
      }
    ]
    // Aurora bar at bottom
    place(bottom + left, box(width: 100%, aurora-bar(height: 5pt)))
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// New section slide — clean, indigo section number with aurora bar
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Aurora bar at top
    place(top + left, box(width: 100%, aurora-bar(height: 5pt)))
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #text(size: 3em, fill: palette.accent, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "01")
      ]
      #v(0.3em)
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      #line(length: 100pt, stroke: 2pt + palette.accent)
      #v(1fr)
    ]
    // Aurora bar at bottom
    place(bottom + left, box(width: 100%, aurora-bar(height: 5pt)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — single statement, centered, width-constrained
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Aurora bar at top
    place(top + left, box(width: 100%, aurora-bar(height: 5pt)))
    // Center content — width constrained
    place(center + horizon,
      block(width: 70%, height: auto,
        align(center)[
          #set text(fill: palette.ink, size: 1.4em, weight: "bold")
          #body
          #v(0.5em)
          #line(length: 100pt, stroke: 2pt + palette.accent)
        ]
      )
    )
    // Aurora bar at bottom
    place(bottom + left, box(width: 100%, aurora-bar(height: 5pt)))
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — crystal band + thank you
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Crystal band at top
    place(top + left, box(width: 100%, crystal-band(height: 50pt)))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #text(size: 2.4em, weight: "bold", fill: palette.ink, body)
      #v(0.4em)
      #line(length: 80pt, stroke: 2pt + palette.accent)
    ]
    // Crystal band at bottom
    place(bottom + left, box(width: 100%, crystal-band(height: 50pt)))
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Prism card — clean card with indigo left border + category label, no background fill
#let prism-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: none,
    stroke: (left: 3pt + accent, rest: 0.5pt + palette.border-light),
    inset: (x: 1em, y: 0.8em),
    radius: 2pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.85em, title),
      [
      #set text(fill: palette.ink, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Aurora stat — large number with thin colored underline (SVG gradient), no box
#let aurora-stat(label, value, color: palette.accent) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #set text(fill: palette.ink-muted, size: 0.72em)
    #stack(
      spacing: .8em,
      label,
      stack(
        spacing: .8em,
        text(fill: color, size: 1.8em, weight: "bold", value),
        box(width: 100%, aurora-bar(height: 2pt)),
        lazy-v(1fr),
      ),
    )
  ]
}

/// Refraction highlight — block with rainbow-gradient top edge (3pt) + light indigo fill
#let refraction-highlight(body) = {
  block(width: 100%)[
    #box(width: 100%, aurora-bar(height: 3pt))
    #block(
      width: 100%,
      fill: palette.accent-light,
      inset: (x: 1.2em, y: 0.8em),
      radius: (bottom: 2pt),
    )[
      #set text(fill: palette.ink, size: 0.85em)
      #body
    ]
  ]
}

/// Beam tag — inline pill badge with indigo fill
#let beam-tag(label, color: palette.accent) = {
  box(
    fill: color,
    inset: (x: 8pt, y: 3pt),
    radius: 10pt,
  )[
    #text(fill: white, size: 0.72em, weight: "semibold", label)
  ]
}

/// Spectrum divider — SVG gradient horizontal line (aurora rainbow colors)
#let spectrum-divider() = {
  v(6pt)
  box(width: 100%, aurora-bar(height: 2pt))
  v(6pt)
}

/// Crystal quote — left border is rainbow gradient SVG, content is italic
#let crystal-quote(quote, author: none) = {
  block(width: 100%)[
    #grid(columns: (3pt, 1fr), gutter: 0pt,
      box(width: 3pt, height: 100%, image(bytes(_aurora-bar-svg.replace("width=\"800\" height=\"10\" viewBox=\"0 0 800 10\"", "width=\"10\" height=\"800\" viewBox=\"0 0 10 800\"").replace("x1=\"0%\" y1=\"0%\" x2=\"100%\" y2=\"0%\"", "x1=\"0%\" y1=\"0%\" x2=\"0%\" y2=\"100%\"")), width: 3pt, height: 100%)),
      block(inset: (left: 1em, y: 0.5em))[
        #set text(fill: palette.ink, size: 0.88em, style: "italic")
        #quote
        #if author != none {
          v(0.3em)
          set text(fill: palette.accent, size: 0.8em, weight: "bold", style: "normal")
          [-- #author]
        }
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Data panel — white card with subtle shadow stroke, for charts
#let data-panel(title: none, body) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: 0.8pt + palette.border-light,
    inset: (x: 1.2em, y: 1em),
    radius: 3pt,
  )[
    #if title != none {
      text(weight: "bold", fill: palette.accent, size: 0.85em, title)
      v(6pt)
    }
    #body
  ]
}


// ═══ 3. Theme Entry Point ═══

#let aurora-prism-theme(
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
      paper: "presentation-" + aspect-ratio,
      header-ascent: 0pt,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.ink,
      neutral-darkest: palette.bg,
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
