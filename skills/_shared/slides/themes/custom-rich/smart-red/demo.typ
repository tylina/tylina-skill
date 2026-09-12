// SmartCampus 3.0 — Intelligent Education Solution
// Demo presentation using the Smart-Red theme
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/cheq:0.4.0": checklist
#import "@preview/lilaq:0.6.0" as lq

#set text(font: ("IBM Plex Sans", "Noto Sans SC"))
#show: checklist.with(stroke: palette.red, radius: 0.2em)

#show: smart-red-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [SmartCampus 3.0 | Confidential],
  config-info(
    title: [SmartCampus 3.0],
    subtitle: [Intelligent Education Solution for the Future],
    author: [EduTech Innovation Group],
    institution: [SmartEdu Technologies Inc.],
    date: datetime(year: 2025, month: 7, day: 15),
  ),
)

// ═══ Slide 1: Title Slide ═══
#title-slide()

// ═══ Slide 2: Vision — Section Divider ═══
= Vision

// ═══ Slide 3: Our Vision ═══
== Our Vision

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.5em, lazy-layout: true,
    highlight-box([Mission Statement], [
      To empower every educator and learner through intelligent technology, creating an inclusive, data-driven, and personalized campus experience that prepares students for the challenges of tomorrow.
    ]),
    highlight-box([Strategic Goal 2025], [
      Deploy SmartCampus 3.0 across 500+ institutions nationwide, serving over 2 million students and 100,000 educators with AI-powered tools and analytics.
    ]),
  ),
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    metric-card([Institutions Served], [320+], trend: [↑ 45% YoY], accent: palette.red),
    metric-card([Active Students], [1.2M], trend: [↑ 68% YoY], accent: palette.orange),
    metric-card([Satisfaction Rate], [96.8%], trend: [↑ 3.2%], accent: palette.red),
  ),
)

// ═══ Slide 4: Market Landscape ═══
#slide(title: [Market Landscape], align: top)[
  #grid(
    columns: (9fr, 11fr),
    gutter: 1.2em,
    align: top,
    [
      #stack(
        spacing: 0.8em,
        text(weight: "bold", fill: palette.text-dark, size: 0.82em)[Industry Trends],
        [
          #set text(size: 0.72em)
          - *AI in Education* market projected to reach \$25.7B by 2030
          - *78%* of universities plan digital transformation by 2026
          - *Hybrid learning* adoption increased 340% post-pandemic
          - Government policy mandates smart campus infrastructure
        ],
        highlight-box([Key Insight], [
          Institutions adopting integrated platforms report 42% improvement in student outcomes and 35% reduction in admin overhead.
        ]),
      )
    ],
    [
      #stack(
        spacing: 0.8em,
        figure(data-table(
          text-size: 0.68em,
          cell-inset: (x: 0.45em, y: 0.22em),
          ([Region], [Market Size], [Growth], [Penetration]),
          (
            ([East China], [¥8.2B], [+32%], [High]),
            ([South China], [¥5.6B], [+28%], [Medium]),
            ([North China], [¥6.1B], [+35%], [High]),
            ([Central], [¥3.4B], [+41%], [Low]),
            ([West China], [¥2.1B], [+52%], [Low]),
          ),
        )),
        [
          #set text(size: 0.62em)
          #lq.diagram(
            width: 96%,
            height: 105pt,
            xaxis: (
              lim: (0.5, 5.5),
              label: [Region],
              ticks: ((1, [East]), (2, [North]), (3, [South]), (4, [Central]), (5, [West])),
              subticks: none,
            ),
            yaxis: (
              lim: (0, 10),
              label: [Market Size (¥B)],
              ticks: (0, 2, 4, 6, 8, 10),
              subticks: none,
            ),
            lq.bar(
              (1, 2, 3, 4, 5),
              (8.2, 6.1, 5.6, 3.4, 2.1),
              width: 0.6,
              fill: palette.red,
            ),
          )
        ],
      )
    ],
  )
]

