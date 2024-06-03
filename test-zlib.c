#include <zlib.h>

int
main(void)
{
	return (zlibVersion() == NULL);
}
