---
title: Suffix Tapping
---

[![Crate](https://img.shields.io/crates/v/tap.svg "Crate version"){:.unset}](https://crates.io/crates/tap "Crate")
[![Documentation](https://docs.rs/tap/badge.svg "Crate docs){:.unset}](https://docs.rs/tap/ "Documentation")
[![License](https://img.shields.io/crates/l/tap.svg "Crate license"){:.unset}](https://github.com/myrrlyn/tap/blob/develop/LICENSE.txt "License")
[![Downloads](https://img.shields.io/crates/dv/tap.svg "Crate downloads"){:.unset}](https://crates.io/crates/tap "Crate")

- [Source code](https://github.com/myrrlyn/tap)

This crate consists of a number of traits which serve to provide convenient
value-threading expressions. Essentially, the methods allow use of unchainable
methods in method chains.

## Tapping

The `Tap` trait provides methods that let you inspect, or modify, a value, then
pass it along.

```rust
pub trait Tap: Sized {
  fn tap<F: FnOnce(&Self) -> R, R>(self, func: F) -> Self {
    func(&self);
    self
  }
  fn tap_mut<F: FnOnce(&mut Self) -> R, R>(mut self, func: F) -> Self {
    func(&mut self);
    self
  }
}
impl<T: Sized> Tap for T {}
```

This means that any expression can have a `tap` or `tap_mut` call appended to it
in order to run a borrowing function on the value of the expression. The value
is taken and then returned, so the tapping call does not cause any change in the
type of the expression at that point.

Because the tapping methods return the receiver, they can also be *pre*pended to
any method call or other expression that expected the expression in front of the
call.

Rust’s set of ownership and mutability rules also mean that values can change
mutability at each binding site, such as in the argument position of a function.
This allows `tap_mut` to be called on expressions that are otherwise bound
immutably.

Taps are adaptors between value-threading expressions (take and return self) and
borrowing methods. This allows API authors to write borrowing methods without
needing to consider or explicitly favor any specific styles of value
manipulation, and allows users to modify expressions for logging or modification
without needing to change anything about the neighboring code.

Example:

```rust
use tap::Tap;

let v: Vec<i32> = vec![5, 1, 4, 2, 3]
  .tap_mut(|v| v.sort())
  .tap(|v| println!("Vector: {:?}", v))
  .tap_mut(|v| v.reverse())
  .tap(|v| println!("Vector: {:?}", v));
```

This creates an immutable binding to a sorted, reversed, vector, and prints the
contents after the sort and after the reverse.

This removed the need to bind mutably, modify, and rebind immutably. The method
chain is also one single expression, so using the taps makes it possible to
modify an expression without creating statements and potentially requiring a
block to wrap the whole structure.

In addition to these taps, the crate also provides debug-only equivalents. Add
the suffix `_dbg` to any tap call in order to only run the tap in debug builds,
and remove it entirely from release.

For convenience, the crate *also* provides traits that are aware of the `Option`
and `Result` carrier types, and act on the interior values they contain. The
`TapOption` trait provides `tap_some`, `tap_some_mut`, and `tap_none` that run
only when the carrier is of the correct variant, and operate on the inner value
(if present). The `TapResult` trait provides `tap_ok`, `tap_err`, and the `_mut`
alternates, that run on the inner value or error only if the carrier is the
denoted variant.

These traits provide the `_dbg`-suffixed alternates as well.

In conclusion, `tap` is a powerful crate that greatly enhances the experience of
writing Rust, by providing a bridge between holding a value and running methods
on references to it.

## Piping

The `Pipe` trait is equivalent to `Tap`, except it allows you to change the type
of the received value. Where `Tap` methods ignore what your tapped function
returns and instead return the input value, `Pipe` methods return the output of
your function:

```rust
pub trait Pipe: Sized {
  fn pipe<F: FnOnce(Self) -> R, R>(self, func: F) -> R {
    func(self)
  }
}
impl<T: Sized> Pipe for T {}
```

This allows you to place functions that are not eligible for method dot-call
syntax in suffix position.

## Conversion

`tap` also provides a companion trait to [`From`] that allows you to call the
conversion method in the middle of an expression.

This code does not compile:

```rust
let s: String = "static".into().clone();
```

Even though `Clone` has the signature `fn clone(&self) -> Self`, and the output
type of the `.clone()` call is known, the compiler’s type resolver is incapable
of finding a unique solution for `Into<T>`. This problem is amplified in
non-trivial expressions.

The `Conv` trait permits that expression to compile:

```rust
let s = "static".conv::<String>().clone();
```

### What Is It

The entire module is this code:

```rust
pub trait Conv: Sized {
  fn conv<T: Sized + From<Self>>(self) -> T {
    <T as From<Self>>::from(self)
  }
}
impl<T: Sized> Conv for T {}
```

That’s it. It is equivalent in simplicity to the `Into` definition:

```rust
pub trait Into<T: Sized>: Sized {
  fn into(self) -> T;
}
impl<T: Sized, U: Sized + From<T>> Into<U> for T {
  fn into(self) -> U {
    <U as From<T>>::from(self)
  }
}
```

### How To Use It

1. Import the trait:

   ```rust
   use tap::Conv;
   ```

1. Write `impl From<Source> for Destination {}` blocks.

1. Call `.conv::<Destination>()` on `Source` values!

### When Is It Useful

`Conv` is the only conversion trait that can be called as a method in
non-trailing position in an expression.

### When Is It Not Useful

`Conv` cannot be used as a trait bound. `T: Into<U>` is the correct trait bound
for calling single conversions generically.

### Generic Usage

The trait bound `T: From<U>` allows calling `.conv::<T>()` on instances of `U`.
