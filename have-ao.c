#include <ao/ao.h>

int
main(void)
{
	int driver;
	ao_info *info;

	ao_initialize();

	if ((driver = ao_default_driver_id()) < 0)
		return 1;

	if ((info = ao_driver_info(driver)) == NULL)
		return 1;

	ao_shutdown();
	return 0;
}
