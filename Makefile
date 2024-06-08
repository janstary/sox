# Copyright (c) 2010, 2011, 2012 Kristaps Dzonsons <kristaps@bsd.lv>
# Copyright (c) 2011, 2013-2021 Ingo Schwarze <schwarze@openbsd.org>
# Copyright (c) 2024 Jan Starý <hans@stare.cz>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

PROG	= sox
MAN1	= sox.1 soxi.1
MAN7	= soxformat.7

SOXOBJS	= getopt.o libsox.o sox.o util.o xmalloc.o

FMTOBJS	= \
	8svx.o \
	adpcm.o \
	adpcms.o \
	aifc-fmt.o \
	aiff-fmt.o \
	aiff.o \
	al-fmt.o \
	au.o \
	avr.o \
	cdr.o \
	cvsd-fmt.o \
	cvsd.o \
	dat.o \
	dvms-fmt.o \
	f4-fmt.o \
	f8-fmt.o \
	formats.o \
	formats_i.o \
	g711.o \
	g721.o \
	g723_24.o \
	g723_40.o \
	g72x.o \
	gsrt.o \
	hcom.o \
	htk.o \
	ima-fmt.o \
	ima_rw.o \
	la-fmt.o \
	lu-fmt.o \
	maud.o \
	nulfile.o \
	prc.o \
	raw-fmt.o \
	raw.o \
	s1-fmt.o \
	s2-fmt.o \
	s3-fmt.o \
	s4-fmt.o \
	sf.o \
	skelform.o \
	smp.o \
	sounder.o \
	soundtool.o \
	sox-fmt.o \
	sphere.o \
	tx16w.o \
	u1-fmt.o \
	u2-fmt.o \
	u3-fmt.o \
	u4-fmt.o \
	ul-fmt.o \
	voc.o \
	vox-fmt.o \
	vox.o \
	wav.o \
	wve.o \
	xa.o \

EFFOBJS	= \
	bend.o \
	biquad.o \
	biquads.o \
	chorus.o \
	compand.o \
	compandt.o \
	contrast.o \
	dcshift.o \
	delay.o \
	divide.o \
	dft_filter.o \
	dither.o \
	downsample.o \
	earwax.o \
	echo.o \
	echos.o \
	effects.o \
	effects_i.o \
	effects_i_dsp.o \
	fade.o \
	fft4g.o \
	fir.o \
	firfit.o \
	flanger.o \
	gain.o \
	hilbert.o \
	input.o \
	loudness.o \
	mcompand.o \
	noiseprof.o \
	noisered.o \
	output.o \
	overdrive.o \
	pad.o \
	phaser.o \
	rate.o \
	remix.o \
	repeat.o \
	reverb.o \
	reverse.o \
	silence.o \
	sinc.o \
	skeleff.o \
	speed.o \
	splice.o \
	stat.o \
	stats.o \
	stretch.o \
	swap.o \
	synth.o \
	tempo.o \
	tremolo.o \
	trim.o \
	upsample.o \
	vad.o \
	vol.o

# user configuration created by ./configure

include Makefile.local

# dependencies

OBJS	= $(SOXOBJS) $(FMTOBJS) $(EFFOBJS) $(ADDOBJS) $(DEVOBJS)
LIBS	= $(ADDLIBS) $(DEVLIBS)

all: $(PROG) $(MAN1) $(MAN7) Makefile.local

sox: $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o sox $(OBJS) $(LIBS)

include Makefile.depend

.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $<

test: all
	./$(PROG) -r 8k -b 16 -c 1 -n file.wav synth 2 sin 440 gain -3
	./$(PROG) file.wav file.aiff
	./$(PROG) file.wav file.au

install: all
	install -d $(BINDIR)      && install -m 0755 $(PROG) $(BINDIR)
	install -d $(MANDIR)/man1 && install -m 0644 $(MAN1) $(MANDIR)/man1
	install -d $(MANDIR)/man7 && install -m 0644 $(MAN7) $(MANDIR)/man7
	( cd $(BINDIR) && $(LN) sox soxi && $(LN) sox play && $(LN) sox rec )

uninstall:
	( cd $(BINDIR) && rm -f $(PROG) soxi play rec )
	( cd $(MANDIR)/man1/ && rm -f $(MAN1) )
	( cd $(MANDIR)/man7/ && rm -f $(MAN7) )

clean:
	rm -rf $(PROG) $(OBJS) *.o soxi play rec *~ *.core *.dSYM

distclean: clean
	rm -f Makefile.local config.*

Makefile.local config.h: configure
	@echo "$@ is out of date; please run ./configure"
	@exit 1
