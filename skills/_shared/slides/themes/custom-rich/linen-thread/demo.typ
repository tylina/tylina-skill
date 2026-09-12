#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Songti SC"), size: 20pt)

#show: linen-thread-theme.with(
  aspect-ratio: "16-9",
  footer: [Textile Heritage Research Group],
  config-common(breakable: false),
  config-info(
    title: [Threads of Memory],
    subtitle: [Material Culture and Identity in Post-Industrial Textile Communities],
    author: [Dr. Elena Marchetti],
    date: datetime.today(),
    institution: [Department of Cultural Studies \u{2014} University of Leeds],
  ),
)

#title-slide()

#speaker-note[Welcome. Today I present findings from our three-year ethnographic study of textile communities in Northern England and their relationship to material heritage.]

#outline-slide()

#speaker-note[Our agenda covers theoretical framework, fieldwork methodology, key findings, and implications for cultural policy.]

= Theoretical Framework

== Material Culture & Identity

The relationship between textile production and community identity operates on multiple registers -- from the embodied knowledge of craft practice to the symbolic weight of local cloth traditions in collective memory.

- *Haptic memory*: Knowledge stored in the hands of weavers
- *Material semiotics*: How cloth carries cultural meaning
- *Industrial sublime*: The loom as both machine and metaphor
- *Post-industrial nostalgia*: Absence as presence in former mill towns

#fiber-divider()

#stitch-tag[Ethnography] #stitch-tag[Material Culture] #stitch-tag[Heritage Studies] #stitch-tag[Identity]

#speaker-note[Our theoretical framework draws on Tim Ingold's materials thinking, combined with Bourdieu's concept of habitus applied to craft practice.]

== Key Concepts

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.3em)[
  #pattern-card([Embodied Knowledge], [
    Textile craft as a form of knowing that resists codification:
    - *Tacit dimension* -- Michael Polanyi's framework applied to weaving
    - *Body-tool integration* -- the loom as prosthetic extension
    - *Rhythmic entrainment* -- temporal patterns of skilled practice
    - *Material dialogue* -- responsive engagement with fiber properties
  ])
][
  #pattern-card([Collective Memory], [
    How communities remember through material practices:
    - *Generational transmission* -- apprenticeship and mimesis
    - *Landscape inscription* -- mills as mnemonic architecture
    - *Pattern language* -- local designs as cultural texts
    - *Loss narratives* -- deindustrialisation as cultural trauma
  ], accent: palette.secondary)
]

#speaker-note[These two pillars -- embodied knowledge and collective memory -- structure our entire analytical framework.]

== Literature Position

#cols(columns: (3fr, 2fr), gutter: 1.5em)[
  #stack(
    spacing: .8em,
    thread-box([Research Gap], [
      Existing scholarship frames textile heritage through museum objects or economic production. Our contribution centers on *living practice* -- how textile knowledge persists after industrial closure.
    ]),
    tapestry-box([Methodological Innovation], [
      Combining sensory ethnography with digital oral history and material analysis. Participants produce textile samples alongside narratives -- creating "cloth-as-testimony."
    ]),
  )
][
  #loom-quote[
    The cloth remembers what the community forgets. Each thread holds a decision, a rhythm, a way of being in the world that no archive can fully capture.
  ][-- Tim Ingold, _Making_ (2013)]
]

#speaker-note[Our methodological innovation -- cloth-as-testimony -- bridges the gap between material culture studies and oral history practice.]

= Fieldwork & Methodology

== Research Sites

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em)[
  #sampler-stat([3], [Research Communities\ Studied])
][
  #sampler-stat([47], [Participants\ Interviewed], accent: palette.accent)
][
  #sampler-stat([18], [Months\ Fieldwork], accent: palette.primary)
]

#speaker-note[Three post-industrial textile communities in West Yorkshire provided our primary fieldwork sites over eighteen months.]

== Methodology Design

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.3em)[
  #weave-card([Sensory Ethnography], [
    Participant observation in active weaving workshops:
    - *Sound mapping* -- acoustic ecology of loom rooms
    - *Touch journals* -- haptic documentation of fiber handling
    - *Movement notation* -- choreography of weaving gestures
    - *Smell diaries* -- olfactory dimensions of textile space
  ])
][
  #weave-card([Digital Oral History], [
    Semi-structured interviews with former mill workers:
    - 47 participants aged 58-91
    - Average interview length: 2.4 hours
    - Multi-sensory prompts (fabric samples, tools, sounds)
    - Follow-up "making sessions" with 23 participants
  ], accent: palette.secondary)
]

