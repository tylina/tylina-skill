// Terracotta Mosaic Theme — Mediterranean Zellige & Moorish Geometry
// You are standing in the courtyard of the Alhambra palace at golden hour.
// Sun-baked terracotta tiles, intricate Moorish geometric mosaics, deep blue
// accents from Mediterranean ceramics, arched doorways framing golden light.
// Features: persistent mosaic pattern atmosphere on every content slide,
// geometric tile SVG decorations, arched shapes, warm earthy palette with
// pops of Mediterranean blue.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "@preview/shadowed:0.3.0": shadow


// === Color Palette (Warm Mediterranean Terracotta) ===

#let palette = (
  primary: rgb("#C75B12"),         // burnt terracotta orange
  secondary: rgb("#1B4B6B"),       // deep Mediterranean blue
  dark: rgb("#2A1810"),            // dark umber
  accent: rgb("#D4A03C"),          // Moorish gold / saffron
  bg: rgb("#FDF8F3"),             // warm cream parchment
  card: rgb("#FFFFFF"),           // white card
  text-dark: rgb("#2A1810"),      // umber text
  text-body: rgb("#4A3728"),      // warm brown body
  text-light: rgb("#8B7355"),     // faded terracotta caption
  border: rgb("#E8D5C4"),         // sandy border
  tile-warm: rgb("#E8A065"),      // lighter terracotta
  tile-blue: rgb("#2D6A8F"),      // ceramic blue tile
  sand: rgb("#F5EDE4"),           // sand/stucco bg
)


// === SVG Definitions (Complex Geometric Mosaics) ===

