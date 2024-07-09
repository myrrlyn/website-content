---
title: My Workbench
summary: A tour of what tools I use, inspired by <uses.tech>.
---

I think the [`uses.tech`] concept of sharing what tools and processes we use in
ordinary life is cool, so here’s mine.

There are a _lot_ of links on this page. None of them are affiliate links; I do
not have any kind of relationship with any companies discussed here other than
having bought from them.

## Password Manager

I’m going to lead with what I believe is the most important one. If you’re
reading this, you’re online, and if you’re online, you need a good, trustworthy,
convenient program to manage your passwords because your human brain is not
sufficient for the task.

I don’t care if you use the one I’m about to personally endorse, but you do need
one. I personally use [1Password], but I have used [Enpass] and [BitWarden] in
the past and they are also good. The major reason I’m on 1Password is that it
has a family plan that I can use to (a) share credentials with other people on
it and (b) use that as leverage to make my mom use it. Enpass is single-purchase
and allows you to control your own synchronization, which are good features
1Password doesn’t have, and you can compare and contrast them to your heart’s
content, as long as you pick one.

### Features

All three are cross-platform, and I’ve been able to use them across the spectrum
of my devices: Windows, macOS, and Linux (graphical), as well as iOS and Android
phones.

Both Enpass and 1Password provide the following features that make them worth
using:

- multiple Vaults allow you to organize data into independent, fully separate,
  groups that you can control separately. For example, I have a vault of just my
  own credentials vs a vault of shared family credentials.
- automatic breach detection: they will alert you if one of your credentials has
  been found to be in a service breach
- browser plugins: when you go to a website, they can autofill your existing
  credentials, or automatically store new ones, and most importantly: when you
  are on the “change your password” form, they can detect it and automatically
  fill in your old password, generate a new one, submit, and save it on success,
  with one click.
- generation rules: websites (like banks) can impose their own rules about
  password length or contents. The password generator form has toggles for
  whether, and how many, uppercase, lowercase, numbers, and symbols to put in
  the generated password.
- sort by age: you should generally rotate passwords bienially, or better
  yearly, even for credentials that aren’t breached. You should probably, but
  not many people do (even I don’t) rotate crucial passwords like banking,
  email, and social media more than once a year. These tell you how old your
  credentials are and you can set expiry alarms to remind you to rotate them.
- phone keyboards: on both iPhone and Android, both Enpass and 1Password
  register keyboards with the operating system. When you navigate to a
  credential form in an application or a browser, you can select your password
  manager’s keyboard and it will determine which credentials you need and then
  write them into the form for you. This is _incredibly_ convenient and I really
  love it.
- 2FA/TOTP storage: you can store your 2FA seeds in the vault rather than in a
  completely separate app. When Enpass submits a password, it also automatically
  copies the current 2FA code into the system clipboard so that when the form
  advances, you can hit paste and immediately proceed. It can also detect 2FA
  forms and fill them just like it can with a password, but this automatic
  one-two behavior is very nice.
- synchronization: Enpass doesn’t operate a synchronization service; 1Password
  syncs vaults through their website. They state that vault files are always
  encrypted by both a password they give you AND a password you use that they
  never see, so I trust them to transport my data. Your credentials are in an
  ordinary file on your computer or phone, and that file is encrypted by a
  master password that you need to remember and also store in, say, your safe or
  a bank deposit box. Enpass offers hooks to synchronize this file through
  services like DropBox, Google Drive, Microsoft OneDrive, or other. When you do
  so, it is just another opaque file. Those hosts can’t see inside it.

BitWarden allows you to run your own management server on a computer you own,
and have no interaction with the developers besides installing updates. I tried
this out, because I’m a huge dork. You shouldn’t bother with this.

If you don’t have a password manager, I strongly recommend one. Mom, this means
you.

On to the rest of the page.

## Computers

My longest surviving computer is a 2014 MacBook Pro (13”). My mom got it for me
when I switched majors and it’s been with me ever since. It’s now a Plex server
awaiting final retirement.

> I’m fortunate and incredibly grateful to Apple’s engineers for creating a
> mainboard that can survive accidentally connecting 24 volts DC to the USB
> socket and short-circuiting it and only destroying that USB port, not the rest
> of the computer.

{:tag="aside" .block-warn .iso7010 .w012}

I built my first PC in 2013 (deceased 2017) and my second in 2015 (limping along
as of 2023). I intend to rebuild both of them once I have the spare time and
money, and the GPU shortage subsides.

They ran [Arch Linux] as the primary operating system; in 2019, I reverted back
to Windows as the primary and ran the Arch system as a HyperV guest so that I
could resume doing Windows-only things like playing video games nicely.
Maintaining an Arch desktop in working condition for six years was actually
fairly easy, other than the initial learning wall and some sporadic hardware
failures. I enjoyed it a lot.

