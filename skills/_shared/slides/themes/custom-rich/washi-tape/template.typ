// Washi Tape Theme -- Japanese Paper Craft & Scrapbooking Aesthetic
// You are in a sunlit craft studio surrounded by rolls of decorative paper tape.
// Torn-edge washi strips in dusty rose, sage, and mustard adorn every surface.
// Dot-grid notebooks lie open, their pages decorated with layered tape strips,
// stickers, and paper clips. The aesthetic is joyful precision meets craft warmth.
// Features: persistent dot-grid background, washi tape borders, torn edges,
// kraft paper textures, paper clip accents, stamp and sticker motifs.
// Touying 0.7.4 compatible. Rich tier.

#import "@preview/touying:0.7.4": *


// ============================================================================
// === Color Palette ===
// ============================================================================

#let palette = (
  bg: rgb("#FFFEF8"),              // warm white / notebook paper
  primary: rgb("#D4727B"),          // dusty rose -- main washi tape color
  primary-text: rgb("#A64E58"),     // contrast-safe rose text
  secondary: rgb("#7BA08A"),        // sage green -- secondary tape
  secondary-text: rgb("#4F755F"),   // contrast-safe sage text
  accent: rgb("#D4A537"),           // mustard yellow -- highlight accent
  accent-text: rgb("#806013"),      // contrast-safe mustard text
  lavender: rgb("#9B8EC4"),         // soft lavender -- extra tape color
  lavender-text: rgb("#675A91"),    // contrast-safe lavender text
  focus: rgb("#3D3D3D"),            // focus-slide background
  text-dark: rgb("#4A4A4A"),        // warm grey -- body text
  text-body: rgb("#555555"),        // medium grey -- secondary text
  text-light: rgb("#707070"),       // accessible muted grey -- captions
  card: rgb("#FFFDF5"),             // slightly warm card
  kraft: rgb("#D4C5A0"),            // kraft paper brown
  kraft-dark: rgb("#B8A87A"),       // darker kraft for borders
  border: rgb("#E8E2D8"),           // soft warm border
  dot-grid: rgb("#C8C2B8"),         // dot grid color
)


// ============================================================================
// === SVG Definitions ===
// ============================================================================

// Dot-grid notebook background -- FULL PAGE, persistent atmosphere
// Simulates bullet journal dot paper with subtle paper fiber texture
#let _dotgrid-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="480" viewBox="0 0 840 480">
  <!-- Paper fiber texture - very subtle diagonal streaks -->
  <line x1="50" y1="0" x2="120" y2="480" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
  <line x1="200" y1="0" x2="250" y2="480" stroke="currentColor" stroke-width="0.2" opacity="0.02"/>
  <line x1="400" y1="0" x2="380" y2="480" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
  <line x1="600" y1="0" x2="620" y2="480" stroke="currentColor" stroke-width="0.2" opacity="0.02"/>
  <line x1="750" y1="0" x2="780" y2="480" stroke="currentColor" stroke-width="0.3" opacity="0.025"/>
  <!-- Dot grid pattern - evenly spaced small dots like bullet journal paper -->
  <!-- Row 1 -->
  <circle cx="40" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="40" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 2 -->
  <circle cx="40" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="80" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 3 -->
  <circle cx="40" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="120" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 4 -->
  <circle cx="40" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="160" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 5 -->
  <circle cx="40" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="200" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 6 -->
  <circle cx="40" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="240" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 7 -->
  <circle cx="40" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="280" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 8 -->
  <circle cx="40" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="320" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 9 -->
  <circle cx="40" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="360" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 10 -->
  <circle cx="40" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="400" r="0.8" fill="currentColor" opacity="0.12"/>
  <!-- Row 11 -->
  <circle cx="40" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="80" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="120" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="160" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="200" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="240" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="280" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="320" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="360" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="400" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="440" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="480" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="520" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="560" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="600" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="640" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="680" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="720" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="760" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
  <circle cx="800" cy="440" r="0.8" fill="currentColor" opacity="0.12"/>