// Zellige mosaic pattern -- interlocking star and cross tessellation
// Based on traditional Moroccan zellige tilework with 8-pointed stars
// Used as PERSISTENT BACKGROUND on every content slide
#let _zellige-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <!-- Row 1: 8-pointed stars connected by cross shapes -->
  <polygon points="80,40 88,56 104,56 92,66 96,82 80,72 64,82 68,66 56,56 72,56" fill="currentColor" opacity="0.04"/>
  <polygon points="200,40 208,56 224,56 212,66 216,82 200,72 184,82 188,66 176,56 192,56" fill="currentColor" opacity="0.035"/>
  <polygon points="320,40 328,56 344,56 332,66 336,82 320,72 304,82 308,66 296,56 312,56" fill="currentColor" opacity="0.04"/>
  <polygon points="440,40 448,56 464,56 452,66 456,82 440,72 424,82 428,66 416,56 432,56" fill="currentColor" opacity="0.03"/>
  <polygon points="560,40 568,56 584,56 572,66 576,82 560,72 544,82 548,66 536,56 552,56" fill="currentColor" opacity="0.04"/>
  <polygon points="680,40 688,56 704,56 692,66 696,82 680,72 664,82 668,66 656,56 672,56" fill="currentColor" opacity="0.035"/>
  <!-- Row 2: offset stars -->
  <polygon points="140,120 148,136 164,136 152,146 156,162 140,152 124,162 128,146 116,136 132,136" fill="currentColor" opacity="0.035"/>
  <polygon points="260,120 268,136 284,136 272,146 276,162 260,152 244,162 248,146 236,136 252,136" fill="currentColor" opacity="0.04"/>
  <polygon points="380,120 388,136 404,136 392,146 396,162 380,152 364,162 368,146 356,136 372,136" fill="currentColor" opacity="0.03"/>
  <polygon points="500,120 508,136 524,136 512,146 516,162 500,152 484,162 488,146 476,136 492,136" fill="currentColor" opacity="0.04"/>
  <polygon points="620,120 628,136 644,136 632,146 636,162 620,152 604,162 608,146 596,136 612,136" fill="currentColor" opacity="0.035"/>
  <polygon points="740,120 748,136 764,136 752,146 756,162 740,152 724,162 728,146 716,136 732,136" fill="currentColor" opacity="0.03"/>
  <!-- Connecting cross shapes between stars -->
  <rect x="106" y="76" width="12" height="12" fill="currentColor" opacity="0.025" transform="rotate(45 112 82)"/>
  <rect x="226" y="76" width="12" height="12" fill="currentColor" opacity="0.02" transform="rotate(45 232 82)"/>
  <rect x="346" y="76" width="12" height="12" fill="currentColor" opacity="0.025" transform="rotate(45 352 82)"/>
  <rect x="466" y="76" width="12" height="12" fill="currentColor" opacity="0.02" transform="rotate(45 472 82)"/>
  <rect x="586" y="76" width="12" height="12" fill="currentColor" opacity="0.025" transform="rotate(45 592 82)"/>
  <!-- Row 3: more stars -->
  <polygon points="80,200 88,216 104,216 92,226 96,242 80,232 64,242 68,226 56,216 72,216" fill="currentColor" opacity="0.03"/>
  <polygon points="200,200 208,216 224,216 212,226 216,242 200,232 184,242 188,226 176,216 192,216" fill="currentColor" opacity="0.04"/>
  <polygon points="320,200 328,216 344,216 332,226 336,242 320,232 304,242 308,226 296,216 312,216" fill="currentColor" opacity="0.035"/>
  <polygon points="440,200 448,216 464,216 452,226 456,242 440,232 424,242 428,226 416,216 432,216" fill="currentColor" opacity="0.04"/>
  <polygon points="560,200 568,216 584,216 572,226 576,242 560,232 544,242 548,226 536,216 552,216" fill="currentColor" opacity="0.03"/>
  <polygon points="680,200 688,216 704,216 692,226 696,242 680,232 664,242 668,226 656,216 672,216" fill="currentColor" opacity="0.035"/>
  <!-- Row 4 -->
  <polygon points="140,280 148,296 164,296 152,306 156,322 140,312 124,322 128,306 116,296 132,296" fill="currentColor" opacity="0.04"/>
  <polygon points="260,280 268,296 284,296 272,306 276,322 260,312 244,322 248,306 236,296 252,296" fill="currentColor" opacity="0.03"/>
  <polygon points="380,280 388,296 404,296 392,306 396,322 380,312 364,322 368,306 356,296 372,296" fill="currentColor" opacity="0.035"/>
  <polygon points="500,280 508,296 524,296 512,306 516,322 500,312 484,322 488,306 476,296 492,296" fill="currentColor" opacity="0.04"/>
  <polygon points="620,280 628,296 644,296 632,306 636,322 620,312 604,322 608,306 596,296 612,296" fill="currentColor" opacity="0.03"/>
  <polygon points="740,280 748,296 764,296 752,306 756,322 740,312 724,322 728,306 716,296 732,296" fill="currentColor" opacity="0.035"/>
  <!-- Row 5 -->
  <polygon points="80,360 88,376 104,376 92,386 96,402 80,392 64,402 68,386 56,376 72,376" fill="currentColor" opacity="0.035"/>
  <polygon points="200,360 208,376 224,376 212,386 216,402 200,392 184,402 188,386 176,376 192,376" fill="currentColor" opacity="0.03"/>
  <polygon points="320,360 328,376 344,376 332,386 336,402 320,392 304,402 308,386 296,376 312,376" fill="currentColor" opacity="0.04"/>
  <polygon points="440,360 448,376 464,376 452,386 456,402 440,392 424,402 428,386 416,376 432,376" fill="currentColor" opacity="0.035"/>
  <polygon points="560,360 568,376 584,376 572,386 576,402 560,392 544,402 548,386 536,376 552,376" fill="currentColor" opacity="0.03"/>
  <polygon points="680,360 688,376 704,376 692,386 696,402 680,392 664,402 668,386 656,376 672,376" fill="currentColor" opacity="0.04"/>
  <!-- Additional connecting diamonds -->
  <rect x="106" y="236" width="10" height="10" fill="currentColor" opacity="0.02" transform="rotate(45 111 241)"/>
  <rect x="346" y="236" width="10" height="10" fill="currentColor" opacity="0.025" transform="rotate(45 351 241)"/>
  <rect x="586" y="236" width="10" height="10" fill="currentColor" opacity="0.02" transform="rotate(45 591 241)"/>
  <rect x="226" y="316" width="10" height="10" fill="currentColor" opacity="0.025" transform="rotate(45 231 321)"/>
  <rect x="466" y="316" width="10" height="10" fill="currentColor" opacity="0.02" transform="rotate(45 471 321)"/>
