#include <stdio.h>
#include <stdlib.h>
#include <alsa/asoundlib.h>

int
main(void)
{
	snd_pcm_t *hdl;
	snd_pcm_hw_params_t *par;
	unsigned rate = 44100;

	if (snd_pcm_open(&hdl, "hw:0,0", SND_PCM_STREAM_PLAYBACK, 0) < 0)
		return 1;

	if (snd_pcm_hw_params_malloc(&par) < 0)
		return 1;

	if (snd_pcm_hw_params_any(hdl, par) < 0)
		return 1;

	if (snd_pcm_hw_params_set_access(hdl, par,
	SND_PCM_ACCESS_RW_INTERLEAVED) < 0)
		return 1;

	if (snd_pcm_hw_params_set_format(hdl, par,
	SND_PCM_FORMAT_S16_LE) < 0)
		return 1;

	if (snd_pcm_hw_params_set_rate_near(hdl, par, &rate, 0) < 0)
		return 1;

	if (snd_pcm_hw_params_set_channels(hdl, par, 2) < 0)
		return 1;

	if (snd_pcm_hw_params(hdl, par) < 0)
		return 1;

	if (snd_pcm_prepare(hdl) < 0)
		return 1;

	snd_pcm_hw_params_free(par);
	return 0;
}
