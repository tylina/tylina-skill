// Darkroom Theme — Analog photography darkroom aesthetic
// Red safelight glow, chemical developer trays, contact sheets,
// film strips with sprocket holes, images emerging from developer bath
// Intimate, craft-focused, warm red-black atmosphere
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  safelight: (bg: rgb("#1A0A0A"), ink: rgb("#F0E8E0"), accent: rgb("#CC2200"), accent-text: rgb("#F04A2A"), secondary: rgb("#A67B5B"), secondary-text: rgb("#A67B5B"), surface: rgb("#201010")),
  developer: (bg: rgb("#0F0808"), ink: rgb("#E8DDD4"), accent: rgb("#991100"), accent-text: rgb("#D9492C"), secondary: rgb("#8B6B4A"), secondary-text: rgb("#A98160"), surface: rgb("#180C0C")),
  print: (bg: rgb("#F5F0E8"), ink: rgb("#1A0A0A"), accent: rgb("#CC2200"), accent-text: rgb("#A71900"), secondary: rgb("#A67B5B"), secondary-text: rgb("#735038"), surface: rgb("#EDE5DA")),
)

// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  let accent-text = p.accent-text
  let secondary = p.secondary
  let secondary-text = p.secondary-text
  let surface = p.surface
  (
    bg: bg,
    ink: ink,
    accent: accent,
    accent-text: accent-text,
    secondary: secondary,
    secondary-text: secondary-text,
    surface: surface,
    // Derived from ink
    ink-dim: ink.transparentize(25%),
    ink-muted: ink.transparentize(40%),
    ink-faint: ink.transparentize(72%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent (the safelight red)
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(55%),
    accent-faint: accent.transparentize(78%),
    accent-ghost: accent.transparentize(92%),
    // Derived from secondary (sepia/chemical)
    secondary-dim: secondary.transparentize(35%),
    secondary-muted: secondary.transparentize(55%),
    secondary-faint: secondary.transparentize(78%),
    // Surface variants
    surface-light: surface.lighten(8%),
    // Meta
    meta-color: ink.transparentize(40%),
    rule-color: ink.transparentize(75%),
  )
}

// Default palette
#let palette = build-palette("safelight")

// Public components read this state so their colors follow the active preset.
#let _active-palette = state("darkroom-active-palette", palette)

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 28pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 7.5pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "IBM Plex Mono"
#let _serif-font = ("Iowan Old Style", "Arial Unicode MS")
#let _sans-font = ("Avenir Next", "Arial Unicode MS")

// =====================================================================
// SVG Definitions
// =====================================================================

// Film strip: perforated rectangle border with sprocket holes along top and bottom edges
#let _filmstrip-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 60\"><rect x=\"0\" y=\"0\" width=\"400\" height=\"60\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\"/><rect x=\"10\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"30\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"50\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"70\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"90\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"110\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"130\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"150\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"170\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"190\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"210\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"230\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"250\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"270\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"290\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"310\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"330\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"350\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"370\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"390\" y=\"4\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"10\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"30\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"50\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"70\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"90\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"110\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"130\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"150\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"170\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"190\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"210\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"230\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"250\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"270\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"290\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"310\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"330\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"350\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"370\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"390\" y=\"44\" width=\"8\" height=\"12\" rx=\"1.5\" fill=\"currentColor\" opacity=\"0.7\"/></svg>"

// Contact sheet grid: thin grid lines suggesting photo contact sheets
#let _contactsheet-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 200\"><line x1=\"0\" y1=\"50\" x2=\"300\" y2=\"50\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><line x1=\"0\" y1=\"100\" x2=\"300\" y2=\"100\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><line x1=\"0\" y1=\"150\" x2=\"300\" y2=\"150\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><line x1=\"60\" y1=\"0\" x2=\"60\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><line x1=\"120\" y1=\"0\" x2=\"120\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><line x1=\"180\" y1=\"0\" x2=\"180\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><line x1=\"240\" y1=\"0\" x2=\"240\" y2=\"200\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.3\"/><rect x=\"5\" y=\"5\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"65\" y=\"5\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"125\" y=\"5\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"185\" y=\"5\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"245\" y=\"5\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"5\" y=\"55\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"65\" y=\"55\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"125\" y=\"55\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"185\" y=\"55\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/><rect x=\"245\" y=\"55\" width=\"50\" height=\"40\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.2\" opacity=\"0.15\"/></svg>"

