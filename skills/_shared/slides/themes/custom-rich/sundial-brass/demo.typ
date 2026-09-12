// Sundial Brass Theme Demo — The Science of Timekeeping
// Academic presentation on sundials, horology, and celestial mechanics
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: sundial-brass-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Horology -- The Science of Measuring Time],
  config-info(
    title: [The Art and Science of Sundials],
    subtitle: [From Ancient Gnomons to Precision Instruments],
    author: [Prof. Theodore Meridian],
    institution: [Department of History of Science, Chrono University],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundations
// ══════════════════════════════════════
= Foundations of Timekeeping

== The Gnomon and the Shadow

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  hour-card([The Gnomon Principle], [
    A *gnomon* turns a cast shadow into a time-and-direction instrument:
    - Shadow length reveals solar altitude
    - Shadow direction identifies the hour
    - Documented shadow clocks date to c. 3500 BCE
  ], accent: palette.brass),
  hour-card([Shadow Geometry], [
    The shadow of a gnomon traces a *hyperbola* on a horizontal plane:
    - Equinoxes produce a straight trace
    - Solstices produce maximum curvature
    - The *diurnal arc* changes with solar declination
  ], accent: palette.navy),
)

#v(.8em)

#gear-box([Key Equation], [
  For latitude $phi$ and declination $delta$, the hour angle $H$ gives:
  $ tan(theta) = (sin(H)) / (sin(phi) dot cos(H) - cos(phi) dot tan(delta)) $
])

== Types of Sundials

#stack(
  spacing: .8em,
  grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
    hour-card([Horizontal], [
      Dial plate lies flat on the ground. Gnomon angle equals the latitude. Most common garden sundial type.
    ], accent: palette.brass),
    hour-card([Vertical], [
      Mounted on south-facing walls. Hour lines are computed differently based on wall declination.
    ], accent: palette.navy),
    hour-card([Equatorial], [
      Dial plate parallel to the celestial equator. Hour lines are equally spaced at 15 degrees apart.
    ], accent: palette.patina),
  ),
  grid(columns: (1fr, 1fr), gutter: 1.2em,
    armillary-box([Universal Sundials], [
      Some designs work at any latitude. The *armillary sundial* uses concentric rings representing celestial circles. The equatorial ring is tilted to the local latitude, and the gnomon aligns with the polar axis.
    ], accent: palette.navy),
    engraving-card([Precision Markings], [
      Master sundial makers engraved hour lines, half-hour marks, declination curves, and zodiac symbols. The finest instruments achieved accuracy within 1-2 minutes of solar time.
    ], accent: palette.brass),
  ),
)

// ══════════════════════════════════════
// Section 2: Mathematics
// ══════════════════════════════════════
= Mathematical Principles

== Hour Line Calculations

#cols[
  #hour-card([Hour Angle Theory], [
    The Sun moves 15 degrees per hour across the sky. On a horizontal sundial at latitude $phi$:

    $ tan(theta_n) = sin(phi) dot tan(15 degree dot n) $

    where $theta_n$ is the angle of the $n$-th hour line from the noon line.

    This elegant formula shows why sundials are latitude-specific instruments.
  ], accent: palette.brass)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.6em,
    epoch-tag([Latitude], color: palette.brass),
    epoch-tag([Declination], color: palette.navy),
    epoch-tag([Hour Angle], color: palette.patina),
  )
][
  #gear-box([Computed Hour Lines], [
    For latitude $phi = 51.5 degree$ (London):
    - 6:00 AM / 6:00 PM: $theta = 90 degree$
    - 7:00 AM / 5:00 PM: $theta = 69.8 degree$
    - 8:00 AM / 4:00 PM: $theta = 53.0 degree$
    - 9:00 AM / 3:00 PM: $theta = 38.9 degree$
    - 10:00 AM / 2:00 PM: $theta = 26.6 degree$
    - 11:00 AM / 1:00 PM: $theta = 14.3 degree$
    - 12:00 noon: $theta = 0 degree$ (meridian)
  ], accent: palette.brass)

  #v(0.4em)

  #gnomon-stat([Gnomon Angle], [$51.5 degree$], description: [Equal to the observer's geographic latitude], color: palette.brass)
]

