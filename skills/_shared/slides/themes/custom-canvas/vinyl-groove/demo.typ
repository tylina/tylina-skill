// Vinyl Groove Theme -- Demo Presentation
// Music production, analog audio, creative technology content
// Showcases all components and slide types

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#let pal = build-palette("vinyl")

#show: vinyl-groove-theme.with(
  aspect-ratio: "16-9",
  footer: [Analog Audio Co.],
  preset: "vinyl",
  config-info(
    title: [The Analog Renaissance],
    subtitle: [Why Vinyl Still Matters in the Digital Age],
    author: [Studio Sessions],
    date: datetime.today(),
    institution: [Analog Audio Co.],
  ),
  config-common(breakable: false),
)

#set text(font: ("Avenir Next", "Arial Unicode MS"), size: 16pt)

// ====================================================================
// Title Slide
// ====================================================================

#title-slide()

#speaker-note[Welcome to this exploration of analog audio's resurgence. We'll cover the technical, cultural, and economic aspects of vinyl's comeback.]

// ====================================================================
// Section 1: The Vinyl Revival
// ====================================================================

= The Vinyl Revival

#speaker-note[Introduce the first side of the presentation: the market forces and listening habits behind vinyl's return.]

== Market Growth

#cols(columns: (3fr, 2fr))[
  #stack(spacing: .8em,
    [The vinyl record market has seen unprecedented growth over the past decade, defying predictions about the death of physical media.],
    sleeve-card(
      [Key Insight],
      [Vinyl revenue surpassed CD revenue for the first time in 2020, marking a cultural inflection point in music consumption.],
      pal: pal,
    ),
    liner-quote(
      [Music isn't just heard -- it's experienced. Vinyl gives you something to hold.],
      credit: "Rick Rubin",
      pal: pal,
    ),
  )
][
  #stack(spacing: .8em,
    rpm-stat([Annual Revenue], [\$1.2B], unit: [USD], pal: pal),
    rpm-stat(
      [Growth Rate],
      [+22\%],
      unit: [YoY],
      accent: pal.secondary,
      text-accent: pal.secondary-text,
      pal: pal,
    ),
  )
]

#speaker-note[Vinyl revenue crossed the billion-dollar mark globally. This isn't nostalgia alone — it's a deliberate consumer choice for quality and tangibility.]

== Revenue by Format

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
    rpm-stat([Vinyl], [41\%], unit: [share], pal: pal),
    rpm-stat(
      [Streaming], [34\%], unit: [share], accent: pal.secondary,
      text-accent: pal.secondary-text, pal: pal,
    ),
    rpm-stat(
      [CD], [15\%], unit: [share], accent: pal.ink-muted,
      text-accent: pal.ink-dim, pal: pal,
    ),
    rpm-stat(
      [Digital DL], [10\%], unit: [share], accent: pal.ink-faint,
      text-accent: pal.ink-dim, pal: pal,
    ),
  ),
  groove-divider(pal: pal),
  cols(columns: (1fr, 1fr), column-gutter: 16pt,
    sleeve-card([Demographics], [
      - 18-34 age group: fastest growing segment
      - Average collector owns 28 records
      - 67\% also subscribe to streaming services
    ], pal: pal),
    sleeve-card([Top Genres], [
      - Rock / Classic Rock: 32\%
      - Pop / Indie: 24\%
      - Hip-Hop / R\&B: 18\%
      - Jazz / Soul: 14\%
    ], accent: pal.secondary, text-accent: pal.secondary-text, pal: pal),
  ),
)

#speaker-note[Physical formats still hold significant market share. Vinyl leads among collectors while streaming dominates casual listening.]

// ====================================================================
// Section 2: The Science of Sound
// ====================================================================

= The Science of Sound

#speaker-note[Shift from market context to the signal chain, comparing analog behavior with digital measurement.]

== Analog vs Digital Waveforms

