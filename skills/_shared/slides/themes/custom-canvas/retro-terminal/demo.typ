// Demo: Retro Terminal Theme -- "The History of Computing: From ENIAC to the Cloud"
// Showcases all slide types and components

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#set text(font: ("IBM Plex Mono", "DejaVu Sans Mono"), size: 16pt)

#show: retro-terminal-theme.with(
  aspect-ratio: "16-9",
  footer: [retro-terminal v1.0],
  preset: "green",
  config-info(
    title: [The History of Computing],
    subtitle: [From ENIAC to the Cloud],
    author: [Dr. Alan Hackerman],
    date: datetime(year: 2026, month: 5, day: 23),
    institution: [MIT Computer Science],
  ),
  config-common(breakable: false),
)

// =====================================================
// Title Slide (boot sequence style)
// =====================================================

#title-slide()

// =====================================================
// Section 1: The Dawn of Computing
// =====================================================

= The Dawn of Computing

== The Room-Sized Computers

- ENIAC (1945): 30 tons, 18,000 vacuum tubes
- UNIVAC I (1951): First commercial computer
- IBM 704 (1954): First mass-produced scientific computer
- Power consumption: enough to light a small town

== The Vacuum Tube Era

#cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true)[
  #terminal-card([/var/log/eniac], user: "operator", host: "eniac")[
    Vacuum tubes generated enormous heat.

    Operators had to replace tubes daily.

    Mean time between failures: 5.6 hours.
  ]
][
  #terminal-card([/proc/specs], user: "root", host: "univac")[
    Weight: 29,000 lbs

    Floor space: 1,800 sq ft

    Clock speed: 100 kHz

    Memory: 1,000 words
  ]
]

== Early Programming

#stack(
  spacing: .8em,
  boot-text([LOADING punch\_card\_reader...]),
  stdout-box[
    Programs were entered via punch cards.
    A single typo meant re-punching the entire deck.
    Grace Hopper found the first actual "bug" in 1947.
  ],
  pipe-divider(),
  cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
    #process-stat([001], [Cards/min], [150])
  ][
    #process-stat([002], [Operators], [6])
  ][
    #process-stat([003], [Tubes], [18000])
  ],
)

// =====================================================
// Section 2: The Terminal Era
// =====================================================

= The Terminal Era

== Green Screen Revolution

#stack(
  spacing: .8em,
  man-quote([terminals])[
    The VT100, introduced by DEC in 1978, became the de facto standard for terminal emulation. Its ANSI escape codes still live on in every terminal emulator today.
  ],
  cols(columns: (1fr, 1fr), gutter: 20pt)[
    #stack(
      spacing: .8em,
      [
        #command-tag[VT100]
        #h(0.3em)
        #command-tag(color: presets.blue.phosphor)[IBM 3270]
        #h(0.3em)
        #command-tag[ADM-3A]
      ],
      [The green phosphor P1 display became iconic for an entire generation of programmers.],
    )
  ][
    #stdout-box[
      echo "Hello, World!"

      Hello, World!

      \$ \_
    ]
  ],
)

== The Rise of Unix

#dark-slide(title: [Unix: The Operating System])[
  #cols(columns: (1fr, 1fr))[
    #stack(
      spacing: .8em,
      stdout-box(color: presets.amber.phosphor)[
        cat /etc/passwd

        root:x:0:0:root:/root

        ken:x:1:1:Ken Thompson

        dmr:x:2:2:Dennis Ritchie
      ],
      [Born at Bell Labs in 1969, Unix introduced concepts that remain fundamental: pipes, file descriptors, and "everything is a file."],
    )
  ][
    #terminal-card([/usr/history], user: "ken", host: "pdp11", color: presets.amber.phosphor)[
      1969 -- First Unix on PDP-7

      1973 -- Rewritten in C

      1975 -- Version 6 released

      1983 -- BSD 4.2 with TCP/IP
    ]
  ]
]

== C: The Language That Built Unix

#cols(columns: (3fr, 2fr), gutter: 20pt)[
  #stack(
    spacing: .8em,
    [
      ```c
      /* hello.c — Bell Labs, circa 1974 */
      #include <stdio.h>

      int main(void) {
          printf("hello, world\n");
          return 0;
      }
      ```
    ],
    [
      ```sh
      $ cc hello.c -o hello
      $ ./hello
      hello, world
      ```
    ],
  )
][
  #terminal-card([/usr/history], user: "dmr", host: "pdp11")[
    1972 -- C created by Dennis Ritchie

    1973 -- Unix rewritten in C

    1978 -- "The C Programming Language"

    1989 -- ANSI C standard ratified
  ]
]

