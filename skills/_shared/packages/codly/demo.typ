#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#show: codly-init.with()
#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Codly Demo — Beautiful Code Blocks

#codly(languages: codly-languages)

```rust
pub fn main() {
    println!("Hello, world!");
}
```

```python
def fibonacci(n: int) -> int:
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

for i in range(10):
    print(f"fib({i}) = {fibonacci(i)}")
```
