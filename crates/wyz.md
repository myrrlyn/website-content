---
title: wyz
page_title: Prototyping
toc: false
---

This is just my prototyping library. It serves as an incubator for modules I
think are convenient but not necessarily worth breaking out into their own crate
yet.

## `wyz::fmt`

Rust has a rich formatting system, but unfortunately it only uses the `Debug`
trait in certain interfaces such as printing an error bubbled out of main, or
dynamically assembling a debug-print of aggregate types.

This module provides transparent wrapper types that all implement `Debug` by
forwarding to a different `core::fmt` trait, and a blanket extension trait that
places methods to _create_ those types on all types that implement the core
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

## `wyz::bidi`

This is an iterator adapter that allows you to write the following:

```rust
let iter = some_reversible_iterator();
let iter = if some_condition() {
  iter.rev()
} else {
  iter
};
```

That block is, of course, illegal, because `.rev()` produces a `Rev<T>` and if
you don’t call it, you just have a `T`, and those are different types.

Instead, `iter.bidi(some_condition())` produces a `Bidi<T>` whose implementation
of `Iterator` and `DoubleEndedIterator` remembers the provided condition and
dispatches accordingly: when `true`, `Bidi::next()` forwards to `T::next_back()`
and `Bidi::next_back()` forwards to `T::next()`; when `false`, it behaves
normally.

In order to cut down on branches, each `Bidi` value stores four function
pointers next to the wrapped iterator: `next`, `next_back`, `nth`, and
`nth_back`. These pointers are initialized to the appropriate delegated function
when the `Bidi` is constructed, so calling `Bidi`’s own iterator functions just
immediately jumps to the corresponding function pointer, and does not have to
branch. This makes `Bidi` much larger than it would be if it just stored the
single `bool`, but prevents branching inside each iteration and reduces the load
on the processor’s branch predictor (especially useful if you have other
branches in the loop body).

You’ll need to `use wyz::BidiIterator;` to gain access to the `.bidi()` adapter,
which is provided for all `DoubleEndedIterator` types.

## `wyz::range`

This provides some range normalization and convenience methods I use in `bitvec`
to cut down on how many nearly-identical blocks of code I need to deal with
Rust’s various range (-inclusive, -from, -to, -to-inclusive, -full) types.

## `wyz::exit`

The `exit!` macro functions like `panic!` except that it calls
`std::process::exit` instead of kicking off an unwind, and optionally returns a
status code to the operating system.

It is superseded by the fact that `fn main() -> Result<(), impl Termination>`
has been allowed since Rust 1.26. There’s no point in its existence anymore, I
don’t think anybody uses it, and I just haven’t gotten around to deleting it
yet.
