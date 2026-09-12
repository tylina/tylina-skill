// Zen Garden Theme -- Japanese Zen Rock Garden (枯山水 / Karesansui)
// You are standing at the edge of Ryoan-ji temple's stone garden.
// Raked sand patterns flow in parallel lines, smooth stones rest in silence,
// negative space IS the message, wabi-sabi embraces imperfection.
// Features: persistent raked sand atmosphere on content slides, stone-shaped cards,
// moss accents, pebble statistics, sand-line dividers.
// Touying 0.7.4 compatible. Rich tier.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow


// === Color Palette ===

#let palette = (
  primary: rgb("#4A4A4A"),         // warm stone grey
  dark: rgb("#2D2D2D"),            // deep shadow stone
  accent: rgb("#8B7355"),          // sand/earth tone
  moss: rgb("#6B7F5E"),            // subtle moss green
  bg: rgb("#FAF8F5"),              // warm off-white (raked sand)
  card: rgb("#F5F2ED"),            // aged paper / stone surface
  moss-card: rgb("#F2F4EF"),       // opaque moss-tinted callout surface
  text-dark: rgb("#2D2D2D"),       // deep charcoal
  text-body: rgb("#4A4A4A"),       // warm grey body text
  text-light: rgb("#706B64"),      // contrast-safe weathered stone caption
  accent-text: rgb("#765F45"),     // contrast-safe earth-tone foreground
  border: rgb("#E5E0D8"),          // subtle sand line
  sand: rgb("#D4CDB8"),            // raked sand pattern color
  stone-light: rgb("#C8C2B8"),     // light stone surface
)


// === SVG Definitions ===

// Raked sand parallel lines -- the signature pattern of karesansui gardens
// Represents the ocean/water abstracted into meditative parallel curves
// Used as PERSISTENT BACKGROUND on every content slide (bottom area)
#let _raked-sand-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="160" viewBox="0 0 840 160">
  <path d="M0,25 C80,20 160,30 240,25 C320,20 400,28 480,24 C560,20 640,28 720,23 C760,21 800,25 840,24" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <path d="M0,40 C80,35 160,45 240,40 C320,35 400,43 480,39 C560,35 640,43 720,38 C760,36 800,40 840,39" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.14"/>
  <path d="M0,55 C80,50 160,60 240,55 C320,50 400,58 480,54 C560,50 640,58 720,53 C760,51 800,55 840,54" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.13"/>
  <path d="M0,70 C80,65 160,75 240,70 C320,65 400,73 480,69 C560,65 640,73 720,68 C760,66 800,70 840,69" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <path d="M0,85 C80,80 160,90 240,85 C320,80 400,88 480,84 C560,80 640,88 720,83 C760,81 800,85 840,84" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.11"/>
  <path d="M0,100 C80,95 160,105 240,100 C320,95 400,103 480,99 C560,95 640,103 720,98 C760,96 800,100 840,99" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.10"/>
  <path d="M0,115 C80,110 160,120 240,115 C320,110 400,118 480,114 C560,110 640,118 720,113 C760,111 800,115 840,114" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.09"/>
  <path d="M0,130 C80,125 160,135 240,130 C320,125 400,133 480,129 C560,125 640,133 720,128 C760,126 800,130 840,129" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.08"/>
  <path d="M0,145 C80,140 160,150 240,145 C320,140 400,148 480,144 C560,140 640,148 720,143 C760,141 800,145 840,144" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.07"/>
  <circle cx="650" cy="80" r="35" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.06"/>
  <circle cx="650" cy="80" r="45" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.05"/>
  <circle cx="650" cy="80" r="55" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.04"/>