</svg>```.text

// Moorish arch -- pointed horseshoe arch frame (iconic Islamic architecture)
// Used on title and ending slides as a bookending element
#let _arch-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="300" viewBox="0 0 400 300">
  <!-- Outer arch frame (horseshoe/pointed arch) -->
  <path d="M60,300 L60,130 C60,130 60,50 130,25 C170,10 200,5 200,5 C200,5 230,10 270,25 C340,50 340,130 340,130 L340,300" fill="none" stroke="currentColor" stroke-width="3" opacity="0.6"/>
  <!-- Inner arch frame (double line) -->
  <path d="M75,300 L75,135 C75,135 75,60 140,38 C175,25 200,20 200,20 C200,20 225,25 260,38 C325,60 325,135 325,135 L325,300" fill="none" stroke="currentColor" stroke-width="1.5" opacity="0.4"/>
  <!-- Keystone ornament at apex -->
  <circle cx="200" cy="12" r="6" fill="currentColor" opacity="0.5"/>
  <circle cx="200" cy="12" r="3" fill="none" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <!-- Column capitals (left) -->
  <rect x="55" y="260" width="15" height="6" fill="currentColor" opacity="0.35"/>
  <rect x="53" y="255" width="19" height="5" fill="currentColor" opacity="0.25"/>
  <!-- Column capitals (right) -->
  <rect x="330" y="260" width="15" height="6" fill="currentColor" opacity="0.35"/>
  <rect x="328" y="255" width="19" height="5" fill="currentColor" opacity="0.25"/>
  <!-- Decorative spandrel patterns (triangular area outside arch) -->
  <circle cx="90" cy="80" r="4" fill="currentColor" opacity="0.15"/>
  <circle cx="310" cy="80" r="4" fill="currentColor" opacity="0.15"/>
  <circle cx="100" cy="55" r="3" fill="currentColor" opacity="0.1"/>
  <circle cx="300" cy="55" r="3" fill="currentColor" opacity="0.1"/>
  <!-- Arabesque vine hints in spandrels -->
  <path d="M80,95 C85,85 95,80 105,85" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <path d="M320,95 C315,85 305,80 295,85" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.12"/>
  <!-- Base line -->
  <line x1="50" y1="300" x2="350" y2="300" stroke="currentColor" stroke-width="2" opacity="0.3"/>
</svg>```.text

// Tile border -- geometric repeating border pattern (horizontal)
// Used as decorative accent strip under headers
#let _tile-border-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <!-- Repeating diamond chain pattern -->
  <polygon points="10,8 18,2 26,8 18,14" fill="currentColor" opacity="0.6"/>
  <polygon points="30,8 38,2 46,8 38,14" fill="currentColor" opacity="0.5"/>
  <polygon points="50,8 58,2 66,8 58,14" fill="currentColor" opacity="0.6"/>
  <polygon points="70,8 78,2 86,8 78,14" fill="currentColor" opacity="0.5"/>
  <polygon points="90,8 98,2 106,8 98,14" fill="currentColor" opacity="0.6"/>
  <polygon points="110,8 118,2 126,8 118,14" fill="currentColor" opacity="0.5"/>
  <polygon points="130,8 138,2 146,8 138,14" fill="currentColor" opacity="0.6"/>
  <polygon points="150,8 158,2 166,8 158,14" fill="currentColor" opacity="0.5"/>
  <polygon points="170,8 178,2 186,8 178,14" fill="currentColor" opacity="0.6"/>
  <polygon points="190,8 198,2 206,8 198,14" fill="currentColor" opacity="0.5"/>
  <polygon points="210,8 218,2 226,8 218,14" fill="currentColor" opacity="0.6"/>
  <polygon points="230,8 238,2 246,8 238,14" fill="currentColor" opacity="0.5"/>
  <polygon points="250,8 258,2 266,8 258,14" fill="currentColor" opacity="0.6"/>
  <polygon points="270,8 278,2 286,8 278,14" fill="currentColor" opacity="0.5"/>
  <!-- Connecting dots between diamonds -->
  <circle cx="28" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="48" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="68" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="88" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="108" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="128" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="148" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="168" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="188" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="208" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="228" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="248" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
  <circle cx="268" cy="8" r="1.5" fill="currentColor" opacity="0.3"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render zellige pattern as full-page background atmosphere
#let _zellige-bg() = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_zellige-pattern-svg.replace("currentColor", palette.primary.to-hex())), width: 100%, height: 100%, fit: "cover")))
}

