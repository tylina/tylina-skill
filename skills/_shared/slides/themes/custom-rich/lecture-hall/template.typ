// Lecture Hall Theme — Modern lecture hall with frosted glass whiteboards
// Light background with frosted-glass panel effects, deep navy primary, academic blue accent
// Features: dot-grid background, frosted panels, theorem highlighting, definition borders
// Perfect for course lectures (30-70 pages) with definition/theorem/proof structure
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  bg: rgb("#F7F9FC"),
  ink: rgb("#1B2D50"),
  accent: rgb("#3B6FA0"),
  gold: rgb("#755B00"),
  muted-ink: rgb("#1B2D50").transparentize(30%),
  frost: rgb("#3B6FA0").transparentize(88%),
  frost-stroke: rgb("#3B6FA0").transparentize(60%),
  panel-fill: rgb("#E8EDF4").transparentize(30%),
  dot-grid: rgb("#1B2D50").transparentize(85%),
  light-gold: rgb("#755B00").transparentize(85%),
  divider-frost: rgb("#3B6FA0").transparentize(70%),
  corollary-bg: rgb("#F0F4F8"),
)


// === SVG Definitions ===

// Dot-grid background SVG -- 8+ dots at varying opacities (used on every content slide)
#let _dot-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60">
  <circle cx="10" cy="10" r="1" fill="#1B2D50" opacity="0.06"/>
  <circle cx="30" cy="10" r="1" fill="#1B2D50" opacity="0.10"/>
  <circle cx="50" cy="10" r="1" fill="#1B2D50" opacity="0.05"/>
  <circle cx="10" cy="30" r="1" fill="#1B2D50" opacity="0.12"/>
  <circle cx="30" cy="30" r="1" fill="#1B2D50" opacity="0.08"/>
  <circle cx="50" cy="30" r="1" fill="#1B2D50" opacity="0.14"/>
  <circle cx="10" cy="50" r="1" fill="#1B2D50" opacity="0.07"/>
  <circle cx="30" cy="50" r="1" fill="#1B2D50" opacity="0.16"/>
  <circle cx="50" cy="50" r="1" fill="#1B2D50" opacity="0.09"/>
</svg>```.text

// Corner-mark SVG -- geometric angle marks for theorem-box corners
#let _corner-mark-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
  <path d="M1,1 L1,8" stroke="#755B00" stroke-width="2" stroke-linecap="round" fill="none"/>
  <path d="M1,1 L8,1" stroke="#755B00" stroke-width="2" stroke-linecap="round" fill="none"/>
</svg>```.text

// Glass-divider SVG -- frosted/blurred horizontal separator
#let _glass-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="8" viewBox="0 0 400 8">
  <defs>
    <linearGradient id="frost-grad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#3B6FA0;stop-opacity:0"/>
      <stop offset="15%" style="stop-color:#3B6FA0;stop-opacity:0.3"/>
      <stop offset="50%" style="stop-color:#3B6FA0;stop-opacity:0.5"/>
      <stop offset="85%" style="stop-color:#3B6FA0;stop-opacity:0.3"/>
      <stop offset="100%" style="stop-color:#3B6FA0;stop-opacity:0"/>
    </linearGradient>
  </defs>
  <rect x="0" y="2" width="400" height="1.5" fill="url(#frost-grad)" rx="1"/>
  <rect x="20" y="4.5" width="360" height="0.8" fill="url(#frost-grad)" rx="0.5" opacity="0.4"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render the dot-grid background pattern (tiled)
#let dot-grid-bg() = {
  place(top + left,
    block(width: 100%, height: 100%, clip: true, {
      for row in range(9) {
        for col in range(15) {
          place(top + left, dx: col * 60pt, dy: row * 60pt,
            image(bytes(_dot-grid-svg), width: 60pt, height: 60pt))
        }
      }
    })
  )
}

/// Render corner mark (top-left orientation)
#let corner-mark-tl(color: palette.gold) = {
  let svg = _corner-mark-svg.replace("#755B00", color.to-hex())
  box(image(bytes(svg), width: 12pt, height: 12pt))
}

/// Render corner mark (top-right orientation - flipped)
#let corner-mark-tr(color: palette.gold) = {
  let svg = _corner-mark-svg.replace("#755B00", color.to-hex())
  box(scale(x: -100%, image(bytes(svg), width: 12pt, height: 12pt)))
}

