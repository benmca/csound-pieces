#include "cs.h"         /*                              UGENS5.C        */
#include "ugens5.h"
#include <math.h>
#include "oload.h"
#include <string.h>

/*
 * LPC storage slots
 */

static  int     currentLPCSlot=0 ;
#define MAX_LPC_SLOT 20

static  LPREAD  *lprdadr[MAX_LPC_SLOT];
static  char    lpfilname[MAXNAME];

void lpcRESET(void)
{
    int i;
    currentLPCSlot = 0;
    for (i=0;i<MAX_LPC_SLOT;i++)
      lprdadr[i] = NULL;
    memset(lpfilname,0,MAXNAME*sizeof(char));
}

void porset(PORT *p)
{
    p->c2 = (MYFLT)pow(0.5, (double)onedkr / *p->ihtim);
    p->c1 = FL(1.0) - p->c2;
    if (*p->isig >= FL(0.0))
      p->yt1 = *p->isig;
}

/* void porset(PORT *p) */
/* { */
/*      p->c2 = pow((double).5, (double)onedkr / *p->ihtim); */
/*      p->c1 = 1. - p->c2; */
/*      if (*p->isig >= 0) */
/*          p->yt1 = *p->isig; */
/* } */

void port(PORT *p)
{
    *p->kr = p->yt1 = p->c1 * *p->ksig + p->c2 * p->yt1;
}

void tonset(TONE *p)
{
    {
      double b;
      p->prvhp = *p->khp;
      b = 2.0 - cos((double)(p->prvhp * tpidsr));
      p->c2 = (MYFLT)(b - sqrt(b * b - 1.0));
      p->c1 = FL(1.0) - p->c2;
    }
    if (!(*p->istor))
      p->yt1 = FL(0.0);
}

void tone(TONE *p)
{
    MYFLT       *ar, *asig;
    int         nsmps = ksmps;
    MYFLT       c1 = p->c1, c2 = p->c2;
    MYFLT       yt1 = p->yt1;

    if (*p->khp != p->prvhp) {
      double b;
      p->prvhp = *p->khp;
      b = 2.0 - cos((double)(p->prvhp * tpidsr));
      p->c2 = c2 = (MYFLT)(b - sqrt(b * b - 1.0));
      p->c1 = c1 = FL(1.0) - c2;
    }
    ar = p->ar;
    asig = p->asig;
    do  {
      *ar++ = yt1 = c1 * *asig++ + c2 * yt1;
    } while (--nsmps);
    p->yt1 = yt1;
}

void tonsetx(TONEX *p) /* From Gabriel Maldonado, modified for arbitrary order */
{
    {
      double b;
      p->prvhp = *p->khp;
      b = 2.0 - cos((double)(*p->khp * tpidsr));
      p->c2 = (MYFLT)(b - sqrt(b * b - 1.0));
      p->c1 = FL(1.0) - p->c2;
    }
    if((p->loop = (int) (*p->ord + .5)) < 1) p->loop = 4;
    if (!*p->istor && (p->aux.auxp == NULL ||
                      (int)(p->loop*sizeof(MYFLT)) > p->aux.size))
      auxalloc((long)(p->loop*sizeof(MYFLT)), &p->aux);
    p->yt1 = (MYFLT*)p->aux.auxp;
    if (!(*p->istor)) {
      int j;
      for (j=0; j< p->loop; j++) p->yt1[j] = FL(0.0);
    }
}

void tonex(TONEX *p)     /* From Gabriel Maldonado, modified */
{
    int j;
    int nsmps;
    MYFLT *asig, *ar, c1, c2, *yt1;
    if (*p->khp != p->prvhp) {
      double b;
      p->prvhp = *p->khp;
      b = 2.0 - cos((double)(*p->khp * tpidsr));
      p->c2 = (MYFLT)(b - sqrt(b * b - 1.0));
      p->c1 = FL(1.0) - p->c2;
    }
    c1 = p->c1;
    c2 = p->c2;
    yt1= p->yt1;
    asig = p->asig;
    for (j=0; j< p->loop; j++) {
      nsmps = ksmps;
      ar = p->ar;
      do *ar++ = *yt1 = c1 * *asig++ + c2 * *yt1;
      while (--nsmps);
      yt1++;
      asig = p->ar;
    }
}

