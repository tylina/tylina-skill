// Vinyl Groove Theme -- Analog audio and vinyl record aesthetic
// Record grooves, tone arms, audio waveforms, spindle holes
// Warm brown-black backgrounds with orange label accents and deep purple
// 70s album cover art, record store atmosphere, analog warmth
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  vinyl: (
    bg: rgb("#1C1916"),
    ink: rgb("#F5E6D3"),
    accent: rgb("#E85D04"),
    accent-text: rgb("#FF8A4C"),
    secondary: rgb("#7B2CBF"),
    secondary-text: rgb("#D29BFF"),
    surface: rgb("#2A2420"),
  ),
  cassette: (
    bg: rgb("#1A1A1E"),
    ink: rgb("#EDE4D8"),
    accent: rgb("#D4A017"),
    accent-text: rgb("#E8C55D"),
    secondary: rgb("#8B4513"),
    secondary-text: rgb("#D9A681"),
    surface: rgb("#2C2826"),
  ),
  hi-fi: (
    bg: rgb("#0F0E0D"),
    ink: rgb("#E8DDD0"),
    accent: rgb("#FF3B30"),
    accent-text: rgb("#FF8078"),
    secondary: rgb("#00C7BE"),
    secondary-text: rgb("#5DEBE4"),
    surface: rgb("#1E1C1A"),
  ),
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
    // Derived from accent (the bold orange)
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(55%),
    accent-faint: accent.transparentize(78%),
    accent-ghost: accent.transparentize(93%),
    // Derived from secondary (deep purple)
    secondary-dim: secondary.transparentize(35%),
    secondary-muted: secondary.transparentize(55%),
    secondary-faint: secondary.transparentize(78%),
    // Surface variants
    surface-light: surface.lighten(8%),
    surface-dark: surface.darken(15%),
    // Meta
    meta-color: ink.transparentize(35%),
    rule-color: ink.transparentize(75%),
  )
}

// Default palette
#let palette = build-palette("vinyl")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 30pt,
  h2: 22pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 7.5pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = "DejaVu Sans Mono"

// =====================================================================
// SVG Definitions
// =====================================================================

// Vinyl grooves: concentric circles with slight wobble (bezier arcs, not perfect circles)
#let _grooves-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 400 400\"><path d=\"M 200 30 C 295 28 372 105 370 200 C 372 295 295 372 200 370 C 105 372 28 295 30 200 C 28 105 105 28 200 30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.5\"/><path d=\"M 200 55 C 280 53 347 120 345 200 C 347 280 280 347 200 345 C 120 347 53 280 55 200 C 53 120 120 53 200 55\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.35\" opacity=\"0.45\"/><path d=\"M 200 80 C 266 78 322 134 320 200 C 322 266 266 322 200 320 C 134 322 78 266 80 200 C 78 134 134 78 200 80\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.4\"/><path d=\"M 200 105 C 252 103 298 149 296 200 C 298 252 252 298 200 296 C 148 298 102 252 104 200 C 102 148 148 103 200 105\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.35\" opacity=\"0.35\"/><path d=\"M 200 130 C 239 128 273 162 271 200 C 273 239 239 273 200 271 C 161 273 127 239 129 200 C 127 161 161 128 200 130\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><path d=\"M 200 155 C 225 153 248 176 246 200 C 248 225 225 248 200 246 C 175 248 152 225 154 200 C 152 175 175 153 200 155\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.35\" opacity=\"0.25\"/><path d=\"M 200 175 C 214 174 227 186 226 200 C 227 214 214 227 200 226 C 186 227 173 214 174 200 C 173 186 186 174 200 175\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><circle cx=\"200\" cy=\"200\" r=\"8\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.6\"/><circle cx=\"200\" cy=\"200\" r=\"3\" fill=\"currentColor\" opacity=\"0.4\"/></svg>"

