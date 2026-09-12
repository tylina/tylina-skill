#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: navy-formal-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Machine Learning for Medical Image Analysis:\ A Deep Learning Approach],
    subtitle: [Doctoral Thesis Defense],
    author: [Dr. Sarah Chen],
    date: datetime.today(),
    institution: [School of Computer Science, Tsinghua University],
  ),
)

#set text(font: ("IBM Plex Serif", "Noto Serif SC"))

// ═══ Cover Page ═══

#title-slide()

// ═══ Outline ═══

#outline-slide(title: [Presentation Outline])

// ═══ Chapter 1: Introduction ═══

= Research Background

== Research Motivation

#cols(columns: (3fr, 2fr))[
  === The Challenge

  Medical image analysis faces critical bottlenecks:

  - *Volume*: 3.6B+ medical images produced annually
  - *Shortage*: Radiologist workforce growing at only 2%/year
  - *Error Rate*: Diagnostic errors of 3--5% in radiology
  - *Delay*: 24--48h turnaround for imaging reports
  #source-footer[WHO Global Report on Medical Imaging, 2023]
][
  #stack(
    spacing: .8em,
    highlight-box([Key Insight])[
      Deep learning can achieve *radiologist-level accuracy* while reducing turnaround from hours to seconds.
    ],
    theorem-box([Research Hypothesis])[
      A multi-scale attention-based CNN can outperform existing methods across three imaging modalities (CT, MRI, X-ray).
    ],
  )
]

== Research Objectives

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
    #method-card(1, [Detection], [
      Develop automated pathology detection for lung CT, brain MRI, and chest X-ray with AUC > 0.95.
    ])
  ][
    #method-card(2, [Segmentation], [
      Achieve sub-millimeter accuracy in tumor boundary segmentation using multi-scale feature fusion.
    ])
  ][
    #method-card(3, [Interpretability], [
      Build attention-based visualization for clinical decision support and model transparency.
    ])
  ],
  source-footer[Research funded by NSFC Grant No. 62176142],
)

= Methodology

== Proposed Architecture

#cols(columns: (1fr, 1fr))[
  MSA-Net consists of four key modules:

  + *Feature Backbone* — ResNet-152 pretrained on ImageNet
  + *Multi-Scale FPN* — Features at 4 resolution levels
  + *Cross-Attention* — Inter-scale feature relationships
  + *Task Heads* — Detection, segmentation, classification
][
  #theorem-box([Cross-Attention Mechanism])[
    Given feature maps #mi(`F_i`) at scale #mi(`i`):

    #mitex(`\text{CA}(F_i, F_j) = \text{softmax}\left(\frac{(W_Q F_i)(W_K F_j)^T}{\sqrt{d_k}}\right) W_V F_j`)

    where #mi(`W_Q`), #mi(`W_K`), #mi(`W_V`) are learnable projections and #mi(`d_k`) is the key dimension.
  ]
]

== Training Strategy

#figure[
  #stack(
    spacing: .8em,
    comparison-table(
      ([Parameter], [Stage 1: Pretrain], [Stage 2: Fine-tune], [Stage 3: Joint]),
      (
        ([Learning Rate], [#mi(`1 \times 10^{-3}`)], [#mi(`5 \times 10^{-5}`)], [#mi(`1 \times 10^{-5}`)]),
        ([Batch / Epochs], [64 / 100], [16 / 50], [8 / 30]),
        ([Loss], [Cross-Entropy], [Dice + Focal], [Multi-task Weighted]),
        ([Augmentation], [Standard], [Medical-specific], [Mixup + CutMix]),
      ),
    ),
    source-footer[PyTorch 2.1 | AdamW optimizer | 8#mi(`\times`)NVIDIA A100 GPUs | ~72h total training],
  )
]


= Experimental Results

== Detection Performance

#cols(columns: (3fr, 2fr))[
  #comparison-table(
    columns: (1.55fr, 1fr, 1fr, 1fr, 1fr),
    ([Method], [Lung CT\ AUC], [Brain MRI\ AUC], [Chest X-ray\ AUC], [Avg]),
    (
      ([ResNet-50], [0.891], [0.873], [0.901], [0.888]),
      ([DenseNet-121], [0.903], [0.885], [0.912], [0.900]),
      ([EfficientNet-B7], [0.921], [0.908], [0.925], [0.918]),
      ([ViT-Large], [0.934], [0.917], [0.931], [0.927]),
      ([*MSA-Net (Ours)*], [*0.962*], [*0.948*], [*0.957*], [*0.956*]),
    ),
  )
][
  #highlight-box([Key Result])[
    MSA-Net achieves *state-of-the-art* performance across all three modalities:

    - *+2.9%* over ViT-Large on average AUC
    - *Lung CT*: 96.2% AUC (new SOTA)
    - *Brain MRI*: 94.8% AUC (new SOTA)
    - Statistically significant (#mi(`p < 0.001`))
  ]
]

