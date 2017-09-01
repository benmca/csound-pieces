/*	vdelay, multitap, reverb2 coded by Paris Smaragdis		*/
/*	Berklee College of Music Csound development team		*/
/*	Copyright (c) December 1994.  All rights reserved		*/

typedef struct {
	OPDS	h;
	MYFLT	*sr, *ain, *adel, *imaxd, *istod;
	AUXCH	aux;
	long	left;
} VDEL;

typedef struct {
	OPDS	h;
	MYFLT	*sr1, *sr2, *sr3, *sr4;
	MYFLT	*ain1, *ain2, *ain3, *ain4, *adel, *imaxd, *iquality, *istod;
	AUXCH	aux1, aux2, aux3, aux4;
	int	interp_size;
	long	left;
} VDELXQ;

typedef struct {
	OPDS	h;
        MYFLT	*sr1, *sr2, *ain1, *ain2, *adel, *imaxd, *iquality, *istod;
	AUXCH	aux1, aux2;
	int	interp_size;
	long	left;
} VDELXS;

typedef struct {
	OPDS	h;
        MYFLT	*sr1, *ain1, *adel, *imaxd, *iquality, *istod;
	AUXCH	aux1;
	int	interp_size;
	long	left;
} VDELX;

typedef struct {
	OPDS	h;
	MYFLT	*sr, *ain, *ndel[VARGMAX];
	AUXCH	aux;
	long	left, max;
} MDEL;

#define	Combs	6
#define	Alpas	5

typedef struct	{
	OPDS	h;
	MYFLT	*out, *in, *time, *hdif, *istor;
	MYFLT	*cbuf_cur[Combs], *abuf_cur[Alpas];
	MYFLT	c_time[Combs], c_gain[Combs], a_time[Alpas], a_gain[Alpas];
	MYFLT	z[Combs], g[Combs];
        AUXCH	temp;
	AUXCH	caux[Combs], aaux[Alpas];
	MYFLT	prev_time, prev_hdif;
} STVB;

/*      nreverb coded by Paris Smaragdis 1994 and Richard Karpen 1998 */
#define	Combs	6
#define	Alpas	5
typedef struct	{
	OPDS	h;
	MYFLT	*out, *in, *time, *hdif, *istor;
	MYFLT	*cbuf_cur[Combs], *abuf_cur[Alpas];
	MYFLT	c_time[Combs], c_gain[Combs], a_time[Alpas], a_gain[Alpas];
	MYFLT	z[Combs], g[Combs];
        AUXCH	temp;
	AUXCH	caux[Combs], aaux[Alpas];
	MYFLT	prev_time, prev_hdif;
} NREV;

/* 
 * Based on nreverb coded by Paris Smaragdis 1994 and Richard Karpen 1998.
 * Changes made to allow user-defined comb and alpas constant in a ftable.
 * Sept 2000, by rasmus ekman.
 */
typedef struct	{
	OPDS	h;
	MYFLT	*out, *in, *time, *hdif, *istor;
	MYFLT	*inumCombs, *ifnCombs, *inumAlpas, *ifnAlpas;
	/* Used to be [Combs]- and [Alpas]-sized arrays */
	int     numCombs, numAlpas;
	MYFLT	**cbuf_cur, **abuf_cur;
	MYFLT	*c_time, *c_gain, *a_time, *a_gain;
	MYFLT	*c_orggains, *a_orggains;   
	MYFLT	*z, *g;    /* [Combs] */
	AUXCH	temp;
	AUXCH	*caux, *aaux;
	AUXCH	caux2, aaux2;  /* Used to hold space for all dynamized arrays */
	MYFLT	prev_time, prev_hdif;
} NREV2;
