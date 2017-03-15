#include "cs.h"
#include "dashow.h"
#include <math.h>


void dashow (DSH *p)
{
        *p->rmod = (*p->kfreq_max - *p->kfreq_min) / (*p->kband_max - *p->kband_min);
        *p->rcar = (*p->kfreq_max - (*p->kband_max * *p->rmod));

        if (*p->rmod <= 0.f) *p->rmod = (MYFLT) fabs (*p->rmod);
        if (*p->rcar <= 0.f) *p->rcar = (MYFLT) fabs (*p->rcar);

}

