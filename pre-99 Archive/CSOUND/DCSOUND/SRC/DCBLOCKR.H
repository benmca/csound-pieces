#include "cs.h"

typedef struct DCBlocker {
    OPDS	h;
    MYFLT	*ar, *in, *gg;

    MYFLT	outputs;
    MYFLT	inputs;
    MYFLT	gain;
} DCBlocker;

