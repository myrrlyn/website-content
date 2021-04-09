# My Website Content

This repository holds the actual source text of all the articles on my website.
It allows me to maintain a consistent directory and metadata structure so that I
can spin up different site servers without rebuilding the content each time.

## Document Structure

The documents are written in nearly GitHub Flavored Markdown. I additionally use
three extensions to the format: YAML frontmatter, [Kramdown IAL], and embedded
LaTeX. While my site servers may apply additional transforms to the Markdown
text based on the YAML contents or my own goals, the source documents will
always be *reasonably* presentable when given to a GFM-capable engine.

The YAML schema is as follows:

```yaml
title: String, required. Used for `<title>` and `<h1 id="title">`.
subtitle: String, optional.
summary: String, required. Used for `<meta name="description">`
date: RFC3339 date-only or date-time-zone fragment, optional.
tags: optional
  - zero
  - or more
  - Strings
toc: bool, optional, default true. Controls Table of Contents generation.
meta: optional, defines other `<meta>` elements
  - name: String, required
    content: String, required
```

Oeuvre posts may additionally use this schema:

```yaml
about: String, optional. Context for the reader. Not used in `<meta>`.
intro-music: Generates an `<audio>` at the start of a post.
  src: String, required. URL to a music file
  title: String, required. Name of the file, if the client cannot play it
  repeat: bool, optional. Controls whether the music loops
outro-music: Generates an `<audio>` at the end of a post. Same as `intro-music`
reddit: b36 post identifier (`old.redd.it/<slug>`) where the post was shared.
```

Most Markdown libraries do not process `<audio>` inline HTML gracefully, and
there is no Markdown element for it. The audio elements that my rendering engine
produces can be relocated to `<div id="{intro,outro}"></div>` marker elements in
the source text.

[Kramdown IAL]: https://kramdown.gettalong.org/syntax.html#inline-attribute-lists "Kramdown inline attribute lists"
