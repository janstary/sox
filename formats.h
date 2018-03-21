/* libSoX static formats list   (c) 2006-9 Chris Bagwell and SoX contributors
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or (at
 * your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
 * General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

/* builtin audio formats */

  FORMAT(aifc)
  FORMAT(aiff)
  FORMAT(al)
  FORMAT(au)
  FORMAT(avr)
  FORMAT(cdr)
  FORMAT(cvsd)
  FORMAT(cvu)
  FORMAT(dat)
  FORMAT(dvms)
  FORMAT(f4)
  FORMAT(f8)
  FORMAT(gsrt)
  FORMAT(hcom)
  FORMAT(htk)
  FORMAT(ima)
  FORMAT(la)
  FORMAT(lu)
  FORMAT(maud)
  FORMAT(nul)
  FORMAT(prc)
  FORMAT(raw)
  FORMAT(s1)
  FORMAT(s2)
  FORMAT(s3)
  FORMAT(s4)
  FORMAT(sf)
  FORMAT(sln)
  FORMAT(smp)
  FORMAT(sounder)
  FORMAT(soundtool)
  FORMAT(sox)
  FORMAT(sphere)
  FORMAT(svx)
  FORMAT(txw)
  FORMAT(u1)
  FORMAT(u2)
  FORMAT(u3)
  FORMAT(u4)
  FORMAT(ul)
  FORMAT(voc)
  FORMAT(vox)
  FORMAT(wav)
  FORMAT(wve)
  FORMAT(xa)

/* External audio formats.
 * Keep them in ./configure order. */

#if HAVE_AMRNB
  FORMAT(amr_nb)
#endif
#if HAVE_AMRWB
  FORMAT(amr_wb)
#endif
#if HAVE_FLAC
  FORMAT(flac)
#endif
#if HAVE_GSM
  /* gsm.h has typedef struct gsm_state * gsm;
   * so we cannot call this "gsm" */
  FORMAT(_gsm)
#endif
#if HAVE_LPC10
  FORMAT(lpc10)
#endif
#if HAVE_MP3
  FORMAT(mp3)
#endif
#if HAVE_OPUS
  FORMAT(opus)
#endif
#if HAVE_SNDFILE
  FORMAT(sndfile)
  FORMAT(caf)
  FORMAT(fap)
  FORMAT(mat4)
  FORMAT(mat5)
  FORMAT(paf)
  FORMAT(pvf)
  FORMAT(sd2)
  FORMAT(w64)
  FORMAT(xi)
#endif
#if HAVE_VORBIS
  FORMAT(vorbis)
#endif
#if HAVE_WAVPACK
  FORMAT(wavpack)
#endif

/* Audio output drivers.
 * Keep them in ./configure order. */

#if HAVE_ALSA
  FORMAT(alsa)
#endif
#if HAVE_AO
  FORMAT(ao)
#endif
#if HAVE_COREAUDIO
  FORMAT(coreaudio)
#endif
#if HAVE_OSS
  FORMAT(oss)
#endif
#if HAVE_PULSEAUDIO
  FORMAT(pulseaudio)
#endif
#if HAVE_SNDIO
  FORMAT(sndio)
#endif
#if HAVE_SUNAUDIO
  FORMAT(sunau)
#endif
