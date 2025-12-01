---
title: Ferrilab Design, LLC
badges:
  - badge: github/stars/ferrilab/ferrilab
    url: https://github.com/ferrilab/ferrilab
    logo: github
  - badge: badge/Ferrilab-User_Guide-orange
    url: https://ferrilab.github.io/ferrilab
---

## Doing Business

The Wisconsin entity _Ferrilab Design, LLC_ serves as my professional agent for
work on this software. It:

- owns the publicly-available software that I produce
- provides my professional service while producing this software
- receives any financial awards granted for this software

Or, more concisely, _Ferrilab Design, LLC_ exists to separate my hobby work from
my regular employment, and to keep both of them separate from my personal life.
The _Ferrilab_ project doesn’t make me any money (though if it helps you do so,
please consider that I create and distribute it freely, and can only allocate
effort for doing so as either I, or you, indicate a desire for me to do so), and
this LLC is solely for organizational purposes.

I have full-time employment with which I am quite satisfied. I am able to
perform compensated, independent, work outside that, but not to the detraction
of my day job. If you are interested in working with me on that limited basis,
you may write to [`ferrilab@myrrlyn.net`](mailto:ferrilab@myrrlyn.net).

## Public Works

The _Ferrilab_ project is a collection of my work that has spun out of
developing my primary project, `bitvec`. At the moment it is composed of these
crates:

1. [`bitvec`]
2. [`funty`]
3. [`radium`]

`funty` and `radium` were extracted from `bitvec` and are usable on their own.

Each of these crates are described in more detail on their own pages.

### `funty`

Short for *fun*damental *ty*pes, this crate provides traits that unify the
language primitives (integers, floating-point numbers, `bool`, `char`, and
pointers) so that code can be generic over them.

With the initial stabilization of Generic Associated Types in Rust 1.65, I was
able to pull the trait-level pointer permission system I sketched in `bitvec`
out into `funty` and create a `Pointer<T: ?Sized, P: Permission>` type that
generically unifies `*const T` and `*mut T` and correctly adheres to Rust’s and
Miri’s rules about permission tracking, _and_ `Pointer` even switches between
storing a `*const T` and `*mut T` internally as appropriate, so that code
analysis tools can understand what is going on without needing to understand the
`Permission` trait.

The standard library APIs for the primitives, especially pointers, continues to
evolve. `funty` tracks it as best I am able to do, and tries to in general
remain about four releases behind current. This will not always be true, as I
may decide to use major advances in the language.

### `radium`

Originally sketched out by [Nika Layzell][nika], `radium` provides trait
unification over `Atomic` and `Cell<>` types. The `Radium` trait can be taken as
a generic bound to accept a type which may or may not be atomic, and the `Item`
associated type describes the primitive being managed.

Additionally, `radium` provides the `Atom<T>`, `Isotope<T>`, and `Radon<T>` type
families. These take a primitive integer as their type parameter, and forward to
the corresponding atomic, maybe-atomic, or `Cell<>`, respectively.

The `Isotope` type family uses platform support information to determine whether
it forwards to an `Atomic` or to a `Cell`. You can use this to have a single
unchanging name that changes behavior according to the target without needing to
personally remember where your code can and can’t run.

### `bitvec`

This is my most prominent work. It implements bit-precision addressing, allowing
the creation of arbitrary bitfields, compact `usize => bool` collections, and
I/O protocol buffer manipulation.

It works by encoding an intra-byte bit index into part of a slice pointer, so
that memory can be described by `&/mut BitSlice` references rather than
`Bits<'a>` struct handles. The creation of custom reference types allows the
crate to implement the vast majority of Rust’s APIs, as everywhere that requires
an actual _reference_ rather than just a borrowing view can still receive
`bitvec` types.

[nika]: https://github.com/mystor
[`bitvec`]: ./bitvec
[`funty`]: ./funty
[`radium`]: ./radium
