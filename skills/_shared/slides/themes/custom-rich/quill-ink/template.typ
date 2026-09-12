// Quill Ink Theme — Calligraphic ink-on-parchment aesthetic
// Deep indigo ink strokes on warm ivory paper. A scholar's writing desk aesthetic.
// Elegant, literary, and timeless. Suitable for humanities, philosophy, literature, history.
// Features: ink splatter drops, calligraphic flourishes, quill pen ornaments, parchment texture
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  bg: rgb("#FBF9F4"),              // Warm ivory/parchment background
  primary: rgb("#2C3E6B"),         // Deep indigo ink
  secondary: rgb("#8B4513"),       // Warm sienna/sepia
  tertiary: rgb("#4A6741"),        // Forest green ink
  text-dark: rgb("#1A1A2E"),       // Near-black ink
  text-body: rgb("#3D3D5C"),       // Dark indigo body
  text-muted: rgb("#7A7A99"),      // Muted indigo-gray
  card-bg: rgb("#FFFEF9"),         // Cream white
  border: rgb("#D4C5A9"),          // Aged paper edge
  accent-muted: rgb("#E8DCC8"),    // Parchment accent
  sepia-faint: rgb("#8B4513").transparentize(88%),
)


// === SVG Definitions ===

// Parchment texture — aged paper grain with subtle irregular fibers
#let _parchment-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <rect width="800" height="450" fill="none"/>
  <line x1="0" y1="25" x2="800" y2="27" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="58" x2="800" y2="56" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <line x1="0" y1="92" x2="800" y2="93" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="128" x2="800" y2="126" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="0" y1="165" x2="800" y2="167" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="198" x2="800" y2="196" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <line x1="0" y1="234" x2="800" y2="235" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="0" y1="270" x2="800" y2="268" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="308" x2="800" y2="310" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <line x1="0" y1="345" x2="800" y2="343" stroke="currentColor" stroke-width="0.3" opacity="0.04"/>
  <line x1="0" y1="380" x2="800" y2="382" stroke="currentColor" stroke-width="0.2" opacity="0.03"/>
  <line x1="0" y1="418" x2="800" y2="416" stroke="currentColor" stroke-width="0.25" opacity="0.035"/>
  <path d="M50,0 Q55,225 48,450" fill="none" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <path d="M160,0 Q155,200 162,450" fill="none" stroke="currentColor" stroke-width="0.2" opacity="0.02"/>
  <path d="M310,0 Q315,240 308,450" fill="none" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <path d="M480,0 Q475,210 483,450" fill="none" stroke="currentColor" stroke-width="0.15" opacity="0.02"/>
  <path d="M620,0 Q625,230 618,450" fill="none" stroke="currentColor" stroke-width="0.2" opacity="0.025"/>
  <path d="M740,0 Q735,220 742,450" fill="none" stroke="currentColor" stroke-width="0.15" opacity="0.02"/>
  <circle cx="120" cy="80" r="1.2" fill="currentColor" opacity="0.03"/>
  <circle cx="380" cy="150" r="0.8" fill="currentColor" opacity="0.025"/>
  <circle cx="600" cy="300" r="1" fill="currentColor" opacity="0.03"/>
  <circle cx="200" cy="380" r="0.7" fill="currentColor" opacity="0.02"/>
</svg>```.text

// Calligraphic flourish — ornamental swash decoration
#let _calligraphic-flourish-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="24" viewBox="0 0 300 24">
  <path d="M20,12 C30,12 40,6 60,6 C80,6 85,12 100,12 C115,12 120,8 135,8 C145,8 148,12 150,12 C152,12 155,8 165,8 C180,8 185,12 200,12 C215,12 220,6 240,6 C260,6 270,12 280,12" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M10,12 C12,10 15,8 20,12" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.7"/>
  <path d="M280,12 C285,8 288,10 290,12" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.7"/>
  <circle cx="150" cy="12" r="2.5" fill="currentColor" opacity="0.8"/>
  <circle cx="130" cy="10" r="1.2" fill="currentColor" opacity="0.4"/>
  <circle cx="170" cy="10" r="1.2" fill="currentColor" opacity="0.4"/>
  <path d="M5,14 C7,16 10,14 12,12" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.5"/>
  <path d="M288,14 C290,16 293,14 295,12" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.5"/>
</svg>```.text

