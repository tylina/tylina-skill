// Ivory Tower Theme — Elegant cream and gold premium aesthetic
// Executive luxury: ivory background, gold accents, sophisticated serif feel, refined SVG ornaments
// Features: gold corner ornaments, filigree dividers, monogram frames, gilt-edge cards
// Perfect for executive presentations, investor decks, premium brand pitches, annual reports
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  ivory: rgb("#FFFEF8"),
  primary: rgb("#1B2A4A"),
  accent-gold: rgb("#B8964A"),
  secondary: rgb("#7A7064"),
  card-white: rgb("#FFFFFF"),
  border: rgb("#E8E3D8"),
  text-dark: rgb("#1B2A4A"),
  text-body: rgb("#2C2C2C"),
  text-secondary: rgb("#5A5A5A"),
  text-muted: rgb("#9A9488"),
  gold-light: rgb("#B8964A").lighten(70%),
  gold-faint: rgb("#B8964A").transparentize(90%),
)


// === SVG Definitions ===

// Gold corner ornament — elegant floral/scroll corner piece
#let _corner-ornament-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80">
  <path d="M2,2 C2,2 8,2 12,6 C16,10 18,16 20,20 C22,24 22,28 24,30 C26,32 30,30 32,32 C34,34 36,38 34,40 C32,42 28,40 26,42 C24,44 26,48 24,50 C22,52 18,50 16,52 C14,54 16,58 14,60" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.7"/>
  <path d="M2,2 C4,6 6,12 10,16 C14,20 20,22 24,26 C28,30 30,36 34,38" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" opacity="0.5"/>
  <circle cx="6" cy="6" r="2" fill="currentColor" opacity="0.6"/>
  <circle cx="14" cy="14" r="1.5" fill="currentColor" opacity="0.4"/>
  <circle cx="24" cy="24" r="1.5" fill="currentColor" opacity="0.4"/>
  <path d="M4,10 C6,12 8,10 10,12" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.4"/>
  <path d="M10,4 C12,6 10,8 12,10" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.4"/>
</svg>```.text

// Refined rule/divider with dots — elegant horizontal separator with diamond accents
#let _filigree-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <line x1="20" y1="8" x2="130" y2="8" stroke="currentColor" stroke-width="1" opacity="0.6"/>
  <line x1="170" y1="8" x2="280" y2="8" stroke="currentColor" stroke-width="1" opacity="0.6"/>
  <polygon points="150,3 155,8 150,13 145,8" fill="currentColor" opacity="0.8"/>
  <circle cx="135" cy="8" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="165" cy="8" r="2" fill="currentColor" opacity="0.5"/>
  <circle cx="125" cy="8" r="1.2" fill="currentColor" opacity="0.3"/>
  <circle cx="175" cy="8" r="1.2" fill="currentColor" opacity="0.3"/>
  <line x1="138" y1="8" x2="143" y2="8" stroke="currentColor" stroke-width="1.2" opacity="0.6"/>
  <line x1="157" y1="8" x2="162" y2="8" stroke="currentColor" stroke-width="1.2" opacity="0.6"/>
</svg>```.text

// Monogram frame — decorative oval/shield frame for initials or icons
#let _monogram-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <ellipse cx="32" cy="32" rx="26" ry="28" fill="none" stroke="currentColor" stroke-width="1.8" opacity="0.7"/>
  <ellipse cx="32" cy="32" rx="22" ry="24" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.4"/>
  <path d="M16,10 C20,6 28,4 32,4 C36,4 44,6 48,10" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.5"/>
  <path d="M16,54 C20,58 28,60 32,60 C36,60 44,58 48,54" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" opacity="0.5"/>
  <circle cx="32" cy="4" r="1.5" fill="currentColor" opacity="0.6"/>
  <circle cx="32" cy="60" r="1.5" fill="currentColor" opacity="0.6"/>
  <circle cx="6" cy="32" r="1.5" fill="currentColor" opacity="0.4"/>
  <circle cx="58" cy="32" r="1.5" fill="currentColor" opacity="0.4"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render gold corner ornament
#let corner-ornament(color: palette.accent-gold, size: 60pt) = {
  let svg = _corner-ornament-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render filigree divider
