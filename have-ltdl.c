#include <ltdl.h>

int
main(void)
{
	return lt_dlinit() + lt_dlexit();
}
