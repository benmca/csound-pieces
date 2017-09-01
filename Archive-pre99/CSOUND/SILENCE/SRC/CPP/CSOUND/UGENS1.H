/*                                                                      UGENS1.H        */

typedef struct {
        OPDS    h;
        MYFLT   *xr, *ia, *idur, *ib;
        MYFLT   val, incr;
} LINE;

typedef struct {
        OPDS    h;
        MYFLT   *xr, *ia, *idur, *ib;
        MYFLT   val, mlt;
} EXPON;

typedef struct {
        long   cnt;
        MYFLT  val, mlt;
} XSEG;

typedef struct {
        long   cnt;
        MYFLT  nxtpt;
} SEG;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *argums[VARGMAX];
        SEG     *cursegp;
        long    nsegs;
        long    segsrem, curcnt;
        MYFLT   curval, curinc, curainc;
        AUXCH   auxch;
        long    xtra;
} LINSEG;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *argums[VARGMAX];
        SEG     *cursegp;
        long    segsrem, curcnt;
        MYFLT   curval, curmlt, curamlt;
        long    nsegs;
        AUXCH   auxch;
        long    xtra;
} EXPSEG;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *argums[VARGMAX];
        XSEG    *cursegp;
        long    segsrem, curcnt;
        MYFLT   curval, curmlt, curamlt;
        long    nsegs;
        AUXCH   auxch;
} EXXPSEG;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *sig, *iris, *idur, *idec;
        MYFLT   lin1, inc1, val, lin2, inc2;
        long    cnt1, cnt2;
} LINEN;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *sig, *iris, *idec, *iatdec;
        MYFLT   lin1, inc1, val, val2, mlt2;
        long    cnt1;
} LINENR;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *xamp, *irise, *idur, *idec, *ifn, *iatss;
        MYFLT   *iatdec, *ixmod;
        long    phs, ki, cnt1;
        MYFLT   val, mlt1, mlt2, asym;
        FUNC    *ftp;
} ENVLPX;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *xamp, *irise, *idec, *ifn, *iatss, *iatdec;
        MYFLT   *ixmod, *irind;
        long    phs, ki, rlsing, rlscnt, rindep;
        MYFLT   val, mlt1, mlt2, asym, atdec;
        FUNC    *ftp;
} ENVLPR;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *argums[VARGMAX];
        XSEG    *cursegp;
        long    nsegs;
        AUXCH   auxch;
} EXPSEG2;                         /*gab-A1*/
