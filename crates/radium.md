---
title: General Atomics
---

[Nika Layzell][kneecaw] and I wrote a crate that provides a trait, `Radium`,
which abstracts over atomics and ordinary shared-mutable integers. We began it
when the `#[cfg(target_has_atomic = "width")]` gate was not available to
libraries, and we needed a way to switch between atomics and `Cell`s based on
what the target environment supported.

It’s now part of the [Ferrilab](./ferrilab) project, as `bitvec` is a primary
consumer.

The 1.0 series requires Rust 1.60, as this stabilized the `target_has_atomic`
gate and allowed us to ditch the build-script with copy-pasted target
definitions from the compiler repository and use information given to us
during compilation proper. It adds type families so that you can request an
atomic wrapper over a generic integer (useful in `bitvec`, which receives
integers as type parameters rather than monomorphized names).

If your project includes targets with incomplete atomic support, this library is
very likely useful to you. Eliminate missing-symbol errors and confusing `cfg`
gates, and rely on us to route to the correct instruction for you.

[kneecaw]: https://twitter.com/kneecaw
