#include "cs.h"         /*                                      DISPREP.C       */
#include <math.h>
#include "cwindow.h"
#include "disprep.h"
#include "fft.h"
#include "dsputil.h"

static  MYFLT   *fftcoefs = NULL;     /* malloc for fourier coefs, mag or db */

void printv(PRINTV *p)
{
        int    nargs = p->INOCOUNT;
        char   *txtp = p->STRARG;
        MYFLT  **valp = p->iargs;

        printf("instr %d:", p->h.insdshead->insno);
        while (nargs--) {
            printf("  %s = %5.3f", txtp, **valp++);
            while (*txtp++);
        }
        printf("\n");
}

void dspset(DSPLAY *p)
{
        long   npts, nprds, bufpts, totpts;
        char   *auxp;

        if (p->h.optext->t.intype == 'k')
            npts = (long)(*p->iprd * ekr);
        else npts = (long)(*p->iprd * esr);
        if (npts <= 0) {
            initerror(Str(X_863,"illegal iprd"));
            return;
        }
        if ((nprds = (long)*p->inprds) <= 1) {
            nprds = 0; 
            bufpts = npts;
            totpts = npts;
        }
        else {
            bufpts = npts * nprds;
            totpts = bufpts * 2;
        }
        if ((auxp = p->auxch.auxp) == NULL || totpts != p->totpts) {
            auxalloc(totpts * sizeof(MYFLT), &p->auxch);
            auxp = p->auxch.auxp;
            p->begp = (MYFLT *) auxp;
            p->endp = p->begp + bufpts;
            p->npts = npts;
            p->nprds = nprds;
            p->bufpts = bufpts;
            p->totpts = totpts;
        }
        p->nxtp = (MYFLT *) auxp;
        p->pntcnt = npts;
        sprintf(strmsg,Str(X_932,"instr %d, signal %s:"), p->h.insdshead->insno, p->STRARG);
        dispset(&p->dwindow,(MYFLT *)auxp,bufpts,strmsg,(int)*p->iwtflg,Str(X_703,"display"));
}

void kdsplay(DSPLAY *p)
{
        MYFLT  *fp = p->nxtp;

        if (p->auxch.auxp==NULL) { /* RWD fix */
          initerror(Str(X_704,"display: not initialized"));
          return;
        }
        if (!p->nprds) {
            *fp++ = *p->signal;
            if (fp >= p->endp) {
                fp = p->begp;
                display(&p->dwindow);
            }
        }
        else {
            MYFLT *fp2 = fp + p->bufpts;
            *fp++ = *p->signal;
            *fp2 = *p->signal;
            if (!(--p->pntcnt)) {
                p->pntcnt = p->npts;
                if (fp >= p->endp) {
                    fp = p->begp;
                    fp2 = fp + p->bufpts;
                }
                p->dwindow.fdata = fp;  /* display from fp */
                display(&p->dwindow);
            }
        }           
        p->nxtp = fp;
}

void dsplay(DSPLAY *p)
{
         MYFLT  *fp = p->nxtp, *sp = p->signal, *endp = p->endp;
         int    nsmps = ksmps;

        if (!p->nprds) {
            do {
                *fp++ = *sp++;
                if (fp >= endp) {
                    fp = p->begp;
                    display(&p->dwindow);
                }
            } while (--nsmps);
        }
        else {
            MYFLT *fp2 = fp + p->bufpts;
            do {
                *fp++ = *sp;
                *fp2++ = *sp++;
                if (!(--p->pntcnt)) {
                    p->pntcnt = p->npts;
                    if (fp >= endp) {
                        fp = p->begp;
                        fp2 = fp + p->bufpts;
                    }
                    p->dwindow.fdata = fp;  /* display from fp */
                    display(&p->dwindow);
                }
            } while (--nsmps);
        }           
        p->nxtp = fp;
}