// Tone arm: angular line with pivot point and headshell
#let _tonearm-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 200 200\"><circle cx=\"175\" cy=\"30\" r=\"6\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.2\" opacity=\"0.6\"/><circle cx=\"175\" cy=\"30\" r=\"2\" fill=\"currentColor\" opacity=\"0.5\"/><line x1=\"175\" y1=\"30\" x2=\"80\" y2=\"130\" stroke=\"currentColor\" stroke-width=\"1.5\" opacity=\"0.7\"/><line x1=\"80\" y1=\"130\" x2=\"55\" y2=\"155\" stroke=\"currentColor\" stroke-width=\"2\" opacity=\"0.8\"/><path d=\"M 55 155 L 45 165 L 42 162 L 52 152 Z\" fill=\"currentColor\" opacity=\"0.7\"/><circle cx=\"45\" cy=\"165\" r=\"2.5\" fill=\"currentColor\" opacity=\"0.5\"/></svg>"

// Sound wave: audio waveform bars at varying heights
#let _waveform-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 300 80\"><rect x=\"5\" y=\"30\" width=\"4\" height=\"20\" rx=\"2\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"14\" y=\"22\" width=\"4\" height=\"36\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"23\" y=\"15\" width=\"4\" height=\"50\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"32\" y=\"10\" width=\"4\" height=\"60\" rx=\"2\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"41\" y=\"18\" width=\"4\" height=\"44\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"50\" y=\"25\" width=\"4\" height=\"30\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"59\" y=\"12\" width=\"4\" height=\"56\" rx=\"2\" fill=\"currentColor\" opacity=\"0.85\"/><rect x=\"68\" y=\"5\" width=\"4\" height=\"70\" rx=\"2\" fill=\"currentColor\" opacity=\"0.95\"/><rect x=\"77\" y=\"15\" width=\"4\" height=\"50\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"86\" y=\"28\" width=\"4\" height=\"24\" rx=\"2\" fill=\"currentColor\" opacity=\"0.65\"/><rect x=\"95\" y=\"20\" width=\"4\" height=\"40\" rx=\"2\" fill=\"currentColor\" opacity=\"0.75\"/><rect x=\"104\" y=\"8\" width=\"4\" height=\"64\" rx=\"2\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"113\" y=\"18\" width=\"4\" height=\"44\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"122\" y=\"30\" width=\"4\" height=\"20\" rx=\"2\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"131\" y=\"22\" width=\"4\" height=\"36\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"140\" y=\"12\" width=\"4\" height=\"56\" rx=\"2\" fill=\"currentColor\" opacity=\"0.85\"/><rect x=\"149\" y=\"6\" width=\"4\" height=\"68\" rx=\"2\" fill=\"currentColor\" opacity=\"0.95\"/><rect x=\"158\" y=\"15\" width=\"4\" height=\"50\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"167\" y=\"25\" width=\"4\" height=\"30\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"176\" y=\"18\" width=\"4\" height=\"44\" rx=\"2\" fill=\"currentColor\" opacity=\"0.75\"/><rect x=\"185\" y=\"10\" width=\"4\" height=\"60\" rx=\"2\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"194\" y=\"20\" width=\"4\" height=\"40\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"203\" y=\"28\" width=\"4\" height=\"24\" rx=\"2\" fill=\"currentColor\" opacity=\"0.65\"/><rect x=\"212\" y=\"15\" width=\"4\" height=\"50\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"221\" y=\"8\" width=\"4\" height=\"64\" rx=\"2\" fill=\"currentColor\" opacity=\"0.9\"/><rect x=\"230\" y=\"22\" width=\"4\" height=\"36\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"239\" y=\"30\" width=\"4\" height=\"20\" rx=\"2\" fill=\"currentColor\" opacity=\"0.6\"/><rect x=\"248\" y=\"18\" width=\"4\" height=\"44\" rx=\"2\" fill=\"currentColor\" opacity=\"0.8\"/><rect x=\"257\" y=\"12\" width=\"4\" height=\"56\" rx=\"2\" fill=\"currentColor\" opacity=\"0.85\"/><rect x=\"266\" y=\"25\" width=\"4\" height=\"30\" rx=\"2\" fill=\"currentColor\" opacity=\"0.7\"/><rect x=\"275\" y=\"20\" width=\"4\" height=\"40\" rx=\"2\" fill=\"currentColor\" opacity=\"0.75\"/><rect x=\"284\" y=\"30\" width=\"4\" height=\"20\" rx=\"2\" fill=\"currentColor\" opacity=\"0.6\"/></svg>"

