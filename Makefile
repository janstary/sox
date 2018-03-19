VERSION	= 14.4.3

include Makefile.local

SRCS =	8svx.c		\
	adpcm.c		\
	adpcms.c	\
	aifc-fmt.c	\
	aiff-fmt.c	\
	aiff.c	\
	al-fmt.c	\
	alsa.c	\
	amr-nb.c	\
	amr-wb.c	\
	ao.c	\
	au.c	\
	avr.c	\
	bend.c	\
	biquad.c	\
	biquads.c	\
	caf.c	\
	cdr.c	\
	chorus.c	\
	compand.c	\
	compandt.c	\
	contrast.c	\
	coreaudio.c	\
	cvsd-fmt.c	\
	cvsd.c	\
	dat.c	\
	dcshift.c	\
	delay.c	\
	dft_filter.c	\
	dither.c	\
	divide.c	\
	downsample.c	\
	dvms-fmt.c	\
	earwax.c	\
	echo.c	\
	echos.c	\
	effects.c	\
	effects_i.c	\
	effects_i_dsp.c	\
	f4-fmt.c	\
	f8-fmt.c	\
	fade.c	\
	fap.c	\
	fft4g.c	\
	fir.c	\
	firfit.c	\
	flac.c	\
	flanger.c	\
	formats.c	\
	formats_i.c	\
	g711.c	\
	g721.c	\
	g723_24.c	\
	g723_40.c	\
	g72x.c	\
	gain.c	\
	getopt.c	\
	gsm.c	\
	gsrt.c	\
	hcom.c	\
	hilbert.c	\
	htk.c	\
	ima-fmt.c	\
	ima_rw.c	\
	input.c	\
	la-fmt.c	\
	ladspa.c	\
	libsox.c	\
	libsox_i.c	\
	loudness.c	\
	lpc10.c	\
	lu-fmt.c	\
	mat4.c	\
	mat5.c	\
	maud.c	\
	mcompand.c	\
	mp3.c	\
	noiseprof.c	\
	noisered.c	\
	nulfile.c	\
	opus.c	\
	oss.c	\
	output.c	\
	overdrive.c	\
	pad.c	\
	paf.c	\
	phaser.c	\
	prc.c	\
	pulseaudio.c	\
	pvf.c	\
	rate.c	\
	raw-fmt.c	\
	raw.c	\
	remix.c	\
	repeat.c	\
	reverb.c	\
	reverse.c	\
	s1-fmt.c	\
	s2-fmt.c	\
	s3-fmt.c	\
	s4-fmt.c	\
	sd2.c	\
	sf.c	\
	silence.c	\
	sinc.c	\
	skeleff.c	\
	skelform.c	\
	smp.c	\
	sndfile.c	\
	sndio.c	\
	sounder.c	\
	soundtool.c	\
	sox-fmt.c	\
	sox.c	\
	spectrogram.c	\
	speed.c	\
	speexdsp.c	\
	sphere.c	\
	splice.c	\
	stat.c	\
	stats.c	\
	stretch.c	\
	sunaudio.c	\
	swap.c	\
	synth.c	\
	tempo.c	\
	tremolo.c	\
	trim.c	\
	tx16w.c	\
	u1-fmt.c	\
	u2-fmt.c	\
	u3-fmt.c	\
	u4-fmt.c	\
	ul-fmt.c	\
	upsample.c	\
	util.c	\
	vad.c	\
	voc.c	\
	vol.c	\
	vorbis.c	\
	vox-fmt.c	\
	vox.c	\
	w64.c	\
	wav.c	\
	wavpack.c	\
	wve.c	\
	xa.c	\
	xi.c	\
	xmalloc.c

# sox_sample_test.c
# example0.c
# example1.c
# example2.c
# example3.c
# example4.c
# example5.c
# example6.c

TESTSRCS	= test-strtonum.c

COMPAT_OBJS	= compat-strtonum.o

