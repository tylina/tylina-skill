#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "PingFang SC"))

#show: catarc-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [新能源汽车检测认证技术报告],
    subtitle: [NEV Testing & Certification Technical Report],
    author: [中国汽车技术研究中心],
    date: datetime.today(),
    institution: [CATARC],
  ),
)

// ═══ 封面 ═══

#title-slide()

// ═══ 第一部分：行业概况 ═══

= 行业概况

== 新能源汽车市场数据

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #metric-card([年产量], [958.7万], unit: [辆], accent: palette.tech)
][
  #metric-card([年销量], [949.5万], unit: [辆], accent: palette.bright)
][
  #metric-card([市场渗透率], [31.6%], accent: palette.cyan)
][
  #metric-card([同比增长], [35.8%], accent: palette.red)
]

#v(0.6em)

#highlight-box([行业趋势分析])[
  2024年中国新能源汽车产销双双突破950万辆大关，市场渗透率首次超过30%。纯电动车型占比62%，插电混动及增程式占比38%，市场结构进一步优化。
]

== 技术路线分布

#cols(columns: (3fr, 2fr), lazy-layout: true)[
  #data-table(
    ([技术路线], [市场份额], [同比变化], [代表车型]),
    (
      ([纯电动(BEV)], [62.3%], [+2.1%], [比亚迪、特斯拉]),
      ([插电混动(PHEV)], [28.5%], [+5.3%], [理想、问界]),
      ([增程式(EREV)], [7.8%], [+3.8%], [岚图、零跑]),
      ([氢燃料电池(FCEV)], [0.4%], [+0.2%], [上汽、长城]),
      ([换电车型], [1.0%], [-0.1%], [蔚来]),
    ),
  )
][
  #highlight-box([发展重点])[
    - 插电混动增速领跑市场
    - 增程式技术路线快速崛起
    - 氢燃料电池进入示范推广阶段
    - 固态电池技术取得突破性进展
  ]
]

// ═══ 第二部分：检测标准 ═══

= 检测标准

== 核心检测项目

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #spec-card(1, [动力电池安全检测], [
    依据GB 38031-2020，含热扩散、火烧、机械冲击等8大类42项指标，需通过不起火不爆炸要求。
  ], accent: palette.tech)
][
  #spec-card(2, [整车碰撞安全测试], [
    依据C-NCAP 2024版，覆盖正碰、侧碰、行人保护及主动安全四大维度，新增远端乘员保护。
  ], accent: palette.bright)
]

#v(0.4em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #spec-card(3, [电磁兼容性测试(EMC)], [
    依据GB/T 18387及CISPR 12/25标准，测试电磁辐射发射、传导发射及抗扰度性能。
  ], accent: palette.cyan)
][
  #spec-card(4, [能效与续航验证], [
    依据GB/T 18386.1-2021，采用CLTC工况验证纯电续航里程及百公里电耗等参数。
  ], accent: palette.red)
]

== 标准体系框架

#cols(columns: (3fr, 2fr), lazy-layout: true)[
  #data-table(
    ([标准类别], [标准数量], [2024新增], [覆盖范围]),
    (
      ([安全标准], [28项], [+5项], [电池、碰撞、功能安全]),
      ([性能标准], [22项], [+3项], [续航、能耗、充电]),
      ([EMC标准], [12项], [+2项], [辐射、传导、抗扰]),
      ([环境适应性], [15项], [+4项], [高温、高寒、高原]),
      ([智能网联], [18项], [+8项], [自动驾驶、V2X、OTA]),
    ),
  )
][
  #spec-card(5, [智能网联检测(新增)], [
    2024年新增L2+/L3级自动驾驶功能测试规范，覆盖AEB、LKA、APA等12类ADAS场景，引入仿真+实车联合测试方法。
  ], accent: palette.tech)
]

// ═══ 第三部分：认证成果 ═══

= 认证成果

== 2024年度检测统计

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #metric-card([检测车型总数], [1,286], unit: [款], accent: palette.tech)
][
  #metric-card([一次性通过率], [87.3%], accent: palette.success)
][
  #metric-card([检测报告签发], [4,520], unit: [份], accent: palette.bright)
][
  #metric-card([新增认证企业], [68], unit: [家], accent: palette.red)
]

#v(0.6em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #test-result([GB 38031 动力电池安全], "pass")[
    - 热扩散测试：100%通过，预警均值>8分钟
    - 外部火烧：满足2分钟不起火要求
    - 针刺试验：无热失控占比95.6%
  ]
][
  #test-result([C-NCAP 碰撞安全评价], "pass")[
    - 五星评价车型占比：72.4%（+8.2%）
    - 主动安全平均得分：16.2/18分
    - 行人保护达标率：94.8%
  ]
]

== 典型认证案例

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #test-result([某品牌纯电SUV — 整车认证], "pass")[
    - 续航偏差 < 3%（CLTC工况）
    - 百公里电耗：12.8kWh
    - EMC全项符合
  ]
][
  #test-result([某品牌PHEV轿车 — 排放认证], "pass")[
    - 混动油耗：3.2L/100km
    - 满足国六b RDE标准
    - 蒸发排放48h通过
  ]
]

#v(0.6em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #test-result([某初创品牌 — 电池包测试], "fail")[
    - 热扩散预警时间不足5分钟
    - BMS热管理需优化
    - 已提整改方案，二次送检中
  ]
][
  #test-result([某品牌L2+智驾 — 功能测试], "pass")[
    - AEB成功率：99.2%（含夜间）
    - LKA精度：±0.15m
    - 12类ADAS场景全部达标
  ]
]

// ═══ 第四部分：技术展望 ═══

= 技术展望

== 重点技术方向

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #spec-card(1, [固态电池技术], [
    能量密度>400Wh/kg，循环>1000次。预计2026年量产装车，解决热失控隐患。
  ], accent: palette.tech)
][
  #spec-card(2, [L3+自动驾驶], [
    高速HWP率先落地，城市NOA持续迭代。预计2025年L3法规体系基本建立。
  ], accent: palette.bright)
][
  #spec-card(3, [800V高压平台], [
    充电功率480kW+，5分钟续航200km。碳化硅器件渗透率2025年达30%。
  ], accent: palette.red)
]

#v(0.6em)

#highlight-box([检测能力建设规划])[
  2025年将新建智能网联汽车封闭测试场，配备5G-V2X通信设施；升级电磁兼容暗室至18m法规标准；引入数字孪生仿真平台，实现虚拟认证与实车测试协同验证。
]

== 未来发展路线图

#cols[
  #data-table(
    ([时间节点], [关键里程碑], [影响领域]),
    (
      ([2025 H1], [L3级自动驾驶法规发布], [智能网联]),
      ([2025 H2], [固态电池检测标准制定], [动力电池]),
      ([2026], [800V充电互操作标准], [充电基础设施]),
      ([2026], [V2X车路协同测试规范], [智慧交通]),
      ([2027], [碳足迹认证体系建立], [绿色制造]),
    ),
  )
][
  #metric-card([2025年检测目标], [1,500+], unit: [款车型], accent: palette.tech)

  #highlight-box([战略目标])[
    - 建成世界一流汽车检测认证机构
    - 主导制定3项以上国际标准
    - 智能网联测试能力覆盖L4级
    - 检测效率提升30%（数字化赋能）
  ]
]

#focus-slide[
  _"推动中国汽车产业高质量发展"_

  #text(size: 0.6em, weight: "regular")[— 中国汽车技术研究中心]
]

#ending-slide[感谢聆听]
