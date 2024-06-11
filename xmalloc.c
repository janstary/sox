/* SoX Memory allocation functions
 *
 * Copyright (c) 2005-2006 Reuben Thomas
 * Copyright (c) 2024      Jan Starý
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or (at
 * your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
 * General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <stdlib.h>
#include <err.h>

#include "sox_i.h"

void *
lsx_malloc(size_t size)
{
	void * ptr;
	if ((ptr = malloc(size)) == NULL)
		err(2, NULL);
	return ptr;
}

void *
lsx_calloc(size_t num, size_t size)
{
	void * ptr;
	if ((ptr = calloc(num, size)) == NULL)
		err(2, NULL);
	return ptr;
}

void *
lsx_realloc(void *ptr, size_t newsize)
{
	if ((ptr = realloc(ptr, newsize)) == NULL)
		err(2, NULL);
	return ptr;
}

void *
lsx_realloc_array(void *p, size_t num, size_t size)
{
	if (num > ((size_t)-1) / size) {
		lsx_fail("reallocation size overflow");
		exit(2);
	}
	return lsx_realloc(p, num * size);
}

char *
lsx_strdup(const char *s)
{
	char * ptr;
	if ((ptr = strdup(s)) == NULL)
		err(2, NULL);
	return ptr;
}