#dark-slide(title: [Analog vs Digital], header-left: [TECHNICAL BRIEF], header-right: [SECTION 02])[
  #cols(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      stack(spacing: .8em,
        text(size: typo.small, weight: "bold", tracking: 1pt, fill: pal.accent-text, font: _mono-font)[ANALOG SIGNAL],
        sleeve-card([Characteristics], [
          - Continuous waveform representation
          - Infinite resolution within bandwidth
          - Natural harmonic distortion profile
          - Dynamic range: 55-70 dB typical
        ], pal: pal),
      )
    },
    {
      stack(spacing: .8em,
        text(size: typo.small, weight: "bold", tracking: 1pt, fill: pal.secondary-text, font: _mono-font)[DIGITAL SIGNAL],
        sleeve-card([Characteristics], [
          - Discrete sample points (44.1/96/192 kHz)
          - Bit depth defines resolution (16/24-bit)
          - Mathematically perfect reproduction
          - Dynamic range: 96-144 dB
        ], accent: pal.secondary, text-accent: pal.secondary-text, pal: pal),
      )
    },
  )
]

#speaker-note[The analog vs digital debate isn't about which is better — it's about which characteristics listeners value. Analog warmth comes from harmonic distortion.]

== Audio Specifications

#stack(spacing: .8em,
  figure[
    #vinyl-table(
      ([Parameter], [Vinyl LP], [CD], [Hi-Res Digital]),
      ([44.1kHz], [N/A], [16-bit], [24-bit]),
      ([Frequency], [20-20kHz], [20-20kHz], [20-48kHz]),
      ([Dynamic Range], [55-70 dB], [96 dB], [144 dB]),
      ([THD], [0.5-2\%], [0.003\%], [0.001\%]),
      ([Channel Sep.], [25-30 dB], [90 dB], [110 dB]),
      pal: pal,
    )
  ],
  stack(dir: ltr, spacing: 6pt,
    label-tag([NOTE], pal: pal),
    text(size: 12pt, fill: pal.ink-muted)[Vinyl specs vary widely by pressing quality and playback equipment],
  ),
)

#speaker-note[These specifications tell part of the story. Vinyl's measured specs are inferior, but subjective listening tests often favor the analog signal chain.]

== Channel Levels

#stack(spacing: .8em,
  text(size: typo.small, weight: "bold", tracking: 1pt, fill: pal.accent-text, font: _mono-font)[MIXING CONSOLE OUTPUT],
  stack(spacing: .8em,
    channel-meter([KICK], 7, pal: pal),
    channel-meter([SNARE], 6, pal: pal),
    channel-meter([BASS], 8, pal: pal),
    channel-meter([GUITAR L], 5, pal: pal),
    channel-meter([GUITAR R], 5, pal: pal),
    channel-meter([VOCALS], 9, pal: pal),
    channel-meter([SYNTH], 4, pal: pal),
    channel-meter([MASTER], 8, pal: pal),
  ),
  text(size: 9pt, fill: pal.ink-muted, font: _mono-font)[Peak levels shown at 0 dBVU reference | Session: "Midnight Sun" tracking date 2024-03-15],
)

#speaker-note[VU meters show the energy distribution across tracks during a mixing session. The vocal channel runs hot, typical of lead vocal-forward mixes.]

// ====================================================================
// Section 3: Record Production
// ====================================================================

= Record Production

#speaker-note[Move behind the scenes to follow audio from the mastered signal through cutting, plating, pressing, and shipping.]

== The Cutting Process

#cols(columns: (2fr, 3fr))[
  #stack(spacing: .8em,
    label-tag([MASTERING], pal: pal),
    text(size: 14pt, weight: "bold", fill: pal.ink)[From Master to Groove],
    text(size: 12pt, fill: pal.ink-dim)[
      The lacquer cutting process translates electrical audio signals into physical grooves on a rotating disc.
    ],
    groove-divider(width: 80%, pal: pal),
    text(size: 11pt, fill: pal.ink-muted, font: _mono-font)[
      Cutting speed: 33 1/3 RPM\
      Groove pitch: 100-300 lines/inch\
      Cutting angle: 15 degrees
    ],
  )
][
  #track-panel([Production Pipeline], (
    ([Master tape review], [2-4 hrs]),
    ([EQ and limiting], [1-2 hrs]),
    ([Lacquer cutting], [Real-time]),
    ([Quality inspection], [30 min]),
    ([Electroplating], [24 hrs]),
    ([Stamper creation], [4 hrs]),
    ([Test pressing], [48 hrs]),
    ([Mass pressing], [Variable]),
  ), pal: pal)
]

