#include <stdio.h>
#include <sndio.h>

int
main(void)
{
	struct sio_hdl* hdl = NULL;
	struct sio_par want;

	if ((hdl = sio_open(SIO_DEVANY, SIO_PLAY | SIO_REC, 0)) == NULL)
		return 1;

	sio_initpar(&want);

	want.bits  = 16;
	want.bps   = SIO_BPS(want.bits);
	want.sig   = 1;
	want.le    = SIO_LE_NATIVE;
	want.pchan = 2;
	want.rate  = 48000;
	want.xrun  = SIO_ERROR;

	if (0 == sio_setpar(hdl, &want))
		return 1;

	sio_close(hdl);
	return 0;
}
