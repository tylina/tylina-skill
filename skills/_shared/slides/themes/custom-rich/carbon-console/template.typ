// Carbon Console Theme — Premium dark terminal aesthetic for tech talks
// Deep charcoal background with phosphor green/amber accents
// Circuit trace SVG atmosphere, server-panel borders, monospace accents
// Perfect for engineering presentations, internal tech talks, architecture reviews
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#1A1B26"),
  ink: rgb("#C9D1D9"),
  green: rgb("#3FB950"),
  amber: rgb("#D29922"),
  red: rgb("#F85149"),
  red-text: rgb("#FF7B72"),
  card-bg: rgb("#21222C"),
  border: rgb("#30363D"),
  ink-muted: rgb("#8B949E"),
  bg-elevated: rgb("#282A36"),
  cyan: rgb("#58A6FF"),
)

#let terminal-font = ("IBM Plex Mono", "DejaVu Sans Mono")


// ═══ SVG Definitions ═══

// Circuit-trace background — subtle lines with nodes at intersections
// Provides persistent atmosphere on content slides
#let _circuit-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Horizontal traces -->
  <path d="M0,60 H120 L130,70 H250" fill="none" stroke="#3FB950" stroke-width="0.8" opacity="0.08"/>
  <path d="M600,90 H700 L710,80 H840" fill="none" stroke="#3FB950" stroke-width="0.6" opacity="0.06"/>
  <path d="M0,180 H80 L90,190 H200 L210,180 H340" fill="none" stroke="#3FB950" stroke-width="0.7" opacity="0.07"/>
  <path d="M500,200 H580 L590,210 H700 L710,200 H840" fill="none" stroke="#3FB950" stroke-width="0.6" opacity="0.05"/>
  <path d="M0,300 H60 L70,310 H180" fill="none" stroke="#3FB950" stroke-width="0.8" opacity="0.09"/>
  <path d="M650,320 H750 L760,310 H840" fill="none" stroke="#3FB950" stroke-width="0.6" opacity="0.06"/>
  <path d="M0,400 H100 L110,410 H220" fill="none" stroke="#D29922" stroke-width="0.6" opacity="0.05"/>
  <path d="M550,420 H660 L670,410 H840" fill="none" stroke="#D29922" stroke-width="0.5" opacity="0.04"/>
  <!-- Vertical traces -->
  <path d="M200,0 V80 L210,90 V180" fill="none" stroke="#3FB950" stroke-width="0.6" opacity="0.06"/>
  <path d="M400,0 V60 L410,70 V150" fill="none" stroke="#3FB950" stroke-width="0.7" opacity="0.07"/>
  <path d="M650,0 V100 L660,110 V200" fill="none" stroke="#3FB950" stroke-width="0.5" opacity="0.05"/>
  <path d="M150,280 V360 L160,370 V474" fill="none" stroke="#3FB950" stroke-width="0.6" opacity="0.06"/>
  <path d="M750,250 V350 L760,360 V474" fill="none" stroke="#D29922" stroke-width="0.5" opacity="0.04"/>
  <!-- Nodes at intersections -->
  <circle cx="120" cy="60" r="2.5" fill="#3FB950" opacity="0.12"/>
  <circle cx="250" cy="70" r="2" fill="#3FB950" opacity="0.10"/>
  <circle cx="200" cy="80" r="2.5" fill="#3FB950" opacity="0.11"/>
  <circle cx="400" cy="60" r="3" fill="#3FB950" opacity="0.13"/>
  <circle cx="340" cy="180" r="2" fill="#3FB950" opacity="0.09"/>
  <circle cx="700" cy="90" r="2" fill="#3FB950" opacity="0.08"/>
  <circle cx="180" cy="300" r="2.5" fill="#3FB950" opacity="0.10"/>
  <circle cx="650" cy="320" r="2" fill="#3FB950" opacity="0.08"/>
  <circle cx="150" cy="360" r="2" fill="#3FB950" opacity="0.09"/>
  <circle cx="750" cy="350" r="2" fill="#D29922" opacity="0.07"/>
  <circle cx="660" cy="110" r="2.5" fill="#3FB950" opacity="0.10"/>
  <circle cx="580" cy="200" r="2" fill="#3FB950" opacity="0.08"/>
</svg>```.text

// Server-panel frame — rectangular with ventilation-slot marks for title/ending
#let _server-panel-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Outer panel frame -->
  <rect x="20" y="16" width="800" height="442" fill="none" stroke="#30363D" stroke-width="2.5" rx="4"/>
  <!-- Inner bezel -->
  <rect x="28" y="24" width="784" height="426" fill="none" stroke="#3FB950" stroke-width="0.8" rx="2" opacity="0.4"/>
  <!-- Top ventilation slots -->
  <rect x="60" y="8" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="100" y="8" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="140" y="8" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="670" y="8" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="710" y="8" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="750" y="8" width="30" height="4" fill="#30363D" rx="2"/>
  <!-- Bottom ventilation slots -->
  <rect x="60" y="462" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="100" y="462" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="140" y="462" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="670" y="462" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="710" y="462" width="30" height="4" fill="#30363D" rx="2"/>
  <rect x="750" y="462" width="30" height="4" fill="#30363D" rx="2"/>
  <!-- Side rack screw holes -->
  <circle cx="36" cy="40" r="4" fill="none" stroke="#30363D" stroke-width="1.5"/>
  <circle cx="36" cy="434" r="4" fill="none" stroke="#30363D" stroke-width="1.5"/>
  <circle cx="804" cy="40" r="4" fill="none" stroke="#30363D" stroke-width="1.5"/>
  <circle cx="804" cy="434" r="4" fill="none" stroke="#30363D" stroke-width="1.5"/>
  <!-- LED indicator dots -->
  <circle cx="56" cy="40" r="3" fill="#3FB950" opacity="0.7"/>
  <circle cx="68" cy="40" r="3" fill="#D29922" opacity="0.5"/>
</svg>```.text

