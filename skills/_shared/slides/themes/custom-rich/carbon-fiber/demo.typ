// Carbon Fiber Theme Demo — Advanced Materials Engineering
// Aerospace materials science presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Sans SC"))
#show raw: set text(font: "DejaVu Sans Mono")

#show: carbon-fiber-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Materials Science Conference 2026 -- Advanced Composites Track],
  config-info(
    title: [Next-Generation Carbon Fiber Composites],
    subtitle: [Pushing the Boundaries of Structural Performance],
    author: [Dr. Elena Vasquez],
    institution: [Advanced Materials Division, AeroTech Industries],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Material Fundamentals
// ══════════════════════════════════════
= Material Fundamentals

== Carbon Fiber Structure

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Microstructure], [
    Carbon fibers consist of crystalline graphite ribbons aligned along the fiber axis. The high degree of preferred orientation gives exceptional tensile properties.

    *Key parameters*:
    - Fiber diameter: 5-10 μm
    - Crystallite size: 2-4 nm
    - Orientation angle: < 10°
  ], accent: palette.primary),
  concept-card([Manufacturing Process], [
    PAN-based precursors undergo oxidation (200-300°C), carbonization (1000-1500°C), and optional graphitization (2500-3000°C).

    *Process control*:
    - Tension during carbonization
    - Heating rate uniformity
    - Atmosphere purity (N₂, Ar)
  ], accent: palette.titanium),
)

#v(0.4em)

#insight-box([Critical Insight], [
  Tensile modulus rises with crystallite alignment. High-modulus fibers (> 400 GPa) need graphitization above 2500°C, which trades some tensile strength for greater flaw sensitivity.
])

== Fiber Classifications

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  stat-card([Tensile Strength], [6.4 GPa], color: palette.primary),
  stat-card([Elastic Modulus], [588 GPa], color: palette.titanium),
  stat-card([Density], [1.80 g/cm³], color: palette.silver),
  stat-card([Strain to Failure], [1.9%], color: palette.accent-red),
)

#v(0.5em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  spec-card([Standard Modulus (SM)], [
    - Modulus: 230-240 GPa
    - Strength: 3.5-5.0 GPa
    - *Applications*: sporting goods, automotive, general industrial
  ], accent: palette.primary),
  spec-card([Intermediate Modulus (IM)], [
    - Modulus: 280-320 GPa
    - Strength: 5.5-6.4 GPa
    - *Applications*: aerospace primary structure, pressure vessels
  ], accent: palette.titanium),
  spec-card([High Modulus (HM)], [
    - Modulus: 390-590 GPa
    - Strength: 2.4-4.0 GPa
    - *Applications*: satellite structures, antenna reflectors
  ], accent: palette.silver),
)

// ══════════════════════════════════════
// Section 2: Composite Design
// ══════════════════════════════════════
= Composite Design

== Layup Architecture

#cols[
  #material-box([Quasi-Isotropic Layup], [
    Standard aerospace layup achieving near-isotropic in-plane properties:

    *[0/±45/90]ₛ* — symmetric, balanced configuration

    - Equal stiffness in all in-plane directions
    - 25% of plies in each direction (0°, +45°, -45°, 90°)
    - Minimizes thermal warpage due to symmetry
    - Standard for fuselage skins and fairings
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.6em,
    eng-tag([CFRP], color: palette.primary),
    eng-tag([Prepreg], color: palette.titanium),
    eng-tag([Autoclave], color: palette.silver),
  )
][
  #material-box([Tailored Fiber Placement], [
    Variable-stiffness design with curvilinear fiber paths optimized by FEA:

    - Load-path aligned fiber orientation
    - Reduced stress concentrations at cutouts
    - 15-30% weight savings vs quasi-isotropic
    - Automated fiber placement (AFP) manufacturing

    *Challenge*: fiber steering radius limits (min 635mm for standard tow).
  ], accent: palette.titanium)

  #v(0.4em)

  #callout-box(type: "info")[
    *Design rule*: Maintain ply percentage between 10-70% in any direction to prevent matrix-dominated failure modes.
  ]
]

