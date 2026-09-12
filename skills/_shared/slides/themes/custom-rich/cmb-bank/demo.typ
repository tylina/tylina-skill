// CMB Bank Theme Demo — 交易银行综合金融服务方案
// Demonstrates all slide types and reusable components

#import "template.typ": *
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("Arial", "Noto Sans SC"), size: 20pt)

#show: cmb-bank-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [招商银行 · 交易银行部],
  config-info(
    title: [交易银行综合金融服务方案],
    subtitle: [Transaction Banking Comprehensive Financial Services],
    author: [招商银行交易银行部],
    institution: [China Merchants Bank],
    date: datetime(year: 2025, month: 6, day: 15),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════

#title-slide()

// ══════════════════════════════════════
// Section 1: 市场洞察
// ══════════════════════════════════════

= 市场洞察

== 宏观经济与银行业趋势

#stack(
  spacing: .8em,
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 0.8em,
    metric-card([GDP增长率], [5.2%], trend: [+0.3%], accent: palette.blue),
    metric-card([社融规模（万亿）], [35.6], trend: [+8.7%], accent: palette.red),
    metric-card([企业贷款需求指数], [71.8], trend: [+2.1], accent: palette.blue),
    metric-card([跨境贸易增速], [6.4%], trend: [+1.2%], accent: palette.red),
  ),
  align(center, lq.diagram(
    width: 90%,
    height: 82pt,
    xaxis: (
      ticks: ((1, [2022]), (2, [2023]), (3, [2024 E]), (4, [2025 E])),
      subticks: none,
    ),
    yaxis: (subticks: none),
    lq.bar(
      (1, 2, 3, 4),
      (3.2, 4.1, 5.0, 5.2),
      width: 0.6,
      fill: palette.red,
    ),
  )),
  cols(
    columns: (1fr, 1fr),
    gutter: 1em,
    lazy-layout: true,
    product-card([数字化转型加速], [
      - 企业线上化交易占比突破 *78%*
      - 供应链金融市场规模达 *36万亿*
      - API银行接口调用量年增 *120%*
    ], accent: palette.red),
    product-card([政策驱动机遇], [
      - 跨境人民币结算便利化持续推进
      - 普惠金融政策引导资金向实体经济倾斜
      - 绿色金融标准体系加速完善
    ], accent: palette.blue),
  ),
)

== 客户需求分析

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  product-card([大型企业], [
    *核心诉求*：集团资金管理、全球现金池、跨境资金池

    _痛点_：账户分散、归集效率低、外汇管理复杂
  ], accent: palette.deep-red),
  product-card([中型企业], [
    *核心诉求*：供应链融资、应收账款管理、票据贴现

    _痛点_：融资渠道有限、账期压力大、信用不足
  ], accent: palette.red),
  product-card([小微企业], [
    *核心诉求*：便捷开户、快速放款、低成本结算

    _痛点_：缺乏抵押物、财务数据不全、融资成本高
  ], accent: palette.signal),
)

// ══════════════════════════════════════
// Section 2: 产品体系
// ══════════════════════════════════════

= 产品体系

== 交易银行核心产品矩阵

#figure(
  fin-table(
    ([产品类别], [核心产品], [目标客群], [年交易规模]),
    (
      ([现金管理], [智能归集·跨行资金池·银企直联], [集团企业], [12,800亿]),
      ([贸易融资], [国内信用证·福费廷·保理], [进出口企业], [5,600亿]),
      ([供应链金融], [应收e·订单融资·存货融资], [核心企业+上下游], [3,200亿]),
      ([跨境金融], [跨境人民币·NRA账户·CIPS直参], [跨国企业], [8,900亿]),
      ([票据业务], [电子商票·票据池·智能贴现], [各类企业], [4,100亿]),
    ),
  )
)

== 智能现金管理方案

#cols(
  columns: (1fr, 1fr),
  gutter: 1em,
  stack(
    spacing: .8em,
    heading(level: 3)[方案架构],
    product-card([资金归集中心], [
      全自动跨行资金归集，支持 *500+* 银行对接，T+0实时到账。
    ], accent: palette.red),
    product-card([支付结算中心], [
      批量代发、智能路由、多通道并行，日均处理 *200万笔*。
    ], accent: palette.blue),
  ),
  stack(
    spacing: .8em,
    heading(level: 3)[关键指标],
    grid(
      columns: (1fr, 1fr),
      gutter: 0.5em,
      metric-card([日均处理量（笔）], [200万], accent: palette.red),
      metric-card([资金归集率], [98.7%], accent: palette.blue),
      metric-card([平均响应时间], [0.3秒], accent: palette.red),
      metric-card([系统可用性], [99.99%], accent: palette.blue),
    ),
  ),
)

