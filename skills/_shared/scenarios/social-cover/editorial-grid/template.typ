// Editorial Grid social cover
// A 4:5 publication cover with semantic Typst copy over one structural SVG layer.

#let editorial-social-palette = (
  paper: rgb("#f7f6f1"),
  ink: rgb("#171817"),
  ink-soft: rgb("#555853"),
  rule: rgb("#c8c9c3"),
  signal: rgb("#e33b43"),
  white: rgb("#f7f6f1"),
)

#let _editorial-field-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1350">
  <defs>
    <pattern id="fiber" width="29" height="31" patternUnits="userSpaceOnUse">
      <path d="M-3 7C8 4 18 11 32 6" fill="none" stroke="#171817" stroke-width="0.6" opacity="0.035"/>
      <path d="M4 24C15 20 22 28 34 23" fill="none" stroke="#ffffff" stroke-width="0.6" opacity="0.18"/>
    </pattern>
  </defs>
  <rect width="1080" height="1350" fill="#f7f6f1"/>
  <rect width="1080" height="1350" fill="url(#fiber)"/>
  <rect x="718" width="362" height="1350" fill="#171817"/>
  <rect x="718" width="7" height="1350" fill="#e33b43"/>
  <g fill="none" stroke="#171817" stroke-width="1" opacity="0.16">
    <path d="M64 0V1350M234 0V1350M404 0V1350M574 0V1350"/>
    <path d="M0 186H718M0 462H718M0 738H718M0 1014H718"/>
  </g>
  <g fill="none" stroke="#f7f6f1" stroke-width="1" opacity="0.12">
    <path d="M830 0V1350M918 0V1350M1006 0V1350"/>
    <path d="M718 186H1080M718 462H1080M718 738H1080M718 1014H1080"/>
  </g>
  <g fill="none" stroke="#e33b43" stroke-width="8">
    <path d="M806 258H1004"/>
    <path d="M806 304H948"/>
    <path d="M806 350H910"/>
    <path d="M806 396H872"/>
  </g>
  <g fill="none" stroke="#f7f6f1" stroke-width="1.4" opacity="0.55">
    <path d="M806 244V412"/>
    <path d="M1004 244V272M948 290V318M910 336V364M872 382V410"/>
  </g>
  <path d="M64 60H1016M64 1290H1016" fill="none" stroke="#171817" stroke-width="1.4" opacity="0.42"/>
  <path d="M718 60H1016M718 1290H1016" fill="none" stroke="#f7f6f1" stroke-width="1.4" opacity="0.36"/>
  <rect x="64" y="60" width="38" height="6" fill="#e33b43"/>