== Matrix Systems

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Thermoset Epoxy], [
    Dominant matrix for aerospace CFRP. Cross-linked polymer network formed during cure.

    *Properties*:
    - Tg: 120-180°C (standard cure)
    - Tg: 200-260°C (high-temp systems)
    - Moisture absorption: 1-3% at saturation
    - Shelf life: 6-12 months (frozen prepreg)
  ], accent: palette.primary),
  concept-card([Thermoplastic PEEK/PEKK], [
    Melt-processable semi-crystalline polymers. No cure cycle — consolidation by heat and pressure.

    *Advantages*:
    - Unlimited shelf life
    - Weldable (induction, ultrasonic)
    - Superior toughness (GIc > 1.5 kJ/m²)
    - Recyclable at end of life
  ], accent: palette.titanium),
)

#v(0.4em)

#precision-divider(width: 70%)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  stat-card([Fiber Volume], [60-65%], color: palette.primary),
  stat-card([Void Content], [< 1%], color: palette.accent-red),
  stat-card([Cure Pressure], [700 kPa], color: palette.titanium),
)

// ══════════════════════════════════════
// Section 3: Testing & Qualification
// ══════════════════════════════════════
= Testing & Qualification

== Building Block Approach

#cols[
  #spec-card([Pyramid of Tests], [
    *Level 1 — Coupons*: Material allowables (A-basis, B-basis)
    - Tension, compression, shear, fatigue, environmental

    *Level 2 — Elements*: Structural features
    - Open holes, filled holes, bearing, bonded joints

    *Level 3 — Subcomponents*: Combined loading
    - Stiffened panels, joint sections, frames

    *Level 4 — Components*: Full-scale structure
    - Wing box, fuselage barrel, empennage

    *Level 5 — Full Aircraft*: Certification test
    - Static ultimate load, fatigue spectrum, damage tolerance
  ], accent: palette.primary)
][
  #benchmark-card([Qualification Metrics], (
    (label: [Tensile strength retention at 85°C/wet], value: [> 70%], color: palette.primary),
    (label: [Open-hole compression (OHC)], value: [310 MPa], color: palette.titanium),
    (label: [CAI after 30J impact], value: [220 MPa], color: palette.accent-red),
    (label: [Fatigue life (R=-1)], value: [10⁶ cycles], color: palette.primary),
    (label: [Bearing strength (e/D=3)], value: [680 MPa], color: palette.titanium),
  ))

  #v(0.4em)

  #callout-box(type: "warning")[
    *Critical*: All allowables must include environmental conditioning — hot/wet (85°C, saturated) is the design-critical condition for most epoxy systems.
  ]
]

== Damage Tolerance

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Barely Visible Impact Damage], [
    BVID defines the damage detection threshold for composite structures:

    - Dent depth: 0.3-0.5 mm (visual threshold)
    - Impact energy: 6-50 J depending on thickness
    - Internal delamination area often 10-50x dent size
    - *Design principle*: structure must sustain ultimate load with BVID present
  ], accent: palette.primary),
  concept-card([Compression After Impact], [
    CAI strength is the critical metric for damage-tolerant design:

    - Toughened epoxy systems: 220-280 MPa
    - Untoughened systems: 130-180 MPa
    - Thermoplastic PEEK: 280-350 MPa
    - *Improvement methods*: interleaving, z-pinning, thermoplastic veils
  ], accent: palette.titanium),
)

#v(0.4em)

#quote-card(
  [The challenge is not making composite structures strong — it is making them tolerant of the inevitable damage they will encounter in service.],
  attribution: [Dr. Paul Lagacé, MIT]
)

// ══════════════════════════════════════
// Section 4: Manufacturing Innovation
// ══════════════════════════════════════
= Manufacturing Innovation

== Automated Fiber Placement

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  material-box([AFP Process Parameters], [
    *Machine capabilities*:
    - Layup speed: 0.5-1.0 m/s
    - Tow width: 6.35 mm (1/4") or 3.18 mm (1/8")
    - Band width: 16-32 tows simultaneously
    - Compaction force: 200-800 N
    - Heating: IR lamp, laser, or hot gas

    *Quality control*: in-situ thermal imaging, tow tension monitoring, gap/overlap detection via machine vision.
  ], accent: palette.primary),
  material-box([In-Situ Consolidation], [
    *Thermoplastic AFP* — eliminating the autoclave:

    - Laser heating to melt temperature (343°C for PEEK)
    - Nip-point consolidation in single pass
    - No post-cure cycle required
    - Part quality approaching autoclave

    *Challenges*: crystallinity control, residual stress management, void content at tight radii.
  ], accent: palette.titanium),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  stat-card([Layup Rate], [20 kg/hr], color: palette.primary),
  stat-card([Scrap Rate], [< 3%], color: palette.accent-red),
  stat-card([OOA Quality], [< 0.5% voids], color: palette.titanium),
  stat-card([Cost Savings], [35%], color: rgb("#16A34A")),
)

