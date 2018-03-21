dnl Increase version when binary compatibility with previous version is broken
SHLIB_VERSION=3:0:0

AC_ARG_WITH(libltdl,
    AS_HELP_STRING([--without-libltdl],
        [Don't try to use libltdl for external dynamic library support]),
    with_libltdl=$withval, with_libltdl=default)

    CFLAGS="$CFLAGS -Wall -W -Wmissing-prototypes -Wstrict-prototypes -pedantic"

       [WARN_CFLAGS="-Wconversion"],
       [WARN_CFLAGS="-Wtraditional-conversion"],
       [WARN_CFLAGS="-Wtraditional-conversion"])
        LDFLAGS="$LDFLAGS -Wl,-z,defs"

AC_C_BIGENDIAN

AC_CHECK_HEADERS(fcntl.h unistd.h byteswap.h sys/stat.h sys/time.h sys/timeb.h sys/types.h sys/utsname.h termios.h glob.h fenv.h)

AC_CHECK_FUNCS(strcasecmp strdup popen vsnprintf gettimeofday mkstemp fmemopen)

AC_SEARCH_LIBS([pow], [m])
AC_SEARCH_LIBS([lrint], [m])
AC_CHECK_FUNCS([lrint])

  dnl Force defining _LARGEFILE_SOURCE always.  My assumption
  dnl is its harmlessly ignored on 64-bit platforms and platforms
  dnl that chose other solutions.
  AC_MSG_NOTICE(Forcing _LARGEFILE_SOURCE to be safe since off_t is 64 bits)
  AC_DEFINE(_LARGEFILE_SOURCE, 1)

     AC_CHECK_HEADERS(ltdl.h,
		     AC_CHECK_LIB(ltdl, lt_dlinit, LIBLTDL="$LIBLTDL -lltdl",
				  using_libltdl=no), using_libltdl=no)
    ;;

dnl Check for OpenMP
AC_OPENMP
if test "x$OPENMP_CFLAGS" != "x"; then  dnl Old libtool workaround start
  AC_MSG_CHECKING([for libtool version])
  lt_version="`grep '^VERSION' $srcdir/ltmain.sh | sed -e 's/VERSION\=//g;s/ .*//g;s/"//g'`"
  AS_VERSION_COMPARE([$lt_version], [2.4],
    [AS_IF([test "$GCC" = "yes"],
       [AC_MSG_RESULT([$lt_version, needs OpenMP linker workaround])
        GOMP_LIBS="-lgomp"],
       [AC_MSG_RESULT([$lt_version and not GCC, deactivating OpenMP])
        OPENMP_CFLAGS=""])],
    [AC_MSG_RESULT([$lt_version, OK])],
    [AC_MSG_RESULT([$lt_version, OK])])
fi
AC_SUBST(GOMP_LIBS)  dnl Old libtool workaround end.
                     dnl Only necessary if libtool version < 2.4, as older
                     dnl versions don't pass on "-fopenmp" to the linker.
                     dnl One day, replace with LT_PREREQ([2.4]) above.
CFLAGS="$CFLAGS $OPENMP_CFLAGS"

dnl Check for magic library
    AC_CHECK_HEADER(magic.h,
        [AC_CHECK_LIB(magic, magic_open, MAGIC_LIBS="-lmagic",using_magic=no)],
    
AC_CHECK_HEADERS(png.h libpng/png.h,using_png=yes)
AC_CHECK_LIB(png, png_set_rows, PNG_LIBS="$PNG_LIBS -lpng -lz", 
[AC_CHECK_LIB(png12, png_set_rows, PNG_LIBS="$PNG_LIBS -lpng12 -lz", 

AC_DEFINE(HAVE_LADSPA_H, 1, [1 if should enable LADSPA])

AC_CHECK_HEADERS(mad.h,, using_mad=no)
AC_CHECK_LIB(mad, mad_stream_buffer, MP3_LIBS="$MP3_LIBS -lmad",using_mad=no)


AC_CHECK_HEADER(id3tag.h,
[AC_CHECK_LIB(id3tag, id3_file_open, MP3_LIBS="$MP3_LIBS -lid3tag -lz",using_id3tag=no, -lz)],

AC_CHECK_HEADERS(lame/lame.h,,
AC_CHECK_LIB(mp3lame, lame_get_lametag_frame, MP3_LIBS="$MP3_LIBS -lmp3lame", using_lame=no)
AC_CHECK_LIB(mp3lame, id3tag_set_fieldvalue, using_lame=$using_lame)
AC_DEFINE(HAVE_LAME_ID3TAG, 1, [Define to 1 if lame supports optional ID3 tags.])

AC_CHECK_HEADERS(twolame.h,, using_twolame=no)
AC_CHECK_LIB(twolame, twolame_init, MP3_LIBS="$MP3_LIBS -ltwolame",using_twolame=no)


# MP2/MP3 format depends on libmad || LAME || twolame
AC_OPTIONAL_FORMAT(mp3, MP3, [
if test "$using_mad" != yes -a "$using_lame" != yes -a "$using_twolame" != yes; then
using_mp3=no
fi])

AC_OPTIONAL_FORMAT(lpc10, LPC10, [AC_CHECK_HEADER(lpc10.h, [AC_CHECK_LIB(lpc10, create_lpc10_encoder_state, LPC10_LIBS="$LPC10_LIBS -llpc10",using_lpc10=no)], using_lpc10=no)])

[AC_CHECK_LIB(ogg, ogg_packet_clear, OGG_VORBIS_LIBS="$OGG_VORBIS_LIBS -logg", using_oggvorbis=no)
AC_CHECK_LIB(vorbis, vorbis_analysis_headerout, OGG_VORBIS_LIBS="-lvorbis $OGG_VORBIS_LIBS", using_oggvorbis=no, $OGG_VORBIS_LIBS)
AC_CHECK_LIB(vorbisfile, ov_clear, OGG_VORBIS_LIBS="-lvorbisfile $OGG_VORBIS_LIBS", using_oggvorbis=no, $OGG_VORBIS_LIBS)
AC_CHECK_LIB(vorbisenc, vorbis_encode_init_vbr, OGG_VORBIS_LIBS="-lvorbisenc $OGG_VORBIS_LIBS", using_oggvorbis=no, $OGG_VORBIS_LIBS)],
using_oggvorbis=no)])

[PKG_CHECK_MODULES(OPUS, [opusfile], [], using_opus=no)],
OPUS_CFLAGS="$OPUS_CFLAGS -Wno-long-long"

# Check for FLAC libraries
#  Note passing in OGG_VORBIS_LIBS.  That is because FLAC has optional
#  support for OGG and if OGG libraries are found on this
#  system then its highly likely to be compiled into FLAC
#  and will require these at link time.
AC_OPTIONAL_FORMAT(flac, FLAC, [AC_CHECK_HEADER(FLAC/all.h, [AC_CHECK_DECL(FLAC_API_VERSION_CURRENT, [AC_CHECK_LIB(FLAC, FLAC__stream_encoder_new, FLAC_LIBS="-lFLAC $FLAC_LIBS $OGG_VORBIS_LIBS",using_flac=no, $FLAC_LIBS $OGG_VORBIS_LIBS)], using_flac=no, [#include <FLAC/all.h>])], using_flac=no)], using_flac=no)

AC_CHECK_HEADERS(opencore-amrwb/dec_if.h,
		[AC_CHECK_LIB(opencore-amrwb, D_IF_init, 
		AMRWB_LIBS="$AMRWB_LIBS -lopencore-amrwb", tmp_using_amrwb=no)],
		[AC_CHECK_HEADERS(amrwb/dec.h, 
		[AC_CHECK_LIB(amrwb, D_IF_init, 
		AMRWB_LIBS="$AMRWB_LIBS -lamrwb",tmp_using_amrwb=no)], 

AC_CHECK_HEADERS(opencore-amrnb/interf_dec.h, 
		[AC_CHECK_LIB(opencore-amrnb, Decoder_Interface_init, 
		AMRNB_LIBS="$AMRNB_LIBS -lopencore-amrnb", tmp_using_amrnb=no)],
		[AC_CHECK_HEADER(amrnb/sp_dec.h, 
		[AC_CHECK_LIB(amrnb, Decoder_Interface_init, 
		AMRNB_LIBS="$AMRNB_LIBS -lamrnb", tmp_using_amrnb=no)], 
		tmp_using_amrnb=no)])

AC_OPTIONAL_FORMAT(wavpack, WAVPACK, [AC_CHECK_HEADER(wavpack/wavpack.h, [AC_CHECK_LIB(wavpack, WavpackGetSampleRate, WAVPACK_LIBS="$WAVPACK_LIBS -lwavpack",using_wavpack=no)], using_wavpack=no)])

AC_OPTIONAL_FORMAT(coreaudio, COREAUDIO, [AC_CHECK_HEADER(CoreAudio/CoreAudio.h, [COREAUDIO_LIBS="$COREAUDIO_LIBS -Wl,-framework,CoreAudio"], using_coreaudio=no)])

AC_OPTIONAL_FORMAT(alsa, ALSA, [AC_CHECK_HEADER(alsa/asoundlib.h, [AC_CHECK_LIB(asound, snd_pcm_open, ALSA_LIBS="$ALSA_LIBS -lasound",using_alsa=no)], using_alsa=no)])

AC_OPTIONAL_FORMAT(ao, AO, [AC_CHECK_HEADER(ao/ao.h, [AC_CHECK_LIB(ao, ao_play, AO_LIBS="$AO_LIBS -lao",using_ao=no)], using_ao=no)])

AC_OPTIONAL_FORMAT(pulseaudio, PULSEAUDIO, [AC_CHECK_HEADER(pulse/simple.h, [AC_CHECK_LIB(pulse, pa_simple_new, PULSEAUDIO_LIBS="$PULSEAUDIO_LIBS -lpulse -lpulse-simple",using_pulseaudio=no,"-lpulse-simple")], using_pulseaudio=no)])

AC_OPTIONAL_FORMAT(oss, OSS, [AC_CHECK_HEADERS(sys/soundcard.h,,
[AC_CHECK_HEADERS(machine/soundcard.h,
	[AC_CHECK_LIB(ossaudio, _oss_ioctl, OSS_LIBS="$OSS_LIBS -lossaudio")],
	using_oss=no)])])

AC_OPTIONAL_FORMAT(sunaudio, SUN_AUDIO, [AC_CHECK_HEADERS(sys/audioio.h,,
[AC_CHECK_HEADERS(sun/audioio.h,, using_sunaudio=no)])])


AM_CONDITIONAL(STATIC_LIBSOX_ONLY, test "$enable_shared" = "no" -a "$enable_static" = "yes")

AC_CONFIG_FILES(Makefile src/Makefile sox.pc)