</svg>```.text


// Tape frame SVG -- angled washi tape strips at corners with torn edges and polka-dot patterns
// BOOKEND element: used on both title and ending slides
#let _tape-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="480" viewBox="0 0 840 480">
  <!-- Top-left corner tape strip (angled, torn edges with polka dots) -->
  <path d="M 0,35 C 2,33 5,36 8,34 L 95,2 C 97,1 100,3 103,1 L 108,0 L 110,5 C 108,7 110,9 109,11 L 42,43 C 40,45 38,43 36,45 L 0,55 Z" fill="PRIMARY_COLOR" opacity="0.55"/>
  <circle cx="25" cy="38" r="2.5" fill="PAPER_COLOR" opacity="0.35"/>
  <circle cx="45" cy="30" r="2.5" fill="PAPER_COLOR" opacity="0.35"/>
  <circle cx="65" cy="22" r="2.5" fill="PAPER_COLOR" opacity="0.35"/>
  <circle cx="85" cy="14" r="2.5" fill="PAPER_COLOR" opacity="0.35"/>
  <circle cx="35" cy="44" r="2" fill="PAPER_COLOR" opacity="0.25"/>
  <circle cx="55" cy="36" r="2" fill="PAPER_COLOR" opacity="0.25"/>
  <circle cx="75" cy="28" r="2" fill="PAPER_COLOR" opacity="0.25"/>
  <!-- Top-right corner tape strip (angled, with stripe pattern) -->
  <path d="M 740,0 C 742,2 744,1 746,3 L 840,32 C 840,34 840,36 840,38 L 840,50 C 838,48 836,50 834,48 L 735,18 C 733,17 731,19 729,17 L 728,0 Z" fill="SECONDARY_COLOR" opacity="0.50"/>
  <line x1="745" y1="3" x2="838" y2="35" stroke="PAPER_COLOR" stroke-width="1.5" opacity="0.3"/>
  <line x1="743" y1="8" x2="836" y2="40" stroke="PAPER_COLOR" stroke-width="1" opacity="0.2"/>
  <line x1="747" y1="0" x2="840" y2="30" stroke="PAPER_COLOR" stroke-width="1" opacity="0.2"/>
  <line x1="741" y1="12" x2="834" y2="44" stroke="PAPER_COLOR" stroke-width="0.8" opacity="0.15"/>
  <!-- Bottom-left corner tape strip (angled, with chevron pattern) -->
  <path d="M 0,425 C 2,423 4,426 6,424 L 100,450 C 102,452 104,450 106,452 L 115,480 C 113,480 111,480 109,480 L 0,480 L 0,445 C 2,443 0,441 2,439 Z" fill="ACCENT_COLOR" opacity="0.45"/>
  <path d="M 20,440 L 28,436 L 36,440 M 40,448 L 48,444 L 56,448 M 60,456 L 68,452 L 76,456" stroke="PAPER_COLOR" stroke-width="1.2" fill="none" opacity="0.3"/>
  <path d="M 30,450 L 38,446 L 46,450 M 50,458 L 58,454 L 66,458" stroke="PAPER_COLOR" stroke-width="0.8" fill="none" opacity="0.2"/>
  <!-- Bottom-right corner tape strip (angled, with dots) -->
  <path d="M 840,430 C 838,428 836,430 834,428 L 745,455 C 743,457 741,455 739,457 L 730,480 L 840,480 Z" fill="LAVENDER_COLOR" opacity="0.48"/>
  <circle cx="760" cy="464" r="2.5" fill="PAPER_COLOR" opacity="0.3"/>
  <circle cx="780" cy="458" r="2.5" fill="PAPER_COLOR" opacity="0.3"/>
  <circle cx="800" cy="452" r="2.5" fill="PAPER_COLOR" opacity="0.3"/>
  <circle cx="820" cy="446" r="2.5" fill="PAPER_COLOR" opacity="0.3"/>
  <circle cx="770" cy="472" r="2" fill="PAPER_COLOR" opacity="0.22"/>
  <circle cx="790" cy="466" r="2" fill="PAPER_COLOR" opacity="0.22"/>
  <circle cx="810" cy="460" r="2" fill="PAPER_COLOR" opacity="0.22"/>
</svg>```.text


