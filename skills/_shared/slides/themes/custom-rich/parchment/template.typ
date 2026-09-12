// Parchment Theme — Aged parchment/vellum aesthetic with illuminated manuscript feel
// Warm cream/sepia background with rich burgundy and dark brown accents
// Features: scroll corner ornaments, calligraphic flourish dividers, margin rosettes
// Perfect for humanities presentations, literary discussions, historical research
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FAF7F0"),
  primary: rgb("#6B2737"),
  accent: rgb("#9B7B3C"),
  secondary: rgb("#5B7B6B"),
  text-dark: rgb("#3B2820"),
  text-body: rgb("#4A3828"),
  text-muted: rgb("#8B7B6B"),
  card-bg: rgb("#FFFDF8"),
  border: rgb("#D4C4A8"),
  border-light: rgb("#E8DCC8"),
  texture-dot: rgb("#3B2820").transparentize(95%),
)


// ═══ SVG Definitions ═══

// Scroll corner ornament — decorative corner flourish for title frames
#let _scroll-corner-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <path d="M4,60 C4,40 8,20 20,12 C28,6 40,4 60,4" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
  <path d="M8,60 C8,44 12,28 22,20 C30,14 42,10 60,8" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.6"/>
  <circle cx="60" cy="4" r="3" fill="currentColor" opacity="0.7"/>
  <circle cx="4" cy="60" r="3" fill="currentColor" opacity="0.7"/>
  <path d="M14,52 C14,42 18,34 26,28 C32,24 38,22 48,18" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.4"/>
</svg>```.text

// Calligraphic flourish divider — ornamental horizontal separator
#let _flourish-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="20" viewBox="0 0 300 20">
  <path d="M20,10 C40,10 50,4 70,4 C90,4 100,10 120,10 C130,10 135,7 150,7 C165,7 170,10 180,10 C200,10 210,4 230,4 C250,4 260,10 280,10" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <circle cx="150" cy="10" r="3" fill="currentColor"/>
  <circle cx="130" cy="10" r="1.5" fill="currentColor" opacity="0.6"/>
  <circle cx="170" cy="10" r="1.5" fill="currentColor" opacity="0.6"/>
  <path d="M10,10 L20,10" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <path d="M280,10 L290,10" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
</svg>```.text

// Margin rosette — small decorative medallion for ornamental accents
#let _margin-rosette-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
  <circle cx="16" cy="16" r="12" fill="none" stroke="currentColor" stroke-width="1" opacity="0.5"/>
  <circle cx="16" cy="16" r="8" fill="none" stroke="currentColor" stroke-width="1.2"/>
  <circle cx="16" cy="16" r="3" fill="currentColor" opacity="0.6"/>
  <path d="M16,4 L16,8 M16,24 L16,28 M4,16 L8,16 M24,16 L28,16" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.5"/>
  <path d="M8,8 L10.5,10.5 M23.5,8 L21.5,10.5 M8,24 L10.5,21.5 M23.5,24 L21.5,21.5" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.4"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render scroll corner ornament
#let scroll-corner(color: palette.accent, size: 48pt) = {
  let svg = _scroll-corner-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render calligraphic flourish divider
#let flourish-divider(color: palette.accent, width: 60%) = {
  let svg = _flourish-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 14pt)))
}

/// Render margin rosette
#let margin-rosette(color: palette.accent, size: 24pt) = {
  let svg = _margin-rosette-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


// ═══ Helper Functions ═══

/// Parchment texture background — faint scattered dots simulating aged paper grain
#let parchment-texture-bg(dot-count: 20) = {
  let positions = (
    (5%, 8%), (15%, 22%), (25%, 5%), (35%, 30%), (45%, 12%),
    (55%, 25%), (65%, 8%), (75%, 32%), (85%, 15%), (95%, 28%),
    (8%, 45%), (18%, 60%), (28%, 50%), (38%, 70%), (48%, 55%),
    (58%, 65%), (68%, 48%), (78%, 72%), (88%, 58%), (92%, 42%),
  )
  for i in range(calc.min(dot-count, positions.len())) {
    let (x, y) = positions.at(i)
    place(top + left, dx: x, dy: y,
      circle(radius: 1.5pt, fill: palette.texture-dot))
  }
}

