/*
 * Copyright (c) 2018 Jan Stary <hans@stare.cz>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include <unistd.h>
#include <sndfile.h>

int
main(void)
{
	SNDFILE* sf;
	SF_INFO info;

	info.channels   = 2;
	info.samplerate = 48000;
	info.format     = SF_FORMAT_WAV | SF_FORMAT_PCM_16;
	if (NULL == (sf = sf_open("/tmp/sox--XXXXXX.wav", SFM_WRITE, &info)))
		return 1;
	sf_close(sf);
	return 0;
}
