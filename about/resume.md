---
title: Alexander Payne
subtitle: Software Engineer
tab_title: My Résumé
extra_css: |
  h1.title, h2.subtitle {
    font-family: "Ferro Rosso";
    font-variant: normal;
  }
  h1.title {
    font-size: 5em;
  }
  h2.subtitle {
    font-size: 4em;
  }
---

## Introduction {:.no-count .no-toc .text-center}

I am a software engineer specializing in low-level systems and freestanding
code. I have nine years’ industry experience writing appliance control software
for research satellites and domestic appliances, high-performance web server
logic, and foundation libraries in C, C++, and Rust. I have worked closely with
hardware engineers to create new machines and with fleet operators to deploy
software worldwide.

I excel at designing and implementing safety-critical code and proving
conformance to external requirements, including both customer needs and formal
engineering standards. I am a strong technical writer and produce my own
documentation. I am also an active contributor to open-source software,
primarily in Rust. I maintain several widely-used utility libraries and lead the
[Ferrilab] project.

## Summary {:.no-count .no-toc .text-center}

These are explained in more detail below.

### Ferrilab {:.no-count .no-toc}

As the sole proprietor of Ferrilab Design, LLC, I offer software consultancy and
maintain an open-source Rust project which significantly reshapes the standard
programming model. The [`bitvec`] crate is widely used throughout the public
Rust ecosystem.

### Sub-Zero Group {:.no-count .no-toc}

I am a senior software engineer working on safety-critical and user-interface
microcontroller software for Wolf ovens. I also drive education and
modernization within our team.

### Fastly {:.no-count .no-toc}

I was a senior software engineer responsible for creating traffic-management
code in Rust and integrating it into a C codebase. My work was an ingress filter
running worldwide on Fastly's fleet, and enabled significant reduction in
malicious traffic without imposing a performance cost to any other users.

### Amazon Web Services {:.no-count .no-toc}

I led the design and implementation of a Rust real-time unikernel running on a
small ARM processor. I worked with electrical engineers to develop a novel
networking appliance subject to strict performance, security, and
tamper-resistance requirements.

### Space Dynamics Laboratory {:.no-count .no-toc}

I wrote kernel modules and flight application software for small satellites, and
earthside ground-station software to control them. I also served as control
staff for vehicle operations.

### Formal Education {:.no-count .no-toc}

I studied Computer Engineering at Trine University. I learned digital system
design in Verilog and embedded programming in C. I built and programmed a small
autonomous vehicle for my thesis project.

---

## Professional Experience

### Sub-Zero Group

> - Time: 2023—present
> - Role: Senior Software Engineer
> - [Website][szg]

{:tag="aside" .block-info}

I am the lead engineer on the human control surface for [Wolf ovens][wolf-oven].
The Wolf oven software suite, including my user-interface program, is a small
network of microprocessors running C++ freestanding applications linked by a CAN
bus.

I also design the safety-critical software that implements compliance with UL
858 and 60730 Class-B standards, and drive our team’s CMake build system and CI
automation processes.

### Fastly

> - Time: 2021—2023
> - Role: Senior Software Engineer
> - [Website][fastly]

{:tag="aside" .block-info}

I was the Rust subject-matter expert on a team maintaining the
[H2O web server][h2o] powering Fastly's traffic ingress system. We worked on
traffic management and prioritization, writing Rust modules and linking them
into H2O's C codebase through an FFI bridge. Our work enabled Fastly to overcome
DDOS attempts during the holiday season without a performance impact to our
customers.

I was let go during the market contraction of the 2022-23 winter.

### Amazon Web Services

> - Time: 2020—2021
> - Role: Software Development Engineer II
> - [Website][aws]

{:tag="aside" .block-info}

I was recruited to be the Rust subject-matter expert and software subteam lead
for an experimental layer-2 networking appliance. I designed the software system
architecture for a unikernel program running on an ARM Cortex-R processor, and
implemented device drivers and the early application framework.

I am required to not disclose anything more about this project. It was cancelled
after a year, and several of us left AWS when we weren't able to find suitable
internal positions.

### Space Dynamics Laboratory

> - Time: 2016—2020
> - Role: Satellite Software Engineer I
> - [Website][sdl]

{:tag="aside" .block-info}

