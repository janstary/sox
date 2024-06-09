#include <stdio.h>
#include <lpc.h>

int
main(void)
{
	struct lpc10_encoder_state * enc;
	struct lpc10_decoder_state * dec;

	if ((enc = create_lpc10_encoder_state()) == NULL)
		return 1;

	if ((dec = create_lpc10_decoder_state()) == NULL)
		return 1;

	init_lpc10_encoder_state(enc);
	init_lpc10_decoder_state(dec);

	return 0;
}
