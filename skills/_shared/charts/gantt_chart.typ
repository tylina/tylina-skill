#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/merman:0.1.0": show-mermaid-blocks

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 100%)

== 项目进度甘特图

#figure[
  ```mermaid
    gantt
    title Project Schedule 2025 H1
    dateFormat YYYY-MM-DD
    axisFormat %m-%d

    section Planning
    Requirements Analysis : req, 2025-01-06, 21d
    Requirements Review   : milestone, m1, 2025-01-27, 0d

    section Design
    Product Design  : des, 2025-01-20, 35d
    UI/UX Design    : uix, 2025-02-10, 35d
    Design Review   : milestone, m2, 2025-03-17, 0d

    section Development
    Frontend Dev    : fe, 2025-02-10, 56d
    Backend Dev     : be, 2025-02-10, 70d

    section Testing
    QA Testing      : qa, 2025-04-21, 42d
    Deployment      : dep, 2025-06-02, 14d
    Go Live         : milestone, m3, 2025-06-16, 0d

    section Operations
    Marketing Launch : mkt, 2025-06-02, 35d
  ```

  #align(right)[2025年上半年 · 产品发布项目]
]
