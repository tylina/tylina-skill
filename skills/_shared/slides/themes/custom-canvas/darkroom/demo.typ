// Darkroom Theme Demo — Analog Photography & Film Craft
// Showcases all components and slide types with photography-themed content.

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: _sans-font, size: 20pt)

// Match inline Canvas styling to the selected theme preset.
#let pal = build-palette("safelight")

#show: darkroom-theme.with(
  aspect-ratio: "16-9",
  footer: [Silver & Light Studio],
  preset: "safelight",
  config-info(
    title: [The Craft of Silver Gelatin],
    subtitle: [A Darkroom Printing Workshop],
    author: [Helena Voss],
    date: datetime.today(),
    institution: [Analog Photography Collective],
  ),
  config-common(breakable: false),
)

#title-slide()

// =====================================================================
= The Medium
// =====================================================================

== Why Film Still Matters

#cols(columns: (3fr, 2fr))[
  #stack(spacing: .8em,
    proof-quote([Every photograph is a certificate of presence. The silver grain holds time in suspension, a physical record of light that once fell upon a surface.], cite: "Roland Barthes"),
    developer-tag[PHILOSOPHY],
    [Film photography is not nostalgia. It is a deliberate choice to engage with light as a physical medium -- each frame a unique chemical reaction, unrepeatable and irreversible.],
  )
][
  #stack(spacing: .8em,
    f-stop-stat([Active Film Shooters], [2.4M], description: [Worldwide, growing 12% annually]),
    contact-card([FR-01])[Ilford HP5+ sales increased 38% since 2019. Kodak restarted Ektachrome production in 2018.],
  )
]

#speaker-note[Open with the philosophical grounding. Barthes' concept of the photograph as trace/index. Emphasize materiality over digital abstraction.]

== The Silver Halide Process

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true)[
  #tray-card([Expose], [
    Light passes through lens and shutter. Silver halide crystals in the emulsion layer absorb photons, creating a latent image invisible to the eye.
  ])
][
  #tray-card([Develop], [
    Chemical developer reduces exposed silver halide to metallic silver. Temperature and agitation control contrast and grain structure.
  ], accent: pal.secondary)
][
  #tray-card([Fix], [
    Fixer dissolves unexposed silver halide, making the image permanent. Without fixing, the print would darken in light.
  ])
]

#speaker-note[Walk through the three essential chemical steps. Use the tray metaphor -- each tray in the darkroom corresponds to a processing stage.]

== Film Formats Compared

#stack(spacing: .8em,
  figure(chemical-table(
    ([Format], [Frame Size], [Resolution], [Character]),
    ([35mm], [24 x 36 mm], [~20 MP equiv], [Versatile, fine grain]),
    ([120 Medium], [60 x 60 mm], [~80 MP equiv], [Rich tonality]),
    ([4x5 Large], [102 x 127 mm], [~200 MP equiv], [Extraordinary detail]),
    ([8x10 Large], [203 x 254 mm], [~500 MP equiv], [Contact prints]),
  )),
  darkroom-note[Larger formats yield finer grain relative to print size, but demand slower, more deliberate shooting.],
)

#speaker-note[Compare film formats. Emphasize that resolution equivalents are approximate -- film has different characteristics than pixel grids.]

// =====================================================================
= The Darkroom
// =====================================================================

== Setting Up Your Space

#cols(columns: (2fr, 3fr))[
  #negative-panel(title: [Essential Equipment])[
    - Enlarger with multigrade head
    - Three processing trays (developer, stop, fix)
    - Safelight (OC amber or red)
    - Accurate thermometer
    - Grain focuser
    - Timer with audible beep
  ]
][
  #stack(spacing: .8em,
    [The darkroom is a place of quiet concentration. Temperature stability matters -- keep your chemistry at 20 degrees Celsius. The safelight provides just enough red glow to navigate without fogging paper.],
    film-divider(),
    stack(dir: ltr, spacing: 10pt,
      developer-tag[VENTILATION REQUIRED],
      developer-tag[LIGHT-TIGHT SEAL],
    ),
  )
]

#speaker-note[Practical setup guidance. Stress safety: ventilation for fixer fumes, proper safelight testing with coin test.]

== Exposure Test Strips

