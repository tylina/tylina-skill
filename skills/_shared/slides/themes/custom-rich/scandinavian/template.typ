// Scandinavian Theme — Nordic minimalism meets functional beauty
// Clean whites, soft grays, muted sage green and dusty blue accents.
// Natural, calm, functional. Inspired by Scandinavian interior design.
// Features: generous whitespace, subtle colors, clean geometric forms, typography-forward
// Perfect for design studios, wellness, sustainable products, architecture, interior design
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  primary: rgb("#3D5A5B"),       // Muted teal/sage
  secondary: rgb("#C4956A"),     // Warm wood/terracotta
  secondary-text: rgb("#9B633B"),// Text-safe warm wood
  off-white: rgb("#E8E2D9"),     // Warm off-white/linen
  stone: rgb("#B8C4C4"),         // Cool stone gray
  stone-text: rgb("#5D6E70"),    // Text-safe cool stone
  bg: rgb("#FAFAF8"),            // Warm white background
  card: rgb("#FFFFFF"),          // Pure white cards
  text-dark: rgb("#2C3639"),     // Charcoal headings
  text-body: rgb("#4A5859"),     // Soft dark body text
  text-light: rgb("#667577"),    // Text-safe muted gray captions
  border: rgb("#E0DDD7"),        // Soft border
)


#let _text-accent(accent) = {
  if accent == palette.secondary {
    palette.secondary-text
  } else if accent == palette.stone {
    palette.stone-text
  } else {
    accent
  }
}


// Subtle Nordic-light atmosphere for ordinary content slides
#let _scandi-atmosphere() = {
  place(top + right, dx: -2.2em, dy: 5.2em,
    circle(radius: 26pt, fill: palette.off-white.transparentize(50%)))
  place(top + right, dx: -3.4em, dy: 5.8em,
    circle(radius: 14pt, fill: palette.stone.transparentize(78%)))
}


// ═══ 1. Slide Functions ═══

/// Content slide — clean minimal header with sage underline, no top bar
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 1.2em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      line(length: 50pt, stroke: 1.5pt + palette.primary),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: .7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none { utils.call-or-display(self, self.store.footer) },
      { box(circle(radius: 2pt, fill: palette.primary.transparentize(40%))) },
      {
        set std.align(right)
        context { utils.slide-counter.display() + " / " + utils.last-slide-number }
      },
    )
  }
  let setting(body) = {
    _scandi-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — generous whitespace, centered title block, warm white bg
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set std.align(center + horizon)
    pad(x: 3em)[
      // Subtle decorative circle in top-right
      #place(top + right, dx: -2em, dy: 1.5em,
        circle(radius: 40pt, fill: palette.primary.transparentize(94%)))
      #place(top + right, dx: -3.5em, dy: 3em,
        circle(radius: 25pt, fill: palette.stone.transparentize(90%)))
      // Title
      #v(1fr)
      #text(size: 2.4em, weight: "bold", fill: palette.text-dark, info.title)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.text-light, info.subtitle)
        v(0.6em)
      }
      // Thin sage line separator
      #line(length: 80pt, stroke: 1.2pt + palette.primary)
      #v(0.8em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "medium", fill: palette.primary, info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.85em, fill: palette.text-light, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.text-light)[#utils.display-info-date(self)]
      }
      #v(1fr)
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      header: none,
      footer: none,
      margin: (x: 2em, y: 1.5em),
    ),
  )
  touying-slide(self: self, body)
})

