
/* spat3d, spat3di, and spat3dt - written by Istvan Varga, 2001 */

#ifndef CSOUND_SPAT3D_H
#define CSOUND_SPAT3D_H

#include "cs.h"

#ifdef CSOUND_SPAT3D_C	/* define these only when included from spat3d.c */

#define SPAT3D_SNDSPEED		FL(340.0)	/* sound speed		*/
#define SPAT3D_MAXAMP		FL(10.0)	/* amplitude at dist=0	*/

/* convert distance to delay		*/

#define SPAT3D_DIST2DEL(x)	((x) / SPAT3D_SNDSPEED)

/* convert distance to amplitude	*/

#define SPAT3D_DIST2AMP(x)	(FL(1.0) / ((FL(1.0) / SPAT3D_MAXAMP) + (x)))

/* calculate distance */

#define SPAT3D_XYZ2DIST(x,y,z)	((MYFLT) sqrt ((double) ((x) * (x) + (y) * (y) + (z) * (z))))

/* round to nearest integer */

#define SPAT3D_ROUND(x)		((x) + ((x) < FL(0.0) ? FL(-0.5) : FL(0.5)))

/* limit a number to a specified range */

#define SPAT3D_LIMIT(x, a, b)	((x) > (b) ? (b) : ((x) < (a) ? (a) : (x)))

typedef struct {
	void	*nextRefl[6];		/* pointers to next reflections	*/
					/* (NULL: no reflection)	*/
	int	init;			/* 1 at first k-cycle		*/
	int	cnum;			/* select coord. to transform:	*/
					/* -1: none, 0: X, 1: Y, 2: Z	*/
	MYFLT	Xc;			/* coord. offset		*/
	MYFLT	W0, X0, Y0, Z0;		/* W, X, Y, Z (Ll, Lh, Rl, Rh)	*/
	double	D0, D1;			/* delay			*/
	MYFLT	*yn;			/* output sound			*/
	MYFLT	scl;			/* reflection level		*/
	MYFLT	a0, a1, a2, b0, b1, b2;	/* EQ parameters		*/
	MYFLT	xnm1, xnm2, ynm1, ynm2;	/* EQ tmp data			*/
} SPAT3D_WALL;

/* ftable data:							*/
/*    0: early refl. recursion depth (for spat3d and spat3di)	*/
/*    1: late refl. recursion depth (for spat3dt)		*/
/*    2: max. delay (spat3d)					*/
/*    3: echo IR length (spat3dt)				*/
/*    4: unit circle / microphone distance			*/
/*    5: random seed (0 - 65535)				*/
/* 6-13: ceil reflection parameters				*/
/*	6: enable reflection (any non-zero value)		*/
/*	7: wall distance in meters				*/
/*	8: randomization of wall distance (1 / (wall dist.))	*/
/*	9: reflection level					*/
/*     10: EQ frequency (see pareq opcode)			*/
/*     11: EQ level						*/
/*     12: EQ Q							*/
/*     13: EQ mode						*/
/* 14-21: floor parameters					*/
/* 22-29: front wall parameters					*/
/* 30-37: back wall parameters					*/
/* 38-45: right wall parameters					*/
/* 46-53: left wall parameters					*/

#endif		/* CSOUND_SPAT3D_C */

/* opcode struct for spat3d, spat3di, and spat3dt */

typedef struct {		/* opcode args */
	OPDS	h;
	MYFLT	*args[14];			/* opcode arguments	     */
						/* (see spat3d.README)	     */
/*		spat3di		spat3d		spat3dt		*/
/*								*/
/*	 0	aW		aW		ioutft		*/
/*	 1	aX		aX		iX		*/
/*	 2	aY		aY		iY		*/
/*	 3	aZ		aZ		iZ		*/
/*	 4	ain		ain		idist		*/
/*	 5	iX		kX		ift		*/
/*	 6	iY		kY		imode		*/
/*	 7	iZ		kZ		irlen		*/
/*	 8	idist		idist		[iftnocl]	*/
/*	 9	ift		ift		-		*/
/*	10	imode		imode		-		*/
/*	11	[istor]		imdel		-		*/
/*	12	-		iovr		-		*/
/*	13	-		[istor]		-		*/
			/* internal variables  */
	int	o_num;	/* opcode (0: spat3di, 1: spat3d, 2: spat3dt	  */
	int	oversamp;		/* oversample ratio	(spat3d)  */
	int	zout;			/* output mode			  */
	MYFLT	mdist;			/* unit circle distance		  */
	MYFLT	*ftable;		/* ptr. to ftable		  */
	long	rseed;			/* random seed			  */
	int	mindep;			/* min. recursion depth		  */
	int	maxdep;			/* max. recursion depth		  */
	MYFLT	*outft;			/* ptr to output ftable	(spat3dt) */
	long	outftlnth;		/* output ftable length	(spat3dt) */
	int	irlen;			/* IR length		(spat3dt) */
	int	bs;			/* block size (ksmps or irlen)	  */
	MYFLT	mdel;			/* max. delay (in seconds)	  */
	long	mdel_s;			/* max. delay (in samples)	  */
	long	del_p;			/* read position in delay buffers */
	MYFLT	*Wb, *Xb, *Yb, *Zb;	/* delay buffers		  */
	int	*sample;		/* FIR filter data	(spat3d)  */
	MYFLT	*window;
	AUXCH	fltr;
	AUXCH	ws;			/* wall structure array		  */
	AUXCH	y;			/* tmp data			  */
	AUXCH	del;			/* delay buffer			  */
} SPAT3D;

#endif		/* CSOUND_SPAT3D_H */