// Tape strip divider SVG -- horizontal decorative washi tape with torn/wavy edges and stripe pattern
#let _tape-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="24" viewBox="0 0 400 24">
  <!-- Tape body with torn/wavy top and bottom edges -->
  <path d="M 0,4 C 8,3 16,5 24,4 C 32,3 40,5 48,4 C 56,3 64,5 72,3 C 80,4 88,3 96,5 C 104,3 112,5 120,4 C 128,3 136,5 144,4 C 152,3 160,5 168,3 C 176,4 184,3 192,5 C 200,3 208,5 216,4 C 224,3 232,5 240,4 C 248,3 256,5 264,3 C 272,4 280,3 288,5 C 296,3 304,5 312,4 C 320,3 328,5 336,4 C 344,3 352,5 360,3 C 368,4 376,3 384,5 C 392,3 396,4 400,4 L 400,20 C 392,21 384,19 376,20 C 368,21 360,19 352,21 C 344,20 336,21 328,19 C 320,20 312,21 304,19 C 296,20 288,21 280,19 C 272,20 264,21 256,19 C 248,20 240,21 232,19 C 224,20 216,21 208,19 C 200,20 192,21 184,19 C 176,20 168,21 160,19 C 152,20 144,21 136,19 C 128,20 120,21 112,19 C 104,20 96,21 88,19 C 80,20 72,21 64,19 C 56,20 48,21 40,19 C 32,20 24,21 16,19 C 8,20 4,19 0,20 Z" fill="currentColor" opacity="0.6"/>
  <!-- Stripe pattern on tape -->
  <line x1="0" y1="8" x2="400" y2="8" stroke="PAPER_COLOR" stroke-width="1.2" opacity="0.35"/>
  <line x1="0" y1="12" x2="400" y2="12" stroke="PAPER_COLOR" stroke-width="0.8" opacity="0.25"/>
  <line x1="0" y1="16" x2="400" y2="16" stroke="PAPER_COLOR" stroke-width="1.2" opacity="0.35"/>
  <!-- Small torn fiber details -->
  <path d="M 50,3 L 52,1 M 150,4 L 148,2 M 250,3 L 252,1 M 350,4 L 348,2" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
  <path d="M 80,20 L 82,22 M 180,19 L 178,21 M 280,20 L 282,22 M 380,19 L 378,21" stroke="currentColor" stroke-width="0.5" opacity="0.3"/>
</svg>```.text


// Paper clip SVG -- small decorative accent
#let _paperclip-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="40" viewBox="0 0 20 40">
  <path d="M 7,2 C 3,2 2,4 2,7 L 2,30 C 2,34 5,37 9,37 C 13,37 16,34 16,30 L 16,10 C 16,7 14,5 11,5 C 8,5 6,7 6,10 L 6,28 C 6,30 7,31 9,31 C 11,31 12,30 12,28 L 12,10" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.6"/>
  <path d="M 7,2 C 3,2 2,4 2,7" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" opacity="0.7"/>
</svg>```.text


// Sparse dot-grid atmosphere for the dark focus slide
#let _focus-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="480" viewBox="0 0 840 480">
  <circle cx="40" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="120" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="200" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="280" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="360" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="440" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="520" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="600" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="680" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="760" cy="40" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="40" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="120" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="200" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="280" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="360" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="440" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="520" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="600" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="680" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="760" cy="120" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="40" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="120" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="200" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="280" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="360" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="440" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="520" cy="200" r="1" fill="currentColor" opacity="0.06"/>
  <circle cx="600" cy="200" r="1" fill="currentColor" opacity="0.06"/>