</svg>
```.text

#let _editorial-meta(left, right, dark: false) = {
  let color = if dark { editorial-social-palette.white.transparentize(20%) } else { editorial-social-palette.ink-soft }
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 11pt,
    weight: 600,
    tracking: 2.1pt,
    fill: color,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _editorial-move(number, title, note) = {
  grid(
    columns: (48pt, 1fr),
    column-gutter: 15pt,
    align: top,
    text(
      font: ("IBM Plex Mono",),
      size: 14.5pt,
      weight: 700,
      tracking: 1.4pt,
      fill: editorial-social-palette.signal,
      number,
    ),
    stack(
      spacing: 7pt,
      text(
        font: ("Noto Sans SC", "PingFang SC"),
        size: 20pt,
        weight: 700,
        fill: editorial-social-palette.white,
        title,
      ),
      text(
        font: ("Noto Sans SC", "PingFang SC"),
        size: 14pt,
        weight: 400,
        fill: editorial-social-palette.white.transparentize(34%),
        note,
      ),
    ),
  )
}

#let editorial-grid-cover(
  issue: [SCREEN NOTES · 02],
  date: [2026 · READING SYSTEMS],
  kicker: [SMALL-SCREEN EDITING],
  title: [先给结论，#linebreak()再铺证据],
  deck: [让长内容进入小屏，不靠缩小字号，#linebreak()而是重新安排阅读顺序。],
  principle-label: [EDITING PRINCIPLE / 01],
  principle: [不是把原稿塞进小屏，#linebreak()而是重写阅读路径。],
  statement: [封面只负责制造一个清晰的阅读入口。],
  rail-label: [FIELD GUIDE],
  rail-count: [04 MOVES],
  moves: (
    ([01], [结论], [先说这页为什么值得停留。]),
    ([02], [证据], [只留下支撑判断的材料。]),
    ([03], [节奏], [用尺度差建立扫读顺序。]),
    ([04], [出口], [把下一步写得具体可见。]),
  ),
  footer-left: [EDITORIAL GRID · SOCIAL EDITION],
  footer-right: [CLAIM → PROOF → ACTION],
  quote: [“Small screens reward clear sequence.”],
) = page(
  width: 1080pt,
  height: 1350pt,
  margin: 0pt,
  fill: editorial-social-palette.paper,
)[
  #set text(font: ("Noto Sans SC", "PingFang SC"), fill: editorial-social-palette.ink)
  #set par(leading: 1.05em)

  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_editorial-field-svg), width: 100%, height: 100%, fit: "stretch"))

    #pad(x: 64pt, top: 52pt, bottom: 50pt)[
      #grid(
        columns: (600pt, 1fr),
        rows: (28pt, 1fr, 182pt),
        column-gutter: 54pt,
        row-gutter: 30pt,
        _editorial-meta(issue, date),
        block(width: 100%, inset: (left: 14pt))[
          #_editorial-meta(rail-label, rail-count, dark: true)
        ],
        {
          grid(
            columns: (1fr,),
            rows: (auto, 1fr, auto),
            stack(
              spacing: 32pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 15pt,
                weight: 700,
                tracking: 3.1pt,
                fill: editorial-social-palette.signal,
                upper(kicker),
              ),
              {
                set par(leading: 0.88em)
                text(
                  font: ("Noto Sans SC", "PingFang SC"),
                  size: 91pt,
                  weight: 300,
                  tracking: -1.8pt,
                  fill: editorial-social-palette.ink,
                  title,
                )
              },
              block(width: 94pt, height: 7pt, fill: editorial-social-palette.signal),
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 25pt,
                weight: 400,
                fill: editorial-social-palette.ink-soft,
                deck,
              ),
            ),
            [],
            block(
              width: 536pt,
              stroke: (top: 1.2pt + editorial-social-palette.ink),
              inset: (top: 20pt, right: 24pt),
            )[
              #stack(
                spacing: 15pt,
                text(
                  font: ("IBM Plex Mono", "Noto Sans SC"),
                  size: 11.5pt,
                  weight: 700,
                  tracking: 2pt,
                  fill: editorial-social-palette.signal,
                  upper(principle-label),
                ),
                {
                  set par(leading: 0.96em)
                  text(
                    font: ("Noto Serif SC", "Songti SC"),
                    size: 31pt,
                    weight: 500,
                    fill: editorial-social-palette.ink,
                    principle,
                  )
                },
              )
            ],
          )
        },
        {
          block(width: 100%, height: 100%, inset: (left: 14pt))[
            #grid(
              columns: (1fr,),
              rows: (110pt, 210pt, 1fr, 1fr, 1fr),
              row-gutter: 18pt,
              _editorial-move(moves.at(0).at(0), moves.at(0).at(1), moves.at(0).at(2)),
              [],
              _editorial-move(moves.at(1).at(0), moves.at(1).at(1), moves.at(1).at(2)),
              _editorial-move(moves.at(2).at(0), moves.at(2).at(1), moves.at(2).at(2)),
              _editorial-move(moves.at(3).at(0), moves.at(3).at(1), moves.at(3).at(2)),
            )
          ]
        },
        block(
          width: 100%,
          height: 100%,
          fill: editorial-social-palette.signal,
          inset: (x: 24pt, y: 22pt),
        )[
          #grid(
            rows: (1fr, auto),
            text(
              font: ("Noto Serif SC", "Songti SC"),
              size: 28pt,
              weight: 500,
              fill: editorial-social-palette.white,
              statement,
            ),
            text(
              font: ("IBM Plex Mono", "Noto Sans SC"),
              size: 11.5pt,
              weight: 700,
              tracking: 2pt,
              fill: editorial-social-palette.white.transparentize(18%),
              upper(footer-left),
            ),
          )
        ],
        block(width: 100%, height: 100%, inset: (left: 16pt, top: 22pt))[
          #grid(
            rows: (1fr, auto),
            text(
              font: ("Noto Serif SC", "Songti SC"),
              size: 21.5pt,
              style: "italic",
              fill: editorial-social-palette.white.transparentize(15%),
              quote,
            ),
            text(
              font: ("IBM Plex Mono", "Noto Sans SC"),
              size: 11.5pt,
              weight: 700,
              tracking: 1.7pt,
              fill: editorial-social-palette.white.transparentize(30%),
              upper(footer-right),
            ),
          )
        ],
      )
    ]
  ]
]
