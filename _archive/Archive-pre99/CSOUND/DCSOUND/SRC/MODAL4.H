/*******************************************/
/*  4 Resonance Modal Synthesis Instrument */
/*  by Perry R. Cook, 1995-96              */ 
/*  This instrument contains an excitation */
/*  wavetable, an envelope, and four reso- */
/*  nances (Non-Sweeping BiQuad Filters).  */
/*******************************************/

#if !defined(__Modal4_h)
#define __Modal4_h

#include "cs.h"
#include "physutil.h"

typedef struct Modal4 {
    Envelope envelope; 
    FUNC	*wave;
/*     int		w_looping; */
    int 	w_myData;
    int 	w_allDone;
    MYFLT 	w_rate;
    MYFLT 	w_time;
    MYFLT 	w_phaseOffset;
    MYFLT 	w_lastOutput;
    BiQuad      filters[4];
    OnePole     onepole;
    FUNC	*vibr;
    MYFLT	v_rate;         /* Parameters for vibrato */
    MYFLT	v_time;
    MYFLT	v_phaseOffset;
    MYFLT	v_lastOutput;
    MYFLT	vibrGain;
    MYFLT	masterGain;
    MYFLT	directGain;
    MYFLT	baseFreq;
    MYFLT	ratios[4];
    MYFLT	resons[4];
} Modal4;

void make_Modal4(Modal4 *m, MYFLT *ifn, MYFLT vgain, MYFLT vrate);
void Modal4_clear(Modal4 *);
void Modal4_setFreq(Modal4 *m, MYFLT frequency);
void Modal4_setRatioAndReson(Modal4 *m, int whichOne, MYFLT ratio, MYFLT reson);
#define Modal4_setMasterGain(m,Gain)	(m->masterGain = aGain)
#define Modal4_setDirectGain(m,aGain)	(m->directGain = aGain)
#define Modal4_setFiltGain(m,whichOne,gain) (BiQuad_setGain(m->filters[whichOne], gain))
void Modal4_strike(Modal4 *m, MYFLT amplitude);
void Modal4_damp(Modal4 *m, MYFLT amplitude);
MYFLT Modal4_tick(Modal4 *);

#endif
