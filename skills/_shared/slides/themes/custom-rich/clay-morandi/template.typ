// Clay Morandi Theme — Muted earth tones, ceramic warmth, rounded softness
// Inspired by Giorgio Morandi's still life palette and modern clay/ceramic aesthetics
// Features: 6 rotating morandi shades, 12pt rounded corners everywhere, warm linen bg
// Perfect for interior design, lifestyle brands, craft, sustainability, wellness
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  primary: rgb("#8B7D6B"),       // Warm gray-brown
  bg: rgb("#F5F1EC"),            // Warm linen
  card: rgb("#FDFBF8"),          // Warm off-white
  text: rgb("#3D3530"),          // Warm dark brown (never pure black)
  text-body: rgb("#5A4E47"),     // Medium warm brown
  text-light: rgb("#776B64"),    // Accessible muted caption brown
  border: rgb("#E8E0D8"),        // Warm border
  focus-bg: rgb("#677B8C"),      // Dark slate blue for inverted focus slides
)

// 6 Morandi shades — the heart of this theme
#let _morandi-shades = (
  rgb("#C4A4A0"),  // Dusty rose
  rgb("#A8B5A0"),  // Sage
  rgb("#C49A7C"),  // Terracotta
  rgb("#8B9DAD"),  // Slate blue
  rgb("#D4C4A8"),  // Sand
  rgb("#B8A0B8"),  // Mauve
)

/// Returns a morandi shade by index (cycles through 6 colors)
#let morandi-color(index) = {
  _morandi-shades.at(calc.rem(index, _morandi-shades.len()))
}


// === 1. Slide Functions ===

/// Content slide — warm linen bg, clean title with thin morandi-shade underline
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text, size: 1.4em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Thin morandi-shade underline (uses section-based color cycling)
      block(width: 60pt, height: 2.5pt, fill: _morandi-shades.at(0), radius: 1.5pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        // Small morandi dot
        box(circle(radius: 2.5pt, fill: palette.primary))
      },
      {
        set std.align(right)
        context { text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number] }
      },
    )
  }
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

/// Title slide — linen bg with large morandi-colored rounded rectangle, white title on top
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm linen background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Large morandi-colored rounded rectangle (~60% of slide)
    set std.align(center + horizon)
    block(
      width: 72%,
      height: 62%,
      fill: _morandi-shades.at(2),  // Terracotta
      radius: 12pt,
    )[
      #set std.align(center + horizon)
      // Dark earthen text preserves contrast against the muted terracotta.
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "semibold", fill: palette.text, info.title),
        if info.subtitle != none {
          text(size: 1em, fill: palette.text, info.subtitle)
        },
      )
    ]
    // Author info below the block
    place(bottom + center, dy: -2.5em,
      stack(
        dir: ltr,
        spacing: 1.5em,
        if info.author != none {
          text(size: 1em, weight: "semibold", fill: palette.text, info.author)
        },
        if info.institution != none {
          text(size: 0.85em, fill: palette.text-light, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.text-light, utils.display-info-date(self))
        },
      )
    )
    // Small decorative circles in morandi shades at top corners
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 12pt, fill: _morandi-shades.at(0).transparentize(60%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 10pt, fill: _morandi-shades.at(4).transparentize(60%)))
    place(bottom + left, dx: 3em, dy: -5em,
      circle(radius: 8pt, fill: _morandi-shades.at(1).transparentize(70%)))
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

/// Section divider — cycling morandi shade as large rounded bg block, white section title
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
    // Linen background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Large rounded morandi block (cycles through shades based on context)
    place(center + horizon,
      block(
        width: 70%,
        height: 55%,
        fill: _morandi-shades.at(1),  // Sage
        radius: 12pt,
      )[
        #set std.align(center + horizon)
        #set text(fill: palette.text, size: 2.2em, weight: "semibold")
        #utils.display-current-heading(level: 1)
      ]
    )
    // Decorative small circles
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 14pt, fill: _morandi-shades.at(3).transparentize(70%)))
    place(bottom + left, dx: 3em, dy: -2.5em,
      circle(radius: 10pt, fill: _morandi-shades.at(5).transparentize(70%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — one morandi shade fills the entire bg, white text centered
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.focus-bg,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: palette.card, size: 2em, weight: "semibold")
  touying-slide(
    self: self,
    std.align(horizon + center, block(width: 100%, inset: (x: 1em))[#body]),
  )
})

/// Ending slide — linen bg, centered text, small morandi-colored circle ornaments
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
    // Warm linen background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Center content
    set std.align(center + horizon)
    block(width: 50%, inset: 2em)[
      #set std.align(center)
      #stack(spacing: 1em,
        text(size: 2.4em, weight: "semibold", fill: palette.text, body),
        // Row of morandi circle ornaments
        stack(dir: ltr, spacing: 12pt,
          box(circle(radius: 5pt, fill: _morandi-shades.at(0))),
          box(circle(radius: 5pt, fill: _morandi-shades.at(1))),
          box(circle(radius: 5pt, fill: _morandi-shades.at(2))),
          box(circle(radius: 5pt, fill: _morandi-shades.at(3))),
          box(circle(radius: 5pt, fill: _morandi-shades.at(4))),
          box(circle(radius: 5pt, fill: _morandi-shades.at(5))),
        ),
      )
    ]
    // Corner circle ornaments
    place(top + left, dx: 3em, dy: 3em,
      circle(radius: 16pt, fill: _morandi-shades.at(0).transparentize(75%)))
    place(top + right, dx: -3em, dy: 3em,
      circle(radius: 12pt, fill: _morandi-shades.at(4).transparentize(75%)))
    place(bottom + left, dx: 4em, dy: -3em,
      circle(radius: 10pt, fill: _morandi-shades.at(1).transparentize(75%)))
    place(bottom + right, dx: -4em, dy: -3em,
      circle(radius: 14pt, fill: _morandi-shades.at(5).transparentize(75%)))
  }
  touying-slide(self: self, main-body)
})