I wrote firmware and control software for space vehicles, wrote ground-station
control software and performed on-orbit vehicle operations, and designed novel
laboratory systems. I worked on both public and military projects, and the
peculiar nature of satellite operations has vastly over-prepared me for
terrestrial industry.

I resigned from SDL after my grandmother's death and mother's illness early in
the COVID-19 pandemic so that I could spend time supporting my mother in her
recovery.

#### GRYPHON

> - Time: 2020
> - Client: [AFRL]
> - Status: Classified

{:tag="aside" .block-info}

I worked on the design and initial standup of an experimental laboratory and
simulation environment, primarily in Python. This was a classified project, and
I cannot provide further details about my tasking.

#### VPM

> - Time: 2019
> - Client: [AFRL]
> - Status: Public
> - [Website][afrl-vpm]

{:tag="aside" .block-info}

I wrote vehicle control software in C++11, using SDL’s [Radiant][sdl-radiant]
application framework.

#### EAGLE

> - Time: 2018–19
> - Client: [AFRL]
> - Status: Classified
> - [Website][afrl-eagle]

{:tag="aside" .block-info}

I wrote ground-station control software in Python 2 and supplied continuous
updates for over a year until the project was relocated away from Kirtland AFB.
This was a classified mission and I was not permitted to be present in the SCIF
during vehicle operations. As such, deployment required carrying patches back
and forth between my office and the SCIF, and manually updating the software
both in production and on my development machine.

#### DHFR

> - Time: 2017
> - Client: [DARPA]
> - Status: Classified
> - [Website][darpa-dhfr]

{:tag="aside" .block-info}

I wrote ground-station control software in Ruby, using the COSMOS (now OpenC3)
framework and assisted with post-assembly vehicle testing. I then performed
vehicle launch-and-early-operations for the mission until the vehicle was
declared dead on orbit.

The orbital characteristics of the DHFR mission gave it a 9-hour window of
periodic visibility over our ground-station network, followed by 14 hours where
it was not visible. The resulting 23-hour "day" meant that my shift began one
hour earlier every day, rotating backwards around the clock. I was the sole
continuous staffer for the four months between launch and end of mission.

#### BioSentinel

> - Time: 2016–17
> - Client: [NASA Ames]
> - Status: Public
> - [Website][nasa-biosentinel]

{:tag="aside" .block-info}

I wrote a kernel module in C99 for VxWorks 6 on a SPARC v8 chip. This module
multiplexed a number of discrete hardware sensors aboard an FPGA over a single
SpaceWire connection, allowing userland software running on the CPU to access
each of the sensors through a named device file.

Due to the design of the SPARC architecture and NASA's restrictions on dynamic
memory allocation, this required careful memory management and an implementation
with as few interior function calls as possible.

## Public Works

I began what is now the [Ferrilab] project in 2018. It is a small collection of
Rust open-source crates.

### `bitvec`

`bitvec` implements bit-precision addressing as an ordinary library. It provides
idiomatic collections and behavior, including arrays, dynamic vectors, and
borrowed slices. It allows client code to specify both the integer type used for
backing storage and the order of bits within those integers, implements the
entire standard-library sequence API, and is entirely thread-safe.

This project pushes the boundaries of what the Rust language is able to express,
and is a case study in ongoing development of the Rust abstract machine's
pointer model.

### `funty`

`funty` provides traits that abstract over the Rust primitive types, allowing
client code to become generic over the primitives while still retaining access
to their full API. This allows, for instance, client code to become generic over
the width of a numeric type but making use of properties such as signedness.

### `radium`

`radium` unifies Rust's shared-mutability markers. `Cell` is not thread-safe but
requires no special hardware support; the `atomic` module contains types that
are thread-safe but are not guaranteed to exist on every `radium` allows code to
defer which of these families is used to provide shared mutability. It provides
best-effort type aliases that resolve to atomics when present and cells when
not, allowing code to become portable across different targets without incurring
compiler errors.

### `tap`

This library provides convenience methods that allow common operations
(inspection, mutation, or conversion) to be placed in suffix-call position. This
is analagous to Elixir's pipe operator (`|>`), or D's implementation of Universal
Method-Call Syntax.

### `calm_io`

This provides alternatives to Rust's standard-stream write macros that do not
panic on error, and a decorator for `fn main` which detects when `main` returns
with `io::ErrorKind::BrokenPipe` and converts it into a graceful exit.