== The Equation of Time

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  hour-card([Solar vs. Clock Time], [
    A sundial reads *apparent solar time*. The *Equation of Time* (EoT) converts it to mean clock time:

    $ "EoT" = "Apparent Solar Time" - "Mean Solar Time" $

    Its seasonal variation (-14 to +16 minutes) comes from orbital eccentricity and axial tilt.

    With $B = frac(360, 365)(d-81)$ degrees, a useful approximation is:
    #mitex(`\mathrm{EoT} \approx 9.87\sin 2B - 7.53\cos B - 1.5\sin B \; \text{(min)}`)
  ], accent: palette.brass),
  hour-card([The Analemma], [
    If you photograph the Sun's position at the same clock time each day for a year, it traces a *figure-8* curve: the *analemma*.

    - Vertical extent: caused by axial tilt ($plus.minus 23.4 degree$)
    - Horizontal extent: caused by the Equation of Time ($plus.minus 16$ min)
    - The analemma is the key to converting sundial readings to clock time
  ], accent: palette.navy),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em,
  gnomon-stat([Max Fast], [+16 min], description: [Nov 3], color: palette.brass),
  gnomon-stat([Max Slow], [-14 min], description: [Feb 12], color: palette.navy),
  gnomon-stat([Zero EoT], [4 times], description: [Per year], color: palette.patina),
  gnomon-stat([Period], [365.25 d], description: [Annual cycle], color: palette.brass),
)

// ══════════════════════════════════════
// Section 3: Historical Development
// ══════════════════════════════════════
= Historical Development

== Ancient Sundials

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  hour-card([Egyptian Obelisks], [
    The earliest known sundials:
    - *Shadow clocks* (c. 1500 BCE): L-shaped devices
    - *Obelisks*: monumental gnomons marking seasonal time
    - *Merkhet*: plumb-line instrument for star transit timing
    - Division of daylight into 12 *temporal hours*
  ], accent: palette.brass),
  hour-card([Greek Innovations], [
    Greek astronomers advanced sundial theory:
    - *Anaximander* (c. 560 BCE): introduced the gnomon to Greece
    - *Aristarchus*: hemispherical sundial (scaphe)
    - *Eratosthenes*: used shadow lengths to measure Earth
    - *Ptolemy*: mathematical theory of hour lines
  ], accent: palette.navy),
)

#v(0.4em)

#meridian-quote([
  "The shadow is the messenger of time, tracing upon stone the silent passage of the celestial sphere."
], attribution: [Vitruvius, De Architectura, Book IX])

== Medieval and Renaissance Masters

#cols[
  #chronometer-list((
    [Islamic astronomers develop sophisticated vertical sundials for mosque walls (9th century)],
    [Ibn al-Shatir creates the finest sundial of Damascus Great Mosque (1371 CE)],
    [European cathedral sundials mark canonical hours for monastic prayer],
    [Renaissance brings scientific precision: Regiomontanus, Apianus publish dial treatises],
    [Portable diptych dials made in Nuremberg become luxury trade items (16th century)],
  ), accent: palette.brass)
][
  #engraving-card([Master Craftsmen], [
    The *Nuremberg school* of sundial makers (1450-1650) produced exquisite portable instruments:
    - Ivory diptych dials with compass
    - Polyhedral sundials showing multiple projections
    - Rings dials worn as jewelry
    - Astronomical compendia combining multiple instruments
  ], accent: palette.brass)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    epoch-tag([IX sec.], color: palette.brass),
    epoch-tag([XIV sec.], color: palette.navy),
    epoch-tag([XVI sec.], color: palette.patina),
  )
]

