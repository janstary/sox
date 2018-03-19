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

These are the forks that I could find:

* [Chris Bagwell](https://github.com/cbagwell/sox):
  abandoned shortly after 14.4.2
* [Ulrich Klauer](https://github.com/chirlu/sox/commits/master):
  inactive since 2013
* [Eric Wong](https://80x24.org/sox.git/):
  active till [2015](https://80x24.org/sox.git/log/),
  keeps further fixes in [branches](https://80x24.org/sox.git/refs/heads)
* [Mans Rullgard](https://github.com/mansr/sox): the most active nowadays

This is another fork of https://github.com/cbagwell/sox
which spawned the last oficial release.

## Goals

The main intent is to _simplify_ the codebase and the build system,
and to bring SoX to a next bugfix release.
These are the main changes made so far:

* removed all Windows support (MSVC, cygwin, all the `#ifdef`s, ...).
* removed Debian specific files: no system treated extra
* removed CMake support: build using plain old make
* removed `./libgsm`: GSM is an optional format like any other
* removed `./liblpc10`; extracted into https://github.com/janstary/lpc10

TODO:

* Get rid of the GNU autotools.
* Go thorugh the CVEs since 14.4.2.
  A lot of those have been foxed in other forks
* Go through the SourceForge
  [tickets](https://sourceforge.net/p/sox/_list/tickets),
  see what is still relevant

Long-time goals:

* Keep SoX running on OpenBSD, FreeBSD, NetBSD, MacOS, Solaris.
* Go through the other forks and cherry pick new developments.
* Document `libsox`.

