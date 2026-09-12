// Pritzker social cover
// A 3:4 architecture-and-culture cover built around a reusable spatial SVG field.

#let pritzker-social-palette = (
  paper: rgb("#f1eee7"),
  paper-2: rgb("#e4ded2"),
  ink: rgb("#191a18"),
  ink-soft: rgb("#5d5a54"),
  gold: rgb("#9b7544"),
  gold-light: rgb("#d7b77d"),
  white: rgb("#f3efe6"),
)

#let _spatial-field-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1242 1660">
  <defs>
    <pattern id="fiber" width="35" height="41" patternUnits="userSpaceOnUse">
      <path d="M-4 11C9 6 22 15 39 9" fill="none" stroke="#191a18" stroke-width="0.7" opacity="0.035"/>
      <path d="M2 32C13 27 28 36 42 30" fill="none" stroke="#ffffff" stroke-width="0.7" opacity="0.11"/>
    </pattern>
    <clipPath id="upper-art"><rect x="0" y="0" width="1242" height="1080"/></clipPath>
  </defs>

  <rect width="1242" height="1660" fill="#f1eee7"/>
  <rect width="1242" height="1660" fill="url(#fiber)"/>
  <rect y="1080" width="1242" height="580" fill="#191a18"/>
  <rect y="1080" width="1242" height="580" fill="url(#fiber)" opacity="0.55"/>

  <g clip-path="url(#upper-art)">
    <path d="M672 122H1168V1002H672Z" fill="#e4ded2"/>
    <path d="M706 174H1134V966H706Z" fill="#f1eee7" stroke="#9b7544" stroke-width="2"/>

    <g transform="translate(666 172)">
      <path d="M70 98L302 0L438 68L207 170Z" fill="#d8d1c4" stroke="#191a18" stroke-width="2"/>
      <path d="M70 98L207 170V642L70 574Z" fill="#cbc4b7" stroke="#191a18" stroke-width="2"/>
      <path d="M207 170L438 68V536L207 642Z" fill="#eee9df" stroke="#191a18" stroke-width="2"/>

      <g fill="#f1eee7" stroke="#9b7544" stroke-width="2">
        <path d="M96 146L197 198L197 282L96 231Z"/>
        <path d="M96 264L197 315L197 399L96 348Z"/>
        <path d="M96 382L197 433L197 517L96 466Z"/>
      </g>

      <g fill="#191a18" opacity="0.92">
        <path d="M247 190L402 122V181L247 249Z"/>
        <path d="M247 285L402 217V276L247 344Z"/>
        <path d="M247 380L402 312V371L247 439Z"/>
      </g>

      <g fill="none" stroke="#9b7544" stroke-width="3">
        <path d="M238 514L416 435"/>
        <path d="M238 535L416 456"/>
        <path d="M238 556L416 477"/>
        <path d="M238 577L416 498"/>
        <path d="M238 598L416 519"/>
      </g>

      <g fill="none" stroke="#191a18" stroke-width="1.3" opacity="0.48">
        <path d="M27 82L207 170L476 52"/>
        <path d="M27 574L207 662L476 544"/>
        <path d="M70 98V574M438 68V536M207 170V642"/>
      </g>
    </g>

    <g fill="none" stroke="#9b7544" stroke-width="1.4" opacity="0.55">
      <path d="M616 92V1032"/>
      <path d="M600 218H632M600 404H632M600 590H632M600 776H632M600 962H632"/>
      <path d="M658 1032H1168"/>
    </g>
  </g>

  <g fill="none" stroke="#d7b77d" stroke-width="1.2" opacity="0.22">
    <path d="M76 1188H1166M76 1364H1166M76 1538H1166"/>
    <path d="M426 1080V1600M816 1080V1600"/>
  </g>

  <path d="M76 70H1166M76 1598H1166" fill="none" stroke="#191a18" stroke-width="1.4" opacity="0.44"/>
  <path d="M76 1080H1166M76 1598H1166" fill="none" stroke="#d7b77d" stroke-width="1.4" opacity="0.48"/>
  <rect x="76" y="70" width="44" height="5" fill="#9b7544"/>
