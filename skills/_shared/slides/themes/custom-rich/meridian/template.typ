// Meridian Theme — Cartographic precision meets modern minimalism
// Warm ivory background with deep teal/navy accent lines evoking longitude/latitude grids
// Features: compass rose SVG ornaments, meridian grid lines, golden amber accents
// Perfect for research presentations, data analysis, academic seminars
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#F8F6F1"),
  ink: rgb("#1E2A32"),
  primary: rgb("#1B4B5A"),
  accent: rgb("#C4963C"),
  accent-text: rgb("#8A5E08"),
  secondary: rgb("#4A7896"),
  ink-muted: rgb("#1E2A32").transparentize(30%),
  border-light: rgb("#1B4B5A").transparentize(75%),
  card-bg: rgb("#FFFFFF"),
  highlight-bg: rgb("#F5EBD5"),
)


// ═══ SVG Definitions ═══

// Compass rose — 8-point star with cardinal directions
#let _compass-rose-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <circle cx="32" cy="32" r="30" fill="none" stroke="currentColor" stroke-width="1" opacity="0.4"/>
  <circle cx="32" cy="32" r="22" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
  <!-- Cardinal points -->
  <path d="M32,2 L34,28 L32,26 L30,28 Z" fill="currentColor" opacity="0.8"/>
  <path d="M32,62 L34,36 L32,38 L30,36 Z" fill="currentColor" opacity="0.5"/>
  <path d="M2,32 L28,30 L26,32 L28,34 Z" fill="currentColor" opacity="0.5"/>
  <path d="M62,32 L36,30 L38,32 L36,34 Z" fill="currentColor" opacity="0.5"/>
  <!-- Intercardinal points -->
  <path d="M11,11 L28,28 L27,30 L26,28 Z" fill="currentColor" opacity="0.35"/>
  <path d="M53,11 L36,28 L37,30 L38,28 Z" fill="currentColor" opacity="0.35"/>
  <path d="M11,53 L28,36 L27,34 L26,36 Z" fill="currentColor" opacity="0.35"/>
  <path d="M53,53 L36,36 L37,34 L38,36 Z" fill="currentColor" opacity="0.35"/>
  <!-- Center dot -->
  <circle cx="32" cy="32" r="2" fill="currentColor" opacity="0.7"/>
</svg>```.text

// Meridian grid lines — horizontal/vertical crossing pattern
#let _meridian-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Vertical meridian lines -->
  <line x1="140" y1="0" x2="140" y2="474" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <line x1="280" y1="0" x2="280" y2="474" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <line x1="420" y1="0" x2="420" y2="474" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="560" y1="0" x2="560" y2="474" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <line x1="700" y1="0" x2="700" y2="474" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <!-- Horizontal latitude lines -->
  <line x1="0" y1="95" x2="840" y2="95" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
  <line x1="0" y1="190" x2="840" y2="190" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="0" y1="284" x2="840" y2="284" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="0" y1="379" x2="840" y2="379" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
</svg>```.text

// Latitude degree marker — small tick marks like on a map border
#let _latitude-marker-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="12" height="120" viewBox="0 0 12 120">
  <line x1="0" y1="0" x2="8" y2="0" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <line x1="0" y1="20" x2="5" y2="20" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <line x1="0" y1="40" x2="5" y2="40" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <line x1="0" y1="60" x2="8" y2="60" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
  <line x1="0" y1="80" x2="5" y2="80" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <line x1="0" y1="100" x2="5" y2="100" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <line x1="0" y1="120" x2="8" y2="120" stroke="currentColor" stroke-width="1.5" opacity="0.6"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render the compass rose with a given color
#let _compass-rose(color: palette.primary, size: 48pt) = {
  let svg = _compass-rose-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render meridian grid background
#let _meridian-grid-bg(color: palette.primary) = {
  let svg = _meridian-grid-svg.replace("currentColor", color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%))
}