#let filigree-divider(color: palette.accent-gold, width: 60%) = {
  let svg = _filigree-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 12pt)))
}

/// Render monogram frame
#let monogram-frame(color: palette.accent-gold, size: 48pt) = {
  let svg = _monogram-frame-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


// === Helper Functions ===

/// Gold accent line for titles
#let gold-accent-line(width: 60pt, color: palette.accent-gold) = {
  block(width: width, height: 2pt, fill: color, radius: 1pt)
}

/// Subtle background with faint gold corner ornaments (for content slides)
#let ivory-corners-bg() = {
  let ornament-color = palette.accent-gold.transparentize(85%)
  let svg = _corner-ornament-svg.replace("currentColor", ornament-color.to-hex())
  // Top-left corner
  place(top + left, dx: 8pt, dy: 8pt,
    box(image(bytes(svg), width: 40pt, height: 40pt)))
  // Top-right corner (mirrored)
  place(top + right, dx: -8pt, dy: 8pt,
    scale(x: -100%, box(image(bytes(svg), width: 40pt, height: 40pt))))
  // Bottom-left corner (mirrored vertically)
  place(bottom + left, dx: 8pt, dy: -8pt,
    scale(y: -100%, box(image(bytes(svg), width: 40pt, height: 40pt))))
  // Bottom-right corner (mirrored both)
  place(bottom + right, dx: -8pt, dy: -8pt,
    scale(x: -100%, scale(y: -100%, box(image(bytes(svg), width: 40pt, height: 40pt)))))
}


// === 1. Slide Functions ===