#speaker-note[Each vinyl pressing begins with a master lacquer cut. The cutting engineer makes real-time decisions about groove spacing and depth that affect playback quality.]

== Pressing Plant Workflow

#stack(spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    album-card([Stage 1], [Lacquer Master], year: [DAY 01], pal: pal),
    album-card(
      [Stage 2], [Metal Stampers], year: [DAY 02-03], accent: pal.secondary,
      text-accent: pal.secondary-text, pal: pal,
    ),
    album-card([Stage 3], [Test Pressing], year: [DAY 04-05], pal: pal),
  ),
  grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    album-card([Stage 4], [Mass Production], year: [DAY 06-14], pal: pal),
    album-card(
      [Stage 5], [Quality Control], year: [DAY 15-16], accent: pal.secondary,
      text-accent: pal.secondary-text, pal: pal,
    ),
    album-card([Stage 6], [Packaging + Ship], year: [DAY 17-21], pal: pal),
  ),
  spectrum-bar(pal: pal),
)

#speaker-note[The full production cycle from mastering to shipping takes approximately three weeks for a standard LP pressing run.]

// ====================================================================
// Section 4: Listening Culture
// ====================================================================

= Listening Culture

#speaker-note[Frame vinyl listening as an intentional ritual supported by a physical playback system.]

== The Ritual of Listening

#focus-slide[
  *"Playing a record is an act of intention. You choose the album, clean the surface, drop the needle, and commit to the experience."*
]

#speaker-note[The focus slide emphasizes the intentional nature of vinyl listening — a counterpoint to algorithmic shuffle culture.]

== Essential Equipment

#dark-slide(title: [Turntable Setup], header-left: [GEAR GUIDE], header-right: [2024 EDITION])[
  #cols(columns: (1fr, 1fr), column-gutter: 20pt,
    {
      stack(spacing: .8em,
        text(size: typo.small, weight: "bold", tracking: 0.8pt, fill: pal.accent-text, font: _mono-font)[TURNTABLE],
        sleeve-card([Recommended], [
          - Technics SL-1200: Industry standard
          - Pro-Ject Debut Carbon: Audiophile entry
          - Rega Planar 3: British precision
        ], pal: pal),
        text(size: typo.small, weight: "bold", tracking: 0.8pt, fill: pal.secondary-text, font: _mono-font)[CARTRIDGE],
        sleeve-card([Top Picks], [
          - Ortofon 2M Blue: Balanced clarity
          - Audio-Technica VM540ML: Detail retrieval
          - Nagaoka MP-110: Warm musicality
        ], accent: pal.secondary, text-accent: pal.secondary-text, pal: pal),
      )
    },
    {
      stack(spacing: .8em,
        text(size: typo.small, weight: "bold", tracking: 0.8pt, fill: pal.accent-text, font: _mono-font)[PHONO PREAMP],
        sleeve-card([Options], [
          - iFi Zen Phono: Best value
          - Schiit Mani 2: Adjustable gain
          - Musical Fidelity V90: Transparent
        ], pal: pal),
        rpm-stat([Budget Range], [\$500], unit: [to \$3000], pal: pal),
      )
    },
  )
]

#speaker-note[A quality vinyl playback system requires three key components: turntable with tonearm, phono cartridge, and a dedicated phono preamplifier.]

== Equalizer Settings

#stack(spacing: .8em,
  text(size: typo.small, weight: "bold", tracking: 1pt, fill: pal.accent-text, font: _mono-font)[RIAA EQ CURVE COMPENSATION],
  grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 8pt,
    eq-band([32Hz], [+6], pal: pal),
    eq-band([64Hz], [+3], accent: pal.secondary, pal: pal),
    eq-band([125Hz], [0], pal: pal),
    eq-band([250Hz], [-2], accent: pal.secondary, pal: pal),
    eq-band([1kHz], [-4], pal: pal),
    eq-band([4kHz], [-8], accent: pal.secondary, pal: pal),
    eq-band([16kHz], [-12], pal: pal),
  ),
  spectrum-bar(color: pal.secondary, pal: pal),
  text(size: 10pt, fill: pal.ink-muted, font: _mono-font)[RIAA playback equalization: bass boost + treble cut to flatten the recording curve],
)