// ══════════════════════════════════════
// Section 4: Precision Instruments
// ══════════════════════════════════════
= Precision Instruments

== The Sundial as Scientific Tool

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  hour-card([Monumental Sundials], [
    Large-scale sundials achieved remarkable precision:
    - *Jantar Mantar* (Jaipur, 1734): Samrat Yantra gnomon is 27m tall, reads to 2-second accuracy
    - *Meridian lines* in cathedrals: used to determine Easter date
    - *Sundial corrections*: published tables for Equation of Time allowed conversion to mean time
  ], accent: palette.brass),
  hour-card([Scientific Applications], [
    Beyond telling time, sundials were used for:
    - Determining geographic longitude (by comparing local time)
    - Surveying and establishing true north
    - Calibrating mechanical clocks
    - Astronomical observations (solstice, equinox dates)
    - Verifying theories of planetary motion
  ], accent: palette.navy),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  gnomon-stat([Height], [27 m], description: [Samrat Yantra gnomon], color: palette.brass),
  gnomon-stat([Accuracy], [2 sec], description: [Time resolution achieved], color: palette.navy),
  gnomon-stat([Built], [1734], description: [Jai Singh II, Jaipur], color: palette.patina),
)

== Clockwork and the Transition

#cols[
  #hour-card([Mechanical Escapement], [
    The invention of the *verge escapement* (c. 1280) began the transition from sundials to mechanical clocks:

    - Early clocks: $plus.minus 15$ minutes per day accuracy
    - Pendulum clock (1656): $plus.minus 10$ seconds per day
    - Marine chronometer (1761): $plus.minus 5$ seconds per day
    - Quartz oscillator (1927): $plus.minus 0.001$ seconds per day

    Yet sundials remained the *reference standard* for calibrating clocks until the 19th century.
  ], accent: palette.brass)

  #v(0.4em)

  #dial-divider(width: 90%)
][
  #armillary-box([The Celestial Reference], [
    Sundials measure *apparent solar time* directly from the Sun. Unlike mechanical clocks, they preserve a direct connection to celestial mechanics: Earth's rotation remains the reference.
  ], accent: palette.navy)

  #v(0.4em)

  #gear-box([Precision Timeline], [
    - 3500 BCE: First shadow clocks
    - 300 BCE: Mathematical sundial theory
    - 1280 CE: Mechanical escapement
    - 1761 CE: Marine chronometer
    - 1967 CE: Atomic time standard (cesium)
  ], accent: palette.brass)
]

// ══════════════════════════════════════
// Section 5: Modern Applications
// ══════════════════════════════════════
= Modern Relevance

== Contemporary Sundial Design

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  #stack(spacing: .8em,
    hour-card([Artistic Sundials], [
      Modern sundial artists create works that blend science and sculpture:
      - *Digital sundials* cast shadow numerals
      - *Analemmatic dials* use the viewer as gnomon
      - *Mirror dials* bring solar time indoors
      - *Nodus designs* also mark calendar dates
    ], accent: palette.brass),
    engraving-card([Design Challenge], [
      Building a sundial unites celestial geometry, materials, composition, and local geography — a distinctly interdisciplinary craft.
    ], accent: palette.brass),
  )
][
  #stack(spacing: .8em,
    hour-card([Educational Value], [
      Sundials remain powerful teaching tools:
      - Demonstrate Earth's rotation and axial tilt directly
      - Connect abstract geometry to physical reality
      - Illustrate the history of science and technology
      - Inspire interdisciplinary thinking (art + math + astronomy)
      - Encourage outdoor observation and patience
    ], accent: palette.patina),
    meridian-quote([
      "A sundial is a clock that counts by light rather than by mechanism — it speaks directly of our place beneath the sky."
    ], attribution: [Denis Savoie, sundial scholar]),
  )
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"I am a sundial, and I make a botch / Of what is done far better by a watch."_

  #text(size: 0.6em, weight: "regular", fill: palette.text-muted)[— Hilaire Belloc, 1938]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