void fftset(DSPFFT *p)          /* fftset, dspfft -- calc Fast Fourier */
                                /* Transform of collected samples and  */
                                /* displays coefficients (mag or db)   */
{
        long  window_size, step_size;
        int   hanning;

        window_size = (long)*p->inpts;
        if (window_size > WINDMAX)  initerror(Str(X_1292,"too many points requested"));
        if (window_size < WINDMIN)  initerror(Str(X_1285,"too few points requested"));
        if (!IsPowerOfTwo(window_size))
            initerror(Str(X_1379,"window size must be power of two"));
        if (p->h.optext->t.intype == 'k')
            step_size = (long)(*p->iprd * ekr);
        else step_size = (long)(*p->iprd * esr);
        if (step_size <= 0)
            initerror(Str(X_863,"illegal iprd"));
        if (inerrcnt)
            return;
        hanning = (int)*p->ihann;
        p->dbout   = (int)*p->idbout;
        p->overlap = window_size - step_size;
        if (window_size != p->windsize
            || hanning != p->hanning) {              /* if windowing has changed:  */
          long auxsiz;
          MYFLT *hWin;
          p->windsize = window_size;                   /* set new parameter values */
          p->hanning = hanning;
          p->bufp    = p->sampbuf;
          p->endp    = p->bufp + window_size;
          p->overN    = FL(1.0)/(*p->inpts);
          p->ncoefs  = window_size >>1;
          auxsiz = (window_size/2 + 1) * sizeof(MYFLT);    /* size for half window */
          auxalloc((long)auxsiz, &p->auxch);               /*  alloc or realloc */
          hWin = (MYFLT *) p->auxch.auxp;
          FillHalfWin(hWin, window_size, FL(1.0), hanning); /* fill with proper values */
          p->fftlut = (MYFLT *)AssignBasis((complex *)NULL,window_size); /*lookup tbl*/
          if (fftcoefs == NULL)            /* room for WINDMAX*2 floats (fft size) */
            fftcoefs = (MYFLT *) mmalloc((long)WINDMAX * 2 * sizeof(MYFLT));
          sprintf(strmsg,Str(X_931,"instr %d, signal %s, fft (%s):"),p->h.insdshead->insno,
                p->STRARG, p->dbout ? Str(X_681,"db") : Str(X_985,"mag"));
          dispset(&p->dwindow,fftcoefs,p->ncoefs,strmsg,(int)*p->iwtflg,Str(X_761,"fft"));
        }
}

static void d_fft(      /* perform an FFT as reqd below */
  MYFLT *sce,   /* input array - pure packed real */
  MYFLT *dst,   /* output array - packed magnitude, only half-length */
  long  size,   /* number of points in input */
  MYFLT *lut,   /* look up table for FFT - already set up */
  MYFLT *hWin,  /* hanning window lookup table */
  int   dbq)    /* flag: 1-> convert output into db */
{
        CopySamps(sce,dst,size);        /* copy into scratch buffer */
        ApplyHalfWin(dst,hWin,size);
        UnpackReals(dst,size);          /* expand out size to re,0,re,0 etc */
        FFT2real((complex *)dst,size,1,(complex *)lut); /* perform the FFT */
        Rect2Polar(dst, size);
        PackReals(dst, size);
        if (dbq)
            Lin2DB(dst, size);
}

void kdspfft(DSPFFT *p)
{
        MYFLT *bufp = p->bufp, *endp = p->endp;

        if (p->auxch.auxp==NULL) { /* RWD fix */
          initerror(Str(X_702,"dispfft: not initialized"));
          return;
        }
        if (bufp < p->sampbuf)          /* skip any spare samples */
            bufp++;
        else {                          /* then start collecting  */
            *bufp++ = *p->signal;
            if (bufp >= endp) {         /* when full, do fft:     */
                MYFLT *tp, *tplim;
                MYFLT *hWin = (MYFLT *) p->auxch.auxp;
                d_fft(p->sampbuf,fftcoefs,p->windsize,p->fftlut,hWin,p->dbout);
                tp = fftcoefs;
                tplim = tp + p->ncoefs;
                do  *tp *= p->overN;            /* scale 1/N */
                while (++tp < tplim);
                display(&p->dwindow);           /* & display */
                if (p->overlap > 0) {
                    bufp = p->sampbuf;
                    tp   = endp - p->overlap;
                    do *bufp++ = *tp++;
                    while(tp < endp);
                }
                else bufp = p->sampbuf + p->overlap;
            }
        }
        p->bufp = bufp;
}

