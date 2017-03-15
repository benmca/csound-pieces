/*                                                              UGENS3.H        */

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *xamp, *kcps, *xcar, *xmod, *kndx, *ifn, *iphs;
        long    mphs, cphs;
        short ampcod, carcod, modcod;
        FUNC    *ftp;
} FOSC;

typedef struct {
        OPDS    h;
        MYFLT   *ar1,*ar2,*xamp,*kcps,*ifn,*ibas,*imod1,*ibeg1,*iend1,*imod2,*ibeg2,*iend2;
        MYFLT   cpscvt;
        long    lphs;
        short   mod1, mod2;
        long    beg1, beg2;
        long    end1, end2;
        short   seg1, curmod, looping, stereo;
        FUNC    *ftp;
} LOSC;

typedef struct {
        short   tim;
        short   val;
} DUPLE;

typedef struct ptlptr {
        struct ptlptr *nxtp;
        DUPLE   *ap;
        DUPLE   *fp;
        short   amp,frq;
        long    phs;
} PTLPTR;

#define MAXPTLS 50    /* must agree with hetro.c */

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *kamod, *kfmod, *ksmod, *ifilcod, *dum;
        MEMFIL  *mfp;
        long    mksecs;
        AUXCH   aux;            /* PTLPTR  ptlptrs[MAXPTLS + 1]; make dynamic */
} ADSYN;