/// Render the Moorish arch frame with given color
#let arch-frame(color: palette.primary, width: 280pt) = {
  let svg = _arch-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width)
}

/// Render tile border strip with given color
#let tile-border(color: palette.primary, width: 200pt) = {
  let svg = _tile-border-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 10pt))
}

/// Mosaic divider -- the tile border pattern used as a section divider
#let mosaic-divider(color: palette.primary, width: 60%) = {
  std.align(center, tile-border(color: color, width: width))
}


// === Background Atmosphere (MANDATORY on every content slide) ===

/// Persistent "Alhambra courtyard" feeling: faint zellige stars + warm corner glow
#let _slide-atmosphere() = {
  // Full-page zellige mosaic pattern (very subtle)
  _zellige-bg()
  // Warm corner glow -- simulating golden sunlight from a courtyard
  place(top + right, dx: -1em, dy: 0.3em,
    circle(radius: 2pt, fill: palette.accent.transparentize(85%)))
  place(top + right, dx: -2.5em, dy: 1em,
    circle(radius: 1.5pt, fill: palette.primary.transparentize(88%)))
  place(bottom + left, dx: 1.5em, dy: -1em,
    circle(radius: 1.8pt, fill: palette.secondary.transparentize(88%)))
}


// === 1. Slide Functions ===

/// Standard content slide -- warm parchment bg, geometric header accent, mosaic atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Tile border pattern as header accent (SVG geometric, NOT a plain line)
      tile-border(color: palette.primary, width: 160pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
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
        // Small diamond mosaic marker as footer center
        box(width: 8pt, height: 8pt,
          image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10"><polygon points="5,0 10,5 5,10 0,5" fill="currentColor" opacity="0.5"/></svg>```.text.replace("currentColor", palette.primary.to-hex())), width: 8pt, height: 8pt))
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // PERSISTENT ATMOSPHERE -- every content slide feels like an Alhambra courtyard
    _slide-atmosphere()
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

/// Title slide -- full arch frame with mosaic pattern, warm golden sunlight
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm parchment background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Full zellige pattern (stronger for title -- bookending element)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_zellige-pattern-svg.replace("currentColor", palette.primary.to-hex()).replace("opacity=\"0.04\"", "opacity=\"0.07\"").replace("opacity=\"0.035\"", "opacity=\"0.06\"").replace("opacity=\"0.03\"", "opacity=\"0.055\"").replace("opacity=\"0.025\"", "opacity=\"0.045\"").replace("opacity=\"0.02\"", "opacity=\"0.04\"")), width: 100%, height: 100%, fit: "cover")))
    // Arch frame centered (bookending element)
    place(center + horizon,
      box(width: 320pt, height: 260pt,
        image(bytes(_arch-frame-svg.replace("currentColor", palette.primary.to-hex())), width: 320pt)))
    // Center content inside the arch
    set std.align(center + horizon)
    let sequence = (
      text(size: 2.4em, weight: "bold", fill: palette.text-dark, info.title),
      std.align(center, tile-border(color: palette.primary, width: 180pt)),
    )
    if info.subtitle != none {
      sequence.push(text(size: 1em, fill: palette.text-body, style: "italic", info.subtitle))
    }
    if info.author != none {
      sequence.push(text(size: 0.9em, fill: palette.text-dark, info.author))
    }
    if info.institution != none {
      sequence.push(text(size: 0.8em, fill: palette.text-light, info.institution))
    }
    if info.date != none {
      sequence.push(text(size: 0.75em, fill: palette.text-light, utils.display-info-date(self)))
    }
    pad(x: 6em, y: 2em, stack(spacing: .8em, ..sequence))
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

