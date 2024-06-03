#include <ogg/ogg.h>

int
main(void)
{
	unsigned char buf[1024];
	oggpack_buffer ogg;
	int size = 1024;

	oggpack_readinit(&ogg, buf, size);
	oggpack_reset(&ogg);

	return 0;
}
