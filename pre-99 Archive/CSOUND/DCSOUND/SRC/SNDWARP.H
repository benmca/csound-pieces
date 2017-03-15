

typedef struct {
	int    cnt, wsize, flag, section;
	MYFLT  ampincr, ampphs, offset;
} WARPSECTION;


typedef struct {
    OPDS    h;
    MYFLT   *r1, *r2, *xamp, *xtimewarp, *xresample, *isampfun, *ibegin,
            *iwsize, *irandw, *ioverlap, *ifn, *itimemode;
    FUNC    *ftpWind, *ftpSamp;
    long    maxFr, prFlg, flen, sampflen, nsections;
    int     chans, *frPtr, begin;
    WARPSECTION *exp;
    AUXCH   auxch;
    short   ampcode, timewarpcode, resamplecode;
} SNDWARP;

typedef struct {
    OPDS    h;
    MYFLT   *r1, *r2, *r3, *r4, *xamp, *xtimewarp, *xresample, *isampfun,
            *ibegin, *iwsize, *irandw, *ioverlap, *ifn, *itimemode;
    FUNC    *ftpWind,  *ftpSamp;
    long    maxFr, prFlg, flen, sampflen, nsections;
    int     chans, *frPtr, begin;
    WARPSECTION *exp;
    AUXCH   auxch;
    short   ampcode, timewarpcode, resamplecode;
} SNDWARPST;

