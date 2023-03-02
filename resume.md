---
title: Résumé – Alexander Payne
summary: My résumé
tab_title: "~myrrlyn/résumé"
---

I am a software engineer with experience in low-level firmware and application
development. I am trained in technical writing and system design, with
emphases on user comprehension and fault tolerance.

## Capabilities

- I am an expert with the Rust and C languages, and am strongly versed in C++.
  I am most experienced in freestanding and Linux environments; I have not used
  Windows or macOS system APIs directly.
- I am an able software architect and system designer.
- I am a strong technical writer.
- I am a rapid learner, and have a strong ability to understand technical
  documents and synthesize project features that fulfill provided constraints
  and requirements.

## Professional Experience

I have been employed as a software engineer since 2016 Dec. The nature of my
work in federal subcontracting and corporate R&D limits the detail I can write
here.

### You?

I am currently looking for my next opportunity. I have moved every year from
2016 through 2022, when I finally bought a house in Madison, WI. I am not
willing to move again, and expect to work remotely, or no more than two days a
week in the Great Lakes area (Minneapolis, Chicago, or Detroit).

I am most skilled in Rust, C++, and C, employed in embedded or systems-level
development. I am most capable with edge or server computing, though I am
certainly interested in growing my applications-programming skills as well. I am
comfortable with challenging software design problems and excel at finding
correct, performant, and composable solutions to complex problems.

### Fastly

Dates: 2021 Sep 20 – 2023 Jan 13

Role: Senior Software Engineer

Responsibility: I worked on the H2O web server to improve Fastly’s capabilities
for traffic handling at the edge of its network. My team decided to start
writing new logic in Rust, and I helped us introduce Rust into a large C
codebase. I implemented modules with logic on both sides of the FFI boundary and
designed a bindings crate so that HTTP handlers could be written in Rust and
used by H2O.

### Amazon Web Services

Dates: 2020 Jul 6 – 2021 Aug 6

Role: Software Development Engineer

Responsibility: I was the Rust subject-matter-expert on my team. We researched
Rust’s suitability for use in novel embedded devices operating under tight
performance and security constraints. I designed and implemented device driver
APIs, including direct register access and bindings to C vendor libraries.

I am not at liberty to further discuss the details of my work at AWS.

### Space Dynamics Laboratory

Dates: 2016 Dec 5 - 2020 May 28

Responsibility: I was a Satellite Software Engineer working on the development
and testing of flight control systems of CubeSat research vehicles. I worked
primarily in C++, with some C for more esoteric devices and Ruby for ground
control software.

Certifications: TS/SCI clearance (expires 2023 Aug)

## Notable Projects

### Open-Source

I am the primary maintainer of the [Ferrilab][ferrilab] project’s crates. I
invented [`bitvec`][bv], which implements bit-precision addressing as a Rust
library and fits directly into Rust’s existing language patterns, type system,
and library interfaces. I also maintain `radium`, which unifies atomic and
non-atomic shared-mutability interfaces; `funty`, which provides a simple
unification of the Rust primitive types (integers and pointer mutability); and
`tap`, which allows writing method-call chains with functions that cannot be
method-called directly.

### Commerical

> I am being more cautious about concealing details on this page than I strictly
> need to. I am able and willing to talk about the nature of my work in more
> depth during conversation.
{:tag="aside" .bq-safe .iso7010 .e023}

At Fastly, I worked on Fastly’s internal extensions to the H2O web server. These
extensions are corporate secrets, but involved analysis and management of
aggregate ingress traffic.

At AWS, I designed the unikernel software and device drivers used to control a
hybrid Cortex-A/Cortex-R system.

At SDL, I worked on these projects in order of decreasing recency:

- VPM; USAF/Kirtland AFB

  I wrote flight software systems in C++ using SDL’s framework for distributed
  service control. VPM was successfully launched and operated from Kirtland and
  SDL facilities.

- EAGLE; USAF/Kirtland AFB

  I wrote ground control software that generated tasking routines for
  transmission to the vehicle.

- DHFR; DARPA/MIT

  I wrote ground control software interfaces and automation, and performed
  operations for four months. My satellite was eventually found to have been
  destroyed by the launch.

- BioSentinel; NASA Ames

  I wrote a kernel driver in C89 for VxWorks that bridged the primary computer
  and a secondary FPGA holding multiple peripherals.

### Research

As part of my work with the [COSMOS][cosmos] framework, I wrote Rust programs to
act as data pipeline filters and C++/Ruby code generators. This research
indirectly led to the creation of [`bitvec`][bv].

My work on the Ferrilab crates explores the boundaries of Rust’s type system and
abstract-machine rules, and has been used for case studies in Miri’s
development.

## Personal Experience

I develop software for a hobby as well as for a career. I have been able to
maintain a good separation of my work and hobby pursuits, which allows me to
broaden my skills without incurring burnout.

### Rust Crates

I am the author or maintainer of a number of Rust libraries. You can read more
about them at my [crate listing][crates]. I have been an active Rust author
since 2016, and am considered an expert by my employers and the general Rust
community.

### Web Design

This website is self-authored, atop the Phoenix framework. I first learned Sass
in 2013, and have kept current as modern HTML and CSS standards have evolved. I
am working on building more complex CRUD applications for myself, but am not
ready to publish any of them yet.

## Education

Trine University: 2011 – 2016. Studied Computer Engineering, B.Sc.

Notable courses:

- ***Senior Design***: My capstone project was the construction and programming
  of an autonomous cargo hauler. I worked with three mechanical engineers on the
  physical machine, and personally built the electrical and software systems.
  The machine capably navigated along a pre-programmed route, and successfully
  detected obstacles such as pedestrians and a train. The code is on my GitHub
  profile, and the summary video is [on YouTube][srd]. I can provide design
  documents upon request.

- **Logic and Computer Design**: This class focused on the hardware construction
  of a computer and the instruction primitives executing on it. We built a
  five-stage MIPS CPU in Verilog.

- **Embedded Systems**: This class taught real-time operating systems and
  freestanding programming. We built an oscilloscope and basic RTOS.

[bv]: ./crates/bv
[cosmos]: https://cosmosrb.com
[crates]: ./crates
[ferrilab]: https://github.com/ferrilab/ferrilab
[srd]: https://www.youtube.com/watch?v=K3CKSovJbJQ
