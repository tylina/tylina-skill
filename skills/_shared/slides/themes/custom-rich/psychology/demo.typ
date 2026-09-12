// Psychology Theme Demo — Attachment Theory in Clinical Practice
// Demonstrates all theme components and slide types
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: psychology-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Attachment Theory in Clinical Practice],
  config-info(
    title: [Attachment Theory in Clinical Practice],
    subtitle: [Understanding Relational Patterns and Therapeutic Interventions],
    author: [Dr. Sarah Chen, Ph.D.],
    institution: [Department of Clinical Psychology, Westfield University],
    date: datetime(year: 2025, month: 1, day: 15),
  ),
)

// ══════════════════════════════════════
// Slide 1: Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Slide 2: Table of Contents
// ══════════════════════════════════════
#outline-slide()

// ══════════════════════════════════════
// Section 1: Theoretical Foundation
// ══════════════════════════════════════
= Theoretical Foundation

== Origins of Attachment Theory

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Historical Context], [
    John Bowlby (1907--1990) developed attachment theory by integrating ethology, psychoanalysis, and systems theory. His work at the Tavistock Clinic laid the groundwork for modern attachment science.
  ]),
  concept-card([Core Proposition], [
    Human beings have an innate behavioral system -- the *attachment system* -- that motivates proximity-seeking to significant others in times of distress, danger, or uncertainty.
  ], accent: palette.green),
)

#v(0.5em)

#quote-card(
  [The propensity to make strong emotional bonds to particular individuals is a basic component of human nature, already present in germinal form in the neonate.],
  author: [John Bowlby, 1988],
)

== Key Theoretical Concepts

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  concept-card([Safe Haven], [
    The attachment figure provides comfort and security when the individual experiences threat or emotional distress -- a refuge in times of need.
  ], accent: palette.green),
  concept-card([Secure Base], [
    From felt security, the individual can explore the environment, engage in learning, and develop autonomy -- the platform for growth.
  ], accent: palette.blue),
  concept-card([Internal Working Models], [
    Mental representations of self and others formed through early attachment experiences. These models shape relationship expectations throughout life.
  ], accent: palette.orange),
)

#v(0.5em)

#stack(dir: ltr, spacing: 0.6em,
  tag([Ethology], color: palette.blue),
  tag([Object Relations], color: palette.green),
  tag([Systems Theory], color: palette.orange),
  tag([Developmental Psychology], color: palette.gray),
)

// ══════════════════════════════════════
// Section 2: Attachment Patterns
// ══════════════════════════════════════
= Attachment Patterns

== The Strange Situation Protocol

Mary Ainsworth's laboratory procedure (1978) identified distinct patterns of infant attachment through systematic observation of separation and reunion behaviors.

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  concept-card([Procedure Overview], [
    A structured 21-minute laboratory observation involving eight episodes of increasing stress: introduction, free play, stranger entry, first separation, first reunion, second separation, stranger return, and second reunion.
  ]),
  insight-box([Key Research Finding], [
    The *reunion behavior* -- not the separation distress -- is the critical marker of attachment quality. How the infant uses the caregiver upon return reveals the nature of the attachment bond.
  ]),
)

== Secure and Anxious Patterns

#cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
  concept-card([Secure Attachment (Type B)], [
    *~55--65% of infants.* Uses caregiver as secure base. Shows distress upon separation but is easily comforted upon reunion. Explores freely in caregiver's presence. Associated with sensitive, responsive caregiving.
  ], accent: palette.green),
  concept-card([Anxious-Ambivalent (Type C)], [
    *~10--15% of infants.* Shows intense distress upon separation, difficulty being soothed at reunion. Alternates between clinging and angry resistance. Associated with inconsistent caregiving.
  ], accent: palette.orange),
)

== Avoidant and Disorganized Patterns

#cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
  concept-card([Avoidant Attachment (Type A)], [
    *~20--25% of infants.* Shows little distress upon separation, actively avoids caregiver at reunion. Appears independent but physiological measures reveal elevated stress. Associated with rejecting caregiving.
  ], accent: palette.blue),
  warning-box([Disorganized Attachment (Type D)], [
    *~10--15% of infants.* Displays contradictory behaviors: approaching with head averted, freezing, or dissociative-like states. The caregiver is simultaneously the source of fear and the haven of safety. Strongly associated with trauma or unresolved loss.
  ]),
)

#slide(title: [Adult Attachment])[
  #cols[
  The Adult Attachment Interview (AAI), developed by Mary Main, assesses adult attachment based on *coherence of narrative* about childhood experiences.

  #v(0.2em)

  #tag([Secure-Autonomous], color: palette.green)
  #h(0.3em)
  #tag([Dismissing], color: palette.blue)
  #h(0.3em)
  #tag([Preoccupied], color: palette.orange)
  #h(0.3em)
  #tag([Unresolved], color: palette.red)

  #v(0.2em)

  #insight-box([Intergenerational Transmission], [
    Parent AAI classifications predict infant Strange Situation classifications with *75% accuracy* -- even before the child is born.
  ])
  ][
  #quote-card(
    [What is important is not what happened to you, but whether you have come to terms with what happened to you.],
    author: [Mary Main],
  )

  #v(0.2em)

  #concept-card([Earned Security], [
    Adults with difficult childhoods who achieve coherent narratives can be classified as "earned secure" -- *history is not destiny*.
  ], accent: palette.green)
  ]
]

