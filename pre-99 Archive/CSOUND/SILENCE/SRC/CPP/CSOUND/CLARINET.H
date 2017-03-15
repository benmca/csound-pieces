/******************************************/
/*  Clarinet model ala Smith              */
/*  after McIntyre, Schumacher, Woodhouse */
/*  by Perry Cook, 1995-96                */
/*  Recoded for Csound by John ffitch     */
/*  November 1997                         */
/*                                        */
/*  This is a waveguide model, and thus   */
/*  relates to various Stanford Univ.     */
/*  and possibly Yamaha and other patents.*/
/*                                        */
/******************************************/

#if !defined(__Clarinet_h)
#define __Clarinet_h

#include "physutil.h"

/**********************************************/
/*  One break point linear reed table object  */
/*  by Perry R. Cook, 1995-96                 */
/*  Consult McIntyre, Schumacher, & Woodhouse */
/*        Smith, Hirschman, Cook, Scavone,    */
/*        more for information.               */
/**********************************************/

typedef struct ReedTabl {
    MYFLT       offSet;
    MYFLT       slope;
    MYFLT       lastOutput;
} ReedTabl;

MYFLT ReedTabl_LookUp(ReedTabl*, MYFLT);

/*******************************************/
/*  One Zero Filter Class,                 */
/*  by Perry R. Cook, 1995-96              */
/*  The parameter gain is an additional    */
/*  gain parameter applied to the filter   */
/*  on top of the normalization that takes */
/*  place automatically.  So the net max   */
/*  gain through the system equals the     */
/*  value of gain.  sgain is the combina-  */
/*  tion of gain and the normalization     */
/*  parameter, so if you set the poleCoeff */
/*  to alpha, sgain is always set to       */
/*  gain / (1.0 - fabs(alpha)).            */
/*******************************************/

typedef struct OneZero {
    MYFLT gain;                 /* Filter subclass */
    MYFLT inputs;
    MYFLT lastOutput;           /* End of Filter */
    MYFLT zeroCoeff;
    MYFLT sgain;
} OneZero;

void make_OneZero(OneZero*);
MYFLT OneZero_tick(OneZero*, MYFLT);
void OneZero_setGain(OneZero*, MYFLT);
void OneZero_setCoeff(OneZero*, MYFLT);
void OneZero_print(OneZero*);

/* ********************************************************************** */
typedef struct CLARIN {
    OPDS    h;
    MYFLT       *ar;                  /* Output */
    MYFLT       *amp, *frequency;
    MYFLT       *reedStffns, *attack, *dettack, *noiseGain, *vibFreq;
    MYFLT       *vibAmt, *ifn, *lowestFreq;

    FUNC        *vibr;          /* Table for vibrato */
    MYFLT       v_rate;         /* Parameters for vibrato */
    MYFLT       v_time;
/*     MYFLT    v_phaseOffset; */
    DLineL      delayLine;
    ReedTabl    reedTable;
    OneZero     filter;
    Envelope    envelope;
    Noise       noise;
    long        length;
    MYFLT       outputGain;
    int         kloop;
} CLARIN;


/* void clarinetset(CLARINET *p); */
/* void clarinet(CLARINET *p) */

#endif
