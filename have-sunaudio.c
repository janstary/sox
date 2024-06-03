#include <sys/audioio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

int
main(void)
{
	int device;
	audio_info_t info;

	if ((device = open("/dev/audio", O_RDONLY)) == -1)
		return 1;

	if (ioctl(device, AUDIO_GETINFO, &info) == -1)
		return 1;

	info.record.encoding = AUDIO_ENCODING_ULAW;
	info.record.sample_rate = 8000;
	info.record.precision = 8;
	info.record.channels = 1;

	if (ioctl(device, AUDIO_SETINFO, &info) == -1)
		return 1;

	return 0;
}
