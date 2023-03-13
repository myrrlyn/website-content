---
title: ~/sample.rtf
subtitle: Typeface Examples
summary: A quick palette of how text is rendered here.
toc: false
---

This page contains sample text of various styled elements that appear on the
site, in order to provide quick visual testing of the overall theme.

## Subtitle

### Section

#### Subsection

##### Heading

###### Subheading

> This is an ordinary blockquote with no semantic information attached.

<!-- -->

> This is a danger sidebar.
>
> It requires two paragraphs in order for the image marker to not look terrible.
{:tag="aside" .bq-harm .iso7010 .p010}

<!-- -->

> This is a warning sidebar, warning of big stamps on short messages.
{:tag="aside" .bq-warn .iso7010 .w027}

<!-- -->

> This is a safety sidebar.
>
> It will contain reassuring or helpful information, in theory.
{:tag="aside" .bq-safe .iso7010 .e003}

<!-- -->

> This is an informational sidebar.
>
> It contains text that may be a fun parenthetical but does not otherwise carry
> meaning.
{:tag="aside" .bq-info .iso7010 .m002}

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

```plaintext
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

## Tag Rewriting

I postprocess my Markdown using IALs in order to use more tags than Markdown
produces according to the spec, allowing me to have semantic HTML.

These are some of the rewritten tags.

----

> This is a figure.
>
> And this is its caption, with a `citation`{:tag="cite"}.
> {:tag="figcaption"}
{:tag="figure"}

----

> These two paragraphs are inside a new section.
>
> I will probably not use it very often, since using `<section>`s properly
> within an `<article>` (which the template wraps around these documents) would
> require using very long `> blockquote` runs for most of the text.
{:tag="section"}

----

Here’s a definition-list group. Lists don’t seem to support IAL attchments, so
it is done here by using a long blockquote for the `<dl>` and alterating
paragraphs between `<dt>` and `<dd>`.

> Jargon
> {:tag="dt"}
> Its lay explanation
> {:tag="dd"}
>
> Jargon 2
> {:tag="dt"}
> Explanation 2
> {:tag="dd"}
{:tag="dl"}

----

In addition to block quotes we can have `inline`{:tag="q"} quotes. Something in
my pipeline is adding surrounding whitespace to the text element inside `<q>`,
so I am not using it in my text.
