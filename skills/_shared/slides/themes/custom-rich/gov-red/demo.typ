#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: gov-red-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [党建引领高质量发展工作汇报],
    subtitle: [2024年度工作总结与2025年度计划],
    author: [市发展和改革委员会],
    date: datetime.today(),
    institution: [市发展改革委],
  ),
)

#set text(font: ("Noto Sans SC", "Arial"))

// ═══ 封面 ═══

#title-slide()

// ═══ 目录 ═══

#outline-slide(
  title: [目 录],
  (
    [总体概况],
    [重点工作],
    [成果展示],
    [下步计划],
  ),
)

= 总体概况

== 年度核心指标

#stack(
  spacing: .8em,
  [
    #block(height: 95pt)[
      #cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
        #data-card(
          [地区生产总值],
          [1.28万亿],
          accent: palette.red,
        )
      ][
        #data-card(
          [固定资产投资增速],
          [8.6%],
          accent: palette.blue,
        )
      ][
        #data-card(
          [一般公共预算收入],
          [862亿],
          accent: palette.gold,
        )
      ][
        #data-card(
          [城镇新增就业],
          [15.2万人],
          accent: palette.red,
        )
      ]
    ]
  ],
  [
    #achievement-box([年度亮点])[
      全年地区生产总值突破1.28万亿元大关，同比增长7.2%，增速位居全省第一。固定资产投资保持高位增长，民间投资信心持续恢复，经济高质量发展态势稳中向好。
    ]
  ],
)

== 经济运行总览

#cols(columns: (3fr, 2fr))[
  #figure(
    report-table(
      ([指标], [2023年], [2024年], [增幅]),
      (
        ([GDP（亿元）], [11,950], [12,810], [+7.2%]),
        ([规上工业增加值], [4,280], [4,720], [+10.3%]),
        ([社会消费品零售总额], [5,130], [5,580], [+8.8%]),
        ([进出口总额（亿元）], [3,210], [3,650], [+13.7%]),
        ([实际利用外资（亿美元）], [42.5], [48.3], [+13.6%]),
      ),
    ),
  )
][
  #info-box([政策支撑])[
    - 出台助企纾困政策42项
    - 减税降费超120亿元
    - 惠企资金直达率98.5%
    - 营商环境排名提升至全国前十
  ]
]

= 重点工作

== 产业升级与科技创新

#stack(
  spacing: .8em,
  [
    #block(height: 140pt)[
      #cols(columns: (1fr, 1fr), lazy-layout: true)[
        #policy-card(1, [新兴产业培育工程], [
          聚焦新一代信息技术、高端装备制造、新能源三大战略性新兴产业集群，全年新增规上企业186家，高企总量突破3200家。
        ])
      ][
        #policy-card(2, [数字经济发展行动], [
          数字经济核心产业增加值占GDP比重达12.8%，建成5G基站2.3万个，工业互联网平台接入企业超5000家。
        ])
      ]
    ]
  ],
  [
    #block(height: 140pt)[
      #cols(columns: (1fr, 1fr), lazy-layout: true)[
        #policy-card(3, [科技创新攻关计划], [
          全社会研发投入强度达3.2%，新增省级以上创新平台58个，突破关键核心技术26项，技术合同成交额突破800亿元。
        ])
      ][
        #policy-card(4, [人才引进工程], [
          引进高层次人才1200人，新增博士后工作站15个，建成人才公寓1.2万套，人才净流入率连续三年正增长。
        ])
      ]
    ]
  ],
)

== 民生保障与社会治理

#stack(
  spacing: .8em,
  [
    #stat-row(
      (value: [98.5%], label: [基本养老保险覆盖率]),
      (value: [96.2%], label: [基本医疗保险参保率]),
      (value: [42所], label: [新建改扩建学校]),
      (value: [15个], label: [新建社区卫生中心]),
    )
  ],
  [
    #cols(columns: (1fr, 1fr))[
      #achievement-box([教育事业])[
        - 新增学位3.8万个
        - 引进优秀教师1500人
        - 课后服务覆盖率100%
        - 职业教育产教融合基地12个
      ]
    ][
      #achievement-box([医疗卫生])[
        - 新增三甲医院2家
        - 基层医疗机构标准化率95%
        - 远程医疗覆盖所有乡镇
        - 人均预期寿命提高至79.8岁
      ]
    ]
  ],
)

