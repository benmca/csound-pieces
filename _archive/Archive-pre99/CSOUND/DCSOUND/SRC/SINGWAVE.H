/*******************************************/
/*  "Singing" Looped Soundfile Class,      */
/*  by Perry R. Cook, 1995-96              */ 
/*  This Object contains all that's needed */
/*  to make a pitched musical sound, like  */
/*  a simple voice or violin.  In general, */  
/*  it will not be used alone (because of  */
/*  of munchinification effects from pitch */
/*  shifting.  It will be used as an       */
/*  excitation source for other instruments*/
/*******************************************/

#if !defined(__SingWave_h)
#define __SingWave_h

#ifndef MYFLT
#include "sysdep.h"
#endif

extern MYFLT phonGains[32][2];
extern MYFLT phonParams[32][4][3];
extern char phonemes[32][4];

/*******************************************/
/*  Modulator Class, Perry R. Cook, 1995-96*/ 
/*  This Object combines random and        */
/*  periodic modulations to give a nice    */
/*  natural human modulation function.     */  
/*******************************************/

#include "physutil.h"
#include "clarinet.h"
#include "moog1.h"
#include "cs.h"

typedef struct SubNoise
{
     Noise	lastOutput;
     int	counter;
     int	howOften;
} SubNoise;

/* void make_SubNoise(SubNoise *); */
void make_SubNoise(SubNoise *, int subSample);
void SubNoise_setHowOften(SubNoise *, int howOft);
MYFLT SubNoise_tick(SubNoise *);

typedef struct Modulatr {
    FUNC     *wave;
    MYFLT    v_rate;
    MYFLT    v_time;
    MYFLT    v_phase;
    MYFLT    v_lastOutput;
    SubNoise noise;
    OnePole  onepole;
    MYFLT    vibAmt;
/*     MYFLT    rndAmt; */
    MYFLT    lastOutput;
} Modulatr;

void make_Modulatr(Modulatr *, MYFLT *);
void Modulatr_reset(Modulatr *);
void Modulatr_setRndAmt(Modulatr *, MYFLT rndAmount);
MYFLT Modulatr_tick(Modulatr *);
MYFLT Modulatr_lastOut(Modulatr *);

typedef struct SingWave {
    Modulatr	modulator;
    Envelope	envelope;
    Envelope	pitchEnvelope;
    FUNC	*wave;
    MYFLT	rate;
    MYFLT	sweepRate;
    MYFLT	mytime;
    MYFLT	lastOutput;
} SingWave;

void make_SingWave(SingWave *, MYFLT *, MYFLT *);
void SingWave_reset(SingWave *);
void SingWave_setFreq(SingWave *,MYFLT aFreq);    
MYFLT SingWave_tick(SingWave *);
void SingWave_print(SingWave *);

/*******************************************/
/*  4 Formant Synthesis Instrument         */
/*  by Perry R. Cook, 1995-96              */ 
/*  This instrument contains an excitation */
/*  singing wavetable (looping wave with   */
/*  random and periodic vibrato, smoothing */
/*  on frequency, etc.), excitation noise, */
/*  and four sweepable complex resonances. */
/*					   */
/*  Measured Formant data (from me) is     */
/*  included, and enough data is there to  */
/*  support either parallel or cascade     */
/*  synthesis.  In the floating point case */
/*  cascade synthesis is the most natural  */
/*  so that's what you'll find here.       */
/*					   */
/*  For right now, there's a simple command*/
/*  line score interface consisting of 3   */
/*  letter symbols for the phonemes, =xx   */
/*  sets the pitch to x, + and - add and   */
/*  subtract a half step, and ... makes it */
/*  keep doing what it's doing for longer. */
/*******************************************/

typedef struct VOICF {
    OPDS         h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amp, *frequency;
    MYFLT	*phoneme, *formant;
    MYFLT	*vibf, *vibAmt;
    MYFLT	*ifn, *ivfn;

    MYFLT	oldform;
    int		ph;
    MYFLT	basef;
    SingWave	voiced;
    Noise	noise;
    Envelope	noiseEnv;
    FormSwep    filters[4];
    OnePole	onepole;
    OneZero	onezero;
} VOICF;

void make_VoicForm(VOICF*);
void VoicForm_clear(VOICF*);
void VoicForm_setPhoneme(VOICF*, int i, MYFLT s);
void VoicForm_setVoicedUnVoiced(VOICF*, MYFLT vGain, MYFLT nGain);
void VoicForm_noteOn(VOICF*, MYFLT freq, MYFLT amp);
void VoicForm_noteOff(VOICF*);

#endif