void atone(TONE *p)
{
    MYFLT       *ar, *asig;
    int nsmps = ksmps;
    MYFLT       c1 = p->c1;  /* Not used */
    MYFLT   c2 = p->c2, yt1 = p->yt1;

    if (*p->khp != p->prvhp) {
      double b;
      p->prvhp = *p->khp;
      b = 2.0 - cos((double)(*p->khp * tpidsr));
      p->c2 = c2 = (MYFLT)(b - sqrt(b * b - 1.0));
      p->c1 = c1 = FL(1.0) - c2;
    }
    ar = p->ar;
    asig = p->asig;
    do {
      MYFLT sig = *asig++;
      *ar++ = yt1 = c2 * (yt1 + sig);
      yt1 -= sig;               /* yt1 contains yt1-xt1 */
    } while (--nsmps);
    p->yt1 = yt1;
}

void atonex(TONEX *p)     /* Gavriel Maldonado, modified */
{
    MYFLT       *ar, *asig;
    MYFLT c2, *yt1;
    int nsmps, j;

    if (*p->khp != p->prvhp) {
      double b;
      p->prvhp = *p->khp;
      b = 2.0 - cos((double)(*p->khp * tpidsr));
      p->c2 = (MYFLT)(b - sqrt(b * b - 1.0));
      /*p->c1 = 1. - p->c2;*/
    }

    c2 = p->c2;
    yt1=p->yt1;
    asig = p->asig;
    for (j=0; j< p->loop; j++) {
      nsmps = ksmps;
      ar = p->ar;
      do {
        MYFLT sig = *asig++;
        *ar++ = *yt1 = c2 * (*yt1 + sig);
        *yt1 -= sig;            /* yt1 contains yt1-xt1 */
      } while (--nsmps);
      yt1++;
      asig= p->ar;
    }

}

void rsnset(RESON *p)
{
    int scale;
    p->scale = scale = (int)*p->iscl;
    if (scale && scale != 1 && scale != 2) {
      sprintf(errmsg,Str(X_880,"illegal reson iscl value, %f"),*p->iscl);
      initerror(errmsg);
    }
    p->prvcf = p->prvbw = -FL(100.0);
    if (!(*p->istor))
      p->yt1 = p->yt2 = FL(0.0);
}

void reson(RESON *p)
{
    int flag = 0, nsmps = ksmps;
    MYFLT       *ar, *asig;
    MYFLT       c3p1, c3t4, omc3, c2sqr;
    MYFLT       yt1, yt2, c1 = p->c1, c2 = p->c2, c3 = p->c3;

    if (*p->kcf != p->prvcf) {
      p->prvcf = *p->kcf;
      p->cosf = (MYFLT)cos((double)(p->prvcf * tpidsr));
      flag = 1;
    }
    if (*p->kbw != p->prvbw) {
      p->prvbw = *p->kbw;
      c3 = p->c3 = (MYFLT)exp((double)(p->prvbw * mtpdsr));
      flag = 1;
    }
    if (flag) {
      c3p1 = c3 + FL(1.0);
      c3t4 = c3 * FL(4.0);
      omc3 = FL(1.0) - c3;
      c2 = p->c2 = c3t4 * p->cosf / c3p1;               /* -B, so + below */
      c2sqr = c2 * c2;
      if (p->scale == 1)
        c1 = p->c1 = omc3 * (MYFLT)sqrt(1.0 - (double)c2sqr / (double)c3t4);
      else if (p->scale == 2)
        c1 = p->c1 = (MYFLT)sqrt((double)((c3p1*c3p1-c2sqr) * omc3/c3p1));
      else c1 = p->c1 = FL(1.0);
    }
    asig = p->asig;
    ar = p->ar;
    yt1 = p->yt1; yt2 = p->yt2;
    do {
      MYFLT yt0 = c1 * *asig++ + c2 * yt1 - c3 * yt2;
      *ar++ = yt0;
      yt2 = yt1;
      yt1 = yt0;
    } while (--nsmps);
    p->yt1 = yt1; p->yt2 = yt2; /* Write back for next cycle */
}

