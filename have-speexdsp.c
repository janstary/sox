#include <speex/speex_preprocess.h>
#include <stdio.h>

int
main()
{
	SpeexPreprocessState *state;

	if ((state = speex_preprocess_state_init(160, 48000)) == NULL)
		return 1;

	speex_preprocess_state_destroy(state);
	return 0;
}
