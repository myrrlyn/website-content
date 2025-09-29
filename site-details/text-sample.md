---
title: ~/sample.rtf
subtitle: Typeface Examples
page_title: Markdown Test Page
date: 2016-10-01
about: This page demonstrates rendering Markdown and using metadata.
summary: A quick palette of how text is rendered here.
toc: false
css:
  - kind: inline
    value: |
      span.title { font-style: italic; }
js:
  - kind: inline
    value: |
      console.log("custom JavaScript");
---

This page exercises the elements used in Markdown documents throughout the site
in order to provide a quick visual reference for the theme. A full listing of
all HTML elements can be found at the [sibling page](./html-sample.html).

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

Here is a `longer run of inline code` just to see it in the AST.

Blockquotes come in regular or rainbow:

> Unadorned

<!-- -->

> Red

{:.block-red}

> Orange

{:.block-orange}

> Yellow

{:.block-yellow}

> Green

{:.block-green}

> Blue

{:.block-blue}

> Purple

{:.block-purple}

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

> ### Sidebars
>
> As in textual, not as in display panels. If your screen is wide enough, then
> the blocks will display side-by-side for the same color; if it isn’t, they’ll
> all be in one vertical sequence.
>
> > These may use ISO-7010 Prohibition or Fire signage,
>
> {:tag="aside" .block-red .iso7010 .p010 .half-width .float-left}
>
> > or be unadorned and use ANSI Z535 Danger colors,
>
> {:tag="aside" .block-red .half-width .float-right}
>
> > or ISO-3864 Warning stripes (there are no 7010 Warning symbols),
>
> {:tag="aside" .block-orange .iso7010 .half-width .float-left .clear}
>
> > or ANSI Z535 Warning stripes (ANSI does not specify icons at all),
>
> {:tag="aside" .block-orange .half-width .float-right}
>
> > or ISO-7010 Caution signage,
>
> {:tag="aside" .block-yellow .iso7010 .w027 .half-width .float-left .clear}
>
> > or ANSI Z535 Caution stripes, which I prefer to ISO
>
> {:tag="aside" .block-yellow .half-width .float-right}
>
> > or ISO-7010 Safety signage,
>
> {:tag="aside" .block-green .iso7010 .e003 .half-width .float-left .clear}
>
> > or ANSI Z535 green, which I also prefer,
>
> {:tag="aside" .block-green .half-width .float-right}
>
> > or ISO-7010 Mandate signage. The image size, when present, is about two
> > lines tall, and is inline with the first child element of the `<aside>`. If
> > this additional text had been a second `<p>`aragraph, it would have
> > forcibly begun below the image, instead of wrapping like you see here.
>
> {:tag="aside" .block-blue .iso7010 .m002 .half-width .float-left .clear}
>
> > They can also use ANSI Z535 Notices, which yet again have the better coloring
> > in my opinion.
>
> {:tag="aside" .block-blue .half-width .float-right}
>
> > ISO does not define a purple, but ANSI does. ANSI does not specify a
> > semantic meaning for the purple.
>
> {:tag="aside" .block-purple .clear}
>
> These blocks use ANSI Z535 colors by default, and switch over to ISO-3864 when
> needed to color-match one of the ISO-7010 icons. I don’t feel like recoloring
> all the 7010 icons I downloaded.

{:tag="section"}

<!--
![](/static/text-sample/block-light.png)

![](/static/text-sample/block-dark.png)
-->

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

```text
This block is ordinary text and
should never be syntax highlit.

This is a really quite egregiously long line that probably looks ugly on mobile.
```

```sh
cat ./demo.txt
curl https://sh.rustup.rs | pv | sh -- -s
# this is a shell script
```

```rst
I have to explicitly add language support; anything I don’t just gets a plain
monospace-font and no decorations.
```

All known languages:

```c
char const* sig = "c";
```

```cosmos
# cosmos
```

```cpp
std::string_view sig = "cpp";
```

```css
--sig: "css";
```

```erlang
sig = "erlang"
```

```elixir
sig = "elixir"
```

```html
<dt>sig</dt>
<dd>html</dt>
```

```js
let sig = "js";
```

```md
Use the `md` code-block annotation.
```

```ps1
$sig = "ps1";
```

```rust
let sig = "rust";
```

```rust_errors
Note: Rust compiler errors use the "rust_errors" marker.
```

```scss
$sig: "scss";
```

```sh
export SIG="sh"
```

```console
console
```

```toml
sig = "toml"
```

```xml
<codeblock sig="xml" />
```

```text
Everything else uses "text".
```

Colors are taken from GitHub’s [Linguist][linguist-yml] project.

### Tag Rewriting

I postprocess my Markdown using IALs in order to use more tags than Markdown
produces according to the spec, allowing me to have semantic HTML.

These are some of the rewritten tags.

#### Figure

> > This is a figure. It will be used when attaching context information to other
> > fragments of information, usually images or code blocks. It will almost never
> > be used for ordinary text like this example.
> >
> > And this is its caption, with a _citation_{:tag="cite"}.
> >
> > {:tag="figcaption"}
>
> {:tag="figure"}

{:tag="div" .half-width .float-left}