void rsnsetx(RESONX *p) /* Gabriel Maldonado, modifies for arb order */
{
    int scale;
    p->scale = scale = (int) *p->iscl;
    if((p->loop = (int) (*p->ord + .5)) < 1) p->loop = 4; /*default value*/
    if (!*p->istor && (p->aux.auxp == NULL ||
                      (int)(p->loop*2*sizeof(MYFLT)) > p->aux.size))
      auxalloc((long)(p->loop*2*sizeof(MYFLT)), &p->aux);
    p->yt1 = (MYFLT*)p->aux.auxp; p->yt2 = (MYFLT*)p->aux.auxp + p->loop;
    if (scale && scale != 1 && scale != 2) {
      sprintf(errmsg,Str(X_880,"illegal reson iscl value, %f"),*p->iscl);
      initerror(errmsg);
    }
    p->prvcf = p->prvbw = -FL(100.0);

    if (!(*p->istor)) {
      int j;
      for (j=0; j< p->loop; j++) p->yt1[j] = p->yt2[j] = FL(0.0);
    }

}

void resonx(RESONX *p) /* Gabriel Maldonado, modified  */
{
    int flag = 0, nsmps, j;
    MYFLT       *ar, *asig;
    MYFLT       c3p1, c3t4, omc3, c2sqr;
    MYFLT *yt1, *yt2, c1,c2,c3;

    if (*p->kcf != p->prvcf) {
      p->prvcf = *p->kcf;
      p->cosf = (MYFLT) cos((double)(*p->kcf * tpidsr));
      flag = 1;
    }
    if (*p->kbw != p->prvbw) {
      p->prvbw = *p->kbw;
      p->c3 = (MYFLT) exp((double)(*p->kbw * mtpdsr));
      flag = 1;
    }
    if (flag) {
      c3p1 = p->c3 + FL(1.0);
      c3t4 = p->c3 * FL(4.0);
      omc3 = FL(1.0) - p->c3;
      p->c2 = c3t4 * p->cosf / c3p1;            /* -B, so + below */
      c2sqr = p->c2 * p->c2;
      if (p->scale == 1)
        p->c1 = omc3 * (MYFLT)sqrt(1.0 - (double)(c2sqr / c3t4));
      else if (p->scale == 2)
        p->c1 = (MYFLT)sqrt((double)((c3p1*c3p1-c2sqr) * omc3/c3p1));
      else p->c1 = FL(1.0);
    }

    ar = p->ar;
    c1=p->c1;
    c2=p->c2;
    c3=p->c3;
    yt1= p->yt1;
    yt2= p->yt2;
    asig = p->asig;
    for (j=0; j< p->loop; j++) {
      nsmps = ksmps;
      ar = p->ar;
      do {
        *ar = c1 * *asig++ + c2 * *yt1 - c3 * *yt2;
        *yt2 = *yt1;
        *yt1 = *ar++;
      } while (--nsmps);
      yt1++;
      yt2++;
      asig= p->ar;
    }
}

void areson(RESON *p)
{
    int flag = 0, nsmps = ksmps;
    MYFLT       *ar, *asig;
    MYFLT       c3p1, c3t4, omc3, c2sqr, D = FL(2.0); /* 1/RMS = root2 (rand) */
                                                   /*      or 1/.5  (sine) */
    MYFLT       yt1, yt2, c1, c2, c3;

    if (*p->kcf != p->prvcf) {
      p->prvcf = *p->kcf;
      p->cosf = (MYFLT)cos((double)(*p->kcf * tpidsr));
      flag = 1;
    }
    if (*p->kbw != p->prvbw) {
      p->prvbw = *p->kbw;
      p->c3 = (MYFLT)exp((double)(*p->kbw * mtpdsr));
      flag = 1;
    }
    if (flag) {
      c3p1 = p->c3 + FL(1.0);
      c3t4 = p->c3 * FL(4.0);
      omc3 = FL(1.0) - p->c3;
      p->c2 = c3t4 * p->cosf / c3p1;
      c2sqr = p->c2 * p->c2;
      if (p->scale == 1)                        /* i.e. 1 - A(reson) */
        p->c1 = FL(1.0) - omc3 * (MYFLT)sqrt((double)1. - c2sqr / c3t4);
      else if (p->scale == 2)                 /* i.e. D - A(reson) */
        p->c1 = D - (MYFLT)sqrt((double)((c3p1*c3p1-c2sqr)*omc3/c3p1));
      else p->c1 = FL(0.0);                        /* cannot tell        */
    }
    asig = p->asig;
    ar = p->ar;
    c1 = p->c1; c2 = p->c2; c3 = p->c3; yt1 = p->yt1; yt2 = p->yt2;
    if (p->scale == 1 || p->scale == 0) {
      do {
        *ar = c1 * *asig + c2 * yt1 - c3 * yt2;
        yt2 = yt1;
        yt1 = *ar++ - *asig++;  /* yt1 contains yt1-xt1 */
      } while (--nsmps);
    }
    else if (p->scale == 2) {
      do {
        *ar = c1 * *asig + c2 * yt1 - c3 * yt2;
        yt2 = yt1;
        yt1 = *ar++ - D * *asig++;      /* yt1 contains yt1-D*xt1 */
      } while (--nsmps);
    }
    p->yt1 = yt1; p->yt2 = yt2;
}

