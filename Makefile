VERSION	= 14.4.3

include Makefile.local

UTIL_SRCS =		\
	getopt.c	\
	util.c		\
	util.h		\
	libsox.c	\
	libsox_i.c	\
	sox.c		\
	sox.h		\
	soxomp.h	\
	xmalloc.c	\
	xmalloc.h

# FIXME: make a distinction between _codec_ and _filetypes_ (*-fmt.c)
FORMAT_SRCS = \
	8svx.c adpcm.c adpcm.h adpcms.c adpcms.h \
	aifc-fmt.c aiff.c aiff.h aiff-fmt.c au.c avr.c \
	cdr.c cvsd.c cvsd.h cvsdfilt.h cvsd-fmt.c dat.c dvms-fmt.c \
	f4-fmt.c f8-fmt.c formats.c formats.h formats_i.c \
	g711.c g711.h g721.c g723_24.c g723_40.c g72x.c g72x.h gsrt.c \
	hcom.c htk.c ima-fmt.c ima_rw.c ima_rw.h \
	maud.c nulfile.c prc.c raw.c raw.h raw-fmt.c \
	sf.c skelform.c smp.c sounder.c soundtool.c sox_i.h sox-fmt.c sphere.c \
	tx16w.c voc.c vox.c vox.h vox-fmt.c wav.c wavpack.c wve.c w64.c xa.c \
	al-fmt.c la-fmt.c ul-fmt.c lu-fmt.c \
	s1-fmt.c s2-fmt.c s3-fmt.c s4-fmt.c \
	u1-fmt.c u2-fmt.c u3-fmt.c u4-fmt.c

EFFECT_SRCS = \
	band.h bend.c biquad.c biquad.h biquads.c \
	chorus.c compand.c compandt.c compandt.h contrast.c \
	dcshift.c delay.c dft_filter.c dft_filter.h \
	dither.c dither.h divide.c downsample.c \
	earwax.c echo.c echos.c \
	effects.c effects.h effects_i.c effects_i_dsp.c \
	fade.c fft4g.c fft4g.h fifo.h fir.c firfit.c flanger.c \
	gain.c hilbert.c input.c \
	loudness.c \
	mcompand.c mcompand_xover.h \
	noiseprof.c noisered.c noisered.h \
	output.c overdrive.c pad.c phaser.c \
	rate.c rate_filters.h rate_half_fir.h rate_poly_fir0.h rate_poly_fir.h \
	remix.c repeat.c reverb.c reverse.c \
	silence.c sinc.c skeleff.c speed.c splice.c \
	stat.c stats.c stretch.c swap.c synth.c \
	tempo.c tremolo.c trim.c upsample.c \
	vad.c vol.c

EXAMPLE_SRCS = \
	example0.c \
	example1.c \
	example2.c \
	example3.c \
	example4.c \
	example5.c \
	example6.c

TEST_SRCS = \
	test-sample-conversion.c

EXTERNAL_SRCS  = amr-nb.c amr-wb.c amr.h flac.c gsm.c ladspa.h ladspa.c lpc10.c
EXTERNAL_SRCS += mp3.c mp3-util.h opus.c speexdsp.c spectrogram.c vorbis.c
EXTERNAL_SRCS += sndfile.c caf.c fap.c mat4.c mat5.c paf.c pvf.c sd2.c xi.c
EXTERNAL_SRCS += alsa.c ao.c coreaudio.c oss.c pulseaudio.c sndio.c sunaudio.c

HAVESRCS = \
	have-strtonum.c		\
				\
	have-amrnb.c		\
	have-amrwb.c		\
	have-flac.c		\
	have-gsm.c		\
	have-lpc10.c		\
	have-magic.c		\
	have-mp3.c		\
	have-opus.c		\
	have-png.c		\
	have-sndfile.c		\
	have-vorbis.c		\
	have-wavpack.c		\
	have-zlib.c		\
				\
	have-ladspa.c		\
	have-speexdsp.c		\
				\
	have-alsa.c		\
	have-ao.c		\
	have-coreaudio.c	\
	have-oss.c		\
	have-pulseaudio.c	\
	have-sndio.c		\
	have-sunaudio.c

SRCS = \
	$(UTIL_SRC)		\
	$(FORMAT_SRCS)		\
	$(EFFECT_SRCS)		\
	$(EXTERNAL_SRCS)	\
	$(EXAMPLE_SRCS)		\
	$(TEST_SRCS)

COMPAT_OBJS = \
	compat-strtonum.o

FORMAT_OBJS = \
	8svx.o adpcm.o adpcms.o \
	aifc-fmt.o aiff.o aiff-fmt.o au.o avr.o \
	cdr.o cvsd.o cvsd-fmt.o dat.o dvms-fmt.o \
	f4-fmt.o f8-fmt.o formats.o formats_i.o \
	g711.o g721.o g723_24.o g723_40.o g72x.o gsrt.o \
	hcom.o htk.o ima-fmt.o ima_rw.o \
	maud.o nulfile.o prc.o raw.o raw-fmt.o \
	sf.o skelform.o smp.o sounder.o soundtool.o sox-fmt.o sphere.o \
	tx16w.o voc.o vox.o vox-fmt.o wav.o wavpack.o wve.o w64.o xa.o \
	al-fmt.o la-fmt.o ul-fmt.o lu-fmt.o \
	s1-fmt.o s2-fmt.o s3-fmt.o s4-fmt.o \
	u1-fmt.o u2-fmt.o u3-fmt.o u4-fmt.o

