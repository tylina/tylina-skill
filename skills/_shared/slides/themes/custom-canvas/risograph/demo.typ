#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Hiragino Sans GB"), size: 20pt)

#show: risograph-theme.with(
  aspect-ratio: "16-9",
  preset: "classic",
  config-info(
    title: [Independent Publishing],
    subtitle: [The Zine Renaissance & DIY Print Culture],
    author: [Risograph Collective],
    date: datetime.today(),
    institution: [Ink & Paper Press],
  ),
  config-common(breakable: false),
)

#title-slide()

= DIY Culture

== The Spirit of Self-Publishing

#cols[
  Self-publishing has always been an act of resistance against gatekeeping in the creative industries.

  - Zines emerged from punk and counterculture movements
  - Low barrier to entry: photocopiers, staples, determination
  - Content ranges from political manifestos to personal diaries
  - Distribution through independent bookshops and mail order
][
  #riso-card([CORE VALUES], [
    - Accessibility over perfection
    - Community over commerce
    - Process over polish
    - Voice over validation
  ], accent: palette.spot1)
]

== Why Risograph Printing

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true)[
  #overprint-stat([120+], [SPOT COLORS AVAILABLE], color1: palette.spot1, color2: palette.spot2)
][
  #overprint-stat([1986], [YEAR RISO WAS FOUNDED], color1: palette.spot2, color2: palette.spot1)
][
  #overprint-stat([5x], [CHEAPER THAN OFFSET], color1: palette.spot1, color2: palette.spot3)
]

== The Risograph Process

#cols[
  #zine-quote([Each print is unique. The slight misregistration, the grain of the drum, the way ink sits on uncoated paper. This is not a flaw. This is the point.], color: palette.spot2)

  #v(12pt)

  #halftone-divider(color: palette.spot1)

  #v(12pt)

  The risograph duplicator works like a screen printer: one color at a time, one drum per ink. Layering colors creates overprint effects.
][
  #riso-card([HOW IT WORKS], [
    + Design in spot color layers
    + Load ink drum (one color)
    + Feed paper through machine
    + Swap drum, run again
    + Repeat for each color layer
  ], accent: palette.spot2)
]

= Art Zines

== The New Wave of Art Publishing

Artists are choosing zines over galleries. The zine becomes both artwork and distribution channel.

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true)[
  #riso-card([SMALL PRESS FAIRS], [
    - NY Art Book Fair (MoMA PS1)
    - LA Zine Fest
    - Tokyo Art Book Fair
    - London Feminist Bookfair
    - Printed Matter events
  ], accent: palette.spot1)
][
  #riso-card([NOTABLE RISO STUDIOS], [
    - Hato Press (London)
    - Risolve Studio (Nashville)
    - Perfectly Acceptable (Austin)
    - Knust Press (Netherlands)
    - Paper Pusher (Brooklyn)
  ], accent: palette.spot2)
]

#dark-slide(title: [The Economics of Small Runs])[
  #v(8pt)

  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      text(size: 14pt, fill: palette.paper)[
        Risograph makes short runs economically viable. Where offset demands 500+ copies to break even, riso can profit at 50 copies.
      ]
      v(12pt)
      text(size: 11pt, fill: palette.paper.transparentize(30%))[
        This shifts the creative calculus entirely. You do not need to predict demand. You print what you believe in.
      ]
    },
    {
      grid(columns: (1fr, 1fr), column-gutter: 12pt, row-gutter: 12pt,
        block(inset: 10pt, stroke: 1pt + palette.spot1.transparentize(50%), width: 100%)[
          #text(size: 28pt, weight: "black", fill: palette.spot1)[50]
          #v(2pt)
          #text(size: 9pt, fill: palette.paper.transparentize(30%))[MIN VIABLE RUN]
        ],
        block(inset: 10pt, stroke: 1pt + palette.spot2.transparentize(50%), width: 100%)[
          #text(size: 28pt, weight: "black", fill: palette.spot2)[72hr]
          #v(2pt)
          #text(size: 9pt, fill: palette.paper.transparentize(30%))[TURNAROUND TIME]
        ],
        block(inset: 10pt, stroke: 1pt + palette.spot1.transparentize(50%), width: 100%)[
          #text(size: 28pt, weight: "black", fill: palette.spot1)[\$3]
          #v(2pt)
          #text(size: 9pt, fill: palette.paper.transparentize(30%))[COST PER COPY]
        ],
        block(inset: 10pt, stroke: 1pt + palette.spot2.transparentize(50%), width: 100%)[
          #text(size: 28pt, weight: "black", fill: palette.spot2)[2-4]
          #v(2pt)
          #text(size: 9pt, fill: palette.paper.transparentize(30%))[COLOR LAYERS]
        ],
      )
    },
  )
]

