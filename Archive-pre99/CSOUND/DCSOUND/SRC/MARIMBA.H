/*******************************************/
/*  Marimba SubClass of Modal4 Instrument, */
/*  by Perry R. Cook, 1995-96              */ 
/*                                         */
/*   Controls:               stickHardness */
/*                           strikePosition*/
/*		             vibFreq       */
/*		             vibAmt        */
/*******************************************/

#if !defined(__Marimba_h)
#define __Marimba_h
#include "modal4.h"

typedef struct Marimba {
    OPDS	h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amplitude, *frequency;
    MYFLT	*hardness, *spos, *ifn;
    MYFLT	*vibFreq, *vibAmt, *ivfn, *dettack;
    MYFLT	*doubles, *triples;
/* Modal4 */
    Modal4	m4;
    int		multiStrike;
    MYFLT	strikePosition;
    MYFLT 	stickHardness;
    int		kloop;
} MARIMBA;

/* void marimbaset(MARIMBA*); */
/* void marimba(MARIMBA*); */

#endif
