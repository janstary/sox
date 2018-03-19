# This is a fork of SoX

The last release of SoX is 14.4.2 from February 2015.
The [SoX repo on SourceForge](https://sourceforge.net/projects/sox/)
has seen its last commit about a week after the release.

Since then, it is mostly abandoned.
None of the listed maintainers responds.
The SourcoForge project mostly provides the
[mailing list](https://sourceforge.net/p/sox/mailman/?source=navbar),
which is still active, and holds the
[tickets](https://sourceforge.net/p/sox/_list/tickets),
some of which have been rotting there for more than a decade.

A git repository exists on [github](https://github.com/cbagwell/sox),
abandoned at about the same time. People have forked it; as of this
writing, the most active reincarnation seems to be
[mansr/sox](https://github.com/mansr/sox).

This is another fork of the original
[cbagwell/sox](https://github.com/cbagwell/sox).

## Goals

The main intent is to _simplify_ the codebase and the build system,
and to bring SoX to a next bugfix release.
These are the main changes made so far:

* removed `./libgsm`: GSM is an optional format like any other
* removed all Windows support (MSVC, cygwin, all the `#ifdef`s, ...).
* removed Debian specific files: no system treated extra
* removed CMake support: build using plain old make

Long-time goals:

* Keep SoX running on OpenBSD, FreeBSD, NetBSD, MacOS, Solaris.
* Get rid of the GNU autotools.

At the same time,

* Cherry-pick new developments from other forks.
* Document `libsox`.