/// Render latitude markers
#let _latitude-markers(color: palette.primary, height: 80pt) = {
  let svg = _latitude-marker-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: 8pt, height: height))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — warm ivory bg, faint meridian grid, teal header with compass accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.primary, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Double meridian line below title
      stack(
        spacing: 0pt,
        line(length: 140pt, stroke: 1.5pt + palette.primary),
        line(length: 112pt, stroke: 0.5pt + palette.accent),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Small compass dot as separator
      box(circle(radius: 2.5pt, fill: palette.accent)),
      {
        set std.align(right)
        context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // Persistent cartographic atmosphere, below flow content and page chrome.
    _meridian-grid-bg(color: palette.primary)
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

/// Title slide — ivory background with compass rose, deep teal title, golden accent lines
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Faint meridian grid overlay
    _meridian-grid-bg(color: palette.primary)
    // Compass rose decoration top-right
    place(top + right, dx: -40pt, dy: 30pt, _compass-rose(color: palette.primary.transparentize(30%), size: 64pt))
    // Latitude markers on left edge
    place(left + horizon, dx: 14pt, _latitude-markers(color: palette.primary.transparentize(40%), height: 100pt))
    // Top border lines
    place(top + left, dy: 12pt, dx: 30pt,
      stack(
        spacing: 0pt,
        line(length: 90%, stroke: 2pt + palette.primary),
        line(length: 90%, stroke: 0.7pt + palette.primary.transparentize(40%)),
      ),
    )
    // Bottom border lines
    place(bottom + left, dy: -12pt, dx: 30pt,
      stack(
        spacing: 0pt,
        line(length: 90%, stroke: 0.7pt + palette.primary.transparentize(40%)),
        line(length: 90%, stroke: 2pt + palette.primary),
      ),
    )
    // Center content
    std.align(center + horizon,
      pad(x: 5em,
        stack(
          spacing: 18pt,
          text(size: 2.4em, weight: "bold", fill: palette.primary, info.title),
          line(length: 180pt, stroke: 2.5pt + palette.accent),
          if info.subtitle != none {
            text(size: 1em, fill: palette.secondary, info.subtitle)
          },
          stack(
            spacing: 0.8em,
            if info.author != none {
              text(size: 1.1em, fill: palette.ink, weight: "medium", info.author)
            },
            if info.institution != none {
              text(size: 0.8em, fill: palette.ink-muted, info.institution)
            },
            if info.date != none {
              text(size: 0.8em, fill: palette.accent-text)[#utils.display-info-date(self)]
            },
          ),
        ),
      ),
    )
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

/// New section slide — deep teal background with white text, compass rose, golden accent
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
    // Deep teal background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Faint grid on dark bg
    {
      let svg = _meridian-grid-svg.replace("currentColor", rgb("#FFFFFF").to-hex())
      place(top + left, image(bytes(svg), width: 100%, height: 100%))
    }
    // Compass rose bottom-right
    place(bottom + right, dx: -50pt, dy: -40pt, _compass-rose(color: rgb("#FFFFFF").transparentize(60%), size: 80pt))
    // Section content
    std.align(left + horizon,
      pad(left: 5em, right: 4em,
        stack(
          spacing: 14pt,
          text(size: 2.8em, fill: palette.accent, weight: "bold")[
            #utils.display-current-heading-number(depth: 1, numbering: "1")
          ],
          {
            set text(fill: white, size: 2em, weight: "bold")
            utils.display-current-heading(level: 1, numbered: false)
          },
          line(length: 160pt, stroke: 2.5pt + palette.accent),
        ),
      ),
    )
    // Bottom thin line
    place(bottom + left, dy: -16pt, dx: 40pt,
      line(length: 85%, stroke: 0.5pt + white.transparentize(60%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — teal background, centered white text with golden accent
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
    // Deep teal background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Faint grid
    {
      let svg = _meridian-grid-svg.replace("currentColor", rgb("#FFFFFF").to-hex())
      place(top + left, image(bytes(svg), width: 100%, height: 100%))
    }
    // Border frame
    place(center + horizon,
      rect(width: 85%, height: 78%,
        fill: none,
        stroke: 1pt + white.transparentize(60%)))
    // Compass rose top-left of frame
    place(top + left, dx: 50pt, dy: 36pt, _compass-rose(color: palette.accent.transparentize(40%), size: 36pt))
    // Center content remains in flow so the page is not diagnostically empty.
    std.align(center + horizon,
      block(width: 72%)[
        #std.align(center)[
          #stack(
            spacing: 18pt,
            {
              set text(fill: white, size: 1.4em, weight: "bold")
              body
            },
            line(length: 120pt, stroke: 2pt + palette.accent),
          )
        ]
      ],
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — warm ivory with compass rose centered, elegant closing
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
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Meridian grid
    _meridian-grid-bg(color: palette.primary)
    // Top border
    place(top + left, dy: 16pt, dx: 40pt,
      stack(
        spacing: 0pt,
        line(length: 85%, stroke: 1.5pt + palette.primary),
        line(length: 85%, stroke: 0.5pt + palette.primary.transparentize(50%)),
      ),
    )
    // Bottom border
    place(bottom + left, dy: -16pt, dx: 40pt,
      stack(
        spacing: 0pt,
        line(length: 85%, stroke: 0.5pt + palette.primary.transparentize(50%)),
        line(length: 85%, stroke: 1.5pt + palette.primary),
      ),
    )
    // Center content
    std.align(center + horizon,
      block(width: 60%)[
        #std.align(center)[
          #stack(
            spacing: 16pt,
            _compass-rose(color: palette.primary, size: 56pt),
            text(size: 2.2em, weight: "bold", fill: palette.primary, body),
            line(length: 160pt, stroke: 2.5pt + palette.accent),
            stack(
              dir: ltr,
              spacing: 10pt,
              box(circle(radius: 3pt, fill: palette.primary)),
              box(circle(radius: 3pt, fill: palette.accent)),
              box(circle(radius: 3pt, fill: palette.secondary)),
            ),
          )
        ]
      ],
    )
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Coordinate card — card with teal top border and clean layout, like a map legend entry
#let coordinate-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 0.7pt + palette.border-light),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: accent.darken(20%), size: 0.92em, title),
      line(length: 40pt, stroke: 0.8pt + palette.accent),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Bearing stat — large value display with subtle background, like a compass bearing readout
#let bearing-stat(label, value, color: palette.accent) = {
  block(
    width: 100%,
    fill: color.lighten(90%),
    stroke: (bottom: 2.5pt + color),
    inset: (x: 0.8em, y: 0.6em),
    radius: (top: 4pt),
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      text(fill: color.darken(20%), size: 1.55em, weight: "bold", value),
      text(fill: palette.ink-muted, size: 0.72em, label),
      lazy-v(1fr),
    )
  ]
}

/// Azimuth box — left-bordered content box for key messages or callouts
#let azimuth-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: accent.darken(20%), size: 0.92em, title),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Meridian divider — horizontal separator with compass dot center
#let meridian-divider(color: palette.primary, width: 80%) = {
  std.align(center,
    box(width: width)[
      #set std.align(horizon + center)
      #grid(
        columns: (1fr, auto, 1fr),
        align: horizon,
        line(length: 100%, stroke: 0.7pt + color.transparentize(40%)),
        pad(x: 8pt, box(circle(radius: 3pt, fill: color.transparentize(30%)))),
        line(length: 100%, stroke: 0.7pt + color.transparentize(40%)),
      )
    ]
  )
}

