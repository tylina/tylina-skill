// Copper Circuit Theme Demo — NexBoard IoT Platform
// Smart sensor hardware product presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Arial", size: 20pt)

#show: copper-circuit-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [NexBoard Engineering Summit 2026 -- Hardware Division],
  config-info(
    title: [NexBoard IoT Platform],
    subtitle: [Next-Generation Smart Sensor Hardware Architecture],
    author: [Dr. Marcus Chen],
    institution: [NexBoard Technologies -- Hardware Engineering Division],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Outline
// ══════════════════════════════════════
#outline-slide()

// ══════════════════════════════════════
// Section 1: Platform Architecture
// ══════════════════════════════════════
= Platform Architecture

== System Overview

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  ic-card([Core MCU -- NXB-7200], [
    ARM Cortex-M7 based system-on-chip with integrated sensor hub:

    *Key Features*:
    - 480 MHz clock, 1MB SRAM
    - Hardware FPU + DSP extensions
    - 12-bit ADC (16 channels)
    - Integrated BLE 5.3 radio
    - Ultra-low power: 3.2 uA sleep
  ], accent: palette.copper),
  ic-card([Sensor Fusion Engine], [
    Dedicated co-processor for real-time multi-sensor fusion:

    *Capabilities*:
    - 9-DOF IMU processing at 1 kHz
    - Kalman filter (hardware-accelerated)
    - Environmental compensation
    - AI inference engine (INT8, 128 TOPS/W)
    - Configurable data pipeline
  ], accent: palette.gold-pin),
)


#trace-box([Design Philosophy], [
  All inter-board communication uses a 40-pin high-density connector with SPI, I2C, UART, and analog channels.
], accent: palette.copper)

== Technical Specifications

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pad-stat([480 MHz], [Clock Speed], accent: palette.copper),
  pad-stat([3.2 uA], [Sleep Current], accent: palette.solder),
  pad-stat([16 CH], [ADC Inputs], accent: palette.gold-pin),
  pad-stat([128 TOPS/W], [AI Efficiency], accent: palette.via),
)

#v(0.5em)

#figure[
  #datasheet-table(
    ([Parameter], [Min], [Typ], [Max], [Unit]),
    (
      ([Supply Voltage], [1.71], [1.80], [1.98], [V]),
      ([Operating Temp], [-40], [25], [85], [C]),
      ([Active Current], [--], [12], [18], [mA]),
      ([ADC Resolution], [--], [12], [--], [bits]),
      ([BLE TX Power], [-20], [0], [8], [dBm]),
    ),
  )
]

// ══════════════════════════════════════
// Section 2: Communication Protocols
// ══════════════════════════════════════
= Communication Protocols

== Data Bus Architecture

#cols[
  #component-card([MQTT-SN Protocol Stack], [
    Lightweight publish/subscribe messaging optimized for constrained IoT devices:

    - *Transport*: UDP over 6LoWPAN (IEEE 802.15.4)
    - *QoS Levels*: 0 (fire-and-forget), 1 (at-least-once), 2 (exactly-once)
    - *Topic registration*: Pre-registered topic IDs (2 bytes vs full string)
    - *Sleep support*: Buffered messages with configurable wake interval
    - *Gateway*: Transparent bridge to standard MQTT broker
  ], accent: palette.copper)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    solder-tag([MQTT-SN], color: palette.copper),
    solder-tag([6LoWPAN], color: palette.solder),
    solder-tag([CoAP], color: palette.gold-pin),
    solder-tag([BLE Mesh], color: palette.via),
  )
][
  #component-card([Inter-Board SPI Bus], [
    High-speed serial communication between stacked modules:

    - *Clock*: Up to 50 MHz (full duplex)
    - *Protocol*: Custom frame with CRC-16 error detection
    - *DMA*: Zero-copy transfers with scatter-gather
    - *Arbitration*: Hardware chip-select multiplexing
    - *Latency*: < 2 us for sensor readout
  ], accent: palette.gold-pin)

  #signal-quote(
    [In IoT, the protocol is the product. Every byte saved at the edge translates to years of battery life.],
    [NexBoard Engineering Manifesto],
    accent: palette.copper,
  )
]