// Developer drip: irregular descending droplet shape (chemical developing)
#let _drip-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 30 80\"><path d=\"M 15 0 Q 15 15 12 25 Q 8 38 10 50 Q 12 62 15 70 Q 16 75 15 80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.6\" stroke-linecap=\"round\"/><circle cx=\"15\" cy=\"78\" r=\"3\" fill=\"currentColor\" opacity=\"0.4\"/><path d=\"M 20 5 Q 20 18 18 28 Q 16 38 18 45\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\" stroke-linecap=\"round\"/></svg>"

// Aperture: hexagonal iris shape (like camera aperture blades)
#let _aperture-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><polygon points=\"50,10 85,30 85,70 50,90 15,70 15,30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.6\"/><polygon points=\"50,25 72,37 72,63 50,75 28,63 28,37\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.4\"/><polygon points=\"50,38 60,44 60,56 50,62 40,56 40,44\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"50\" y1=\"10\" x2=\"50\" y2=\"25\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"85\" y1=\"30\" x2=\"72\" y2=\"37\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"85\" y1=\"70\" x2=\"72\" y2=\"63\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"50\" y1=\"90\" x2=\"50\" y2=\"75\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"15\" y1=\"70\" x2=\"28\" y2=\"63\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><line x1=\"15\" y1=\"30\" x2=\"28\" y2=\"37\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/></svg>"

// Clothespin: simple clip shape (photos hanging to dry)
#let _clothespin-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 40\"><rect x=\"4\" y=\"0\" width=\"16\" height=\"6\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><path d=\"M 6 6 L 6 30 Q 6 34 8 36 L 10 38\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\"/><path d=\"M 18 6 L 18 30 Q 18 34 16 36 L 14 38\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\"/><line x1=\"4\" y1=\"12\" x2=\"20\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let filmstrip-decoration(color: auto, width: 100%, height: 18pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _filmstrip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let contactsheet-grid(color: auto, width: 100%, height: 100%) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.ink-faint } else { color }
  let svg = _contactsheet-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let developer-drip(color: auto, width: 12pt, height: 40pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _drip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let aperture-icon(color: auto, size: 50pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _aperture-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let clothespin-icon(color: auto, width: 12pt, height: 20pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.secondary } else { color }
  let svg = _clothespin-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// safelight-dot -- Small red dot representing the safelight glow
#let safelight-dot(color: auto, size: 4pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  circle(radius: size / 2, fill: color)
}

/// safelight-glow -- Layered circles creating a glow effect
#let safelight-glow(color: auto, size: 8pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  box(width: size * 2.5, height: size * 2.5)[
    #place(center + horizon, circle(radius: size * 1.2, fill: color.transparentize(88%)))
    #place(center + horizon, circle(radius: size * 0.8, fill: color.transparentize(70%)))
    #place(center + horizon, circle(radius: size * 0.4, fill: color.transparentize(40%)))
  ]
}

// =====================================================================
// Reusable Components
// =====================================================================

/// exposure-card -- White card on dark like a photo emerging from developer
#let exposure-card(title, body) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    fill: pal.ink.transparentize(5%),
    stroke: 0.3pt + pal.ink.transparentize(70%),
    inset: (x: 1.1em, top: 0.9em, bottom: 0.7em),
  )[
    // Slight red glow at top edge
    #place(top + left, dx: 0.6em, dy: -0.15em,
      block(width: 30pt, height: 1.5pt, fill: pal.accent.transparentize(50%)))
    #stack(spacing: .8em,
      text(size: typo.body, weight: "semibold", fill: pal.bg, title),
      {
        set text(size: 13pt, fill: pal.bg.lighten(15%), font: _sans-font)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// f-stop-stat -- Large number display like camera settings (f/2.8, ISO 400)
#let f-stop-stat(label, value, description: none) = context {
  let pal = _active-palette.get()
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #set std.align(center)
    #stack(spacing: .8em,
      text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.2pt,
        fill: pal.accent-text,
        font: _mono-font,
        upper(label),
      ),
      text(size: 44pt, weight: "bold", fill: pal.ink, value),
      block(width: 24pt, height: 1.5pt, fill: pal.accent),
      if description != none { text(
        size: 13pt,
        weight: "regular",
        fill: pal.ink-muted,
        font: _sans-font,
        description,
      ) },
      lazy-v(1fr),
    )
  ]
}

