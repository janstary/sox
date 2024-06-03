#include <opencore-amrnb/interf_dec.h>
#include <opencore-amrnb/interf_enc.h>
#include <stdio.h>

int
main(void)
{
	if (Decoder_Interface_init() == NULL)
		return 1;

	if (Encoder_Interface_init(0) == NULL)
		return 1;

	return 0;
}