/*
 *
 * LPREAD opcode : initialisation phase
 *
 *
 */

void lprdset(LPREAD *p)
{
        LPHEADER *lph;
        MEMFIL   *mfp;
        long     magic;
        long     totvals;  /* NB - presumes sizeof(MYFLT) == sizeof(long) !! */
        long filno;

 /* Store adress of opcode for other lpXXXX init to point to */
        lprdadr[currentLPCSlot] = p;

 /* Build file name */
        if (*p->ifilno == sstrcod) { /* if char string name given */
          extern EVTBLK *currevent;
          extern char *unquote(char *name);
          if (p->STRARG == NULL) strcpy(lpfilname,unquote(currevent->strarg));
          else strcpy(lpfilname, unquote(p->STRARG));
        }
        else if ((filno = (long)*p->ifilno) <= strsmax && strsets != NULL &&
             strsets[filno])
          strcpy(lpfilname, strsets[filno]);
        else
          sprintf(lpfilname,"lp.%ld",filno);

 /* Do not reload existing file ? */
        if ((mfp = p->mfp) != NULL && strcmp(mfp->filename,lpfilname) == 0)
                goto lpend;                             /* rtn if file prv known */
 /* Load analysis in memory file */
        if ((mfp = ldmemfile(lpfilname)) == NULL) {     /* else read file  */
                sprintf(errmsg,Str(X_322,"LPREAD cannot load %s"),lpfilname);
                goto lperr;
        }
 /* Store memory file location in opcode */
        p->mfp = mfp;                                   /*  & record facts   */
 /* Take a peek to the header if exisiting. Else take input arguments */
        lph = (LPHEADER *) mfp->beginp;

        magic=lph->lpmagic;
        if ((magic==LP_MAGIC)||(magic==LP_MAGIC2)) {
                p->storePoles = (magic==LP_MAGIC2);

                printf(Str(X_520,"Using %s type of file.\n"),p->storePoles?Str(X_1131,"pole"):Str(X_767,"filter coefficient"));
      /* Store header length */
                p->headlongs = lph->headersize/sizeof(long);
      /* Check if input values where available */
                if (*p->inpoles || *p->ifrmrate)
                        warning(Str(X_973,"lpheader overriding inputs"));
      /* Check orc/analysis sample rate compatibility */
                if (lph->srate != esr)
                        warning(Str(X_971,"lpfile srate != orch sr"));
                p->npoles = lph->npoles;                /* note npoles, etc. */
      /* Store header info in opcode */
                p->nvals = lph->nvals;
                p->framrat16 = lph->framrate * FL(65536.0);/* scaled framno cvt */
        }
        else if (BYTREVL(lph->lpmagic) == LP_MAGIC) {   /* Header reversed:  */
                sprintf(errmsg,Str(X_765,"file %s bytes are in wrong order"),lpfilname);
                goto lperr;
        }
        else {                                          /* No Header on file:*/
                p->headlongs = 0;
                p->npoles = (long)*p->inpoles;          /*  data from inargs */
                p->nvals = p->npoles + 4;
                p->framrat16 = *p->ifrmrate * FL(65536.0);
                if (!p->npoles || !p->framrat16) {
                        sprintf(errmsg,Str(X_937,"insufficient args and no file header"));
                        goto lperr;
                }
        }
  /* Check  pole number */
        if (p->npoles > MAXPOLES) {
                sprintf(errmsg,Str(X_1081,"npoles > MAXPOLES"));
                goto lperr;
        }
   /* Look for total frame data size (file size - header) */
        totvals = (mfp->length/sizeof(long)) - p->headlongs;        /* see NB above!! */
  /* Store the size of a frame in integer */
        p->lastfram16 = (((totvals - p->nvals) / p->nvals) << 16) - 1;
        VMSG(printf(Str(X_1080,"npoles %ld, nvals %ld, totvals %ld, lastfram16 = %lx\n"),
                           p->npoles, p->nvals, totvals, p->lastfram16); )
lpend:  p->lastmsg = 0;
        return;

lperr:  initerror(errmsg);
}

