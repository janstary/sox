#include <magic.h>
#include <stdio.h>

int
main(void)
{
	magic_t cookie;

	if ((cookie = magic_open(MAGIC_SYMLINK)) == NULL)
		return 1;

	magic_close(cookie);
	return 0;
}
