---
title: Hermaeus
tab_title: Hermaeus – myrrlyn
date: 2016-10-12T10:55:07-0400
summary: An explanation of my Hermaeus project.
---

[![Gem Version](https://badge.fury.io/rb/hermaeus.svg){:.unset}](https://badge.fury.io/rb/hermaeus)

- [Source Code][gh]
- [Gem Download][gem]
- [Documentation][doc]

> I have not touched this since 2016.
{:tag="aside" .bq-info .iso7010 .m006}

## Overview

`Hermaeus` is a library and script that provide an archiving functionality for
reddit posts. It is designed for [/r/teslore][tsl], but should be able to work
with any subreddit collection.

I created Hermaeus after noticing that the /r/teslore Compendium, an index of
posts considered especially worth remembering, was starting to take damage as
links went dead for various reasons. Given that the purpose of the Compendium
was to retain these posts, having it maintain references rather than absolute
copies was a problem.

## Functionality

Hermaeus can be accessed from other Ruby code, and provides an interface of
top-level methods on the `::Hermaeus` module. Hermaeus also provides a CLI tool,
`mora`, which can scrape indices at a wiki page or in normal posts.

Hermaeus configuration is stored in `$HOME/.hermaeus/config.toml`. The first
time Hermaeus is invoked on a system, through Ruby or the `mora` script, it will
create a sample configuration file and then promptly crash.

Hermaeus will continue to crash until this file is filled with values that allow
it to connect to reddit. This requires registering an application with reddit
(under preferences/apps) and copying the ID and Secret that reddit generates. If
running Hermaeus as a "script" type, which is the option that makes the most
sense, you will need to put a reddit account username and password in the file
as well. Hermaeus will log in as that user, which means that if given a
moderator account, it will be able to read posts that have been removed but not
destroyed.

At present, the only storage backend is to save the file to disk. Certain meta
attributes (original title, author, date of publishing, reddit ID) are stored
in a header section, which may interfere with some Markdown processors.

## Performance

Hermaeus does not cache the results of scraping index posts, and so each
discrete invocation must make a fresh connection and authentication, then
retrieve the index. Hermaeus is almost entirely IO-bound, as even on the teslore
wiki page with 2,000 entries, Nokogiri was able to transform and parse the HTML
in trivial time. Once Nokogiri has pared the index down to a list of reddit post
IDs, Hermaeus is able to use batch queries to pull large sections of posts in a
single network call.

At present, Hermaeus defaults to working on sets of 100 posts at a time. I have
not done much investigation into the maximum batch size reddit will accept, but
this has proven to be a very performant first guess.

### Benchmarking

Hermaeus does not have formal benchmarking embedded in its code; this is on my
to-do list.

On my server, which sits on the end of an AT&T DSL network, `mora seek index`
takes 1.97s (user), 0.16s (system), 3% CPU, 1:03.03 total time to process 1,951
links and create 1,634 reformatted files on disk. This cost 22 network calls
(one to log in, one to fetch the index, twenty batches of 100-post queries).

Hermaeus takes 3.165 seconds to process 13 links, which cost 3 network calls.
The initial handshake takes comparatively little time, and most of the time is
spent waiting on reddit to accumulate and transmit the posts.

These times are over-inflated by one second per batch query, as Hermaeus sleeps
after each bulk call to stay under the reddit rate limiter.

## Extra Features

- Hermaeus peforms HTML entity replacement on the text it fetches, so that posts
  with HTML entity references (`&rsquo;`, for instance) will have the actual
  character inserted instead. All documents are stored in UTF-8 encoding.

- Extensibility: `Hermaeus.seek` yields each post it collects, allowing easy
  connection to user-provided code for post handling. The default action in
  `mora` is to simply pass the post data to the `Hermaeus::Archivist` back-end
  and print the name and author of the post to standard output. The yielded data
  is a Ruby Hash that holds the post source Markdown, HTML as compiled by
  reddit, and metadata attributes. The `Hermaeus::Apocryphon` class wraps this
  data and provides some helper methods for it.

## Feature Requests

If you would like to use Hermaeus as an archivist script for your own projects,
I am happy to take feature requests (or if you’re a developer, pull requests). I
will continue to work on removing the teslore-specific magic from Hermaeus’
source code so that it can be a subreddit-agnostic crawler.

I do plan on making a website to allow access into the archive Hermaeus creates,
but I would be perfectly happy to yield that project to anyone who can do better
than this site.

[doc]: http://www.rubydoc.info/gems/hermaeus
[gem]: https://rubygems.org/gems/hermaeus
[gh]: https://github.com/myrrlyn/hermaeus
[tsl]: https://reddit.com/r/teslore
