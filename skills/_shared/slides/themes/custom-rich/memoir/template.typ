// Memoir Theme — Luxury book/memoir design aesthetic
// Inspired by Penguin Classics, Taschen: drop caps, ornamental flourishes,
// elegant serif typography, generous margins, pull quotes with decorative borders.
// Rich cream paper with deep black ink and burgundy jewel-tone accent.
// Content hierarchy through size and weight rather than color.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Color Palette (direct - Rich theme)
// =====================================================================

#let palette = (
  bg: rgb("#FFFEF7"),
  ink: rgb("#1C1714"),
  accent: rgb("#7B2D3B"),
  secondary: rgb("#2E5A4C"),
  ornament: rgb("#88704F"),
  ink-light: rgb("#1C1714").transparentize(40%),
  ink-muted: rgb("#1C1714").transparentize(35%),
  ink-faint: rgb("#1C1714").transparentize(75%),
)

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 48pt,
  h1: 32pt,
  h2: 24pt,
  body: 18pt,
  large-body: 20pt,
  small: 12pt,
  caption: 10pt,
  line-height: 1.2em,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _serif-font = ("Libertinus Serif", "Noto Serif SC")
#let _sans-font = "Noto Sans SC"
#let _mono-font = "DejaVu Sans Mono"

// =====================================================================
// SVG Ornaments (inline via image(bytes()))
// =====================================================================

// Ornamental flourish: elegant swirl/scroll ornament for section dividers
#let _flourish-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="40" viewBox="0 0 200 40">
  <path d="M100 20 C90 10, 75 8, 65 12 C55 16, 50 22, 55 28 C60 34, 72 32, 78 26 C84 20, 80 14, 72 12 M100 20 C110 10, 125 8, 135 12 C145 16, 150 22, 145 28 C140 34, 128 32, 122 26 C116 20, 120 14, 128 12" fill="none" stroke="#88704F" stroke-width="1.5" stroke-linecap="round"/>
  <circle cx="100" cy="20" r="2.5" fill="#88704F"/>
  <path d="M40 20 C35 18, 30 20, 35 22 C40 24, 45 22, 40 20" fill="#88704F"/>
  <path d="M160 20 C155 18, 150 20, 155 22 C160 24, 165 22, 160 20" fill="#88704F"/>
</svg>```.text

// Drop cap frame: decorative square frame around initial letter position
#let _dropcap-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60">
  <rect x="2" y="2" width="56" height="56" fill="none" stroke="#88704F" stroke-width="1.2"/>
  <rect x="5" y="5" width="50" height="50" fill="none" stroke="#88704F" stroke-width="0.5"/>
  <path d="M2 2 L8 2 L2 8 Z" fill="#88704F" opacity="0.6"/>
  <path d="M58 2 L52 2 L58 8 Z" fill="#88704F" opacity="0.6"/>
  <path d="M2 58 L8 58 L2 52 Z" fill="#88704F" opacity="0.6"/>
  <path d="M58 58 L52 58 L58 52 Z" fill="#88704F" opacity="0.6"/>
</svg>```.text

// Corner ornament: L-shaped decorative corner piece
#let _corner-ornament-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 50 50">
  <path d="M0 0 L30 0" fill="none" stroke="#88704F" stroke-width="1.5"/>
  <path d="M0 0 L0 30" fill="none" stroke="#88704F" stroke-width="1.5"/>
  <path d="M0 4 L20 4" fill="none" stroke="#88704F" stroke-width="0.5"/>
  <path d="M4 0 L4 20" fill="none" stroke="#88704F" stroke-width="0.5"/>
  <circle cx="0" cy="0" r="2" fill="#88704F"/>
  <path d="M8 8 C10 6, 12 8, 10 10 C8 12, 6 10, 8 8" fill="#88704F" opacity="0.7"/>
