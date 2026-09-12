// Compact adaptation of the published resume-ng starter:
// https://github.com/typst/packages/blob/main/packages/preview/resume-ng/1.0.0/template/main.typ
#import "@preview/resume-ng:1.0.0": *

#show: project.with(
  title: "技术简历",
  author: (name: "林晓"),
  contacts: (
    link("mailto:lin@example.com", "lin@example.com"),
    link("https://example.com", "example.com"),
    "上海",
  ),
)

#resume-section[工作经历]

#resume-work(
  company: "示例科技",
  duty: "机器学习工程师",
  start: "2022.07",
)[
  - 通过批量特征读取与热点路径分析，将检索延迟降低 31\%。
  - 负责多语言排序服务上线，为四个产品团队提供稳定接口。
  - 建立离线评测与线上监控的对应关系，缩短异常定位时间。
]

#resume-work(
  company: "示例数据实验室",
  duty: "算法工程实习生",
  start: "2021.06",
  end: "2022.03",
)[
  - 维护文本去重与难例挖掘流程，整理数据来源、边界与失败案例。
  - 为训练任务补充可复现配置、指标说明与回归测试。
]

#resume-section[项目经历]

#resume-project(
  title: "多语言检索评测基准",
  duty: "设计与维护",
  start: "2024.01",
)[
  - 建立可复现评测流程，记录数据边界、评分方法与失败案例。
  - 设计分语言切片报告，使模型改动可以按场景和误差类型复核。
]

#resume-project(
  title: "检索服务可观测性改造",
  duty: "方案设计与实现",
  start: "2023.04",
  end: "2023.11",
)[
  - 统一延迟、召回率与资源使用指标，补充版本和数据批次标签。
  - 建立回滚检查清单与告警分级，降低发布后的人工排查成本。
]

#resume-project(
  title: "开源文本评测工具",
  duty: "主要维护者",
  start: "2022.09",
)[
  - 提供命令行接口、示例数据和最小测试集，支持本地重复运行。
  - 维护使用文档和问题模板，明确工具适用范围与已知限制。
]

#resume-section[教育经历]

#resume-education(
  university: "示例大学",
  degree: "工学硕士",
  school: "计算机科学与技术",
  start: "2019.09",
  end: "2022.06",
)[
  研究方向：低资源语言检索与高效表示学习。
]

#resume-education(
  university: "示例大学",
  degree: "工学学士",
  school: "软件工程",
  start: "2015.09",
  end: "2019.06",
)[
  主修课程：数据结构、数据库、操作系统、统计学习。
]

#resume-section[技术能力]

- *语言*: Python、Rust、SQL
- *方向*: 检索、评测、模型服务、可观测性
- *工具*: Linux、Git、Docker、Kubernetes、Prometheus

#resume-section[其他经历]

- 维护团队评测手册与发布检查表，组织跨团队复盘和技术分享。
- 工作语言：中文、英语；公开链接与能力等级需在交付前核实。

#resume-section[公开成果]

- 撰写多语言评测实践笔记，说明指标定义、数据边界和复现步骤。
- 为两个开源项目提交测试与文档改进；仓库链接和贡献范围交付前核实。
