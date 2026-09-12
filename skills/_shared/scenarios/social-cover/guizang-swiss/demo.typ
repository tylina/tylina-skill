#import "template.typ": *

#swiss-cover(
  kicker: [A SMALL OPERATING SYSTEM],
  title: [把 60 分钟会议#linebreak()压成 25 分钟],
  number: [25],
  unit: [MIN],
  support: [先写出要做的决定，再决定谁需要出现在房间里。],
)

#swiss-rows(
  title: [先删掉#linebreak()3 类议题],
  rows: (
    ([不需要共同判断], [只同步状态的内容，改成异步更新。]),
    ([没有备选方案], [只有背景、没有选项，就先补材料。]),
    ([没有明确责任人], [没人能接住结果，就不要占用集体时间。]),
  ),
)

#swiss-timeline(
  title: [25 分钟#linebreak()只推进一个决定],
  steps: (
    ([00—05], [对齐问题], [明确今天的决定。], [OUTPUT · QUESTION]),
    ([05—15], [比较选项], [只讨论差异、代价与不可逆点。], [OUTPUT · OPTIONS]),
    ([15—25], [写下决定], [指定责任人、截止时间和复盘条件。], [OUTPUT · OWNER + DUE]),
  ),
)

#swiss-close(
  title: [没有决定，#linebreak()不算结束。],
  ledger: (
    ([DECISION], [选择哪一个方案]),
    ([OWNER], [谁负责把它推进]),
    ([DUE], [何时交付或复盘]),
  ),
  note: [会后只留一张决定记录，#linebreak()背景材料只用于会前。],
  next-label: [NEXT / WITHIN],
  next-action: [发出决定记录],
  next-window: [24H],
  next-note: [让没有到场的人也能看到#linebreak()决定、责任人与期限。],
)