void dspfft(DSPFFT *p)
{
        MYFLT *sigp = p->signal, *bufp = p->bufp, *endp = p->endp;
        int   nsmps = ksmps;

        if (p->auxch.auxp==NULL) {
          initerror(Str(X_702,"dispfft: not initialized"));
          return;
        }
        do {
            if (bufp < p->sampbuf) {            /* skip any spare samples */
                bufp++; sigp++;
            }
            else {                              /* then start collecting  */
                *bufp++ = *sigp++;
                if (bufp >= endp) {             /* when full, do fft:     */
                    MYFLT *tp, *tplim;
                    MYFLT *hWin = (MYFLT *) p->auxch.auxp;
                    d_fft(p->sampbuf,fftcoefs,p->windsize,p->fftlut,hWin,p->dbout);
                    tp = fftcoefs;
                    tplim = tp + p->ncoefs;
                    do  *tp *= p->overN;                /* scale 1/N */
                    while (++tp < tplim);
                    display(&p->dwindow);               /* & display */
                    if (p->overlap > 0) {
                        bufp = p->sampbuf;
                        tp   = endp - p->overlap;
                        do *bufp++ = *tp++;
                        while(tp < endp);
                    }
                    else bufp = p->sampbuf + p->overlap;
                }
            }
        }
        while (--nsmps);
        p->bufp = bufp;
}

#define NTERMS  4
#define NCROSS  (NTERMS * (NTERMS-1))

void tempeset(TEMPEST *p)
{
        int  npts, nptsm1, minlam, maxlam, lamspan, auxsiz;
        MYFLT *fltp;
        FUNC *ftp;
        MYFLT b, iperiod = *p->iprd;

        if ((p->timcount = (int)(ekr * iperiod)) <= 0)  initerror(Str(X_862,"illegal iperiod"));
        if ((p->dtimcnt = (int)(ekr * *p->idisprd)) < 0)initerror(Str(X_851,"illegal idisprd"));
        if ((p->tweek = *p->itweek) <= 0)          initerror(Str(X_865,"illegal itweek"));
        if (iperiod != 0.) {
            if ((minlam = (int)(*p->imindur/iperiod)) <= 0) initerror(Str(X_855,"illegal imindur"));
            if ((npts = (int)(*p->imemdur / iperiod)) <= 0) initerror(Str(X_854,"illegal imemdur"));
        }
        if (*p->ihtim <= 0.)       initerror(Str(X_853,"illegal ihtim"));
        if (*p->istartempo <= 0.)  initerror(Str(X_884,"illegal startempo"));
        ftp = ftfind(p->ifn);
        if (ftp != NULL && *ftp->ftable == 0.) initerror(Str(X_835,"ifn table begins with zero"));
        if (inerrcnt)
           return;                                  /* if errors so far, return */
        nptsm1 = npts - 1;
        if (npts != p->npts || minlam != p->minlam) {
            p->npts = npts;
            p->minlam = minlam;
            p->maxlam = maxlam = nptsm1/(NTERMS-1);
            lamspan = maxlam - minlam + 1;          /* alloc 8 bufs: 2 circ, 6 lin */
            auxsiz = (npts * 5 + lamspan * 3) * sizeof(MYFLT);
            auxalloc((long)auxsiz, &p->auxch);
            fltp = (MYFLT *) p->auxch.auxp;
            p->hbeg = fltp;     fltp += npts;
            p->hend = fltp;
            p->xbeg = fltp;     fltp += npts;
            p->xend = fltp;
            p->stmemp = fltp;   fltp += npts;
            p->linexp = fltp;   fltp += npts;
            p->ftable = fltp;   fltp += npts;
            p->xscale = fltp;   fltp += lamspan;
            p->lmults = fltp;   fltp += lamspan;
            p->lambdas = (short *) fltp;
            p->stmemnow = p->stmemp + nptsm1;
        }
        if (p->dtimcnt && !(p->dwindow.windid)) {      /* init to display stmem & exp */
            sprintf(strmsg, "instr %d tempest:", p->h.insdshead->insno);
            dispset(&p->dwindow,p->stmemp,(long)npts*2,strmsg,0,Str(X_1275,"tempest"));
            p->dwindow.danflag = 1;                    /* for mid-scale axis */
        }
        {
            MYFLT *funp = ftp->ftable;
            long phs = 0;
            long inc = (long)PHMASK / npts;
            long nn, lobits = ftp->lobits;
            for (fltp=p->hbeg, nn=npts*4; nn--; )      /* clr 2 circ & 1st 2 lin bufs */
                *fltp++ = FL(0.0);                   
            for (fltp=p->ftable+npts, nn=npts; nn--; ) {    /* now sample the ftable  */
                *--fltp = *(funp + (phs >> lobits));        /* backwards into tbl buf */
                phs += inc;
            }
        }
        {
            MYFLT *tblp, sumraw, sumsqr;      /* calc the CROSS prod scalers */
            long terms;
            long lambda, maxlam;
            MYFLT crossprods, RMS, *endtable = p->ftable + nptsm1;
/*            MYFLT coef, log001 = -6.9078; */
            MYFLT *xscale = p->xscale;

            p->ncross = (MYFLT) NCROSS;
            for (lambda=p->minlam,maxlam=p->maxlam; lambda <= maxlam; lambda++) {
                tblp = endtable;
                sumraw = *tblp;
                sumsqr = *tblp * *tblp;
                terms = NTERMS - 1;
                do {
                    tblp -= lambda;
                    sumraw += *tblp;
                    sumsqr += *tblp * *tblp;
                } while (--terms);
                crossprods = sumraw * sumraw - sumsqr;
                RMS = (MYFLT) sqrt(crossprods / p->ncross);
/*              coef = exp(log001 * lambda / npts);
                *xscale++ = coef / RMS / (NTERMS - 1);  */
                *xscale++ = FL(0.05)/ RMS / lambda;
            }
        }
        b = FL(2.0) - (MYFLT)cos((*p->ihp * 6.28318 / ekr));  /* calc input lo-pass filter coefs */
        p->coef1 = b - (MYFLT)sqrt(b * b - 1.0);
        p->coef0 = FL(1.0) - p->coef1;
        p->yt1 = FL(0.0);
        p->fwdcoef = (MYFLT)pow(0.5, p->timcount/ekr/(*p->ihtim));
        p->fwdmask = FL(0.0);
  printf(Str(X_958,"kin lopass coef1 %6.4f, fwd mask coef1 %6.4f\n"), p->coef1,p->fwdcoef);
        p->thresh = *p->ithresh;            /* record incoming loudness threshold */
        p->xfdbak = *p->ixfdbak;            /*    & expectation feedback fraction */
        p->tempscal = FL(60.0) * ekr / p->timcount;
        p->avglam = p->tempscal / *p->istartempo;       /* init the tempo factors */
        p->tempo = FL(0.0);
        p->hcur = p->hbeg;                              /* init the circular ptrs */
        p->xcur = p->xbeg;
        p->countdown = p->timcount;                     /* & prime the countdowns */
        p->dcntdown = p->dtimcnt;
}

