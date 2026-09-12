// Amber Ink Theme — Vintage Letterpress / Typography Aesthetic
// The world is a master printer's workshop where movable type is set with precision
// and inked with warm amber pigments. Craft, authority, and timeless elegance.
// Sepia/amber tones on warm cream — premium editorial/business style suitable for
// publishing, media, consulting, investment, executive communications.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ════════════════════════════════════════════════════════════════════════
// Color Palette (Light Theme — Warm Cream & Amber)
// ════════════════════════════════════════════════════════════════════════

#let palette = (
  bg: rgb("#FDFAF5"),            // warm cream white
  primary: rgb("#8B5E3C"),       // amber / burnt sienna
  secondary: rgb("#C47B2B"),     // warm golden amber
  secondary-text: rgb("#9A5712"),// accessible amber for text on light fills
  tertiary: rgb("#5B6B4E"),      // olive ink green
  text-dark: rgb("#2A2018"),     // near-black sepia
  text-body: rgb("#4A3B2E"),     // warm dark brown
  card: rgb("#FFFEF9"),          // soft cream card
  border: rgb("#DFC9A8"),        // aged amber border
  print: rgb("#F5EFE4"),         // printing paper fill
  text-muted: rgb("#6F6255"),    // accessible muted label text
)


// ════════════════════════════════════════════════════════════════════════
// SVG Definitions — Complex letterpress/typography decorations
// ════════════════════════════════════════════════════════════════════════

// Paper grain texture — full-page subtle aged paper grain
// (cross-hatched fiber pattern simulating handmade paper)
#let _paper-grain-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <line x1="0" y1="20" x2="840" y2="22" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="55" x2="840" y2="53" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <line x1="0" y1="88" x2="840" y2="90" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="125" x2="840" y2="123" stroke="currentColor" stroke-width="0.25" opacity="0.03"/>
  <line x1="0" y1="158" x2="840" y2="160" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="195" x2="840" y2="193" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <line x1="0" y1="230" x2="840" y2="232" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="268" x2="840" y2="266" stroke="currentColor" stroke-width="0.25" opacity="0.03"/>
  <line x1="0" y1="305" x2="840" y2="307" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="340" x2="840" y2="338" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <line x1="0" y1="378" x2="840" y2="380" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="415" x2="840" y2="413" stroke="currentColor" stroke-width="0.25" opacity="0.03"/>
  <line x1="0" y1="450" x2="840" y2="452" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="45" y1="0" x2="47" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <line x1="120" y1="0" x2="118" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="200" y1="0" x2="202" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <line x1="285" y1="0" x2="283" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="370" y1="0" x2="372" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <line x1="455" y1="0" x2="453" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="540" y1="0" x2="542" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <line x1="625" y1="0" x2="623" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="710" y1="0" x2="712" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <line x1="790" y1="0" x2="788" y2="474" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <circle cx="150" cy="80" r="0.8" fill="currentColor" opacity="0.04"/>
  <circle cx="380" cy="140" r="0.6" fill="currentColor" opacity="0.035"/>
  <circle cx="620" cy="95" r="0.7" fill="currentColor" opacity="0.04"/>
  <circle cx="250" cy="320" r="0.9" fill="currentColor" opacity="0.03"/>
  <circle cx="500" cy="380" r="0.7" fill="currentColor" opacity="0.04"/>
  <circle cx="700" cy="260" r="0.6" fill="currentColor" opacity="0.035"/>
  <circle cx="90" cy="200" r="0.8" fill="currentColor" opacity="0.03"/>
  <circle cx="440" cy="440" r="0.7" fill="currentColor" opacity="0.04"/>