My primary computer is now a 2022 MacBook Pro M2. The processor is _insanely_
good. I can compile Erlang or LLVM without turning on the fans.

## Phones

I started on a Nokia Lumia 920, then 1020. I maintain that those phones, and the
Windows Phone platform, are the pinnacle of human achivement in mobile computing
and I miss them deeply every single day.

I used Androids for a while but had generally poor experiences with them, and
they generally lasted about eight to nine months before a hardware failure
required replacement. The last and most egregious failure came when my Moto Z
would fail to detect an internal battery when transitioning from a 70℉ building
to a 10℉ Utah winter and simply shut down until it was plugged into a wall.

I gave up and bought an iPhone X, which I used (and harshly) from late 2017 to
mid 2020. It still works, but I got an iPhone 11 Pro which I am using now.

KDE Plasma offers integration with Android phones which I quite liked, but the
macOS-to-iOS integration is also very good. Between the conjoined software and
the fact that, observably, Apple hardware is just better able to survive
existing with me than anyone else, I don’t anticipate migrating back without a
significant cause.

## Keyboard

I use a [ZSA Moonlander] split keyboard, programmed to the [Dvorak] layout. I
aspire to ensure that any computer I touch is absolutely unusable by anyone
else, and incidentally sometimes unusable by me.

I also have some [WASD] mechanical keyboards, also in Dvorak.

## Software

I use [Mozilla Firefox] as my browser, [Microsoft Office] for what you’d expect,
and [Visual Studio Code] as my general editor. My shell is [zsh], my prompt is
[Starship], and my terminals are [Alacritty] or [iTerm 2]. I use [SourceTree] as
my graphical Git client.

VSCode’s ability to split into a client/server connection and run on remote
servers, inside local containers, or across hypervisors makes it an invaluable
single-service environment for anything I’m doing. I make it a point to
conscientiously object to ever learning Vim or Emacs.

I serve media with [Plex] (happy to share with you if you’d like), and
synchronize my files across devices with [SyncThing] (works on Linux, not very
well on iOS) and [Dropbox] (natively works on iOS, ended their Linux support).

I write fancy documents such as my résumé with [Typst].

### Fonts

I typically use [Roboto] for my prose fonts. Assuming this page rendered
correctly, that’s what you’re seeing right now! The section headings are in
[Ferro Rosso]. I use [Cascadia Code] and [Iosevka] as my `monospace` fonts.

### Programming Languages

I am most fluent in [Rust], and use it in both my home and work life. I’ve been
actively writing in it since 2016. I write C++ and C at work, and very rarely
for … not _fun_, but personal use.

This website uses [Elixir] as the rendering server, [Sass] for the styling, and
[TypeScript] for client logic.

I also speak Ruby and Python. I don’t use them very much.

### Web Presence

I currently use [DNSimple] for my domain names and [fly.io] for my web-facing
servers. My email is managed by [Fastmail]. I’ve used [DigitalOcean] in the past
for rented servers that I can actively drive; Fly only accepts static
containers.

[1Password]: https://1password.com/
[Alacritty]: https://alacritty.org/
[Arch Linux]: https://archlinux.org/
[BitWarden]: https://bitwarden.com/
[Cascadia Code]: https://github.com/Microsoft/Cascadia-Code
[DigitalOcean]: https://digitalocean.com/
[DNSimple]: https://dnsimple.com/
[Dropbox]: https://dropbox.com/
[Dvorak]: https://en.wikipedia.org/wiki/Dvorak_keyboard_layout
[Elixir]: https://elixir-lang.org/
[Enpass]: https://enpass.io
[Fastmail]: https://fastmail.com
[Ferro Rosso]: https://www.dafont.com/ferro-rosso.font
[Iosevka]: https://typeof.net/Iosevka
[Microsoft Office]: https://office.microsoft.com/
[Mozilla Firefox]: https://firefox.com/
[Plex]: https://plex.tv/
[Roboto]: https://fonts.google.com/specimen/Roboto
[Rust]: https://rust-lang.org/
[Sass]: https://sass-lang.org/
[SourceTree]: https://sourcetreeapp.com/
[Starship]: https://starship.rs/
[SyncThing]: https://syncthing.net/
[TypeScript]: https://typescriptlang.org/
[Typst]: https://typst.app/
[Visual Studio Code]: https://code.visualstudio.com/
[WASD]: https://www.wasdkeyboards.com/
[ZSA Moonlander]: https://zsa.io/moonlander
[fly.io]: https://fly.io/
[iTerm 2]: https://iterm2.com/
[zsh]: https://zsh.org/
[`uses.tech`]: https://uses.tech/
