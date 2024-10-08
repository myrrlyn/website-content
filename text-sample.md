---
title: ~/sample.rtf
subtitle: Typeface Examples
summary: A quick palette of how text is rendered here.
toc: false
---

This page contains sample text of various styled elements that appear on the
site, in order to provide quick visual testing of the overall theme.

## Chapter

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet magna
eget quam facilisis ultricies in non quam. Suspendisse in aliquam odio. Etiam
cursus, enim in vestibulum varius, tortor felis iaculis lacus, at congue purus
ex nec diam. Proin ornare odio id faucibus luctus.

Maecenas viverra semper vestibulum. Ut nec ornare lorem. Praesent condimentum
vitae velit non dictum. Nunc sodales augue nec leo molestie sagittis. In luctus
maximus erat, eu dignissim elit varius non. Vestibulum sagittis, dui in
hendrerit placerat, arcu purus vestibulum tortor, ut volutpat mi quam facilisis
enim. Etiam tincidunt lacus vel sem bibendum suscipit.

### Section

Aliquam vitae est velit. Pellentesque urna turpis, convallis in velit non,
imperdiet dapibus nibh. Vivamus tellus diam, ultricies non purus quis, elementum
lobortis ipsum. Morbi et quam facilisis, ultrices odio vel, lacinia tellus.

Aenean ex sapien, finibus ac suscipit nec, lacinia ut magna. Vestibulum volutpat
volutpat faucibus. Aliquam tincidunt rutrum urna et ullamcorper. Duis
sollicitudin est in sem aliquet, sit amet dapibus dui dapibus.

#### Subsection

Sed felis eros, pharetra at venenatis condimentum, fringilla faucibus purus.
Donec dapibus rutrum mollis. Donec sed neque faucibus, dignissim magna in,
interdum dolor. Ut lectus justo, venenatis a semper nec, aliquet vitae nisi.
Nunc quam elit, imperdiet vel nunc et, mattis sodales nisl. Vestibulum mauris
nibh, egestas et lectus nec, interdum vulputate sem. Fusce sed orci eros. Donec
lacinia auctor mollis.

Ut sodales sodales volutpat. Suspendisse vestibulum est ut sagittis dignissim.
Proin ut semper turpis. Vivamus eu felis ac lorem vehicula ultricies et vel mi.
Duis sodales felis leo, ac tempor ex bibendum ut. Integer auctor sapien vitae
orci vehicula porttitor. Nullam aliquet, risus ac molestie pharetra, mauris ex
laoreet metus, quis ultricies diam velit eu nunc. Aenean fringilla arcu lorem,
in efficitur neque tempus at.

##### Heading

Suspendisse commodo libero tempor, sollicitudin neque ut, auctor diam. Proin
rutrum nibh ipsum, at tempus odio imperdiet a. Morbi condimentum, quam non
tristique venenatis, mauris dui bibendum massa, id luctus ipsum sapien vitae
leo. Aliquam tempor ullamcorper ligula at ullamcorper.

Quisque a diam nibh. Aliquam tempus elementum maximus. Vestibulum pulvinar
tristique augue venenatis luctus. Sed est purus, feugiat quis congue nec, tempus
sit amet sem. Nulla tristique iaculis erat, tincidunt gravida lacus pretium vel.
Donec nec imperdiet lorem.

###### Subheading

Quisque quis ipsum pellentesque, viverra quam in, tempus lorem. Ut ullamcorper
eros cursus orci porta, vel cursus mauris convallis. Mauris maximus est felis.
Sed vestibulum nisl sit amet sapien ornare interdum.

Donec sodales luctus purus, in accumsan turpis ornare ac. Mauris condimentum
consectetur velit et commodo. Fusce sed convallis nunc. Suspendisse potenti.

####### There is no `<h7>`.

This is **bold**, _italic_, and `inline code` text. This is [a link](/) to the
site root, and this[^1] is a footnote.

Here is a `very long run of inline code` {:.other} just to see it in the AST.

> This is an ordinary blockquote with no semantic information attached.

<!-- -->

> This is a danger sidebar.
>
> It requires two paragraphs in order for the image marker to not look terrible.

{:tag="aside" .block-harm .iso7010 .p010}

> This is a warning sidebar, warning of big stamps on short messages.

{:tag="aside" .block-warn .iso7010 .w027}

> This is a safety sidebar.
>
> It will contain reassuring or helpful information, in theory.

{:tag="aside" .block-safe .iso7010 .e003}

> This is an informational sidebar.
>
> It contains text that may be a fun parenthetical but does not otherwise carry
> meaning.

{:tag="aside" .block-info .iso7010 .m002}

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

## Major Components

These represent more significant deviations from plain Markdown presentation,
and rely heavily on additional CSS or even JavaScript to function properly.

### Code Blocks

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

### Tag Rewriting

I postprocess my Markdown using IALs in order to use more tags than Markdown
produces according to the spec, allowing me to have semantic HTML.

These are some of the rewritten tags.

#### Figure

> This is a figure. It will be used when attaching context information to other
> fragments of information, usually images or code blocks. It will almost never
> be used for ordinary text like this example.
>
> And this is its caption, with a `citation`{:tag="cite"}.
>
> {:tag="figcaption"}

{:tag="figure"}

> ```plaintext
> Some code-block text.
>
> This figure uses `.no-count` to exclude the caption from
> auto-enumeration.
> ```
>
> _A codeblock and a demonstration of un-numbered figures._{:tag="figcaption"}

{:tag="figure" .no-count}

> And this figure has no caption at all, to demonstrate default caption
> production.

{:tag="figure"}

#### Explicit Sections

> These two paragraphs are inside a new section.
>
> I will probably not use it very often, since using `<section>`s properly
> within an `<article>` (which the template wraps around these documents) would
> require using very long `> blockquote` runs for most of the text.

{:tag="section"}

#### Definition Lists

Here’s a definition-list group. Lists don’t seem to support IAL attchments, so
it is done here by using a long blockquote for the `<dl>` and alterating
paragraphs between `<dt>` and `<dd>`.

> Jargon
>
> {:tag="dt"}
>
> Its lay explanation
>
> {:tag="dd"}
>
> Jargon 2
>
> {:tag="dt"}
>
> Explanation 2
>
> {:tag="dd"}

{:tag="dl"}

#### Other Work

In addition to block quotes we can have _inline_{:tag="q"} quotes. Something in
my pipeline is adding surrounding whitespace to the text element inside `<q>`,
so I am not using it in my text.

Keyboard entry can be shown with `<kbd>` tags, like this: _ctrl_{:tag="kbd"} +
_alt_{:tag="kbd"} + _del_{:tag="kbd"}. If I were clever, I’d write a codeblock
transform that turned `console` or similar language directives into a
`<pre><samp>` block instead of `<pre><code>`, so that output would look like
this:

```sh
tail -n1 /etc/passwd
```

> myrrlyn:x:1000:1000:Alexander Payne:/home/myrrlyn:/usr/bin/nu
>
> {:tag="samp"}

{:tag="pre" .samp-container}

This text is _highlighted_{:tag="mark"}, this text has a ~~retraction~~, and
this is its _replacement_{:tag="ins"}.

[CommonMark]: //commonmark.org

[^1]: Wouldn’t it be nice if these were in [CommonMark]? They aren’t!