/// New section slide -- terracotta accent bar, large section number, geometric divider
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
    // Warm background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Zellige pattern
    _zellige-bg()
    // Left accent bar -- thick terracotta strip
    place(top + left, block(width: 6pt, height: 100%, fill: palette.primary))
    // Section content remains in measured flow so Touying can assess it correctly.
    std.align(center + horizon,
      block(width: 70%, inset: (left: 4em, right: 3em))[
        #stack(
          spacing: .8em,
          text(size: 4em, fill: palette.primary.transparentize(60%), weight: "bold")[
            #utils.display-current-heading-number(depth: 1, numbering: "1")
          ],
          {
            set text(fill: palette.text-dark, size: 2em, weight: "bold")
            utils.display-current-heading(level: 1, numbered: false)
          },
          tile-border(color: palette.primary, width: 200pt),
        )
      ]
    )
    // Small decorative diamond in bottom-right
    place(bottom + right, dx: -3em, dy: -2em,
      box(width: 16pt, height: 16pt,
        image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><polygon points="8,1 15,8 8,15 1,8" fill="currentColor" opacity="0.4"/></svg>```.text.replace("currentColor", palette.secondary.to-hex())), width: 16pt, height: 16pt)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- deep Mediterranean blue background with centered text and arch hint
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
    // Deep blue background
    place(top + left, block(width: 100%, height: 100%, fill: palette.secondary))
    // Subtle zellige pattern on dark
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_zellige-pattern-svg.replace("currentColor", rgb("#FFFFFF").to-hex()).replace("opacity=\"0.04\"", "opacity=\"0.05\"").replace("opacity=\"0.035\"", "opacity=\"0.04\"").replace("opacity=\"0.03\"", "opacity=\"0.035\"").replace("opacity=\"0.025\"", "opacity=\"0.03\"").replace("opacity=\"0.02\"", "opacity=\"0.025\"")), width: 100%, height: 100%, fit: "cover")))
    // Center content in measured flow and constrain long focal text.
    std.align(center + horizon,
      block(width: 75%, inset: (x: 2em, y: 1.5em))[
        #set std.align(center)
        #set text(fill: rgb("#FFFFFF"), size: 1.4em, weight: "bold")
        #stack(
          spacing: .8em,
          body,
          tile-border(color: palette.accent, width: 140pt),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- bookends with title: arch frame + mosaic pattern
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
    // Warm parchment background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Zellige pattern (stronger -- bookends with title)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_zellige-pattern-svg.replace("currentColor", palette.primary.to-hex()).replace("opacity=\"0.04\"", "opacity=\"0.07\"").replace("opacity=\"0.035\"", "opacity=\"0.06\"").replace("opacity=\"0.03\"", "opacity=\"0.055\"").replace("opacity=\"0.025\"", "opacity=\"0.045\"").replace("opacity=\"0.02\"", "opacity=\"0.04\"")), width: 100%, height: 100%, fit: "cover")))
    // Arch frame (bookends with title)
    place(center + horizon,
      box(width: 320pt, height: 260pt,
        image(bytes(_arch-frame-svg.replace("currentColor", palette.primary.to-hex())), width: 320pt)))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: palette.text-dark, body),
        tile-border(color: palette.primary, width: 160pt),
        mosaic-divider(color: palette.text-light, width: 80pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Tile card -- card with geometric tile border on top edge (warm terracotta accent)
#let tile-card(title, body, accent: palette.primary) = {
  shadow(dx: 2pt, dy: 2pt, blur: 5pt, fill: rgb(0, 0, 0, 8%), radius: 4pt)[
    #block(
      width: 100%,
      fill: palette.card,
      stroke: 0.5pt + palette.border,
      inset: 0pt,
      radius: 4pt,
      clip: true,
    )[
      #stack(
        spacing: 0pt,
        block(width: 100%, inset: (x: 0.8em, top: 0.6em), fill: palette.card)[
          #tile-border(color: accent, width: 100%)
        ],
        block(width: 100%, inset: (x: 1em, bottom: 0.8em), fill: palette.card)[
          #stack(
            spacing: .8em,
            text(weight: "bold", fill: accent, size: 0.9em, title),
            {
              set text(fill: palette.text-body, size: 0.82em)
              body
            },
          )
        ],
        lazy-v(1fr),
      )
    ]
  ]
}

/// Courtyard stat -- centered arch icon, value, then label
#let courtyard-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    inset: (x: 0.8em, y: 0.55em),
    radius: 4pt,
    stroke: 0.5pt + palette.border,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      box(width: 24pt, height: 18pt,
        image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 25"><path d="M3,25 L3,12 C3,12 3,3 15,1 C27,3 27,12 27,12 L27,25" fill="none" stroke="currentColor" stroke-width="2" opacity="0.65"/><line x1="2" y1="25" x2="28" y2="25" stroke="currentColor" stroke-width="1.5" opacity="0.45"/></svg>```.text.replace("currentColor", color.to-hex())), width: 22pt)),
      text(fill: color, size: 1.55em, weight: "bold", value),
      {
        set text(fill: palette.text-light, size: 0.68em)
        label
      },
      lazy-v(1fr),
    )
  ]
}