/// film-divider -- Sprocket hole pattern line (horizontal divider)
#let film-divider(total-width: 100%) = context {
  let pal = _active-palette.get()
  block(width: total-width, height: 16pt)[
    #place(left + horizon, line(length: 100%, stroke: 0.4pt + pal.accent-muted))
    // Sprocket holes along the line
    #place(left + horizon, dx: 8%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 20%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 32%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 44%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 56%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 68%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 80%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
    #place(left + horizon, dx: 92%, circle(radius: 2.5pt, stroke: 0.5pt + pal.accent-muted, fill: none))
  ]
}

/// developer-tag -- Small red accent label (like a darkroom processing note)
#let developer-tag(body) = context {
  let pal = _active-palette.get()
  box(
    fill: pal.accent.transparentize(85%),
    stroke: 0.4pt + pal.accent-text,
    inset: (x: 7pt, y: 3pt),
    radius: 1pt,
  )[
    #text(size: typo.small, fill: pal.accent-text, weight: "medium", font: _mono-font, body)
  ]
}

/// proof-quote -- Quote styled like handwritten darkroom notes
#let proof-quote(body, cite: none) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    stroke: (left: 1.5pt + pal.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
  )[
    #stack(spacing: .8em,
      text(size: typo.body, style: "italic", fill: pal.ink, font: _serif-font, body),
      if cite != none { text(
        size: typo.tiny,
        style: "normal",
        weight: "medium",
        tracking: 1pt,
        fill: pal.meta-color,
        font: _mono-font,
        [-- #upper(cite)],
      ) },
    )
  ]
}

/// negative-panel -- Inverted colors panel (dark text on light within overall dark theme)
#let negative-panel(title: none, body) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    fill: pal.ink.transparentize(8%),
    inset: (x: 1.2em, y: 1em),
    stroke: (top: 2pt + pal.accent),
  )[
    #stack(spacing: .8em,
      ..if title != none { (text(size: typo.small, weight: "bold", fill: pal.bg, title),) },
      {
        set text(size: 13pt, fill: pal.bg.lighten(10%), font: _sans-font)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// contact-card -- Small card suggesting a photo thumbnail on a contact sheet
#let contact-card(label, body) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    stroke: 0.4pt + pal.ink-faint,
    inset: (x: 0.8em, y: 0.6em),
    fill: pal.surface,
  )[
    #stack(spacing: .8em,
      std.align(right, text(size: 6pt, fill: pal.accent-text, font: _mono-font, label)),
      {
        set text(size: 12pt, fill: pal.ink-dim, font: _sans-font)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// chemical-table -- Data table styled like a darkroom processing log
#let chemical-table(align: center + horizon, headers, ..rows) = context {
  let pal = _active-palette.get()
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { pal.accent.transparentize(88%) },
    stroke: 0.5pt + pal.accent-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: pal.accent-text, size: 9pt, tracking: 0.8pt, font: _mono-font, upper(h)))),
    ..rows.pos().flatten().map(c => text(fill: pal.ink-dim, size: 11pt, font: _mono-font, c)),
  )
}

/// darkroom-note -- Small annotation like handwritten notes on a proof sheet
#let darkroom-note(body) = context {
  let pal = _active-palette.get()
  block(
    width: 100%,
    inset: (x: 0.8em, y: 0.5em),
    fill: pal.bg.lighten(3%),
    stroke: (left: 0.8pt + pal.secondary-dim),
  )[
    #set text(size: 11pt, fill: pal.secondary-text, style: "italic", font: _serif-font)
    #body
  ]
}