== 供应链金融生态

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    product-card([应收账款融资], [
      基于核心企业信用，为上游供应商提供 *T+0* 融资。

      融资利率：*3.2%-4.5%*
      放款时效：*2小时*
    ], accent: palette.red),
    product-card([订单融资], [
      凭采购订单即可申请融资，覆盖生产周期资金缺口。

      授信额度：*50万-5000万*
      线上化率：*100%*
    ], accent: palette.blue),
    product-card([存货融资], [
      基于物联网动态监管，盘活企业存货资产价值。

      质押率：*最高70%*
      监管方式：*智能物联网*
    ], accent: palette.deep-red),
  ),
  process-flow(("核心企业确权", "供应商申请", "智能风控审核", "自动放款", "到期自动回款")),
)

// ══════════════════════════════════════
// Section 3: 客户案例
// ══════════════════════════════════════

= 客户案例

== 案例一：某大型制造集团现金管理

#cols(
  columns: (1fr, 1fr),
  gutter: 1em,
  stack(
    spacing: .8em,
    case-card([客户背景], [
      国内TOP 10制造企业，年营收超 *2000亿元*，下属子公司 *180+* 家，涉及 *15* 家合作银行。
    ]),
    case-card([解决方案], [
      - 搭建三级资金池架构（总部-区域-子公司）
      - 部署跨行资金归集系统，T+0 实时归集
      - 对接ERP系统实现银企直联
    ]),
  ),
  stack(
    spacing: .8em,
    case-card([实施成效], [
      客户实现全集团资金可视化管理，显著提升资金使用效率。
    ]),
    grid(
      columns: (1fr, 1fr),
      gutter: 0.5em,
      metric-card([资金归集效率], [98.5%], accent: palette.blue),
      metric-card([年节省成本], [1.2亿], accent: palette.red),
    ),
  ),
)

== 案例二：跨境电商供应链金融

#cols(
  columns: (1fr, 1fr),
  gutter: 1em,
  stack(
    spacing: .8em,
    case-card([客户背景], [
      某跨境电商平台，年GMV *500亿元*，合作供应商 *3000+* 家，供应商平均账期 *90天*。
    ]),
    case-card([核心挑战], [
      - 供应商多为中小企业，传统融资门槛高
      - 跨境结算涉及多币种，汇率风险管理复杂
    ]),
  ),
  stack(
    spacing: .8em,
    case-card([招行方案], [
      - *应收e平台*：基于交易数据的线上化融资
      - *跨境资金池*：多币种集中管理，智能换汇
      - *数据风控引擎*：对接交易数据实时评估
    ]),
    grid(
      columns: (1fr, 1fr),
      gutter: 0.5em,
      metric-card([融资覆盖率], [72%], accent: palette.blue),
      metric-card([不良率], [0.12%], accent: palette.red),
    ),
  ),
)

// ══════════════════════════════════════
// Section 4: 服务承诺
// ══════════════════════════════════════

= 服务承诺

== 专业服务体系

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
    product-card([专属客户经理], [
      一对一专属服务团队，深度理解行业特性，定制化金融方案。
    ], accent: palette.red),
    product-card([7×24运维保障], [
      全天候系统运维，99.99%可用性，故障30分钟内响应。
    ], accent: palette.deep-red),
    product-card([持续产品迭代], [
      每季度功能升级，年均上线 *200+* 项新功能。
    ], accent: palette.blue),
    product-card([安全合规保障], [
      银行级安全体系，ISO 27001认证，数据加密全覆盖。
    ], accent: palette.red),
  ),
  process-flow(("需求调研", "方案设计", "系统部署", "试运行", "正式上线", "持续优化")),
)

== 合作模式与商务条款

#cols(
  columns: (1fr, 1fr),
  gutter: 1em,
  {
    set std.align(horizon)
    fin-table(
      ([服务项目], [标准版], [旗舰版]),
      (
        ([现金管理], [基础归集+支付], [智能归集+资金池]),
        ([供应链金融], [单一产品], [全链路方案]),
        ([跨境服务], [基础结算], [全球现金管理]),
        ([技术支持], [工作日响应], [7×24专属]),
      ),
    )
  },
  stack(
    spacing: .8em,
    heading(level: 3)[为什么选择招商银行],
    product-card([领先的市场地位], [
      - 连续 *5年* 获评"最佳交易银行"
      - 服务企业客户 *250万+* 家
      - 供应链金融累计投放 *超2万亿*
    ], accent: palette.red),
    product-card([技术驱动创新], [
      - 金融科技研发投入年均 *100亿+*
      - AI风控模型覆盖 *98%* 场景
    ], accent: palette.blue),
  ),
)

// ══════════════════════════════════════
// Ending
// ══════════════════════════════════════

#focus-slide[以客户为中心 · 以数据为驱动]

#ending-slide[感谢聆听 · 携手共赢]
