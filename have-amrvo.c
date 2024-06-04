#include <vo-amrwbenc/enc_if.h>
#include <stdio.h>

int
main(void)
{
	void * amr;

	if ((amr = E_IF_init()) == NULL)
		return 1;

	E_IF_exit(amr);
	return 0;
}

