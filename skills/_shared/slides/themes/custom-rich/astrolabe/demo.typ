// Astrolabe Theme Demo — Celestial Navigation and Timekeeping
// Academic presentation on the history and science of astrolabes
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: astrolabe-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Celestial Mechanics -- Astronomical Instruments],
  config-info(
    title: [Celestial Navigation and Timekeeping],
    subtitle: [The Astrolabe as Scientific Instrument],
    author: [Dr. Cassandra Voss],
    institution: [Institute for History of Science, Meridian University],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundations
// ══════════════════════════════════════
= Origins and Principles

== What is an Astrolabe?

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  dial-card([Definition], [
    An *astrolabe* is a sophisticated inclinometer historically used by astronomers and navigators to:
    - Measure the altitude of celestial bodies
    - Determine local time from stellar positions
    - Identify stars and constellations
    - Solve problems in spherical astronomy
  ], accent: palette.brass),
  dial-card([Key Components], [
    - *Mater*: the main body disc with degree scale
    - *Tympan (plate)*: engraved celestial coordinate grid
    - *Rete*: rotating star map overlay
    - *Alidade*: sighting rule for observations
    - *Rule*: rotating pointer for readings
  ], accent: palette.copper),
)

#v(0.5em)

#rete-box([Historical Significance], [
  Invented in Hellenistic Greece (c. 150 BCE), refined in the Islamic Golden Age, and transmitted to medieval Europe. The astrolabe remained the primary astronomical computing device for over 1500 years.
])

== Types of Astrolabes

#grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
  dial-card([Planispheric], [
    Projects the celestial sphere onto a plane using stereographic projection. The most common form, suitable for a specific latitude.
  ], accent: palette.brass),
  dial-card([Universal], [
    Uses alternative projections to work at any latitude. More complex but versatile for travelers.
  ], accent: palette.copper),
  dial-card([Mariner's], [
    Simplified version for navigation at sea. Reduced features focused on altitude measurement.
  ], accent: palette.navy-muted),
)

#v(0.4em)

#observation-note([Research Note], [
  Over 1500 historical astrolabes survive in museum collections worldwide. The oldest known complete specimen dates to 927 CE and was crafted in Isfahan.
])

// ══════════════════════════════════════
// Section 2: Mathematical Principles
// ══════════════════════════════════════
= Mathematical Foundations

== Stereographic Projection

#cols[
  #dial-card([The Core Mathematics], [
    Stereographic projection maps the celestial sphere onto a flat plane:
    - Preserves circles (circles on the sphere map to circles on the plane)
    - Conformal (preserves angles locally)
    - Projects from the south celestial pole onto the plane of the equator

    The projection formula for a point at declination $delta$:

    $ r = R cos(delta) / (1 + sin(delta)) $

    where $R$ is the radius of the equator circle.
  ], accent: palette.brass)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.6em,
    degree-tag([Conformal], color: palette.brass),
    degree-tag([Circle-preserving], color: palette.copper),
    degree-tag([Bijective], color: palette.navy-muted),
  )
][
  #rete-box([Why Stereographic?], [
    Among all azimuthal projections, only stereographic projection maps every circle on the sphere to a circle on the plane. This means:
    - Horizon circles remain circles
    - Altitude circles remain circles
    - The ecliptic remains a circle
    - Star positions can be plotted as simple points
  ])

  #v(0.5em)

  #plate-box([Projection Code], [
    ```
    def stereo_project(dec, lat):
        R = 1.0  # equator radius
        r = R * cos(dec) / (1 + sin(dec))
        return r
    ```
  ])
]

== Coordinate Systems

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  dial-card([Equatorial Coordinates], [
    Fixed to the celestial sphere:
    - *Right Ascension* ($alpha$): measured eastward along equator (0h to 24h)
    - *Declination* ($delta$): angular distance from equator (-90 to +90 degrees)

    These coordinates are independent of the observer's location.
  ], accent: palette.brass),
  dial-card([Horizontal Coordinates], [
    Fixed to the observer's location:
    - *Azimuth*: direction along horizon (N=0, E=90, S=180, W=270 degrees)
    - *Altitude*: angle above horizon (0 to 90 degrees)

    These coordinates change with time and location.
  ], accent: palette.copper),
)

