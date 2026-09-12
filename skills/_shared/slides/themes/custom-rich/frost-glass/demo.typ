// Frost Glass Theme Demo -- Design System Strategy Presentation
// Modern glassmorphism presentation aesthetic
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: frost-glass-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Horizon Design -- Q3 Strategy],
  config-info(
    title: [Horizon Design System 3.0],
    subtitle: [Unified Experience Architecture for Next-Gen Interfaces],
    author: [Alex Rivera, VP of Design Engineering],
    institution: [Horizon Labs],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

#set text(font: ("Arial", "Helvetica"))

// ======================================
// Title Slide
// ======================================
#title-slide()

// ======================================
// Section 1: Vision
// ======================================
= Vision

== Design System Philosophy

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  pane-card([Consistency at Scale], [
    A unified design language across 14 product surfaces. Every component shares the same spatial rhythm, color semantics, and interaction patterns.

    *Outcome*: 60% reduction in design-to-dev handoff time and zero visual inconsistencies in production.
  ], accent: palette.primary),
  pane-card([Adaptive Fidelity], [
    Components intelligently adapt their visual complexity based on context -- from high-fidelity desktop dashboards to constrained mobile widgets.

    *Outcome*: Single source of truth serving all viewport classes without custom overrides.
  ], accent: palette.secondary),
)

#v(0.5em)

#frost-box([Core Principle], [
  The best design system is invisible to end users. They experience #text(weight: "bold")[cohesion without monotony] -- every surface feels familiar yet purposefully distinct.
], accent: palette.primary)

== Strategic Metrics

#cols[
  #cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
    crystal-stat([Components], [240+], color: palette.primary),
    crystal-stat([Adoption], [94%], color: palette.secondary),
    crystal-stat([Teams], [28], color: palette.primary-dark),
    crystal-stat([Platforms], [6], color: palette.secondary),
  )

  #v(0.6em)

  #depth-card([System Health Dashboard], [
    - *Token coverage*: 98.7% of UI surfaces use design tokens
    - *Component reuse*: Average 12.4 instances per component
    - *Accessibility*: WCAG 2.2 AA compliant across all primitives
    - *Performance*: Bundle size reduced 34% via tree-shaking
  ], accent: palette.primary)
][
  #layer-card([Evolution Timeline], [
    *v1.0 (2024)*: Foundation tokens, 80 components, web-only

    *v2.0 (2025)*: Multi-platform, motion system, 160 components

    *v3.0 (2026)*: AI-adaptive layouts, context-aware theming, 240+ components with semantic intelligence
  ], accent: palette.secondary)

  #v(0.5em)

  #notification-note([Milestone], [
    Design System 3.0 achieved full cross-platform parity in March 2026 -- the first system in our industry to do so without platform-specific forks.
  ], accent: palette.primary)
]

// ======================================
// Section 2: Architecture
// ======================================
= Architecture

== Token Architecture

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
  depth-card([Primitive Tokens], [
    Raw values that form the foundation. Colors, spacing scales, type scales, and elevation values.

    - 48 color primitives
    - 12-step spacing scale
    - 8 elevation levels
  ], accent: palette.primary),
  depth-card([Semantic Tokens], [
    Meaningful aliases that encode intent. Surface colors, interactive states, feedback indicators.

    - context-aware mapping
    - theme-switchable
    - accessibility-validated
  ], accent: palette.secondary),
  depth-card([Component Tokens], [
    Scoped overrides for individual components. Enable per-component theming without breaking system coherence.

    - isolated scope
    - cascading defaults
    - runtime composable
  ], accent: palette.primary-dark),
)

#v(0.4em)

#refraction-separator(width: 60%)

#v(0.4em)

#cols(columns: (1fr, 1fr), gutter: 1em,
  crystal-stat([Token Count], [1,240], color: palette.primary),
  crystal-stat([Theme Variants], [12], color: palette.secondary),
)

== Component Layers

#cols[
  #pane-card([Primitives Layer], [
    Atomic building blocks with zero opinion on layout. Buttons, inputs, typography, icons. Pure function of props -- no side effects, no context dependencies.

    ```
    <Button variant="primary" size="md">
      Submit
    </Button>
    ```
  ], accent: palette.primary)

  #v(0.4em)

  #pane-card([Patterns Layer], [
    Composed primitives forming recognizable UI patterns. Form groups, navigation bars, card layouts, data tables. Encode interaction logic and accessibility behaviors.
  ], accent: palette.secondary)
][
  #pane-card([Templates Layer], [
    Full page compositions with slot-based architecture. Dashboard layouts, settings pages, onboarding flows. Define spatial relationships and content hierarchy.
  ], accent: palette.primary)

  #v(0.4em)

  #glow-box([AI Layer (New in v3.0)], [
    Machine learning models that suggest optimal component combinations based on content type, user context, and viewport. Auto-generates responsive layouts from semantic content descriptions.
  ], color: palette.secondary)
]

// ======================================
// Section 3: Components
// ======================================
= Components

== Component Gallery

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  frost-box([Interaction Primitives], [
    - *Buttons*: 5 variants, 4 sizes, loading/disabled states
    - *Inputs*: Text, select, multiselect, date, file upload
    - *Toggles*: Switch, checkbox, radio, segmented control
    - *Menus*: Dropdown, context, command palette
  ], accent: palette.primary),
  frost-box([Data Display], [
    - *Tables*: Sortable, filterable, virtualized (10k+ rows)
    - *Charts*: 12 chart types with shared token theming
    - *Cards*: 8 variants from compact to expanded
    - *Lists*: Flat, grouped, infinite scroll, drag-sortable
  ], accent: palette.secondary),
)

#v(0.5em)