// Ink drops/splatter — scattered ink drops suggesting a quill pen at work
#let _ink-drops-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80">
  <circle cx="40" cy="35" r="6" fill="currentColor" opacity="0.35"/>
  <circle cx="55" cy="45" r="3.5" fill="currentColor" opacity="0.25"/>
  <circle cx="28" cy="50" r="2.5" fill="currentColor" opacity="0.2"/>
  <circle cx="48" cy="58" r="1.8" fill="currentColor" opacity="0.18"/>
  <circle cx="35" cy="22" r="2" fill="currentColor" opacity="0.22"/>
  <ellipse cx="62" cy="32" rx="2" ry="3" fill="currentColor" opacity="0.15" transform="rotate(25 62 32)"/>
  <circle cx="22" cy="38" r="1.2" fill="currentColor" opacity="0.15"/>
  <path d="M40,41 C42,48 44,52 48,58" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.15"/>
  <circle cx="58" cy="60" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="30" cy="65" r="1" fill="currentColor" opacity="0.1"/>
</svg>```.text

// Quill pen ornament — stylized feather quill with nib
#let _quill-pen-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="100" viewBox="0 0 60 100">
  <path d="M30,95 L28,75 L30,10 L32,75 Z" fill="currentColor" opacity="0.3"/>
  <path d="M30,10 C20,15 12,25 10,40 C8,55 14,65 20,70 C24,72 27,73 28,75" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5"/>
  <path d="M30,10 C40,15 48,25 50,40 C52,55 46,65 40,70 C36,72 33,73 32,75" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.5"/>
  <path d="M30,10 C25,20 22,35 24,50 C26,60 28,68 28,75" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M30,10 C35,20 38,35 36,50 C34,60 32,68 32,75" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.3"/>
  <path d="M28,75 L27,82 L30,95 L33,82 L32,75" fill="currentColor" opacity="0.6"/>
  <path d="M29,88 L30,95 L31,88" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.7"/>
  <line x1="30" y1="10" x2="30" y2="5" stroke="currentColor" stroke-width="0.5" opacity="0.4"/>
  <path d="M15,30 C18,28 22,27 26,28" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.25"/>
  <path d="M45,30 C42,28 38,27 34,28" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.25"/>
</svg>```.text

// Ink border frame — decorative frame with ink-drawn corners (for title/ending)
#let _ink-border-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="450" viewBox="0 0 800 450">
  <rect x="28" y="22" width="744" height="406" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.4" rx="3"/>
  <rect x="34" y="28" width="732" height="394" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.2" rx="2"/>
  <path d="M30,30 C30,24 32,22 38,22 L70,22" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M30,30 C24,30 22,32 22,38 L22,70" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M770,30 C770,24 768,22 762,22 L730,22" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M770,30 C776,30 778,32 778,38 L778,70" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M30,420 C30,426 32,428 38,428 L70,428" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M30,420 C24,420 22,418 22,412 L22,380" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M770,420 C770,426 768,428 762,428 L730,428" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <path d="M770,420 C776,420 778,418 778,412 L778,380" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.6"/>
  <circle cx="30" cy="30" r="2.5" fill="currentColor" opacity="0.5"/>
  <circle cx="770" cy="30" r="2.5" fill="currentColor" opacity="0.5"/>
  <circle cx="30" cy="420" r="2.5" fill="currentColor" opacity="0.5"/>
  <circle cx="770" cy="420" r="2.5" fill="currentColor" opacity="0.5"/>
</svg>```.text

// Quote marks SVG — large calligraphic opening quotation mark
#let _quote-mark-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
  <path d="M8,32 C8,24 12,18 20,14 C18,18 16,22 16,26 C20,26 22,28 22,32 C22,36 20,38 16,38 C12,38 8,36 8,32 Z" fill="currentColor" opacity="0.6"/>
  <path d="M28,32 C28,24 32,18 40,14 C38,18 36,22 36,26 C40,26 42,28 42,32 C42,36 40,38 36,38 C32,38 28,36 28,32 Z" fill="currentColor" opacity="0.6"/>
  <path d="M10,30 C10,25 13,20 18,17" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <path d="M30,30 C30,25 33,20 38,17" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.3"/>
  <circle cx="16" cy="32" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="36" cy="32" r="1.5" fill="currentColor" opacity="0.3"/>
  <path d="M6,34 C5,36 6,38 8,38" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
  <path d="M26,34 C25,36 26,38 28,38" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.2"/>
</svg>```.text

