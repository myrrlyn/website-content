---
title: Cosmonaut
---

> I stopped work on Cosmonaut in 2018 July when I switched over to [`bitvec`],
> and have not been able to meaningfully return since.
{:.bq-warn role="complementary"}

Cosmonaut ~~is~~ <ins>was</ins> a mixed work and personal project I’d been
working in my spare time since late 2017. It is a Rust reimplementation of the
[Cosmos][cosmos] framework for embedded device networking that we use at work to
manage some of our spacecraft.

## Overview

My <ins>former</ins> company manufactures, programs, and operates CubeSats. The
onboard software we produce for the satellites is lightweight and typically
bespoke for each project. Part of the software design process includes defining
the set of messages that will be exchanged by the vehicle and the ground
station, with as little overhead in the binary form as possible.

In order to reduce resource use in the software for de/serialization, and reduce
the packet size in radio transport, the messages are often just direct
transmissions of the in-memory data structure. As our flight software is written
in C and C++, the memory layout is well-known and can be sent to the radio with
full confidence of what the transmitted message is, and how it will be
interpreted on the ground. We can have equal confidence for messages we send to
the vehicle and the vehicle’s ability to deserialize by simple pointer cast.

### Prior Art

I wrote about some of the aspects of this communication protocol in my
[articles about use of and ideas for type casting][1]. Since then, I’ve mulled
over how to start working on a Rust library to work in this area.

## First Steps

Over winter break, I decided I’d finally get around to really learning and
using the [`nom`][nom] parser library to build a parser for the COSMOS command
and telemetry definition languages. I built up parsers for the most common 80%
of the language, and am stuck on the remaining, uncommon, elements.

Once I got to a point where my library could successfully parse example files
and real files from my work, I started refactoring the library to make it more
suitable for use as a general library and practice my Rust skills.

## Library Structure

I initially had *a lot* of code duplication, because of the similarities
between `COMMAND` and `TELEMETRY` grammars (and their child types, `PARAMETER`
and `ITEM`, and the `SELECT_`-prefixed variants of all four), and as the parser
progressed I was able to start seeing ways to reduce duplication by refactoring
the large objects and functions into smaller types shared between them, or into
traits.

Now that I am 80% done with the parser (only the last 80% to go! The grammars
that remain require more design thought, integration of a Ruby ERb processor, or
something else entirely), I have begun working on using the parsed structures to
perform de/serialization of data values and binary sequences. This part is
challenging, as it requires a lot of thought about client-facing design and
mucking about with really low-level bit hacking code.

My biggest advance, from an author’s perspective, was realizing that Rust is
*incredibly* permissive about `impl` blocks and module layout. My modules for
the four main parsed structures were getting **massive**, so I split them each
into a root module with several child modules, which could implement traits and
inherent methods as I so chose and the root module would hold only the type
itself.

[1]: /blog/type-theory/type-alchemy
[`bitvec`]: /crates/bitvec
[cosmos]: http://cosmosrb.com
[nom]: http://rust.unhandledexpression.com/nom/
