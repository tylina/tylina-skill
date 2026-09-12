#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

// Typography belongs to deck content, not the reusable theme.
#set text(font: ("DejaVu Sans Mono", "Noto Sans SC"))

#show: pixel-retro-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Level Up Your Code],
    subtitle: [Game Dev Workshop 2024 -- Building Worlds with Rust & Bevy],
    author: [Player One: Alex "PixelCraft" Chen],
    date: datetime.today(),
    institution: [NeonByte Studios],
  ),
)

// ═══ Title Screen ═══

#title-slide()

// ═══ Quest Map (TOC) ═══

== Quest Map

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #pixel-card(1, [Character Creation], [Dev environment setup, class picking, and stat rolling.], accent: palette.green)
][
  #pixel-card(2, [Quest Log], [ECS architecture and rendering pipeline.], accent: palette.pink)
]

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #pixel-card(3, [Boss Battle], [Memory dragons and async nightmares.], accent: palette.blue)
][
  #pixel-card(4, [Achievement Unlocked], [Benchmarks, results, and loot drops.], accent: palette.gold)
]

= Character Creation

== Choose Your Class

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #level-card(1, [Warrior -- Systems Dev], [
    - Primary: Rust / C++
    - Armor: Memory safety
    - Weapon: Zero-cost abstractions
    - Weakness: Compile times
  ])
][
  #level-card(2, [Mage -- Graphics Dev], [
    - Primary: WGSL / GLSL
    - Armor: Shader pipelines
    - Weapon: GPU compute
    - Weakness: Driver bugs
  ])
][
  #level-card(3, [Rogue -- Gameplay Dev], [
    - Primary: Scripting / ECS
    - Armor: Hot reloading
    - Weapon: Rapid iteration
    - Weakness: Spaghetti logic
  ])
]

== Dev Environment Setup

#cols(columns: (3fr, 2fr), lazy-layout: true)[
  #terminal-box(title: [setup.sh])[
    ```sh
    $ rustup update stable
    $ cargo install bevy_cli
    $ cargo new my-game
    $ cd my-game
    $ cargo add bevy
    $ cargo run

    OK Compiling my-game v0.1.0
    OK Running `target/debug/my-game`
    ```
  ]
][
  #neon-box([Inventory Check], color: palette.blue)[
    #badge([Rust 1.78+]) #badge([Bevy 0.14], color: palette.pink) \
    #badge([VS Code], color: palette.gold) #badge([GPU Required], color: palette.pink)
    #v(0.5em)
    - RAM: 16GB minimum
    - Disk: 2GB for toolchain
    - OS: Linux / macOS / Windows
    - GPU: Vulkan-compatible
  ]
]

== Player Stats

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #stat-bar([Rust Proficiency], 82, max: 100, color: palette.green)
][
  #stat-bar([GPU Knowledge], 65, max: 100, color: palette.blue)
]

#v(0.6em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #stat-bar([ECS Mastery], 71, max: 100, color: palette.pink)
][
  #stat-bar([Debug Endurance], 93, max: 100, color: palette.gold)
]

#v(0.5em)

#neon-box([Pro Tip], color: palette.gold)[
  Max out your *Debug Endurance* stat early. The final boss (Production Deployment) has a one-hit KO move called `unwrap()` on `None`.
]

= Quest Log

== Core Quest: ECS Architecture

#terminal-box(title: [ecs_overview.rs])[
  ```rust
  // Entity-Component-System
  fn move_system(query: Query<&mut Transform, With<Player>>) {
      for mut tf in query.iter() { tf.translation.x += 1.0; }
  }
  ```
]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #pixel-card(1, [Entities], [Lightweight IDs -- an index into storage.], accent: palette.green)
][
  #pixel-card(2, [Components], [Plain data structs, composed freely.], accent: palette.pink)
][
  #pixel-card(3, [Systems], [Query components, run in parallel.], accent: palette.blue)
]

== Side Quest: Rendering Pipeline

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #pixel-card(1, [Extract], [Copy game state to render world], accent: palette.green)
][
  #pixel-card(2, [Prepare], [Create GPU resources & buffers], accent: palette.pink)
][
  #pixel-card(3, [Queue], [Sort & batch draw calls], accent: palette.blue)
][
  #pixel-card(4, [Render], [Execute passes on GPU], accent: palette.gold)
]

#v(-0.6em)

#neon-box([Pipeline Stats], color: palette.green)[
  *Frame Budget:* 16.6ms (60 FPS) | *Draw Calls:* ~200 batched | *Triangles:* 500K+ per frame \
  *Shader Compilation:* Cached after first run | *GPU Memory:* ~256MB for typical scene
]