/*
 *
 * LPREAD k/a time access. This will setup current pole values
 *
 */

extern int DoPoleInterpolation(int, MYFLT *, MYFLT *, MYFLT *, MYFLT *, MYFLT, MYFLT *, MYFLT *);

void lpread(LPREAD *p)
{
    MYFLT   *bp, *np, *cp;
    long    nn, framphase;
    MYFLT   fract;
    int     i, status;
    MYFLT   poleMagn1[MAXPOLES], polePhas1[MAXPOLES];
    MYFLT   poleMagn2[MAXPOLES], polePhas2[MAXPOLES];
    MYFLT   interMagn[MAXPOLES], interPhas[MAXPOLES];

    if (p->mfp==NULL) {
      perferror(Str(X_978,"lpread: not initialised"));
      return;
    }
  /* Locate frame position range */
    if ((framphase = (long)(*p->ktimpt * p->framrat16)) < 0) { /* for kfram reqd */
      perferror(Str(X_977,"lpread timpnt < 0"));
      return;
    }
    if (framphase > p->lastfram16) {                /* not past last one */
          framphase = p->lastfram16;
          if (!p->lastmsg) {
            p->lastmsg = 1;
            warning(Str(X_976,"lpread ktimpnt truncated to last frame"));
          }
        }
  /* Locate frames bounding current time */
        nn = (framphase >> 16) * p->nvals + p->headlongs;        /* see NB above!! */
        bp = (MYFLT *)p->mfp->beginp + nn;              /* locate begin this frame */
        np = bp + p->nvals;                             /* & interp betw adj frams */
        fract = (framphase & 0x0FFFFL) / FL(65536.0);
   /* Interpolate freq/amplpitude and store in opcode */
        *p->krmr = *bp + (*np - *bp) * fract;   bp++;   np++; /* for 4 rslts */
        *p->krmo = *bp + (*np - *bp) * fract;   bp++;   np++;
        *p->kerr = *bp + (*np - *bp) * fract;   bp++;   np++;
        *p->kcps = *bp + (*np - *bp) * fract;   bp++;   np++;

   /* Interpolate filter or poles coef values and store in opcode */

        cp = p->kcoefs;      /* This is where the coefs get stored */
        if (p->storePoles) {
          for (i=0; i<p->npoles; i++) {
            poleMagn1[i] = *bp++;
            polePhas1[i] = *bp++;
            poleMagn2[i] = *np++;
            polePhas2[i] = *np++;
          }

          status =
            DoPoleInterpolation(p->npoles,poleMagn1,polePhas1,poleMagn2,
                                polePhas2,fract,interMagn,interPhas);
          if (!status) {
            perferror(Str(X_313,"Interpolation failed\n"));
            return;
          }
          for (i=0; i<p->npoles; i++) {
            *cp++ = interMagn[i];
            *cp++ = interPhas[i];
          }
        }
        else {
          nn = p->npoles;
          do {
            *cp = *bp + (*np - *bp) * fract;
            cp++; bp++; np++;
          }
          while (--nn);
        }
/*      VMSG ({
            printf("phase:%lx fract:%6.2f rmsr:%6.2f rmso:%6.2f kerr:%6.2f kcps:%6.2f\n",
                framphase,fract,*p->krmr,*p->krmo,*p->kerr,*p->kcps);
            cp = p->kcoefs;
            nn = p->npoles;
            do    printf(" %6.2f",*cp++);
            while (--nn);
            putchar('\n'); if (dribble) putc('\n', dribble);
        })  */
}

