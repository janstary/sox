#include <opencore-amrnb/interf_dec.h>
#include <opencore-amrnb/interf_enc.h>
#include <stdio.h>

int
main(void)
{
	void * dec;
	void * enc;

	if ((dec = Decoder_Interface_init()) == NULL)
		return 1;

	if ((enc = Encoder_Interface_init(0)) == NULL)
		return 1;

	Decoder_Interface_exit(dec);
	Encoder_Interface_exit(enc);
	return 0;
}
