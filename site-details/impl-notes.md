---
page_title: Implementation Notes
title: How It Works
summary: A short overview of how pages on this site are constructed.
---

## View Structure

Unless forcibly overridden, every page on this site is in a frame consisting of
a banner image (usually a landscape I thought was pretty), an informational bar
(to the left on large screens, or after the main content on small), and the main
content itself. The infobar contains a navigation tree for all the pages in the
site, a table of contents for the current page, and maybe some extra information
about the document currently being shown.

The layout is a double CSS flexbox: The header has a height dictated by the image
being presented, and an invisible container fills the rest of the vertical height
in your screen. The main content and the infobar are placed inside this
invisible container, and can scroll independently of each other.

Right now, this is just an HTML template that the server wraps around the main
content before sending it all out as a static HTML page. I hope to eventually
figure out how to make it so that moving between pages only updates the content
panel, and doesn’t ship the frame HTML anymore. I know it can be done very
easily, but it’s a low priority, and the frame HTML is much smaller than the
main content.

## Navigation

The site is divided into three primary sections, reflected in the three top
entries of the site-map tree. I maintain a blog of diary entries, technical
notes, or other essays and a collection of _Elder Scrolls_ writings, which are
set aside; everything else is bundled under the main site.

The navigation tree is lifted directly from the filesystem layout of the source
documents, with two exceptions: I store the blog and oeuvre as subdirectories
under the main-content collection, but manually lift them out of the tree, and I
store blog articles as `{date}-{slug}.md` rather than `{slug.md}`, but I strip
the date from the URL.

If a directory has an `index.md` file, then it is shown when viewing that
directory’s URL; if it doesn’t, then the directory URL does not resolve. For
example, `crates/index.md` is shown at `/crates`, but `site-details/` doesn’t
have an `index.md`, so `/site-details` is an error page even though this page
beneath it resolves correctly.

The navigation tree uses HTML `<details>`, `<summary>`, and `<ul>` to create the
folding effects natively in the browser. I gave up on using JavaScript to drive
accordion drawers a long time ago; similarly, the hands pointing at each folder
and the current page are done with CSS informed by navigation attributes in the
tree.

## Page Content

Most of the content served here is in a [Markdown] dialect. Since Markdown
itself has very few semantic-HTML elements, I use a parsing library which has an
extension allowing me to attach arbitrary attributes to a Markdown structure,
and I use some of those attributes to do HTML transformation. The main instances
of this are `{:tag="aside" .block-something}`: I capture the `tag=` and use it
to rewrite the HTML node, and the various `.block-*` CSS classes create the
different-colored interjection boxes.

## Style

The stylesheet is written in [Sass]. I use a handful of media queries to discern
viewport size (which governs how the main blocks are laid out) and color
preference.

[Markdown]: //commonmark.org
[Sass]: //sass-lang.org