#speaker-note[Our mixed-methods design privileges sensory experience -- using fabric samples and tools as interview prompts rather than purely verbal questioning.]

== Participant Demographics

#cols(columns: (1fr, 1fr), gutter: 1.3em)[
  #bobbin-list[
    + *Saltaire* -- 16 participants from former Salts Mill community. Mix of weavers, dyers, and finishers. Age range 62-88.
    + *Huddersfield* -- 18 participants from woollen textile tradition. Includes both industrial workers and independent hand-weavers.
    + *Halifax* -- 13 participants representing carpet and worsted sectors. Strong emphasis on intergenerational knowledge.
  ]
][
  #stack(
    spacing: .8em,
    thread-box([Ethical Framework], [
      All participants consented to narrative and material documentation. Textile samples co-produced during research remain community property. Digital archive governed by participant steering committee.
    ], accent: palette.primary),
    [#stitch-tag[Ethics Approved] #stitch-tag[Co-production] #stitch-tag[Community-led]],
  )
]

#speaker-note[Ethical co-production was central. Communities retain ownership of all material outputs and govern the digital archive.]

= Key Findings

== Finding 1: Haptic Persistence

#cols(columns: (1fr, 1fr), gutter: 1.3em)[
  #stack(
    spacing: .8em,
    sampler-stat([89%], [Participants retained\ muscle memory], accent: palette.primary),
    sampler-stat([34], [Years average since\ last weaving], accent: palette.accent),
  )
][
  #tapestry-box([Bodily Knowledge Endures], [
    Even decades after industrial closure, former weavers demonstrated remarkable *haptic persistence* -- the ability to resume complex motor sequences with minimal re-learning.

    When given access to working looms, 89% of participants aged 60+ could reproduce their former weaving patterns within 15 minutes. This suggests embodied knowledge operates on different temporal scales than declarative memory.
  ])
]

#speaker-note[The haptic persistence finding is our most striking result -- the body remembers craft practice far longer than conscious narrative memory.]

== Finding 2: Cloth as Archive

#cols(columns: (1fr, 1fr), gutter: 1.3em)[
  #weave-card([Material Testimony], [
    Fabric samples triggered more detailed memories than photographs:
    - Touch activated *episodic recall* of specific workdays
    - Yarn texture evoked *social relationships* (who spun, who dyed)
    - Weave structure recalled *temporal rhythms* (shift patterns)
    - Fabric weight connected to *economic narratives* (quality grades)
  ])
][
  #stack(
    spacing: .8em,
    loom-quote([
      When I touch this cloth, I can feel Tuesday morning. The rain on the windows, Doris singing, the shuttle going back and forth. It all comes back through my fingers, not through my eyes.
    ], [-- Margaret Hartley, weaver, Saltaire (age 84)]),
    [#stitch-tag[Sensory Memory] #stitch-tag[Material Archive]],
  )
]

#speaker-note[Margaret Hartley's testimony exemplifies how cloth functions as a sensory archive -- activating memory through touch rather than visual recognition.]

== Finding 3: Pattern Language

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.3em)[
  #pattern-card([Local Design Vocabularies], [
    Each community maintained distinct *pattern languages* -- specific design conventions that functioned as cultural markers:
    - *Saltaire checks* -- asymmetric twill variations
    - *Huddersfield fancy* -- complex colour-and-weave effects
    - *Halifax grounds* -- dense warp-faced structures

    These patterns encoded community identity as legibly as dialect or accent.
  ])
][
  #pattern-card([Transmission Pathways], [
    Pattern knowledge moved through three primary channels:
    - *Workshop apprenticeship* -- direct body-to-body learning
    - *Sample books* -- material libraries circulating between mills
    - *Domestic practice* -- home weaving as cultural preservation

    Post-closure, domestic practice became the primary survival route for pattern knowledge.
  ], accent: palette.secondary)
]

#speaker-note[Local pattern languages functioned as textile dialects -- communities could identify cloth origin by structure alone.]

== Comparative Analysis

