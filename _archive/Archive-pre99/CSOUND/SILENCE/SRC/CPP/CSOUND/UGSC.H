/* svfilter.h
 *
 * Copyright 1999, by Sean M. Costello
 *
 * svfilter is an implementation of Hal Chamberlin's state variable filter
 * algorithm, from "Musical Applications of Microprocessors" (Hayden Books,
 * Indianapolis, Indiana, 1985), 2nd. edition, pp. 489-492. It implements
 * a second-order resonant filter, with lowpass, highpass and bandpass
 * outputs.
 *
 */

typedef struct {
        OPDS h;
        MYFLT *low, *high, *band, *in, *kfco, *kq, *iscl;
        MYFLT ynm1, ynm2;
} SVF;


/* hilbert.h
 *
 * Copyright 1999, by Sean M. Costello
 *
 * hilbert is an implementation of an IIR Hilbert transformer.
 * The structure is based on two 6th-order allpass filters in
 * parallel, with a constant phase difference of 90 degrees
 * (+- some small amount of error) between the two outputs.
 * Allpass coefficients are calculated at i-time.
 */

typedef struct {
        OPDS h;
        MYFLT *out1, *out2, *in;
        MYFLT xnm1[12], ynm1[12], coef[12];
} HILBERT;


/* resonrz.h
 *
 * Copyright 1999, by Sean M. Costello
 *
 * resonr and resonz are implementations of second-order
 * bandpass resonators, with added zeroes in the transfer function.
 * The algorithms are based upon the work of Julius O. Smith and
 * John Stautner at Stanford, and Ken Steiglitz at Princeton.
 *
 */

typedef struct {
        OPDS h;
        MYFLT *out, *in, *kcf, *kbw, *iscl, *istor;
        MYFLT xnm1, xnm2, ynm1, ynm2;
        int scaletype, aratemod;
} RESONZ;

/* Structure for cascade of 2nd order allpass filters */
typedef struct {
        OPDS h;
        MYFLT *out, *in, *kbf, *kbw, *order, *mode, *ksep, *fbgain;
        int loop, modetype;
        MYFLT *nm1, *nm2, feedback;
        AUXCH aux1, aux2;
} PHASER2;

/* Structure for cascade of 1st order allpass filters*/
typedef struct {
        OPDS h;
        MYFLT *out, *in, *kcoef, *iorder, *fbgain, *istor;
        int loop;
        MYFLT *xnm1, *ynm1, feedback;
        AUXCH auxx, auxy;
} PHASER1;

/* Structure for lowpass filter */
typedef struct {
        OPDS h;
        MYFLT *out, *in, *kfco, *kres, *istor;
        MYFLT ynm1, ynm2;
} LP2;
