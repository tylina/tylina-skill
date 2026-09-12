// Polar Expedition Theme — Demo Presentation
// "The Heroic Age of Antarctic Exploration"
// Showcases all components and slide types with exploration/geography content

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: polar-expedition-theme.with(
  aspect-ratio: "16-9",
  footer: [ROSS SEA EXPEDITION 1914],
  preset: "expedition",
  config-info(
    title: [Into the White Silence],
    subtitle: [A Study of Antarctic Expeditions 1901--1917],
    author: [Royal Geographical Society],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#set text(font: ("IBM Plex Serif", "Noto Serif SC"), size: 18pt)

// ============================================================
// TITLE SLIDE
// ============================================================

#title-slide()

#speaker-note[Welcome to this presentation on the Heroic Age of Antarctic exploration, covering the major expeditions between 1901 and 1917.]

// ============================================================
// SECTION 1: The Race to the Pole
// ============================================================

= The Race to the Pole

== Expedition Timeline

#block(height: 100pt)[
  #cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 16pt,
    route-card([Discovery 1901--04], [Scott's first expedition aboard RRS Discovery. Reached 82\u{00B0}17'S, the furthest south at the time.]),
    route-card([Nimrod 1907--09], [Shackleton's first independent command. Reached 88\u{00B0}23'S -- just 97 miles from the Pole.], accent: palette.secondary),
    route-card([Terra Nova 1910--13], [Scott's fatal second expedition. Reached the South Pole on 17 January 1912.], accent: palette.accent),
  )
]

#v(0.5em)

#journal-quote(
  [For scientific discovery give me Scott; for speed and efficiency of travel give me Amundsen; but when disaster strikes and all hope is gone, get down on your knees and pray for Shackleton.],
  author: [Raymond Priestley],
  date: [c. 1950],
)

#speaker-note[This slide establishes the three major British expeditions of the era, with Priestley's famous quote about the different leadership styles.]

== Navigation and Positioning

#cols(columns: (2fr, 3fr))[
  #stack(
    spacing: .8em,
    bearing-stat([Latitude], [77\u{00B0}51'S]),
    bearing-stat([Longitude], [166\u{00B0}40'E]),
    stack(
      dir: ltr,
      spacing: 6pt,
      bearing-tag([Cape Evans]),
      bearing-tag([Ross Island]),
      bearing-tag([McMurdo Sound]),
    ),
  )
][
  #stack(
    spacing: .8em,
    expedition-panel([Navigation Methods], [
      Celestial navigation was the primary means of determining position in the Antarctic:

      - *Sextant observations* of sun altitude at local noon for latitude
      - *Chronometer readings* compared with Greenwich Mean Time for longitude
      - *Magnetic compass* corrections for local deviation near the Magnetic Pole
      - *Dead reckoning* between celestial fixes using sledge-meter readings
    ]),
    text(size: 11pt, fill: palette.meta-color, font: "IBM Plex Mono")[
      Position accuracy: \u{00B1} 1--2 nautical miles under favorable conditions
    ],
  )
]

#speaker-note[Details the coordinates of the base camp and the navigation methods available during this era of exploration.]

// ============================================================
// SECTION 2: Environmental Conditions
// ============================================================

= Environmental Conditions

== Climate Data: McMurdo Sound

#cols(columns: (1fr, 1fr, 1fr, 1fr))[
  #ice-stat([Mean Temp], [-28.4], unit: [\u{00B0}C])
][
  #ice-stat([Wind Speed], [42], unit: [kn])
][
  #ice-stat([Ice Depth], [2.8], unit: [m])
][
  #ice-stat([Visibility], [0.3], unit: [km])
]

#v(0.6em)

#coordinate-table(
  ([Month], [Temp \u{00B0}C], [Wind kn], [Daylight]),
  ([March], [-18], [25], [8h]),
  ([June], [-34], [38], [0h]),
  ([September], [-29], [42], [10h]),
  ([December], [-5], [18], [24h]),
)

#speaker-note[Environmental data from the McMurdo Sound region shows the extreme conditions faced by early explorers. Note the complete absence of daylight during winter months.]

