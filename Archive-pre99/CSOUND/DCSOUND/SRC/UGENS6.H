/*									UGENS6.H	*/

typedef struct {
	OPDS	h;
	MYFLT	*kr, *asig, *ilen;
	int	len;
} DOWNSAMP;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *ksig;
} UPSAMP;

typedef struct {
	OPDS	h;
	MYFLT	*rslt, *xsig, *istor;
	MYFLT	prev;
} INDIFF;

typedef struct {
	OPDS	h;
	MYFLT	*xr, *xsig, *xgate, *ival, *istor;
	MYFLT	state;
	int	audiogate;
} SAMPHOLD;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *asig, *idlt, *istor;
	MYFLT	*curp;
	long	npts;
	AUXCH	auxch;
} DELAY;

typedef struct DELAYR {
	OPDS	h;
	MYFLT	*ar, *idlt, *istor;
	MYFLT	*curp;
	long	npts;
	AUXCH	auxch;
        struct DELAYR  *next_delayr; /* fifo for delayr pointers by Jens Groh */
} DELAYR;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *xdlt;
	DELAYR	*delayr;
} DELTAP;

typedef struct {
	OPDS	h;
	MYFLT	*asig;
	DELAYR	*delayr;
} DELAYW;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *asig, *istor;
	MYFLT	sav1;
} DELAY1;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *krvt, *ilpt, *istor, *insmps;
	MYFLT	coef, prvt, *pntr;
	AUXCH	auxch;
} COMB;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *krvt, *istor;
	MYFLT	c1, c2, c3, c4, c5, c6, prvt;
	MYFLT	*p1, *p2, *p3, *p4, *p5, *p6;
	MYFLT	*adr1, *adr2, *adr3, *adr4, *adr5, *adr6;
	AUXCH	auxch;
} REVERB;

typedef	struct {
	OPDS	h;
	MYFLT	*r1, *r2, *r3, *r4, *asig, *kx, *ky, *ifn, *imode, *ioffset;
	MYFLT	xmul;
	long	xoff;
	FUNC	*ftp;
} PAN;