/*
 *
 * LPRESON: initialisation time
 *
 *
 */
void lprsnset(LPRESON *p)
{
        LPREAD *q;

   /* connect to previously loaded lpc analysis */
        p->lpread = q = lprdadr[currentLPCSlot];                    /* get adr lpread struct */

   /* Initialize pointer to circulat buffer (for filtering) */
        p->circjp = p->circbuf;
        p->jp2lim = p->circbuf + (q->npoles << 1);  /* npoles det circbuflim */
}

/*
 *
 * LPRESON: k & a time access. Will actually filter the signal
 *                  Uses a circular buffer to store previous signal values.
 */

void DumpPoles(int, double *, double *, int, char *);
void InvertPoles(int, double *, double *);
void synthetize(int, double *, double *, double *, double *);

void lpreson(LPRESON *p)
{
        LPREAD *q = p->lpread;
        int     nn, nsmps = ksmps;
        MYFLT   *coefp, *pastp, *jp, *jp2, *rslt = p->ar, *asig = p->asig;
        MYFLT   x;
        double  poleReal[MAXPOLES], poleImag[MAXPOLES];
        double  polyReal[MAXPOLES+1], polyImag[MAXPOLES+1];
        int     i;
        double  pm,pp;

        jp = p->circjp;
        jp2 = jp + q->npoles;

        /* If we where using poles, we have to compute filter coefs now */
        if (q->storePoles) {
                coefp = q->kcoefs;
                for (i=0; i<q->npoles; i++) {
                        pm = *coefp++;
                        pp = *coefp++;
                        if (fabs(pm)>0.999999)
                                pm = 1/pm;
                        poleReal[i] = pm*cos(pp);
                        poleImag[i] = pm*sin(pp);

                }
/*              DumpPoles(q->npoles,poleReal,poleImag,0,"About to filter"); */
                InvertPoles(q->npoles,poleReal,poleImag);
                synthetize(q->npoles,poleReal,poleImag,polyReal,polyImag);
                coefp = q->kcoefs;
                for (i=0; i<q->npoles; i++) {
                  coefp[i] = -(MYFLT)polyReal[q->npoles-i]; /* MR_WHY - somthing with the atan2 ? */
#ifdef _DEBUG
                        /*                      if (polyImag[i]>1e-10) */
                        /*                      { */
                        /*                              printf ("bad polymag: %f\n",polyImag[i]); */
                        /*                      } */
#endif
                }
        }

        /* For each sample */
        do {
          /* Compute Xn = Yn + CkXn-k */

#ifdef TRACE_FILTER
                printf ("Asig=%f\n",*asig);
#endif
                x = *asig++;
                coefp = q->kcoefs;              /* using lpread interp coefs */
                pastp = jp;
                nn = q->npoles;
                do {
#ifdef TRACE_FILTER
                  printf ("\t%f,%f\n",*coefp,*pastp);
#endif
                  x += *coefp++ * *pastp++;
                } while (--nn);
#ifdef TRACE_FILTER
                printf ("result=%f\n",x);
#endif
                /* Store result signal in circular and output buffers */

                *jp++ = *jp2++ = x;
                *rslt++ = x;

                /* Check if end of buffer reached */
                if (jp2 >= p->jp2lim) {
                        jp2 = jp;
                        jp = p->circbuf;
                }
        } while (--nsmps);
        p->circjp = jp;
}

/*
 *
 * LPFRESON : Initialisation time
 *
 */
void lpfrsnset(LPFRESON *p)
{

   /* Connect to previously loaded analysis file */

    if (lprdadr[currentLPCSlot]->storePoles)
      initerror(Str(X_430,"Pole file not supported for this opcode !\n"));
    p->lpread = lprdadr[currentLPCSlot];
    p->prvratio = FL(1.0);
    p->d = FL(0.0);
    p->prvout = FL(0.0);
}

