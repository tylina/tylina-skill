// ===============================================================
// HUST Vietnam Theme Demo
// Universe package: @preview/touying-ppt-hustvn:0.1.0
// Touying version: 0.6.1
// Theme for Hanoi University of Science and Technology (HUST)
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-ppt-hustvn:0.1.0": *
#import "@preview/mitex:0.2.7": *

#show: hust-theme.with(
  aspect-ratio: "16-9",
  theme: "red",
  lang: "en",
  font: ("Arial",),
  config-common(breakable: false),
  config-info(
    title: [Machine Learning for Smart Manufacturing],
    subtitle: [School of Information and Communication Technology],
    author: [Dr. Tran Minh Duc],
    date: datetime.today(),
    institution: [Hanoi University of Science and Technology],
  ),
)

// ---- Title Slide ----

#title-slide()

// ---- Section 1: Introduction ----

= Introduction

== Research Motivation

Smart manufacturing requires intelligent systems that can:

- *Monitor* production quality in real time
- *Predict* equipment failures before they occur
- *Optimize* resource allocation across production lines
- *Adapt* to changing manufacturing conditions

Vietnam's Industry 4.0 strategy demands advanced AI solutions for the
manufacturing sector.

== Problem Formulation

Given a set of sensor readings #mi(`\mathbf{x}_t \in \mathbb{R}^d`) at time #mi(`t`), we aim to
predict the equipment state #mi(`y_{t+h}`) at horizon #mi(`h`):

#mitex(`\hat{y}_{t+h} = f_\theta(\mathbf{x}_t, \mathbf{x}_{t-1}, \ldots, \mathbf{x}_{t-w+1})`)

where #mi(`w`) is the lookback window and #mi(`\theta`) are learnable parameters.

The objective is to minimize the prediction error:

#mitex(`\min_\theta \mathbb{E} \left[ \|y_{t+h} - \hat{y}_{t+h}\|^2 \right]`)

// ---- Section 2: Methodology ----

= Proposed Approach

== System Architecture

Our predictive maintenance framework consists of:

+ *Data Collection Module* — IoT sensors on CNC machines and assembly robots
+ *Feature Engineering Pipeline* — time-frequency decomposition and statistical aggregation
+ *Deep Learning Predictor* — temporal convolutional network with attention
+ *Decision Support Dashboard* — real-time alerts and maintenance scheduling

== Model Design

The temporal convolutional network processes sequential sensor data:

#mitex(`\mathbf{h}_t = \text{TCN}(\mathbf{x}_{t-w+1:t})`)

#mitex(`\hat{y}_{t+h} = \text{MLP}(\text{Attention}(\mathbf{h}_t))`)

Key advantages over recurrent models:
- Parallelizable training (no sequential dependency)
- Stable gradients via residual connections
- Flexible receptive field via dilated convolutions

== Training Strategy

We employ a multi-task learning objective:

#mitex(`\mathcal{L} = \underbrace{\mathcal{L}_{\text{pred}}}_{\text{prediction}} + \lambda_1 \underbrace{\mathcal{L}_{\text{recon}}}_{\text{reconstruction}} + \lambda_2 \underbrace{\mathcal{L}_{\text{cont}}}_{\text{contrastive}}`)

- #mi(`\mathcal{L}_{\text{pred}}`): MSE loss for failure prediction
- #mi(`\mathcal{L}_{\text{recon}}`): Autoencoder reconstruction for representation learning
- #mi(`\mathcal{L}_{\text{cont}}`): Contrastive loss for distinguishing normal vs. anomalous states

// ---- Section 3: Experiments ----

= Experimental Results

== Dataset Description

Experiments are conducted on both public and in-house datasets:

#table(
  columns: (1fr, auto, auto, auto),
  align: (left, center, center, center),
  table.header(
    [*Dataset*], [*Sensors*], [*Duration*], [*Failures*],
  ),
  [HUST-CNC Lab], [48], [6 months], [127],
  [NASA C-MAPSS], [21], [—], [100 units],
  [SECOM (UCI)], [591], [—], [104],
)

== Performance Comparison

Our method outperforms baselines across all metrics:

- *HUST-CNC Lab*: Precision #mi(`= 0.934`), Recall #mi(`= 0.921`), #mi(`F_1 = 0.927`)
- *NASA C-MAPSS*: RMSE #mi(`= 12.3`) cycles (vs. 15.8 baseline)
- *SECOM*: AUC #mi(`= 0.891`) (vs. 0.847 best baseline)

Early detection rate: #mi(`87\%`) of failures detected #mi(`\geq 24`) hours in advance.

== Ablation Study

Impact of each loss component on HUST-CNC Lab #mi(`F_1`) score:

- Full model: #mi(`\mathbf{0.927}`)
- Without #mi(`\mathcal{L}_{\text{cont}}`): #mi(`0.903`) (#mi(`-2.6\%`))
- Without #mi(`\mathcal{L}_{\text{recon}}`): #mi(`0.889`) (#mi(`-4.1\%`))
- Prediction only: #mi(`0.861`) (#mi(`-7.1\%`))

Both auxiliary losses contribute significantly to final performance.

// ---- Section 4: Conclusion ----

= Conclusion

== Summary and Future Directions

*Contributions:*
+ A multi-task deep learning framework for predictive maintenance
+ Validated on real HUST manufacturing lab data
+ Achieves #mi(`87\%`) early detection rate for equipment failures

*Future work:*
- Deploy to HUST's pilot smart factory facility
- Extend to multi-machine coordinated maintenance
- Incorporate digital twin simulation for training data augmentation

== Acknowledgments

- HUST School of ICT for laboratory access
- Vietnam National Foundation for Science and Technology (NAFOSTED)
- Industrial partners: Vingroup and FPT Software

#ending-slide(title: [Thank You!])
