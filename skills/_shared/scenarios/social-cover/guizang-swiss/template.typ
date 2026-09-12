// Guizang Swiss social carousel
// Four square page types with a single IKB accent and inline-SVG system graphics.

#let swiss-palette = (
  paper: rgb("#fafaf7"),
  ink: rgb("#0a0a0a"),
  grey-1: rgb("#efefeb"),
  grey-2: rgb("#d2d2cc"),
  grey-3: rgb("#6d6d68"),
  accent: rgb("#1239b5"),
  accent-on: rgb("#ffffff"),
)

#let _cover-system-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080">
  <g fill="none" stroke="#ffffff" opacity="0.22">
    <path d="M68 72H1012M68 1008H1012"/>
    <path d="M688 72V1008"/>
    <path d="M704 222H1012M704 532H1012M704 842H1012"/>
  </g>
  <g transform="translate(710 712)">
    <rect x="0" y="0" width="72" height="34" fill="#ffffff" opacity="0.96"/>
    <rect x="80" y="0" width="142" height="34" fill="#ffffff" opacity="0.52"/>
    <rect x="230" y="0" width="72" height="34" fill="#ffffff" opacity="0.22"/>
    <path d="M0 52H302" stroke="#ffffff" stroke-width="2" opacity="0.52"/>
    <path d="M0 45V59M80 45V59M222 45V59M302 45V59" stroke="#ffffff" stroke-width="2" opacity="0.8"/>
  </g>
</svg>
```.text

#let _timeline-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 190">
  <rect x="0" y="58" width="180" height="58" fill="#1239b5"/>
  <rect x="180" y="58" width="360" height="58" fill="#fafaf7" opacity="0.92"/>
  <rect x="540" y="58" width="360" height="58" fill="#1239b5" opacity="0.52"/>
  <path d="M0 142H900" stroke="#fafaf7" stroke-width="2" opacity="0.55"/>
  <path d="M0 132V153M180 132V153M540 132V153M900 132V153" stroke="#fafaf7" stroke-width="3"/>
  <path d="M20 34H868L832 10M868 34L832 58" fill="none" stroke="#1239b5" stroke-width="7"/>
</svg>
```.text

#let _meta(left, right, inverted: false) = {
  let color = if inverted {
    swiss-palette.accent-on.transparentize(28%)
  } else {
    swiss-palette.grey-3
  }
  set text(
    font: ("IBM Plex Mono", "Noto Sans SC"),
    size: 16pt,
    weight: 600,
    tracking: 2.2pt,
    fill: color,
  )
  grid(columns: (1fr, auto), upper(left), upper(right))
}

#let _rule(color: swiss-palette.ink, width: 100%) = {
  line(length: width, stroke: 1.2pt + color)
}

#let _footer(page-number, label, inverted: false) = {
  let color = if inverted {
    swiss-palette.accent-on.transparentize(28%)
  } else {
    swiss-palette.grey-3
  }
  stack(
    spacing: 16pt,
    _rule(color: color.transparentize(35%)),
    grid(
      columns: (1fr, auto),
      text(
        font: ("IBM Plex Mono", "Noto Sans SC"),
        size: 15pt,
        weight: 600,
        tracking: 2pt,
        fill: color,
        upper(label),
      ),
      text(
        font: ("IBM Plex Mono",),
        size: 15pt,
        weight: 600,
        tracking: 2pt,
        fill: color,
        page-number,
      ),
    ),
  )
}

