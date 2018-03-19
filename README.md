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
* Rewrite `sox.1` and `soxi.1` to mdoc(7).
* Document `libsox`.

## Installation

SoX should compile and run on any POSIX compatible system.
For other systems, it is often possible to manually construct
a custom `soxconfig.h` and `Makefile` . The minimum requirements
are 32-bit CPU, 64-bit FPU, C89 compiler.

### dependencies

SoX optionally makes use of some external libraries to obtain support
for additional file formats and/or effects.  Optional libraries should
be installed before compiling SoX; some of them may require pkg-config
to be installed to be detected by SoX. These are the supported libraries
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

If you are compiling from a git source,
you need to recreate the configuration tools first
(until we get rid of the GNU autotools). To do that, run
`autoreconf -iv`. This will in turn run `aclocal`,
`autoconf` (creating `./configure` from `configure.ac`) and
`automake` (creating `Makefile.in` form `Makefile.am`).

On systems where the GNU autotools are not the norm (such as OpenBSD)
you will need to install them first using the system's packages,
and run the above comand prepended with something like

```
env AUTOCONF_VERSION=2.69 AUTOMAKE_VERSION=1.15 autoreconf -iv
```

(As stated above, one of the goals is to get rid of autotools.)

Once the `./configure` script and the `Makefile.in` files have been
created as above, or when building from a released tarball which
already includes them, run `./configure --help`. Read the options
specifying which additional formats or audio drivers you want.
Run `./configure` with the appropriate options and read the
report at the end of its run to see how well the autodetection went.
You might need to give `./configure` a hint by appending
`CPPFLAGS` and `LDFLAGS` as argument, as in e.g.

```
./configure --prefix=$HOME --mandir=$HOME/man \
	--with-mad --with-id3tag --with-lame --with-twolame --with-mp3
	--with-oggvorbis --with-opus --with-flac --with-wavpack --with-sndfile \
	--without-amrwb --without-amrnb --with-sndio --without-coreaudio \
	--without-alsa --without-ao --without-pulseaudio --without-oss \
	--without-sunaudio --without-ladspa \
 	CPPFLAGS=-I/usr/local/include LDFLAGS=-L/usr/local/lib
```

Tweak the above as appropriate to point where your additional
headers and libraries are located. On e.g. MacOS, that might be
`/opt/local/` if you are using MacPorts.

Also note that the GNU autotools will preffer `gcc` as a compiler over `cc`.
If your systems `/usr/bin/cc` is a link to e.g. clang, you will still be
using `/usr/bin/gcc`. In that case, also add `CC=...`


# dynamic loading

Each optional file-format may be configured to be loaded statically
(the default) or dynamically.  The dynamic option may be useful for
distribution packaging reasons -- for example, to keep separate `free'
and `non-free' software.

Newer versions of SoX include support for loading libraries for
file formats at runtime.  The main usage of this feature is to
allow shipping SoX without dependencies on external libraries
that are not globally used or have redistribution restrictions.
If you experience problems with this then you may wish to disable
this feature:

./configure --without-libltdl

Also, the default behavior even when libltdl is used is to link
all file format handlers into libsox as there is a performance
hit when dynamically loading external libraries.  To force a format
handler to be built as a dynamically loaded module, pass "dyn" to
its `--with`, e.g. `./configure --with-pulseaudio=dyn`

A subset of external libraries can be configured to be
`dlopen()`ed at run time instead of being linked in.
This will allow one to distribute a binary with optional features
that only require a user to install the missing libraries
into their system.  This can be enabled using:

```
--enable-dl-lame
--enable-dl-mad
--enable-dl-sndfile
--enable-dl-amrnb
--enable-dl-amrwb
```

### build

Once the source is configured as above, run `make` to build SoX.

### install

Install the binaries, the library and the manpages with `make install`.
Depending where you set `--prefix` (which is `/usr/local` by default),
you might need to `sudo make install` or `doas make install`.

Note that `play`, `rec`, and `soxi` are links to `sox`
(or copies of `sox`, depending on the OS).

### test

After successfully installing SoX, try translating a sound file.
You should also playback the new file to make sure it sounds
like the original.

Choose a format that is native to your OS, such as WAV or AIFF.
In the following example, we'll use .xxx as the extension
of your preferred format.

```
$ sox -V src/file.wav /tmp/file.xxx
$ play src/file.wav
$ play /tmp/file.xxx
```

The example `file.wav` is a five second sine wave.
If it plays properly, congratulations - SoX works.
