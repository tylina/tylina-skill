// Syntax Garden Theme Demo — Rust Ownership and Borrowing
// Programming tutorial with growing/branching tree metaphor
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Arial")
#show raw: set text(font: "Menlo")

#show: syntax-garden-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Rust Fundamentals -- Ownership & Borrowing],
  config-info(
    title: [Rust Ownership and Borrowing],
    subtitle: [Growing Safe Code from the Ground Up],
    author: [Alex Fernwood],
    institution: [Syntax Garden Workshop Series],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

// ======================================
// Title Slide
// ======================================
#title-slide()

// ======================================
// Section 1: What is Ownership
// ======================================
= What is Ownership

== The Ownership Concept

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  seed-card([Core Principle], [
    In Rust, every value has exactly *one owner*. When the owner goes out of scope, the value is dropped.

    This is Rust's alternative to garbage collection -- deterministic memory management at compile time.
  ], accent: palette.accent),
  seed-card([Three Rules], [
    + Each value has exactly one owner
    + There can only be one owner at a time
    + When the owner goes out of scope, the value is dropped

    These rules are enforced at *compile time* -- zero runtime cost.
  ], accent: palette.secondary),
)

#v(0.4em)

#canopy-quote(
  [Ownership is Rust's most unique feature. It enables memory safety without a garbage collector.],
  author: [The Rust Programming Language],
)

== Scope and Dropping

#cols[
  #branch-step([1], [Variable enters scope], [
    When a variable is declared, it becomes valid and owns its value.
  ])

  #v(0.3em)

  #branch-step([2], [Variable is used], [
    The owner can read, modify, or lend the value to others.
  ])

  #v(0.3em)

  #branch-step([3], [Scope ends], [
    Rust automatically calls `drop` -- the value is freed. No leaks possible.
  ])
][
  ```rust
  fn main() {
      // s comes into scope
      let s = String::from("hello");

      // s is valid here, use it
      println!("{}", s);

  } // scope ends, s is dropped
  ```

  #v(0.5em)

  #bloom-highlight([Key Insight], [
    The `drop` function is called automatically. You never need to manually free memory in safe Rust.
  ], color: palette.success-green)
]

== Stack vs Heap

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  seed-card([Stack Data (Copy)], [
    Simple types live on the stack and are *copied* automatically:

    - Integers (`i32`, `u64`, etc.)
    - Booleans (`bool`)
    - Floating point (`f32`, `f64`)
    - Characters (`char`)
    - Tuples of Copy types
  ], accent: palette.accent),
  seed-card([Heap Data (Move)], [
    Complex types own heap memory and are *moved* by default:

    - `String`
    - `Vec<T>`
    - `Box<T>`
    - Any type with heap allocation

    Moving transfers ownership instead of copying.
  ], accent: palette.secondary),
)

#v(0.4em)

#vine-divider(width: 70%)

#v(0.2em)

#stack(dir: ltr, spacing: 0.6em,
  leaf-tag([Stack = Fast], color: palette.accent),
  leaf-tag([Heap = Flexible], color: palette.secondary),
  leaf-tag([No GC Needed], color: palette.ink),
)

// ======================================
// Section 2: Move Semantics
// ======================================
= Move Semantics

== What is a Move?

#root-block(
  [
    ```rust
    let s1 = String::from("hello");
    let s2 = s1;
    // s1 is no longer valid!
    ```
  ],
  [
    *Line 1:* `s1` owns the String on the heap.

    *Line 2:* Ownership _moves_ to `s2`. The pointer, length, and capacity are copied, but the heap data is not.

    *After:* `s1` is invalidated. Only `s2` can access the data.
  ],
)

#v(0.5em)

#bloom-highlight([Compile Error], [
  Using `s1` after the move causes: `error[E0382]: borrow of moved value: s1`
], color: palette.error-red)

== Move vs Copy in Practice

#cols(lazy-layout: true)[
  #seed-card([This Fails (Move)], [
    ```rust
    let s1 = String::from("hi");
    let s2 = s1;
    println!("{}", s1); // ERROR!
    ```
    String does not implement `Copy` -- it owns heap data.
  ], accent: palette.error-red)
][
  #seed-card([This Works (Copy)], [
    ```rust
    let x = 42;
    let y = x;
    println!("{}", x); // OK!
    ```
    Integers implement `Copy` -- they live entirely on the stack.
  ], accent: palette.success-green)
]

#v(0.4em)

#canopy-quote(
  [Rust will never automatically create deep copies of your data. Any automatic copying is inexpensive.],
  author: [The Rust Book, Ch. 4],
)

== Clone for Deep Copies

#cols[
  ```rust
  let s1 = String::from("hello");
  let s2 = s1.clone();

  println!("s1 = {}", s1); // OK!
  println!("s2 = {}", s2); // OK!
  ```

  #v(0.5em)

  #bloom-highlight([Performance Note], [
    `.clone()` performs a deep copy of heap data. Use intentionally -- it signals explicit cost.
  ], color: palette.secondary)
][
  #branch-step([1], [Original created], [
    `s1` owns the String "hello" on the heap.
  ])

  #v(0.2em)

  #branch-step([2], [Clone called], [
    A complete copy of the heap data is made. `s2` gets its own allocation.
  ])

  #v(0.2em)

  #branch-step([3], [Both valid], [
    `s1` and `s2` are independent owners of separate heap data.
  ])
]

== Ownership and Functions