> ```md
> > This is a figure. It will be used when
> > attaching context information to other
> > fragments of information, usually images or
> > code blocks. It will almost never be used
> > for ordinary text like this example.
> >
> > And this is its caption, with a
> > _citation_{:tag="cite"}.
> >
> > {:tag="figcaption"}
>
> {:tag="figure"}
> ```md

{:tag="div" .half-width .float-right}

> > ```text
> > Some code-block text.
> >
> > This figure uses `.no-count` to exclude the
> > caption from auto-enumeration.
> > ```
> >
> > > A codeblock and a demonstration of
> > > un-numbered figures.
> >
> > {:tag="figcaption"}
>
> {:tag="figure" .no-count }

{:tag="div" .half-width .float-left .clear}

> ```md
> > ```text
> > Some code-block text.
> >
> > This figure uses `.no-count` to exclude the
> > caption from auto-enumeration.
> > ```
> >
> > > A codeblock and a demonstration of
> > > un-numbered figures.
> >
> > {:tag="figcaption"}
>
> {:tag="figure" .no-count }
> ```

{:tag="div" .half-width .float-right}

> > And this figure has no caption at all, to
> > demonstrate default caption production.
>
> {:tag="figure"}

{:tag="div" .half-width .float-left .clear}

> ```md
> > And this figure has no caption at all, to
> > demonstrate default caption production.
>
> {:tag="figure" .clear}
> ```

{:tag="div" .half-width .float-left}

#### Explicit Sections

{:.clear}

> These two paragraphs are inside a new section.
>
> I will probably not use it very often, since using `<section>`s properly
> within an `<article>` (which the template wraps around these documents) would
> require using very long `> blockquote` runs for most of the text.

{:tag="section"}

#### Definition Lists

Here’s a definition-list group. Lists don’t support IAL attchments, so it is
done here by using a blockquote for the `<dl>`, bolds for the `<dt>`, and
emphatics for `<dd>`. The inline elements don’t need to be different; I just
like the alternation in source text personally.

> > **Jargon**{:tag="dt"}
> > _Its lay explanation_{:tag="dd"}
> > **Jargon 2**{:tag="dt"}
> > _Explanation 2_{:tag="dd"}
>
> {:tag="dl"}

{:tag="div" .half-width .float-left}

> ```md
> > **Jargon**{:tag="dt"}
> > _Its lay explanation_{:tag="dd"}
> > **Jargon 2**{:tag="dt"}
> > _Explanation 2_{:tag="dd"}
>
> {:tag="dl"}
> ```

{:tag="div" .half-width .float-right}

#### Other Work

{:.clear}

In addition to block quotes we can have _inline_{:tag="q"} quotes. This has the
advantage of using the locale-appropriate quotation pairs rather than the plain
`U+0022 QUOTATION MARK` available on the keyboard; I don’t use it very much
because I just have the punctuation I want memorized (`U+201c` and `U+201d`).

Keyboard entry can be shown with `<kbd>` tags, like this: _ctrl_{:tag="kbd"} +
_alt_{:tag="kbd"} + _del_{:tag="kbd"}. Response _from_ the computer can be shown
in a `<samp>` tag, and I’ve written a transform for `lang-console` blocks to
become them:

```sh
tail -n1 /etc/passwd
```

```console
myrrlyn:x:1000:1000:Alexander Payne:/home/myrrlyn:/usr/bin/nu
```

This text is _highlighted_{:tag="mark"}, this text has a ~~retraction~~, and
this is its _replacement_{:tag="ins"}.

## Color Palette

> > > _black_{:tag="td"  .swatch style="background-color:var(--ansi-black);color:white;"}
> > > _red_{:tag="td"    .swatch style="background-color:var(--ansi-red);color:white;"}
> > > _orange_{:tag="td" .swatch style="background-color:var(--ansi-orange);color:black;"}
> > > _yellow_{:tag="td" .swatch style="background-color:var(--ansi-yellow);color:black;"}
> >
> > {:tag="tr"}
> >
> > > _white_{:tag="td"  .swatch style="background-color:var(--ansi-white);color:black;"}
> > > _green_{:tag="td"  .swatch style="background-color:var(--ansi-green);color:white;"}
> > > _blue_{:tag="td"   .swatch style="background-color:var(--ansi-blue);color:white;"}
> > > _purple_{:tag="td" .swatch style="background-color:var(--ansi-purple);color:white;"}
> >
> > {:tag="tr"}
>
> {:tag="tbody"}

{:tag="table"}

<style type="text/css">
.swatch {
  --size: 8em;
  height: var(--size);
  width: var(--size);
  display: inline-block;
  margin: 0.5em;
  padding: 0.5em;
  text-align: center;
  vertical-align: middle;
  border: 0.5em solid transparent;
  border-image: linear-gradient(to right, var(--bg), var(--bg) 50%, var(--text-fg) 50%, var(--text-fg)) 1;
}
</style>

[CommonMark]: //commonmark.org
[linguist-yml]: https://github.com/github-linguist/linguist/blob/main/lib/linguist/languages.yml

[^1]: Wouldn’t it be nice if these were in [CommonMark]? They aren’t!