/// Standard content slide with ivory background, gold header accent, and corner ornaments
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
        set text(fill: palette.primary, size: 1.2em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      gold-accent-line(width: 80pt, color: palette.accent-gold),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    block(width: 100%, height: 0.5pt, fill: palette.border)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Center: gold diamond ornament
      stack(dir: ltr, spacing: 6pt,
        line(length: 20pt, stroke: 0.5pt + palette.border),
        text(fill: palette.accent-gold, size: 0.8em)[#sym.diamond.filled],
        line(length: 20pt, stroke: 0.5pt + palette.border),
      ),
      {
        set std.align(right)
        context text(fill: palette.text-secondary, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
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

/// Title slide — premium ivory cover with gold ornaments and monogram frame
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Subtle gold border frame
    place(center + horizon,
      rect(width: 92%, height: 88%,
        fill: none,
        stroke: 1pt + palette.accent-gold.transparentize(60%),
        radius: 2pt))
    // Corner ornaments
    ivory-corners-bg()
    // Center content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: 0.8em,
        monogram-frame(color: palette.accent-gold, size: 52pt),
        text(size: 2em, weight: "bold", fill: palette.primary, info.title),
        filigree-divider(color: palette.accent-gold, width: 50%),
        if info.subtitle != none { text(size: 0.95em, fill: palette.secondary, info.subtitle) },
        if info.author != none { text(size: 1.1em, weight: "semibold", fill: palette.primary, info.author) },
        if info.institution != none { text(size: 0.8em, fill: palette.text-secondary, info.institution) },
        if info.date != none { text(size: 0.75em, fill: palette.text-muted)[#utils.display-info-date(self)] },
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

/// New section slide — gold section number, navy title, filigree divider
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
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Faint gold left accent bar
    place(left, block(width: 4pt, height: 100%, fill: palette.accent-gold))
    // Large faint section number in background
    place(right + horizon, dx: -60pt, dy: -20pt, {
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "1")
        text(
          size: 12em,
          weight: "bold",
          fill: palette.accent-gold.transparentize(88%),
          num-str,
        )
      }
    })
    // Corner ornaments (top-left and bottom-right)
    place(top + left, dx: 20pt, dy: 20pt, corner-ornament(color: palette.accent-gold.transparentize(50%), size: 50pt))
    place(bottom + right, dx: -20pt, dy: -20pt, scale(x: -100%, scale(y: -100%, corner-ornament(color: palette.accent-gold.transparentize(50%), size: 50pt))))
    // Section content
    pad(left: 4em, right: 5em, top: 4em, bottom: 3em)[
      #stack(
        spacing: 0.8em,
        v(1fr),
        text(size: 0.8em, weight: "bold", fill: palette.accent-gold, tracking: 2pt)[SECTION],
        {
          set text(fill: palette.primary, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        gold-accent-line(width: 100pt, color: palette.accent-gold),
        v(1fr),
      )
    ]
    // Bottom filigree divider
    place(bottom, dy: -1.5em, filigree-divider(color: palette.accent-gold.transparentize(40%), width: 40%))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep navy background with gold accents for key statements
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
    // Deep navy background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Gold top accent line
    place(top + left, block(width: 100%, height: 3pt, fill: palette.accent-gold))
    // Gold bottom accent line
    place(bottom + left, block(width: 100%, height: 3pt, fill: palette.accent-gold))
    // Faint corner ornaments
    place(top + left, dx: 20pt, dy: 20pt, corner-ornament(color: palette.accent-gold.transparentize(60%), size: 50pt))
    place(bottom + right, dx: -20pt, dy: -20pt, scale(x: -100%, scale(y: -100%, corner-ornament(color: palette.accent-gold.transparentize(60%), size: 50pt))))
    // Center content
    place(center + horizon,
      block(width: 75%)[
        #set std.align(center)
        #set text(fill: palette.card-white, size: 1.6em, weight: "bold")
        #stack(
          spacing: 0.8em,
          body,
          filigree-divider(color: palette.accent-gold.transparentize(30%), width: 50%),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — elegant closing with monogram frame and gold ornaments
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
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Decorative border frame
    place(center + horizon,
      rect(width: 88%, height: 84%,
        fill: none,
        stroke: 1pt + palette.accent-gold.transparentize(50%),
        radius: 2pt))
    // Corner ornaments
    ivory-corners-bg()
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Monogram frame
      #stack(
        spacing: 0.8em,
        monogram-frame(color: palette.accent-gold, size: 56pt),
        text(size: 2.2em, weight: "bold", fill: palette.primary, body),
        filigree-divider(color: palette.accent-gold, width: 60%),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Gilt card — premium card with gold top border and ivory fill
#let gilt-card(title, body, accent: palette.accent-gold) = {
  block(
    width: 100%,
    fill: palette.card-white,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 3pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.9em)[#sym.diamond.filled #title],
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Capital stat — large statistic display with gold accent number
#let capital-stat(label, value, color: palette.accent-gold) = {
  block(
    width: 100%,
    fill: palette.card-white,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 3pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      monogram-frame(color: color, size: 20pt),
      text(fill: color, size: 2em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Charter box — formal content box with left gold bar accent
#let charter-box(title, body, accent: palette.accent-gold) = {
  block(
    width: 100%,
    fill: palette.ivory,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.9em)[#title],
      stack(
        spacing: 0.8em,
        block(width: 50pt, height: 1.5pt, fill: accent.transparentize(50%)),
        {
          set text(fill: palette.text-body, size: 0.82em)
          body
        },
      ),
      lazy-v(1fr),
    )
  ]
}

/// Filigree divider component — inline decorative separator
#let filigree-divider-component(color: palette.accent-gold, width: 60%) = {
  filigree-divider(color: color, width: width)
}

/// Signet tag — small premium tag/badge with gold border
#let signet-tag(content, color: palette.accent-gold) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color,
    inset: (x: 0.7em, y: 0.3em),
    radius: 2pt,
  )[
    #set text(fill: color, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Treasury highlight — emphasized content block with gold background tint
#let treasury-highlight(title, body) = {
  block(
    width: 100%,
    fill: palette.accent-gold.transparentize(88%),
    stroke: (left: 4pt + palette.accent-gold, rest: 1pt + palette.accent-gold.transparentize(60%)),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.accent-gold, size: 0.9em)[#sym.star.filled #title],
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

// === 3. Theme Entry Point ===

#let ivory-tower-theme(
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
      fill: palette.ivory,
      margin: (top: 4em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent-gold,
      neutral-lightest: palette.card-white,
      neutral-darkest: palette.primary,
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