/// Double rule line — classic book divider (thin-thick-thin)
#let double-rule(color: palette.border, width: 100%) = {
  block(width: width)[
    #stack(
      spacing: 0pt,
      line(length: 100%, stroke: 0.4pt + color),
      line(length: 100%, stroke: 1.2pt + color),
      line(length: 100%, stroke: 0.4pt + color),
    )
  ]
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — warm cream bg, burgundy title with gold accent rule
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.4em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.primary, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Gold accent line below title
      line(length: 100pt, stroke: 1.5pt + palette.accent),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    block(width: 100%)[
      #grid(
        columns: (1fr, auto, 1fr),
        {
          if self.store.footer != none {
            set text(fill: palette.text-muted, size: 0.65em)
            utils.call-or-display(self, self.store.footer)
          }
        },
        // Center rosette
        margin-rosette(color: palette.border, size: 14pt),
        {
          set std.align(right)
          context text(fill: palette.text-muted, size: 0.65em)[#utils.slide-counter.display() / #utils.last-slide-number]
        },
      )
    ]
  }
  let setting(body) = {
    parchment-texture-bg(dot-count: 10)
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

/// Title slide — parchment with scroll corner ornaments, burgundy title, gold flourish
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Parchment texture
    parchment-texture-bg(dot-count: 16)
    // Border frame
    place(center + horizon,
      rect(width: 92%, height: 88%,
        fill: none,
        stroke: (paint: palette.border, thickness: 1.5pt)))
    place(center + horizon,
      rect(width: 90%, height: 86%,
        fill: none,
        stroke: (paint: palette.border-light, thickness: 0.8pt)))
    // Scroll corner ornaments
    place(top + left, dx: 16pt, dy: 16pt, scroll-corner(color: palette.accent, size: 48pt))
    place(top + right, dx: -16pt, dy: 16pt,
      scale(x: -100%, scroll-corner(color: palette.accent, size: 48pt)))
    place(bottom + left, dx: 16pt, dy: -16pt,
      scale(y: -100%, scroll-corner(color: palette.accent, size: 48pt)))
    place(bottom + right, dx: -16pt, dy: -16pt,
      scale(x: -100%, y: -100%, scroll-corner(color: palette.accent, size: 48pt)))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: palette.primary, info.title),
        flourish-divider(color: palette.accent, width: 50%),
        if info.subtitle != none {
          text(size: 1em, fill: palette.text-body, style: "italic", info.subtitle)
        },
        if info.author != none {
          text(size: 1.05em, fill: palette.text-dark, weight: "semibold", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-muted, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.accent)[#utils.display-info-date(self)]
        },
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

/// New section slide — burgundy section title, gold flourish, rosette decoration
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
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Parchment texture
    parchment-texture-bg(dot-count: 12)
    // Left accent bar (burgundy)
    place(left, dx: 3em, dy: 0pt,
      block(width: 4pt, height: 40%, fill: palette.primary, radius: 2pt))
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #std.align(left + horizon)[
        #stack(
          spacing: .8em,
          text(size: 2.5em, fill: palette.accent, weight: "bold")[
            #context utils.display-current-heading-number(depth: 1, numbering: "01")
          ],
          {
            set text(fill: palette.primary, size: 2em, weight: "semibold")
            utils.display-current-heading(level: 1)
          },
          flourish-divider(color: palette.accent, width: 45%),
        )
      ]
    ]
    // Bottom rosette decoration
    place(bottom + center, dy: -2em, margin-rosette(color: palette.border, size: 20pt))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — single statement centered on parchment with ornamental frame
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
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Parchment texture
    parchment-texture-bg(dot-count: 14)
    // Ornamental border
    place(center + horizon,
      rect(width: 82%, height: 72%,
        fill: none,
        stroke: (paint: palette.primary.transparentize(40%), thickness: 1.5pt)))
    // Corner rosettes
    place(top + left, dx: 9%, dy: 14%, margin-rosette(color: palette.accent, size: 20pt))
    place(top + right, dx: -9%, dy: 14%, margin-rosette(color: palette.accent, size: 20pt))
    place(bottom + left, dx: 9%, dy: -14%, margin-rosette(color: palette.accent, size: 20pt))
    place(bottom + right, dx: -9%, dy: -14%, margin-rosette(color: palette.accent, size: 20pt))
    // Center content
    place(center + horizon,
      block(width: 68%, height: auto,
        align(center)[
          #set text(fill: palette.primary, size: 1.3em, weight: "bold")
          #stack(
            spacing: .8em,
            body,
            flourish-divider(color: palette.accent, width: 40%),
          )
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — elegant close with scroll corners, rosette, and flourish
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
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Parchment texture
    parchment-texture-bg(dot-count: 18)
    // Border frame
    place(center + horizon,
      rect(width: 92%, height: 88%,
        fill: none,
        stroke: (paint: palette.border, thickness: 1.5pt)))
    // Scroll corner ornaments
    place(top + left, dx: 18pt, dy: 18pt, scroll-corner(color: palette.accent, size: 44pt))
    place(top + right, dx: -18pt, dy: 18pt,
      scale(x: -100%, scroll-corner(color: palette.accent, size: 44pt)))
    place(bottom + left, dx: 18pt, dy: -18pt,
      scale(y: -100%, scroll-corner(color: palette.accent, size: 44pt)))
    place(bottom + right, dx: -18pt, dy: -18pt,
      scale(x: -100%, y: -100%, scroll-corner(color: palette.accent, size: 44pt)))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        margin-rosette(color: palette.accent, size: 36pt),
        text(size: 2.2em, weight: "bold", fill: palette.primary, body),
        flourish-divider(color: palette.accent, width: 55%),
        double-rule(color: palette.border, width: 40%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Manuscript card — card with subtle border and burgundy header, evoking a manuscript page
#let manuscript-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 2.5pt + accent, rest: 0.8pt + palette.border-light),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      block(width: 50pt, height: 1pt, fill: accent.transparentize(50%)),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Folio stat — large display number with gold accent, like a folio page number
#let folio-stat(label, value, color: palette.accent) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + color, rest: 0.8pt + palette.border-light),
    inset: (x: 0.9em, y: 0.6em),
    radius: (right: 4pt),
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(fill: color, size: 1.8em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Marginalia note — side-note style annotation with left rule and italic text
#let marginalia-note(body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.transparentize(92%),
    stroke: (left: 3pt + accent),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #set text(fill: palette.text-dark, size: 0.85em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}

/// Illuminated box — highlighted box with gold border, evoking illuminated initials
#let illuminated-box(title, body, color: palette.accent) = {
  block(
    width: 100%,
    fill: color.transparentize(92%),
    stroke: (paint: color, thickness: 1.8pt),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        margin-rosette(color: color, size: 16pt),
        text(weight: "bold", fill: color.darken(15%), size: 0.95em, title),
      ),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Colophon tag — small capsule label evoking printer's marks
#let colophon-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: color, size: 0.75em, weight: "semibold")
    #content
  ]
}

// ═══ 3. Theme Entry Point ═══

#let parchment-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-body)
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
      primary: palette.primary,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.text-dark,
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