// Spindle hole: concentric circles (center label of a record)
#let _spindle-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 100 100\"><circle cx=\"50\" cy=\"50\" r=\"45\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.4\"/><circle cx=\"50\" cy=\"50\" r=\"38\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.35\"/><circle cx=\"50\" cy=\"50\" r=\"30\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><circle cx=\"50\" cy=\"50\" r=\"22\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.4\"/><circle cx=\"50\" cy=\"50\" r=\"14\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.6\"/><circle cx=\"50\" cy=\"50\" r=\"5\" fill=\"currentColor\" opacity=\"0.3\"/><circle cx=\"50\" cy=\"50\" r=\"2\" fill=\"currentColor\" opacity=\"0.7\"/></svg>"

// Musical note: eighth note silhouette
#let _note-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 60 80\"><ellipse cx=\"22\" cy=\"65\" rx=\"12\" ry=\"9\" fill=\"currentColor\" opacity=\"0.85\" transform=\"rotate(-15 22 65)\"/><line x1=\"33\" y1=\"60\" x2=\"33\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"2.5\" opacity=\"0.9\"/><path d=\"M 33 12 C 33 12 50 18 50 30 C 50 38 42 36 38 32\" fill=\"currentColor\" opacity=\"0.8\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let vinyl-grooves(color: none, width: 400pt, height: 400pt, pal: palette) = {
  let groove-color = if color == none { pal.ink-faint } else { color }
  let svg = _grooves-svg.replace("currentColor", groove-color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let tone-arm(color: none, width: 160pt, height: 160pt, pal: palette) = {
  let arm-color = if color == none { pal.ink-muted } else { color }
  let svg = _tonearm-svg.replace("currentColor", arm-color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let waveform(color: none, width: 260pt, height: 60pt, pal: palette) = {
  let wave-color = if color == none { pal.accent } else { color }
  let svg = _waveform-svg.replace("currentColor", wave-color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let spindle-hole(color: none, size: 60pt, pal: palette) = {
  let spindle-color = if color == none { pal.accent } else { color }
  let svg = _spindle-svg.replace("currentColor", spindle-color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let music-note(color: none, size: 24pt, pal: palette) = {
  let note-color = if color == none { pal.accent } else { color }
  let svg = _note-svg.replace("currentColor", note-color.to-hex())
  image(bytes(svg), width: size * 0.75, height: size)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// groove-dot -- Small dot like a dust particle on vinyl
#let groove-dot(color: none, size: 3pt, pal: palette) = {
  let dot-color = if color == none { pal.accent } else { color }
  box(circle(radius: size / 2, fill: dot-color))
}

// =====================================================================
// Reusable Components
// =====================================================================

/// sleeve-card -- Warm cream card on dark background (like a record sleeve)
#let sleeve-card(title, body, accent: none, text-accent: none, pal: palette) = {
  let accent-color = if accent == none { pal.accent } else { accent }
  let label-color = if text-accent != none {
    text-accent
  } else if accent == none {
    pal.accent-text
  } else {
    pal.ink-dim
  }
  block(
    width: 100%,
    fill: pal.surface,
    stroke: (left: 3pt + accent-color),
    inset: (x: 1.2em, top: 1em, bottom: 0.8em),
  )[
    #stack(spacing: .8em,
      [#text(
        size: typo.small,
        weight: "bold",
        tracking: 0.8pt,
        fill: label-color,
        upper(title),
      )],
      [#set text(size: 14pt, fill: pal.ink-dim)
       #body
       #lazy-v(1fr)],
    )
  ]
}

/// rpm-stat -- Big number display (like BPM/RPM readout on equipment)
#let rpm-stat(
  label,
  value,
  unit: none,
  value-size: 48pt,
  unit-size: 14pt,
  accent: none,
  text-accent: none,
  pal: palette,
) = {
  let accent-color = if accent == none { pal.accent } else { accent }
  let label-color = if text-accent != none {
    text-accent
  } else if accent == none {
    pal.accent-text
  } else {
    pal.ink-dim
  }
  block(width: 100%, inset: (x: 0.8em, y: 0.6em))[
    #stack(spacing: .8em,
      [#text(
        size: typo.meta,
        weight: "medium",
        tracking: 1.5pt,
        fill: label-color,
        font: _mono-font,
        upper(label),
      )],
      [#if unit == none {
        text(size: value-size, weight: "bold", fill: pal.ink, value)
      } else {
        grid(
          columns: (auto, 1fr),
          column-gutter: 4pt,
          align: bottom,
          text(size: value-size, weight: "bold", fill: pal.ink, value),
          text(size: unit-size, weight: "medium", fill: pal.ink-muted, unit),
        )
      }],
      [#block(width: 40pt, height: 2pt, fill: accent-color)
       #lazy-v(1fr)],
    )
  ]
}

/// groove-divider -- Thin concentric arc lines as a section separator
#let groove-divider(width: 100%, color: none, pal: palette) = {
  let rule-color = if color == none { pal.ink-faint } else { color }
  block(width: width, height: 18pt)[
    #place(left + horizon, dy: -4pt,
      line(length: 100%, stroke: 0.3pt + rule-color))
    #place(left + horizon,
      line(length: 100%, stroke: 0.5pt + rule-color))
    #place(left + horizon, dy: 4pt,
      line(length: 100%, stroke: 0.3pt + rule-color))
    #place(left + horizon, dx: 45%, dy: 0pt,
      circle(radius: 2pt, fill: pal.accent))
  ]
}