</svg>```.text


// ============================================================================
// === SVG Rendering Helpers ===
// ============================================================================

/// Render dot-grid background (persistent atmosphere on every content slide)
#let _dotgrid-bg() = {
  let svg = _dotgrid-bg-svg.replace("currentColor", palette.dot-grid.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%, fit: "cover"))
}

/// Render tape frame (bookending decoration for title/ending)
#let _tape-frame() = {
  let svg = _tape-frame-svg.replace("PRIMARY_COLOR", palette.primary.to-hex()).replace("SECONDARY_COLOR", palette.secondary.to-hex()).replace("ACCENT_COLOR", palette.accent.to-hex()).replace("LAVENDER_COLOR", palette.lavender.to-hex()).replace("PAPER_COLOR", palette.bg.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%, fit: "cover"))
}

/// Render tape divider strip
#let _tape-strip(color: palette.primary, width: 80%, height: 14pt) = {
  let svg = _tape-divider-svg.replace("currentColor", color.to-hex()).replace("PAPER_COLOR", palette.bg.to-hex())
  std.align(center, image(bytes(svg), width: width, height: height))
}

/// Render paper clip accent
#let _paperclip(size: 24pt, color: palette.text-light) = {
  let svg = _paperclip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), height: size)
}

/// Render the sparse grid on focus slides
#let _focus-grid() = {
  let svg = _focus-grid-svg.replace("currentColor", palette.bg.to-hex())
  place(top + left, image(bytes(svg), width: 100%, height: 100%, fit: "cover"))
}

/// Map decorative tape colors to text-safe counterparts
#let _accent-text(color) = if color == palette.primary {
  palette.primary-text
} else if color == palette.secondary {
  palette.secondary-text
} else if color == palette.accent {
  palette.accent-text
} else if color == palette.lavender {
  palette.lavender-text
} else {
  palette.text-dark
}

/// Persistent slide atmosphere: dot grid + small tape accent in corner
#let _slide-atmosphere() = {
  // Full-page dot-grid pattern
  _dotgrid-bg()
  // Small washi tape strip in top-right corner (decorative)
  place(top + right, dx: 5pt, dy: 8pt,
    rotate(-12deg, box(width: 35pt, height: 8pt, fill: palette.primary.transparentize(70%), radius: 1pt)))
  // Paper clip accent bottom-left
  place(bottom + left, dx: 1.2em, dy: -0.8em,
    _paperclip(size: 20pt, color: palette.text-light.transparentize(40%)))
}


// ============================================================================
// === Components ===
// ============================================================================

/// tape-card -- Card with a colored washi tape strip across the top (torn-edge look)
#let tape-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.5pt + palette.border,
    inset: 0pt,
    radius: 4pt,
    clip: true,
  )[
    #stack(
      spacing: 0pt,
      block(width: 100%, fill: accent.transparentize(25%), inset: (x: 1em, top: 0.5em, bottom: 0.45em))[
        #set text(fill: palette.text-dark, size: 0.82em, weight: "medium")
        #title
      ],
      block(width: 100%, inset: (x: 1em, y: 0.7em))[
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}


/// journal-box -- Insight box with kraft paper background and tape corner accent
#let journal-box(title, body) = {
  block(
    width: 100%,
    fill: palette.kraft.lighten(78%),
    stroke: 0.6pt + palette.kraft-dark.transparentize(50%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 3pt,
  )[
    // Small angled tape accent in top-left corner
    #place(top + left, dx: -4pt, dy: -4pt,
      rotate(-15deg, box(width: 28pt, height: 7pt, fill: palette.secondary.transparentize(35%), radius: 1pt)))
    #stack(
      spacing: .8em,
      text(weight: "medium", fill: palette.text-dark, size: 0.85em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


/// sticker-stat -- Metric display inside a circular sticker/badge shape
#let sticker-stat(label, value, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.5pt + palette.border,
    inset: (x: 0.7em, y: 0.65em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      // Sticker circle background
      box(width: 72pt, height: 72pt)[
        #set std.align(center + horizon)
        #place(center + horizon,
          circle(radius: 34pt, fill: accent.lighten(82%), stroke: 1.5pt + accent.transparentize(35%)))
        // Inner dotted ring decoration
        #place(center + horizon,
          circle(radius: 25pt, fill: none, stroke: (paint: accent.transparentize(55%), thickness: 0.6pt, dash: "dotted")))
        #text(fill: _accent-text(accent), size: 1.25em, weight: "bold", value)
      ],
      block(width: 100%)[
        #set text(fill: palette.text-light, size: 0.72em)
        #label
      ],
    )
  ]
}


/// memo-quote -- Quote on lined notebook paper with tape accent
#let memo-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.5pt + palette.border,
    inset: (x: 1.4em, y: 1em),
    radius: 3pt,
    clip: true,
  )[
    // Tape accent top-right (angled)
    #place(top + right, dx: 4pt, dy: -6pt,
      rotate(8deg, box(width: 32pt, height: 7pt, fill: palette.accent.transparentize(40%), radius: 1pt)))
    // Faint ruled lines (like notebook paper)
    #for i in range(5) {
      place(top + left, dy: 1.8em + i * 16pt,
        line(length: 100%, stroke: 0.3pt + palette.dot-grid.transparentize(40%)))
    }
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 0.88em, style: "italic")
        quote
      },
      if author != none {
        text(fill: palette.primary-text, size: 0.75em, weight: "medium", style: "normal")[-- #author]
      },
      lazy-v(1fr),
    )
  ]
}


/// flag-tag -- Small washi tape flag/banner tag (inline element)
#let flag-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(30%),
    inset: (x: 0.6em, y: 0.2em, right: 0.9em),
    radius: (left: 2pt, right: 0pt),
  )[
    #set text(fill: palette.text-dark, size: 0.72em, weight: "medium")
    #content
  ]
}


/// strip-divider -- Patterned washi tape separator (horizontal decorative element)
#let strip-divider(color: palette.primary, width: 80%) = {
  _tape-strip(color: color, width: width)
}


/// collage-card -- Card with a flat offset backing sheet and tape accent
#let collage-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.border.lighten(35%),
    inset: (right: 3pt, bottom: 3pt),
    radius: 3pt,
  )[
    #block(
      width: 100%,
      fill: palette.card,
      stroke: 0.5pt + palette.border,
      inset: (x: 1.1em, y: 0.8em),
      radius: 3pt,
    )[
      // Small tape accent
      #place(top + left, dx: -6pt, dy: -5pt,
        rotate(-20deg, box(width: 24pt, height: 6pt, fill: accent.transparentize(40%), radius: 1pt)))
      #stack(
        spacing: .8em,
        text(weight: "medium", fill: _accent-text(accent), size: 0.85em, title),
        [
          #set text(fill: palette.text-body, size: 0.82em)
          #body
          #lazy-v(1fr)
        ]
      )
    ]
  ]
}


/// pinboard-box -- Large box that looks pinned to a board (with "pin" accent)
#let pinboard-box(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.6pt + palette.border,
    inset: (x: 1.3em, top: 1.2em, bottom: 1em),
    radius: 4pt,
  )[
    // "Push pin" accent at top center
    #place(top + center, dy: -8pt,
      circle(radius: 5pt, fill: palette.primary, stroke: 0.8pt + palette.primary.darken(15%)))
    // Pin highlight
    #place(top + center, dx: -1.5pt, dy: -9.5pt,
      circle(radius: 1.5pt, fill: palette.bg.transparentize(40%)))
    #stack(
      spacing: .8em,
      text(weight: "medium", fill: palette.text-dark, size: 0.9em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


/// stamp-card -- Card with rubber-stamp-style dashed border decoration
#let stamp-card(title, body, accent: palette.lavender) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (
      paint: accent.transparentize(30%),
      thickness: 1.5pt,
      dash: (array: (4pt, 2pt), phase: 0pt),
    ),
    inset: (x: 1.2em, y: 0.9em),
    radius: 5pt,
  )[
    #stack(
      spacing: .8em,
      text(weight: "semibold", fill: _accent-text(accent), size: 0.85em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}


// ============================================================================
// === Slide Functions ===
// ============================================================================

/// Standard content slide -- clean header with tape-strip accent
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2.2em, top: 0.8em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      _tape-strip(color: palette.primary, width: 60pt, height: 6pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2.2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Small tape dot as center decoration
        box(circle(radius: 2.5pt, fill: palette.primary.transparentize(50%)))
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _slide-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})


/// Title slide -- crafty, centered, tape frame corners as bookend element
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Dot grid atmosphere
    _dotgrid-bg()
    // Tape frame corners (BOOKEND element -- shared with ending slide)
    _tape-frame()
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "semibold", fill: palette.text-dark, info.title),
        _tape-strip(color: palette.primary, width: 80pt, height: 7pt),
        stack(
          spacing: .8em,
          if info.subtitle != none { text(size: 1em, fill: palette.text-body, info.subtitle) },
          if info.author != none { text(size: 0.9em, fill: palette.text-light, info.author) },
          if info.institution != none { text(size: 0.78em, fill: palette.text-light, info.institution) },
          if info.date != none { text(size: 0.72em, fill: palette.text-light)[#utils.display-info-date(self)] },
        ),
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt, fill: palette.bg),
  )
  touying-slide(self: self, body)
})


/// New section slide -- tape-decorated section title
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt, fill: palette.bg),
  )
  let main-body = {
    // Dot grid
    _dotgrid-bg()
    // Left-aligned section content
    place(left + horizon,
      block(width: 70%, inset: (left: 5em, right: 4em))[
        #stack(
          spacing: .8em,
          text(
            size: 3em,
            fill: palette.primary.transparentize(55%),
            weight: "light",
            utils.display-current-heading-number(depth: 1, numbering: "1"),
          ),
          {
            set text(fill: palette.text-dark, size: 2em, weight: "medium")
            utils.display-current-heading(level: 1, numbered: false)
          },
          _tape-strip(color: palette.secondary, width: 50pt, height: 6pt),
        )
      ]
    )
    // Decorative tape strip on right edge
    place(right + horizon, dx: -2em,
      rotate(90deg, box(width: 60pt, height: 8pt, fill: palette.accent.transparentize(55%), radius: 1pt)))
  }
  touying-slide(self: self, main-body)
})


/// Focus slide -- bold statement on a contrasting background with tape accents
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt, fill: palette.focus),
  )
  let main-body = {
    _focus-grid()
    // Decorative tape strips (angled, different colors)
    place(top + left, dx: 2em, dy: 2em,
      rotate(-8deg, box(width: 80pt, height: 10pt, fill: palette.primary.transparentize(40%), radius: 1pt)))
    place(bottom + right, dx: -2em, dy: -2em,
      rotate(6deg, box(width: 65pt, height: 9pt, fill: palette.secondary.transparentize(45%), radius: 1pt)))
    // Center content
    place(center + horizon,
      block(width: 75%, inset: (x: 2em, y: 1.5em))[
        #set std.align(center)
        #set text(fill: palette.bg, size: 1.4em, weight: "medium")
        #stack(
          spacing: .8em,
          body,
          box(circle(radius: 3pt, fill: palette.primary.transparentize(30%))),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})


/// Ending slide -- bookends with title: tape frame + matching decorations
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt, fill: palette.bg),
  )
  let main-body = {
    // Dot grid
    _dotgrid-bg()
    // Tape frame corners (BOOKEND with title slide)
    _tape-frame()
    // Center content
    set std.align(center + horizon)
    block(width: 65%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "medium", fill: palette.text-dark, body),
        _tape-strip(color: palette.primary, width: 65pt, height: 7pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ============================================================================
// === Theme Entry Point ===
// ============================================================================

#let washi-tape-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-dark)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary-text,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.text-dark,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
    ),
    ..args,
  )

  body
}