== Protocol Timeline

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  bus-entry([1], [Sense], [Sensor acquires raw data at configured sample rate. ADC conversion + DMA transfer to ring buffer.], accent: palette.copper),
  bus-entry([2], [Process], [Fusion engine applies calibration, filtering, and feature extraction. AI inference on processed stream.], accent: palette.gold-pin),
  bus-entry([3], [Transmit], [MQTT-SN publish to gateway. Adaptive duty cycling based on data significance score.], accent: palette.solder),
)

#v(0.5em)

#trace-divider(width: 80%)

#v(0.4em)

#module-card([Network Topology], [
  NexBoard supports star, tree, and mesh topologies. Each node can act as both sensor endpoint and relay. The gateway aggregates data from up to 256 nodes and bridges to cloud via LTE-M or Ethernet backhaul.
], accent: palette.copper)

// ══════════════════════════════════════
// Section 3: Power Management
// ══════════════════════════════════════
= Power Management

== Energy Harvesting

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  ic-card([Solar MPPT Controller], [
    Maximum power point tracking for indoor photovoltaic cells:

    *Specifications*:
    - Input: 0.3V -- 5.5V (single cell to panel)
    - MPPT efficiency: 99.2% (fractional VOC)
    - Quiescent current: 480 nA
    - Cold-start voltage: 380 mV
    - Output: regulated 1.8V / 3.3V selectable
  ], accent: palette.gold-pin),
  ic-card([Supercapacitor Management], [
    Hybrid energy storage with intelligent load balancing:

    *Features*:
    - Dual supercap: 2x 100 mF @ 3.3V
    - Cell balancing: passive resistor network
    - Charge limiting: prevents overvoltage
    - Burst mode: 500 mA for TX events
    - Backup duration: 72 hours (sleep mode)
  ], accent: palette.copper),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pad-stat([480 nA], [Quiescent], accent: palette.solder),
  pad-stat([99.2%], [MPPT Eff.], accent: palette.gold-pin),
  pad-stat([72 hr], [Backup], accent: palette.copper),
  pad-stat([10 yr], [Target Life], accent: palette.via),
)

== Power States

#cols[
  #trace-box([State Machine], [
    NexBoard implements a 5-state power management FSM:

    *S0 -- Active*: Full processing, all peripherals enabled (12 mA)

    *S1 -- Idle*: CPU in WFI, peripherals clocked (4.2 mA)

    *S2 -- Light Sleep*: RTC + GPIO wake, SRAM retained (45 uA)

    *S3 -- Deep Sleep*: RTC wake only, partial SRAM (3.2 uA)

    *S4 -- Shutdown*: Power-on reset required (120 nA)
  ], accent: palette.copper)
][
  #module-card([Dynamic Voltage Scaling], [
    Adaptive frequency/voltage adjustment based on workload:

    - *Performance*: 480 MHz @ 1.2V core (peak compute)
    - *Balanced*: 240 MHz @ 1.0V core (normal operation)
    - *Economy*: 80 MHz @ 0.8V core (low-power tasks)
    - *Transition time*: < 5 us between any states
    - *Automatic*: Hardware workload monitor triggers scaling
  ], accent: palette.gold-pin)

  #v(0.4em)

  #datasheet-table(
    ([State], [Current], [Wake Time]),
    (
      ([Active], [12 mA], [--]),
      ([Light Sleep], [45 uA], [5 us]),
      ([Deep Sleep], [3.2 uA], [1.2 ms]),
      ([Shutdown], [120 nA], [50 ms]),
    ),
  )
]

// ══════════════════════════════════════
// Section 4: Sensor Modules
// ══════════════════════════════════════
= Sensor Modules

== Available Daughter Boards

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  component-card([ENV-200: Environmental], [
    - Temperature: +/- 0.1 C accuracy
    - Humidity: +/- 1.5% RH
    - Pressure: +/- 0.5 hPa
    - Air quality: VOC + CO2 (NDIR)
    - Light: ambient lux + UV index
  ], accent: palette.copper),
  component-card([MOT-300: Motion], [
    - Accelerometer: +/- 16g, 16-bit
    - Gyroscope: +/- 2000 dps
    - Magnetometer: +/- 4900 uT
    - Fusion rate: 1 kHz output
    - Pedometer + gesture engine
  ], accent: palette.gold-pin),
  component-card([AUD-100: Audio], [
    - MEMS microphone array (4x)
    - SNR: 67 dB (A-weighted)
    - Beamforming: 360 degree
    - Wake word detection (local)
    - Acoustic event classification
  ], accent: palette.solder),
)

#v(0.4em)

