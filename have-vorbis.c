#include <vorbis/vorbisfile.h>
#include <vorbis/vorbisenc.h>
#include <vorbis/codec.h>

int
main(void)
{
	return (vorbis_version_string() == NULL);
}
