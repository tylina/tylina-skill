// Laurel Crown Theme — Classical academic ceremony aesthetic for thesis defense
// Warm ivory background, deep burgundy primary, scholarly green accent, gold highlights
// Features: laurel wreath SVG, vine dividers, leaf corner marks, formal typography
// Perfect for thesis defense, research proposals, academic ceremonies
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FEFDF5"),
  ink: rgb("#2A1F1F"),
  primary: rgb("#5B1A2A"),
  green: rgb("#2E5944"),
  gold: rgb("#B8860B"),
  ink-muted: rgb("#2A1F1F").transparentize(50%),
  bg-warm: rgb("#FBF7EC"),
  gold-light: rgb("#B8860B").transparentize(75%),
  green-light: rgb("#2E5944").transparentize(80%),
  primary-light: rgb("#5B1A2A").transparentize(85%),
)


// ═══ SVG Definitions ═══

// Laurel wreath — complex: 14 leaf shapes at varying opacities forming a circular wreath
#let _laurel-wreath-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="180" height="180" viewBox="0 0 180 180">
  <!-- Left branch -->
  <path d="M85,160 C75,145 60,140 55,130" fill="none" stroke="#2E5944" stroke-width="1.5" opacity="0.9"/>
  <ellipse cx="58" cy="128" rx="6" ry="14" transform="rotate(-25,58,128)" fill="#2E5944" opacity="0.7"/>
  <ellipse cx="52" cy="115" rx="5" ry="12" transform="rotate(-30,52,115)" fill="#2E5944" opacity="0.6"/>
  <ellipse cx="48" cy="100" rx="5" ry="13" transform="rotate(-35,48,100)" fill="#2E5944" opacity="0.75"/>
  <ellipse cx="46" cy="85" rx="5" ry="12" transform="rotate(-40,46,85)" fill="#2E5944" opacity="0.65"/>
  <ellipse cx="48" cy="70" rx="5" ry="11" transform="rotate(-45,48,70)" fill="#2E5944" opacity="0.7"/>
  <ellipse cx="53" cy="56" rx="5" ry="12" transform="rotate(-50,53,56)" fill="#2E5944" opacity="0.6"/>
  <ellipse cx="62" cy="44" rx="4" ry="11" transform="rotate(-60,62,44)" fill="#2E5944" opacity="0.75"/>
  <!-- Right branch -->
  <path d="M95,160 C105,145 120,140 125,130" fill="none" stroke="#2E5944" stroke-width="1.5" opacity="0.9"/>
  <ellipse cx="122" cy="128" rx="6" ry="14" transform="rotate(25,122,128)" fill="#2E5944" opacity="0.7"/>
  <ellipse cx="128" cy="115" rx="5" ry="12" transform="rotate(30,128,115)" fill="#2E5944" opacity="0.6"/>
  <ellipse cx="132" cy="100" rx="5" ry="13" transform="rotate(35,132,100)" fill="#2E5944" opacity="0.75"/>
  <ellipse cx="134" cy="85" rx="5" ry="12" transform="rotate(40,134,85)" fill="#2E5944" opacity="0.65"/>
  <ellipse cx="132" cy="70" rx="5" ry="11" transform="rotate(45,132,70)" fill="#2E5944" opacity="0.7"/>
  <ellipse cx="127" cy="56" rx="5" ry="12" transform="rotate(50,127,56)" fill="#2E5944" opacity="0.6"/>
  <ellipse cx="118" cy="44" rx="4" ry="11" transform="rotate(60,118,44)" fill="#2E5944" opacity="0.75"/>
  <!-- Top convergence leaves -->
  <ellipse cx="74" cy="35" rx="4" ry="10" transform="rotate(-70,74,35)" fill="#2E5944" opacity="0.55"/>
  <ellipse cx="106" cy="35" rx="4" ry="10" transform="rotate(70,106,35)" fill="#2E5944" opacity="0.55"/>
  <!-- Ribbon at base -->
  <path d="M78,162 C82,158 86,160 90,158 C94,160 98,158 102,162" fill="none" stroke="#B8860B" stroke-width="2" opacity="0.8"/>
  <path d="M75,168 L82,160 M105,168 L98,160" fill="none" stroke="#B8860B" stroke-width="1.5" opacity="0.7"/>
