/*******************************************/
/*  DC Blocking Filter                     */
/*  by Perry R. Cook, 1995-96              */
/*  This guy is very helpful in, uh,       */
/*  blocking DC.  Needed because a simple  */
/*  low-pass reflection filter allows DC   */
/*  to build up inside recursive           */
/*  structures.                            */
/*******************************************/

#include "dcblockr.h"

void dcblockrset(DCBlocker* p)
{
    p->outputs = FL(0.0);
    p->inputs = FL(0.0);
    p->gain = *p->gg;
    if (p->gain == FL(0.0)) p->gain = FL(0.99);
}

void dcblockr(DCBlocker* p)
{
    MYFLT       *ar = p->ar;
    int         nsmps = ksmps;
    MYFLT       gain = p->gain;
    MYFLT       outputs = p->outputs;
    MYFLT       inputs = p->inputs;
    MYFLT       *samp = p->in;

    do {
      MYFLT sample = *samp++;
      outputs = sample - inputs + (gain * outputs);
      inputs = sample;
      *ar++ = outputs;
    } while (--nsmps);
    p->outputs = outputs;
    p->inputs = inputs;
}

