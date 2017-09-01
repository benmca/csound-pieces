/******************************************/
/*  Maracha (& other shakers) Simulation  */
/*  by Perry R. Cook, 1996                */
/*  by Perry Cook, 1995-96                */
/*                                        */
/*  See ICMC96 paper "PhISM: Percussive   */
/*  Synthesis." for more exciting details */
/******************************************/

#if !defined(__Shaker_h)
#define __Shaker_h

#include "cs.h"
#include "physutil.h"

typedef struct Shaker {
    OPDS        h;
    MYFLT       *ar;                  /* Output */
    MYFLT       *amp, *kfreq;
    MYFLT       *beancount, *shake_damp;
    MYFLT       *times, *dettack;

    BiQuad      filter;
    ADSR        envelope;
    int         num_beans;
    int         wait_time;
    int         shake_num;
    MYFLT       shake_speed;    /* A + amp*N -- hides two parameters */
    MYFLT       res_freq;
    MYFLT       coll_damp;
    MYFLT       shakeEnergy;
    MYFLT       noiseGain;
    MYFLT       gain_norm;
    int         kloop;
    MYFLT       freq;
} SHAKER;

#endif