/// label-tag -- Small rounded tag like a record sticker/label
#let label-tag(body, color: none, text-color: none, pal: palette) = {
  let tag-color = if color == none { pal.accent } else { color }
  let tag-ink = if text-color != none {
    text-color
  } else if color == none {
    pal.bg
  } else {
    pal.ink
  }
  box(
    fill: tag-color,
    inset: (x: 8pt, y: 3pt),
    radius: 10pt,
  )[
    #text(size: typo.tiny, fill: tag-ink, weight: "bold", font: _mono-font, upper(body))
  ]
}

/// liner-quote -- Styled like liner notes typography in album sleeves
#let liner-quote(body, credit: none, pal: palette) = {
  block(
    width: 100%,
    inset: (left: 1.4em, right: 1em, y: 0.8em),
    stroke: (left: 2pt + pal.accent),
  )[
    #if credit == none {
      text(size: typo.body, style: "italic", fill: pal.ink, body)
    } else {
      stack(spacing: .8em,
        text(size: typo.body, style: "italic", fill: pal.ink, body),
        text(
          size: typo.meta,
          weight: "medium",
          tracking: 1.2pt,
          fill: pal.meta-color,
          font: _mono-font,
          [-- #upper(credit)],
        ),
      )
    }
  ]
}

/// track-panel -- A panel resembling a track listing on album back cover
#let track-panel(title, tracks, pal: palette) = {
  let track-rows = tracks.enumerate().map(((i, track)) => grid(
    columns: (auto, 1fr, auto),
    column-gutter: 8pt,
    align: horizon,
    text(fill: pal.accent-text, weight: "bold")[#str(i + 1).],
    track.at(0),
    text(fill: pal.ink-muted, size: 10pt)[#track.at(1)],
  ))
  block(
    width: 100%,
    fill: pal.surface,
    inset: (x: 1em, top: 0.8em, bottom: 0.6em),
    stroke: 0.5pt + pal.ink-faint,
  )[
    #stack(spacing: .8em,
      [// Panel header
       #stack(dir: ltr, spacing: 8pt,
         block(width: 3pt, height: 12pt, fill: pal.accent),
         text(size: typo.small, weight: "bold", tracking: 1pt, fill: pal.accent-text, font: _mono-font, upper(title)),
       )],
      [// Track list
       #set text(size: 11pt, fill: pal.ink-dim, font: _mono-font)
       #stack(spacing: .8em, ..track-rows)
       #lazy-v(1fr)],
    )
  ]
}