# These are all the objects, but we don't link to anythong optional yet
# Let OBJS be just SoX itself for now
ALLOBJS = \
	8svx.o		\
	adpcm.o		\
	adpcms.o	\
	aifc-fmt.o	\
	aiff-fmt.o	\
	aiff.o	\
	al-fmt.o	\
	alsa.o	\
	amr-nb.o	\
	amr-wb.o	\
	ao.o	\
	au.o	\
	avr.o	\
	bend.o	\
	biquad.o	\
	biquads.o	\
	caf.o	\
	cdr.o	\
	chorus.o	\
	compand.o	\
	compandt.o	\
	contrast.o	\
	coreaudio.o	\
	cvsd-fmt.o	\
	cvsd.o	\
	dat.o	\
	dcshift.o	\
	delay.o	\
	dft_filter.o	\
	dither.o	\
	divide.o	\
	downsample.o	\
	dvms-fmt.o	\
	earwax.o	\
	echo.o	\
	echos.o	\
	effects.o	\
	effects_i.o	\
	effects_i_dsp.o	\
	f4-fmt.o	\
	f8-fmt.o	\
	fade.o	\
	fap.o	\
	fft4g.o	\
	fir.o	\
	firfit.o	\
	flac.o	\
	flanger.o	\
	formats.o	\
	formats_i.o	\
	g711.o	\
	g721.o	\
	g723_24.o	\
	g723_40.o	\
	g72x.o	\
	gain.o	\
	getopt.o	\
	gsm.o	\
	gsrt.o	\
	hcom.o	\
	hilbert.o	\
	htk.o	\
	ima-fmt.o	\
	ima_rw.o	\
	input.o	\
	la-fmt.o	\
	ladspa.o	\
	loudness.o	\
	lpc10.o	\
	lu-fmt.o	\
	mat4.o	\
	mat5.o	\
	maud.o	\
	mcompand.o	\
	mp3.o	\
	noiseprof.o	\
	noisered.o	\
	nulfile.o	\
	opus.o	\
	oss.o	\
	output.o	\
	overdrive.o	\
	pad.o	\
	paf.o	\
	phaser.o	\
	prc.o	\
	pulseaudio.o	\
	pvf.o	\
	rate.o	\
	raw-fmt.o	\
	raw.o	\
	remix.o	\
	repeat.o	\
	reverb.o	\
	reverse.o	\
	s1-fmt.o	\
	s2-fmt.o	\
	s3-fmt.o	\
	s4-fmt.o	\
	sd2.o	\
	sf.o	\
	silence.o	\
	sinc.o	\
	skeleff.o	\
	skelform.o	\
	smp.o	\
	sndfile.o	\
	sndio.o	\
	sounder.o	\
	soundtool.o	\
	sox-fmt.o	\
	spectrogram.o	\
	speed.o	\
	speexdsp.o	\
	sphere.o	\
	splice.o	\
	stat.o	\
	stats.o	\
	stretch.o	\
	sunaudio.o	\
	swap.o	\
	synth.o	\
	tempo.o	\
	tremolo.o	\
	trim.o	\
	tx16w.o	\
	u1-fmt.o	\
	u2-fmt.o	\
	u3-fmt.o	\
	u4-fmt.o	\
	ul-fmt.o	\
	upsample.o	\
	util.o	\
	vad.o	\
	voc.o	\
	vol.o	\
	vorbis.o	\
	vox-fmt.o	\
	vox.o	\
	w64.o	\
	wav.o	\
	wavpack.o	\
	wve.o	\
	xa.o	\
	xi.o	\
	xmalloc.o

OBJS = \
	8svx.o		\
	adpcm.o		\
	adpcms.o	\
	aifc-fmt.o	\
	aiff-fmt.o	\
	aiff.o	\
	al-fmt.o	\
	au.o	\
	avr.o	\
	bend.o	\
	biquad.o	\
	biquads.o	\
	caf.o	\
	cdr.o	\
	chorus.o	\
	compand.o	\
	compandt.o	\
	contrast.o	\
	cvsd-fmt.o	\
	cvsd.o	\
	dat.o	\
	dcshift.o	\
	delay.o	\
	dft_filter.o	\
	dither.o	\
	divide.o	\
	downsample.o	\
	dvms-fmt.o	\
	earwax.o	\
	echo.o	\
	echos.o	\
	effects.o	\
	effects_i.o	\
	effects_i_dsp.o	\
	f4-fmt.o	\
	f8-fmt.o	\
	fade.o	\
	fap.o	\
	fft4g.o	\
	fir.o	\
	firfit.o	\
	flanger.o	\
	formats.o	\
	formats_i.o	\
	g711.o	\
	g721.o	\
	g723_24.o	\
	g723_40.o	\
	g72x.o	\
	gain.o	\
	getopt.o	\
	gsrt.o	\
	hcom.o	\
	hilbert.o	\
	htk.o	\
	ima-fmt.o	\
	ima_rw.o	\
	input.o	\
	la-fmt.o	\
	loudness.o	\
	lu-fmt.o	\
	mat4.o	\
	mat5.o	\
	maud.o	\
	mcompand.o	\
	mp3.o	\
	noiseprof.o	\
	noisered.o	\
	nulfile.o	\
	output.o	\
	overdrive.o	\
	pad.o	\
	paf.o	\
	phaser.o	\
	prc.o	\
	pvf.o	\
	rate.o	\
	raw-fmt.o	\
	raw.o	\
	remix.o	\
	repeat.o	\
	reverb.o	\
	reverse.o	\
	s1-fmt.o	\
	s2-fmt.o	\
	s3-fmt.o	\
	s4-fmt.o	\
	sd2.o	\
	sf.o	\
	silence.o	\
	sinc.o	\
	skeleff.o	\
	skelform.o	\
	smp.o	\
	sndfile.o	\
	sndio.o	\
	sounder.o	\
	soundtool.o	\
	sox-fmt.o	\
	speed.o	\
	speexdsp.o	\
	sphere.o	\
	splice.o	\
	stat.o	\
	stats.o	\
	stretch.o	\
	swap.o	\
	synth.o	\
	tempo.o	\
	tremolo.o	\
	trim.o	\
	tx16w.o	\
	u1-fmt.o	\
	u2-fmt.o	\
	u3-fmt.o	\
	u4-fmt.o	\
	ul-fmt.o	\
	upsample.o	\
	util.o	\
	vad.o	\
	voc.o	\
	vol.o	\
	vox-fmt.o	\
	vox.o	\
	w64.o	\
	wav.o	\
	wavpack.o	\
	wve.o	\
	xa.o	\
	xi.o	\
	xmalloc.o