/// Outline/TOC slide — clean list with morandi dot bullets (each section different shade)
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Linen background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Content
    pad(left: 4em, right: 4em, top: 3em, bottom: 2em)[
      #stack(
        spacing: 1.5em,
        stack(
          spacing: .8em,
          text(size: 1.6em, weight: "semibold", fill: palette.text, title),
          block(width: 50pt, height: 2.5pt, fill: _morandi-shades.at(2), radius: 1.5pt),
        ),
        {
          set text(size: 1.4em, fill: palette.text, weight: "semibold")
          outline(title: none, depth: 1)
        },
      )
    ]
    // Decorative corner circles
    place(top + right, dx: -2.5em, dy: 2em,
      circle(radius: 18pt, fill: _morandi-shades.at(3).transparentize(80%)))
    place(bottom + left, dx: 2.5em, dy: -2em,
      circle(radius: 14pt, fill: _morandi-shades.at(0).transparentize(80%)))
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Morandi card — rounded card in one of 6 morandi shades (each usage picks a different shade)
#let morandi-card(title, body, shade: 0) = {
  let bg-color = _morandi-shades.at(calc.rem(shade, _morandi-shades.len()))
  block(
    width: 100%,
    fill: bg-color.lighten(75%),
    stroke: 1pt + bg-color.lighten(40%),
    inset: (x: 1.2em, y: 1em),
    radius: 12pt,
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: palette.text, size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.85em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Vessel stat — number card with thick rounded bottom border in morandi color
#let vessel-stat(value, label, shade: 0) = {
  let bg-color = _morandi-shades.at(calc.rem(shade, _morandi-shades.len()))
  block(
    width: 100%,
    fill: palette.card,
    stroke: (bottom: 4pt + bg-color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 12pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(size: 2em, weight: "semibold", fill: bg-color.darken(20%), value),
      text(size: 0.8em, fill: palette.text-light, label),
      lazy-v(1fr),
    )
  ]
}

/// Earth tag — rounded pill in morandi shade
#let earth-tag(content, shade: 0) = {
  let bg-color = _morandi-shades.at(calc.rem(shade, _morandi-shades.len()))
  box(
    fill: bg-color.lighten(70%),
    stroke: 1pt + bg-color.lighten(40%),
    inset: (x: 0.8em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: palette.text, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Linen quote — quote with thin morandi-colored left bar + italic text
#let linen-quote(quote, author: none, shade: 0) = {
  let bg-color = _morandi-shades.at(calc.rem(shade, _morandi-shades.len()))
  block(
    width: 100%,
    fill: palette.card,
    stroke: (left: 3pt + bg-color),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 12pt),
  )[
    #set text(fill: palette.text-body, size: 0.9em, style: "italic")
    #sym.quote.double.low#quote#sym.quote.double.high
    #if author != none {
      v(0.4em)
      set text(fill: palette.text-light, size: 0.8em, weight: "semibold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Ceramic divider — thin line in a morandi shade, not full width
#let ceramic-divider(shade: 0, width: 40%) = {
  let bg-color = _morandi-shades.at(calc.rem(shade, _morandi-shades.len()))
  std.align(center,
    block(width: width, height: 1.5pt, fill: bg-color.lighten(30%), radius: 1pt)
  )
}

/// Palette strip — decorative row of small rounded color blocks showing all 6 shades
#let palette-strip() = {
  std.align(center,
    stack(dir: ltr, spacing: 6pt,
      ..(_morandi-shades.map(c =>
        box(width: 24pt, height: 8pt, fill: c, radius: 4pt)
      ))
    )
  )
}


// === 3. Theme Entry Point ===

#let clay-morandi-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(
    size: 20pt,
    fill: palette.text-body,
  )

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: rgb("#FDFBF8"),
      neutral-darkest: palette.text,
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
