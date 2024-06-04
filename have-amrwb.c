#include <opencore-amrwb/dec_if.h>
#include <stdio.h>

int
main(void)
{
	void * dec;

	if ((dec = D_IF_init()) == NULL)
		return 1;

	D_IF_exit(dec);
	return 0;
}
