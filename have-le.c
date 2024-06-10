#include <stdint.h>

union {
	uint16_t	i;
	unsigned char	c[2];
} u;

int
main()
{
	u.i = 0xAABB;
	return (u.c[0] = 0xAA && u.c[1] == 0xBB);
}
