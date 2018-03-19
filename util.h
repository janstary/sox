/* General purpose, i.e. non SoX specific, utility functions and macros.
 *
 * (c) 2006-8 Chris Bagwell and SoX contributors
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

#include <sys/types.h> /* For off_t not found in stdio.h */
#include <sys/stat.h> /* Needs to be included before we redefine off_t. */

#include <inttypes.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#include "config.h"
#include "xmalloc.h"

/*---------------------------- Portability stuff -----------------------------*/

/* WTF?
  typedef sox_int8_t   int8_t;
  typedef sox_uint8_t  uint8_t;
  typedef sox_int16_t  int16_t;
  typedef sox_uint16_t uint16_t;
  typedef sox_int32_t  int32_t;
  typedef sox_uint32_t uint32_t;
  typedef sox_int64_t  int64_t;
  typedef sox_uint64_t uint64_t;
  #define UINT64_MAX ((uint64_t)-1)
*/

/* These are all defined in inttypes.h
#ifndef PRId64
#if LONG_MAX==9223372036854775807
#define PRId64 "ld"
#else
#define PRId64 "lld"
#endif
#endif
*/

/*
#ifndef PRIu64
#if ULONG_MAX==0xffffffffffffffff
#define PRIu64 "lu"
#else
#define PRIu64 "llu"
#endif
#endif
*/

/*
#ifndef PRIuPTR
#define PRIuPTR "lu"
#endif
*/

#ifdef __GNUC__
#define NORET __attribute__((noreturn))
#define UNUSED __attribute__ ((unused))
#else
#define NORET
#define UNUSED
#endif

#define LAST_SLASH(path) strrchr(path, '/')
#define IS_ABSOLUTE(path) ((path)[0] == '/')
#define SET_BINARY_MODE(file)

#ifdef WORDS_BIGENDIAN
  #define MACHINE_IS_BIGENDIAN 1
  #define MACHINE_IS_LITTLEENDIAN 0
#else
  #define MACHINE_IS_BIGENDIAN 0
  #define MACHINE_IS_LITTLEENDIAN 1
#endif

/*--------------------------- Language extensions ----------------------------*/

/* Compile-time ("static") assertion */
/*   e.g. assert_static(sizeof(int) >= 4, int_type_too_small)    */
#define assert_static(e,f) enum {assert_static__##f = 1/(e)}
#define array_length(a) (sizeof(a)/sizeof(a[0]))
#define field_offset(type, field) ((size_t)&(((type *)0)->field))
#define unless(x) if (!(x))

/*------------------------------- Maths stuff --------------------------------*/

#include <math.h>

#ifdef min
#undef min
#endif
#define min(a, b) ((a) <= (b) ? (a) : (b))

#ifdef max
#undef max
#endif
#define max(a, b) ((a) >= (b) ? (a) : (b))

#define range_limit(x, lower, upper) (min(max(x, lower), upper))

#ifndef M_PI
#define M_PI    3.14159265358979323846
#endif
#ifndef M_PI_2
#define M_PI_2  1.57079632679489661923  /* pi/2 */
#endif
#ifndef M_LN10
#define M_LN10  2.30258509299404568402  /* natural log of 10 */
#endif
#ifndef M_SQRT2
#define M_SQRT2  sqrt(2.)
#endif

#define sqr(a) ((a) * (a))
#define sign(x) ((x) < 0? -1 : 1)

/* Numerical Recipes in C, p. 284 */
#define ranqd1(x) ((x) = 1664525L * (x) + 1013904223L) /* int32_t x */
#define dranqd1(x) (ranqd1(x) * (1. / (65536. * 32768.))) /* [-1,1) */

#define dB_to_linear(x) exp((x) * M_LN10 * 0.05)
#define linear_to_dB(x) (log10(x) * 20)

extern int lsx_strcasecmp(const char *s1, const char *st);
extern int lsx_strncasecmp(char const *s1, char const *s2, size_t n);

/* FIXME: provide compat */
#ifndef HAVE_STRCASECMP
#define strcasecmp(s1, s2) lsx_strcasecmp((s1), (s2))
#define strncasecmp(s1, s2, n) lsx_strncasecmp((s1), (s2), (n))
#endif
