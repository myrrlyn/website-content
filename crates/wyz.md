---
title: wyz
---

This is just my prototyping library. It serves as an incubator for modules I
think are convenient but not necessarily worth breaking out into their own crate
yet.

Currently its only major item is the `fmt` module.

## `wyz::fmt`

Rust has a rich formatting system, but unfortunately it only uses the `Debug`
trait in certain interfaces such as printing an error bubbled out of main, or
dynamically assembling a debug-print of aggregate types.

This module provides transparent wrapper types that all implement `Debug` by
forwarding to a different `core::fmt` trait, and a blanket extension trait that
places methods to *create* those types on all types that implement the core
formatters.

```rust
#[repr(transparent)]
pub struct FmtDisplay<T: Display> {
  inner: T,
}

impl<T: Display> Debug for FmtDisplay<T> {
  #[inline(always)]
  fn fmt(&self, fmt: &mut Formatter) -> fmt::Result {
    Display::fmt(&self.inner, fmt)
  }
}

pub trait FmtForward: Sized {
  fn fmt_display(self) -> FmtDisplay<Self>
 where Self: Display {
    FmtDisplay { inner: self }
  }
}

impl<T: Sized> FmtForward for T {}
```

The types and trait methods repeat for `Binary`, `Octal`, `LowerHex`, and
`UpperHex` as well.

To use, import the `wyz::FmtForward` trait and call `.fmt_some_trait()` on any
object to gain a `Debug` implementation that prints what you actually want.