= 成果展示

== 重大项目建设成效

#stack(
  spacing: .8em,
  [
    #block(height: 88pt)[
      #cols(columns: (1fr, 1fr), lazy-layout: true)[
        #data-card([项目完成率], [95.5%], accent: palette.red)
      ][
        #data-card([投资完成额], [1,390亿], accent: palette.blue)
      ]
    ]
  ],
  [
    #figure(
      report-table(
        ([项目类别], [计划], [完成], [投资额]),
        (
          ([交通基础设施], [28], [26], [385亿]),
          ([新型城镇化], [35], [33], [220亿]),
          ([产业升级], [42], [40], [510亿]),
          ([生态环保], [18], [18], [95亿]),
        ),
      ),
    )
  ],
)

== 改革创新亮点

#stack(
  spacing: .8em,
  [
    #block(height: 88pt)[
      #cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
        #data-card([营商环境排名], [全国第8], accent: palette.red)
      ][
        #data-card([行政审批事项精简], [42%], accent: palette.blue)
      ][
        #data-card([政务服务好评率], [99.2%], accent: palette.gold)
      ]
    ]
  ],
  [
    #set text(size: 0.82em)
    #cols(columns: (1fr, 1fr))[
      === 放管服改革

      - *一网通办*：政务服务事项网办率98.3%
      - *一件事一次办*：梳理高频事项186项
      - *跨域通办*：与长三角城市群实现126项互通
      - *智慧监管*：建成综合监管平台覆盖32个部门
    ][
      === 要素市场化改革

      - *土地改革*：工业用地"标准地"出让率85%
      - *资本市场*：新增上市企业12家
      - *数据要素*：建成公共数据开放平台
      - *碳交易*：碳排放权交易额突破5亿元
    ]
  ],
)

== 发展里程碑

#stack(
  spacing: .8em,
  [
    #block(height: 132pt)[
      #cols(columns: (1fr, 1fr), lazy-layout: true)[
        #milestone-item([2024.03], [国家级新区获批], [
          成功获批国家级新区，成为全省第一个、全国第20个国家级新区，标志着城市发展进入新阶段。
        ])
      ][
        #milestone-item([2024.06], [千亿级产业集群], [
          电子信息产业集群产值突破千亿元大关，成为继汽车制造之后第二个千亿级产业集群。
        ])
      ]
    ]
  ],
  [
    #block(height: 132pt)[
      #cols(columns: (1fr, 1fr), lazy-layout: true)[
        #milestone-item([2024.09], [全国文明城市复检], [
          以优异成绩通过全国文明城市复检，连续三届保持全国文明城市荣誉称号。
        ])
      ][
        #milestone-item([2024.12], [地铁三号线开通], [
          地铁三号线正式开通运营，全市轨道交通运营里程突破150公里，日均客运量达180万人次。
        ])
      ]
    ]
  ],
)

= 下步计划

== 2025年重点任务

#stack(
  spacing: .8em,
  [
    #block(height: 195pt)[
      #cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
        #policy-card(1, [经济稳增长], [
          GDP增长目标7%以上，固定资产投资增长8%，消费品零售总额增长9%。
        ])
      ][
        #policy-card(2, [产业强链条], [
          培育3个千亿级产业集群，新增专精特新企业100家，制造业数字化转型率60%。
        ])
      ][
        #policy-card(3, [改革促开放], [
          深化自贸区制度创新，推进营商环境进入全国前五，利用外资增长15%。
        ])
      ][
        #policy-card(4, [民生增福祉], [
          新增就业16万人，新建学校20所，建成保障性住房2万套，可支配收入增长7%。
        ])
      ]
    ]
  ],
  [
    #achievement-box([2025年总体目标])[
      以高质量发展为主题，以改革创新为动力，锚定全年GDP增长7%以上的目标，全力推动经济社会高质量发展再上新台阶。
    ]
  ],
)

#focus-slide[
  _不忘初心 牢记使命_

  #v(0.5em)

  #text(size: 0.6em, weight: "regular")[奋力谱写高质量发展新篇章]
]

#ending-slide[谢谢大家]