</svg>
```.text

#let _pritzker-meta(left, right, dark: false) = {
  let color = if dark { pritzker-social-palette.gold-light } else { pritzker-social-palette.ink-soft }
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 12pt,
    weight: 600,
    tracking: 2.4pt,
    fill: color,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _spatial-note(number, title, note) = {
  block(
    width: 100%,
    stroke: (left: 3pt + pritzker-social-palette.gold),
    inset: (left: 18pt, right: 16pt),
  )[
    #stack(
      spacing: 14pt,
      text(
        font: ("Libertinus Serif", "Noto Serif SC"),
        size: 28pt,
        style: "italic",
        fill: pritzker-social-palette.gold-light,
        number,
      ),
      text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 22pt,
        weight: 600,
        fill: pritzker-social-palette.white,
        title,
      ),
      text(
        font: ("Noto Sans SC", "PingFang SC"),
        size: 16pt,
        fill: pritzker-social-palette.white.transparentize(34%),
        note,
      ),
    )
  ]
}

#let pritzker-social-cover(
  issue: [PUBLIC SPACE · FIELD STUDY 03],
  date: [2026 · CITY OBSERVATION],
  kicker: [ARCHITECTURE BEGINS AT HUMAN SCALE],
  title: [公共空间，#linebreak()先从一张#linebreak()椅子开始],
  deck: [真正被使用的空间，往往先解决停留、看见与相遇。],
  study-label: [COURTYARD STUDY · AXONOMETRIC FIELD],
  notes: (
    ([01], [可停留], [先给身体一个不必解释的落点。]),
    ([02], [可看见], [让入口、边界与去向一眼可读。]),
    ([03], [可相遇], [把偶然交谈留在动线上，而不是挡住动线。]),
  ),
  closing: [空间不是被观看的背景，#linebreak()而是被身体反复使用的路径。],
  closing-note: [先画停留，再画移动；#linebreak()先看人的尺度，再谈形式。],
  closing-terms: ([SIT], [SEE], [MEET]),
  footer-left: [PRITZKER NOTES · SOCIAL EDITION],
  footer-right: [SIT · SEE · MEET],
) = page(
  width: 1242pt,
  height: 1660pt,
  margin: 0pt,
  fill: pritzker-social-palette.paper,
)[
  #set text(font: ("Noto Serif SC", "Songti SC"), fill: pritzker-social-palette.ink)
  #set par(leading: 1.07em)

  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_spatial-field-svg), width: 100%, height: 100%, fit: "stretch"))

    #pad(x: 76pt, top: 62pt, bottom: 50pt)[
      #grid(
        columns: (1fr,),
        rows: (30pt, 918pt, 1fr, 30pt),
        row-gutter: 28pt,
        _pritzker-meta(issue, date),
        grid(
          columns: (54%, 46%),
          column-gutter: 44pt,
          {
            stack(
              spacing: 34pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 16pt,
                weight: 600,
                tracking: 3pt,
                fill: pritzker-social-palette.gold,
                upper(kicker),
              ),
              {
                set par(leading: 0.87em)
                text(
                  font: ("Noto Serif SC", "Songti SC"),
                  size: 91pt,
                  weight: 500,
                  tracking: 3pt,
                  fill: pritzker-social-palette.ink,
                  title,
                )
              },
              block(width: 82pt, height: 5pt, fill: pritzker-social-palette.gold),
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 25pt,
                fill: pritzker-social-palette.ink-soft,
                deck,
              ),
            )
          },
          {
            grid(
              rows: (1fr, auto),
              [],
              block(
                width: 100%,
                fill: pritzker-social-palette.paper.transparentize(7%),
                stroke: (top: 1.2pt + pritzker-social-palette.gold),
                inset: (top: 16pt),
              )[
                #text(
                  font: ("IBM Plex Mono", "Noto Sans SC"),
                  size: 11pt,
                  weight: 600,
                  tracking: 1.9pt,
                  fill: pritzker-social-palette.gold,
                  upper(study-label),
                )
              ],
            )
          },
        ),
        grid(
          rows: (auto, 1fr),
          row-gutter: 38pt,
          grid(
            columns: notes.len(),
            column-gutter: 24pt,
            align: top,
            ..notes.map(item => _spatial-note(item.at(0), item.at(1), item.at(2))),
          ),
          block(
            width: 100%,
            height: 100%,
            stroke: (top: 1.2pt + pritzker-social-palette.gold.transparentize(48%)),
            inset: (top: 30pt),
          )[
            #grid(
              rows: (auto, 1fr),
              row-gutter: 30pt,
              grid(
                columns: (68%, 32%),
                column-gutter: 44pt,
                {
                  set par(leading: 0.98em)
                  text(
                    font: ("Noto Serif SC", "Songti SC"),
                    size: 37pt,
                    weight: 500,
                    fill: pritzker-social-palette.white,
                    closing,
                  )
                },
                stack(
                  spacing: 16pt,
                  text(
                    font: ("IBM Plex Mono",),
                    size: 11.5pt,
                    weight: 700,
                    tracking: 2pt,
                    fill: pritzker-social-palette.gold-light,
                    [HUMAN SCALE / 01],
                  ),
                  text(
                    font: ("Noto Sans SC", "PingFang SC"),
                    size: 16pt,
                    fill: pritzker-social-palette.white.transparentize(28%),
                    closing-note,
                  ),
                ),
              ),
              align(bottom)[
                #grid(
                  columns: (1fr, 1fr, 1fr),
                  column-gutter: 24pt,
                  ..closing-terms.map(term => block(
                    width: 100%,
                    stroke: (bottom: 1.2pt + pritzker-social-palette.gold.transparentize(35%)),
                    inset: (bottom: 12pt),
                  )[
                    #text(
                      font: ("Libertinus Serif",),
                      size: 43pt,
                      style: "italic",
                      fill: pritzker-social-palette.gold-light.transparentize(22%),
                      term,
                    )
                  ]),
                )
              ],
            )
          ],
        ),
        _pritzker-meta(footer-left, footer-right, dark: true),
      )
    ]
  ]
]
