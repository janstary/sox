#include <opus/opus.h>

int
main(void)
{
	int error;
	opus_decoder_create(8000, 2, &error);
	return (error != OPUS_OK);
}
