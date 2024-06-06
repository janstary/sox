#include <id3tag.h>
#include <stdio.h>

int
main(void)
{
	struct id3_tag *tag;

	if ((tag = id3_tag_new()) == NULL)
		return 1;

	tag->version = ID3_TAG_VERSION;
	id3_tag_delete(tag);

	return 0;
}