/// exposure-strip -- Horizontal gradient strip suggesting test exposure
#let exposure-strip(labels: ()) = context {
  let pal = _active-palette.get()
  let n = if labels.len() > 0 { labels.len() } else { 6 }
  block(width: 100%, inset: 0pt)[
    #grid(
      columns: range(n).map(_ => 1fr),
      column-gutter: 2pt,
      ..range(n).map(i => {
        let opacity = (i + 1) * (90 / n)
        block(
          width: 100%,
          height: 24pt,
          fill: pal.ink.transparentize(100% - opacity * 1%),
        )[
          #if labels.len() > i {
            place(bottom + center, dy: -6pt,
              text(size: 16pt, fill: if opacity > 50 { pal.bg } else { pal.ink-muted }, font: _mono-font, labels.at(i)))
          }
        ]
      })
    )
  ]
}

/// tray-card -- Card that looks like a chemical processing tray
#let tray-card(title, body, accent: auto) = context {
  let pal = _active-palette.get()
  let accent = if accent == auto { pal.accent } else { accent }
  block(
    width: 100%,
    fill: pal.surface,
    stroke: (bottom: 2pt + accent.transparentize(40%), rest: 0.3pt + pal.ink-faint),
    inset: (x: 1em, top: 0.8em, bottom: 0.7em),
  )[
    #stack(spacing: .8em,
      grid(columns: (auto, 1fr), column-gutter: 8pt, align: horizon,
        developer-drip(color: accent.transparentize(40%), width: 8pt, height: 28pt),
        text(size: typo.body, weight: "semibold", fill: pal.ink, title),
      ),
      {
        set text(size: 13pt, fill: pal.ink-dim, font: _sans-font)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// timer-badge -- Small badge showing processing time (like a darkroom timer)
#let timer-badge(time-str) = context {
  let pal = _active-palette.get()
  box(
    fill: pal.accent.transparentize(80%),
    inset: (x: 6pt, y: 3pt),
    radius: 2pt,
    stroke: 0.3pt + pal.accent-text,
  )[
    #text(size: 8pt, fill: pal.accent-text, font: _mono-font, weight: "bold", time-str)
  ]
}

/// developer-formula -- Compact processing formula with name, description, and time
#let developer-formula(name, body, time, accent: auto) = context {
  let pal = _active-palette.get()
  let accent = if accent == auto { pal.accent-text } else { accent }
  block(
    width: 100%,
    fill: pal.surface,
    inset: (x: 0.8em, y: 0.65em),
    stroke: (left: 1pt + accent),
  )[
    #stack(spacing: .8em,
      text(size: 9pt, fill: accent, font: _mono-font, weight: "bold", name),
      {
        set text(size: 11pt, fill: pal.ink-dim)
        body
      },
      timer-badge(time),
    )
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2.2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "medium")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 40pt, height: 1.5pt, fill: pal.accent),
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2.2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[DARKROOM]
    },
    text(fill: pal.accent-muted, size: 5pt)[#sym.circle.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2.5em, top: 0.45em, bottom: 0.1em))
    set std.align(left)
    stack(spacing: .8em,
      {
        set text(size: 7.5pt, fill: pal.meta-color, font: _mono-font)
        grid(
          columns: (1fr, 1fr),
          {
            if custom-left != none {
              custom-left
            } else if self.store.footer != none {
              utils.call-or-display(self, self.store.footer)
            }
          },
          {
            set std.align(right)
            if custom-right != none {
              custom-right
            } else {
              context [#utils.slide-counter.display() / #utils.last-slide-number]
            }
          },
        )
      },
      {
        set text(size: 1.2em, fill: pal.ink, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      block(width: 40pt, height: 1.5pt, fill: pal.accent),
    )
  }
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Standard content slide with faint contact sheet grid
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let setting(body) = {
    // Faint contact sheet grid background
    place(top + left,
      box(width: 100%, height: 100%,
        contactsheet-grid(color: pal.ink-faint, width: 100%, height: 100%),
      ),
    )
    // Small safelight glow top-right corner
    place(top + right, dx: -1.2em, dy: 0.3em,
      safelight-dot(color: pal.accent.transparentize(50%), size: 3pt),
    )
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deeper dark with safelight accents (for emphasis/mood)
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)

  let setting(body) = {
    // Subtle drip decoration on left edge
    place(top + left, dx: 8pt, dy: 30pt,
      developer-drip(color: pal.accent.transparentize(60%), width: 10pt, height: 50pt))
    // Safelight glows
    place(top + right, dx: -30pt, dy: 20pt,
      safelight-glow(color: pal.accent.transparentize(30%), size: 5pt))
    place(bottom + left, dx: 50pt, dy: -20pt,
      safelight-dot(color: pal.accent.transparentize(60%), size: 2.5pt))
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.surface,
      header: header,
      footer: none,
      margin: (top: 4em, bottom: 1.5em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Film-strip framed cover with aperture decoration
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Deep dark background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Contact sheet grid (very faint)
    place(top + left,
      box(width: 100%, height: 100%,
        contactsheet-grid(color: pal.ink.transparentize(92%), width: 100%, height: 100%),
      ),
    )

    // Film strip top edge
    place(top + left, dy: 0pt,
      filmstrip-decoration(color: pal.accent.transparentize(40%), width: 100%, height: 14pt),
    )

    // Film strip bottom edge
    place(bottom + left, dy: 0pt,
      filmstrip-decoration(color: pal.accent.transparentize(40%), width: 100%, height: 14pt),
    )

    // Aperture decoration -- upper right
    place(top + right, dx: -60pt, dy: 40pt,
      aperture-icon(color: pal.accent.transparentize(60%), size: 100pt),
    )

    // Developer drips -- left side atmosphere
    place(left + horizon, dx: 20pt, dy: -40pt,
      developer-drip(color: pal.accent.transparentize(55%), width: 10pt, height: 50pt))
    place(left + horizon, dx: 38pt, dy: 10pt,
      developer-drip(color: pal.secondary.transparentize(60%), width: 8pt, height: 35pt))

    // Safelight glow
    place(top + left, dx: 3em, dy: 2.5em,
      safelight-glow(color: pal.accent, size: 6pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      #stack(spacing: .8em,
        if info.institution != none { text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.accent-text,
          font: _mono-font,
          upper(info.institution),
        ) },
        text(size: typo.display, weight: "bold", fill: pal.ink, font: _serif-font, info.title),
        block(width: 180pt, height: 10pt)[
          #place(left + horizon, line(length: 70pt, stroke: 0.5pt + pal.accent))
          #place(center + horizon, circle(radius: 2pt, fill: pal.accent))
          #place(right + horizon, line(length: 70pt, stroke: 0.5pt + pal.accent))
        ],
        if info.subtitle != none { text(
          size: 18pt,
          weight: "regular",
          style: "italic",
          fill: pal.ink-dim,
          font: _serif-font,
          info.subtitle,
        ) },
        {
          set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font)
          if info.author != none {
            upper[#info.author]
          }
          if info.author != none and info.date != none {
            h(1.5em)
            text(fill: pal.accent, size: 5pt)[#sym.circle.filled]
            h(1.5em)
          }
          if info.date != none {
            utils.display-info-date(self)
          }
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Darkroom section divider with aperture number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Contact sheet background
    place(top + left,
      box(width: 100%, height: 100%,
        contactsheet-grid(color: pal.ink.transparentize(90%), width: 100%, height: 100%),
      ),
    )

    // Aperture icon with section number
    place(top + right, dx: -70pt, dy: 35pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        box(width: 110pt, height: 110pt)[
          #place(center + horizon, aperture-icon(color: pal.accent.transparentize(50%), size: 90pt))
          #place(center + horizon, text(fill: pal.accent, size: 36pt, weight: "bold", font: _mono-font, num-str))
        ]
      },
    )

    // Film frame number indicator (decorative)
    place(top + left, dx: 2.5em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font)[FRAME #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      } | EXP +1],
    )

    // Top accent line
    place(top + left, dx: 2.5em, dy: 2.8em,
      line(length: 60pt, stroke: 1pt + pal.accent))

    // Content
    pad(left: 3.5em, right: 9em, top: 4.5em, bottom: 2em)[
      #v(1fr)
      #stack(spacing: .8em,
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 1.5pt,
          fill: pal.accent-text,
          font: _mono-font,
        )[ROLL #context {
          let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
          num-str
        }],
        {
          set text(fill: pal.ink, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        block(width: 40pt, height: 1.5pt, fill: pal.accent),
      )
      #v(3fr)
    ]

    // Bottom film strip decoration
    place(bottom + left, dy: 0pt,
      filmstrip-decoration(color: pal.accent.transparentize(55%), width: 100%, height: 12pt))

    // Footer label
    place(bottom + right, dx: -2em, dy: -1.2em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[DARKROOM],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single bright statement in the void, safelight glow edges
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Safelight glows at edges
    place(top + left, dx: 15pt, dy: 15pt,
      safelight-glow(color: pal.accent, size: 4pt))
    place(top + right, dx: -25pt, dy: 20pt,
      safelight-dot(color: pal.accent, size: 3pt))
    place(bottom + right, dx: -20pt, dy: -15pt,
      safelight-glow(color: pal.accent, size: 4pt))
    place(bottom + left, dx: 30pt, dy: -25pt,
      safelight-dot(color: pal.accent.transparentize(40%), size: 2.5pt))

    // Corner film frame lines
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 30pt, stroke: 0.4pt + pal.accent-muted))
    place(top + left, dx: 0pt, dy: 0pt,
      line(length: 20pt, angle: 90deg, stroke: 0.4pt + pal.accent-muted))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 30pt, angle: 180deg, stroke: 0.4pt + pal.accent-muted))
    place(bottom + right, dx: 0pt, dy: 0pt,
      line(length: 20pt, angle: -90deg, stroke: 0.4pt + pal.accent-muted))

    set text(fill: pal.ink, size: 1.4em, weight: "regular", style: "italic", font: _serif-font)
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Farewell with clothespin and hanging photo feel
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Contact sheet grid (faint)
    place(top + left,
      box(width: 100%, height: 100%,
        contactsheet-grid(color: pal.ink.transparentize(93%), width: 100%, height: 100%),
      ),
    )

    // Ghost text (film stock code feel)
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost, font: _mono-font)[FIN],
    )

    // Clothesline across top
    place(top + left, dx: 10%, dy: 18%,
      line(length: 80%, stroke: 0.4pt + pal.ink-faint))

    // Clothespins on line
    place(top + left, dx: 25%, dy: 14%,
      clothespin-icon(color: pal.secondary.transparentize(30%), width: 10pt, height: 18pt))
    place(top + left, dx: 50%, dy: 14%,
      clothespin-icon(color: pal.secondary.transparentize(30%), width: 10pt, height: 18pt))
    place(top + left, dx: 75%, dy: 14%,
      clothespin-icon(color: pal.secondary.transparentize(30%), width: 10pt, height: 18pt))

    // Film strip top
    place(top + left, dy: 0pt,
      filmstrip-decoration(color: pal.accent.transparentize(50%), width: 100%, height: 12pt))

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em, top: 5em)[
      #stack(spacing: .8em,
        aperture-icon(color: pal.accent.transparentize(30%), size: 40pt),
        text(size: 2em, weight: "bold", fill: pal.ink, font: _serif-font, body),
        std.align(center, block(width: 140pt, height: 10pt)[
          #place(left + horizon, line(length: 55pt, stroke: 0.4pt + pal.accent))
          #place(center + horizon, circle(radius: 1.5pt, fill: pal.accent))
          #place(right + horizon, line(length: 55pt, stroke: 0.4pt + pal.accent))
        ]),
        text(size: 9pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[END OF ROLL],
      )
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let darkroom-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "safelight",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  _active-palette.update(pal)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      neutral-lightest: pal.bg,
      neutral-darkest: pal.ink,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