EFFECT_OBJS = \
	bend.o biquad.o biquads.o \
	chorus.o compand.o compandt.o contrast.o \
	dcshift.o delay.o dft_filter.o \
	dither.o divide.o downsample.o \
	earwax.o echo.o echos.o \
	effects.o effects_i.o effects_i_dsp.o \
	fade.o fft4g.o fir.o firfit.o flanger.o \
	gain.o hilbert.o input.o \
	loudness.o \
	mcompand.o \
	noiseprof.o noisered.o \
	output.o overdrive.o pad.o phaser.o \
	rate.o \
	remix.o repeat.o reverb.o reverse.o \
	silence.o sinc.o skeleff.o speed.o splice.o \
	stat.o stats.o stretch.o swap.o synth.o \
	tempo.o tremolo.o trim.o upsample.o \
	vad.o vol.o

# Unlike FORMAT_OBJS and EFFECT_OBJS native to SoX,
# EXTERNAL_OBJS is composed by ./configure into:
include Makefile.external

LIB_OBJS  = libsox.o libsox_i.o getopt.o util.o xmalloc.o
LIB_OBJS += $(FORMAT_OBJS) $(EFFECT_OBJS) $(COMPAT_OBJS)
LIB_OBJS += $(EXTERNAL_OBJS)
BIN_OBJS  = sox.o

BINS  = sox soxi play rec
EXAM  = example0 example1 example2 example3 example4 example5 example6
LIBS  = libsox.so
HDRS  = sox.h
MAN1  = sox.1 soxi.1
MAN3  = libsox.3
MAN7  = soxformat.7
MANS  = $(MAN1) $(MAN3) $(MAN7)
HTML  = sox.html soxi.html soxformat.html libsox.html
TXTS  = sox.txt soxi.txt soxformat.txt libsox.txt
PDFS  = sox.pdf soxi.pdf soxformat.pdf libsox.pdf
POST  = sox.ps soxi.ps soxformat.ps libsox.ps
DIST  = $(SRCS) $(HAVESRCS) $(HDRS) $(MANS)
DIST += README LICENSE.GPL LICENSE.LGPL LICENSE
DIST += file.wav # sox.pc.in FIXME

all: $(BINS) $(EXAM) $(LIBS) $(HDRS) $(MANS) Makefile.local Makefile.external

html: $(HTML)
txt:  $(TXTS)
pdf:  $(PDFS)
ps:   $(POST)

libsox.so: $(LIB_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -shared -o $@ $(LIB_OBJS) $(LDADD)

sox: $(LIBS) $(BIN_OBJS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ sox.o -lsox

soxi play rec: sox
	ln -sf sox soxi
	ln -sf sox play
	ln -sf sox rec

example0: example0.c
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

example1: example1.c $(LIBS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

example2: example2.c $(LIBS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

example3: example3.c $(LIBS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

example4: example4.c $(LIBS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

example5: example5.c $(LIBS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

example6: example6.c $(LIBS)
	$(CC) $(CFLAGS) -L. $(LDFLAGS) -Wl,-rpath,$(LIBDIR) -o $@ $< -lsox

test-sample-convesion: test-sample-conversion.c
	$(CC) $(CFLAGS) -o $@ $<

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

test: test-sample-conversion test-file-conversion
	./test-sample-conversion
	./test-file-conversion
	#test-effect
	#test-comments

uninstall:
	cd $(BINDIR)      && rm -f $(BINS)
	cd $(LIBDIR)      && rm -f $(LIBS)
	cd $(INCDIR)      && rm -f $(HDRS)
	cd $(MANDIR)/man1 && rm -f $(MAN1)
	cd $(MANDIR)/man3 && rm -f $(MAN3)
	cd $(MANDIR)/man7 && rm -f $(MAN7)

clean:
	rm -f $(BINS) $(LIBS) $(EXAM) $(BIN_OBJS) $(LIB_OBJS) $(EXTERNAL_OBJS)
	rm -f $(HTML) $(TXTS) $(PDFS) $(POST)
	rm -rf .dist *.dSYM *.core *~ .*~
	rm -rf depend _depend .depend

distclean: clean
	rm -f Makefile.local Makefile.external config.*

Makefile.local Makefile.external config.h: configure $(HAVESRCS)
	@echo "$@ is out of date; please run ./configure"
	@exit 1

depend: config.h
	mkdep -f depend $(CFLAGS) \
		$(UTIL_SRCS) $(FORMAT_SRCS) $(EFFECT_SRCS) $(EXAMPLE_SRCS)
	perl -e 'undef $$/; $$_ = <>; s|/usr/include/\S+||g; \
		s|\\\n||g; s|  +| |g; s| $$||mg; print;' \
		depend > _depend
	mv _depend depend


.PHONY: install
.PHONY: clean distclean depend

# FIXME Make sure we export the right symbols
#-export-symbols-regex '^(sox_.*|lsx_(check_read_params|(close|open)_dllibrary|(debug(_more|_most)?|fail|report|warn)_impl|eof|fail_errno|filelength|find_(enum_(text|value)|file_extension)|getopt(_init)?|lpc10_(create_(de|en)coder_state|(de|en)code)|raw(read|write)|read(_b_buf|buf|chars)|realloc|rewind|seeki|sigfigs3p?|strcasecmp|tell|unreadb|write(b|_b_buf|buf|s)))$$'

