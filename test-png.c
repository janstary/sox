#include <png.h>

int
main(void)
{
	return (png_access_version_number() == 0);
}