// ═══ Slide 5: Core Features — Section Divider ═══
= Core Features

// ═══ Slide 6: Platform Overview ═══
== Platform Overview

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    feature-card(1, [AI Learning Engine], [
      Adaptive learning paths powered by deep learning. Personalized content recommendation.
    ]),
    feature-card(2, [Smart Classroom], [
      IoT-enabled classrooms with automated attendance and whiteboard integration.
    ]),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    feature-card(3, [Campus IoT Network], [
      Unified sensor mesh for energy, safety, and access control. Sub-second edge response.
    ]),
    feature-card(4, [Data Analytics Hub], [
      Dashboards for administrators. Predictive analytics for enrollment and retention.
    ]),
  ),
)

// ═══ Slide 7: AI Learning Engine Deep Dive ═══
#slide(title: [AI Learning Engine], align: top)[
#cols[
  #stack(
    spacing: 0.8em,
    product-card([Adaptive Learning Paths], [
      AI analyzes learning behaviors across 50+ dimensions to generate personalized study plans for each student.
    ]),
    product-card([Intelligent Assessment], [
      Auto-generated quizzes with difficulty calibration. Real-time feedback to identify struggling students.
    ]),
  )
][
  #stack(
    spacing: 0.8em,
    text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Performance Metrics],
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      metric-card([Accuracy Rate], [94.2%], accent: palette.red),
      metric-card([Score Lift], [+18.5%], accent: palette.orange),
    ),
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      metric-card([Engagement], [3.2x], accent: palette.red),
      metric-card([Time Saved], [40%], accent: palette.orange),
    ),
  )
]
]

// ═══ Slide 8: Smart Classroom Solution ═══
== Smart Classroom

#cols[
  #stack(
    spacing: 0.8em,
    highlight-box([Next-Gen Classroom], [
      Blend physical and digital learning environments. Smart Classroom integrates sensors, cloud computing, and AI for immersive, efficient teaching.
    ]),
    [
      #set text(size: 0.9em)
      *Key Capabilities:*
      - Facial recognition attendance (99.7% accuracy)
      - Auto-adjusting lighting & temperature via IoT
      - Multi-screen casting and collaborative whiteboards
      - Real-time student engagement scoring
      - Lecture auto-recording with AI transcription
    ],
  )
][
  #figure[
    #data-table(
      ([Feature], [Benefit], [ROI]),
      (
        ([Auto Attendance], [Save 5 min/class], [120h/yr]),
        ([Smart HVAC], [30% energy saving], [¥50K/yr]),
        ([AI Transcription], [Full lecture capture], [High]),
        ([Engagement AI], [Early intervention], [+15% pass]),
        ([Screen Sharing], [Seamless collab], [High]),
      ),
    )
  ]
]

// ═══ Slide 9: Focus — Key Message ═══
#focus-slide()[
  #stack(
    spacing: 0.8em,
    [_"Education is not the filling of a pail,\
    but the lighting of a fire."_],
    text(size: 0.5em, weight: "regular")[— W.B. Yeats],
  )
]

// ═══ Slide 10: Technical Architecture — Section Divider ═══
= Technical Architecture

// ═══ Slide 11: System Architecture ═══
== System Architecture

#cols[
  #stack(
    spacing: 0.8em,
    feature-card(1, [Edge Layer], [
      10,000+ IoT sensors and edge gateways per campus. \<10ms latency for critical operations.
    ]),
    feature-card(2, [Platform Layer], [
      Kubernetes microservices on hybrid cloud. Auto-scaling for 100K+ concurrent users.
    ]),
  )
][
  #stack(
    spacing: 0.8em,
    feature-card(3, [Intelligence Layer], [
      GPU-accelerated ML pipeline. Models for NLP, computer vision, and prediction.
    ]),
    feature-card(4, [Application Layer], [
      Modular SaaS apps with open API. EdTech protocols (LTI, xAPI) integration.
    ]),
  )
]