/*
 *
 * LPFRESON : k & a time : actually filters the data
 *
 */
void lpfreson(LPFRESON *p)
{
    LPREAD  *q = p->lpread;
    int     nn, nsmps = ksmps;
    MYFLT   *coefp, *pastp, *pastp1, *rslt = p->ar, *asig = p->asig;
    MYFLT   x, temp1, temp2, ampscale, cq;

    if (*p->kfrqratio != p->prvratio) {             /* for new freqratio */
      if (*p->kfrqratio <= FL(0.0)) {
        sprintf(errmsg,Str(X_848,"illegal frqratio, %5.2f"),*p->kfrqratio);
        perferror(errmsg);
        return;
      }                                             /*      calculate d  */
      p->d = (*p->kfrqratio - FL(1.0)) / (*p->kfrqratio + FL(1.0));
      p->prvratio = *p->kfrqratio;
    }
    if (p->d != 0.) {                               /* for non-zero d,   */
      coefp = q->kcoefs;
      nn = q->npoles - 1;
      do {
        temp1 = p->d * *coefp++;                    /*    shift formants */
        *coefp += temp1;
      }
      while (--nn);
      ampscale = FL(1.0) / (FL(1.0) - p->d * *coefp); /*    & reset scales */
      cq = (FL(1.0) - p->d * p->d) * ampscale;
    }
    else {
      cq = FL(1.0);
      ampscale = FL(1.0);
    }
    x = p->prvout;
    do {
      nn = q->npoles - 1;
      pastp  = pastp1 = p->past + nn;
      temp1 = *pastp;
      *pastp = cq * x - p->d * *pastp;
      pastp--;
      do {
        temp2 = *pastp;
        *pastp = (*pastp1 - *pastp) * p->d + temp1;
        pastp--;   pastp1--;
        temp1 = temp2;
      }
      while (--nn);
      x = *asig++;
      pastp = p->past;
      coefp = q->kcoefs;
      nn = q->npoles;
      do  x += *coefp++ * *pastp++;
      while (--nn);
      *rslt++ = x * ampscale;
    }
    while (--nsmps);
    p->prvout = x;
}

void rmsset(RMS *p)
{
        MYFLT   b;

        b = FL(2.0) - (MYFLT)cos((double)(*p->ihp * tpidsr));
        p->c2 = b - (MYFLT)sqrt((double)(b * b - 1.0));
        p->c1 = FL(1.0) - p->c2;
        if (!*p->istor)
                p->prvq = FL(0.0);
}

void gainset(GAIN *p)
{
        MYFLT   b;

        b = FL(2.0) - (MYFLT)cos((double)(*p->ihp * tpidsr));
        p->c2 = b - (MYFLT)sqrt((double)(b * b - 1.0));
        p->c1 = FL(1.0) - p->c2;
        if (!*p->istor)
                p->prvq = p->prva = FL(0.0);
}

void balnset(BALANCE *p)
{
        MYFLT   b;

        b = FL(2.0) - (MYFLT)cos((double)(*p->ihp * tpidsr));
        p->c2 = b - (MYFLT)sqrt((double)(b * b - 1.0));
        p->c1 = FL(1.0) - p->c2;
        if (!*p->istor)
                p->prvq = p->prvr = p->prva = FL(0.0);
}

void rms(RMS *p)
{
        int     nsmps = ksmps;
        MYFLT   *asig;
        MYFLT   q;
        MYFLT   c1 = p->c1, c2 = p->c2;

        q = p->prvq;
        asig = p->asig;
        do {
          MYFLT as = *asig++;
          q = c1 * as * as + c2 * q;
        } while (--nsmps);
        p->prvq = q;
        *p->kr = (MYFLT) sqrt((double)q);
}

void gain(GAIN *p)
{
        int     nsmps = ksmps;
        MYFLT   *ar, *asig;
        MYFLT   q, a, m, diff, inc;
        MYFLT   c1 = p->c1, c2 = p->c2;

        q = p->prvq;
        asig = p->asig;
        do {
          MYFLT as = *asig++;
          q = c1 * as * as + c2 * q;
        } while (--nsmps);
        p->prvq = q;
        if (q = (MYFLT)sqrt(q))
                a = *p->krms / q;
        else    a = *p->krms;
        asig = p->asig;
        ar = p->ar;
        nsmps = ksmps;
        if ((diff = a - p->prva) != 0) {
                m = p->prva;
                inc = diff/ksmps;
                do {    *ar++ = *asig++ * m;
                        m += inc;
                } while (--nsmps);
                p->prva = a;
        }
        else {  do *ar++ = *asig++ * a;
                while (--nsmps);
        }
}

