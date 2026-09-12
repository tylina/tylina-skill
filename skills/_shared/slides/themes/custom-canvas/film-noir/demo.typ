#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: film-noir-theme.with(
  aspect-ratio: "16-9",
  footer: [Case \#4471],
  preset: "classic",
  config-info(
    title: [The Art of Deception],
    subtitle: [A Study in Criminal Psychology],
    author: [Detective Bureau - Division 7],
    date: datetime(year: 1947, month: 11, day: 15),
    institution: [Metropolitan Noir Pictures],
  ),
  config-common(breakable: false),
)

#title-slide()

= The Crime Scene

== Evidence Analysis

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  evidence-box([Primary Evidence], [
    The victim was found at 2:47 AM in the alley behind the Starlight Lounge. Three witnesses reported hearing a single gunshot at approximately 2:30 AM. Shell casing recovered: .38 Special.
  ]),
  blind-card([Timeline Reconstruction], [
    - 11:00 PM --- Victim arrives at the Lounge
    - 12:30 AM --- Argument with unknown male
    - 1:45 AM --- Victim seen leaving alone
    - 2:30 AM --- Gunshot reported
    - 2:47 AM --- Body discovered by bartender
  ]),
)

== Witness Testimonies

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
  witness-stat([Witnesses], [7], description: [interviewed to date]),
  witness-stat([Suspects], [3], description: [persons of interest]),
  witness-stat([Days Open], [12], description: [and counting]),
)

#v(0.5em)
#voiceover-quote([She walked into my office like trouble in a red dress. Said her husband was missing. Said she was worried. But her eyes told a different story --- they told me she already knew where the body was.], cite: "Det. Marcus Webb")

== Suspect Profiles

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  dossier-card([RUSSO, Vincent A.], [
    Known associate of the Moretti family. Last seen at the Starlight Lounge on the night in question. Alibi: claims to have been at a card game on 5th Street. #suspect-tag[PRIME SUSPECT]
  ]),
  dossier-card([THORNE, Eleanor M.], [
    Victim's business partner. Insurance policy beneficiary for \$50,000. Reported no contact with victim since Tuesday. #suspect-tag[PERSON OF INTEREST]
  ]),
)

= The Investigation

== The Method

#spotlight-highlight[
  The killer knew the victim's routine. This was not a crime of opportunity --- it was a carefully planned execution. The weapon was never recovered, suggesting premeditation and escape planning.
]

#v(0.5em)
#reel-divider()
#v(0.3em)

Analysis suggests a close associate with knowledge of the victim's schedule and financial affairs.

== Case Parallels

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  flashback-block[
    *The Morrison Case (1943)* --- Similar methodology observed. Victim was a business owner found in an alley at night. Single gunshot, .38 caliber. Killer was the victim's own attorney. Motive: embezzlement cover-up. Case solved in 47 days.
  ],
  flashback-block[
    *The Whitmore Affair (1945)* --- Insurance fraud scheme. Beneficiary orchestrated the killing through a hired professional. The hitman was traced through the weapon purchase. Took 83 days to resolve.
  ],
)

== Criminal Psychology

#title-card[Every killer believes they are the exception. They believe their plan is flawless. But perfection itself is a tell.]

#v(0.8em)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  evidence-box([Behavioral Profile], [
    - Organized methodology (planned, not impulsive)
    - Knowledge of victim's habits
    - Financial motive suspected
    - No forensic evidence left behind
  ]),
  block(width: 100%, inset: (y: 0.5em))[
    #witness-stat([Probability], [87%], description: [the killer knew the victim personally])
  ],
)

= Resolution

== The Reveal

#voiceover-quote([The truth is never what you expect. It is never clean. It is never simple. But it is always there, waiting in the shadows for someone to pull back the blinds.], cite: "Case Notes, Nov 1947")

#v(0.5em)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  blind-card([Key Discovery], [
    Financial records recovered from the Thorne-Hartley partnership reveal systematic embezzlement totaling \$127,000 over eighteen months. The victim had discovered the discrepancy and scheduled a meeting with authorities for the morning of November 16th --- the day after the murder.
  ]),
  evidence-box([Final Report], [
    Eleanor Thorne arrested on November 28th. Murder weapon recovered from the East River. Confession obtained after confrontation with financial evidence. Case closed after 14 days.
  ]),
)

#focus-slide[
  In this city, the truth hides in plain sight. \
  You just have to know where to look.
]

#ending-slide[Case Closed]