// ═══ Slide 12: Technology Stack ═══
#slide(title: [Technology Stack], align: top)[
  #figure[
    #data-table(
      text-size: 0.76em,
      cell-inset: (x: 0.6em, y: 0.35em),
      ([Layer], [Technology], [Purpose], [Scale]),
      (
        ([Frontend], [React + Flutter], [Cross-platform apps], [Web + iOS + Android]),
        ([Backend], [Go + gRPC], [High-perf microservices], [100K req/s]),
        ([AI/ML], [PyTorch + TensorRT], [Model training & inference], [8x A100 GPU cluster]),
        ([Database], [PostgreSQL + Redis + ClickHouse], [OLTP + Cache + Analytics], [10TB+]),
        ([Infrastructure], [K8s + Terraform], [Container orchestration], [Multi-cloud]),
        ([Security], [Zero Trust + mTLS], [End-to-end encryption], [SOC2 compliant]),
      ),
    )
  ]
]

// ═══ Slide 13: Implementation Plan — Section Divider ═══
= Implementation Plan

// ═══ Slide 14: Rollout Phases ═══
== Rollout Phases

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  phase-card([PHASE 1], [Foundation], [Q3 2025], [
      - Infrastructure setup\
      - Core platform deploy\
      - Pilot: 10 schools\
      - Staff training
    ], accent: palette.red),
  phase-card([PHASE 2], [Expansion], [Q4 2025], [
      - AI module activation\
      - IoT sensor rollout\
      - Scale to 50 schools\
      - Feedback integration
    ], accent: palette.orange),
  phase-card([PHASE 3], [Optimization], [Q1 2026], [
      - Advanced analytics\
      - Predictive models\
      - 200+ schools live\
      - API marketplace
    ], accent: palette.red),
  phase-card([PHASE 4], [Full Scale], [Q2-Q3 2026], [
      - 500+ institutions\
      - National coverage\
      - Ecosystem partners\
      - Continuous AI updates
    ], accent: palette.orange),
)

// ═══ Slide 15.5: Deployment Checklist ═══
#slide(title: [Deployment Readiness], align: top)[
  #stack(
    spacing: 0.8em,
    highlight-box([Phase 1 Go-Live Checklist], [
      Confirm all items before pilot launch with the first 10 schools.
    ]),
    [
      - [x] Cloud infrastructure provisioned and load testing passed
      - [x] Data privacy compliance audit (MLPS 2.0) completed
      - [/] IoT sensor hardware shipped and on-site installation underway
      - [/] Teacher and administrator training curriculum finalised
      - [ ] AI Learning Engine personalisation models calibrated for pilot cohort
      - [ ] Parent consent collection workflow deployed and sign-off rate above 90%
    ],
  )
]

// ═══ Slide 15: Investment & Returns ═══
== Investment & Returns

#cols[
  #stack(
    spacing: 0.8em,
    text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Cost Structure per Institution],
    figure(data-table(
      ([Item], [Cost], [Period]),
      (
        ([Platform License], [¥280K], [Annual]),
        ([IoT Hardware], [¥150K], [One-time]),
        ([Implementation], [¥120K], [One-time]),
        ([Training & Support], [¥60K], [Annual]),
        ([*Total Year 1*], [*¥610K*], [—]),
      ),
    )),
  )
][
  #stack(
    spacing: 0.8em,
    text(weight: "bold", fill: palette.text-dark, size: 0.95em)[Expected Returns],
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      metric-card([Payback Period], [14 months], accent: palette.red),
      metric-card([3-Year ROI], [285%], accent: palette.orange),
    ),
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      metric-card([Admin Cost Cut], [-35%], accent: palette.red),
      metric-card([Energy Savings], [¥180K/yr], accent: palette.orange),
    ),
  )
]

// ═══ Slide 16: Ending Slide ═══
#ending-slide()[Thank You]