/// Section slide — light sage area, large clean section number
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
    // Background: left linen strip
    place(top + left, block(
      width: 35%,
      height: 100%,
      fill: palette.off-white.transparentize(40%),
    ))
    // Thin vertical sage line
    place(left, dx: 34.5%, block(width: 1.5pt, height: 100%, fill: palette.primary.transparentize(60%)))
    // Section number (large, light)
    place(left + horizon, dx: 4em, dy: -1.5em,
      text(size: 4em, weight: "bold", fill: palette.primary.transparentize(60%),
        utils.display-current-heading-number(level: 1, numbering: "01")))
    // Section title
    pad(left: 40%, right: 4em, top: 4em, bottom: 3em)[
      #v(1fr)
      #set text(fill: palette.text-dark, size: 1.8em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.5em)
      #line(length: 50pt, stroke: 1.5pt + palette.primary)
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — clean TOC
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: (x: 4em, y: 2.5em),
    ),
  )
  let main-body = {
    // Subtle corner decoration
    place(top + right, dx: -1em, dy: 1em,
      circle(radius: 30pt, fill: palette.primary.transparentize(94%)))
    set std.align(left + horizon)
    stack(
      spacing: 1.2em,
      {
        set text(size: 1.6em, weight: "semibold", fill: palette.text-dark)
        title
      },
      line(length: 50pt, stroke: 1.5pt + palette.primary),
      {
        v(0.5em)
        set text(size: 1.2em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — sage/teal background, white text
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
    // Subtle circle decoration
    place(top + right, dx: -1em, dy: 1em,
      circle(radius: 60pt, fill: white.transparentize(95%)))
    place(bottom + left, dx: 2em, dy: -2em,
      circle(radius: 40pt, fill: white.transparentize(95%)))
    set text(fill: white, size: 2em, weight: "semibold")
    std.align(horizon + center,
      block(width: 100%, inset: (x: 1em))[#body])
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — minimal centered, geometric circle ornament
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.bg,
      header: none,
      footer: none,
      margin: 2em,
    ),
  )
  let main-body = {
    set std.align(center + horizon)
    stack(
      spacing: 1em,
      // Main text
      text(size: 2.2em, weight: "semibold", fill: palette.primary, body),
      // Thin decorative line
      line(length: 80pt, stroke: 1pt + palette.primary.transparentize(40%)),
      // Geometric circle ornament
      stack(dir: ltr, spacing: 10pt,
        box(circle(radius: 4pt, fill: palette.primary.transparentize(60%))),
        box(circle(radius: 6pt, fill: palette.primary.transparentize(40%))),
        box(circle(radius: 4pt, fill: palette.primary.transparentize(60%))),
      ),
    )
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Hygge card — soft rounded card with subtle border, cozy and warm
#let hygge-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 2pt + accent, rest: 0.75pt + palette.border),
    inset: (x: 1.2em, y: 1em),
    radius: 8pt,
  )[
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: _text-accent(accent), size: 0.95em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Nature box — callout with sage left accent, light fill
#let nature-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 3pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 6pt),
  )[
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: _text-accent(accent), size: 0.92em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Stone stat — KPI card with natural color highlight
#let stone-stat(value, label, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.75pt + palette.border,
    inset: (x: 1em, y: 0.5em),
    radius: 8pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(size: 2em, weight: "bold", fill: _text-accent(accent), value),
      text(size: 0.78em, fill: palette.text-light, label),
      lazy-v(1fr),
    )
  ]
}

/// Linen divider — soft decorative separator line
#let linen-divider(width: 100%) = {
  v(0.5em)
  line(length: width, stroke: 0.75pt + palette.border)
  v(0.5em)
}

/// Birch tag — minimal rounded tag/pill
#let birch-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 0.75pt + color.lighten(50%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: _text-accent(color), size: 0.75em, weight: "medium")
    #content
  ]
}

/// Fjord quote — elegant quote with thin left sage line
#let fjord-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (left: 2pt + palette.primary),
    inset: (left: 1.2em, right: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text-body, size: 0.9em, style: "italic")
        quote
      },
      {
        if author != none {
          text(fill: palette.text-light, size: 0.78em, weight: "medium", style: "normal")[-- #author]
        }
      },
      lazy-v(1fr),
    )
  ]
}

/// Warm callout — secondary/wood colored callout variant
#let warm-box(title, body) = nature-box(title, body, accent: palette.secondary)

/// Data table — clean Scandinavian table with subtle headers
#let scandi-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.off-white }
      else if calc.odd(row) { palette.card } else { palette.bg },
    stroke: 0.5pt + palette.border,
    inset: (x: 1em, y: 0.6em),
    align: align,
    table.header(..headers.map(h => text(weight: "semibold", fill: palette.text-dark, size: 0.85em, h))),
    ..rows.flatten().map(c => text(fill: palette.text-body, size: 0.82em, c)),
  )
}


// ═══ 3. Theme Entry Point ═══

#let scandinavian-theme(
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
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: white,
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