// ══════════════════════════════════════
// Section 3: Clinical Applications
// ══════════════════════════════════════
= Clinical Applications

== Attachment in Psychopathology

#cols[
  Insecure attachment is a *transdiagnostic risk factor* implicated in a wide range of psychological difficulties:

  - *Depression:* Rumination and excessive reassurance-seeking
  - *Anxiety:* Hyperactivation of the attachment system
  - *Personality Disorders:* Disorganized attachment linked to BPD
  - *PTSD:* Disorganized attachment impairs trauma processing
][
  #case-box([Clinical Vignette: Maria, 34], [
    Presents with recurrent depression and relationship difficulties. Reports an emotionally unavailable mother and unpredictable father. AAI classification: *Preoccupied (E2)*.
  ])

  #warning-box([Clinical Caution], [
    Attachment classification is not a diagnosis. It describes relational patterns, not pathology.
  ])
]

== The Therapeutic Relationship as Secure Base

#quote-card(
  [The therapist provides a secure base from which the patient can explore the unhappy and painful aspects of life -- impossible to think about without a trusted companion.],
  author: [John Bowlby, 1988],
)

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  concept-card([Attunement], [
    The therapist tracks and mirrors emotional states, creating experiences of being understood -- corrective attachment experiences.
  ], accent: palette.green),
  concept-card([Rupture and Repair], [
    Alliance ruptures, when successfully repaired, provide powerful opportunities for revising internal working models.
  ], accent: palette.orange),
  concept-card([Exploration Support], [
    From the security of the therapeutic bond, clients can explore difficult memories and patterns previously too threatening to examine.
  ], accent: palette.blue),
)

// ══════════════════════════════════════
// Section 4: Treatment Approaches
// ══════════════════════════════════════
= Treatment Approaches

== Emotionally Focused Therapy (EFT)

#cols[
  Developed by *Sue Johnson*, EFT is the most empirically validated attachment-based couple therapy.

  #v(0.2em)

  #concept-card([Three Stages of EFT], [
    *Stage 1 -- De-escalation:* Identify the negative cycle and reframe in attachment terms.

    *Stage 2 -- Restructuring:* Access underlying emotions; facilitate bonding events.

    *Stage 3 -- Consolidation:* Integrate new interaction patterns.
  ], accent: palette.blue)
][
  #insight-box([Treatment Efficacy], [
    Meta-analyses show EFT achieves *70--75% recovery rates* for couple distress, maintained at 2-year follow-up. Effect sizes (d = 1.3) exceed most couple therapies.
  ])

  #case-box([The Pursue-Withdraw Cycle], [
    Jake (anxious) pursues through criticism; Emma (avoidant) withdraws. Beneath Jake's anger lies fear of abandonment; beneath Emma's withdrawal lies fear of inadequacy.
  ])
]

== Mentalization-Based Treatment (MBT)

#cols[
  #concept-card([What is Mentalization?], [
    The capacity to understand behavior in terms of mental states -- thoughts, feelings, and intentions. Developed by *Fonagy* and *Bateman*, rooted in attachment theory.
  ], accent: palette.green)

  #tag([Borderline Personality], color: palette.red)
  #h(0.3em)
  #tag([Affect Regulation], color: palette.blue)
  #h(0.3em)
  #tag([Epistemic Trust], color: palette.green)
][
  #insight-box([Key Mechanism], [
    When attachment is disrupted, mentalizing collapses -- leading to *psychic equivalence* (feelings = facts), *pretend mode* (disconnected thinking), or *teleological mode* (only actions count).
  ])

  #quote-card(
    [Mentalization is the fundamental human capacity that underpins all therapeutic interventions.],
    author: [Peter Fonagy, 2002],
  )
]

== Integrative Clinical Framework

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  concept-card([Assessment], [
    - Adult Attachment Interview (AAI)
    - Experience in Close Relationships (ECR)
    - Relationship patterns in therapy
    - Narrative coherence markers
    - Reflective functioning scale
  ], accent: palette.blue),
  concept-card([Intervention Focus], [
    - Create corrective attachment experiences
    - Develop mentalization capacity
    - Process attachment-related trauma
    - Revise internal working models
    - Build affect regulation skills
  ], accent: palette.green),
  concept-card([Expected Outcomes], [
    - Increased narrative coherence
    - Enhanced reflective functioning
    - More flexible relational strategies
    - Greater distress tolerance
    - Movement toward earned security
  ], accent: palette.orange),
)

#v(0.5em)

#focus-slide[
  #text(size: 0.7em, weight: "regular")[_"The curious paradox is that when I accept myself just as I am, then I can change."_

  -- Carl Rogers]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
