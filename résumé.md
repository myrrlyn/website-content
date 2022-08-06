---
title: Résumé – Alexander Payne
summary: My résumé
---

I am a software engineer with experience in low-level firmware and application
development. I am trained in technical writing and system design, with
emphases on user comprehension and fault tolerance.

## Capabilities

- I am an expert with the Rust and C languages, and am strongly versed in C++.
  I am most experienced in freestanding environments; I have a working knowledge
  of their standard libraries but am only somewhat aware of operating-system
  facilities.
- I am a capable software architect and system designer.
- I am a strong technical writer.
- I am a rapid learner, and have a strong ability to understand technical
  documents and synthesize project features that fulfill provided constraints
  and requirements.

## Professional Experience

I have been employed as a software engineer since 2016 Dec. The nature of my
work in federal subcontracting and corporate R&D limits the detail I can write
here.

<!-- no I’m not

### You?

I am currently looking for my next opportunity. I have moved every year since
2016 and intend to break the cycle this year. I will happily work from your
office in the Washington, D.C., metro area, or remotely, until *at least* 2023.

I am most skilled in Rust, C++, and C, employed in embedded or systems-level
development. I am most capable with edge or server computing, though I am
certainly interested in growing my applications-programming skills as well. I am
comfortable with challenging software design problems and excel at finding
correct, performant, and composable solutions to complex problems.

-->

### Fastly

Dates: 2021 Sep 20 – present

I help maintain the `h2o` web server and teach effective use of Rust segments
within a primarily C codebase.

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

Certifications: TS/SCI

#### Projects

In order of decreasing recency:

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

## Personal Experience

I develop software for a hobby as well as for a career.

### Rust Crates

I am the author or maintainer of a number of Rust libraries. You can read more
about them at my [crate listing][crates]. I have been an active Rust author
since 2016, and am considered an expert by my employer and the general Rust
community.

### Web Design

This website is self-authored, atop the Phoenix framework.

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
[srd]: https://www.youtube.com/watch?v=K3CKSovJbJQ
