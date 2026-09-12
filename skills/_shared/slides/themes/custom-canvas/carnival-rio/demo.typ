// Carnival Rio Theme -- Demo Presentation
// A celebration of Brazilian Carnival culture, samba schools, and Rio's energy

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: carnival-rio-theme.with(
  aspect-ratio: "16-9",
  footer: [Carnival Rio 2026],
  config-info(
    title: [The Spirit of Carnival],
    subtitle: [A Journey Through Rio's Greatest Celebration],
    author: [Festival Productions],
    date: datetime.today(),
    institution: [Rio Cultural Institute],
  ),
  config-common(breakable: false),
)

#set text(font: ("Arial", "Heiti SC"), size: 20pt)

#title-slide()

= History & Origins

== The Birth of Brazilian Carnival

#cols[
  #samba-card([Portuguese Roots], [
    Carnival traces its origins to the Portuguese *Entrudo* festivals of the 1600s, where revelers threw water, flour, and mud at each other in the streets of colonial Brazil.
  ])

  #v(0.6em)

  #plume-highlight([
    By the 1840s, the celebrations evolved into elegant masquerade balls inspired by Parisian carnivals, introducing costumes, masks, and organized street processions.
  ])
][
  #confetti-box([Key Milestone], [
    In 1928, the first official samba school -- *Deixa Falar* -- was founded in the Estacio neighborhood of Rio, forever linking samba music to Carnival celebrations.
  ])

  #v(0.6em)

  #samba-card([Cultural Fusion], [
    Carnival blends African rhythms, indigenous traditions, and European theatrical elements into a uniquely Brazilian celebration of life and community.
  ], accent: palette.tertiary)
]

#speaker-note[Discuss the multicultural origins of Carnival and how African diaspora communities shaped its musical core.]

== Carnival by the Numbers

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #float-stat([Duration], [40], description: [Days of celebration from Epiphany to Ash Wednesday])
][
  #float-stat([Attendance], [2M+], description: [Visitors flood Rio annually for the festivities], accent: palette.secondary)
][
  #float-stat([Revenue], [\$1.5B], description: [Economic impact on Rio's economy each year], accent: palette.tertiary)
]

#speaker-note[These statistics demonstrate Carnival's massive scale -- it is the largest festival in the world by participation.]

== Timeline of Evolution

#parade-grid(
  [*1600s* -- Portuguese Entrudo arrives in colonial Brazil with street water fights],
  [*1840s* -- Masquerade balls bring European elegance to the celebrations],
  [*1928* -- First samba school Deixa Falar is founded in Estacio],
  [*1935* -- Rio government officially recognizes and sponsors samba schools],
  [*1984* -- Sambodromo built by Oscar Niemeyer as the permanent parade venue],
  [*2012* -- Carnival declared Intangible Cultural Heritage by UNESCO],
)

#speaker-note[The evolution from informal street parties to organized spectacle reflects Brazil's broader cultural development.]

= Samba Schools

== The Heart of Competition

#cols[
  #tropical-banner([
    Samba schools are not schools at all -- they are community organizations that spend the entire year preparing elaborate themed parades for competition in the Sambodromo.
  ])

  #v(0.6em)

  #cols(columns: (1fr, 1fr))[
    #samba-card([Organization], [
      Each school has thousands of members organized into *alas* (wings), each with specific costumes and choreography designed around the annual theme.
    ])
  ][
    #samba-card([Judging Criteria], [
      Ten categories including: samba-enredo (theme song), harmony, evolution, floats, costumes, drumline, choreography, and overall theme.
    ], accent: palette.secondary)
  ]
][
  #carnival-quote([
    Carnival is not just a party. It is the soul of Brazil expressed in rhythm, color, and movement. Every sequin tells a story.
  ], cite: [Joaozinho Trinta, Legendary Carnavalesco])

  #v(0.6em)

  #sparkle-tag([Special Group])
  #h(0.5em)
  #sparkle-tag([Series A], color: palette.secondary)
  #h(0.5em)
  #sparkle-tag([Series B], color: palette.tertiary)
]

#speaker-note[Explain the competitive structure -- the top 12 schools compete in the Special Group, with promotion and relegation each year.]