/// Arabesque quote -- verse/quote with Moorish decorative framing
#let arabesque-quote(quote, author: none) = {
  block(width: 100%, fill: palette.sand, inset: (x: 1.5em, y: 1em), radius: 4pt,
    stroke: (left: 3pt + palette.primary, rest: 0.5pt + palette.border))[
    // Decorative diamond before quote
    #place(top + left, dx: -0.4em, dy: -0.3em,
      box(width: 10pt, height: 10pt,
        image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10"><polygon points="5,0 10,5 5,10 0,5" fill="currentColor" opacity="0.7"/></svg>```.text.replace("currentColor", palette.primary.to-hex())), width: 10pt, height: 10pt)))
    #let parts = (quote,)
    #if author != none {
      parts.push(text(fill: palette.primary, size: 0.78em, weight: "bold", style: "normal")[-- #author])
    }
    #set text(fill: palette.text-dark, size: 0.9em, style: "italic")
    #stack(spacing: .8em, ..parts)
  ]
}

/// Zellige box -- card with visible geometric star ornament inside (SVG decoration)
#let zellige-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 2pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (top: 0pt, bottom: 4pt),
  )[
    // Small 8-pointed star next to title
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 0.5em,
        box(width: 14pt, height: 14pt,
          image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><polygon points="10,0 12.5,7.5 20,7.5 14,12.5 16,20 10,15 4,20 6,12.5 0,7.5 7.5,7.5" fill="currentColor" opacity="0.7"/></svg>```.text.replace("currentColor", accent.to-hex())), width: 14pt, height: 14pt)),
        text(weight: "bold", fill: accent, size: 0.9em, title),
      ),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Mosaic tag -- small pill/badge for inline labeling (terracotta-themed)
#let mosaic-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.8pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.2em),
    radius: 2pt,
  )[
    #set text(fill: color, size: 0.72em, weight: "semibold")
    #content
  ]
}

/// Timeline marker -- for historical/architectural timeline displays
#let timeline-entry(year, title, description, color: palette.primary) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 1em,
    // Year marker with diamond bullet
    {
      stack(spacing: .8em,
        std.align(center,
          box(width: 8pt, height: 8pt,
            image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10"><polygon points="5,0 10,5 5,10 0,5" fill="currentColor"/></svg>```.text.replace("currentColor", color.to-hex())), width: 8pt, height: 8pt))),
        std.align(center, text(fill: color, size: 0.75em, weight: "bold", year)),
      )
    },
    // Content
    {
      block(width: 100%)[
        #stack(
          spacing: .8em,
          text(fill: palette.text-dark, size: 0.88em, weight: "bold", title),
          {
            set text(fill: palette.text-body, size: 0.78em)
            description
          },
        )
      ]
    },
  )
}

/// Arch highlight -- featured content framed in a subtle arch shape (typography + spacing only, NO box border)
#let arch-highlight(title, body) = {
  block(width: 100%)[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 0.6em,
        // Small arch icon
        box(width: 20pt, height: 18pt,
          image(bytes(```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 25"><path d="M3,25 L3,12 C3,12 3,3 15,1 C27,3 27,12 27,12 L27,25" fill="none" stroke="currentColor" stroke-width="2" opacity="0.6"/><line x1="2" y1="25" x2="28" y2="25" stroke="currentColor" stroke-width="1.5" opacity="0.4"/></svg>```.text.replace("currentColor", palette.primary.to-hex())), width: 20pt)),
        text(fill: palette.text-dark, size: 0.95em, weight: "bold", title),
      ),
      block(width: 100%, inset: (left: 1.5em))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
      ],
    )
  ]
}

/// Sunbaked card -- warm gradient card evoking sun-dried clay
#let sunbaked-card(title, body) = {
  block(
    width: 100%,
    fill: gradient.linear(palette.sand, palette.card, angle: 180deg),
    stroke: 0.5pt + palette.border,
    inset: (x: 1.2em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.88em, title),
      {
        set text(fill: palette.text-body, size: 0.8em)
        body
      },
      lazy-v(1fr),
    )
  ]
}


// === 3. Theme Entry Point ===

#let terracotta-mosaic-theme(
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