</svg>```.text

// Vine divider — horizontal vine with small leaves, 10 elements
#let _vine-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="320" height="20" viewBox="0 0 320 20">
  <!-- Main vine stem -->
  <path d="M0,10 C20,8 40,12 60,10 C80,8 100,12 120,10 C140,8 160,12 180,10 C200,8 220,12 240,10 C260,8 280,12 300,10 L320,10" fill="none" stroke="#2E5944" stroke-width="1.2" opacity="0.7"/>
  <!-- Leaves along vine -->
  <ellipse cx="30" cy="8" rx="3" ry="6" transform="rotate(-20,30,8)" fill="#2E5944" opacity="0.5"/>
  <ellipse cx="60" cy="12" rx="3" ry="6" transform="rotate(15,60,12)" fill="#2E5944" opacity="0.45"/>
  <ellipse cx="95" cy="7" rx="3" ry="5.5" transform="rotate(-25,95,7)" fill="#2E5944" opacity="0.55"/>
  <ellipse cx="130" cy="13" rx="2.5" ry="5.5" transform="rotate(20,130,13)" fill="#2E5944" opacity="0.4"/>
  <ellipse cx="160" cy="8" rx="3" ry="6" transform="rotate(-15,160,8)" fill="#2E5944" opacity="0.5"/>
  <ellipse cx="195" cy="12" rx="2.5" ry="5.5" transform="rotate(22,195,12)" fill="#2E5944" opacity="0.45"/>
  <ellipse cx="225" cy="7" rx="3" ry="6" transform="rotate(-18,225,7)" fill="#2E5944" opacity="0.5"/>
  <ellipse cx="260" cy="13" rx="2.5" ry="5" transform="rotate(18,260,13)" fill="#2E5944" opacity="0.4"/>
  <ellipse cx="290" cy="8" rx="3" ry="5.5" transform="rotate(-22,290,8)" fill="#2E5944" opacity="0.5"/>
  <ellipse cx="310" cy="11" rx="2" ry="4.5" transform="rotate(12,310,11)" fill="#2E5944" opacity="0.35"/>
</svg>```.text

// Leaf corner mark — small decorative leaf cluster for content slide corners
#let _leaf-corner-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
  <path d="M38,2 C30,5 20,15 5,35" fill="none" stroke="#2E5944" stroke-width="0.8" opacity="0.4"/>
  <ellipse cx="30" cy="6" rx="3" ry="7" transform="rotate(-55,30,6)" fill="#2E5944" opacity="0.25"/>
  <ellipse cx="22" cy="14" rx="3" ry="7" transform="rotate(-45,22,14)" fill="#2E5944" opacity="0.2"/>
  <ellipse cx="14" cy="24" rx="2.5" ry="6" transform="rotate(-40,14,24)" fill="#2E5944" opacity="0.18"/>
</svg>```.text

// Gold leaf icon for honors-tag prefix
#let _leaf-icon-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14">
  <ellipse cx="7" cy="7" rx="3" ry="6" transform="rotate(-30,7,7)" fill="#B8860B" opacity="0.8"/>
  <path d="M7,2 L7,12" fill="none" stroke="#B8860B" stroke-width="0.6" opacity="0.6"/>
</svg>```.text

