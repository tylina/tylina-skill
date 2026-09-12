#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Heiti SC"), size: 20pt)

#show: circuit-board-theme.with(
  aspect-ratio: "16-9",
  footer: [FPGA DESIGN],
  preset: "pcb",
  config-info(
    title: [FPGA Architecture & Signal Processing],
    subtitle: [High-Performance Digital Design on Programmable Logic],
    author: [Silicon Valley FPGA Lab],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

= Logic Architecture

== Configurable Logic Blocks

Modern FPGAs contain thousands of Configurable Logic Blocks (CLBs) arranged in a regular array, interconnected by programmable routing resources.

- #solder-point() *Look-Up Tables (LUTs)* implement arbitrary Boolean functions
- #solder-point() *Flip-Flops* provide registered outputs with clock enable
- #solder-point() *Carry chains* enable fast arithmetic operations
- #solder-point() *Multiplexers* route signals within the CLB

== Parameterised Up/Down Counter

#cols(columns: (3fr, 2fr))[
  #set text(.65em)
  ```verilog
  // Parameterised synchronous counter
  // Supports up/down with async reset
  module counter #(
    parameter WIDTH = 8
  )(
    input  wire             clk,
    input  wire             rst_n,  // active-low reset
    input  wire             en,
    input  wire             up_dn,  // 1=up, 0=down
    output reg  [WIDTH-1:0] count,
    output wire             carry
  );
    assign carry = up_dn ? &count : ~|count;

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n)     count <= '0;
      else if (en)    count <= up_dn ? count + 1 : count - 1;
    end
  endmodule
  ```
][
  #ic-card([PORT MAP])[
    #register-box(
      (
        ("clk",    "Clock input"),
        ("rst_n",  "Async reset (L)"),
        ("en",     "Count enable"),
        ("up_dn",  "Direction ctrl"),
        ("count",  "WIDTH-bit out"),
        ("carry",  "OVF / UVF flag"),
      ),
    )
    #v(0.4em)
    #signal-tag([SYNTHESISABLE]) #h(0.3em) #signal-tag([FPGA])
  ]
]

== Performance Overview

#dark-slide(title: [Key Metrics])[
  #grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 12pt,
    led-stat([500], [MHz FMAX], color: palette.secondary),
    led-stat([1.2M], [LOGIC CELLS], color: palette.secondary),
    led-stat([48], [Mb BRAM], color: palette.accent),
    led-stat([3.6k], [DSP SLICES], color: palette.accent),
  )
  #v(0.8em)
  #text(size: 13pt, fill: palette.ink.transparentize(20%), font: _mono-font)[
    Target device: Xilinx Ultrascale+ XCVU13P #h(1em) #signal-tag([VERIFIED])
  ]
]

= Signal Processing

== DSP Block Architecture

The DSP48E2 slice is the fundamental signal processing element, providing 27x18 multiply-accumulate operations at full clock speed.

- #solder-point() *Pre-adder*: 27-bit addition before multiplier
- #solder-point() *Multiplier*: 27 x 18 signed multiplication
- #solder-point() *Accumulator*: 48-bit post-addition with feedback
- #solder-point() *Pattern detect*: overflow/underflow monitoring

== DSP Pipeline Registers

#cols(columns: (1fr, 1fr))[
  #ic-card([DSP48E2 STAGE A])[
    *Input registers:*\
    A1/A2 cascade pipeline\
    B1/B2 cascade pipeline\
    C direct input register\
    D pre-adder input register

    #v(0.4em)
    #signal-tag([CLK]) #h(0.3em) #signal-tag([CE]) #h(0.3em) #signal-tag([RST])
  ]
][
  #ic-card([DSP48E2 STAGE B])[
    *Output stages:*\
    M register (post-multiply)\
    P register (post-ALU)\
    PATTERNDETECT output\
    Cascade PCOUT to next DSP

    #v(0.4em)
    #signal-tag([PCIN]) #h(0.3em) #signal-tag([PCOUT]) #h(0.3em) #signal-tag([OVF])
  ]
]

== SystemVerilog: AXI-Lite FSM Controller

#dark-slide(title: [Finite State Machine — AXI-Lite Read Channel])[
  #cols(columns: (3fr, 2fr), column-gutter: 18pt)[
    #set text(.7em)
    ```systemverilog
    typedef enum logic [1:0] {
      IDLE  = 2'b00,
      ADDR  = 2'b01,
      DATA  = 2'b10,
      RESP  = 2'b11
    } axi_state_t;

    axi_state_t state, next;

    always_ff @(posedge clk)
      if (!rst_n) state <= IDLE;
      else        state <= next;

    always_comb begin
      arready = '0; rvalid = '0;
      unique case (state)
        IDLE: next = arvalid ? ADDR : IDLE;
        ADDR: begin arready = 1; next = DATA; end
        DATA: begin rvalid  = 1; next = rready ? RESP : DATA; end
        RESP: next = IDLE;
      endcase
    end
    ```
  ][
    #circuit-kicker([STATE TABLE])
    #v(0.4em)
    #register-box(
      bg-color: rgb("#032D22"),
      text-color: rgb("#ECFDF5"),
      (
        ("IDLE", "Wait for arvalid"),
        ("ADDR", "Assert arready"),
        ("DATA", "Drive rvalid"),
        ("RESP", "Cycle complete"),
      ),
    )
    #v(0.5em)
    #signal-tag([ONE-HOT OK]) #h(0.3em) #signal-tag([LINT CLEAN])
  ]
]