== The Barrier: Ross Ice Shelf

#dark-slide(title: [The Ross Ice Shelf], ghost: [ICE])[
  #set text(fill: palette.bg)

  #cols(columns: (1fr, 1fr), gutter: 24pt,
    {
      set text(size: 14pt, fill: palette.bg.transparentize(15%))
      text(weight: "bold", size: 18pt)[Dimensions]
      v(0.5em)
      stack(spacing: .8em,
        [Length: *800 km* along the coastline],
        [Width: *600 km* from coast to barrier edge],
        [Thickness: *200--750 m* of floating ice],
        [Area: *487,000 km\u{00B2}* -- size of France],
      )
      v(1em)
      text(size: 11pt, fill: palette.bg.transparentize(40%), font: "IBM Plex Mono", tracking: 0.5pt)[
        DISCOVERED 1841 BY JAMES CLARK ROSS
      ]
    },
    {
      set text(size: 14pt, fill: palette.bg.transparentize(15%))
      text(weight: "bold", size: 18pt)[Significance]
      v(0.5em)
      stack(spacing: .8em,
        [Primary barrier to reaching the Pole from the south],
        [Source of all expedition ice -- drinking water supply],
        [Calving icebergs posed constant navigation hazard],
        [Surface provided sledging route to the interior],
      )
    },
  )
]

#speaker-note[The Ross Ice Shelf, known to the explorers as 'The Barrier', was the defining geographic feature of every expedition from Ross Island.]

// ============================================================
// SECTION 3: Expedition Logistics
// ============================================================

= Expedition Logistics

== Supply Chain and Equipment

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #chart-card([Provisions per Man], [
    Daily ration on the polar march:

    - Pemmican: 340g
    - Biscuit: 450g
    - Butter: 57g
    - Cocoa: 28g
    - Sugar: 85g
    - Tea: 14g

    *Total: 974g / 4,500 kcal per day*
  ])
][
  #chart-card([Transport Methods], [
    Comparative efficiency of polar transport:

    - *Man-hauling*: 15--20 km/day, 90kg per man
    - *Dog teams*: 30--50 km/day, requires feed depots
    - *Motor sledge*: Unreliable in extreme cold
    - *Ponies*: 20--30 km/day, poor in soft snow

    Amundsen's dogs covered 55 km on peak days.
  ], accent: palette.secondary)
]

#speaker-note[Logistics were the decisive factor in expedition success. Amundsen's superior understanding of dog transport gave him a critical advantage.]

== The Endurance: Survival Statistics

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt,
  bearing-stat([Duration], [497], description: [days stranded on ice]),
  bearing-stat([Distance], [1,287], description: [km in open boats to South Georgia]),
  bearing-stat([Crew], [28/28], description: [all hands survived]),
)

#v(0.8em)

#signal-box([Critical Decision], [
  On 27 October 1915, Shackleton ordered the crew to abandon *Endurance* after 281 days trapped in pack ice. The ship was crushed by pressure and sank the following month. This began a 497-day survival ordeal that is considered the greatest feat of leadership in exploration history.
])

#speaker-note[Shackleton's Imperial Trans-Antarctic Expedition is remarkable for the complete survival of all crew members despite catastrophic loss of the ship.]

// ============================================================
// SECTION 4: Scientific Legacy
// ============================================================

= Scientific Legacy

== Research Contributions

#cols(columns: (1fr, 1fr))[
  #expedition-panel([Geological Discoveries])[
    - Coal seam fossils proving continental drift
    - Beacon Sandstone formation mapping
    - Glossopteris leaf fossils (Gondwana evidence)
    - Volcanic activity records from Mt. Erebus
    - Ferrar Glacier sediment analysis
  ]
][
  #expedition-panel([Meteorological Data])[
    - First systematic Antarctic weather records
    - Temperature inversions at altitude documented
    - Katabatic wind speed measurements
    - Blizzard frequency and duration cataloged
    - Aurora australis observations (1911 winter)
  ]
]

#v(0.5em)

#journal-quote(
  [The worst journey in the world was undertaken for the purpose of obtaining Emperor Penguin embryos, which it was hoped would throw light on the origin of birds from reptiles.],
  author: [Apsley Cherry-Garrard],
  date: [1922],
)