</svg>
```.text

// Smooth stones / pebbles -- organic rounded shapes arranged in groups
// Represents the islands/mountains in the dry landscape
// Used on title and ending slides as bookending element
#let _stones-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="120" viewBox="0 0 300 120">
  <ellipse cx="120" cy="75" rx="45" ry="30" fill="currentColor" opacity="0.12" transform="rotate(-8, 120, 75)"/>
  <ellipse cx="120" cy="75" rx="42" ry="27" fill="currentColor" opacity="0.06" transform="rotate(-8, 120, 75)"/>
  <ellipse cx="200" cy="82" rx="30" ry="20" fill="currentColor" opacity="0.10" transform="rotate(5, 200, 82)"/>
  <ellipse cx="200" cy="82" rx="27" ry="17" fill="currentColor" opacity="0.05" transform="rotate(5, 200, 82)"/>
  <ellipse cx="60" cy="88" rx="18" ry="13" fill="currentColor" opacity="0.09" transform="rotate(-3, 60, 88)"/>
  <ellipse cx="260" cy="90" rx="12" ry="9" fill="currentColor" opacity="0.08" transform="rotate(12, 260, 90)"/>
  <ellipse cx="248" cy="95" rx="8" ry="6" fill="currentColor" opacity="0.07" transform="rotate(-5, 248, 95)"/>
  <ellipse cx="272" cy="94" rx="9" ry="7" fill="currentColor" opacity="0.06" transform="rotate(8, 272, 94)"/>
  <ellipse cx="120" cy="98" rx="40" ry="5" fill="currentColor" opacity="0.04"/>
  <ellipse cx="200" cy="97" rx="25" ry="4" fill="currentColor" opacity="0.03"/>
  <ellipse cx="60" cy="97" rx="15" ry="3" fill="currentColor" opacity="0.03"/>
</svg>
```.text


// === SVG Rendering Helpers ===

/// Render raked sand background (persistent atmosphere on every content slide)
#let _sand-bg() = {
  let svg = _raked-sand-svg.replace("currentColor", palette.accent.to-hex())
  place(bottom + left,
    box(width: 100%, height: 34%,
      image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
}

/// Render stones arrangement
#let _stones-arrangement(color: palette.primary, width: 240pt) = {
  let svg = _stones-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}


// === Background Atmosphere (MANDATORY on every content slide) ===

/// Persistent "zen garden" feeling: faint raked sand lines + tiny pebble dots
#let _slide-atmosphere() = {
  // Raked sand pattern at bottom
  _sand-bg()
  // Tiny stone dots in corners suggesting emptiness punctuated by form
  place(top + right, dx: -2.5em, dy: 0.8em,
    box(circle(radius: 2pt, fill: palette.stone-light.transparentize(60%))))
  place(top + right, dx: -4em, dy: 1.5em,
    box(circle(radius: 1.2pt, fill: palette.stone-light.transparentize(70%))))
}


// === 1. Slide Functions ===