</svg>
```.text

// Ornamental letterpress frame — used on title and ending slides (bookending)
// Features: corner ornaments, decorative rule lines, printer's marks
#let _letterpress-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M40,40 C40,30 50,25 55,30 C60,25 70,30 70,40 C70,50 55,55 55,45 C55,55 40,50 40,40Z" fill="currentColor" opacity="0.2"/>
  <circle cx="55" cy="38" r="3" fill="currentColor" opacity="0.15"/>
  <path d="M35,50 L75,50" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <path d="M55,25 L55,55" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <path d="M770,40 C770,30 780,25 785,30 C790,25 800,30 800,40 C800,50 785,55 785,45 C785,55 770,50 770,40Z" fill="currentColor" opacity="0.2"/>
  <circle cx="785" cy="38" r="3" fill="currentColor" opacity="0.15"/>
  <path d="M765,50 L805,50" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <path d="M785,25 L785,55" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <path d="M40,434 C40,424 50,419 55,424 C60,419 70,424 70,434 C70,444 55,449 55,439 C55,449 40,444 40,434Z" fill="currentColor" opacity="0.2"/>
  <circle cx="55" cy="432" r="3" fill="currentColor" opacity="0.15"/>
  <path d="M35,424 L75,424" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <path d="M770,434 C770,424 780,419 785,424 C790,419 800,424 800,434 C800,444 785,449 785,439 C785,449 770,444 770,434Z" fill="currentColor" opacity="0.2"/>
  <circle cx="785" cy="432" r="3" fill="currentColor" opacity="0.15"/>
  <path d="M765,424 L805,424" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <line x1="80" y1="38" x2="360" y2="38" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <line x1="80" y1="42" x2="360" y2="42" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <line x1="480" y1="38" x2="760" y2="38" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <line x1="480" y1="42" x2="760" y2="42" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <polygon points="420,30 430,40 420,50 410,40" fill="currentColor" opacity="0.15"/>
  <circle cx="420" cy="40" r="4" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <line x1="80" y1="432" x2="360" y2="432" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <line x1="80" y1="436" x2="360" y2="436" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <line x1="480" y1="432" x2="760" y2="432" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <line x1="480" y1="436" x2="760" y2="436" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <polygon points="420,424 430,434 420,444 410,434" fill="currentColor" opacity="0.15"/>
  <circle cx="420" cy="434" r="4" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <line x1="30" y1="60" x2="30" y2="414" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="810" y1="60" x2="810" y2="414" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
</svg>
```.text

// Typographic flourish — ornamental divider with swashes
// Used as a decorative separator between content sections
#let _flourish-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="24" viewBox="0 0 400 24">
  <polygon points="200,4 206,12 200,20 194,12" fill="currentColor" opacity="0.5"/>
  <path d="M190,12 C170,12 160,6 140,6 C120,6 110,12 90,12" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <path d="M190,12 C170,12 160,18 140,18 C120,18 110,12 90,12" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25" stroke-linecap="round"/>
  <path d="M210,12 C230,12 240,6 260,6 C280,6 290,12 310,12" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <path d="M210,12 C230,12 240,18 260,18 C280,18 290,12 310,12" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.25" stroke-linecap="round"/>
  <circle cx="85" cy="12" r="2.5" fill="currentColor" opacity="0.35"/>
  <circle cx="315" cy="12" r="2.5" fill="currentColor" opacity="0.35"/>
  <line x1="20" y1="12" x2="82" y2="12" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
  <line x1="318" y1="12" x2="380" y2="12" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
</svg>
```.text

// Printer's corner marks — registration marks for content slides
// Subtle L-shaped crop marks at corners (printer's registration)
#let _corner-marks-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <line x1="15" y1="8" x2="15" y2="22" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <line x1="8" y1="15" x2="22" y2="15" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <circle cx="15" cy="15" r="4" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="825" y1="8" x2="825" y2="22" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <line x1="818" y1="15" x2="832" y2="15" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <circle cx="825" cy="15" r="4" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="15" y1="452" x2="15" y2="466" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <line x1="8" y1="459" x2="22" y2="459" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <circle cx="15" cy="459" r="4" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="825" y1="452" x2="825" y2="466" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <line x1="818" y1="459" x2="832" y2="459" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <circle cx="825" cy="459" r="4" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.08"/>
  <line x1="30" y1="0" x2="30" y2="6" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <line x1="810" y1="0" x2="810" y2="6" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <line x1="30" y1="468" x2="30" y2="474" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
  <line x1="810" y1="468" x2="810" y2="474" stroke="currentColor" stroke-width="0.4" opacity="0.06"/>
</svg>
```.text