#stack(spacing: .8em,
  exposure-strip(labels: ([2s], [4s], [8s], [16s], [32s], [64s])),
  cols(columns: (1fr, 1fr),
    [#contact-card([TS-01])[
      *Purpose:* Determine correct base exposure before committing to a full print.

      Each strip receives progressively more light, revealing the tonal range of the negative.
    ]],
    [#contact-card([TS-02])[
      *Method:* Cover paper in strips, exposing each for a fixed increment.

      Evaluate under white light -- look for rich blacks and clean highlights.
    ]],
  ),
)

#speaker-note[Test strips are the most important darkroom discipline. Never waste paper on guesswork.]

// =====================================================================
= Printing Craft
// =====================================================================

== The Fine Print: Dodging & Burning

#dark-slide(title: [Dodging and Burning], header-left: [ADVANCED TECHNIQUE], header-right: [ROLL 03])[
  #cols(columns: (1fr, 1fr), gutter: 18pt,
    {
      set text(fill: pal.ink)
      stack(spacing: .8em,
        text(size: typo.small, weight: "bold", fill: pal.accent-text, font: _mono-font)[DODGE],
        text(size: 13pt, fill: pal.ink-dim)[Hold back light from areas that print too dark. Use wire-mounted cardboard shapes. Keep the tool moving to avoid hard edges.],
        f-stop-stat([Typical Hold-Back], [15-30%], description: [of base exposure time]),
      )
    },
    {
      set text(fill: pal.ink)
      stack(spacing: .8em,
        text(size: typo.small, weight: "bold", fill: pal.secondary-text, font: _mono-font)[BURN],
        text(size: 13pt, fill: pal.ink-dim)[Add extra exposure to areas that remain too light. Cup hands to direct light onto specific zones. Build up gradually.],
        f-stop-stat([Extra Exposure], [25-50%], description: [added in careful passes]),
      )
    },
  )
]

#speaker-note[Dodging and burning are the printer's most expressive tools. Ansel Adams said the negative is the score, the print is the performance.]

== Paper Selection Guide

#cols(columns: (2fr, 1fr))[
  #stack(spacing: .8em,
    figure(chemical-table(
      ([Paper], [Surface], [Weight], [Tone]),
      ([Ilford Multigrade], [Glossy / Pearl], [RC / FB], [Neutral]),
      ([Foma Fomatone], [Glossy], [FB], [Warm]),
      ([Adox MCC 110], [Glossy], [FB], [Neutral-Cold]),
      ([Kentmere VC Select], [Lustre], [RC], [Neutral]),
    )),
    darkroom-note[RC (resin-coated) papers process faster but FB (fiber-based) papers yield richer blacks and archival permanence.],
  )
][
  #exposure-card([Quick Reference])[
    *RC*: 2 min develop, 30s stop, 2 min fix. Air dry.

    *FB*: 3 min develop, 30s stop, 5 min fix. Wash 30+ minutes. Flatten overnight.
  ]
]

#speaker-note[Paper choice fundamentally affects the final print character. Warm-tone papers pair beautifully with sepia toning.]

== Zone System Visualization

#set text(size: 14pt)

#stack(spacing: .8em,
  grid(columns: (1fr,) * 5, column-gutter: 6pt,
    {
      block(width: 100%, fill: pal.bg, height: 44pt, inset: 4pt)[
        #set text(size: 12pt, fill: pal.ink, font: _mono-font)
        #place(bottom + center)[Zone 0]
      ]
    },
    {
      block(width: 100%, fill: pal.bg.lighten(15%), height: 44pt, inset: 4pt)[
        #set text(size: 12pt, fill: pal.ink, font: _mono-font)
        #place(bottom + center)[Zone II]
      ]
    },
    {
      block(width: 100%, fill: pal.ink.transparentize(55%), height: 44pt, inset: 4pt)[
        #set text(size: 12pt, fill: pal.ink, font: _mono-font)
        #place(bottom + center)[Zone V]
      ]
    },
    {
      block(width: 100%, fill: pal.ink.transparentize(25%), height: 44pt, inset: 4pt)[
        #set text(size: 12pt, fill: pal.bg, font: _mono-font)
        #place(bottom + center)[Zone VII]
      ]
    },
    {
      block(width: 100%, fill: pal.ink, height: 44pt, inset: 4pt)[
        #set text(size: 8pt, fill: pal.bg, font: _mono-font)
        #place(bottom + center)[Zone X]
      ]
    },
  ),
  proof-quote([Expose for the shadows, develop for the highlights. The Zone System is a bridge between visualization and realization.], cite: "Ansel Adams"),
  cols(columns: (1fr, 1fr),
    [#stack(spacing: .8em,
      developer-tag[N-1 DEVELOPMENT],
      [Reduced development compresses the tonal range. Use for high-contrast scenes (11+ stops of brightness).],
    )],
    [#stack(spacing: .8em,
      developer-tag[N+1 DEVELOPMENT],
      [Extended development expands the tonal range. Use for flat, overcast scenes needing more contrast.],
    )],
  ),
)

