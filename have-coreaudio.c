#include <CoreAudio/CoreAudio.h>

int
main(void)
{
	int rc;
	unsigned size;
	AudioDeviceID id;

	size = sizeof(id);
	rc = AudioHardwareGetProperty(
		kAudioHardwarePropertyDefaultOutputDevice, &size, &id);

	return (rc != 0 || id == kAudioDeviceUnknown);
}
