#include <sndfile.h>
#include <unistd.h>

int
main(void)
{
	SNDFILE* hdl;
	SF_INFO info;

	info.format = SF_FORMAT_PAF | SF_FORMAT_PCM_16;
	info.samplerate = 48000;
	info.channels = 1;

	if ((hdl = sf_open("file.paf", SFM_WRITE, &info)) == NULL)
		return 1;

	unlink("file.paf");
	sf_close(hdl);
	return 0;
}