# FIXME Make a distinction between formats, effect, drivers etc SRCS/OBJS.
# This information still lives in the unused Makefile.am
# (Maybe also rename the source files in that way.)

LIB_OBJS = $(OBJS) $(COMPAT_OBJS) libsox.o libsox_i.o
BIN_OBJS = $(OBJS) $(COMPAT_OBJS) sox.o

BINS =	sox soxi play rec
LIBS =	libsox.so
HDRS =	sox.h
MAN1 =	sox.1 soxi.1
MAN3 = 	libsox.3
MAN7 =	soxformat.7
MANS =	$(MAN1) $(MAN3) $(MAN7)
HTML =	sox.html soxi.html soxformat.html libsox.html
TXTS =	sox.txt soxi.txt soxformat.txt libsox.txt
PDFS =	sox.pdf soxi.pdf soxformat.pdf libsox.pdf
POST =	sox.ps soxi.ps soxformat.ps libsox.ps
DIST =	README LICENSE.GPL LICENSE.LGPL $(SRCS) $(TESTSRCS) $(HDRS) $(MANS)
#EXTRA_DIST = sox.pc.in


all: $(BINS) $(LIBS) $(HDRS) $(MANS) Makefile.local

html: $(HTML)
txt:  $(TXTS)
pdf:  $(PDFS)
ps:   $(POST)

libsox.so: $(LIB_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -shared -o $@ $(LIB_OBJS) -lm -lgsm -lsndio

sox: $(BIN_OBJS) $(LIBS)
	$(CC) $(CFLAGS) $(LDFLAGS) -L. -Wl,-rpath,$(LIBDIR) -o $@ sox.o -lsox

soxi play rec: sox
	ln -sf sox soxi
	ln -sf sox play
	ln -sf sox rec

include Makefile.depend


.SUFFIXES: .c .o
.SUFFIXES: .1 .3 .7 .html .pdf .ps .txt

.c.o:
	$(CC) $(CFLAGS) -c $<

.1.html .3.html .7.html: $(MANS)
	mandoc -Thtml $< > $@

.1.txt .3.txt .7.txt: $(MANS)
	mandoc -Tascii $< > $@

.1.pdf .3.pdf .7.pdf: $(MANS)
	mandoc -Tpdf $< > $@

.1.ps .3.ps .7.ps: $(MANS)
	mandoc -Tps $< > $@

lint: $(MANS)
	mandoc -Tlint -Wstyle $(MANS)

#play.1 rec.1: sox.1

#cd $(DESTDIR)$(mandir)/man1 && $(RM) play.1 && $(LN_S) sox.1 play.1
#cd $(DESTDIR)$(mandir)/man1 && $(RM) rec.1 && $(LN_S) sox.1 rec.1
#cd $(DESTDIR)$(mandir)/man7 && $(RM) soxeffect.7 && $(LN_S) ../man1/sox.1 soxeffect.7

install: all
	install -d $(BINDIR) && install -m 0555 $(BINS) $(BINDIR)
	install -d $(LIBDIR) && install -m 0444 $(LIBS) $(LIBDIR)
	install -d $(INCDIR) && install -m 0444 $(HDRS) $(INCDIR)
	install -d $(MANDIR)/man1 && install $(MAN1) $(MANDIR)/man1
	install -d $(MANDIR)/man3 && install $(MAN3) $(MANDIR)/man3
	install -d $(MANDIR)/man7 && install $(MAN7) $(MANDIR)/man7

uninstall:
	cd $(BINDIR)      && rm -f $(BINS)
	cd $(LIBDIR)      && rm -f $(LIBS)
	cd $(INCDIR)      && rm -f $(HDRS)
	cd $(MANDIR)/man1 && rm -f $(MAN1)
	cd $(MANDIR)/man3 && rm -f $(MAN3)
	cd $(MANDIR)/man7 && rm -f $(MAN7)

clean:
	rm -f $(BINS) $(LIBS) $(OBJS) $(BIN_OBJS) $(LIB_OBJS)
	rm -f $(HTML) $(TXTS) $(PDFS) $(POST)
	rm -rf .dist *.dSYM *.core *~

distclean: clean
	rm -f Makefile.local config.*

Makefile.local config.h: configure $(TESTSRCS)
	@echo "$@ is out of date; please run ./configure"
	@exit 1


#depend: config.h
	#mkdep -f Makefile.depend $(CFLAGS) $(SRCS)
	#perl -e 'undef $$/; $$_ = <>; s|/usr/include/\S+||g; \
		#s|\\\n||g; s|  +| |g; s| $$||mg; print;' \
		#Makefile.depend > Makefile.tmp
	#mv Makefile.tmp Makefile.depend


.PHONY: install
.PHONY: clean distclean depend