// Vintage number frame — decorative frame around KPI values
#let _number-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="60" viewBox="0 0 80 60">
  <rect x="4" y="4" width="72" height="52" rx="4" ry="4" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.3"/>
  <rect x="8" y="8" width="64" height="44" rx="2" ry="2" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.2"/>
  <polygon points="8,8 12,4 16,8 12,12" fill="currentColor" opacity="0.2"/>
  <polygon points="64,8 68,4 72,8 68,12" fill="currentColor" opacity="0.2"/>
  <polygon points="8,48 12,44 16,48 12,52" fill="currentColor" opacity="0.2"/>
  <polygon points="64,48 68,44 72,48 68,52" fill="currentColor" opacity="0.2"/>
  <circle cx="40" cy="4" r="2" fill="currentColor" opacity="0.25"/>
  <circle cx="40" cy="56" r="2" fill="currentColor" opacity="0.25"/>
</svg>
```.text


// ════════════════════════════════════════════════════════════════════════
// SVG Rendering Helpers
// ════════════════════════════════════════════════════════════════════════

/// Render paper grain texture as background
#let _paper-grain(color: palette.primary) = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_paper-grain-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%, fit: "cover")))
}

/// Render letterpress frame (bookending title/ending)
#let _letterpress-frame(color: palette.primary) = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_letterpress-frame-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%, fit: "cover")))
}

/// Render corner registration marks (content slides)
#let _corner-marks(color: palette.primary) = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_corner-marks-svg.replace("currentColor", color.to-hex())), width: 100%, height: 100%, fit: "cover")))
}

/// Render the typographic flourish divider
#let _render-flourish(color: palette.primary, width: 100%) = {
  let svg = _flourish-divider-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 14pt))
}


// ════════════════════════════════════════════════════════════════════════
// Background Atmosphere — Persistent on EVERY content slide
// ════════════════════════════════════════════════════════════════════════

/// Aged paper texture + printer's corner registration marks
#let _bg-atmosphere() = {
  // Paper grain texture (full-page)
  _paper-grain(color: palette.primary)
  // Printer's registration corner marks
  _corner-marks(color: palette.primary)
}


// ════════════════════════════════════════════════════════════════════════
// 1. Slide Functions
// ════════════════════════════════════════════════════════════════════════

/// Standard content slide — warm cream bg, amber header rule, persistent atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Amber rule line with terminal dots
      stack(dir: ltr, spacing: 0pt,
        box(circle(radius: 2.5pt, fill: palette.primary)),
        box(width: 60pt, height: 2pt, fill: gradient.linear(palette.primary, palette.secondary, angle: 0deg)),
        box(circle(radius: 2pt, fill: palette.secondary.transparentize(30%))),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.6em)
    place(left + horizon,
      box(width: 100%)[
        #grid(
          columns: (1fr, auto, 1fr),
          {
            if self.store.footer != none {
              utils.call-or-display(self, self.store.footer)
            }
          },
          rotate(45deg, square(size: 3.5pt, fill: palette.primary.transparentize(50%))),
          {
            set std.align(right)
            context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
          },
        )
      ],
    )
  }
  let setting(body) = {
    // PERSISTENT ATMOSPHERE on every content slide
    _bg-atmosphere()
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

/// Title slide — ornamental letterpress frame, typographic flourishes (bookending)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Paper grain texture
    _paper-grain(color: palette.primary)
    // Letterpress ornamental frame (BOOKENDING element)
    _letterpress-frame(color: palette.primary)
    // Center content
    set std.align(center + horizon)
    pad(x: 6em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.primary, info.title),
        std.align(center, _render-flourish(color: palette.primary, width: 60%)),
        { if info.subtitle != none { text(size: 1em, fill: palette.text-body, style: "italic", info.subtitle) } },
        { if info.author != none { text(size: 0.9em, fill: palette.text-dark, weight: "medium", info.author) } },
        { if info.institution != none { text(size: 0.8em, fill: palette.text-muted, info.institution) } },
        { if info.date != none { text(size: 0.75em, fill: palette.text-muted, utils.display-info-date(self)) } },
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

/// New section slide — large section heading with amber accent and olive rule
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
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Subtle paper grain
    _paper-grain(color: palette.tertiary)
    // Left amber accent bar
    place(top + left, dx: 2.5em,
      block(width: 3pt, height: 100%, fill: gradient.linear(palette.primary, palette.secondary, angle: 180deg)))
    // Section content stays in flow so diagnostics can measure meaningful content.
    set std.align(center + horizon)
    block(width: 70%, inset: (left: 5em, right: 3em))[
      #stack(
        spacing: .8em,
        text(size: 4em, fill: palette.primary.transparentize(65%), weight: "semibold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        text(fill: palette.text-dark, size: 2em, weight: "semibold", utils.display-current-heading(level: 1, numbered: false)),
        _render-flourish(color: palette.primary, width: 50%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep sepia background with cream text, centered message
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
    // Deep sepia background
    place(top + left, block(width: 100%, height: 100%, fill: palette.text-dark))
    // Subtle grain on dark
    _paper-grain(color: palette.bg)
    // Top and bottom amber rules
    place(top + left, dy: 32pt,
      box(width: 100%, std.align(center, box(width: 70%, height: 1.5pt,
        fill: gradient.linear(palette.primary.transparentize(60%), palette.primary, palette.primary.transparentize(60%))))))
    place(bottom + left, dy: -32pt,
      box(width: 100%, std.align(center, box(width: 70%, height: 1.5pt,
        fill: gradient.linear(palette.primary.transparentize(60%), palette.primary, palette.primary.transparentize(60%))))))
    // Centered content stays in flow so diagnostics can measure meaningful content.
    set std.align(center + horizon)
    block(width: 75%, inset: (x: 2em, y: 1.5em))[
      #set std.align(center)
      #set text(fill: palette.bg, size: 1.4em, weight: "bold")
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — table of contents with typographic styling
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: (x: 4em, y: 3em)),
  )
  let main-body = {
    // Atmosphere
    _bg-atmosphere()
    stack(
      spacing: .8em,
      stack(
        spacing: .8em,
        text(size: 1.6em, weight: "semibold", fill: palette.primary, title),
        box(width: 50pt, height: 2pt, fill: palette.primary),
      ),
      {
        set text(size: 0.9em, fill: palette.text-dark, weight: "regular")
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — bookends with title: letterpress frame + corner ornaments
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
    // Paper grain
    _paper-grain(color: palette.primary)
    // Letterpress frame (BOOKENDING with title slide)
    _letterpress-frame(color: palette.primary)
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: palette.primary, body),
        _render-flourish(color: palette.primary, width: 55%),
        text(size: 0.8em, fill: palette.text-muted)[Set in type with care],
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ════════════════════════════════════════════════════════════════════════
// 2. Reusable Components (11 total — structurally diverse)
// ════════════════════════════════════════════════════════════════════════

/// press-card — card with ornamental press border (double-line + corner dots)
#let press-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.8pt + palette.border,
    inset: 0pt,
    radius: 2pt,
  )[
    // Header with amber fill
    #stack(spacing: 0pt,
      block(width: 100%, fill: palette.primary.transparentize(88%), inset: (x: 1em, y: 0.5em), radius: (top: 2pt))[
        #text(weight: "bold", fill: palette.primary, size: 0.88em, title)
      ],
      // Amber rule separator
      block(width: 100%, height: 1.5pt, fill: palette.primary.transparentize(60%)),
      // Body content
      block(width: 100%, fill: palette.card, inset: (x: 1em, top: 0.5em, bottom: 0.7em), radius: (bottom: 2pt))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ],
    )
    // Corner dots (ornamental press marks)
    #place(top + left, dx: 3pt, dy: 3pt, circle(radius: 1.8pt, fill: palette.primary.transparentize(50%)))
    #place(top + right, dx: -3pt, dy: 3pt, circle(radius: 1.8pt, fill: palette.primary.transparentize(50%)))
    #place(bottom + left, dx: 3pt, dy: -3pt, circle(radius: 1.8pt, fill: palette.primary.transparentize(50%)))
    #place(bottom + right, dx: -3pt, dy: -3pt, circle(radius: 1.8pt, fill: palette.primary.transparentize(50%)))
    #lazy-v(1fr)
  ]
}

/// edition-box — highlighted section with amber rule accent (editorial column style)
#let edition-box(title, body) = {
  block(
    width: 100%,
    fill: palette.print,
    stroke: (left: 3pt + palette.secondary),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.secondary-text, size: 0.88em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// ornament-divider — SVG typographic flourish divider
#let ornament-divider(color: palette.primary) = {
  std.align(center, _render-flourish(color: color, width: 70%))
}

/// type-tag — small inline tag with printer's diamond mark
#let type-tag(label, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.6pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.15em),
    radius: 2pt,
  )[
    #set text(fill: color, size: 0.7em, weight: "semibold")
    #box(width: 4pt, height: 4pt,
      place(center + horizon, rotate(45deg, square(size: 3pt, fill: color.transparentize(30%)))))
    #h(3pt)
    #label
  ]
}

/// kpi-card — metric display with vintage number frame decoration
#let kpi-card(value, label) = {
  block(
    width: 100%,
    fill: palette.card,
    inset: (x: 0.8em, y: 0.6em),
    radius: 3pt,
    stroke: 0.5pt + palette.border,
  )[
    #set std.align(center)
    // Frame, value, and label form one centered vertical rhythm.
    #stack(
      spacing: .8em,
      box(width: 100%, height: 60pt)[
        #place(center + horizon,
          image(bytes(_number-frame-svg.replace("currentColor", palette.primary.to-hex())), width: 90pt, height: 60pt))
        #place(center + horizon,
          text(size: 1.3em, weight: "bold", fill: palette.primary, value))
      ],
      text(fill: palette.text-muted, size: 0.72em, label),
    )
    #lazy-v(1fr)
  ]
}

/// editorial-card — clean editorial column container with olive accent
#let editorial-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 2.5pt + palette.tertiary),
    inset: (x: 1.1em, top: 0.7em, bottom: 0.8em),
    radius: (bottom: 2pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: palette.tertiary, size: 0.88em, title),
      block(width: 100%, height: 0.5pt, fill: palette.border),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ]
    )
    #lazy-v(1fr)
  ]
}

/// insight-box — callout with amber accent bar and background
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.secondary.transparentize(90%),
    stroke: (left: 3.5pt + palette.secondary, rest: 0.5pt + palette.border),
    inset: (x: 1.2em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.secondary-text, size: 0.85em)[#sym.diamond.filled #h(4pt) #title],
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// comparison-table — elegant table with amber header and rule accents
#let comparison-table(align: center + horizon, headers, ..rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary.transparentize(85%) }
      else if calc.odd(row) { palette.print } else { palette.card },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.primary, size: 0.8em, h))),
    ..rows.pos().flatten().map(c => text(fill: palette.text-body, size: 0.78em, c)),
  )
}

/// timeline-point — timeline entry with vintage dot marker and date
#let timeline-point(date, body) = {
  block(width: 100%)[
    #grid(
      columns: (20pt, 60pt, 1fr),
      column-gutter: 4pt,
      // Timeline dot and line
      box(width: 20pt, height: 20pt)[
        #place(center + horizon, block(width: 1.5pt, height: 26pt, fill: palette.border))
        #place(center + horizon, circle(radius: 4.5pt, fill: palette.primary))
      ],
      std.align(left + horizon, text(weight: "bold", fill: palette.primary, size: 0.68em, date)),
      {
        set text(fill: palette.text-body, size: 0.7em)
        set std.align(left + horizon)
        body
      },
    )
  ]
}

/// quote-press — quotation with ornamental amber marks
#let quote-press(body, source) = {
  block(
    width: 100%,
    fill: palette.print,
    inset: (x: 1.5em, y: 1em),
    radius: 3pt,
    stroke: none,
  )[
    // Opening quote mark
    #place(top + left, dx: 0.2em, dy: -0.2em,
      text(size: 2em, fill: palette.primary.transparentize(50%), weight: "bold")["])
    #stack(
      spacing: .8em,
      [
        #set text(fill: palette.text-dark, size: 0.88em, style: "italic")
        #body
      ],
      std.align(right, text(fill: palette.primary, size: 0.72em, weight: "semibold", style: "normal")[-- #source]),
    )
  ]
}

/// footnote-block — fine-print attribution style block
#let footnote-block(body) = {
  block(
    width: 100%,
    inset: (x: 0.8em, y: 0.4em),
  )[
    #stack(
      spacing: .8em,
      block(width: 100%, height: 0.5pt, fill: palette.border),
      [
        #set text(fill: palette.text-muted, size: 0.65em)
        #body
      ],
    )
  ]
}


// ════════════════════════════════════════════════════════════════════════
// 3. Theme Entry Point
// ════════════════════════════════════════════════════════════════════════

#let amber-ink-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-dark)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2.2em),
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