// Vine border for finding-quote (vertical vine with small leaves)
#let _vine-border-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="12" height="100" viewBox="0 0 12 100">
  <path d="M6,0 C8,10 4,20 6,30 C8,40 4,50 6,60 C8,70 4,80 6,90 L6,100" fill="none" stroke="#2E5944" stroke-width="1.5" opacity="0.6"/>
  <ellipse cx="4" cy="15" rx="2.5" ry="5" transform="rotate(-10,4,15)" fill="#2E5944" opacity="0.4"/>
  <ellipse cx="8" cy="35" rx="2.5" ry="5" transform="rotate(10,8,35)" fill="#2E5944" opacity="0.35"/>
  <ellipse cx="4" cy="55" rx="2.5" ry="5" transform="rotate(-10,4,55)" fill="#2E5944" opacity="0.4"/>
  <ellipse cx="8" cy="75" rx="2.5" ry="5" transform="rotate(10,8,75)" fill="#2E5944" opacity="0.35"/>
  <ellipse cx="4" cy="92" rx="2" ry="4" transform="rotate(-10,4,92)" fill="#2E5944" opacity="0.3"/>
</svg>```.text

// Full-page folio texture — two faint vine fragments keep content slides in the laurel world
#let _folio-texture-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="600" viewBox="0 0 1000 600">
  <path d="M965,35 C930,115 940,195 900,275 C870,340 875,430 820,550" fill="none" stroke="#2E5944" stroke-width="2" opacity="0.08"/>
  <ellipse cx="947" cy="82" rx="8" ry="19" transform="rotate(38,947,82)" fill="#2E5944" opacity="0.09"/>
  <ellipse cx="934" cy="138" rx="7" ry="18" transform="rotate(-30,934,138)" fill="#2E5944" opacity="0.06"/>
  <ellipse cx="925" cy="210" rx="8" ry="20" transform="rotate(34,925,210)" fill="#2E5944" opacity="0.10"/>
  <ellipse cx="894" cy="292" rx="7" ry="18" transform="rotate(-28,894,292)" fill="#2E5944" opacity="0.07"/>
  <ellipse cx="873" cy="365" rx="8" ry="20" transform="rotate(32,873,365)" fill="#2E5944" opacity="0.09"/>
  <ellipse cx="846" cy="455" rx="7" ry="18" transform="rotate(-26,846,455)" fill="#2E5944" opacity="0.06"/>
  <path d="M20,552 C80,525 145,535 205,505 C250,482 290,472 340,468" fill="none" stroke="#B8860B" stroke-width="1.8" opacity="0.07"/>
  <ellipse cx="72" cy="533" rx="7" ry="17" transform="rotate(-62,72,533)" fill="#B8860B" opacity="0.08"/>
  <ellipse cx="130" cy="523" rx="7" ry="18" transform="rotate(58,130,523)" fill="#B8860B" opacity="0.06"/>
  <ellipse cx="194" cy="506" rx="8" ry="19" transform="rotate(-58,194,506)" fill="#B8860B" opacity="0.09"/>
  <ellipse cx="252" cy="484" rx="7" ry="17" transform="rotate(55,252,484)" fill="#B8860B" opacity="0.06"/>
  <circle cx="780" cy="90" r="4" fill="#B8860B" opacity="0.09"/>
  <circle cx="760" cy="110" r="2.5" fill="#B8860B" opacity="0.06"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render laurel wreath
#let _laurel-wreath(size: 120pt, color: palette.green, ribbon-color: palette.gold) = {
  let svg = _laurel-wreath-svg
    .replace("#2E5944", color.to-hex())
    .replace("#B8860B", ribbon-color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render vine divider
#let vine-divider(width: 60%, color: palette.green) = {
  let svg = _vine-divider-svg.replace("#2E5944", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 14pt)))
}

/// Render leaf corner mark
#let _leaf-corner(size: 28pt, color: palette.green) = {
  let svg = _leaf-corner-svg.replace("#2E5944", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render leaf icon (small, for inline use)
#let _leaf-icon(size: 11pt, color: palette.gold) = {
  let svg = _leaf-icon-svg.replace("#B8860B", color.to-hex())
  box(baseline: 2pt, image(bytes(svg), width: size, height: size))
}

/// Render vine border (vertical, for quotes)
#let _vine-border(height: 80pt, color: palette.green) = {
  let svg = _vine-border-svg.replace("#2E5944", color.to-hex())
  box(image(bytes(svg), width: 10pt, height: height))
}

/// Render the persistent body-area atmosphere used by ordinary content slides
#let _content-atmosphere(leaf-color: palette.green, accent-color: palette.gold) = {
  let svg = _folio-texture-svg
    .replace("#2E5944", leaf-color.to-hex())
    .replace("#B8860B", accent-color.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%, fit: "stretch"))
}


// ═══ Reusable Components ═══

/// 1. chapter-block — full-width header bar (dark fill) + content area below
#let chapter-block(title, body) = {
  block(
    width: 100%,
    fill: palette.bg-warm,
    stroke: (paint: palette.primary.transparentize(60%), thickness: 1pt),
    radius: 4pt,
    clip: true,
  )[
    #stack(
      spacing: 0pt,
      // Dark header bar
      block(
        width: 100%,
        fill: palette.primary,
        inset: (x: 1.2em, y: 0.6em),
      )[
        #set text(fill: palette.bg, weight: "bold", size: 0.95em)
        #title
      ],
      // Content area
      pad(x: 1.2em, y: 0.8em)[
        #set text(fill: palette.ink, size: 0.82em)
        #body
      ],
      lazy-v(1fr),
    )
  ]
}

/// 2. laurel-card — dashed gold border + leaf SVG corner decoration
#let laurel-card(title, body) = {
  block(
    width: 100%,
    fill: palette.bg-warm,
    stroke: (paint: palette.gold, thickness: 1.5pt, dash: "dashed"),
    inset: (x: 1.2em, y: 0.8em),
    radius: 4pt,
  )[
    // Leaf corner decoration (top-right)
    #place(top + right, dx: -2pt, dy: -2pt, _leaf-corner(size: 24pt))
    // Title
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.92em, title),
      {
        set text(fill: palette.ink, size: 0.82em)
        block(width: 90%, body)
      },
      lazy-v(1fr),
    )
  ]
}

/// 3. contribution-item — NO border, gold bullet + bold text + description
#let contribution-item(title, description) = {
  block(width: 100%, inset: (y: 0.3em))[
    #grid(columns: (auto, 1fr), column-gutter: 8pt,
      // Gold bullet marker
      box(baseline: 3pt, circle(radius: 4pt, fill: palette.gold)),
      stack(spacing: .8em,
        text(weight: "bold", fill: palette.primary, size: 0.9em, title),
        {
          set text(fill: palette.ink, size: 0.8em)
          description
        },
      ),
    )
  ]
}

/// 4. vine-divider component (calls the SVG renderer)
// (vine-divider is already defined above as an SVG rendering helper)

/// 5. honors-tag — pill badge with laurel-leaf icon prefix
#let honors-tag(content, color: palette.gold) = {
  box(
    fill: color.transparentize(85%),
    stroke: (paint: color, thickness: 1pt),
    inset: (x: 0.6em, y: 0.25em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      _leaf-icon(size: 10pt, color: color),
      text(fill: color.darken(20%), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// 6. finding-quote — scholarly blockquote with left vine-border SVG
#let finding-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.green-light,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      grid(columns: (auto, 1fr), column-gutter: 10pt,
        _vine-border(height: 60pt),
        stack(spacing: .8em,
          {
            set text(fill: palette.ink, size: 0.85em, style: "italic")
            quote
          },
          if author != none {
            text(fill: palette.green, size: 0.78em, weight: "bold", style: "normal")[-- #author]
          },
        ),
      ),
      lazy-v(1fr),
    )
  ]
}

/// 7. milestone-stat — large number + label with subtle gold underline, no box
#let milestone-stat(label, value, color: palette.gold) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.4em))[
    #set std.align(center)
    #stack(spacing: .8em,
      // Large number
      text(fill: color, size: 1.8em, weight: "bold", value),
      // Gold underline
      block(width: 60%, height: 1.5pt, fill: color.transparentize(40%)),
      // Label
      text(fill: palette.ink-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}


// ═══ Slide Functions ═══

/// Standard content slide — ivory bg, leaf corner marks, formal header
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.5em, bottom: 0.1em))
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
      // Subtle gold underline
      block(width: 100pt, height: 1.5pt, fill: palette.gold.transparentize(30%)),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.6em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      _leaf-icon(size: 7pt, color: palette.gold),
      {
        set std.align(right)
        context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  let setting(body) = {
    show: std.align.with(self.store.align)
    _content-atmosphere()
    body
  }
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — laurel wreath frame, formal centered layout
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Leaf corner decorations
    place(top + left, dx: 12pt, dy: 12pt, _leaf-corner(size: 36pt))
    place(top + right, dx: -12pt, dy: 12pt,
      scale(x: -100%, _leaf-corner(size: 36pt)))
    place(bottom + left, dx: 12pt, dy: -12pt,
      scale(y: -100%, _leaf-corner(size: 36pt)))
    place(bottom + right, dx: -12pt, dy: -12pt,
      scale(x: -100%, y: -100%, _leaf-corner(size: 36pt)))
    // Center content with wreath
    set std.align(center + horizon)
    pad(x: 4em)[
      // Laurel wreath behind/above title
      #_laurel-wreath(size: 110pt)
      #v(0.4em)
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.primary, info.title)
      #v(0.2em)
      // Gold separator
      #block(width: 140pt, height: 1.5pt, fill: palette.gold)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 0.95em, fill: palette.green, info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 0.95em, fill: palette.ink, weight: "regular", info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.ink-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.1em)
        text(size: 0.8em, fill: palette.gold)[#utils.display-info-date(self)]
      }
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

/// New section slide — formal section transition with vine divider
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
    // Leaf corner marks
    place(top + left, dx: 12pt, dy: 12pt, _leaf-corner(size: 32pt))
    place(top + right, dx: -12pt, dy: 12pt,
      scale(x: -100%, _leaf-corner(size: 32pt)))
    // Section content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in gold
      #text(size: 2.5em, fill: palette.gold, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "I")
      ]
      #v(0.3em)
      // Section title
      #set text(fill: palette.primary, size: 1.8em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      // Vine divider
      #vine-divider(width: 50%)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — burgundy statement page with normal-flow content and gold accents
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
      fill: palette.primary,
    ),
  )
  let main-body = {
    _content-atmosphere(leaf-color: palette.bg, accent-color: palette.gold)
    // Corner leaves
    place(top + left, dx: 16pt, dy: 16pt, _leaf-corner(size: 30pt, color: palette.gold))
    place(bottom + right, dx: -16pt, dy: -16pt,
      scale(x: -100%, y: -100%, _leaf-corner(size: 30pt, color: palette.gold)))
    // Normal flow keeps the slide measurable while constraining long statements.
    set std.align(center + horizon)
    block(width: 72%)[
      #set std.align(center)
      #set text(fill: palette.bg, size: 1.3em, weight: "bold")
      #stack(spacing: .8em,
        body,
        vine-divider(width: 45%, color: palette.gold),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — laurel wreath frame bookend, mirroring title
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
    // Corner decorations
    place(top + left, dx: 12pt, dy: 12pt, _leaf-corner(size: 36pt))
    place(top + right, dx: -12pt, dy: 12pt,
      scale(x: -100%, _leaf-corner(size: 36pt)))
    place(bottom + left, dx: 12pt, dy: -12pt,
      scale(y: -100%, _leaf-corner(size: 36pt)))
    place(bottom + right, dx: -12pt, dy: -12pt,
      scale(x: -100%, y: -100%, _leaf-corner(size: 36pt)))
    // Center content
    set std.align(center + horizon)
    block(width: 65%)[
      #set std.align(center)
      // Wreath (shared with title)
      #stack(spacing: .8em,
        // Wreath (shared with title)
        _laurel-wreath(size: 100pt),
        // Main text
        text(size: 2.2em, weight: "bold", fill: palette.primary, body),
        // Gold line
        block(width: 120pt, height: 1.5pt, fill: palette.gold),
        // Vine divider
        vine-divider(width: 40%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ Theme Entry Point ═══

#let laurel-crown-theme(
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
      primary: palette.primary,
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
