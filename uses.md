---
title: My Workbench
summary:  A tour of what tools I use, inspired by <uses.tech>.
---

I think the [`uses.tech`] concept of sharing what tools and processes we use in
ordinary life is cool, so here’s mine.

## Password Manager

I’m going to lead with what I believe is the most important one. If you’re
reading this, you’re online, and if you’re online, you need a good, trustworthy,
convenient program to manage your passwords because your human brain is not
sufficient for the task.

I don’t care if you use the one I’m about to personally endorse, but you do need
one. I personally use [Enpass], but I have used [1Password] in the past and it
is also good. One of the reasons I switched is that Enpass has a single-purchase
price, while 1Password is now subscription-only, and I personally prefer point
rather than ongoing sales.

Crucially, you must *not* use a password manager that does not grant you
explicit and sole control of your password archive files. Services like LastPass
that store your passwords on their servers get breached and cause *more* harm
than not having used one in the first place.

### Features

I use Enpass on my laptop (macOS), my desktop (Windows), my server (Linux), and
my phone (now iPhone, previously Android and Windows Phone). Enpass is the only
product I’ve seen that has a native application for *all of them*.

> 2021: 1Password now has a Linux desktop application in beta.
{:.bq-info role="complementary"}

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
  write them into the form for you. This is *incredibly* convenient and I really
  love it.
- 2FA/TOTP storage: you can store your 2FA seeds in the vault rather than in a
  completely separate app. When Enpass submits a password, it also automatically
  copies the current 2FA code into the system clipboard so that when the form
  advances, you can hit paste and immediately proceed. It can also detect 2FA
  forms and fill them just like it can with a password, but this automatic
  one-two behavior is very nice.
- synchronization: neither of these operates a synchronization service. Your
  credentials are in an ordinary file on your computer or phone, and that file
  is encrypted by a master password that you need to remember and also store in,
  say, your safe or a bank deposit box. Enpass offers hooks to synchronize this
  file through services like DropBox, Google Drive, Microsoft OneDrive, or
  other. When you do so, it is just another opaque file. Those hosts can’t see
  inside it.

If you don’t have a password manager, I strongly recommend one. Mom, this means
you.

On to the rest of the page.

## Computers

My longest surviving computer is a 2014 MacBook Pro (13”). My mom got it for me
when I switched majors and it’s been with me ever since. I mostly use it as a
web browser and a thin terminal connected to a more capable Linux server.

> I’m fortunate and incredibly grateful to Apple’s engineers for creating a
> mainboard that can survive accidentally connecting 24 volts DC to the USB
> socket and short-circuiting it and only destroying that USB port, not the rest
> of the computer.
{:.bq-warn .iso7010 .w012 role="complementary"}

I built my first PC in 2013 (deceased 2017) and my second in 2015 (deceased
2021). I intend to rebuild both of them once I have the spare time and money,
and the GPU shortage subsides.

They ran [Arch Linux] as the primary operating system; in 2019, I reverted back
to Windows as the primary and ran the Arch system as a HyperV guest so that I
could resume doing Windows-only things like playing video games nicely.
Maintaining an Arch desktop in working condition for six years was actually
fairly easy, other than the initial learning wall and some sporadic hardware
failures. I enjoyed it a lot.

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
mid 2020. It still works, but I got an iPhone 11 which I am using now.

KDE Plasma offers integration with Android phones which I quite liked, but the
macOS-to-iOS integration is also very good. Between the conjoined software and
the fact that, observably, Apple hardware is just better able to survive
existing with me than anyone else, I don’t anticipate migrating back without a
significant cause.

## Keyboard

I use [WASD] mechanical keyboards printed in the [Dvorak] layout. Now I’m
insufferable in two dimensions.

## Software

I use [Mozilla Firefox] as my browser, [Microsoft Office] for what you’d expect,
and [Visual Studio Code] as my general editor.

VSCode’s ability to split into a client/server connection and run on remote
servers, inside local containers, or across hypervisors makes it an invaluable
single-service environment for anything I’m doing. This ability is basically the
primary reason I don’t feel an urgent need to repair my desktop, since while my
laptop is still seven years old and not in shape to be doing thermally intensive
work, it is perfectly able to be a thin client to a rented machine elsewhere.

### Fonts

I am a huge fan of the [Cascadia Code] and [Roboto] fonts. I also use [Iosevka]
as my primary monospace font.

### Programming Languages

I am most fluent in Rust, and use it in both my personal and professional life.
I’ve been actively writing in it since 2016. I also am capable in Ruby, Python,
C, C++, and JavaScript, though I generally don’t use them unless required.

### Web Presence

I currently use [DNSimple] for my domain names and [fly.io] for my web-facing
servers.

[1Password]: https://1password.com/
[Arch Linux]: https://archlinux.org/
[Cascadia Code]: https://github.com/Microsoft/Cascadia-Code
[DNSimple]: https://dnsimple.com/
[Dvorak]: https://en.wikipedia.org/wiki/Dvorak_keyboard_layout
[Enpass]: https://enpass.io
[Iosevka]: https://typeof.net/Iosevka
[Microsoft Office]: https://office.microsoft.com/
[Mozilla Firefox]: https://firefox.com/
[Roboto]: https://fonts.google.com/specimen/Roboto
[Visual Studio Code]: https://code.visualstudio.com/
[WASD]: https://www.wasdkeyboards.com/
[fly.io]: https://fly.io/
[`uses.tech`]: https://uses.tech/