== Segmentation Results

#cols[
  #stack(
    spacing: .8em,
    comparison-table(
      ([Method], [Dice], [IoU], [HD95 (mm)]),
      (
        ([U-Net], [0.847], [0.761], [4.82]),
        ([Attention U-Net], [0.871], [0.789], [3.95]),
        ([TransUNet], [0.893], [0.814], [3.21]),
        ([*MSA-Net (Ours)*], [*0.921*], [*0.857*], [*2.34*]),
      ),
    ),
    source-footer[BraTS 2023 Challenge Dataset],
  )
][
  #stack(
    spacing: .8em,
    theorem-box([Clinical Agreement])[
      MSA-Net vs expert radiologists:

      - *Cohen's kappa*: #mi(`\kappa = 0.89`) (almost perfect)
      - *Intraclass Correlation*: ICC = 0.94
      - *Bland-Altman bias*: 0.12 mm (#mi(`\pm`) 1.03 mm)
    ],
    highlight-box([Clinical Impact])[
      Reduced diagnosis time from *23 min* to *47 sec* per case.
    ],
  )
]

== Ablation Study

#cols(columns: (3fr, 2fr))[
  #comparison-table(
    ([Configuration], [AUC], [#mi(`\Delta`)]),
    (
      ([Baseline (ResNet-152)], [0.912], [--]),
      ([+ Multi-Scale FPN], [0.931], [+1.9%]),
      ([+ Cross-Attention], [0.948], [+3.6%]),
      ([+ Medical Augmentation], [0.953], [+4.1%]),
      ([+ Multi-task Learning], [0.956], [+4.4%]),
    ),
  )
][
  #theorem-box([Analysis])[
    Each component contributes positively:

    - *Cross-attention* provides the largest single improvement (+1.7%)
    - *Multi-scale FPN* is essential for small lesion detection
    - *Multi-task learning* provides modest but consistent gains through shared representations
  ]
]

= Discussion

== Comparison with Existing Work

#cols[
  #highlight-box([Strengths])[
    - *Multi-modal*: Handles CT, MRI, X-ray
    - *Interpretable*: Attention maps for explanations
    - *Efficient*: 3.2#mi(`\times`) faster than ViT-Large
    - *Robust*: Consistent across institutions
  ]
][
  #stack(
    spacing: .8em,
    theorem-box([Limitations])[
      - Requires 8#mi(`\times`)A100 GPUs (72h training)
      - Limited performance on rare pathologies
      - 3D volumetric processing needs high memory
    ],
    method-card(1, [Future Direction], [
      Federated learning across hospitals to expand data while preserving privacy.
    ]),
  )
]

== Contributions Summary

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), lazy-layout: true)[
    #method-card(1, [Novel Architecture], [
      First multi-scale cross-attention network for unified medical image analysis.
    ])
  ][
    #method-card(2, [SOTA Results], [
      New SOTA on BraTS 2023, ChestX-ray14, and LUNA16 (AUC 0.956).
    ])
  ],
  cols(columns: (1fr, 1fr), lazy-layout: true)[
    #method-card(3, [Clinical Validation], [
      Large-scale study (N=2,847) with radiologist-level agreement (#mi(`\kappa`)=0.89).
    ])
  ][
    #method-card(4, [Open-Source Release], [
      Code, pretrained weights, and evaluation toolkit for reproducibility.
    ])
  ],
)

= Publications

== Published Papers

#figure[
  #stack(
    spacing: .8em,
    comparison-table(
      columns: (0.45fr, 2.8fr, 1fr, 0.75fr, 1fr),
      compact: true,
      ([No.], [Title], [Venue], [Year], [Status]),
      (
        ([1], [MSA-Net: Multi-Scale Attention for Medical Imaging], [IEEE TMI], [2024], [Published]),
        ([2], [Cross-Attention Feature Fusion for Tumor Segmentation], [MICCAI], [2024], [Published]),
        ([3], [Federated Medical Image Analysis: A Survey], [Nature MI], [2023], [Published]),
        ([4], [Clinical Validation of AI-Assisted Diagnosis], [Radiology], [2024], [In Review]),
        ([5], [Efficient Multi-Modal Medical Image Analysis], [CVPR], [2025], [Submitted]),
      ),
    ),
    highlight-box([Research Impact])[
      Citations: *127* | H-index: *5* | 2 *Editor's Choice* papers in IEEE TMI
    ],
  )
]

// ═══ Focus Slide ═══

#focus-slide[
  #stack(
    spacing: .8em,
    [
      _"The goal is not to replace radiologists,\
      but to empower them with AI tools\
      that enhance diagnostic accuracy and efficiency."_
    ],
    text(size: 0.6em, weight: "regular")[— Dr. Sarah Chen, Thesis Defense 2024],
  )
]

// ═══ Ending Slide ═══

#ending-slide[Thank You for Your Attention]