#let swiss-cover(
  meta-left: [MEETING NOTES],
  meta-right: [DECISION FIRST],
  kicker: [A SMALL OPERATING SYSTEM],
  title: [把 60 分钟会议#linebreak()压成 25 分钟],
  number: [25],
  unit: [MIN],
  support: [先写出要做的决定，再决定谁需要出现在房间里。],
  footer: [GUIZANG SWISS · 01],
) = page(
  width: 1080pt,
  height: 1080pt,
  margin: 0pt,
  fill: swiss-palette.accent,
)[
  #set text(font: ("IBM Plex Sans", "Noto Sans SC"), fill: swiss-palette.accent-on)
  #set par(leading: 1.04em)
  #block(width: 100%, height: 100%)[
    #place(top + left, image(bytes(_cover-system-svg), width: 100%, height: 100%, fit: "stretch"))
    #pad(x: 72pt, y: 72pt)[
      #grid(
        columns: (1fr,),
        rows: (28pt, 748pt, 112pt),
        row-gutter: 24pt,
        _meta(meta-left, meta-right, inverted: true),
        grid(
          columns: (63%, 37%),
          column-gutter: 32pt,
          {
            block(height: 748pt)[
              #stack(
                spacing: 30pt,
                text(
                  font: ("IBM Plex Mono", "Noto Sans SC"),
                  size: 18pt,
                  weight: 600,
                  tracking: 3pt,
                  fill: swiss-palette.accent-on.transparentize(28%),
                  upper(kicker),
                ),
                {
                  set par(leading: 0.96em)
                  text(
                    size: 88pt,
                    weight: 300,
                    tracking: -1.2pt,
                    fill: swiss-palette.accent-on,
                    title,
                  )
                },
                block(width: 76pt, height: 5pt, fill: swiss-palette.accent-on),
                text(
                  size: 24pt,
                  weight: 400,
                  fill: swiss-palette.accent-on.transparentize(18%),
                  support,
                ),
              )
            ]
          },
          {
            block(height: 748pt)[
              #grid(
                columns: (1fr,),
                rows: (360pt, 64pt, 324pt),
                align: center,
                text(
                  size: 238pt,
                  weight: 200,
                  tracking: -10pt,
                  fill: swiss-palette.accent-on,
                  number,
                ),
                text(
                  font: ("IBM Plex Mono",),
                  size: 24pt,
                  weight: 600,
                  tracking: 5pt,
                  fill: swiss-palette.accent-on.transparentize(22%),
                  unit,
                ),
                [],
              )
            ]
          },
        ),
        _footer([01 / 04], footer, inverted: true),
      )
    ]
  ]
]

#let _decision-row(number, title, consequence) = {
  block(
    width: 100%,
    height: 160pt,
    fill: swiss-palette.grey-1,
    inset: (x: 28pt, y: 23pt),
  )[
    #grid(
      columns: (94pt, 1fr),
      column-gutter: 22pt,
      align: horizon,
      text(size: 56pt, weight: 200, fill: swiss-palette.accent, number),
      stack(
        spacing: 8pt,
        text(size: 29pt, weight: 500, fill: swiss-palette.ink, title),
        text(size: 21pt, weight: 400, fill: swiss-palette.grey-3, consequence),
      ),
    )
  ]
}

#let swiss-rows(
  meta-left: [CUT THE AGENDA],
  meta-right: [02 / 04],
  kicker: [DELETE BEFORE YOU SCHEDULE],
  title: [先删掉#linebreak()3 类议题],
  rows: (),
  footer: [THE AGENDA IS NOT THE WORK],
) = page(
  width: 1080pt,
  height: 1080pt,
  margin: 0pt,
  fill: swiss-palette.paper,
)[
  #set text(font: ("IBM Plex Sans", "Noto Sans SC"), fill: swiss-palette.ink)
  #set par(leading: 1.05em)
  #pad(x: 72pt, y: 72pt)[
    #grid(
      columns: (1fr,),
      rows: (28pt, 238pt, 518pt, 104pt),
      row-gutter: 16pt,
      _meta(meta-left, meta-right),
      grid(
        columns: (1fr, auto),
        block(height: 238pt)[
          #grid(
            columns: (1fr,),
            rows: (24pt, 198pt),
            row-gutter: 16pt,
            text(
              font: ("IBM Plex Mono", "Noto Sans SC"),
              size: 17pt,
              weight: 600,
              tracking: 2.8pt,
              fill: swiss-palette.grey-3,
              upper(kicker),
            ),
            {
              set par(leading: 0.92em)
              text(size: 86pt, weight: 300, fill: swiss-palette.ink, title)
            },
          )
        ],
        align(horizon, text(size: 176pt, weight: 200, fill: swiss-palette.grey-2, [—])),
      ),
      stack(
        spacing: 17pt,
        ..rows.enumerate().map(((i, item)) => _decision-row(
          ("01", "02", "03", "04").at(i),
          item.at(0),
          item.at(1),
        )),
      ),
      _footer([02 / 04], footer),
    )
  ]
]