/// Standard content slide -- clean header with thin sand-colored accent line
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2.2em, top: 0.8em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Thin accent line -- minimal, like a single rake stroke
      block(width: 50pt, height: 1.5pt, fill: palette.accent.transparentize(40%)),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2.2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Small stone dot as center marker
        box(circle(radius: 2pt, fill: palette.accent.transparentize(50%)))
      },
      {
        set std.align(right)
        context { text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number] }
      },
    )
  }
  let setting(body) = {
    _slide-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- spacious, centered, stones arrangement as bookending element
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm sand background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Stones arrangement at bottom-right (bookending element)
    place(bottom + right, dx: -1em, dy: -0.5em,
      _stones-arrangement(color: palette.primary, width: 260pt))
    // Full raked sand at bottom (stronger for title)
    {
      let svg = _raked-sand-svg.replace("currentColor", palette.accent.to-hex()).replace("opacity=\"0.15\"", "opacity=\"0.22\"").replace("opacity=\"0.14\"", "opacity=\"0.20\"").replace("opacity=\"0.13\"", "opacity=\"0.18\"").replace("opacity=\"0.12\"", "opacity=\"0.16\"")
      place(bottom + left,
        box(width: 100%, height: 40%,
          image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
    }
    // Center content with generous spacing
    set std.align(center + horizon)
    pad(x: 6em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "semibold", fill: palette.text-dark, info.title),
        std.align(center, block(width: 60pt, height: 1.5pt, fill: palette.accent.transparentize(30%))),
        if info.subtitle != none { text(size: 1em, fill: palette.text-body, info.subtitle) },
        if info.author != none { text(size: 0.9em, fill: palette.text-light, info.author) },
        if info.institution != none { text(size: 0.78em, fill: palette.text-light, info.institution) },
        if info.date != none { text(size: 0.72em, fill: palette.text-light)[#utils.display-info-date(self)] },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// New section slide -- spacious with large section number and minimal decoration
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Sand background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Subtle raked sand
    _sand-bg()
    // Section content -- left-aligned with generous whitespace
    std.align(left + horizon,
      block(width: 70%, inset: (left: 5em, right: 4em))[
        #stack(
          spacing: .8em,
          text(size: 3.5em, fill: palette.text-light.transparentize(40%), weight: "light")[
            #utils.display-current-heading-number(depth: 1, numbering: "1")
          ],
          {
            set text(fill: palette.text-dark, size: 2em, weight: "medium")
            utils.display-current-heading(level: 1, numbered: false)
          },
          block(width: 40pt, height: 1.5pt, fill: palette.accent.transparentize(30%)),
        )
      ]
    )
    // Small stone accent in bottom-right
    place(bottom + right, dx: -3em, dy: -2em,
      box(circle(radius: 5pt, fill: palette.stone-light.transparentize(40%))))
    place(bottom + right, dx: -5em, dy: -2.5em,
      box(circle(radius: 3pt, fill: palette.stone-light.transparentize(55%))))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- maximum emptiness, centered text, contemplative
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Slightly warmer background for contemplation
    place(top + left, block(width: 100%, height: 100%, fill: palette.card))
    // Very subtle sand lines
    _sand-bg()
    // Center content with ample breathing room
    std.align(center + horizon,
      block(width: 70%, inset: (x: 2em, y: 1.5em))[
        #set std.align(center)
        #stack(
          spacing: 0.8em,
          {
            set text(fill: palette.text-dark, size: 1.3em, weight: "medium")
            body
          },
          box(circle(radius: 3pt, fill: palette.accent.transparentize(40%))),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- bookends with title: stones arrangement + sand patterns
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // Sand background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Stones arrangement at bottom-right (bookends with title slide)
    place(bottom + right, dx: -1em, dy: -0.5em,
      _stones-arrangement(color: palette.primary, width: 260pt))
    // Stronger raked sand (bookends with title)
    {
      let svg = _raked-sand-svg.replace("currentColor", palette.accent.to-hex()).replace("opacity=\"0.15\"", "opacity=\"0.22\"").replace("opacity=\"0.14\"", "opacity=\"0.20\"").replace("opacity=\"0.13\"", "opacity=\"0.18\"").replace("opacity=\"0.12\"", "opacity=\"0.16\"")
      place(bottom + left,
        box(width: 100%, height: 40%,
          image(bytes(svg), width: 100%, height: 100%, fit: "cover")))
    }
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "medium", fill: palette.text-dark, body),
        std.align(center, block(width: 50pt, height: 1.5pt, fill: palette.accent.transparentize(30%))),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Stone card -- rounded, organic shape with very subtle shadow (like a smooth stone)
#let stone-card(title, body, accent: palette.primary) = {
  shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 5%), radius: 12pt)[
    #block(
      width: 100%,
      fill: palette.card,
      stroke: 0.5pt + palette.border,
      inset: (x: 1.2em, y: 0.9em),
      radius: 12pt,
    )[
      #stack(
        spacing: .8em,
        text(weight: "medium", fill: accent.darken(12%), size: 0.88em, title),
        { set text(fill: palette.text-body, size: 0.82em); body },
        lazy-v(1fr),
      )
    ]
  ]
}

