---
title: Lilliputian Structures
badges:
  - badge: crates/v/endian_trait
    url: https://crates.io/crates/endian_trait
    logo: rust
  - badge: docsrs/endian_trait
    url: https://docs.rs/endian_trait/latest/endian_trait
    logo: docsdotrs
  - badge: crates/dv/endian_trait
  - badge: crates/l/endian_trait
    url: https://github.com/myrrlyn/endian_trait/blob/main/LICENSE.txt
  - badge: github/stars/myrrlyn/endian_trait
    url: https://github.com/myrrlyn/endian_trait
    logo: github
---

> Rust version: 1.20
>
> I have not come back to this project in a _very_ long time.

{:tag="aside" .block-warn}

## Overview

I **really** wish I’d actually thought of calling it this when I first started
this project. Unfortunately, I did not.

This project is a Rust library that provides a trait, `Endian`, that declares
mechanisms of endian transformations on types that implement it. The trait
requires four methods: `from_be()`, `from_le()`, `to_be()`, and `to_le()` that
convert their receiver from or to, big or little endian, respectively.

The primary crate, `endian_trait` also implements this trait on (almost) all of
Rust’s primitives. It provides implementations on all standard integer types,
`bool`, `f32`/`f64`, and `char`, and permits users to opt-in to implementations
on the 128-bit integers (currently requiring the nightly compiler, as 128-bit
integers are not yet stabilized), and on arrays of any type that implements
`Endian` up to and including 256 elements in size.

Rust does not yet have type-level integers, which means I have to define
implementations of `Endian` on `[T: Endian; N]` for each value of `N` that I
want to support.

> The Rust stdlib only implements traits on arrays ≤ 32; I go 8× as far because
> I ~~care 8× as much~~ _am 8× as bored_{:tag="ins"}.

{:tag="aside" .block-info}

The secondary crate, `endian_trait_derive`, provides a custom-derive procedural
macro that will implement `Endian` on any struct or tuple whose fields are all
themselves `Endian`.

## Rationale and Use Case

The endianness, or order of bytes in multi-byte units, is of critical importance
in correctly interpreting data. Multi-byte types can be stored in memory with
either the most-significant byte at the lowest address and the least-significant
at the highest (big-endian), or vice versa (little-endian). The reasons behind
each choice are endless and not important here. What’s important is that the
`x86_64` architecture used by practically all desktops and laptops is
little-endian, the cores I use at work are often big-endian, and also one of the
Internet RFCs defines the byte order for data traversing the network as
big-endian also.

So at my workplace, where transmitting data across radio networks is our whole
_raison d’être_, we care about endian transformation at network boundaries. We
also care about complex, structured, data, as that’s what we’re moving across
the network.

As far as I’ve been able to see, this trivial crate I wrote is the first library
that makes it convenient to command a data structure to flip all its bits in the
correct fashion to depart or arrive from the network layer. C defines `ntoh()`
and `hton()` functions, which I don’t believe operate on the various types of
`int` and require user intervention to correctly do so (and so almost everyone
rolls their own endian conversion code, like everything else in C).

Rust defines inherent methods on each numeric primitive to flip from local
endian to big or little, and to flip back. The compiler knows that two of these
four functions are always identity functions: on little-endian computers,
`from_le()` and `to_le()` do nothing, and the same goes for big-endian computers
and `from_be()`/`to_be()`. As such, it will erase them where appropriate, and
user code need not worry about the architecture on which it will be compiled:
after a `to_` function is called, the data will be what it says it is, and after
a `from_` function, it will be machine-native, whether or not any byte flipping
was actually performed.

This is okay for flipping individual integer types around, but the network
boundary functions must still invoke it on each field.

My crate declares the `Endian` trait so that complex data types may state that
they know how to flip all their components, and thus the `Endian` methods can be
called on the composed type once, rather than on each field. It also provides a
default derivation mechanism that will do this: any type on which
`#[derive(Endian)]` is tagged will be given an implementation of `Endian` that
simply delegates the `Endian` method call to each field. The fields must all
themselves implement `Endian`, or the compiler will reject your code, and since
the primitives all implement `Endian` (by using their inherent methods, or by
pretending to be fixed integers and then using integer inherent methods), the
`Endian` trait implementations all eventually resolve to “call the integer
inherent method on each field” and the arbitrarily deep function stack
disappears thanks to compiler optimization.

This means that network serialization of any type comes down to two steps:

On outbound, call the appropriate `Endian::to_` method, then write as if it were
a byte array.

On inbound, read from a byte array into the type, then call the appropriate
`Endian::from_` method.

## Code Samples

Declare any standard struct, tuple struct, or zero sized type.

> There’s no reason for ZSTs _not_ to declare that they have this API; ZSTs can
> never exist as actual bytes, so any methods on them involving byte
> manipulation just don’t exist as machine code. You call them, the compiler
> pretends that meant anything, and you move on. Then if you ever change a type
> definition from ZST to real, or inverse, all the code still works.

{:tag="aside" .block-info}

```rust
struct Foo {
  a: i32,
  b: char,
}
struct Bar(u32, bool);
struct Quux;
```

Implement `Endian` on them. You can do it yourself, but since endian conversions
don’t change the order of fields, just of bytes within a single field, why would
you? So you can `impl Endian for Foo { ... }`, or you can scrap the above and do

```rust
#[derive(Endian)]
struct Foo { a: i32, b: char, }
#[derive(Endian)]
struct Bar(u32, bool);
#[derive(Endian)]
struct Quux;
```

Make instances of them, and call `Endian` methods.

```rust
let f = Foo {
  a: 0x01234567,
  b: 'A',
};
let b = Bar(0xFEDCBA98, true);
let q = Quux;

let fb = f.to_be();
let bl = b.to_le();
//  this does nothing, ever
let q = q.from_le();
```

That’s it.

## Caveats

After a `to_` conversion, and before a `from_` conversion, the data is tainted
and absolutely cannot be used as anything other than a sequence of raw,
meaningless bytes. Wrong-endian floats will be massively incorrect; wrong-endian
chars might not be valid at all (they have a max value of `0x10ffff`), and while
integer types will still be valid representations, their numeric value will be
FAR from correct. Once a data type is flipped out of native endian, it is just
bytes, and will remain so until flipped back.

Also, Rust’s memory model isn’t stabilized, so you can’t rely on transmuting a
struct to `[u8; size_of<Struct>]` and writing it directly; you still have to use
a real conversion function to write into and read out of a buffer. You could do
this with a `#[repr(C)]` or `#[repr(packed)]` annotation, but those tend to make
working with real instances of the struct less pleasant.
