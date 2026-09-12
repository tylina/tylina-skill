// Guizang Field Journal social cover
// A light 3:4 photo-editorial cover with a large evidence image and native Typst copy.

#let field-journal-palette = (
  paper: rgb("#f7f5ef"),
  paper-2: rgb("#ece8de"),
  ink: rgb("#201e1b"),
  ink-soft: rgb("#625f59"),
  blue: rgb("#315797"),
  rule: rgb("#c9c5bc"),
)

#let _journal-paper-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1242 1660">
  <defs>
    <pattern id="fiber" width="31" height="37" patternUnits="userSpaceOnUse">
      <path d="M-4 9C7 5 20 14 35 8" fill="none" stroke="#201e1b" stroke-width="0.65" opacity="0.035"/>
      <path d="M3 29C14 24 22 35 34 28" fill="none" stroke="#ffffff" stroke-width="0.6" opacity="0.22"/>
    </pattern>
  </defs>
  <rect width="1242" height="1660" fill="#f7f5ef"/>
  <rect width="1242" height="1660" fill="url(#fiber)"/>
  <path d="M78 70H1164M78 1598H1164" stroke="#201e1b" stroke-width="1.2" opacity="0.42"/>
  <path d="M78 336H1164M78 1266H1164" stroke="#201e1b" stroke-width="1" opacity="0.14"/>
  <path d="M78 70V1598M1164 70V1598" stroke="#201e1b" stroke-width="1" opacity="0.12"/>
  <rect x="78" y="70" width="42" height="5" fill="#315797"/>
</svg>
```.text

#let _journal-meta(left, right) = {
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 11pt,
    weight: 600,
    tracking: 2.2pt,
    fill: field-journal-palette.ink-soft,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _journal-note(number, title, note) = {
  block(
    width: 100%,
    stroke: (top: 1.1pt + field-journal-palette.rule),
    inset: (top: 18pt, right: 22pt),
  )[
    #stack(
      spacing: 10pt,
      text(
        font: ("IBM Plex Mono",),
        size: 12pt,
        weight: 700,
        tracking: 1.8pt,
        fill: field-journal-palette.blue,
        number,
      ),
      text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 22pt,
        weight: 600,
        fill: field-journal-palette.ink,
        title,
      ),
      text(
        font: ("Noto Serif SC", "Songti SC"),
        size: 15.5pt,
        fill: field-journal-palette.ink-soft,
        note,
      ),
    )
  ]
}

#let guizang-field-journal-cover(
  hero-image: "assets/alpine-ridge.jpg",
  issue: [M01 · FIELD JOURNAL · PALE BLUE],
  date: [VOL. 04 · 2026 · CONCEPT STUDY],
  kicker: [A QUIET WEATHER NOTE],
  title-top: [在高处],
  title-prefix: [看见],
  title-accent: [winter],
  subtitle: [雪线、岩壁与一阵正在越过山脊的风。],
  photo-label: [FIG. 01 · CONCEPTUAL ALPINE STUDY · NO GEOGRAPHIC CLAIM],
  notes: (
    ([01], [先看光], [亮部保留雪的层次，也给标题留下呼吸。]),
    ([02], [再看风], [云不是背景噪声，它让静止的山有了时间方向。]),
    ([03], [最后看尺度], [不虚构地点与海拔，只记录画面能证明的关系。]),
  ),
  closing: [风经过以后，山没有改变；#linebreak()我们只是更清楚地看见了它。],
  footer-left: [GUIZANG FIELD JOURNAL],
  footer-right: [LOOK · WAIT · RECORD],
) = page(
  width: 1242pt,
  height: 1660pt,
  margin: 0pt,
  fill: field-journal-palette.paper,
)[
  #set text(font: ("Noto Serif SC", "Songti SC"), fill: field-journal-palette.ink)
  #set par(leading: 1.04em)

  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_journal-paper-svg), width: 100%, height: 100%, fit: "stretch"))

    #pad(x: 78pt, top: 62pt, bottom: 48pt)[
      #grid(
        columns: (1fr,),
        rows: (28pt, 244pt, 820pt, 1fr, 28pt),
        row-gutter: 24pt,
        _journal-meta(issue, date),
        grid(
          columns: (1fr, auto),
          column-gutter: 36pt,
          {
            stack(
              spacing: 12pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 12pt,
                weight: 600,
                tracking: 2.6pt,
                fill: field-journal-palette.blue,
                upper(kicker),
              ),
              text(
                font: ("Noto Serif SC", "Songti SC"),
                size: 72pt,
                weight: 500,
                tracking: 4.2pt,
                fill: field-journal-palette.ink,
                title-top,
              ),
              grid(
                columns: (auto, auto),
                column-gutter: 22pt,
                align: bottom,
                text(
                  font: ("Noto Serif SC", "Songti SC"),
                  size: 72pt,
                  weight: 500,
                  tracking: 4.2pt,
                  fill: field-journal-palette.ink,
                  title-prefix,
                ),
                text(
                  font: ("Libertinus Serif",),
                  size: 67pt,
                  style: "italic",
                  weight: 400,
                  fill: field-journal-palette.ink,
                  title-accent,
                ),
              ),
            )
          },
          align(bottom + right)[
            #text(
              font: ("Noto Serif SC", "Songti SC"),
              size: 18pt,
              fill: field-journal-palette.ink-soft,
              subtitle,
            )
          ],
        ),
        block(width: 100%, height: 100%)[
          #grid(
            rows: (1fr, 36pt),
            row-gutter: 12pt,
            block(
              width: 100%,
              height: 100%,
              clip: true,
              stroke: 1pt + field-journal-palette.rule,
              inset: 5pt,
            )[
              #image(hero-image, width: 100%, height: 100%, fit: "cover")
            ],
            grid(
              columns: (1fr, auto),
              text(
                font: ("IBM Plex Mono",),
                size: 11pt,
                weight: 600,
                tracking: 1.8pt,
                fill: field-journal-palette.ink-soft,
                upper(photo-label),
              ),
              text(
                font: ("IBM Plex Mono",),
                size: 11pt,
                weight: 600,
                tracking: 1.8pt,
                fill: field-journal-palette.blue,
                [DAY 01 · COLD LIGHT],
              ),
            ),
          )
        ],
        grid(
          rows: (auto, 1fr),
          row-gutter: 22pt,
          grid(
            columns: notes.len(),
            column-gutter: 26pt,
            align: top,
            ..notes.map(item => _journal-note(item.at(0), item.at(1), item.at(2))),
          ),
          align(bottom)[
            #block(
              width: 100%,
              height: 112pt,
              fill: field-journal-palette.paper-2,
              stroke: (left: 4pt + field-journal-palette.blue),
              inset: (x: 24pt, y: 18pt),
            )[
              #grid(
                columns: (1fr, auto),
                column-gutter: 36pt,
                align: horizon,
                {
                  set par(leading: 0.96em)
                  text(
                    font: ("Noto Serif SC", "Songti SC"),
                    size: 24pt,
                    weight: 500,
                    fill: field-journal-palette.ink,
                    closing,
                  )
                },
                text(
                  font: ("Libertinus Serif",),
                  size: 30pt,
                  style: "italic",
                  fill: field-journal-palette.blue,
                  [weather note.],
                ),
              )
            ]
          ],
        ),
        _journal-meta(footer-left, footer-right),
      )
    ]
  ]
]