#v(0.4em)

#grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
  azimuth-card([Celestial Equator], [$0 degree$]),
  azimuth-card([North Pole], [$+90 degree$], color: palette.copper),
  azimuth-card([Ecliptic Tilt], [$23.4 degree$], color: palette.navy-muted),
)

// ══════════════════════════════════════
// Section 3: Construction
// ══════════════════════════════════════
= Instrument Construction

== The Tympan (Plate)

#cols[
  #dial-card([Engraved Elements], [
    The local coordinate system is engraved as:
    - *Altitude circles*: concentric arcs from horizon to zenith
    - *Azimuth lines*: radial bearings from zenith to horizon
    - *Horizon and twilight*: reference circle and -6, -12, -18 degree lines
    - *Unequal hours*: seasonal timekeeping
  ], accent: palette.brass)

  #v(0.4em)

  #altitude-stat([Precision], [0.5 deg], [Typical angular accuracy of a well-made brass astrolabe], color: palette.brass)
][
  #quadrant-grid(
    [Zenith], [Directly overhead; the center of the projection],
    [Nadir], [Opposite point, below the horizon],
    [Horizon], [Circle dividing visible and hidden sky],
    [Meridian], [North-south line through zenith; noon reference],
  )

  #v(0.4em)

  #observation-note([Craftsmanship], [
    Isfahan makers engraved scales to 1/6 degree using hand tools and geometric construction.
  ])
]

== The Rete (Star Map)

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  dial-card([Structure], [
    The rete is an openwork rotating overlay containing:
    - *Ecliptic circle*: the Sun's annual path, divided into 12 zodiac segments of 30 degrees each
    - *Star pointers*: small tips marking bright reference stars (typically 20-30 stars)
    - *Decorative framework*: artistic metalwork connecting star pointers

    The rete rotates over the tympan to simulate the sky's daily rotation.
  ], accent: palette.brass),
  dial-card([Key Stars], [
    Common reference stars on medieval astrolabe retes:
    - Aldebaran (alpha Tauri)
    - Sirius (alpha Canis Majoris)
    - Vega (alpha Lyrae)
    - Altair (alpha Aquilae)
    - Capella (alpha Aurigae)
    - Regulus (alpha Leonis)
    - Spica (alpha Virginis)
  ], accent: palette.copper),
)

#v(0.3em)

#ecliptic-divider(width: 70%)

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em,
  azimuth-card([Stars on rete], [20-30]),
  azimuth-card([Zodiac signs], [12], color: palette.copper),
  azimuth-card([Degree marks], [360], color: palette.navy-muted),
  azimuth-card([Accuracy], [< 1 deg], color: palette.brass),
)

// ══════════════════════════════════════
// Section 4: Practical Applications
// ══════════════════════════════════════
= Practical Applications

== Timekeeping

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  dial-card([Finding Local Time], [
    *Procedure:*
    + Measure the altitude of the Sun (or a known star) with the alidade
    + Rotate the rete until the Sun's ecliptic position (or star pointer) lies on the correct altitude circle
    + Read the time from the hour scale on the limb

    This gives local apparent solar time to within a few minutes.
  ], accent: palette.brass),
  dial-card([Time Applications], [
    - *Prayer times*: critical in Islamic civilization for determining salat times
    - *Seasonal hours*: dividing daylight into 12 equal parts (length varies by season)
    - *Equal hours*: the modern 24-hour system
    - *Sidereal time*: tracking star positions for observation planning
  ], accent: palette.copper),
)

#v(0.8em)

#grid(columns: (1fr, 1fr, 1fr), gutter: 0.7em,
  meridian-card([1], [Observe], [Sight the Sun or a bright star; read its altitude from the degree scale.]),
  meridian-card([2], [Set the Rete], [Rotate the rete until the body meets the matching altitude circle.]),
  meridian-card([3], [Read Time], [Read the current time from the rule or rete index.]),
)