/// Sand divider -- SVG-based raked line separator (NOT a plain line)
#let sand-divider(color: palette.accent, width: 80%) = {
  let svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="12" viewBox="0 0 400 12">
    <path d="M0,4 C20,3.5 40,4.5 60,4 C80,3.5 100,4.5 120,4 C140,3.5 160,4.5 180,4 C200,3.5 220,4.5 240,4 C260,3.5 280,4.5 300,4 C320,3.5 340,4.5 360,4 C380,3.5 395,4 400,4" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.5"/>
    <path d="M0,8 C20,7.5 40,8.5 60,8 C80,7.5 100,8.5 120,8 C140,7.5 160,8.5 180,8 C200,7.5 220,8.5 240,8 C260,7.5 280,8.5 300,8 C320,7.5 340,8.5 360,8 C380,7.5 395,8 400,8" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.35"/>
</svg>
```.text
  let rendered = svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(rendered), width: width, height: 8pt)))
}

/// Moss highlight -- subtle green accent block (like moss between stones)
#let moss-highlight(title, body) = {
  block(
    width: 100%,
    fill: palette.moss-card,
    stroke: (left: 2.5pt + palette.moss.transparentize(40%)),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 6pt),
  )[
    #stack(spacing: .8em,
      text(weight: "medium", fill: palette.moss.darken(10%), size: 0.88em, title),
      { set text(fill: palette.text-body, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Pebble stat -- circular number display (like a smooth river pebble)
#let pebble-stat(label, value, accent: palette.primary) = {
  block(width: 100%, fill: palette.card, inset: (x: 0.8em, y: 0.6em), radius: 8pt, stroke: 0.5pt + palette.border)[
    #set std.align(center)
    #stack(
      spacing: .8em,
      box(
        width: 72pt, height: 52pt,
        fill: accent.transparentize(90%),
        stroke: 0.8pt + accent.transparentize(60%),
        radius: 50%,
        inset: 0pt,
      )[
        #set std.align(center + horizon)
        #text(fill: accent.darken(12%), size: 1.5em, weight: "semibold", value)
      ],
      text(fill: palette.text-light, size: 0.72em, label),
    )
  ]
}

/// Garden verse -- contemplative quote with generous whitespace
#let garden-verse(quote, author: none) = {
  block(width: 100%, fill: palette.bg, inset: (x: 2em, y: 1.2em))[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(fill: palette.text-dark, size: 0.92em, style: "italic", quote),
      if author != none {
        text(fill: palette.accent-text, size: 0.75em, weight: "medium", style: "normal")[-- #author]
      },
    )
  ]
}

/// Stone tag -- small inline tag (like a pebble label)
#let stone-tag(content, color: palette.accent) = {
  box(
    fill: color.lighten(88%),
    stroke: 0.5pt + color.transparentize(50%),
    inset: (x: 0.6em, y: 0.2em),
    radius: 8pt,
  )[
    #set text(fill: color.darken(12%), size: 0.72em, weight: "medium")
    #content
  ]
}

/// Rock grouping -- borderless section with title + sand divider (typography/spacing only)
#let rock-grouping(title, body) = {
  block(width: 100%, fill: palette.bg)[
    #stack(spacing: .8em,
      text(fill: palette.text-dark, size: 0.92em, weight: "medium", title),
      sand-divider(color: palette.accent, width: 100%),
      { set text(fill: palette.text-body, size: 0.82em); body },
    )
  ]
}

/// Zen box -- minimal card with NO visible border, just subtle fill and spacing
#let zen-box(title, body) = {
  block(
    width: 100%,
    fill: palette.bg,
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      text(weight: "medium", fill: palette.text-dark, size: 0.88em, title),
      { set text(fill: palette.text-body, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}


// === 3. Theme Entry Point ===

#let zen-garden-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-dark)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
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