== Networking Begins

#stack(
  spacing: .8em,
  stack(
    spacing: .8em,
    grid(
      columns: (1fr, auto),
      boot-text([INIT arpanet\_interface...]),
      ok-marker(),
    ),
    grid(
      columns: (1fr, auto),
      boot-text([TX LOGIN (halted after LO)...]),
      fail-marker(),
    ),
  ),
  cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true)[
    #terminal-card([/net/history], user: "vint", host: "arpa")[
      1969: ARPANET goes live (4 nodes)

      1971: First email sent

      1973: TCP/IP conceived

      1983: DNS introduced
    ]
  ][
    #man-quote([protocols])[
      The transition from NCP to TCP/IP on January 1, 1983 -- known as "flag day" -- unified the network into what would become the Internet.
    ]
  ],
)

// =====================================================
// Section 3: The Personal Computer
// =====================================================

= The Personal Computer

== From Mainframe to Desktop

#stack(
  spacing: .8em,
  pipe-divider(),
  cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
    #process-stat([101], [Apple II (1977)], [\$1,298])
  ][
    #process-stat([102], [IBM PC (1981)], [\$1,565])
  ][
    #process-stat([103], [Mac (1984)], [\$2,495])
  ],
  pipe-divider(),
  stack(
    spacing: .8em,
    system-line[The personal computer revolution put computing power on every desk.],
    system-line[By 1990, over 50 million PCs were in American homes.],
  ),
)

== The GUI Revolution

#dark-slide(title: [Windows, Icons, Menus, Pointer])[
  #stack(
    spacing: .8em,
    [The Xerox Alto (1973) pioneered the graphical interface, but it took Apple's Macintosh (1984) to bring it to consumers.],
    cols(columns: (1fr, 1fr), gutter: 20pt)[
      #stdout-box(color: presets.amber.phosphor)[
        ls /dev/mouse

        /dev/mouse0

        \$ xinit

        Starting X Window System...
      ]
    ][
      #stack(
        spacing: .8em,
        [
          #command-tag(color: presets.amber.phosphor)[Xerox PARC]
          #h(0.3em)
          #command-tag(color: presets.amber.phosphor)[Apple Lisa]
          #h(0.3em)
          #command-tag(color: presets.amber.phosphor)[Windows 1.0]
        ],
        [Despite the GUI revolution, the terminal never died. It evolved.],
      )
    ],
  )
]

// =====================================================
// Section 4: The Internet Age
// =====================================================

= The Internet Age

== The World Wide Web

#stack(
  spacing: .8em,
  man-quote([www])[
    Tim Berners-Lee at CERN created HTML, HTTP, and the first web browser in 1990. By 1995, the web was the killer application that brought millions online.
  ],
  cols(columns: (1fr, 1fr), gutter: 20pt)[
    #terminal-card([/var/www], user: "tbl", host: "cern")[
      GET / HTTP/1.0

      Host: info.cern.ch

      200 OK

      Content-Type: text/html
    ]
  ][
    #stack(
      spacing: .8em,
      process-stat([443], [Web Users (1995)], [16M]),
      process-stat([444], [Web Users (2000)], [361M]),
    )
  ],
)

== The Cloud Computing Era

#stack(
  spacing: .8em,
  grid(
    columns: (1fr, auto),
    boot-text([CONNECTING to cloud\_services...]),
    ok-marker(),
  ),
  cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: true)[
    #terminal-card([/cloud/timeline], user: "admin", host: "aws")[
      2006 -- AWS launches EC2

      2008 -- Google App Engine

      2010 -- Microsoft Azure

      2013 -- Docker containers

      2014 -- Kubernetes released
    ]
  ][
    #stdout-box[
      kubectl get pods

      NAME            READY   STATUS

      web-app-01      1/1     Running

      db-primary      1/1     Running

      cache-redis     1/1     Running
    ]
  ],
)

// =====================================================
// Focus + Ending
// =====================================================

#focus-slide[
  The terminal is dead.

  Long live the terminal.
]

#ending-slide[Connection Closed]
