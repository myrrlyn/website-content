---
title: Fundamental Types
badges:
  - badge: crates/v/funty
    url: https://crates.io/crates/funty
    logo: rust
  - badge: docsrs/funty
    url: https://docs.rs/funty/latest/funty
    logo: docsdotrs
  - badge: crates/dv/funty
  - badge: crates/l/funty
    url: https://github.com/ferrilab/ferrilab/blob/main/funty/LICENSE.txt
  - badge: github/stars/ferrilab/ferrilab
    url: https://github.com/ferrilab/ferrilab/blob/main/funty
    logo: github
---

This crate provides traits that unify the Rust primitives so that they can be
used as type parameters. The tree looks like this:

- `Fundamental`: all non-pointer primitives: integers, floating-point numbers,
  `bool`, `char`
  - `Numeric`: all numbers
    - `Integral`: all 2’s-complement integers
      - `Signed`: all signed integers: `i{8,16,32,64,128,size}`
      - `Unsigned`: all unsigned integers: `u{8,16,32,64,128,size}`
    - `Floating`: `f32` and `f64`

`Fundamental` has `.as_other()` methods that allow `as`-casting from one
primitive to another. The other traits all expose _every_ trait implementation,
inherent method, and associated constant shared by all implementors, so that you
should not have any source-code changes between using a named primitive and a
generic type parameter from this crate.

> This is very tedious to accomplish, so `funty` uses macros to declare each
> item signature and forward to the real thing. The list also has to be
> maintained entirely by hand, so it is a “best-effort” basis and will catch up
> to new items in the standard library “when I feel like it”. If you need a new
> item sooner, file an issue or, better yet, a PR.

{:tag="aside" .block-harm .iso7010 .f006}

In addition, the `IsN`, `AtLeastN`, and `AtMostN` traits place bit-width numbers
in the `N` position, and are implemented on types that satisfy the width
constraint.

## Pointers

But wait, there’s more! In addition to unifying the ordinary fundamentals, I
also elected to unify pointers and references.

In Rust, `*const u8` and `*mut u8` are two different types, and `*const T` and
`*const U` are two _more_ different types. The explosion of individual pointer
types not only by pointee but also by permission makes it basically impossible
to work with _pointers_ in a generic manner.

And `bitvec` is built entirely around the concept of working on pointers whose
pointee types are provided generically.

So I created the `Pointer<>` structure to unify not only pointers to any
pointee, but also the `Permission` trait to unify `*const`, `*mut`, and
`*mut as *const` (it’s different than just `*const`!). The end result,
`Pointer<T: ?Sized, P: Permission>`, represents _any_ pointer with _any_ write
permission, implements the pointer primitives’ inherent API, and adds additional
methods for safe and correct journeys through the permission system.

Of particular note are the `.cast_shared()` and `.try_into_mut_ptr()` methods.
`.cast_shared()` goes from `Pointer<T, P>` to `Pointer<T, (Shared, P)>`. This is
useless when `P` is `Shared`, but when `P` is `Unique`, it represents an
originally-mutable pointer that has been temporarily downgraded to const, and
_can be re-promoted back to mutable_ in the future.

Pointers that were always `*const` cannot be cast to `*mut` without incurring a
penalty in Miri. But pointers that were `*mut` _can_ be cast to `*const` and
then back to `*mut`. Actually _using_ the re-promoted pointer requires ensuring
that no other pointers are attempting to read from the pointed-to location, as
normal, but that is out of `funty`’s hands.

So `.try_into_mut_ptr()` produces `Some(*mut T)` when `P` is `Unique` or a
`(Shared, P)` where the `P` would eventually produce `Some(*mut T)`. This allows
any level of recursively-added `(Shared, P)` prefixes. The only `Permission`
type that returns `None` is `Shared`.

Furthermore, `Pointer<T: Sized>` has convenience methods for producing
`Pointer<[T]>` slice descriptors, which I need because `bitvec` is built
entirely on slice pointers; I also have a `NonNullPtr<T, P>` wrapper type with
the non-null optimization guarantee, and a `Reference` type alias that resolves
to either `&T` or `&mut T` as appropriate.

Thanks to Generic Associated Types, which began stabilizing in 1.65, I am able
to accomplish all of this by storing the correct pointer primitive (`*const T`
for `Pointer<T, Shared>` and `Pointer<T, (Shared, P)>`; `*mut T` for
`Pointer<T, Unique>`) and to implement `T -> U` pointee-type conversions such as
`.cast()` or `.make_slice(len: usize)`.

This module has been very difficult to create and use, but has made `bitvec`
_way_ simpler for me to implement. It _shouldn’t_ leak out too much to `bitvec`
users, since they are encouraged to not propagate `bitvec`’s generic arguments
and to instead instantiate monomorphized types. Initializing a `bitvec` type
with `&T` will propagate `P: Shared` throughout the library; similarly, `&mut T`
propagates `T: Unique`, and your code should never have to explicitly name this
type parameter.

It does make the generated API documentation worse to read by adding yet another
type parameter to all of the region descriptors, which is unfortunate.

I am building `funty::ptr` entirely to suit my needs in the `bitvec` project. If
you think it could be useful to you, _please_ use it and tell me what it’s
missing for your story. I have the stable pointer API (which is not sufficient,
unfortunately, but I am commited to working on stable Rust) and things that are
convenient for me. I am only one user, and more input is always worthwhile.

## Upcoming Pointer APIs

The standard library is experimenting with better APIs for working with the
actual numeric value contained inside a pointer, metadata for wide pointers to
difficult types such as slices and trait objects, and better use of slice
_pointers_ that does not require creating intermediate _references_.

I try to mirror these where I am able, but I can only do so much work in a shim.
The intermediate period where these APIs exist in the compiler and standard
library, and therefore can be tested by tools like Miri, but are not yet
available to third-party libraries like `bitvec` and `funty`, is _very_ awkward.
I do my best, but ultimately, if you are writing the kind of code that needs
this module, you are in a very murky grey area with regards to correctness under
Miri. `funty` will not make this _worse_, but it certainly won’t make it better
just yet either.

This is a complicated topic, and I’m always working on improving what I’ve
written down as my understanding of it so that either I can be corrected, or I
can be useful to others. If you’re interested in poking beneath the skin of
Rust’s concept of memory-addresses, I encourage you to start here and in the
standard-library docs and see how well you can understand what `funty` is doing.
I’ll be honest, I have to re-read my own notes basically every time I resume
working on it. This is _hard_, but it’s incredibly satisfying when it succeeds.