#signal-quote(
  [Every sensor module undergoes 1000-hour burn-in testing at 85C/85% RH before qualification. Reliability is not negotiable in industrial IoT.],
  [NexBoard Quality Assurance Standard NQA-2026-R3],
  accent: palette.via,
)

== Calibration Pipeline

#cols[
  #stack(spacing: 0.8em,
    cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
      bus-entry([1], [Factory Cal], [Golden reference measurement at 5 temperature points. Coefficients stored in OTP memory.], accent: palette.copper),
      bus-entry([2], [Field Cal], [Automatic zero-offset correction using environmental cross-reference. Runs every 24 hours.], accent: palette.gold-pin),
    ),
    cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
      bus-entry([3], [Drift Comp], [Long-term drift model trained on fleet data. Predictive compensation before error accumulates.], accent: palette.solder),
      bus-entry([4], [Validate], [Cross-sensor consistency check. Anomaly flagging triggers re-calibration request.], accent: palette.via),
    ),
  )
][
  #stack(spacing: 0.8em,
    ic-card([Calibration Co-Processor], [
      Dedicated hardware for real-time sensor compensation:

      *Architecture*:
      - 32-bit fixed-point polynomial engine
      - 5th-order temperature compensation
      - Cross-axis interference cancellation
      - Non-linearity correction (LUT-based)
      - Latency: single clock cycle per sample

      *Memory*: 2 KB OTP for factory coefficients, 4 KB Flash for field-learned parameters.
    ], accent: palette.copper),
    stack(dir: ltr, spacing: 0.5em,
      solder-tag([OTP], color: palette.copper),
      solder-tag([Polynomial], color: palette.gold-pin),
      solder-tag([Fleet ML], color: palette.solder),
    ),
  )
]

// ══════════════════════════════════════
// Section 5: Manufacturing & Testing
// ══════════════════════════════════════
= Manufacturing & Testing

== PCB Production

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  module-card([Board Specifications], [
    *Stack-up*: 6-layer HDI (High Density Interconnect)
    - L1: Signal (RF + high-speed digital)
    - L2: Ground plane (continuous pour)
    - L3: Signal (analog + sensor routing)
    - L4: Power plane (split for noise isolation)
    - L5: Signal (inter-module bus)
    - L6: Ground plane + component pads

    *Features*: 75 um trace/space, laser-drilled microvias, ENIG surface finish (gold pads).
  ], accent: palette.copper),
  module-card([Assembly Process], [
    *SMT Line*: Fully automated pick-and-place

    - Solder paste: SAC305 (lead-free), Type 5
    - Placement accuracy: +/- 25 um
    - Reflow profile: peak 245 C, 60s above liquidus
    - AOI: 100% inspection post-reflow
    - X-ray: BGA and QFN void analysis
    - ICT: flying probe test (100% coverage)
    - Functional test: custom JTAG boundary scan

    *Yield target*: > 99.5% first-pass
  ], accent: palette.gold-pin),
)

== Quality Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pad-stat([99.7%], [Yield Rate], accent: palette.copper),
  pad-stat([< 50 ppm], [Defect Rate], accent: palette.solder),
  pad-stat([15 min], [Test Time], accent: palette.gold-pin),
  pad-stat([IPC-A-610], [Class 3], accent: palette.via),
)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  trace-box([Reliability Testing], [
    All NexBoard modules pass:
    - *HALT*: -60C to +130C, 60G vibration
    - *THB*: 1000 hr at 85C/85% RH, 3.3V bias
    - *Thermal Shock*: 500 cycles, -40C to +125C
    - *ESD*: HBM 4 kV, CDM 1 kV (all pins)
    - *Drop*: 1.5m onto concrete (6 orientations)
  ], accent: palette.copper),
  trace-box([Certification Status], [
    Current certifications achieved:
    - *FCC Part 15B* -- Unintentional radiator
    - *CE RED* -- Radio Equipment Directive
    - *IC RSS-247* -- Canada radio compliance
    - *TELEC* -- Japan radio certification
    - *RoHS / REACH* -- Environmental
    - *UL 62368-1* -- Safety standard
  ], accent: palette.solder),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"The best hardware disappears into the background. You don't notice the PCB -- you notice what it enables."_

  #text(size: 0.6em, weight: "regular", fill: palette.substrate.transparentize(30%))[-- NexBoard Design Principles, Chapter 1]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
