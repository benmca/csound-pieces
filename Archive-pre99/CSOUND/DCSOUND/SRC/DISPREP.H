        		/*					DISPREP.H	*/

typedef struct {
	OPDS	h;
	MYFLT	*iargs[VARGMAX];
} PRINTV;

typedef struct {
	OPDS	h;
	MYFLT	*signal, *iprd, *inprds, *iwtflg;
	long	npts, nprds, bufpts, totpts, pntcnt;
	WINDAT  dwindow;
	MYFLT	*nxtp, *begp, *endp;
	AUXCH	auxch;
} DSPLAY;

#define	WINDMAX	4096
#define WINDMIN 16

typedef struct {
	OPDS	h;
	MYFLT	*signal, *iprd, *inpts, *ihann, *idbout, *iwtflg;
	MYFLT	sampbuf[WINDMAX], *bufp, *endp, *fftlut, overN;
	long	windsize, overlap, ncoefs;
	int	hanning, dbout;
	WINDAT  dwindow;
	AUXCH	auxch;
} DSPFFT;

typedef struct {
	OPDS	h;
	MYFLT	*kout,*kin,*iprd,*imindur,*imemdur,*ihp,*ithresh,*ihtim,*ixfdbak;
	MYFLT   *istartempo,*ifn,*idisprd,*itweek;
	int     countdown, timcount, npts, minlam, maxlam;
	MYFLT	*hbeg, *hcur, *hend;
	MYFLT	*xbeg, *xcur, *xend;
	MYFLT	*stmemp, *linexp, *ftable, *xscale, *lmults;
	short   *lambdas;
	MYFLT   *stmemnow, ncross, coef0, coef1, yt1, thresh;
	MYFLT   fwdcoef, fwdmask, xfdbak, avglam, tempscal, tempo, tweek;
	int     dcntdown, dtimcnt;
	WINDAT  dwindow;
	AUXCH	auxch;
} TEMPEST;