/// vinyl-table -- Data table styled like equipment specs or mixing console readout
#let vinyl-table(align: center + horizon, columns: none, pal: palette, headers, ..rows) = {
  let table-columns = if columns == none { headers.len() * (1fr,) } else { columns }
  table(
    columns: table-columns,
    fill: (_, row) => if row == 0 { pal.surface-dark },
    stroke: 0.5pt + pal.ink-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: pal.accent-text, size: 9pt, tracking: 1pt, font: _mono-font, upper(h)))),
    ..rows.pos().flatten().map(c => text(fill: pal.ink-dim, size: 11pt, font: _mono-font, c)),
  )
}

/// channel-meter -- VU meter style indicator bar
#let channel-meter(label, level, max-level: 10, accent: none, pal: palette) = {
  let meter-accent = if accent == none { pal.accent } else { accent }
  block(width: 100%, inset: (y: 0.1em))[
    #grid(columns: (60pt, 1fr), column-gutter: 8pt, align: horizon,
      text(size: 9pt, fill: pal.ink-muted, font: _mono-font, weight: "medium", upper(label)),
      {
        let bars = range(max-level).map(i => {
          let is-active = i < level
          let bar-color = if is-active {
            if i >= max-level - 2 { rgb("#FF3B30") }
            else if i >= max-level - 4 { meter-accent }
            else { pal.secondary }
          } else {
            pal.ink-ghost
          }
          block(width: 100%, height: 9pt, fill: bar-color, radius: 1pt)
        })
        grid(columns: range(max-level).map(_ => 1fr), column-gutter: 2pt, ..bars)
      },
    )
  ]
}

/// eq-band -- Equalizer band display
#let eq-band(freq, db, accent: none, pal: palette) = {
  let band-accent = if accent == none { pal.accent } else { accent }
  block(width: 100%, inset: (x: 0.3em, y: 0.3em))[
    #set std.align(center)
    #stack(spacing: .8em,
      [#text(size: 22pt, weight: "bold", fill: pal.ink, db)],
      [#block(width: 100%, height: 2pt, fill: band-accent)],
      [#text(size: 8pt, fill: pal.ink-muted, font: _mono-font, freq)
       #lazy-v(1fr)],
    )
  ]
}

/// album-card -- Card styled like a mini album cover reference
#let album-card(artist, title, year: none, accent: none, text-accent: none, pal: palette) = {
  let accent-color = if accent == none { pal.accent } else { accent }
  let artist-color = if text-accent != none {
    text-accent
  } else if accent == none {
    pal.accent-text
  } else {
    pal.ink-dim
  }
  block(
    width: 100%,
    fill: pal.surface,
    stroke: (bottom: 2pt + accent-color),
    inset: (x: 1em, y: 0.8em),
  )[
    #stack(spacing: .8em,
      if year != none {
        text(size: typo.meta, fill: pal.ink-muted, font: _mono-font, tracking: 1pt, year)
      },
      text(size: typo.body, weight: "bold", fill: pal.ink, title),
      text(size: typo.small, fill: artist-color, weight: "medium", artist),
      lazy-v(1fr),
    )
  ]
}