= Indie Presses

== Building a Micro-Publisher

#cols[
  The tools have never been more accessible. A risograph, a paper cutter, and a long-arm stapler. That is a publishing house.

  #v(10pt)

  #spot-tag(color: palette.spot1)[EQUIPMENT]
  #h(6pt)
  #spot-tag(color: palette.spot2)[COMMUNITY]
  #h(6pt)
  #spot-tag(color: palette.spot3)[DISTRIBUTION]

  #v(12pt)

  Most micro-publishers operate from shared studio spaces, splitting machine access and overhead costs between 4-8 members.
][
  #riso-card([STARTUP COSTS], [
    #grid(columns: (auto, 1fr), column-gutter: 8pt, row-gutter: 6pt,
      text(size: 11pt, weight: "bold", fill: palette.spot1)[\$2-5K],
      text(size: 11pt)[Used Riso machine],
      text(size: 11pt, weight: "bold", fill: palette.spot1)[\$200],
      text(size: 11pt)[Paper cutter],
      text(size: 11pt, weight: "bold", fill: palette.spot1)[\$50],
      text(size: 11pt)[Stapler + supplies],
      text(size: 11pt, weight: "bold", fill: palette.spot1)[\$100],
      text(size: 11pt)[Initial ink drums],
    )
  ], accent: palette.spot1)
]

== Distribution Channels

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true)[
  #riso-card([DIRECT], [
    - Studio open days
    - Artist markets
    - Personal website
    - Social media
  ], accent: palette.spot1)
][
  #riso-card([WHOLESALE], [
    - Independent bookshops
    - Museum gift shops
    - Art supply stores
    - Coffee shops
  ], accent: palette.spot2)
][
  #riso-card([DIGITAL], [
    - Etsy storefront
    - Big Cartel
    - Gumroad (PDF)
    - Newsletter drops
  ], accent: palette.spot1)
]

== Community & Collaboration

#cols[
  #stack(
    spacing: .8em,
    zine-quote([A zine fair is not a marketplace. It is a gathering of people who believe that printing something and handing it to a stranger is a radical act.], color: palette.spot1),
    grid(columns: (1fr, 1fr), column-gutter: 20pt,
      [
        #set text(size: 14pt)
        *Collaborative Models*
        - Split editions (two artists, one zine)
        - Anthology compilations
        - Print exchanges by mail
        - Shared studio memberships
      ],
      [
        #set text(size: 14pt)
        *Teaching & Mentorship*
        - Workshop series for beginners
        - Open studio print days
        - Youth zine programs
        - Library partnerships
      ],
    ),
  )
][
  #overprint-stat([340+], [ZINE FAIRS GLOBALLY PER YEAR], color1: palette.spot2, color2: palette.spot1)

  #v(12pt)

  #overprint-stat([67%], [GROWTH SINCE 2018], color1: palette.spot1, color2: palette.spot2)
]

#focus-slide(color: palette.spot2)[
  Print is not dead.\
  Print is personal.
]

#ending-slide[Make Zines]