#define NMULTS 5
static MYFLT lenmults[NMULTS] = { FL(3.0), FL(2.0), FL(1.0), FL(0.5), FL(0.333)};
static MYFLT lenfracs[NMULTS*2] = { FL(0.30), FL(0.3667), FL(0.45), FL(0.55),
                                    FL(0.92), FL(1.08), FL(1.88), FL(2.12),
                                    FL(2.85), FL(3.15) };

void tempest(TEMPEST *p)
{
        p->yt1 = p->coef0 * *p->kin + p->coef1 * p->yt1;  /* get lo-pass of kinput */

        if (p->auxch.auxp==NULL) { /* RWD fix */
          initerror(Str(X_1276,"tempest: not initialized"));
          return;
        }
        if (!(--p->countdown)) {                          /* then on countdown:    */
            MYFLT *memp;
            MYFLT kin, expect, *xcur = p->xcur;           /* xcur from prv pass    */
            MYFLT lamtot = FL(0.0), weightot = FL(0.0);

            p->countdown = p->timcount;           /* reset the countdown            */
            expect = *xcur;                       /* get expected val from prv calc */
            *xcur++ = FL(0.0);                         /*    & clear the loc it occupied */
            if (xcur >= p->xend) xcur = p->xbeg;  /* xcur now points to cur xarray  */
            p->xcur = xcur;
            if ((kin = *p->kin - p->yt1) < FL(0.0))  kin = FL(0.0);  /* ignore input below lopass */
            {
                MYFLT *hcur = p->hcur;
                MYFLT *hend = p->hend;
                MYFLT *tblp = p->ftable;
                long  wrap;
                *hcur++ = kin + expect * p->xfdbak;   /* join insample & expect val */
                if (hcur < hend)  p->hcur = hcur;     /* stor pntr for next insamp  */
                else p->hcur = p->hbeg;
                wrap = hcur - p->hbeg;
                memp = p->stmemp;
                while (hcur < hend)                   /* now lineariz & envlp hbuf */
                    *memp++ = *hcur++ * *tblp++;      /*  into st_mem buf          */
                for (hcur=p->hbeg; wrap--; )
                    *memp++ = *hcur++ * *tblp++;
            }
            if (p->yt1 > p->thresh            /* if lo-pass of kinput now significant */
              && kin > p->fwdmask) {          /*    & kin > masking due to prev kin   */
                MYFLT sumraw, sumsqr;
                long lambda, minlam, maxlam;
                int  terms, nn, npts = p->npts;
                MYFLT mult, crossprods, RMScross, RMStot, unilam, rd;
                MYFLT *xend = p->xend;
/*                MYFLT *xscale = p->xscale; */
                MYFLT *mults, *fracs, *mulp;
                short minlen, maxlen, *lenp, *endlens;

                for (memp=p->stmemp,nn=npts,sumsqr=FL(0.0); nn--; memp++)
                    sumsqr += *memp * *memp;
                RMStot = (MYFLT)sqrt(sumsqr/npts);
/*        printf("RMStot = %6.1f\n",RMStot);    */
                mults = lenmults;                       /* use the static lentables  */
                fracs = lenfracs;
                mulp = p->lmults;
                lenp = p->lambdas;
                minlam = p->minlam;
                maxlam = p->maxlam;
                nn = NMULTS;
                do {
                    mult = *mults++;
                    minlen = (short)(p->avglam * *fracs++); /* & the current avglam  */
                    maxlen = (short)(p->avglam * *fracs++);
                    if (minlen >= minlam && maxlen <= maxlam)
                        do {
                            *lenp++ = minlen++;         /*   creat lst of lambda lens */
                            *mulp++ = mult;             /*   & their unit multipliers */
                        } while (minlen <= maxlen);
                } while (--nn);
                endlens = lenp;                         /* now for these lambda lens: */
                for (lenp=p->lambdas,mulp=p->lmults; lenp < endlens; ) {
                    lambda = *lenp++;
                    mult = *mulp++;
                    memp = p->stmemnow;
                    sumraw = *memp;
                    sumsqr = *memp * *memp;             /* autocorrelate the st_mem buf */
                    terms = NTERMS - 1;
                    do {
                        memp -= lambda;
                        sumraw += *memp;
                        sumsqr += *memp * *memp;
                    } while (--terms);
                    crossprods = sumraw * sumraw - sumsqr;
                    RMScross = (MYFLT)sqrt(crossprods / p->ncross);
                    if (RMScross < FL(1.4) * RMStot)         /* if RMScross significant:   */
                        continue;
/*   printf("RMScross = %6.1f, lambda = %ld\n", RMScross, lambda  );  */
/*                  RMS *= *xscale++;     */
                    unilam = lambda * mult;               /*    get unit lambda implied */
                    lamtot += unilam * RMScross;          /*    & add weighted to total */
                    weightot += RMScross;
/*    printf("lambda %d, unilam %6.2f, RMScross %6.2f\n", lambda, unilam, RMScross);  */
                    RMScross /= FL(5.0);
                    memp = xcur - 1;                /* multiply project into expect buf */
                    for (terms=1; terms < NTERMS; ++terms) {
                        if ((memp += (lambda-terms+1)) >= xend)
                            memp -= npts;
                        for (nn=terms,rd=RMScross/terms; nn--; ) {
                            *memp++ += rd;
                            if (memp >= xend)
                                memp -= npts;
                        }
                    }
                }
            }
            if (weightot) {                                     /* if accumed weights, */
                p->avglam = (p->avglam + lamtot/weightot)/FL(2.0); /*   update the avglam */
                p->avglam /= p->tweek;
                p->tempo = p->tempscal / p->avglam;             /*   & cvt to tempo    */
/*       printf("lamtot %6.2f, weightot %6.2f, newavglam %6.2f, tempo %6.2f\n",
              lamtot, weightot, p->avglam, p->tempo);    */
/*       printf("%6.1f\n",p->tempo);  */
         fputc('.', stderr);  
            }
            else p->tempo = FL(0.0);                               /* else tempo is 0     */
            p->fwdmask = p->fwdmask * p->fwdcoef + kin;
        }
        if (!(--p->dcntdown)) {                 /* on display countdown    */
            MYFLT *linp = p->linexp;
            MYFLT *xcur = p->xcur;
            MYFLT *xend = p->xend;
            long wrap = xcur - p->xbeg;
            while (xcur < xend)                   /* lineariz the circ xbuf */
                *linp++ = *xcur++;                /*  into linexp buf       */
            for (xcur=p->xbeg; wrap--; )
                *linp++ = *xcur++;
            display(&p->dwindow);                 /* display double window  */
            p->dcntdown = p->dtimcnt;             /*   & reset the counter  */
        }
        *p->kout = p->tempo;                      /* put current tempo */
}
