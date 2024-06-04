#include <lame/lame.h>

int
main(void)
{
	lame_global_flags *flags;

	if ((flags = lame_init()) == NULL)
		return 1;

	if (lame_set_num_channels(flags, 2) < 0)
		return 1;

	if (lame_set_num_samples(flags, 2 * 48000 * 10) < 0)
		return 1;

	return 0;
}
