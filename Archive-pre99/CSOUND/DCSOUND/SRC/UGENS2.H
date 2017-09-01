/*								UGENS2.H	*/

typedef struct {
	OPDS	h;
	MYFLT	*sr, *xcps, *iphs;
	double	curphs;
} PHSOR;

typedef struct {
	OPDS	h;
	MYFLT	*rslt, *xndx, *xfn, *ixmode, *ixoff, *iwrap;
	MYFLT   offset;
	long	pfn; /* Previous function table number - used to
                        detect a change in table number when this is
                        supplied by a k rate input parameter. */
	long   	xbmul, wrap;
	FUNC	*ftp;
} TABLE;

typedef struct {
	OPDS	h;
	MYFLT	*rslt, *idel, *kamp, *idur, *ifn;
	long 	kinc, phs;
	long 	dcnt;
	FUNC	*ftp;
} OSCIL1;

typedef struct  {
	OPDS    h;
	MYFLT   *rslt, *kamp, *ifrq, *ifn, *itimes;
	MYFLT   index, inc, maxndx;
	long    ntimes;
	FUNC    *ftp;
} OSCILN;

typedef struct {
	OPDS	h;
	MYFLT	*sr, *xamp, *xcps, *ifn, *iphs;
	long	lphs;
	FUNC	*ftp;
} OSC;