/// Render corner mark (bottom-left orientation - flipped)
#let corner-mark-bl(color: palette.gold) = {
  let svg = _corner-mark-svg.replace("#755B00", color.to-hex())
  box(scale(y: -100%, image(bytes(svg), width: 12pt, height: 12pt)))
}

/// Render corner mark (bottom-right orientation - flipped)
#let corner-mark-br(color: palette.gold) = {
  let svg = _corner-mark-svg.replace("#755B00", color.to-hex())
  box(scale(x: -100%, scale(y: -100%, image(bytes(svg), width: 12pt, height: 12pt))))
}

/// Render glass divider
#let glass-divider(width: 70%) = {
  std.align(center, box(width: width, image(bytes(_glass-divider-svg), width: width, height: 6pt)))
}


// === 1. Slide Functions ===

/// Standard content slide -- light bg with dot-grid pattern, navy title, frosted header line
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.5em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.ink, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Frosted accent line below title
      block(width: 100pt, height: 2.5pt, fill: palette.accent, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.muted-ink, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      box(circle(radius: 2pt, fill: palette.frost-stroke)),
      {
        set std.align(right)
        context {
          text(fill: palette.muted-ink, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
        }
      },
    )
  }
  // Setting function for dot-grid background on every content slide
  let setting(body) = {
    dot-grid-bg()
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

/// Title slide -- frosted border frame, centered title with academic styling
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Frosted border frame (bookending element)
    place(center + horizon,
      rect(width: 96%, height: 94%,
        stroke: (paint: palette.frost-stroke, thickness: 2.5pt),
        fill: none,
        radius: 6pt))
    // Inner subtle frame
    place(center + horizon,
      rect(width: 94%, height: 90%,
        stroke: (paint: palette.frost-stroke, thickness: 0.8pt, dash: "loosely-dashed"),
        fill: none,
        radius: 4pt))
    // Corner marks
    place(top + left, dx: 12pt, dy: 12pt, corner-mark-tl(color: palette.accent))
    place(top + right, dx: -12pt, dy: 12pt, corner-mark-tr(color: palette.accent))
    place(bottom + left, dx: 12pt, dy: -12pt, corner-mark-bl(color: palette.accent))
    place(bottom + right, dx: -12pt, dy: -12pt, corner-mark-br(color: palette.accent))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: 0.8em,
        text(size: 2.2em, weight: "bold", fill: palette.ink, info.title),
        glass-divider(width: 200pt),
        if info.subtitle != none {
          text(size: 1em, fill: palette.accent, info.subtitle)
        },
        {
          stack(
            spacing: 0.8em,
            if info.author != none {
              text(size: 1em, fill: palette.ink, weight: "regular", info.author)
            },
            if info.institution != none {
              text(size: 0.8em, fill: palette.muted-ink, info.institution)
            },
            if info.date != none {
              text(size: 0.8em, fill: palette.gold, utils.display-info-date(self))
            },
          )
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

/// New section slide -- section number in gold, navy title, glass divider
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
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Dot grid (subtle)
    dot-grid-bg()
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in gold
      #text(size: 3em, fill: palette.gold, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Section title in navy
      #set text(fill: palette.ink, size: 2em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      // Glass divider
      #glass-divider(width: 240pt)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- centered statement, width-constrained text, frosted border
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
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Frosted emphasis border
    place(center + horizon,
      rect(width: 82%, height: 72%,
        fill: palette.frost,
        stroke: (paint: palette.frost-stroke, thickness: 1.5pt),
        radius: 8pt))
    // Center content -- width-constrained and kept in flow for diagnostics
    set text(fill: palette.ink, size: 1.3em, weight: "bold")
    std.align(center + horizon,
      block(width: 68%)[
        #stack(
          spacing: 0.8em,
          body,
          glass-divider(width: 150pt),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- frosted border frame (bookending with title slide), centered text
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
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Frosted border frame (bookending element, same as title slide)
    place(center + horizon,
      rect(width: 96%, height: 94%,
        stroke: (paint: palette.frost-stroke, thickness: 2.5pt),
        fill: none,
        radius: 6pt))
    // Inner subtle frame
    place(center + horizon,
      rect(width: 94%, height: 90%,
        stroke: (paint: palette.frost-stroke, thickness: 0.8pt, dash: "loosely-dashed"),
        fill: none,
        radius: 4pt))
    // Corner marks
    place(top + left, dx: 12pt, dy: 12pt, corner-mark-tl(color: palette.accent))
    place(top + right, dx: -12pt, dy: 12pt, corner-mark-tr(color: palette.accent))
    place(bottom + left, dx: 12pt, dy: -12pt, corner-mark-bl(color: palette.accent))
    place(bottom + right, dx: -12pt, dy: -12pt, corner-mark-br(color: palette.accent))
    // Center content, kept in flow for diagnostics
    std.align(center + horizon,
      block(width: 60%)[
        #stack(
          spacing: 0.8em,
          glass-divider(width: 180pt),
          text(size: 2.2em, weight: "bold", fill: palette.ink, body),
          glass-divider(width: 180pt),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Definition block -- left colored border + title, NO full border (borderless pattern)
#let definition-block(title, body) = {
  block(
    width: 100%,
    fill: none,
    stroke: (left: (paint: palette.accent, thickness: 3.5pt)),
    inset: (left: 1.2em, right: 1em, y: 0.7em),
    radius: 0pt,
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.accent, size: 0.9em)[#sym.diamond.filled #title],
      [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Theorem box -- full dashed border with golden accent + SVG corner marks
#let theorem-box(title, body) = {
  block(
    width: 100%,
    fill: palette.light-gold,
    stroke: (paint: palette.gold, thickness: 1.5pt, dash: "dashed"),
    inset: (x: 1.2em, y: 0.8em),
    radius: 4pt,
  )[
    // Corner marks
    #place(top + left, dx: -0.4em, dy: -0.3em, corner-mark-tl(color: palette.gold))
    #place(top + right, dx: 0.4em, dy: -0.3em, corner-mark-tr(color: palette.gold))
    #place(bottom + left, dx: -0.4em, dy: 0.3em, corner-mark-bl(color: palette.gold))
    #place(bottom + right, dx: 0.4em, dy: 0.3em, corner-mark-br(color: palette.gold))
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.gold, size: 0.9em)[#title],
      [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Proof block -- italic text with "Proof." prefix and tombstone symbol, NO border at all
#let proof-block(body) = {
  block(
    width: 100%,
    fill: none,
    inset: (x: 0.8em, y: 0.5em),
  )[
    #set text(fill: palette.ink, size: 0.82em, style: "italic")
    #text(weight: "bold", style: "italic")[Proof.] #body #h(1fr) #sym.square.filled
  ]
}

/// Example panel -- frosted glass fill (semi-transparent blue-gray) + subtle stroke
#let example-panel(title, body) = {
  block(
    width: 100%,
    fill: palette.panel-fill,
    stroke: (paint: palette.frost-stroke, thickness: 1pt),
    inset: (x: 1.1em, y: 0.8em),
    radius: 5pt,
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: palette.accent, size: 0.88em)[#title],
      [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Lecture tag -- inline pill/badge element
#let lecture-tag(content, color: palette.accent) = {
  box(
    fill: color.transparentize(85%),
    stroke: (paint: color, thickness: 1pt),
    inset: (x: 0.7em, y: 0.25em),
    radius: 99pt,
  )[
    #set text(fill: color, size: 0.72em, weight: "semibold")
    #content
  ]
}

/// Corollary note -- indented with left margin mark + muted background
#let corollary-note(title, body) = {
  block(
    width: 100%,
    fill: palette.corollary-bg,
    stroke: (left: (paint: palette.muted-ink, thickness: 2pt, dash: "dotted")),
    inset: (left: 1.5em, right: 1em, y: 0.7em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: palette.muted-ink, size: 0.85em)[#title],
      [
        #set text(fill: palette.ink, size: 0.8em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Formula display -- centered equation box with accent top border
#let formula-display(body) = {
  block(
    width: 100%,
    fill: palette.frost,
    stroke: (top: (paint: palette.accent, thickness: 2.5pt)),
    inset: (x: 1.5em, y: 1em),
    radius: (bottom: 4pt),
  )[
    #set std.align(center)
    #set text(fill: palette.ink, size: 1.05em)
    #body
  ]
}


// === 3. Theme Entry Point ===

#let lecture-hall-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  show raw: set text(font: "IBM Plex Mono")
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