== Skill Tree: Audio & Input

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #level-card(1, [Audio System], [
    - Spatial 3D audio support
    - Dynamic music layering
    - SFX pooling & priority
    - HRTF for VR immersion
    - Format: OGG, WAV, FLAC
  ])
][
  #level-card(2, [Input Handling], [
    - Gamepad + keyboard + mouse
    - Input mapping / rebinding
    - Combo detection system
    - Touch support (mobile)
    - Action-based abstraction
  ])
]

= Boss Battle

== Boss: The Memory Dragon

#cols(columns: (2fr, 3fr))[
  #stat-bar([HP Remaining], 35, max: 100, color: palette.pink)
  #v(0.3em)
  #stat-bar([Mana (Memory)], 78, max: 100, color: palette.blue)
  #v(0.3em)
  #stat-bar([Shield (Safety)], 95, max: 100, color: palette.green)
  #v(0.5em)
  #badge([CRITICAL], color: palette.pink)
  #badge([HOT PATH])
  #badge([UNSAFE], color: palette.gold)
][
  #terminal-box(title: [profiler_output.log])[
    ```
    WARN Memory spike detected!
    WARN Frame time: 48ms (target: 16ms)

    TRACE Allocation hotspots:
      > Vec<Entity> resize: 12ms
      > Texture upload: 18ms
      > Physics broadphase: 8ms

    FIX Use object pools
    FIX Stream textures async
    FIX Spatial partitioning
    ```
  ]
]

== Mini-Boss: Async Nightmares

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #neon-box([Problem: Race Conditions], color: palette.pink)[
    - Systems accessing same resource
    - Frame-order dependent bugs
    - Non-deterministic replays
    - Deadlocks in asset loading
  ]
][
  #neon-box([Solution: Bevy Scheduling], color: palette.green)[
    - Automatic system parallelism
    - Explicit `.before()` / `.after()`
    - Run conditions for state gating
    - Async tasks for I/O operations
  ]
]

#focus-slide[
  #text(fill: palette.gold, size: 0.6em)[ACHIEVEMENT UNLOCKED]
  #v(0.3em)

  "Ship It or Game Over" \
  #text(size: 0.5em, fill: palette.text-gray)[-- Every game dev at 3 AM]
]

= Achievement Unlocked

== Benchmark Results

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #pixel-card(1, [60 FPS], [Stable framerate with 10K entities on screen], accent: palette.green)
][
  #pixel-card(2, [< 2s], [Cold start to gameplay in under 2 seconds], accent: palette.pink)
][
  #pixel-card(3, [128 MB], [Peak memory usage for full game scene], accent: palette.blue)
][
  #pixel-card(4, [4.2 MB], [Final binary size (stripped, LTO)], accent: palette.gold)
]

#v(0.5em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #stat-bar([Performance Score], 92, max: 100, color: palette.green)
][
  #stat-bar([Code Coverage], 87, max: 100, color: palette.blue)
]

== Loot Drops: What We Built

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #level-card(4, [Legendary: Game Engine], [
    - Custom ECS with 10K entity support
    - PBR rendering pipeline
    - Spatial audio system
    - Cross-platform input handling
    - Hot-reload for rapid iteration
  ])
][
  #level-card(3, [Epic: Developer Tools], [
    - Visual scene editor
    - Real-time profiler overlay
    - Asset pipeline with caching
    - Automated testing framework
    - CI/CD for game builds
  ])
]

#v(0.3em)

#neon-box([Save File], color: palette.gold)[
  *Repository:* `github.com/neonbyte/pixel-engine` | *License:* MIT \
  *Stars:* 2.4K | *Contributors:* 42 | *Commits:* 1,337
]

== Next Expansion: Roadmap

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #pixel-card(1, [v0.2 -- Q1], [
    Multiplayer netcode \
    WebGPU backend \
    Level editor v2
  ], accent: palette.green)
][
  #pixel-card(2, [v0.3 -- Q2], [
    VR/AR support \
    Procedural gen \
    AI pathfinding
  ], accent: palette.pink)
][
  #pixel-card(3, [v0.4 -- Q3], [
    Mobile platform \
    Console ports \
    Mod support
  ], accent: palette.blue)
][
  #pixel-card(4, [v1.0 -- Q4], [
    Production ready \
    Full documentation \
    Plugin marketplace
  ], accent: palette.gold)
]

#ending-slide[GAME OVER]