== Top Samba Schools of Rio

#figure[
  #table(
    columns: (auto, 2fr, auto, 1fr),
    inset: 10pt,
    fill: (x, y) => if y == 0 { palette.accent.lighten(80%) } else if calc.rem(y, 2) == 0 { palette.bg } else { palette.card },
    align: (center, left, center, center),
    [*\#*], [*School*], [*Founded*], [*Titles*],
    [1], [Portela], [1923], [22],
    [2], [Mangueira], [1928], [20],
    [3], [Beija-Flor], [1948], [14],
    [4], [Imperatriz], [1959], [9],
    [5], [Mocidade], [1955], [6],
    [6], [Vila Isabel], [1946], [4],
  )
]

#speaker-note[Portela holds the record for most championships, though Beija-Flor dominated the modern era with spectacular visual presentations.]

#dark-slide(title: [The Bateria])[
  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      set text(fill: palette.dark-ink)
      text(size: typo.tiny, weight: "medium", tracking: 1.5pt, fill: palette.accent, font: _mono-font)[THE DRUMLINE]
      v(0.5em)
      text(size: 1.6em, weight: "bold")[300+ Percussionists]
      v(0.5em)
      text(size: 13pt, fill: palette.dark-ink.transparentize(30%))[
        The bateria is the heartbeat of every samba school. Led by a *mestre de bateria*, hundreds of drummers create interlocking polyrhythmic patterns that drive the entire parade forward.
      ]
    },
    {
      set text(fill: palette.dark-ink)
      cols(columns: (1fr, 1fr))[
        #sequin-stat([16], [Instrument types])
      ][
        #sequin-stat([80], [Minutes non-stop], accent: palette.accent)
      ]
      v(0.6em)
      cols(columns: (1fr, 1fr))[
        #sequin-stat([170], [BPM average], accent: palette.tertiary)
      ][
        #sequin-stat([1], [Unified beat])
      ]
    },
  )
]

#speaker-note[The bateria creates the irresistible rhythm that makes everyone move. They rehearse year-round to achieve perfect synchronization.]

= The Parade Experience

== Anatomy of a Parade

#cols(columns: (2fr, 3fr))[
  #samba-card([Structure], [
    Each school has 80 minutes to present:
    - *Comissao de frente* (front commission)
    - 6-8 elaborate floats
    - 25-30 costume wings
    - 300+ member bateria
    - 3,000-5,000 total participants
  ])
][
  #grid(columns: (1fr, 1fr), column-gutter: 12pt, row-gutter: 12pt,
    float-stat([Floats], [8], description: [Maximum per school]),
    float-stat([Wings], [30], description: [Costume groups], accent: palette.secondary),
    float-stat([Height], [14m], description: [Max float height], accent: palette.tertiary),
    float-stat([Length], [700m], description: [Parade route], accent: palette.accent),
  )
]

#speaker-note[Every element is choreographed to tell the school's chosen story -- a complete narrative played out over 80 minutes of pure spectacle.]

== Costumes & Craftsmanship

#cols(columns: (3fr, 2fr))[
  #plume-highlight([
    A single *destaque* (featured dancer) costume can cost over \$30,000 and weigh up to 40 kilograms, featuring thousands of hand-applied crystals, ostrich feathers, and metallic embroidery.
  ], accent: palette.secondary)

  #v(0.5em)

  #cols(columns: (1fr, 1fr, 1fr))[
    #confetti-box([Feathers], [
      Over 500,000 feathers are imported annually from South Africa and Asia for Rio's Carnival costumes alone.
    ], accent: palette.accent)
  ][
    #confetti-box([Sequins], [
      A single float can use 2 million+ sequins and rhinestones, all hand-applied by volunteer artisans.
    ], accent: palette.secondary)
  ][
    #confetti-box([Time], [
      Production begins 6 months before Carnival. The top schools employ 400+ full-time artisans.
    ], accent: palette.tertiary)
  ]
][
  #tropical-banner([
    The barracoes (workshops) of samba schools are factories of dreams -- massive warehouses where floats are built, costumes sewn, and rehearsals held year-round.
  ])

  #v(0.5em)

  #samba-card([Sustainability Push], [
    Modern samba schools increasingly use recycled materials. In 2024, Mangueira built an entire float from reclaimed ocean plastic, winning the sustainability award.
  ], accent: palette.tertiary)
]