#figure[
  #set text(size: 0.85em)
  #table(
    columns: (auto, 1fr, 1fr, 1fr),
    fill: (_, row) => if row == 0 { palette.linen } else { palette.card },
    inset: (x: 1em, y: 0.6em),
    stroke: 0.5pt + palette.border,
    align: left,
    table.header(
      [#text(weight: "semibold", fill: palette.text-dark)[Dimension]],
      [#text(weight: "semibold", fill: palette.text-dark)[Saltaire]],
      [#text(weight: "semibold", fill: palette.text-dark)[Huddersfield]],
      [#text(weight: "semibold", fill: palette.text-dark)[Halifax]],
    ),
    [Haptic persistence], [Very high (92%)], [High (87%)], [Moderate (79%)],
    [Pattern recall], [Strong -- aided by tourist context], [Strong -- active guild], [Declining -- fewer practitioners],
    [Intergenerational transfer], [Low -- heritage frozen], [Moderate -- workshop model], [High -- family tradition],
    [Community narrative], [Museum-centred], [Practice-centred], [Family-centred],
    [Material archive], [Institutional (Salts Mill)], [Distributed (homes/studios)], [Fragmented (at risk)],
  )
]

#speaker-note[The comparative table reveals different survival strategies for textile knowledge across our three communities.]

= Implications & Policy

== Cultural Policy Recommendations

#cols(columns: (1fr, 1fr), gutter: 1.3em)[
  #bobbin-list[
    + Fund *living heritage* programmes that support active practice, not just museum display of historical objects.
    + Establish *intergenerational workshops* connecting retired textile workers with young makers and artists.
    + Create *material archives* that preserve cloth samples alongside oral histories for future researchers.
    + Develop *digital tools* for documenting embodied knowledge through motion capture and haptic recording.
  ]
][
  #stack(
    spacing: .8em,
    thread-box([Urgency], [
      With the youngest former industrial weavers now in their late 60s, we face a *10-15 year window* before this embodied knowledge is permanently lost. Material culture cannot be preserved in books alone -- it requires living hands.
    ], accent: palette.primary),
    weave-card([Funding Secured], [
      Arts Council England: #text(weight: "bold")[£340,000] for Phase 2 (2026-2028) -- expanding to Lancashire cotton communities and Nottingham lace-making traditions.
    ], accent: palette.accent),
  )
]

#speaker-note[Our policy recommendations centre on urgency -- this knowledge exists in ageing bodies and cannot wait for bureaucratic timelines.]

== Impact & Dissemination

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em,
    [#sampler-stat([6], [Peer-reviewed\ publications])],
    [#sampler-stat([2,400], [Community archive\ visitors], accent: palette.accent)],
    [#sampler-stat([3], [Policy briefings\ delivered], accent: palette.primary)],
  ),
  tapestry-box([Exhibition: Threads of Memory], [
    Touring exhibition combining participant-produced textiles with audio testimonies. Shown at: *Salts Mill Gallery* (2024), *Bankfield Museum Halifax* (2025), *Huddersfield Art Gallery* (2025). Catalogue includes commissioned essay by Tim Ingold.
  ]),
)

#speaker-note[The touring exhibition has been our most effective public engagement tool -- combining material and narrative in a space audiences can inhabit.]

== Future Directions

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.3em)[
  #weave-card([Phase 2: Expanding Scope], [
    - Lancashire cotton communities (Burnley, Blackburn)
    - Nottingham lace-making traditions
    - Comparative European dimension (Lyon silk, Biella wool)
    - Digital haptics -- recording touch through sensor gloves
  ])
][
  #weave-card([Methodological Development], [
    - *AI-assisted pattern analysis* of historical sample books
    - *3D motion capture* of weaving gestures for preservation
    - *Collaborative autoethnography* with practitioner-researchers
    - *Sensory archives* -- multi-modal digital repositories
  ], accent: palette.accent)
]

#speaker-note[Phase 2 expands geographically while deepening our methodological toolkit for documenting embodied knowledge.]

#focus-slide[
  The cloth remembers.\
  The hands remember.\
  Our task is to listen.
]

#speaker-note[Pause for effect. This distils our entire argument into three lines.]

= Acknowledgements

== Thank You

#cols(columns: (1fr, 1fr), gutter: 1.3em)[
  #stack(
    spacing: .8em,
    thread-box([Funding & Support], [
      - Arts Council England (2023-2025)
      - AHRC Cultural Heritage Programme
      - University of Leeds Faculty Research Fund
      - West Yorkshire Combined Authority Heritage
    ], accent: palette.primary),
    [#stitch-tag[AHRC] #stitch-tag[ACE] #stitch-tag[Heritage]],
  )
][
  #loom-quote[
    Above all, we thank the 47 participants who shared their hands, their memories, and their cloth with this project. This research belongs to them.
  ][-- The Research Team]
]

#speaker-note[Always acknowledge participants first. This work is theirs.]

#ending-slide[Thank You]

#speaker-note[Invite questions. Mention that fabric samples from the research are available to handle in the foyer.]
