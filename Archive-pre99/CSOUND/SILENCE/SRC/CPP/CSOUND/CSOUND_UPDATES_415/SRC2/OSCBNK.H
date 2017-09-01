
/* ---- oscbnk, grain2, and grain3 - written by Istvan Varga, 2001 ---- */

#ifndef CSOUND_OSCBNK_H
#define CSOUND_OSCBNK_H

#define OSCBNK_PHSMAX	0x80000000UL	/* max. phase	*/
#define OSCBNK_PHSMSK	0x7FFFFFFFUL	/* phase mask	*/
#define OSCBNK_RNDPHS	0		/* 31 bit rand -> phase bit shift */

/* convert floating point phase value to integer */

#define OSCBNK_PHS2INT(x)						    \
	(((x) < FL(0.0) ?						    \
	  (unsigned long) ((long) ((x) * (MYFLT) OSCBNK_PHSMAX - FL(0.5)))  \
	  : (unsigned long) ((x) * (MYFLT) OSCBNK_PHSMAX + FL(0.5)))	    \
	 & OSCBNK_PHSMSK)

/* oscbnk types */

typedef struct {
	unsigned long	LFO1phs;	/* LFO 1 phase			*/
	MYFLT	LFO1frq;		/* LFO 1 frequency (0-1)	*/
	unsigned long	LFO2phs;	/* LFO 2 phase			*/
	MYFLT	LFO2frq;		/* LFO 2 frequency (0-1)	*/
	unsigned long	osc_phs;	/* main oscillator phase	*/
	MYFLT	osc_phm;		/* phase mod.			*/
	MYFLT	osc_frq, osc_amp;	/* osc. freq. / sr, amplitude	*/
	MYFLT	xnm1, xnm2, ynm1, ynm2;	/* EQ tmp data			*/
	MYFLT	a0, a1, a2, b0, b1, b2;	/* EQ coeffs saved for interp.	*/
} OSCBNK_OSC;

typedef struct {
	OPDS	h;
	MYFLT	*args[27];		/* opcode args (see manual)	*/
	int	init_k;			/* 1st k-cycle (0: no, 1: yes)	*/
	int	nr_osc;			/* number of oscillators	*/
	long	seed;			/* random seed			*/
	int	ilfomode, ieqmode;	/* LFO and EQ mode		*/
	int	eq_interp;		/* enable filter coeff. interp.	*/
	MYFLT	frq_scl;		/* constants for calculating	*/
	MYFLT	lf1_scl, lf1_ofs;	/* k-rate parameters		*/
	MYFLT	lf2_scl, lf2_ofs;
	MYFLT	eqo_scl, eqo_ofs;
	MYFLT	eql_scl, eql_ofs;
	MYFLT	eqq_scl, eqq_ofs;
	MYFLT	*l1t, l1t_pfrac;	/* LFO 1 ftable			*/
	unsigned long	l1t_mask, l1t_lobits;
	MYFLT	*l2t, l2t_pfrac;	/* LFO 2 ftable			*/
	unsigned long	l2t_mask, l2t_lobits;
	MYFLT	*eqft;			/* EQ frequency table		*/
	long	eqft_len;
	MYFLT	*eqlt;			/* EQ level table		*/
	long	eqlt_len;
	MYFLT	*eqqt;			/* EQ Q table			*/
	long	eqqt_len;
	MYFLT	*tabl;			/* parameter input table	*/
	long	tabl_len;		/* (optional)			*/
	MYFLT	*outft;			/* parameter output table	*/
	long	outft_len;		/* (optional)			*/
	long	tabl_cnt;		/* current param in table	*/
	AUXCH	auxdata;
	OSCBNK_OSC	*osc;		/* oscillator array		*/
} OSCBNK;

/* grain2 types */

typedef struct {
	unsigned long	grain_phs;	/* grain phase			*/
	unsigned long	grain_frq_int;	/* grain frequency (integer)	*/
	MYFLT		grain_frq_flt;	/* grain frequency (float)	*/
	unsigned long	window_phs;	/* window phase			*/
} GRAIN2_OSC;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *kcps, *kfmd;	/* opcode args			*/
	MYFLT	*kgdur, *iovrlp;
	MYFLT	*kfn, *iwfn, *irpow;
	MYFLT	*iseed, *imode;
	int	init_k;			/* 1st k-cycle (0: no, 1: yes)	*/
	int	mode;			/* imode (see manual)		*/
	int	nr_osc;			/* number of oscillators	*/
	long	seed;			/* random seed			*/
	int	rnd_mode;		/* random distribution params	*/
	MYFLT	rnd_pow;
	MYFLT	grain_frq, frq_scl;	/* grain frequency		*/
	MYFLT	*wft, wft_pfrac;	/* window table			*/
	unsigned long	wft_lobits, wft_mask;
	AUXCH	auxdata;
	GRAIN2_OSC	*osc;		/* oscillator array		*/
} GRAIN2;

/* -------- grain3 types -------- */

typedef struct {
	OPDS	h;
	MYFLT	*ar, *kcps, *kphs;	/* opcode args			*/
	MYFLT	*kfmd, *kpmd;
	MYFLT	*kgdur, *kdens;
	MYFLT	*imaxovr, *kfn, *iwfn;
	MYFLT	*kfrpow, *kprpow;
	MYFLT	*iseed, *imode;
	int	init_k;			/* 1st k-cycle (0: no, 1: yes)	*/
	int	mode;			/* imode (see manual)		*/
	int	ovrlap;			/* max. number of oscillators	*/
	long	seed;			/* random seed			*/
	int	f_rnd_mode;		/* random distribution (freq.)	*/
	MYFLT	f_rnd_pow;
	int	p_rnd_mode, pm_wrap;	/* random distribution (phase)	*/
	MYFLT	p_rnd_pow;
	unsigned long	grain_frq;	/* grain frequency		*/
	MYFLT	frq_scl;
	MYFLT	phs0;			/* prev. kphs value for interp.	*/
	unsigned long	x_phs;
	MYFLT	*wft, wft_pfrac;	/* window table			*/
	unsigned long	wft_lobits, wft_mask;
	AUXCH	auxdata;
	unsigned long	*phase;		/* grain phase offset		*/
	GRAIN2_OSC	*osc;		/* oscillator array		*/
	GRAIN2_OSC	*osc_start;	/* first active grain		*/
	GRAIN2_OSC	*osc_end;	/* last active grain + 1	*/
	GRAIN2_OSC	*osc_max;	/* ptr to last osc in array	*/
} GRAIN3;

/* -------- rnd31 types -------- */

typedef struct {
	OPDS	h;		/* opcode args		*/
	MYFLT	*out;			/* output signal		*/
	MYFLT	*scl;			/* scale			*/
	MYFLT	*rpow;			/* distribution			*/
	MYFLT	*iseed;			/* seed				*/
				/* internal variables	*/
	long	seed;			/* random seed			*/
} RND31;

#endif		/* CSOUND_OSCBNK_H */

