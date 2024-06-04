#include <twolame.h>
#include <stdio.h>

int
main(void)
{
	twolame_options *options;

	if (get_twolame_version() == NULL)
		return 1;

	if (get_twolame_url() == NULL)
		return 1;

	if ((options = twolame_init()) == NULL)
		return 1;

	if (twolame_set_num_channels(options, 2) != 0)
		return 1;

	if (twolame_set_in_samplerate(options, 48000) != 0)
		return 1;

	if (twolame_init_params(options) != 0)
		return 1;

	return 0;
}
