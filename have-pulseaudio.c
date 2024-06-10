#include <pulse/simple.h>
#include <stdio.h>

int
main(void)
{
	pa_simple *pa;
	pa_stream_direction_t dir;
	pa_sample_spec spec;

	spec.rate = 48000;
	spec.channels = 2;
	spec.format = PA_SAMPLE_S32NE;
	dir = PA_STREAM_PLAYBACK;

	if ((pa = pa_simple_new(
	NULL, "SoX", dir, NULL, "have-pulse", &spec, NULL, NULL, NULL)) == NULL)
		return 1;

	pa_simple_free(pa);
	return 0;
}