/// Compass tag — capsule-shaped label for categorization
#let compass-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color.darken(20%), size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Waypoint list — numbered list with golden accent markers
#let waypoint-list(body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.7pt + palette.border-light,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #set text(fill: palette.ink, size: 0.82em)
    #set enum(
      numbering: n => box(
        width: 20pt,
        height: 20pt,
        fill: palette.highlight-bg,
        stroke: 0.7pt + palette.accent.transparentize(50%),
        radius: 10pt,
        std.align(center + horizon,
          text(fill: palette.accent-text, weight: "bold", size: 0.85em, str(n)),
        ),
      ),
      indent: 0pt,
      body-indent: 10pt,
      spacing: 6pt,
    )
    #body
    #lazy-v(1fr)
  ]
}

/// Cartograph highlight — full-width highlight box with golden amber background
#let cartograph-highlight(body) = {
  block(
    width: 100%,
    fill: palette.highlight-bg,
    stroke: (paint: palette.accent, thickness: 1.5pt),
    inset: (x: 1.5em, y: 1em),
    radius: 4pt,
  )[
    #set std.align(center)
    #set text(fill: palette.ink, size: 1em)
    #body
  ]
}

/// Projection quote — quote block with compass-rose inspired design
#let projection-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + palette.primary, rest: 0.5pt + palette.border-light),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      text(fill: palette.ink, size: 0.88em, style: "italic", quote),
      if author != none {
        text(fill: palette.accent-text, size: 0.8em, weight: "bold", style: "normal")[-- #author]
      },
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let meridian-theme(
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
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent-text,
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