== Navigation

#cols[
  #dial-card([Latitude Determination], [
    *Method 1 — Pole Star altitude:*
    The altitude of Polaris equals the observer's latitude (approximately).

    *Method 2 — Meridian transit:*
    Measure the Sun's maximum altitude at local noon, then:
    $ phi = 90 degree - h_"max" + delta_"Sun" $
    where $h_"max"$ is the noon altitude and $delta_"Sun"$ is the solar declination.
  ], accent: palette.brass)

  #v(0.5em)

  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.8em,
    azimuth-card([Latitude range], [0-90 deg]),
    azimuth-card([Typical error], [< 1 deg], color: palette.copper),
    azimuth-card([Stars needed], [1-3], color: palette.navy-muted),
  )
][
  #rete-box([Qibla Direction], [
    Given known coordinates, the astrolabe determined the direction of Mecca geometrically through projection.
  ])

  #v(0.5em)

  #plate-box([Spherical Triangle], [
    The triangle connects zenith, celestial pole, and celestial body; solving it yields hour angle, azimuth, and altitude.

    For altitude $h$:
    #mitex(`\sin h = \sin\phi\sin\delta + \cos\phi\cos\delta\cos H`)
  ])

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    degree-tag([Spherical Trig], color: palette.brass),
    degree-tag([Navigation], color: palette.copper),
  )
]

// ══════════════════════════════════════
// Section 5: Historical Transmission
// ══════════════════════════════════════
= Cultural Transmission

== Islamic Golden Age

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  dial-card([Major Contributors], [
    - *Al-Fazari* (8th c.): earliest known Islamic astrolabe treatise
    - *Al-Khwarizmi* (9th c.): tables for astrolabe construction
    - *Al-Sufi* (10th c.): star catalog with astrolabe positions
    - *Al-Zarqali* (11th c.): universal astrolabe (saphaea)
    - *Al-Biruni* (11th c.): comprehensive instrument treatise
  ], accent: palette.brass),
  dial-card([Innovations], [
    Islamic astronomers vastly improved the astrolabe:
    - Universal designs working at any latitude
    - More precise star catalogs
    - Additional computational scales
    - Artistic refinement of rete designs
    - Specialized variants (linear, spherical)
  ], accent: palette.copper),
)

#v(0.8em)

#cols(columns: (1fr, 1fr), gutter: 0.8em,
  altitude-stat([Active Period], [800 yrs], [Islamic tradition, 8th--16th century CE], color: palette.brass),
  altitude-stat([Surviving Instruments], [~600], [Astrolabes in world museum collections], color: palette.copper),
)

== European Reception

#cols[
  #dial-card([Transmission Routes], [
    European adoption followed four routes:
    - *Al-Andalus*: Toledo translations (12th c.)
    - *Sicily*: Roger II's multilingual court
    - *Crusader states*: contact with Islamic scholars
    - *Byzantium*: parallel Greek tradition

    Chaucer's 1391 English treatise widened its audience.
  ], accent: palette.brass)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    degree-tag([Toledo], color: palette.brass),
    degree-tag([Sicily], color: palette.copper),
    degree-tag([Oxford], color: palette.navy-muted),
  )
][
  #quadrant-grid(
    [12th Century], [Arabic-Latin translations; first European instruments],
    [13th Century], [University curricula and Sacrobosco texts],
    [14th Century], [Chaucer and expanding guild production],
    [15th-16th Century], [Craft peak; specialist tools replace it],
  )

  #v(0.3em)

  #observation-note([Legacy], [
    Telescopes, chronometers, sextants, and mechanical computers gradually displaced it.
  ])
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"The astrolabe is a summary of the universe, containing within itself all the operations of astronomy."_

  #text(size: 0.6em, weight: "regular", fill: palette.text-muted)[-- Messahalla (Masha'allah ibn Athari), 8th century]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