/// spectrum-bar -- Full-width decorative audio spectrum bar
#let spectrum-bar(color: none, height: 4pt, pal: palette) = {
  let spectrum-color = if color == none { pal.accent } else { color }
  block(width: 100%, height: height + 4pt)[
    #place(left + horizon,
      block(width: 100%, height: height, fill: gradient.linear(
        spectrum-color.transparentize(80%),
        spectrum-color,
        spectrum-color.transparentize(30%),
        spectrum-color,
        spectrum-color.transparentize(80%),
      )))
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    stack(dir: ltr, spacing: 0pt,
      block(width: 40pt, height: 2pt, fill: pal.accent),
      block(width: 20pt, height: 2pt, fill: pal.secondary-muted),
    ),
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.8pt)
      if self.store.footer != none {
        upper(utils.call-or-display(self, self.store.footer))
      } else {
        [VINYL GROOVE]
      }
    },
    {
      stack(dir: ltr, spacing: 4pt,
        groove-dot(color: pal.accent, size: 3pt),
        groove-dot(color: pal.secondary-muted, size: 2pt),
      )
    },
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.8pt)
      if self.store.footer != none {
        upper(utils.call-or-display(self, self.store.footer))
      } else {
        [VINYL GROOVE]
      }
    },
    groove-dot(color: pal.accent-muted, size: 3pt),
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Warm dark background, subtle grooves texture, orange accents
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
    // Subtle groove arcs in bottom-right corner
    place(bottom + right, dx: 40pt, dy: 40pt,
      vinyl-grooves(color: pal.ink-ghost, width: 200pt, height: 200pt, pal: pal),
    )
    // Small note decoration
    place(top + right, dx: -1.8em, dy: 0.3em,
      music-note(color: pal.accent-faint, size: 16pt, pal: pal),
    )
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Deeper dark with waveform decorations
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

  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
    set std.align(horizon)
    grid(
      columns: (1fr, 2fr, 1fr),
      {
        set text(size: 8pt, fill: pal.meta-color, font: _mono-font)
        if header-left != none {
          header-left
        } else if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(center)
        if self.store.title != none {
          set text(size: 13pt, weight: "bold", fill: pal.ink)
          utils.call-or-display(self, self.store.title)
        }
      },
      {
        set std.align(right)
        set text(size: 8pt, fill: pal.meta-color, font: _mono-font)
        if header-right != none {
          header-right
        } else {
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        }
      },
    )
  }
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Waveform decoration at bottom
    place(bottom + left, dx: -10pt, dy: -34pt,
      waveform(color: pal.accent.transparentize(75%), width: 280pt, height: 30pt, pal: pal),
    )
    // Scattered groove dots
    place(top + right, dx: -50pt, dy: 30pt, groove-dot(color: pal.ink.transparentize(70%), size: 2pt))
    place(top + right, dx: -90pt, dy: 45pt, groove-dot(color: pal.accent.transparentize(50%), size: 3pt))
    place(bottom + left, dx: 60pt, dy: -50pt, groove-dot(color: pal.ink.transparentize(65%), size: 2pt))
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.surface-dark,
      header: header,
      footer: footer,
      margin: (top: 2.5em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Hero vinyl grooves pattern, bold orange title, album cover composition
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Deep vinyl background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // HERO: Large vinyl grooves pattern - centered but offset
    place(center + horizon, dx: 120pt, dy: -20pt,
      vinyl-grooves(color: pal.ink-faint, width: 380pt, height: 380pt, pal: pal),
    )

    // Tone arm reaching toward the record
    place(top + right, dx: -20pt, dy: 10pt,
      tone-arm(color: pal.ink-muted, width: 180pt, height: 180pt, pal: pal),
    )

    // Waveform at bottom
    place(bottom + left, dx: 2em, dy: -3em,
      waveform(color: pal.accent.transparentize(50%), width: 220pt, height: 35pt, pal: pal),
    )

    // Spindle decoration (small, top-left)
    place(top + left, dx: 2em, dy: 1.5em,
      spindle-hole(color: pal.secondary-muted, size: 40pt, pal: pal),
    )

    // Asymmetric editorial composition: title block left-aligned
    set std.align(left + horizon)
    pad(left: 3.5em, right: 14em, top: 4em, bottom: 3em)[
      #stack(spacing: .8em,
        if info.institution != none {
          label-tag(info.institution, pal: pal)
        },
        text(size: typo.display, weight: "bold", fill: pal.ink, info.title),
        stack(dir: ltr, spacing: 0pt,
          block(width: 60pt, height: 3pt, fill: pal.accent),
          block(width: 30pt, height: 3pt, fill: pal.secondary-dim),
        ),
        if info.subtitle != none {
          text(size: 18pt, weight: "regular", fill: pal.ink-dim, info.subtitle)
        },
        {
          set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font, tracking: 0.8pt)
          if info.author != none {
            upper[#info.author]
          }
          if info.author != none and info.date != none {
            h(1.5em)
            text(fill: pal.accent)[|]
            h(1.5em)
          }
          if info.date != none {
            utils.display-info-date(self)
          }
        },
      )
    ]

    // Corner accent marks
    place(bottom + right, dx: -2em, dy: -1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font, tracking: 1.5pt)[33 RPM],
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Big section number with grooves background, editorial layout
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Grooves pattern background (right side)
    place(right + horizon, dx: -30pt,
      vinyl-grooves(color: pal.ink-ghost, width: 280pt, height: 280pt, pal: pal),
    )

    // Large ghost section number (like a side number on vinyl)
    place(top + right, dx: -60pt, dy: 20pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.ink-ghost, size: 140pt, weight: "bold", font: _mono-font, num-str)
      },
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 2.5em,
      block(width: 50pt, height: 3pt, fill: pal.accent))

    // Decorative label
    place(top + left, dx: 3em, dy: 1.2em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font, tracking: 1.5pt)[SIDE],
    )

    // Content: left-aligned
    pad(left: 3.5em, right: 12em, top: 5em, bottom: 2em)[
      #v(1fr)
      #stack(spacing: .8em,
        {
          set text(size: typo.meta, weight: "medium", tracking: 1.5pt, fill: pal.accent-text, font: _mono-font)
          [TRACK #context {
            let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
            num-str
          }]
        },
        {
          set text(fill: pal.ink, size: 2.4em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        stack(dir: ltr, spacing: 0pt,
          block(width: 50pt, height: 2pt, fill: pal.accent),
          block(width: 25pt, height: 2pt, fill: pal.secondary-dim),
        ),
      )
      #v(3fr)
    ]

    // Bottom label
    place(bottom + left, dx: 3.5em, dy: -1.5em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font, tracking: 1pt)[VINYL GROOVE],
    )

    // Note decoration
    place(bottom + right, dx: -3em, dy: -2em,
      music-note(color: pal.accent-muted, size: 20pt, pal: pal),
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Bold statement on dark vinyl, with waveform decoration
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.surface-dark,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Waveform at top
    place(top + center, dy: 10pt,
      waveform(color: pal.accent.transparentize(60%), width: 280pt, height: 40pt, pal: pal),
    )

    // Grooves ghost in background
    place(center + horizon,
      vinyl-grooves(color: pal.ink-ghost, width: 300pt, height: 300pt, pal: pal),
    )

    // Corner accents (bracket style)
    place(top + left, dx: 0pt, dy: 0pt,
      stack(spacing: 0pt,
        block(width: 35pt, height: 2pt, fill: pal.accent),
        block(width: 2pt, height: 25pt, fill: pal.accent),
      ))
    place(bottom + right, dx: 0pt, dy: 0pt, {
      set std.align(right)
      stack(spacing: 0pt,
        std.align(right, block(width: 2pt, height: 25pt, fill: pal.accent)),
        block(width: 35pt, height: 2pt, fill: pal.accent),
      )
    })

    set text(fill: pal.ink, size: 1.6em, weight: "regular")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1.5em))[
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Fading grooves, "Drop the needle" farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Large hero grooves - atmospheric, slightly off-center
    place(center + horizon, dx: -80pt, dy: 10pt,
      vinyl-grooves(color: pal.ink-faint, width: 360pt, height: 360pt, pal: pal),
    )

    // Tone arm reaching in from right
    place(top + right, dx: -10pt, dy: 20pt,
      tone-arm(color: pal.ink-muted, width: 150pt, height: 150pt, pal: pal),
    )

    // Ghost text
    place(center + horizon, dy: -60pt,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost)[ANALOG],
    )

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(spacing: .8em,
        std.align(center, spindle-hole(color: pal.accent, size: 36pt, pal: pal)),
        text(size: 2em, weight: "bold", fill: pal.ink, body),
        std.align(center, stack(dir: ltr, spacing: 0pt,
          block(width: 40pt, height: 2pt, fill: pal.accent),
          block(width: 20pt, height: 2pt, fill: pal.secondary-dim),
        )),
        text(size: 9pt, fill: pal.meta-color, font: _mono-font, tracking: 2pt)[DROP THE NEEDLE],
      )
    ]

    // Bottom waveform
    place(bottom + center, dy: -2em,
      waveform(color: pal.accent.transparentize(70%), width: 200pt, height: 25pt, pal: pal),
    )
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let vinyl-groove-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "vinyl",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
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