</svg>```.text

// =====================================================================
// SVG Helper Functions
// =====================================================================

#let ornamental-flourish(width: 120pt) = {
  let svg-bytes = bytes(_flourish-svg)
  image(bytes(svg-bytes), width: width)
}

#let dropcap-frame(size: 48pt) = {
  let svg-bytes = bytes(_dropcap-frame-svg)
  image(bytes(svg-bytes), width: size, height: size)
}

#let corner-ornament(size: 32pt) = {
  let svg-bytes = bytes(_corner-ornament-svg)
  image(bytes(svg-bytes), width: size, height: size)
}

// =====================================================================
// Reusable Components
// =====================================================================

/// chapter-card -- Card with ornamental top border, serif title, body text
#let chapter-card(title, body-text) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (top: 2pt + palette.ornament, rest: 0.5pt + palette.ink-faint),
    inset: (x: 1em, y: 0.8em),
  )[
    #stack(
      spacing: .8em,
      text(
        size: 1.1em,
        weight: "bold",
        fill: palette.ink,
        font: _serif-font,
        title,
      ),
      [
        #text(
          size: 0.85em,
          fill: palette.ink-muted,
          font: _serif-font,
          body-text,
        )
        #lazy-v(1fr)
      ]
    )
  ]
}

/// folio-stat -- Large elegant number in accent color with small italic description
#let folio-stat(number, description) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.5em))[
    #stack(
      spacing: .8em,
      text(
        size: 52pt,
        weight: "light",
        fill: palette.accent,
        font: _serif-font,
        number,
      ),
      [
        #text(
          size: typo.small,
          style: "italic",
          fill: palette.ink-muted,
          font: _serif-font,
          description,
        )
        #lazy-v(1fr)
      ]
    )
  ]
}

/// fleuron-divider -- Centered ornamental symbol divider
#let fleuron-divider() = {
  block(width: 100%, above: 1em, below: 1em)[
    #std.align(center, ornamental-flourish(width: 100pt))
  ]
}

/// memoir-quote -- Elegant pull quote with large italic text and ornamental marks
#let memoir-quote(quote-text, attribution: none) = {
  block(
    width: 100%,
    inset: (x: 2em, y: 1em),
  )[
    #std.align(center)[
      #stack(
        spacing: 0.8em,
        text(size: 28pt, fill: palette.ornament, font: _serif-font, weight: "regular")[“],
        text(
          size: typo.h2,
          style: "italic",
          fill: palette.ink,
          font: _serif-font,
          weight: "regular",
          quote-text,
        ),
        text(size: 28pt, fill: palette.ornament, font: _serif-font, weight: "regular")[”],
        if attribution != none {
          text(
            size: typo.small,
            fill: palette.ink-muted,
            font: _serif-font,
            style: "normal",
            weight: "regular",
            [-- #attribution],
          )
        },
      )
    ]
  ]
}

/// sidenote -- Small marginalia-style annotation
#let sidenote(body) = {
  text(
    size: typo.caption,
    fill: palette.ink-light,
    font: _serif-font,
    style: "italic",
    body,
  )
}

/// binding-tag -- Small label like book section markers
#let binding-tag(label-text) = {
  box(
    inset: (x: 0.6em, y: 0.2em),
    stroke: 0.5pt + palette.ornament,
  )[
    #text(
      size: 8pt,
      fill: palette.ornament,
      font: _sans-font,
      weight: "medium",
      tracking: 0.8pt,
      upper(label-text),
    )
  ]
}

/// colophon-box -- Information box styled like a book's colophon page
#let colophon-box(..items) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 1.5em, y: 1.2em),
  )[
    #stack(
      spacing: .8em,
      text(
        size: 9pt,
        fill: palette.ornament,
        font: _sans-font,
        weight: "medium",
        tracking: 1.2pt,
      )[COLOPHON],
      line(length: 100%, stroke: 0.3pt + palette.ink-faint),
      {
        set text(size: 14pt, fill: palette.ink-muted, font: _serif-font)
        stack(spacing: 0.8em, ..items.pos())
      },
      lazy-v(1fr),
    )
  ]
}

/// chapter-opener -- Decorative chapter opening with number and ornamental frame
#let chapter-opener(number, title) = {
  block(width: 100%, inset: (x: 1em, y: 0.8em))[
    #std.align(center)[
      #stack(
        spacing: .8em,
        text(
          size: 10pt,
          fill: palette.ornament,
          font: _sans-font,
          weight: "medium",
          tracking: 2pt,
        )[CHAPTER],
        text(
          size: 42pt,
          fill: palette.accent,
          font: _serif-font,
          weight: "light",
          number,
        ),
        ornamental-flourish(width: 80pt),
        text(
          size: typo.h1,
          fill: palette.ink,
          font: _serif-font,
          weight: "regular",
          title,
        ),
        lazy-v(1fr),
      )
    ]
  ]
}

// =====================================================================
// Internal Helpers (header/footer)
// =====================================================================

/// _memoir-header -- Elegant header with subtle frame line
#let _memoir-header(self) = {
  set std.align(top)
  show: components.cell.with(inset: (x: 2.5em, top: 0.5em, bottom: 0.2em))
  set std.align(horizon + left)
  stack(
    spacing: 0.8em,
    {
      set text(fill: palette.ink, size: 1em, weight: "regular", font: _serif-font)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    // Subtle ornament-colored line below
    block(width: 40pt, height: 1pt, fill: palette.ornament),
  )
}

/// _memoir-footer -- Folio-style footer
#let _memoir-footer(self) = {
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2.5em, y: 0.3em))
  set std.align(horizon)
  set text(fill: palette.ink-light, size: 0.55em, font: _serif-font)
  grid(
    columns: (1fr, auto, 1fr),
    {
      if self.store.footer != none {
        text(style: "italic", utils.call-or-display(self, self.store.footer))
      }
    },
    {
      // Small ornamental dot
      box(circle(radius: 1.5pt, fill: palette.ornament))
    },
    {
      set std.align(right)
      context [#utils.slide-counter.display("1")]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Cream bg, generous margins, elegant serif text, subtle frame
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _memoir-header(self)
  let footer(self) = _memoir-footer(self)
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

/// title-slide -- Book cover style: corner ornaments, centered title, author
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Corner ornaments (4 corners)
    place(top + left, dx: 1.5em, dy: 1.5em, corner-ornament(size: 28pt))
    place(top + right, dx: -1.5em, dy: 1.5em, scale(x: -100%, corner-ornament(size: 28pt)))
    place(bottom + left, dx: 1.5em, dy: -1.5em, scale(y: -100%, corner-ornament(size: 28pt)))
    place(bottom + right, dx: -1.5em, dy: -1.5em, scale(x: -100%, y: -100%, corner-ornament(size: 28pt)))
    // Centered title-page composition with deterministic spacing.
    std.align(center + horizon,
      pad(x: 4em, y: 3em,
        stack(
          spacing: 18pt,
          ornamental-flourish(width: 80pt),
          text(size: typo.display, weight: "regular", fill: palette.ink, font: _serif-font, info.title),
          if info.subtitle != none {
            text(size: typo.h2, weight: "light", fill: palette.ink-muted, font: _serif-font, style: "italic", info.subtitle)
          },
          line(length: 60pt, stroke: 0.8pt + palette.ornament),
          {
            stack(
              spacing: 0.8em,
              if info.author != none {
                text(size: typo.body, fill: palette.ink-muted, font: _serif-font, info.author)
              },
              {
                set text(size: typo.small, fill: palette.ink-light, font: _sans-font, tracking: 0.8pt)
                if info.institution != none {
                  upper[#info.institution]
                  if info.date != none { [ #sym.dot.c ] }
                }
                if info.date != none {
                  utils.display-info-date(self)
                }
              },
            )
          },
        ),
      ),
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Chapter opening with ornamental flourish
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Subtle border frame - properly centered
    place(center + horizon,
      rect(
        width: 96%,
        height: 94%,
        stroke: 0.3pt + palette.ink-faint,
        fill: none,
      )
    )
    // Reuse the documented chapter-opener component for section pages.
    std.align(center + horizon,
      chapter-opener(
        context { utils.display-current-heading-number(level: 1, numbering: "I") },
        context { utils.display-current-heading(level: 1, numbered: false) },
      ),
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single large italic quote, centered, ornamental marks
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      margin: 4em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    std.align(center + horizon,
      block(width: 90%)[
        #std.align(center)[
          #stack(
            spacing: 0.8em,
            text(size: 36pt, fill: palette.ornament, style: "normal")[“],
            {
              set text(
                size: typo.h2,
                style: "italic",
                fill: palette.ink,
                font: _serif-font,
                weight: "regular",
              )
              body
            },
            text(size: 36pt, fill: palette.ornament, style: "normal")[”],
            ornamental-flourish(width: 60pt),
          )
        ]
      ],
    )
  }
  touying-slide(self: self, main-body)
})

/// ending-slide -- Colophon-style: "Finis" with ornamental flourish
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Corner ornaments
    place(top + left, dx: 1.5em, dy: 1.5em, corner-ornament(size: 24pt))
    place(top + right, dx: -1.5em, dy: 1.5em, scale(x: -100%, corner-ornament(size: 24pt)))
    place(bottom + left, dx: 1.5em, dy: -1.5em, scale(y: -100%, corner-ornament(size: 24pt)))
    place(bottom + right, dx: -1.5em, dy: -1.5em, scale(x: -100%, y: -100%, corner-ornament(size: 24pt)))
    // Centered colophon composition; stack prevents top-edge overflow.
    std.align(center + horizon,
      pad(x: 4em,
        block(width: 80%)[
          #std.align(center)[
            #stack(
              spacing: 18pt,
              text(
                size: typo.display,
                style: "italic",
                fill: palette.ink,
                font: _serif-font,
                weight: "regular",
              )[Finis],
              ornamental-flourish(width: 100pt),
              {
                set text(size: typo.body, fill: palette.ink-muted, font: _serif-font)
                body
              },
            )
          ]
        ],
      ),
    )
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let memoir-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: typo.body, fill: palette.ink)
  set par(leading: typo.line-height)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.3em, bottom: 2.2em, x: 2.5em),
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