// Quill nib icon — small pen nib for inline tag decoration
#let _quill-nib-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
  <path d="M8,1 C6,4 5,7 5,10 L8,15 L11,10 C11,7 10,4 8,1 Z" fill="currentColor" opacity="0.6"/>
  <path d="M8,1 C7,3 6.5,5 6,8" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
  <path d="M8,1 C9,3 9.5,5 10,8" fill="none" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
  <line x1="8" y1="10" x2="8" y2="15" stroke="currentColor" stroke-width="0.6" opacity="0.5"/>
  <circle cx="8" cy="10" r="0.8" fill="currentColor" opacity="0.4"/>
  <path d="M6,11 L8,15 L10,11" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.3"/>
  <circle cx="8" cy="3" r="0.5" fill="currentColor" opacity="0.2"/>
  <path d="M5,10 L4,11 M11,10 L12,11" fill="none" stroke="currentColor" stroke-width="0.4" opacity="0.25"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render parchment texture
#let parchment-texture(color: palette.secondary) = {
  let svg = _parchment-texture-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render calligraphic flourish
#let calligraphic-flourish(color: palette.primary, width: 60%) = {
  let svg = _calligraphic-flourish-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 16pt)))
}

/// Render ink drops
#let ink-drops(color: palette.primary, size: 48pt) = {
  let svg = _ink-drops-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render quill pen
#let quill-pen(color: palette.primary, height: 72pt) = {
  let svg = _quill-pen-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), height: height))
}

/// Render ink border frame (full-page)
#let ink-border-frame(color: palette.primary) = {
  let svg = _ink-border-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: 100%, height: 100%)
}

/// Render quote marks
#let quote-marks(color: palette.secondary, size: 32pt) = {
  let svg = _quote-mark-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render quill nib icon
#let quill-nib-icon(color: palette.primary, size: 12pt) = {
  let svg = _quill-nib-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


// === Background Atmosphere ===

/// Persistent parchment texture + ink drop accents on every content slide
#let _bg-atmosphere() = {
  // Full-page parchment paper grain texture
  place(top + left, box(width: 100%, height: 100%, parchment-texture(color: palette.secondary)))
  // Small ink drops in bottom-right corner
  place(bottom + right, dx: -1.2em, dy: -0.6em,
    ink-drops(color: palette.primary.transparentize(60%), size: 32pt))
  // Faint quill pen accent top-right
  place(top + right, dx: -0.6em, dy: 0.3em,
    quill-pen(color: palette.primary.transparentize(80%), height: 36pt))
}


// === 1. Slide Functions ===

