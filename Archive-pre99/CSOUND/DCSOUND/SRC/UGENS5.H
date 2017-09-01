#include "lpc.h"	/*						UGENS5.H	*/

typedef	struct {
	OPDS	h;
	MYFLT	*kr, *ksig, *ihtim, *isig;
	MYFLT	c1, c2, yt1;
} PORT;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *asig, *khp, *istor;
	MYFLT	c1, c2, yt1, prvhp;
} TONE;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kcf, *kbw, *iscl, *istor;
	int     scale;
	MYFLT	c1, c2, c3, yt1, yt2, cosf, prvcf, prvbw;
} RESON;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *asig, *khp, *ord, *istor;
	MYFLT	c1, c2, *yt1, prvhp;
	int loop;
        AUXCH	aux;
} TONEX;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kcf, *kbw, *ord, *iscl, *istor;
	int     scale, loop;
	MYFLT	c1, c2, c3, *yt1, *yt2, cosf, prvcf, prvbw;
        AUXCH	aux;
} RESONX;

typedef struct {
	OPDS	h;
	MYFLT	*krmr, *krmo, *kerr, *kcps, *ktimpt, *ifilno, *inpoles, *ifrmrate;
	long	headlongs, npoles, nvals, lastfram16, lastmsg;
	MYFLT	kcoefs[MAXPOLES*2], framrat16;
	int	storePoles ;
	MEMFIL	*mfp;
} LPREAD;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig;
	MYFLT	circbuf[MAXPOLES<<1], *circjp, *jp2lim;
	LPREAD	*lpread;
} LPRESON;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kfrqratio;
	MYFLT	past[MAXPOLES], prvratio, d, prvout;
	LPREAD	*lpread;
} LPFRESON;

typedef	struct {
	OPDS	h;
	MYFLT	*kr, *asig, *ihp, *istor;
	MYFLT	c1, c2, prvq;
} RMS;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *krms, *ihp, *istor;
	MYFLT	c1, c2, prvq, prva;
} GAIN;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *csig, *ihp, *istor;
	MYFLT	c1, c2, prvq, prvr, prva;
} BALANCE;

typedef struct {
	OPDS	h;
	MYFLT   *islotnum ; /* Assume sizeof(int)== sizeof(MYFLT) */
} LPSLOT ;

typedef struct {
	OPDS	h; 
	MYFLT   *islot1 ; 
	MYFLT   *islot2 ; /* Assume sizeof(pointer)== sizeof(MYFLT) */
	MYFLT   *kmix  ;
	MYFLT	*fpad[5]; /* Pad for kcoef correctly put (Mighty dangerous) */
	long    lpad,npoles ;
	LPREAD  *lp1,*lp2 ;
	long	lastmsg;
	MYFLT	kcoefs[MAXPOLES*2], framrat16;
	int		storePoles ;
} LPINTERPOL ;