#speaker-note[The Zone System by Adams and Archer is the foundation of exposure control in film photography.]

// =====================================================================
= Chemistry
// =====================================================================

== Developer Formulations

#dark-slide(title: [Classic Developers], header-left: [CHEMISTRY LAB], header-right: [FORMULAE])[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 12pt)[
    #developer-formula([D-76], [Fine grain, full emulsion speed. The standard by which others are measured.], [8:30 \@ 20C], accent: pal.accent-text)
  ][
    #developer-formula([HC-110], [Liquid concentrate. Long shelf life. Dilution B is most popular for general use.], [6:00 \@ 20C], accent: pal.secondary-text)
  ][
    #developer-formula([RODINAL], [Stand development. Compensating. Acutance developer. Visible grain with character.], [60:00 \@ 20C], accent: pal.ink-muted)
  ]
]

#speaker-note[Cover the three most common film developers. D-76 for beginners, HC-110 for convenience, Rodinal for character.]

== Processing Temperatures

#cols(columns: (2fr, 1fr))[
  #figure[
    #chemical-table(
      ([Process], [Temp], [Time], [Agitation]),
      ([B\&W Develop], [20.0C], [6-12 min], [Initial 30s, then 5s/30s]),
      ([Stop Bath], [18-24C], [30 sec], [Continuous]),
      ([Fixer], [18-24C], [3-5 min], [Initial 30s, then 10s/60s]),
      ([Wash], [18-24C], [20 min], [Running water]),
      ([Photo-Flo], [18-24C], [30 sec], [Gentle single inversion]),
    )
  ]
][
  #tray-card([Critical Note], [
    Temperature consistency during development is essential. A 0.5 degree C shift can alter contrast by half a grade.

    Use a water bath jacket around your development tank.
  ], accent: pal.accent)
]

#speaker-note[Temperature precision is non-negotiable in film development. This separates consistent results from guesswork.]

// =====================================================================
= Masters of the Print
// =====================================================================

== Voices from the Darkroom

#cols(columns: (1fr, 1fr))[
  #stack(spacing: .8em,
    proof-quote([The negative is comparable to the composer's score and the print to its performance.], cite: "Ansel Adams"),
    proof-quote([To me, photography is the simultaneous recognition, in a fraction of a second, of the significance of an event.], cite: "Henri Cartier-Bresson"),
  )
][
  #stack(spacing: .8em,
    proof-quote([A photograph is a secret about a secret. The more it tells you, the less you know.], cite: "Diane Arbus"),
    proof-quote([It is more important to click with people than to click the shutter.], cite: "Alfred Eisenstaedt"),
  )
]

#speaker-note[Use master quotes to reinforce the philosophical dimension of analog photography. These are the voices that shaped the medium.]

== Legacy & Influence

#stack(spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 8pt,
    [#contact-card([01])[
      *Adams*

      Zone System. Pure landscape. Technical perfection.
    ]],
    [#contact-card([02])[
      *Arbus*

      Portraits of outsiders. Confrontational. Direct flash.
    ]],
    [#contact-card([03])[
      *Koudelka*

      Panoramic exile. Roma communities. Harsh contrast.
    ]],
    [#contact-card([04])[
      *Moriyama*

      Grainy. Blurred. Are, Bure, Boke. Tokyo streets.
    ]],
  ),
  film-divider(),
  darkroom-note[Each of these masters had a signature printing style -- Adams' luminous highlights, Moriyama's pushed grain, Koudelka's deep shadows.],
)

#speaker-note[Connect the technical to the artistic. Each photographer's printing choices were as distinctive as their eye for composition.]

// =====================================================================

#focus-slide[
  The darkroom is where the photographer becomes a printmaker. The negative is potential; the print is realization.
]

#speaker-note[Transitional moment. Pause here. Let the weight of this statement settle before moving to the final slide.]

#ending-slide[Thank You for Printing With Us]

#speaker-note[Close with warmth. Invite questions. Mention that handouts with chemical mixing charts are available.]
