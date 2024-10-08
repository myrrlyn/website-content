# My Website Content

This repository holds the actual source text of all the articles on my website.
It allows me to maintain a consistent directory and metadata structure so that I
can spin up different site servers without rebuilding the content each time.

## Document Structure

The documents are written in nearly GitHub Flavored Markdown. I additionally use
three extensions to the format: YAML frontmatter, [Kramdown IAL], and embedded
LaTeX. While my site servers may apply additional transforms to the Markdown
text based on the YAML contents or my own goals, the source documents will
strive to be _reasonably_ presentable when given to a GFM-capable engine.

Some document classes may prefer not to include explicit title `h1` elements,
and will instead rely on the template to render the `title` and `subtitle`
metadata in the article.

## Metadata

I use YAML frontmatter in Markdown, and `<meta name="wyz-*" />` attributes in
HTML, to carry document metadata in-band. It is processed in the `Metadata`
module in the web app.

[kramdown ial]: https://kramdown.gettalong.org/syntax.html#inline-attribute-lists "Kramdown inline attribute lists"