#let swiss-timeline(
  meta-left: [25-MINUTE PROTOCOL],
  meta-right: [03 / 04],
  kicker: [ONE MEETING · ONE DECISION],
  title: [25 分钟#linebreak()只推进一个决定],
  steps: (),
  footer: [CONTEXT · OPTIONS · DECISION],
) = page(
  width: 1080pt,
  height: 1080pt,
  margin: 0pt,
  fill: swiss-palette.ink,
)[
  #set text(font: ("IBM Plex Sans", "Noto Sans SC"), fill: swiss-palette.accent-on)
  #set par(leading: 1.04em)
  #pad(x: 72pt, y: 72pt)[
    #grid(
      columns: (1fr,),
      rows: (28pt, 230pt, 218pt, 300pt, 112pt),
      row-gutter: 12pt,
      _meta(meta-left, meta-right, inverted: true),
      stack(
        spacing: 16pt,
        text(
          font: ("IBM Plex Mono", "Noto Sans SC"),
          size: 17pt,
          weight: 600,
          tracking: 2.8pt,
          fill: swiss-palette.accent-on.transparentize(38%),
          upper(kicker),
        ),
        {
          set par(leading: 0.94em)
          text(size: 80pt, weight: 300, fill: swiss-palette.accent-on, title)
        },
      ),
      image(bytes(_timeline-svg), width: 100%, height: 190pt, fit: "stretch"),
      grid(
        columns: (1fr, 2fr, 2fr),
        column-gutter: 22pt,
        ..steps.enumerate().map(((i, item)) => {
          let outcome = if item.len() > 3 {
            item.at(3)
          } else {
            ([OUTPUT · QUESTION], [OUTPUT · OPTIONS], [OUTPUT · OWNER + DUE]).at(i)
          }
          block(
            width: 100%,
            height: 100%,
            stroke: (top: 2pt + if i == 0 { swiss-palette.accent } else { swiss-palette.grey-3 }),
            inset: (top: 20pt),
          )[
            #grid(
              columns: (1fr,),
              rows: (auto, auto, 1fr, auto),
              row-gutter: 11pt,
              text(size: 50pt, weight: 200, fill: if i == 0 { swiss-palette.accent } else { swiss-palette.accent-on }, item.at(0)),
              text(size: 27pt, weight: 500, fill: swiss-palette.accent-on, item.at(1)),
              text(size: 20pt, fill: swiss-palette.accent-on.transparentize(36%), item.at(2)),
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 13pt,
                weight: 600,
                tracking: 1.6pt,
                fill: swiss-palette.accent-on.transparentize(48%),
                upper(outcome),
              ),
            )
          ]
        }),
      ),
      _footer([03 / 04], footer, inverted: true),
    )
  ]
]

#let _ledger-line(label, value) = {
  block(
    width: 100%,
    stroke: (bottom: 1pt + swiss-palette.accent-on.transparentize(55%)),
    inset: (y: 18pt),
  )[
    #grid(
      columns: (160pt, 1fr),
      column-gutter: 22pt,
      text(
        font: ("IBM Plex Mono", "Noto Sans SC"),
        size: 16pt,
        weight: 600,
        tracking: 2pt,
        fill: swiss-palette.accent-on.transparentize(34%),
        upper(label),
      ),
      text(size: 23pt, weight: 500, fill: swiss-palette.accent-on, value),
    )
  ]
}

