#include <opencore-amrwb/dec_if.h>
#include <stdio.h>

int
main(void)
{
	if (D_IF_init() == NULL)
		return 1;

	return 0;
}
