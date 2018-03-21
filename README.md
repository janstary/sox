# This is a fork of SoX

The last release of SoX is 14.4.2 from February 2015.
The [SoX repo on SourceForge](https://sourceforge.net/projects/sox/)
has seen its last commit about a week after the release.

Since then, it is mostly abandoned.
None of the listed maintainers responds.
The SourceForge project mostly provides the
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
  keeps a few fixes in [branches](https://80x24.org/sox.git/refs/heads)
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
* removed the bundled `./libgsm`: use an external library
* removed the bundled `./liblpc10`: use an external
	[library](https://github.com/janstary/lpc10)
* removed GNU autotools: see below for configuration

TODO:

* Go through the [CVEs](http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=sox)
  since 14.4.2. A lot of those have already been fixed in other forks.
* Go through the SourceForge
  [tickets](https://sourceforge.net/p/sox/_list/tickets),
  see what is still relevant

Long-time goals:

* Keep SoX running on OpenBSD, FreeBSD, NetBSD, MacOS, Debian, Solaris.
* Go through the other forks and cherry-pick new developments.
* Rewrite `sox.1` and `soxi.1` to mdoc(7).
* Document `libsox`.

## Installation

SoX should compile and run on any POSIX compatible system.
It is also possible that your OS already provides a prebuilt package of SoX.
Please note that this version of SoX differs
from the last official release (14.4.2).

### dependencies

SoX optionally makes use of some external libraries to obtain support
for additional file formats and/or effects.  Optional libraries should
be installed before compiling SoX. These are the supported libraries
and where to get them, if your OS does not provide them:

* [amr](http://sourceforge.net/projects/opencore-amr)
* [ao](http://xiph.org/ao)
* [flac](http://flac.sourceforge.net)
* [ladspa](http://www.ladspa.org)
* [lame](http://lame.sourceforge.net)
* [libltdl](http://www.gnu.org/software/libtool)
* [mad decoder](http://www.underbit.com/products/mad)
* [mp3 tags](http://www.underbit.com/products/mad)
* [magic](http://www.darwinsys.com/file)
* [ogg vorbis](http://www.vorbis.com)
* [opus](http://www.opus-codec.org/)
* [png](http://www.libpng.org/pub/png)
* [sndfile](http://www.mega-nerd.com/libsndfile)
* [twolame](http://www.twolame.org)
* [wavpack](http://www.wavpack.com)


### configure

Run `./configure` to configure the build for your system.
This will produce four files:

* `config.h` which `#define`s various `HAVE_` constants
* `config.log` which logs details of the autodetection
* `Makefile.local` which defines `CC`, `PREFIX` and the like
* `Makefile.external` which describes the detected libraries

Read the standard output and `Makefile.local`.
If these look different from what you expected,
read `configure.local.example`, create `configure.local`,
and run `./configure` again.

The build system not use GNU autoconf. All modern operating systems
are now reasonably close to POSIX and do not need arcane shell magic
any longer. If your system does need such magic, consider upgrading
to reasonably modern POSIX-compliant tools rather than asking for
autoconf-style workarounds.

The `./configure` script is
accompanied by a set of simple programs autodetecting the availability of

* system functions (e.g. [`have-strtonum.c`](have-strtonum.c))
* optional external libraries (e.g. [`have-sndfile.c`](have-sndfile.c))
* audio output drivers (e.g. [`have-sndio.c`](have-sndio.c))

For C functions possibly not present in the system,
we provide autoconfiguration tests and `compat_*.c` implementations.
Please report any that turn out to be missing.
Read `config.log`, which shows shows the compiler commands used
to test the libraries installed on your system and the standard
output and standard error output these commands produce.
Failues are most likely to happen if headers or libraries
are installed in unusual places or interfaces defined
in unusual headers. You can also look at `config.h` and
check that the `#define HAVE_*` lines match your expectations.

### build

Once the source is configured as above, run `make` to build SoX.
Any POSIX-compatible make, in particular both BSD make and GNU make,
should work. If the build fails, read `configure.local.example` again.

### install

Run `make -n install` and check where everything will go.
If that differs from your expectations, set the `*DIR` variables
in `configure.local` and go back to running `./configure`.

Install the binaries, the library and the manpages with `make install`.
Depending on the `PREFIX` (which is `/usr/local` by default),
you might need to `sudo make install` or `doas make install`.

Note that `play`, `rec` and `soxi` are links to `sox`,
and `play.1`, `rec.1` and `soxi.1` are links to `sox.1`.

### test

After successfully installing SoX, try translating a sound file.
You should also playback the new file to make sure it sounds
like the original.

Choose a format that is native to your OS, such as WAV or AIFF.
In the following example, we'll use .xxx as the extension.

```
$ sox -V file.wav file.xxx
$ play file.wav
$ play file.xxx
```

The example `file.wav` is a five second sine wave.
If it plays properly, congratulations - SoX works.