/// Standard content slide — warm parchment bg, indigo title, ink accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.primary, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Indigo ink accent rule
      block(width: 80pt, height: 2pt, fill: palette.primary, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none { utils.call-or-display(self, self.store.footer) },
      {
        // Small calligraphic dot ornament
        stack(dir: ltr, spacing: 5pt,
          line(length: 16pt, stroke: 0.5pt + palette.border),
          text(fill: palette.secondary, size: 0.7em)[#sym.diamond.filled],
          line(length: 16pt, stroke: 0.5pt + palette.border),
        )
      },
      {
        set std.align(right)
        context { utils.slide-counter.display() + " / " + utils.last-slide-number }
      },
    )
  }
  let setting(body) = {
    _bg-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — ink border frame, quill pen ornament, calligraphic flourish
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Parchment background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Parchment texture
    place(top + left, box(width: 100%, height: 100%, parchment-texture(color: palette.secondary)))
    // Ink border frame (bookending element)
    place(top + left, box(width: 100%, height: 100%, ink-border-frame(color: palette.primary)))
    // Quill pen decoration — left side
    place(left + horizon, dx: 3em, dy: -1em,
      quill-pen(color: palette.primary.transparentize(30%), height: 90pt))
    // Ink drops top-right
    place(top + right, dx: -4em, dy: 2.5em,
      ink-drops(color: palette.primary.transparentize(40%), size: 50pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 6em, stack(
      spacing: .8em,
      // Title
      text(size: 2.2em, weight: "bold", fill: palette.primary, info.title),
      // Calligraphic flourish
      calligraphic-flourish(color: palette.primary, width: 45%),
      // Subtitle
      if info.subtitle != none {
        text(size: 0.95em, fill: palette.text-body, style: "italic", info.subtitle)
      },
      // Author
      if info.author != none {
        text(size: 1.05em, weight: "semibold", fill: palette.secondary, info.author)
      },
      // Institution
      if info.institution != none {
        text(size: 0.82em, fill: palette.text-muted, info.institution)
      },
      // Date
      if info.date != none {
        text(size: 0.78em, fill: palette.text-muted, utils.display-info-date(self))
      },
    ))
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// New section slide — indigo section title with quill accent, flourish decoration
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
      fill: palette.bg,
    ),
  )
  let main-body = {
    // Parchment texture
    place(top + left, box(width: 100%, height: 100%, parchment-texture(color: palette.secondary)))
    // Left indigo accent bar
    place(left, dx: 3em, block(width: 3pt, height: 40%, fill: palette.primary, radius: 1.5pt))
    // Large faint section number background
    place(right + horizon, dx: -50pt, dy: -15pt, {
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "1")
        text(
          size: 10em,
          weight: "bold",
          fill: palette.primary.transparentize(92%),
          num-str,
        )
      }
    })
    // Ink drops decoration
    place(top + right, dx: -3em, dy: 2em,
      ink-drops(color: palette.primary.transparentize(50%), size: 40pt))
    // Section content
    set std.align(left + horizon)
    pad(left: 5em, right: 5em, top: 3.5em, bottom: 3em,
      stack(
        spacing: .8em,
        // Small section label
        text(size: 0.75em, weight: "bold", fill: palette.secondary, tracking: 2pt)[SECTION],
        // Section title
        {
          set text(fill: palette.primary, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        // Indigo accent line
        block(width: 80pt, height: 2pt, fill: palette.primary, radius: 1pt),
        // Calligraphic flourish below
        calligraphic-flourish(color: palette.secondary.transparentize(40%), width: 35%),
      ),
    )
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — clean table of contents with quill accent
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      fill: palette.bg,
      margin: (x: 4em, y: 2.5em),
    ),
  )
  let main-body = {
    // Background atmosphere
    place(top + left, box(width: 100%, height: 100%, parchment-texture(color: palette.secondary)))
    // Quill pen decoration in corner
    place(top + right, dx: -1.5em, dy: 0.8em,
      quill-pen(color: palette.primary.transparentize(60%), height: 60pt))
    set std.align(left + horizon)
    stack(
      spacing: 1em,
      {
        set text(size: 1.6em, weight: "bold", fill: palette.primary)
        title
      },
      block(width: 60pt, height: 2pt, fill: palette.primary, radius: 1pt),
      {
        set text(size: 1.05em, fill: palette.text-body)
        columns(2, gutter: 2em, outline(title: none, depth: 1))
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep indigo background, cream text, ink border accents
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Top and bottom ink accent lines
    place(top + left, block(width: 100%, height: 2.5pt, fill: palette.secondary))
    place(bottom + left, block(width: 100%, height: 2.5pt, fill: palette.secondary))
    // Ink drops decoration (lighter)
    place(top + left, dx: 2em, dy: 1.5em,
      ink-drops(color: palette.accent-muted.transparentize(50%), size: 40pt))
    place(bottom + right, dx: -2em, dy: -1.5em,
      ink-drops(color: palette.accent-muted.transparentize(50%), size: 35pt))
    // Center content
    set text(fill: palette.bg, size: 1.5em, weight: "bold")
    set std.align(horizon + center)
    block(width: 78%)[
      #stack(
        spacing: .8em,
        body,
        calligraphic-flourish(color: palette.accent-muted.transparentize(20%), width: 40%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — ink border frame (bookending with title), quill ornament, farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Parchment texture
    place(top + left, box(width: 100%, height: 100%, parchment-texture(color: palette.secondary)))
    // Ink border frame (bookend matching title)
    place(top + left, box(width: 100%, height: 100%, ink-border-frame(color: palette.primary)))
    // Quill pen — right side (mirroring title left)
    place(right + horizon, dx: -3em, dy: -1em,
      quill-pen(color: palette.primary.transparentize(30%), height: 90pt))
    // Ink drops — bottom left
    place(bottom + left, dx: 4em, dy: -3em,
      ink-drops(color: palette.primary.transparentize(40%), size: 50pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        // Quill nib icon
        quill-nib-icon(color: palette.primary, size: 28pt),
        // Main text
        text(size: 2.2em, weight: "bold", fill: palette.primary, body),
        // Calligraphic flourish
        calligraphic-flourish(color: palette.primary, width: 50%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Manuscript card — card with calligraphic header accent and aged paper feel
#let manuscript-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 2.5pt + accent, rest: 0.8pt + palette.border),
    inset: (x: 1.2em, y: 0.4em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      block(width: 40pt, height: 1.2pt, fill: accent.transparentize(50%), radius: 0.6pt),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Marginalia — side-note style block without border, just indented with SVG mark
#let marginalia(body) = {
  block(width: 100%, inset: (left: 1.8em, right: 0.5em, y: 0.5em))[
    #place(left, dx: -1.4em, dy: 0.2em, quill-nib-icon(color: palette.secondary, size: 10pt))
    #set text(fill: palette.text-body, size: 0.8em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}

/// Ink quote — quotation with SVG ink-drawn quote marks
#let ink-quote(body, attribution) = {
  block(
    width: 100%,
    fill: palette.sepia-faint,
    stroke: (left: 3pt + palette.secondary),
    inset: (left: 1.6em, right: 1.2em, y: 1em),
    radius: (right: 4pt),
  )[
    #place(top + left, dx: -0.6em, dy: -0.4em,
      quote-marks(color: palette.secondary.transparentize(30%), size: 22pt))
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 0.88em, style: "italic")
        body
      },
      {
        set text(fill: palette.text-muted, size: 0.78em, weight: "medium", style: "normal")
        [— #attribution]
      },
      lazy-v(1fr),
    )
  ]
}

/// Quill tag — small inline tag with pen-nib icon
#let quill-tag(label, color: palette.primary) = {
  box(
    fill: color.transparentize(90%),
    stroke: 0.8pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 3pt,
  )[
    #set text(fill: color, size: 0.72em, weight: "semibold")
    #box(baseline: 1pt, quill-nib-icon(color: color, size: 8pt))
    #h(3pt)
    #label
  ]
}

/// Theorem block — formal proposition block with structured header
#let theorem-block(title, body, accent: palette.tertiary) = {
  stack(spacing: 0pt,
    // Header bar
    block(
      width: 100%,
      fill: accent,
      inset: (x: 1em, y: 0.5em),
      radius: (top: 4pt),
    )[
      #set text(fill: palette.bg, size: 0.85em, weight: "bold")
      #title
    ],
    // Body
    block(
      width: 100%,
      fill: accent.transparentize(92%),
      stroke: (bottom: 1pt + accent.transparentize(50%), left: 1pt + accent.transparentize(50%), right: 1pt + accent.transparentize(50%)),
      inset: (x: 1em, y: 0.8em),
      radius: (bottom: 4pt),
    )[
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
    ],
  )
}

/// Annotation card — scholarly annotation style with side accent
#let annotation-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + accent, rest: 0.6pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        text(fill: accent, size: 0.8em)[#sym.section],
        text(weight: "bold", fill: accent, size: 0.9em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Stat card — key figure with ink drop SVG decoration
#let stat-card(value, label, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.8pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #set std.align(center)
    // Ink drop cluster decoration
    #place(top + right, dx: -0.3em, dy: -0.2em,
      ink-drops(color: accent.transparentize(70%), size: 20pt))
    #stack(
      spacing: .8em,
      text(size: 2em, weight: "bold", fill: accent, value),
      text(size: 0.78em, fill: palette.text-muted, label),
      lazy-v(1fr),
    )
  ]
}

/// Comparison table — parchment-styled academic table
#let comparison-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.accent-muted }
      else if calc.odd(row) { palette.card-bg } else { palette.bg },
    stroke: 0.6pt + palette.border,
    inset: (x: 1em, y: 0.55em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.text-dark, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.82em, c)),
  )
}

/// Codex box — bordered manuscript-style container with double-rule top
#let codex-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (paint: accent.transparentize(40%), thickness: 1.5pt),
    inset: (x: 1.2em, y: 0.4em),
    radius: 5pt,
  )[
    // Double rule header accent
    #stack(
      spacing: .8em,
      grid(
        rows: (0.6pt, 1.5pt),
        row-gutter: 2pt,
        block(width: 100%, height: 0.6pt, fill: accent.transparentize(30%)),
        block(width: 100%, height: 1.5pt, fill: accent.transparentize(30%)),
      ),
      text(weight: "bold", fill: accent, size: 0.95em, title),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Colophon — attribution/credits block with subtle styling
#let colophon(body) = {
  block(
    width: 100%,
    fill: palette.accent-muted.transparentize(50%),
    inset: (x: 1.2em, y: 0.7em),
    radius: 3pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    #body
    #lazy-v(1fr)
  ]
}


// === 3. Theme Entry Point ===

#let quill-ink-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.7em, bottom: 1.8em, x: 2.2em),
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