#let swiss-close(
  meta-left: [DECISION RECORD],
  meta-right: [04 / 04],
  kicker: [THE ONLY VALID ENDING],
  title: [没有决定，#linebreak()不算结束。],
  ledger: (),
  note: [会后只留一张决定记录，#linebreak()背景材料只用于会前。],
  next-label: [NEXT / WITHIN],
  next-action: [发出决定记录],
  next-window: [24H],
  next-note: [让没有到场的人也能看到#linebreak()决定、责任人与期限。],
  footer: [DECIDE · OWN · SHIP],
) = page(
  width: 1080pt,
  height: 1080pt,
  margin: 0pt,
  fill: swiss-palette.paper,
)[
  #set text(font: ("IBM Plex Sans", "Noto Sans SC"), fill: swiss-palette.ink)
  #set par(leading: 1.04em)
  #pad(x: 72pt, y: 72pt)[
    #grid(
      columns: (1fr,),
      rows: (28pt, 756pt, 104pt),
      row-gutter: 24pt,
      _meta(meta-left, meta-right),
      grid(
        columns: (45%, 55%),
        column-gutter: 34pt,
        {
          block(height: 756pt)[
            #stack(
              spacing: 24pt,
              text(
                font: ("IBM Plex Mono", "Noto Sans SC"),
                size: 17pt,
                weight: 600,
                tracking: 2.8pt,
                fill: swiss-palette.grey-3,
                upper(kicker),
              ),
              {
                set par(leading: 0.93em)
                text(size: 91pt, weight: 300, fill: swiss-palette.ink, title)
              },
              block(width: 72pt, height: 6pt, fill: swiss-palette.accent),
              text(size: 22pt, weight: 400, fill: swiss-palette.grey-3, note),
            )
          ]
        },
        block(
          width: 100%,
          height: 756pt,
          fill: swiss-palette.accent,
          inset: (x: 34pt, y: 38pt),
        )[
          #grid(
            columns: (1fr,),
            rows: (auto, auto, 1fr, auto),
            row-gutter: 18pt,
            stack(
              spacing: 8pt,
              text(
                font: ("IBM Plex Mono",),
                size: 15pt,
                weight: 600,
                tracking: 2.6pt,
                fill: swiss-palette.accent-on.transparentize(30%),
                [DECIDED],
              ),
              text(size: 44pt, weight: 300, fill: swiss-palette.accent-on, [会后记录]),
            ),
            stack(
              spacing: 0pt,
              ..ledger.map(item => _ledger-line(item.at(0), item.at(1))),
            ),
            [],
            block(
              width: 100%,
              stroke: (top: 1.2pt + swiss-palette.accent-on.transparentize(42%)),
              inset: (top: 22pt),
            )[
              #grid(
                columns: (1fr, auto),
                column-gutter: 22pt,
                align: bottom,
                stack(
                  spacing: 8pt,
                  text(
                    font: ("IBM Plex Mono", "Noto Sans SC"),
                    size: 13pt,
                    weight: 600,
                    tracking: 1.8pt,
                    fill: swiss-palette.accent-on.transparentize(36%),
                    upper(next-label),
                  ),
                  text(size: 28pt, weight: 500, fill: swiss-palette.accent-on, next-action),
                  text(size: 16pt, fill: swiss-palette.accent-on.transparentize(34%), next-note),
                ),
                text(
                  font: ("IBM Plex Sans",),
                  size: 58pt,
                  weight: 200,
                  tracking: -2pt,
                  fill: swiss-palette.accent-on,
                  next-window,
                ),
              )
            ],
          )
        ],
      ),
      _footer([04 / 04], footer),
    )
  ]
]