= Memory Subsystem

== Block RAM Configuration

#bus-layout((
  [
    #circuit-kicker([BRAM TILE])
    #v(0.3em)
    #text(size: 13pt, fill: palette.ink)[
      36 Kb true dual-port\
      Configurable widths:\
      32K x 1 to 512 x 72\
      ECC support built-in
    ]
  ],
  [
    #circuit-kicker([URAM TILE])
    #v(0.3em)
    #text(size: 13pt, fill: palette.ink)[
      288 Kb ultra RAM\
      4K x 72 fixed width\
      Cascade for deeper\
      Single clock domain
    ]
  ],
  [
    #circuit-kicker([LUTRAM])
    #v(0.3em)
    #text(size: 13pt, fill: palette.ink)[
      Distributed memory\
      64 x 1 per LUT6\
      Fastest access time\
      Ideal for small FIFOs
    ]
  ],
))

== VHDL Testbench: Clock & Reset Generation

#cols(columns: (1fr, 1fr))[
  #set text(.6em)
  ```vhdl
  -- Testbench: counter_tb.vhd
  library ieee;
  use ieee.std_logic_1164.all;

  entity counter_tb is end counter_tb;

  architecture sim of counter_tb is
    signal clk   : std_logic := '0';
    signal rst_n : std_logic := '0';
    signal count : std_logic_vector(7 downto 0);
  begin
    -- 100 MHz clock
    clk <= not clk after 5 ns;

    -- DUT instantiation
    dut: entity work.counter
      generic map(WIDTH => 8)
      port map(clk, rst_n, '1', '1', count, open);

    stim: process begin
      wait for 20 ns; rst_n <= '1';
      wait for 300 ns;
      assert count = x"1E"
        report "Count mismatch!" severity failure;
      wait;
    end process;
  end architecture;
  ```
][
  #ic-card([SIM SETUP])[
    #register-box(
      (
        ("CLK",   "100 MHz / 5 ns"),
        ("RST",   "20 ns low pulse"),
        ("STIM",  "300 ns count run"),
        ("CHECK", "Assert at 300 ns"),
      ),
    )
    #v(0.5em)
    #text(size: 13pt, fill: palette.ink)[
      Expected count at\
      300 ns after deassertion:\
      #text(fill: palette.accent, font: _mono-font)[0x1E = 30 dec]
    ]
    #v(0.4em)
    #trace-divider(color: palette.secondary, width: 100%)
    #v(0.2em)
    #signal-tag([VHDL-2008]) #h(0.3em) #signal-tag([GHDL])
  ]
]

= High-Speed I/O

== Transceiver Architecture

The GTY transceivers provide multi-gigabit serial connectivity with integrated PLL, CDR, and equalization circuits.

- #solder-point() *Line rate*: up to 32.75 Gbps per lane
- #solder-point() *PLL*: fractional-N with sub-picosecond jitter
- #solder-point() *Equalization*: CTLE + 2-tap DFE adaptive
- #solder-point() *Encoding*: 64b/66b, 128b/130b, raw

== Transceiver Performance

#dark-slide(title: [GTY Channel Metrics])[
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 14pt,
    led-stat([32.75], [Gbps MAX], color: palette.secondary),
    led-stat([< 100], [fs RJ], color: palette.secondary),
    led-stat([1e-15], [BER TARGET], color: palette.accent),
  )
  #v(0.8em)
  #grid(columns: (1fr, 1fr), column-gutter: 20pt,
    {
      circuit-kicker([TX FEATURES])
      v(0.3em)
      text(size: 13pt, fill: palette.ink)[
        Pre-emphasis: 6 dB max\
        Swing control: 0.5-1.0 Vpp\
        Pre-cursor: 6 dB\
        Post-cursor: 20 dB
      ]
    },
    {
      circuit-kicker([RX FEATURES])
      v(0.3em)
      text(size: 13pt, fill: palette.ink)[
        AGC: automatic gain\
        CTLE: 12 dB boost\
        DFE: 2-tap adaptive\
        Eye margin: > 40%
      ]
    },
  )
]

== Design Philosophy

#focus-slide[
  In FPGA design, the architecture is the algorithm. Every register placement, every pipeline stage, every routing decision determines whether you meet timing at 500 MHz.
]

== System Summary

#dark-slide(title: [Design Specifications])[
  #grid(columns: (1fr, 1fr), column-gutter: 20pt,
    {
      circuit-kicker([TARGET PLATFORM])
      v(0.3em)
      text(size: 14pt, fill: palette.ink)[
        Device: XCVU13P-2FLGA2577\
        Speed grade: -2 (high perf)\
        Package: FLGA 2577-pin\
        Power budget: 75W TDP
      ]
    },
    {
      circuit-kicker([DESIGN STATUS])
      v(0.3em)
      text(size: 14pt, fill: palette.ink)[
        Synthesis: complete\
        Place & Route: converged\
        Timing closure: met\
        Bitstream: validated
      ]
      v(0.4em)
      signal-tag([PRODUCTION READY])
    },
  )
]

#ending-slide[Signal Integrity Achieved]