#glass-tile-grid(
  (
    [*Motion*: 24 easing curves, spring physics, gesture-driven animations],
    [*Layout*: CSS Grid/Flex primitives with responsive breakpoint system],
    [*Feedback*: Toast, modal, sheet, popover, tooltip hierarchies],
    [*Navigation*: Tabs, breadcrumbs, sidebar, command bar patterns],
  ),
  columns: 2,
  gutter: 0.8em,
)

== Accessibility Framework

#cols[
  #cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
    crystal-stat([WCAG Level], [AA+], color: palette.primary),
    crystal-stat([Screen Readers], [5], color: palette.secondary),
    crystal-stat([a11y Tests], [1,400], color: palette.primary-dark),
  )

  #v(0.5em)

  #layer-card([Testing Methodology], [
    Every component undergoes automated accessibility testing via axe-core, manual screen reader verification across NVDA/VoiceOver/JAWS, and keyboard navigation audits.

    CI pipeline blocks merges with any accessibility regression.
  ], accent: palette.primary)
][
  #notification-note([Standards], [
    Full WCAG 2.2 AA compliance with progressive enhancement toward AAA where feasible. All motion respects prefers-reduced-motion. Color contrast validated in all theme variants.
  ], accent: palette.secondary)

  #v(0.5em)

  #pane-card([Inclusive Design Principles], [
    - *Perceivable*: All content available in multiple modalities
    - *Operable*: Full keyboard + switch device support
    - *Understandable*: Consistent patterns reduce cognitive load
    - *Robust*: Graceful degradation across assistive technologies
  ], accent: palette.primary)
]

// ======================================
// Section 4: Adoption
// ======================================
= Adoption

== Team Adoption Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
  crystal-stat([Web Teams], [94%], color: palette.primary),
  crystal-stat([Mobile], [87%], color: palette.secondary),
  crystal-stat([Desktop], [91%], color: palette.primary-dark),
  crystal-stat([Embedded], [72%], color: palette.secondary),
)

#v(0.6em)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  pane-card([Migration Success Stories], [
    - *Commerce Platform*: Full migration in 6 weeks, 40% fewer bugs
    - *Analytics Dashboard*: Design debt eliminated, 3x faster iterations
    - *Mobile Banking*: Unified iOS/Android from separate codebases
    - *IoT Control Panel*: Consistent UX across 4 device form factors
  ], accent: palette.primary),
  pane-card([Developer Satisfaction], [
    - Documentation NPS: *78* (industry top 5%)
    - Time to first component: *4 minutes* average onboarding
    - Support ticket volume: Down 62% year-over-year
    - Contribution rate: 34 external PRs merged per quarter
  ], accent: palette.secondary),
)

== Tooling Ecosystem

#cols[
  #depth-card([Development Tools], [
    *Figma Plugin*: Real-time sync between design and code tokens. Designers work in the same token space as engineers.

    *CLI*: Component scaffolding, token compilation, accessibility auditing, and bundle analysis in a single tool.

    *VS Code Extension*: Autocomplete for tokens, component prop validation, and live preview.
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    blur-tag([Figma], color: palette.primary),
    blur-tag([React], color: palette.secondary),
    blur-tag([Swift UI], color: palette.primary-dark),
    blur-tag([Compose], color: palette.secondary),
  )
][
  #glow-box([AI Design Assistant], [
    Our new AI-powered design assistant analyzes content and automatically suggests the optimal component composition, spacing, and hierarchy. Reduces layout decisions from hours to seconds.
  ], color: palette.primary)

  #v(0.5em)

  #frost-box([Integration Stats], [
    - *Build time*: 1.2s average full compilation
    - *Tree-shaking*: Only ships used components (avg 34KB)
    - *Hot reload*: Token changes propagate in 80ms
    - *Type safety*: 100% TypeScript coverage with strict mode
  ], accent: palette.secondary)
]

// ======================================
// Section 5: Roadmap
// ======================================
= Roadmap

== 2026 Initiatives

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  layer-card([Q3: Spatial Computing], [
    Extend the design system to AR/VR interfaces. New depth tokens, spatial interaction patterns, and gaze-based component variants for Vision Pro and Quest platforms.
  ], accent: palette.primary),
  layer-card([Q4: Voice & Ambient UI], [
    Components that adapt to voice-first contexts. Ambient displays with glanceable information density. Screen-less interaction patterns for IoT devices.
  ], accent: palette.secondary),
)

#v(0.4em)

#refraction-separator(width: 60%)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
  crystal-stat([New Components], [80+], color: palette.primary),
  crystal-stat([New Platforms], [3], color: palette.secondary),
  crystal-stat([Team Growth], [+12], color: palette.primary-dark),
)

== Investment Priorities

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
  depth-card([Infrastructure (40%)], [
    Token pipeline automation, cross-platform compilation targets, real-time analytics on component usage patterns.
  ], accent: palette.primary),
  depth-card([Intelligence (35%)], [
    AI layout engine, predictive theming based on user preferences, automated accessibility remediation.
  ], accent: palette.secondary),
  depth-card([Community (25%)], [
    Open-source primitives layer, external contributor program, annual design systems conference sponsorship.
  ], accent: palette.primary-dark),
)

#v(0.5em)

#notification-note([Commitment], [
  Design System 3.0 is not just a component library -- it is the foundation of our product experience strategy. Every pixel, every interaction, every platform unified under one coherent vision.
], accent: palette.primary)

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  _"Great design systems do not constrain creativity -- they liberate it by removing the burden of reinventing foundations."_

  #v(0.3em)
  #text(size: 0.6em, weight: "regular", fill: palette.text-muted)[-- Horizon Design Principles]
]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Thank You]
