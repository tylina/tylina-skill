// Watercolor Theme Demo — The Art of Visual Storytelling
// Creative/design presentation showcasing all components and slide types
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Libertinus Serif")

#show: watercolor-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [The Art of Visual Storytelling],
  config-info(
    title: [The Art of Visual Storytelling],
    subtitle: [How Color, Form, and Narrative Shape Perception],
    author: [Elena Whitmore],
    institution: [Chromatic Design Studio],
    date: datetime(year: 2025, month: 9, day: 12),
  ),
)

// ══════════════════════════════════════
// Slide 1: Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: The Language of Color
// ══════════════════════════════════════
= The Language of Color

== Color Psychology in Design

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  palette-stat([Emotional Recall], [+67%], variant: "blue"),
  palette-stat([Brand Recognition], [89%], variant: "rose"),
  palette-stat([Engagement Lift], [+42%], variant: "gold"),
)

#v(0.6em)

#bleed-divider()

#v(0.6em)

#wash-box([
  Color is not decoration -- it is communication. Studies show that audiences form a subconscious judgment about a visual message within 90 seconds, and up to 90% of that assessment is based on color alone.
])

== Warm vs. Cool Palettes

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.2em,
  wash-card([Warm Palettes], [
    Warm colors evoke energy, passion, and immediacy. They advance visually, creating intimacy and urgency in compositions.

    - *Red:* Action, urgency, love
    - *Orange:* Creativity, adventure
    - *Gold:* Wisdom, prosperity, warmth
  ], variant: "gold"),
  wash-card([Cool Palettes], [
    Cool colors recede into depth, creating calm, trust, and contemplation. They expand perceived space and invoke reliability.

    - *Blue:* Trust, depth, stability
    - *Indigo:* Intuition, perception
    - *Teal:* Balance, sophistication
  ], variant: "blue"),
)

// ══════════════════════════════════════
// Section 2: Composition & Form
// ══════════════════════════════════════
= Composition & Form

== The Golden Ratio in Visual Design

#cols[
  Great compositions are rarely accidental. The golden ratio (1:1.618) appears throughout nature and has guided artists for millennia.

  #v(0.3em)

  #wash-card([Principles of Proportion], [
    When elements are sized and spaced according to the golden ratio, viewers perceive harmony even without conscious analysis. This ratio governs everything from the spiral of a nautilus shell to the layout of a Renaissance painting.
  ], variant: "blue")

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.6em,
    pigment-tag([Proportion], variant: "blue"),
    pigment-tag([Rhythm], variant: "rose"),
    pigment-tag([Balance], variant: "gold"),
  )
][
  #brush-quote(
    [Design is not just what it looks like and feels like. Design is how it works.],
    author: [Steve Jobs],
  )

  #v(0.4em)

  #wash-box([
    The eye follows predictable paths through a composition. Understanding these paths allows designers to guide attention, create hierarchy, and control the emotional tempo of a visual narrative.
  ], variant: "rose")
]

== Visual Hierarchy Toolkit

#swatch-grid(([Scale], [Color], [Contrast], [Proximity], [Alignment], [Repetition]))

#v(0.6em)

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
  wash-card([Scale & Weight], [
    Larger elements claim attention first. Bold weights signal importance. Use scale differences of at least 1.5x to create clear hierarchy between levels.
  ], variant: "blue"),
  wash-card([Color & Contrast], [
    High-saturation colors against muted backgrounds create focal points. Limit accent colors to 10--15% of the composition for maximum impact.
  ], variant: "rose"),
  wash-card([Space & Rhythm], [
    White space is not empty -- it is breathing room. Consistent spacing creates rhythm; breaking rhythm creates emphasis and surprise.
  ], variant: "gold"),
)

// ══════════════════════════════════════
// Section 3: Narrative Structure
// ══════════════════════════════════════
= Narrative Structure

== Story Arcs in Presentations

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.2em,
  wash-card([Three-Act Structure], [
    Every compelling presentation follows a narrative arc:

    + *Setup:* Establish context and stakes
    + *Confrontation:* Present the challenge
    + *Resolution:* Deliver the transformation

    This structure creates emotional investment.
  ], variant: "blue"),
  wash-card([The Hero's Journey], [
    Position your audience as the hero:

    + Their current world (status quo)
    + The call to adventure (your proposition)
    + Trials and mentors (evidence and guidance)
    + The return transformed (outcomes)

    People remember stories 22x more than facts.
  ], variant: "rose"),
)

#v(0.3em)

#bleed-divider()

== Pacing & Emotional Rhythm

#cols[
  *Fast Pacing -- Energy*

  - Quick cuts between ideas
  - Short punchy statements
  - Data bursts and highlights
  - Creates urgency and excitement

  #v(0.2em)

  #stack(dir: ltr, spacing: 0.6em,
    pigment-tag([High Energy], variant: "rose"),
    pigment-tag([Momentum], variant: "gold"),
    paint-splatter(variant: "blue", width: 36pt),
  )
][
  *Slow Pacing -- Depth*

  - Extended exploration of a single idea
  - Full-bleed imagery with minimal text
  - Pause for reflection and absorption
  - Creates gravitas and memorability

  #v(0.2em)

  #wash-box([
    The most powerful moment in a presentation is often the pause -- the space between ideas where understanding crystallizes.
  ], variant: "gold")
]

// ══════════════════════════════════════
// Section 4: The Craft of Clarity
// ══════════════════════════════════════
= The Craft of Clarity

== Data as Visual Poetry

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em,
  palette-stat([Charts Simplified], [73%], variant: "blue"),
  palette-stat([Recall Increase], [+56%], variant: "rose"),
  palette-stat([Decision Speed], [2.1x], variant: "gold"),
  palette-stat([Trust Factor], [91%], variant: "blue"),
)

#v(0.5em)

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.2em,
  wash-box([
    *Principle:* Every pixel of ink should represent data. Remove gridlines, redundant labels, and decorative elements that do not carry information. The highest data-to-ink ratio produces the clearest communication.
  ]),
  wash-box([
    *Practice:* Use color intentionally -- highlight the one data point that matters. Let the audience see the pattern, not the chart. Transform spreadsheets into visual revelations.
  ], variant: "rose"),
)

== Typography as Voice

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.2em,
  wash-card([Serif Typefaces], [
    Serifs whisper of tradition, authority, and craftsmanship. Their small strokes guide the eye along lines of text, ideal for sustained reading and formal contexts. They carry the weight of printed history.
  ], variant: "blue"),
  wash-card([Sans-Serif Typefaces], [
    Sans-serifs speak of modernity, clarity, and directness. Their clean geometry performs exceptionally on screens and at large display sizes. They convey approachability and precision.
  ], variant: "gold"),
)

#v(0.4em)

#bleed-divider()

#v(0.4em)

#brush-quote(
  [Typography is the craft of endowing human language with a durable visual form.],
  author: [Robert Bringhurst],
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"Every great design begins with an even better story."_

  #text(size: 0.6em, weight: "regular")[-- Lorinda Mamo, Designer]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