#speaker-note[The scientific output of these expeditions was enormous, contributing to geology, meteorology, biology, and magnetism. Cherry-Garrard's Cape Crozier journey remains legendary.]

== Mapping the Unknown

#dark-slide(title: [Cartographic Achievement], ghost: [MAP])[
  #set text(fill: palette.bg)

  #cols(columns: (3fr, 2fr), gutter: 24pt,
    {
      set text(size: 14pt, fill: palette.bg.transparentize(10%))
      text(weight: "bold", size: 18pt, fill: palette.bg)[Survey Results 1901--1917]
      v(0.8em)
      stack(spacing: .8em,
        [#text(fill: palette.focus-accent, weight: "bold")[1,200 km] of new coastline charted],
        [#text(fill: palette.focus-accent, weight: "bold")[48 peaks] triangulated and named],
        [#text(fill: palette.focus-accent, weight: "bold")[3 glaciers] traced from source to sea],
        [#text(fill: palette.focus-accent, weight: "bold")[12 depots] positioned by theodolite],
      )
      v(1em)
      text(size: 11pt, fill: palette.bg.transparentize(40%), font: "IBM Plex Mono")[
        FIRST TOPOGRAPHIC MAP: ADMIRALTY CHART 3205
      ]
    },
    {
      set text(size: 13pt, fill: palette.bg.transparentize(20%))
      block(
        width: 100%,
        stroke: 0.5pt + palette.bg.transparentize(60%),
        inset: 1em,
      )[
        #text(weight: "bold", size: 11pt, tracking: 1pt, fill: palette.bg.transparentize(30%), font: "IBM Plex Mono")[KEY LANDMARKS]
        #v(0.5em)
        #stack(spacing: .8em,
          [Mt. Erebus -- 3,794m],
          [Mt. Terror -- 3,262m],
          [Beardmore Glacier -- 160km],
          [Cape Adare -- 71\u{00B0}17'S],
          [Bay of Whales -- 78\u{00B0}30'S],
        )
      ]
    },
  )
]

#speaker-note[The mapping work of the Heroic Age expeditions provided the first accurate charts of the Antarctic coastline and interior, many of which remained in use until satellite surveys.]

// ============================================================
// SECTION 5: Legacy and Reflection
// ============================================================

= Legacy and Reflection

== Lessons for Modern Exploration

#block(height: 140pt)[
  #cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 14pt,
    chart-card([Leadership], [
      Shackleton's democratic style and unwavering commitment to crew welfare set the standard for crisis management in extreme environments.
    ]),
    chart-card([Preparation], [
      Amundsen's meticulous planning -- pre-positioned depots every degree of latitude -- demonstrated that success is determined before departure.
    ], accent: palette.secondary),
    chart-card([Sacrifice], [
      Scott's party died returning from the Pole, but their geological specimens proved continental drift -- science carried to the last breath.
    ], accent: palette.accent),
  )
]

#v(0.5em)

#glacier-divider()

#v(0.3em)

#text(size: 12pt, fill: palette.meta-color, font: "IBM Plex Mono", tracking: 0.5pt)[
  THE ANTARCTIC TREATY 1959 -- PRESERVING THE CONTINENT FOR SCIENCE AND PEACE
]

#speaker-note[The legacy of the Heroic Age directly influenced the Antarctic Treaty System, which reserves the continent exclusively for peaceful scientific research.]

// ============================================================
// FOCUS + ENDING
// ============================================================

#focus-slide[
  I now know that the route to the South Pole is not as bad as it seems. One only has to begin.

  #v(0.5em)
  #text(size: 0.6em, style: "normal", weight: "medium", fill: palette.focus-accent)[-- Roald Amundsen, 1912]
]

#speaker-note[Amundsen's understated reflection captures the spirit of the entire era -- that boldness of action, combined with rigorous preparation, can overcome any obstacle.]

#ending-slide[Safe Harbour Reached]

#speaker-note[Thank you for joining this expedition through the history of Antarctic exploration. The spirit of discovery continues.]
