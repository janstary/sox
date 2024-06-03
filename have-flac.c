#include <FLAC/stream_decoder.h>

int
main(void)
{
	FLAC__StreamDecoder *decoder = 0;
	return ((decoder = FLAC__stream_decoder_new()) == NULL);
}