== Out-of-Autoclave Processes

#cols[
  #concept-card([Resin Transfer Molding (RTM)], [
    Closed-mold liquid composite molding for complex geometries:

    1. *Preform*: Dry fabric layup with binder stabilization
    2. *Injection*: Resin infusion at 2-6 bar pressure
    3. *Cure*: In-mold heating (120-180°C)
    4. *Demold*: Net-shape part with both surfaces finished

    *Variants*: HP-RTM (high pressure), C-RTM (compression), VARTM (vacuum-assisted)
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    eng-tag([RTM], color: palette.primary),
    eng-tag([Net-Shape], color: palette.titanium),
    eng-tag([High-Rate], color: palette.accent-red),
  )
][
  #benchmark-card([Process Comparison], (
    (label: [Autoclave cycle time], value: [6-12 hr], color: palette.titanium),
    (label: [HP-RTM cycle time], value: [2-5 min], color: palette.primary),
    (label: [AFP rate (thermoset)], value: [20 kg/hr], color: palette.titanium),
    (label: [AFP rate (thermoplastic)], value: [8 kg/hr], color: palette.accent-red),
  ))

  #v(0.4em)

  #insight-box([Industry Trend], [
    The automotive industry demands cycle times under 3 minutes for structural CFRP. HP-RTM with snap-cure resins and pre-formed textiles is the leading candidate for high-volume production (> 50,000 parts/year).
  ])
]

// ══════════════════════════════════════
// Section 5: Applications & Future
// ══════════════════════════════════════
= Applications & Future

== Aerospace Structures

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  spec-card([Boeing 787 Dreamliner], [
    - *Composite content*: 50% by weight
    - *Primary structure*: fuselage barrels, wing skins, empennage
    - *Material*: Toray T800S/3900-2 (toughened epoxy)
    - *Manufacturing*: AFP for fuselage, hand layup for complex areas
    - *Weight savings*: 20% vs aluminum equivalent
    - *Fatigue advantage*: no crack propagation in composite joints
  ], accent: palette.primary),
  spec-card([Next-Gen Single Aisle], [
    - *Target*: 25-30% composite content increase
    - *Technologies*: thermoplastic welded fuselage, resin-infused wings
    - *Production rate*: 60+ aircraft/month
    - *Key enablers*: automated assembly, digital twin validation
    - *Timeline*: entry into service 2030+
    - *Cost target*: < \$150/kg finished part cost
  ], accent: palette.titanium),
)

#v(0.4em)

#callout-box(type: "success")[
  *Achievement*: The A350 wing cover (32m span) is the largest single composite aerospace component ever produced, weighing 40% less than its metallic predecessor.
]

== Emerging Technologies

#cols[
  #material-box([Self-Healing Composites], [
    Healing agents release after cracking through capsule, vascular, or reversible-bond systems. Demonstrations recover 70-90% of fracture toughness.
  ], accent: palette.primary)

  #v(0.3em)

  #callout-box(type: "info")[
    *Structural Health Monitoring*: embedded Fiber Bragg gratings, piezoelectric wafers, and carbon-nanotube networks provide continuous strain, wave, and damage sensing.
  ]
][
  #concept-card([Recycled Carbon Fiber], [
    *Pyrolysis* (500-700°C): matrix decomposition
    - 90-95% fiber strength retention
    - Discontinuous fiber output (25-100mm lengths)

    *Solvolysis*: near-virgin fiber properties
    - Potential continuous fiber recovery
    *Market*: automotive, electronics, sports equipment.
  ], accent: palette.titanium)

  #v(0.3em)

  #cols(columns: (1fr, 1fr), gutter: 0.6em, lazy-layout: true,
    stat-card([Virgin CF Cost], [\$25/kg], color: palette.primary),
    stat-card([Recycled CF], [\$8/kg], color: rgb("#16A34A")),
  )
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"Carbon fiber composites don't just replace metals — they enable designs that were previously impossible."_

  #text(size: 0.6em, weight: "regular", fill: white.transparentize(30%))[-- Dr. Karl-Heinz Füller, Daimler AG]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
