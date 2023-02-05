---
title: ~/sample.rtf
summary: A quick palette of how text is rendered here.
---

This page contains sample text of various styled elements that appear on the
site, in order to provide quick visual testing of the overall theme.

# Title

## Subtitle

### Section

#### Subsection

##### Heading

###### Subheading

> This is an ordinary blockquote with no semantic information attached.

<!-- -->

> This is a danger blockquote.
>
> It requires two paragraphs in order for the image marker to not look terrible.
{:role="complementary" .bq-harm .iso7010 .p010}

<!-- -->

> This is a warning blockquote, warning of big stamps on short messages.
{:role="complementary" .bq-warn .iso7010 .w027}

<!-- -->

> This is a safety blockquote.
>
> It will contain reassuring or helpful information, in theory.
{:role="complementary" .bq-safe .iso7010 .e003}

<!-- -->

> This is an informational blockquote.
>
> It contains text that may be a fun parenthetical but does not otherwise carry
> meaning.
{:role="complementary" .bq-info .iso7010 .m002}

This is **bold**, *italic*, and `inline code` text.

```rust
#[repr(C)]
pub struct BitSpan<O, T>
where O: BitOrder, T: BitStore {
  ptr: NonNull<u8>,
  len: usize,
}

impl<O, T> BitSpan<O, T>
where O: BitOrder, T: BitStore {
  /// Constructor
  pub fn new(
    addr: *mut T,
    head: BitIdx<T::Mem>,
    bits: usize,
  ) -> Result<Self, Error> {
    todo!("Draw the rest of the owl")
  }
}
```

```plain
This block is ordinary text and
should never be syntax highlit.

This is a really quite egregiously long line that probably looks ugly on mobile.
```

```sh
cat ./demo.txt
curl https://sh.rustup.rs | pv | sh -- -s
# this is a shell script
```

Here is a `long run of inline code` {:.other} just to see it in the AST.

- Lists
  - of lists
    - of lists
- are uninteresting
  - when bullets
    - don’t change

1. Numbered lists
   1. and sublists
      1. and sublists
      1. for details
   1. rapidly escape
      1. simple summation
      1. or broad understanding
1. to make trees
   1. that branch
      1. and branch
      1. some more
   1. multiplying
      1. over
      1. and over