#speaker-note[The RIAA equalization curve is applied during playback to reverse the pre-emphasis applied during cutting. This reduces surface noise and allows longer playing times.]

// ====================================================================
// Section 5: Cultural Impact
// ====================================================================

= Cultural Impact

#speaker-note[Close the main narrative with the communities, events, canonical records, and collector market surrounding vinyl.]

== Record Store Day

#cols(columns: (2fr, 3fr))[
  #stack(spacing: .8em,
    label-tag([EST. 2007], pal: pal),
    text(size: 18pt, weight: "bold", fill: pal.ink)[Record Store Day],
    text(size: 13pt, fill: pal.ink-dim)[
      An annual celebration of independent music retailers worldwide, featuring exclusive vinyl releases.
    ],
    rpm-stat([Stores], [1,400+], unit: [worldwide], pal: pal),
  )
][
  #stack(spacing: .8em,
    grid(columns: (1fr, 1fr), column-gutter: 10pt,
      rpm-stat([Releases], [500+], unit: [exclusive], pal: pal),
      rpm-stat([Revenue], [\$72M], unit: [single day], pal: pal),
    ),
    liner-quote(
      [The record store is the last true music discovery space. Algorithms cannot replicate serendipity.],
      credit: "Record Store Day Foundation",
      pal: pal,
    ),
  )
]

#speaker-note[Record Store Day has become a cultural event that drives significant revenue and attention to independent music retailers.]

== Iconic Albums on Vinyl

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
  track-panel([Side A: Rock], (
    ([Dark Side of the Moon], [42:49]),
    ([Rumours], [39:43]),
    ([Abbey Road], [47:23]),
    ([Led Zeppelin IV], [42:38]),
  ), pal: pal),
  track-panel([Side B: Soul], (
    ([What's Going On], [35:37]),
    ([Songs in the Key of Life], [104:39]),
    ([Innervisions], [44:10]),
    ([Purple Rain], [43:51]),
  ), pal: pal),
  track-panel([Side C: Jazz], (
    ([Kind of Blue], [45:44]),
    ([A Love Supreme], [32:54]),
    ([Blue Train], [42:32]),
    ([Head Hunters], [41:24]),
  ), pal: pal),
)

#speaker-note[These albums represent the golden age of vinyl mastering, when engineers optimized the entire production chain for the LP format.]

== The Collector Economy

#dark-slide(title: [Investment Returns], header-left: [MARKET DATA], header-right: [VALUATIONS])[
  #stack(spacing: .8em,
    grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 14pt,
      rpm-stat([Avg Appreciation], [12\%], unit: [per year], value-size: 40pt, unit-size: 12pt, pal: pal),
      rpm-stat(
        [Top Sale 2023], [\$1.9M], unit: [single LP], accent: pal.secondary,
        value-size: 40pt, unit-size: 12pt, text-accent: pal.secondary-text, pal: pal,
      ),
      rpm-stat([Active Listings], [67M], unit: [on Discogs], value-size: 40pt, unit-size: 12pt, pal: pal),
      rpm-stat(
        [Collectors], [8.2M], unit: [registered], accent: pal.secondary,
        value-size: 40pt, unit-size: 12pt, text-accent: pal.secondary-text, pal: pal,
      ),
    ),
    figure[
      #vinyl-table(
        columns: (1.7fr, 1fr, 1fr, 1fr),
        ([Record], [Year], [Sale Price], [ROI]),
        ([Wu-Tang: Once Upon a Time...], [2015], [\$1.9M], [N/A]),
        ([Beatles: White Album \#0001], [2015], [\$790K], [394,900\%]),
        ([Elvis: My Happiness], [2015], [\$300K], [150,000\%]),
        pal: pal,
      )
    ],
  )
]

#speaker-note[Rare vinyl has emerged as an alternative investment class, with some records appreciating faster than traditional assets.]

// ====================================================================
// Ending
// ====================================================================

#ending-slide[Thank You for Listening]

#speaker-note[Close the presentation with appreciation for the audience's time. The analog metaphor reinforces the theme of intentional, quality-focused experiences.]