void balance(BALANCE *p)
{
        int     nsmps = ksmps;
        MYFLT   *ar, *asig, *csig;
        MYFLT   q, r, a, m, diff, inc;
        MYFLT   c1 = p->c1, c2 = p->c2;

        q = p->prvq;
        r = p->prvr;
        asig = p->asig;
        csig = p->csig;
        do {
          MYFLT as = *asig++;
          MYFLT cs = *csig++;
          q = c1 * as * as + c2 * q;
          r = c1 * cs * cs + c2 * r;
        } while (--nsmps);
        p->prvq = q;
        p->prvr = r;
        if (q)
                a = (MYFLT)sqrt(r/q);
        else    a = (MYFLT)sqrt(r);
        asig = p->asig;
        ar = p->ar;
        nsmps = ksmps;
        if ((diff = a - p->prva) != 0) {
                m = p->prva;
                inc = diff/ksmps;
                do {    *ar++ = *asig++ * m;
                        m += inc;
                } while (--nsmps);
                p->prva = a;
        }
        else {  do *ar++ = *asig++ * a;
                while (--nsmps);
        }
}

/*
 *   Set current lpc slot
 */
void lpslotset(LPSLOT *p)
{
        int n;

        n = (int)*(p->islotnum);
        if (n<0)
                initerror(Str(X_980,"lpslot number should be positive\n"));
        if (n>MAX_LPC_SLOT)
                initerror(Str(X_979,"lpslot number should be less than 20\n"));
        currentLPCSlot = n;
}

void lpitpset(LPINTERPOL *p)
{

  /* Get lpread pointers */
        p->lp1 = lprdadr[(int)*(p->islot1)];
        p->lp2 = lprdadr[(int)*(p->islot2)];

  /* Check if workable */

        if ((!p->lp1->storePoles) || (!p->lp2->storePoles))
                initerror(Str(X_974,"lpinterpol works only with poles files.."));

        if (p->lp1->npoles != p->lp2->npoles)
                initerror(Str(X_489,"The poles files have different pole count\n"));

#if 0                   /* This is incorrect C */
        if (&p->kcoefs-p != &p->lp1->kcoefs-p->lp1)
                initerror(Str(X_1117,"padding error"));
#endif

        p->npoles = p->lp1->npoles;
        p->storePoles = 1;
        lprdadr[currentLPCSlot] = (LPREAD*)p;
}

void lpinterpol(LPINTERPOL *p)
{
    int     i,status;
    MYFLT   *cp,*cp1,*cp2;
    MYFLT   poleMagn1[MAXPOLES], polePhas1[MAXPOLES];
    MYFLT   poleMagn2[MAXPOLES], polePhas2[MAXPOLES];
    MYFLT   interMagn[MAXPOLES], interPhas[MAXPOLES];

    /* RWD: guessing this... */
    if (p->lp1==NULL || p->lp2==NULL) {
      perferror(Str(X_975,"lpinterpol: not initialised"));
      return;
    }
    cp1 =  p->lp1->kcoefs;
    cp2 =  p->lp2->kcoefs;

    for (i=0; i<p->npoles; i++) {
      poleMagn1[i] = *cp1++;
      polePhas1[i] = *cp1++;
      poleMagn2[i] = *cp2++;
      polePhas2[i] = *cp2++;
    }

    status = DoPoleInterpolation(p->npoles,poleMagn1,polePhas1,poleMagn2,
                                     polePhas2,*p->kmix,interMagn,interPhas);
    if (!status) {
      perferror(Str(X_313,"Interpolation failed\n"));
      return;
    }

    cp = p->kcoefs;      /* This is where the coefs get stored */
    for (i=0; i<p->npoles; i++) {
      *cp++ = interMagn[i];
      *cp++ = interPhas[i];
    }
}