// Circuit-stat decoration — small SVG that wraps around stat numbers
#let _circuit-stat-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="60" viewBox="0 0 120 60">
  <!-- Top-left corner trace -->
  <path d="M0,10 H15 L20,5 H40" fill="none" stroke="#3FB950" stroke-width="1" opacity="0.35"/>
  <circle cx="15" cy="10" r="2" fill="#3FB950" opacity="0.4"/>
  <!-- Bottom-right corner trace -->
  <path d="M80,55 H100 L105,50 H120" fill="none" stroke="#3FB950" stroke-width="1" opacity="0.35"/>
  <circle cx="100" cy="55" r="2" fill="#3FB950" opacity="0.4"/>
  <!-- Right vertical -->
  <path d="M115,0 V15 L110,20 V35" fill="none" stroke="#3FB950" stroke-width="0.8" opacity="0.25"/>
  <circle cx="115" cy="15" r="1.5" fill="#3FB950" opacity="0.3"/>
  <!-- Left vertical -->
  <path d="M5,25 V40 L10,45 V60" fill="none" stroke="#3FB950" stroke-width="0.8" opacity="0.25"/>
  <circle cx="5" cy="40" r="1.5" fill="#3FB950" opacity="0.3"/>
</svg>```.text

// Wire-divider — circuit trace horizontal line with nodes
#let _wire-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="12" viewBox="0 0 400 12">
  <path d="M0,6 H60 L65,3 H100 L105,6 H180 L185,9 H220 L225,6 H300 L305,3 H340 L345,6 H400" fill="none" stroke="#3FB950" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <circle cx="65" cy="3" r="2" fill="#3FB950" opacity="0.5"/>
  <circle cx="185" cy="9" r="2" fill="#3FB950" opacity="0.5"/>
  <circle cx="305" cy="3" r="2" fill="#3FB950" opacity="0.5"/>
  <circle cx="0" cy="6" r="1.5" fill="#3FB950" opacity="0.6"/>
  <circle cx="400" cy="6" r="1.5" fill="#3FB950" opacity="0.6"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render circuit background atmosphere
#let circuit-bg() = {
  image(bytes(_circuit-bg-svg), width: 100%, height: 100%)
}

/// Render server panel frame
#let server-panel-frame() = {
  image(bytes(_server-panel-svg), width: 100%, height: 100%)
}

/// Render circuit stat decoration
#let circuit-stat-decoration(color: palette.green, width: 46pt, height: 20pt) = {
  let svg = _circuit-stat-svg.replace("#3FB950", color.to-hex())
  box(width: width, height: height, image(bytes(svg), width: 100%, height: 100%))
}

/// Render wire divider
#let wire-divider-render(color: palette.green, width: 80%) = {
  let svg = _wire-divider-svg.replace("#3FB950", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 10pt)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — dark bg with circuit atmosphere, green-accented header
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.3em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.ink-muted, size: 0.6em, weight: "regular")
        utils.display-current-heading(level: 1)
      },
      {
        set text(fill: palette.ink, size: 1.2em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      line(length: 100%, stroke: (paint: palette.green, thickness: 1.5pt)),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      column-gutter: 8pt,
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      text(fill: palette.green.transparentize(40%), size: 0.8em, font: terminal-font)[\$>],
      {
        set std.align(right)
        text(fill: palette.green, size: 0.9em, weight: "medium")[
          #context { utils.slide-counter.display() + " / " + utils.last-slide-number }
        ]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
      background: {
        place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
        place(top + left, box(width: 100%, height: 100%, circuit-bg()))
      },
    ),
  )
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — server panel frame, centered title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    place(top + left, box(width: 100%, height: 100%, circuit-bg()))
    place(top + left, box(width: 100%, height: 100%, server-panel-frame()))
    set std.align(center + horizon)
    pad(x: 5em)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        text(size: 0.8em, fill: palette.green, weight: "bold", font: terminal-font)[> INIT],
        text(size: 2.2em, weight: "bold", fill: palette.ink, info.title),
        line(length: 120pt, stroke: (paint: palette.green, thickness: 2pt)),
        if info.subtitle != none {
          text(size: 1em, fill: palette.ink-muted, info.subtitle)
        },
        stack(
          spacing: 0.8em,
          if info.author != none {
            text(size: 0.9em, fill: palette.green, weight: "medium", info.author)
          },
          if info.institution != none {
            text(size: 0.75em, fill: palette.ink-muted, info.institution)
          },
          if info.date != none {
            text(size: 0.75em, fill: palette.amber, utils.display-info-date(self))
          },
        ),
      )
    ]
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

/// New section slide — rack panel style with green number prefix
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
    place(top + left, box(width: 100%, height: 100%, circuit-bg()))
    set std.align(center + horizon)
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #set std.align(left)
      #stack(
        spacing: 0.8em,
        text(size: 2.5em, fill: palette.green, weight: "bold", font: terminal-font)[
          #utils.display-current-heading-number(depth: 1, numbering: "01")
        ],
        {
          set text(fill: palette.ink, size: 1.8em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        wire-divider-render(width: 60%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — centered statement on dark bg, width-constrained
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
    place(top + left, box(width: 100%, height: 100%, circuit-bg()))
    // Centered content with width constraint
    set std.align(center + horizon)
    block(width: 70%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        {
          set text(fill: palette.ink, size: 1.4em, weight: "bold")
          body
        },
        wire-divider-render(color: palette.green, width: 50%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — server panel frame, terminal-style farewell
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
    place(top + left, box(width: 100%, height: 100%, circuit-bg()))
    place(top + left, box(width: 100%, height: 100%, server-panel-frame()))
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        text(size: 0.8em, fill: palette.green, font: terminal-font)[process complete],
        text(size: 2.4em, weight: "bold", fill: palette.ink, body),
        line(length: 100pt, stroke: (paint: palette.green, thickness: 2pt)),
        text(size: 0.75em, fill: palette.ink-muted, font: terminal-font)[exit 0],
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Console card — dark card with green top-edge (3pt), like a terminal window title bar
#let console-card(title, body, accent: palette.green) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (top: 4pt, bottom: 2pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: accent, size: 0.88em, title),
      { set text(fill: palette.ink, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Circuit stat — large metric number with circuit-trace SVG decoration
#let circuit-stat(label, value, color: palette.green) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      circuit-stat-decoration(color: color),
      text(fill: color, size: 1.7em, weight: "bold", font: terminal-font, value),
      {
        set text(fill: palette.ink-muted, size: 0.72em)
        std.align(center, label)
      },
      lazy-v(1fr),
    )
  ]
}

/// Stdout block — monospace content area with `$>` prefix, no border
#let stdout-block(body) = {
  block(width: 100%, inset: (x: 0.8em, y: 0.5em))[
    #set text(fill: palette.ink, size: 0.8em, font: terminal-font)
    #grid(
      columns: (auto, 1fr),
      column-gutter: 6pt,
      text(fill: palette.green, weight: "bold")[\$>],
      body,
    )
  ]
}

/// Wire divider — SVG circuit trace horizontal line
#let wire-divider(color: palette.green, width: 80%) = {
  wire-divider-render(color: color, width: width)
}

/// Status tag — inline pill: green=healthy, amber=warning, red=error
#let status-tag(label, status: "healthy") = {
  let color = if status == "healthy" { palette.green } else if status == "warning" { palette.amber } else { palette.red }
  let text-color = if status == "error" { palette.red-text } else { color }
  box(
    fill: color.transparentize(85%),
    stroke: 0.8pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 99pt,
  )[
    #set text(fill: text-color, size: 0.72em, weight: "semibold")
    #label
  ]
}

/// Rack panel — full-width section header with "rack label" aesthetic
#let rack-panel(title) = {
  block(
    width: 100%,
    fill: palette.bg-elevated,
    stroke: (y: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.5em),
  )[
    #set text(fill: palette.green, size: 0.82em, weight: "bold", font: terminal-font)
    #grid(
      columns: (auto, 1fr),
      column-gutter: 6pt,
      text(fill: palette.ink-muted)[\u{2588}],
      title,
    )
  ]
}

/// Perf bar — inline performance indicator with colored fill bar
#let perf-bar(label, value, max: 100, color: palette.green) = {
  let ratio = calc.min(value / max, 1.0)
  block(width: 100%, inset: (y: 0.2em))[
    #set text(size: 0.78em)
    #stack(
      spacing: 0.8em,
      grid(
        columns: (1fr, auto),
        column-gutter: 8pt,
        text(fill: palette.ink-muted, label),
        text(fill: color, weight: "bold", font: terminal-font)[#value],
      ),
      block(width: 100%, height: 6pt, fill: palette.border, radius: 3pt)[
        #block(width: ratio * 100%, height: 6pt, fill: color, radius: 3pt)
      ],
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let carbon-console-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  show raw: set text(font: terminal-font)
  set heading(numbering: (..args) => none)

  show raw.where(block: false): body => box(
    fill: palette.card-bg,
    inset: (x: 3pt, y: 0pt),
    outset: (x: 0pt, y: 3pt),
    radius: 2pt,
    { set par(justify: false); body },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: palette.card-bg,
    outset: (x: 0pt, y: 4pt),
    inset: (x: 8pt, y: 4pt),
    radius: 4pt,
    { set par(justify: false); body },
  )

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.green,
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