#speaker-note[The artisanal work behind Carnival is extraordinary -- these are essentially wearable sculptures and rolling stage productions.]

== Economic Impact

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #float-stat([Jobs], [250K], description: [Direct and indirect employment during Carnival season], accent: palette.accent)
][
  #float-stat([Hotels], [98\%], description: [Occupancy rate in Rio during Carnival week], accent: palette.secondary)
][
  #float-stat([TV Reach], [180], description: [Countries broadcast the Sambodromo parade live], accent: palette.tertiary)
]

#speaker-note[Carnival is not just culture -- it is Rio's largest economic engine, rivaling even tourism to Christ the Redeemer.]

= Beyond Rio

== Carnival Across Brazil

#cols[
  #stack(
    spacing: 0.8em,
    parade-grid(
      [*Salvador* -- Largest street carnival in the world with 2 million daily participants and electric trio trucks],
      [*Recife/Olinda* -- Frevo music and giant puppet parades through colonial streets],
      [*Sao Paulo* -- Second-largest sambodromo with its own competitive samba school league],
    ),
    rhythm-divider(color: palette.secondary),
    plume-highlight([
      While Rio's Sambodromo spectacle dominates international media, Salvador's street carnival is actually larger by participation -- a truly democratic celebration where everyone dances together.
    ], accent: palette.tertiary),
  )
][
  #stack(
    spacing: 0.8em,
    samba-card([Global Influence], [
      Brazilian Carnival has inspired celebrations worldwide:
      - Notting Hill Carnival (London)
      - Trinidad and Tobago Carnival
      - Mardi Gras (New Orleans)
      - Tenerife Carnival (Spain)
      - Toronto Caribbean Carnival
    ]),
    confetti-box([Cultural Export], [
      Samba, bossa nova, and Carnival aesthetics have become global cultural touchstones, influencing fashion, music, dance, and festival design worldwide.
    ]),
  )
]

#speaker-note[Each Brazilian city has its own distinct Carnival tradition -- Salvador's is more participatory while Rio's is more spectacle-oriented.]

#focus-slide[
  Carnival is not a spectacle you watch.\
  It is a force that moves through you.\
  \u{1F3B6} Samba no pe, alegria no coracao. \u{1F3B6}
]

#speaker-note[This quote captures the participatory nature of Carnival -- it transcends spectatorship to become a shared experience of joy.]

== The Future of Carnival

#cols(columns: (6fr, 5fr))[
  #stack(
    spacing: 0.8em,
    cols(columns: (1fr, 1fr),
      [#samba-card([Innovation], [
        - LED-integrated costumes with programmable displays
        - Drone choreography above floats
        - Augmented reality spectator experiences
        - Sustainable materials revolution
      ])],
      [#samba-card([Preservation], [
        - Community samba circles (rodas de samba)
        - Youth training programs in favelas
        - Digital archiving of historical parades
        - UNESCO cultural heritage protection
      ], accent: palette.tertiary)],
    ),
    tropical-banner([
      The challenge of modern Carnival: embracing technological innovation while preserving the community spirit and African-Brazilian cultural roots that give it meaning.
    ]),
  )
][
  #stack(
    spacing: 0.8em,
    carnival-quote([
      Technology should amplify our stories, not replace them. The soul of Carnival will always be the people dancing together, united by rhythm.
    ], cite: [Rosa Magalhaes, Award-winning Carnavalesca]),
    stack(dir: ltr, spacing: 0.4em,
      sparkle-tag([Technology]),
      sparkle-tag([Tradition], color: palette.secondary),
      sparkle-tag([Community], color: palette.tertiary),
    ),
    confetti-box([2026 Theme Trend], [
      Multiple schools are choosing Afrofuturism themes this year, blending African heritage with speculative futures -- a powerful statement of identity and aspiration.
    ], accent: palette.accent),
  )
]

#speaker-note[The tension between tradition and innovation is productive -- it keeps Carnival evolving while maintaining its cultural core.]

#ending-slide[Viva o Carnaval!]