Without this crate, any Rust program which uses `println!` can be induced to
panic by running it as `prog | head -n0`: this argument causes `head` to quit
immediately, `prog`'s stdout stream closes, and `println!` unwraps the error
returned when writing to a closed pipe.

The Rust project is currently working on integrating this behavior into the
standard library.

## Skills and Abilities

- I am an expert Rust programmer, and have written it as my primary language
  since 2016, roughly v1.10.
- I am fluent in C++23 and C99. I have written C89, but I would prefer not to do
  so again.
- I have a decade of experience working on microcontrollers, primarily ARM but
  also AVR, SPARC, and PowerPC. I have used FreeRTOS, VxWorks, and
  wholly-freestanding systems.
- I both write and speak English natively, and am a skilled public speaker.
- I excel at system analysis, technical writing, and working in constrained
  environments.
- I have maintained an Arch Linux machine continuously since 2013 as my personal
  computer and public server.
- I am specialized in asymmetrically-distributed systems and CLI tools, and
  familiar with web applications. I have not written desktop, windowed, software
  professionally.
- I primarily use Git and Linux. I have used Docker for both development
  environments and application deployments. I am familiar with Mercurial and
  Windows PowerShell, but have not used them extensively.
- My public work is on GitHub; I have also used GitLab, the Atlassian suite, and
  Microsoft Azure DevOps professionally.

## Formal Education

> - School: Trine University
> - Major: Computer Engineering
> - Time: 2011—2016
> - [Website][trine-cpe]

{:tag="aside" .block-info}

My thesis project was the construction, programming, and operation of an
autonomous freight vehicle. My responsibilities on the team were:

- drivetrain component selection and assembly
- control system component selection and assembly
- freestanding control software design and implementation
- device driver implementation for:
  - GPS receiver (positioning)
  - magnetometer (orientation)
  - ultrasonic sensors (environmental awareness)
  - motor controllers (movement)
  - axle Hall-effect sensors (closed-loop PID control)

I also studied digital component design, including the construction of a MIPS
CPU in Verilog which was required to execute real programs when programmed to an
FPGA.

## Additional Qualifications

### Federal Clearance

I was granted a TS/SCI clearance in 2018 February. I was last read out in 2021
August, and so my investigation expired in 2023 August. I maintain a lifestyle
that is conducive to clearance investigations should the need arise.

### Aquatics

I am a PADI rescue diver and former Scouting America lifeguard instructor. I
believe strongly in the importance of imposing safety onto a hazardous
environment, and bring this focus to all aspects of my work.

### Medicine

I am a Wilderness First Aid and CPR instructor with the [ECSI] school.

[AFRL]: https://www.afrl.af.mil/About-Us/
[DARPA]: https://www.darpa.mil/about
[ECSI]: https://www.ecsinstitute.org/about-ecsi/about
[Ferrilab]: /ferrilab
[NASA Ames]: https://www.nasa.gov/ames/
[afrl-eagle]: https://www.kirtland.af.mil/Portals/52/documents/EAGLE-factsheet.pdf
[afrl-vpm]: https://www.afrl.af.mil/Portals/90/Documents/RV/Very%20Low%20Frequency%20Propagation%20Mapper%20(VPM)%20Satellite_AFMC-2019-0769.pdf?ver=2020-08-26-133350-127"
[aws]: https://aws.amazon.com/what-is-aws/
[darpa-dhfr]: https://www.nanosats.eu/sat/dhfr
[fastly]: https://www.fastly.com/company
[h2o]: https://github.com/h2o/h2o
[nasa-biosentinel]: https://www.nasa.gov/ames/biosentinel
[sdl]: https://sdl.usu.edu/company/about
[sdl-radiant]: https://www.sdl.usu.edu/media-events/media-library/pdf/radiant/
[szg]: https://www.subzero-wolf.com/company/our-heritage
[trine-cpe]: https://www.trine.edu/academics/majors-degrees/undergraduate/bs-computer-engineering/index.aspx
[wolf-oven]: https://www.subzero-wolf.com/wolf/configurator#sort=%40displayorder%20descending&numberOfResults=21&f:Type=[Convection]&f:Width=[30%22]&f:Line=[M%20Series]&wolfcategory=Built-in%20Ovens
[`bitvec`]: /crates/bitvec