#cols[
  ```rust
  fn takes_ownership(s: String) {
      println!("{}", s);
  } // s is dropped here

  fn main() {
      let s = String::from("hello");
      takes_ownership(s);
      // s is no longer valid!
  }
  ```
][
  #seed-card([Function Rules], [
    - Passing a value to a function *moves* it (just like assignment)
    - The function now owns the value
    - After the call, the original binding is invalid
    - Returning a value transfers ownership back to the caller
  ], accent: palette.accent)

  #v(0.4em)

  #leaf-tag([Moves into functions], color: palette.secondary)
  #h(0.4em)
  #leaf-tag([Returns move out], color: palette.accent)
]

// ======================================
// Section 3: References & Borrowing
// ======================================
= References & Borrowing

== Borrowing Instead of Moving

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  seed-card([Immutable Borrow], [
    ```rust
    fn calc_len(s: &String) -> usize {
        s.len()
    }

    let s = String::from("hello");
    let len = calc_len(&s);
    // s is still valid!
    ```
    The `&` creates a reference -- borrowing without taking ownership.
  ], accent: palette.accent),
  seed-card([The Rules], [
    At any given time, you can have:

    - *Either* one mutable reference
    - *Or* any number of immutable references

    References must always be valid (no dangling pointers).

    This prevents data races at compile time.
  ], accent: palette.secondary),
)

== Mutable References

#cols[
  ```rust
  fn add_world(s: &mut String) {
      s.push_str(", world");
  }

  fn main() {
      let mut s = String::from("hello");
      add_world(&mut s);
      println!("{}", s);
      // prints: "hello, world"
  }
  ```

  #v(0.4em)

  #leaf-tag([&mut = exclusive access], color: palette.accent)
][
  #bloom-highlight([Cannot Mix], [
    You cannot have a mutable reference while immutable references exist:
    ```rust
    let r1 = &s;     // OK
    let r2 = &s;     // OK
    let r3 = &mut s; // ERROR!
    ```
  ], color: palette.error-red)

  #v(0.4em)

  #bloom-highlight([Why This Rule?], [
    Prevents data races: simultaneous read+write access is impossible. This is checked at compile time.
  ], color: palette.success-green)
]

== The Borrowing Lifecycle

#branch-step([1], [Create the value], [
  `let mut data = vec![1, 2, 3];` -- `data` owns the vector.
])

#v(0.2em)

#branch-step([2], [Borrow immutably], [
  `let r = &data;` -- read access granted. `data` cannot be mutated while `r` lives.
])

#v(0.2em)

#branch-step([3], [Borrow ends], [
  After last use of `r`, the borrow is released (Non-Lexical Lifetimes).
])

#v(0.2em)

#branch-step([4], [Mutate freely], [
  `data.push(4);` -- OK because no active borrows exist.
])

#v(0.3em)

#vine-divider(width: 60%)

#v(0.2em)

#canopy-quote(
  [References are like branches -- they can grow from the trunk but never outlive the tree.],
)

// ======================================
// Section 4: Lifetimes
// ======================================
= Lifetimes

== What Are Lifetimes?

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  seed-card([The Problem], [
    How does Rust know a reference is still valid? The compiler tracks the *lifetime* of every reference.

    Most of the time, lifetimes are inferred. But sometimes you must annotate them explicitly.
  ], accent: palette.secondary),
  seed-card([Lifetime Annotations], [
    ```rust
    fn longest<'a>(
        x: &'a str,
        y: &'a str,
    ) -> &'a str {
        if x.len() > y.len() {
            x
        } else {
            y
        }
    }
    ```
  ], accent: palette.accent),
)

== Dangling References Prevented

#cols[
  #bloom-highlight([This Won't Compile], [
    ```rust
    fn dangle() -> &String {
        let s = String::from("hello");
        &s // ERROR: s dropped here!
    }
    ```
    Rust prevents returning references to local values.
  ], color: palette.error-red)

  #v(0.4em)

  #bloom-highlight([The Fix], [
    ```rust
    fn no_dangle() -> String {
        let s = String::from("hello");
        s // Move ownership out
    }
    ```
    Return the owned value instead.
  ], color: palette.success-green)
][
  #seed-card([Why Lifetimes Matter], [
    - Prevent use-after-free bugs
    - No null pointer dereferences
    - No dangling references
    - All checked at compile time
    - Zero runtime overhead

    Other languages use GC or reference counting. Rust uses lifetimes -- static proof of safety.
  ], accent: palette.ink)
]

== Lifetime Elision Rules

#cols[
  #branch-step([1], [Input lifetimes], [
    Each reference parameter gets its own lifetime: `fn foo<'a, 'b>(x: &'a i32, y: &'b i32)`
  ])

  #v(0.2em)

  #branch-step([2], [Single input], [
    If there is one input lifetime, it is assigned to all output lifetimes.
  ])

  #v(0.2em)

  #branch-step([3], [Method with &self], [
    If one parameter is `&self` or `&mut self`, its lifetime is assigned to all outputs.
  ])
][
  #seed-card([In Practice], [
    Thanks to elision, you rarely write explicit lifetimes:

    ```rust
    // Compiler infers: <'a>
    fn first_word(s: &str) -> &str {
        let bytes = s.as_bytes();
        for (i, &b) in bytes.iter()
            .enumerate() {
            if b == b' ' {
                return &s[0..i];
            }
        }
        &s[..]
    }
    ```
  ], accent: palette.accent)
]

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  _"Ownership is the root system of your program -- invisible, vital, and structuring everything above."_

  #text(size: 0.7em, weight: "regular", fill: palette.ink-muted)[The Syntax Garden Philosophy]
]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Keep Growing]
