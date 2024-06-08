#include <sys/soundcard.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <fcntl.h>

int
main(void)
{
	int dev;
	int fmt;
	oss_sysinfo info;

	if (SOUND_VERSION == 0)
		return 1;

	if (AFMT_S16_LE == 0)
		return 1;

	if ((dev = open("/dev/dsp", O_WRONLY)) == -1)
		return 1;

	if (ioctl(dev, SNDCTL_SYSINFO, &info) == -1)
		return 1;

	if (ioctl(dev, SNDCTL_DSP_GETFMTS, &fmt) == -1)
		return 1;

	close(dev);
	return 0;
}
