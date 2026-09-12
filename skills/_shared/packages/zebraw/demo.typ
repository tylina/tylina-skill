#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/zebraw:0.6.3": *

#show: zebraw
#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Zebraw Demo — Code with Highlighted Lines

```python
def quicksort(arr):
    if len(arr) <= 1:       # Base case
        return arr
    pivot = arr[0]          # Choose pivot
    left = [x for x in arr[1:] if x <= pivot]
    right = [x for x in arr[1:] if x > pivot]
    return quicksort(left) + [pivot] + quicksort(right)

result = quicksort([3, 6, 8, 10, 1, 2, 1])
print(result)  # [1, 1, 2, 3, 6, 8, 10]
```
