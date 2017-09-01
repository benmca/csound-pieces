/* *********************************** */
/* *********************************** */
/* EXPERIMENTAL VERSION -- John ffitch */
/* *********************************** */
/* *********************************** */

/* 
   Original 5.520u 0.130s 0:07.61 74.2%     0+0k 0+0io 451pf+0w
   Best     5.800u 0.130s 0:07.70 77.0%     0+0k 0+0io 437pf+0w
            5.770u 0.090s 0:07.34 79.8%     0+0k 0+0io 309pf+0w
            5.430u 0.120s 0:07.03 78.9%     0+0k 0+0io 307pf+0w
            5.390u 0.080s 0:06.97 78.4%     0+0k 0+0io 307pf+0w
            5.370u 0.100s 0:06.97 78.4%     0+0k 0+0io 307pf+0w
            5.300u 0.170s 0:07.00 78.1%     0+0k 0+0io 307pf+0w
            5.140u 0.090s 0:06.71 77.9%     0+0k 0+0io 307pf+0w
            5.200u 0.070s 0:06.85 76.9%     0+0k 0+0io 307pf+0w
            5.160u 0.090s 0:06.62 79.3%     0+0k 0+0io 274pf+0w
            5.760u 0.070s 0:07.23 80.6%     0+0k 0+0io 272pf+0w (bitmap)

   Ideas:   Make the matrix into a bitmap
            Hashed sparse matrix representation
            */

/* Scanned Synthesis Opcodes:
   scansyn.c, scansyn.csd, scansyn.h and related files
   are Copyright, 1999 by Interval Research.
   Coded by Paris Smaragdis
   From an algorithm by Bill Verplank, Max Mathews and Rob Shaw

   Permission to use, copy, or modify these programs and their documentation
   for educational and research purposes only and without fee is hereby
   granted, provided that this copyright and permission notice appear on all
   copies and supporting documentation. For any other uses of this software,
   in original or modified form, including but not limited to distribution in
   whole or in part, specific prior permission from Interval Research must be
   obtained. Interval Research makes no representations about the suitability
   of this software for any purpose. It is provided "as is" without express or
   implied warranty.
*/

/* Code fixes by John ffitch, March 2000 */
/*               Made interpolation selectable April 2000 */

#include "cs.h"
#include "scansynx.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "cwindow.h"


/* Order of interpolation of scanning */
/* Either 1, 2 (linear), 3 (cubic) or 4 (quadratic) */
/* #define OSCIL_INTERP 4 */
/* Not used as now variable */

/* Order of interpolation of updating */
/* Either 2 (linear) or 3 (cubic) */
#define PHASE_INTERP 3

/* Window to be applied at external force */
static MYFLT *ewin = NULL;


/****************************************************************************
 *      Helper functions and macros for updater
 ***************************************************************************/

/*
 *      Wavetable init
 */
static void scsnux_initw(PSCSNUX *p)
{
    int i;
    long len = p->len;
    FUNC *fi = ftfind(p->i_init);
    if (fi == NULL) {
      initerror(Str(X_1518, "scanux: Could not find ifnnit ftable"));
      return;
    }
    if (fi->flen != len)
      die(Str(X_1484,"scanux: Init table has bad size"));
    for (i = 0 ; i != len ; i++)
      p->x1[i] = fi->ftable[i];
}

/*
 *      Hammer hit
 */
static void scsnux_hammer(PSCSNUX *p, MYFLT pos, MYFLT sgn)
{
    int i, i1, i2;
    FUNC *fi;
    MYFLT *f;
    MYFLT tab = *p->i_init;
    long len  = p->len;

    /* Get table */
    if (tab<FL(0.0)) tab = -tab;   /* JPff fix here */
    if ((fi = ftfind(&tab)) == NULL) {
      initerror(Str(X_1519, "scanux: Could not find ifninit ftable"));
      return;
    }

    /* Add hit */
    f  = fi->ftable;
    i1 = (int)(len*pos - fi->flen/2);
    i2 = (int)(len*pos + fi->flen/2);
    for (i = i1 ; i < 0 ; i++) {
      p->x1[len-i-1] += sgn * *f++;
#ifdef XALL
      p->x2[len-i-1] += sgn * *f++;
      p->x3[len-i-1] += sgn * *f++;
#endif
    }
    for (; i < len && i < i2 ; i++) {
      p->x1[i] += sgn * *f++;
#ifdef XALL
      p->x2[i] += sgn * *f++;
      p->x3[i] += sgn * *f++;
#endif
    }
    for (; i < i2 ; i++) {
      p->x1[i-len] += sgn * *f++;
#ifdef XALL
      p->x2[i-len] += sgn * *f++;
      p->x3[i-len] += sgn * *f++;
#endif
    }
}



/******************************
 *      Linked list stuff
 ******************************/

struct scsnx_elem {
    int                 id;
    PSCSNUX             *p;
    struct scsnx_elem   *next;
};

struct scsnx_elem *scsnx_list = NULL;

/* add to list */
static void listadd(PSCSNUX *p)
{
    struct scsnx_elem *i = scsnx_list;
    while (i != NULL) {
      if (i->id==p->id) {
        i->p = p;               /* Reuse the space */
        return;
      }
      i = i->next;
    }
    i = (struct scsnx_elem *)malloc(sizeof(struct scsnx_elem));
    i->p = p;
    i->id = p->id;
    i->next = scsnx_list;
    scsnx_list = i;
}

/* Return from list according to id */
static PSCSNUX *listget(int id)
{
    struct scsnx_elem *i = scsnx_list;
    if (i == NULL) {
      initerror(Str(X_1527,"scans: No scan synthesis net specified"));
      exit(1);
    }
    while (i->id != id) {
      i = i->next;
      if (i == NULL)
        die(Str(X_1485,"Eek ... scan synthesis id was not found"));
    }
    return i->p;
}



/****************************************************************************
 *      Functions for scsnux
 ***************************************************************************/

#define BITS_PER_UNIT (32)
#define LOG_BITS_PER_UNIT (5)

/*
 *      Setup the updater
 */
void scsnux_init(PSCSNUX *p)
{
    /* Get parameter table pointers and check lengths */
    FUNC *f;
    int len;
    int i;

    /* Mass */
    if ((f = ftfind(p->i_m)) == NULL) {
      initerror(Str(X_1520, "scanux: Could not find ifnmass table"));
      return;
    }
    len = p->len = f->flen;
    p->m = f->ftable;

    /* Centering */
    if ((f = ftfind(p->i_c)) == NULL) {
      initerror(Str(X_1521, "scanux: Could not find ifncentr table"));
      return;
    }
    if (f->flen != len)
      die(Str(X_1486,
              "scanux: Parameter tables should all have the same length"));
    p->c = f->ftable;

    /* Damping */
    if((f = ftfind(p->i_d)) == NULL) {
      initerror(Str(X_1522, "scanux: Could not find ifndamp table"));
      return;
    }
    if (f->flen != len)
      die(Str(X_1486,"scanux: Parameter tables should all have the same length"));
    p->d = f->ftable;

    /* Spring stiffness */
    if (*p->i_f != sstrcod) {
      int j, ilen;

      /* Get the table */
      if ((f = ftfind(p->i_f)) == NULL) {
        initerror(Str(X_1523, "scanux: Could not find ifnstiff table"));
        return;
      }

     /* Check that the size is good */
      if (f->flen < len*len)
        die(Str(X_1488,"scanux: Spring matrix is too small"));

      /* Setup an easier addressing scheme */
#ifdef USING_CHAR
      /* ***** EXPERIMENTAL ****************************************** */
      /* This version uses a binary char matrix to save space and time */
      auxalloc(len*len * sizeof(char), &p->aux_f);
      p->f = (char*)p->aux_f.auxp;
#else
      /* ***** EXPERIMENTAL ****************************************** */
      /* This version uses a binary bit matrix to save space and time */
      auxalloc(1L+(len*len*sizeof(long))/BITS_PER_UNIT, &p->aux_f);
      p->f = (unsigned long*)p->aux_f.auxp;
#endif
      for (i = 0, ilen = 0 ; i != len ; i++, ilen += len) {
        for (j = 0 ; j != len ; j++) {
#ifdef USING_CHAR
          p->f[ilen+j] = (f->ftable[ilen+j] != 0 ? 1 : 0);
          if (p->f[ilen+j]) printf("%.0f: %d %d\n", *p->i_f, i, j);
#else
          int wd = (ilen+j)>>LOG_BITS_PER_UNIT; /* dead reckoning would be faster */
          int bt = (ilen+j)&(BITS_PER_UNIT-1);
          printf("%.0f: %d %d -> wd%d/bt%d\n", *p->i_f, i, j, wd, bt);
          p->f[wd] |= (1<<bt);
#endif
        }
      }
    }
    else {                      /* New format matrix */
      char filnam[256];
      extern EVTBLK *currevent;
      extern char *unquote(char *name);
      MEMFIL *mfp;
      if (p->STRARG == NULL) strcpy(filnam,unquote(currevent->strarg));
      else strcpy(filnam, unquote(p->STRARG));
      if ((mfp = ldmemfile(filnam)) == NULL) {    /*   readfile if reqd */
        sprintf(errmsg,"SCANU cannot load %s",filnam);
        initerror(errmsg);
      }
      else {
#define MATRIX "<MATRIX>\n"
#define MATLEN sizeof(MATRIX)-1
#define NMATRIX "</MATRIX>\n"
#define NMATLEN sizeof(NMATRIX)-1
        int j;
        char *pp = mfp->beginp;
        if (i=strncmp(pp, MATRIX, MATLEN)) {
          printf("%d: Looking for (%d)%s Found %.12s\n", i, MATLEN, MATRIX, pp);
          initerror("Not a valid matrix");
          return;
        }
        else pp += MATLEN;
#ifdef USING_CHAR
        auxalloc(len*len * sizeof(char), &p->aux_f);
        p->f = (char*)p->aux_f.auxp;
#else
        auxalloc(1L+(len*len*sizeof(long))/BITS_PER_UNIT, &p->aux_f);
        p->f = (unsigned long*)p->aux_f.auxp;
#endif
        while (pp < mfp->endp) {
          if (strncmp(pp, NMATRIX, NMATLEN)==0) break;
          if (2 != sscanf(pp, "%d %d", &i, &j)) break;
#ifdef USING_CHAR
          p->f[i*len+j] = 1;
#else
          if (i<len && j<len) { /* Only if in range! */
            int wd = (i*len+j)>>LOG_BITS_PER_UNIT;
            int bt = (i*len+j)&(BITS_PER_UNIT-1);
            p->f[wd] |= (1<<bt);
/*             printf("%.0f: %d %d -> wd%d/bt%d %.8x\n", */
/*                    *p->i_f, i, j, wd, bt, p->f[wd]); */
          }
          else {
            printf("(%d,%d) is out of range\n", i, j);
          }
#endif
          while (*pp++ != '\n') ;
/*           printf("Read: %d %d [pp=%p end = %p]\n", i, j, pp, mfp->endp); */
        }
      }
    }

/* Make buffers to hold data */
#if PHASE_INTERP == 3
    auxalloc(6*len*sizeof(MYFLT), &p->aux_x);
#else
    auxalloc(5*len*sizeof(MYFLT), &p->aux_x);
#endif
    p->x0  = (MYFLT*)p->aux_x.auxp;
    p->x1  = p->x0 + len;
    p->x2  = p->x1 + len;
    p->ext = p->x2 + len;
    p->v   = p->ext + len;
#if PHASE_INTERP == 3
    p->x3  = p->v + len;
#endif

    /* Initialize them ... */
    for (i = 0 ; i != len ; i++) {
      p->x0[i] = p->x1[i] = p->x2[i]= p->ext[i] = FL(0.0);
#if PHASE_INTERP == 3
      p->x3[i] = FL(0.0);
#endif
    }

    /* ... according to scheme */
    if ((int)*p->i_init < 0) {
      scsnux_hammer(p, *p->i_l, FL(1.0));
      scsnux_hammer(p, *p->i_r, -FL(1.0));
    }
    else if (*p->i_id<FL(0.0))
      scsnux_hammer(p, FL(0.5), FL(1.0));
    else
      scsnux_initw(p);

    /* Velocity gets presidential treatment */
    {
      FUNC *f = ftfind(p->i_v);
      if (f == NULL) {
        initerror(Str(X_1524,"scanux: Could not find ifnvel table"));
      }
      if (f->flen != len)
        die(Str(X_1486,
                "scanux: Parameter tables should all have the same length"));
      for (i = 0 ; i != len ; i++)
        p->v[i] = f->ftable[i];
    }
    /* Cache update rate over to local structure */
    p->rate = *p->i_rate * esr;

      /* Initialize index */
    p->idx  = 0;

    /* External force index */
    p->exti = 0;

    /* Setup display window */
    if (*p->i_disp) {
      p->win = calloc(1, sizeof(WINDAT));
      dispset((WINDAT*)p->win, p->x1, len,
              Str(X_1487,"Mass displaycement"), 0,
              Str(X_1489,"Scansynth window"));
    }

    /* Make external force window if we haven't so far */
    if (ewin == NULL) {
      MYFLT arg =  PI_F/(MYFLT)(len-1);
      ewin = (MYFLT *)malloc(len * sizeof(MYFLT));
      for (i = 0 ; i != len-1 ; i++)
        ewin[i] = (MYFLT)sqrt(sin((double)arg*i));
      ewin[i] = FL(0.0); /* You get NaN otherwise */
    }

    /* Throw data into list or use table */
    if (*p->i_id < FL(0.0)) {
      MYFLT id = - *p->i_id;
      FUNC *f  = ftfind(&id);
      if(f == NULL) {
        initerror(Str(X_1525,"scanux: Could not find (id) table"));
        return;
      }
      p->out = f->ftable;
      p->id  = (int)*p->i_id;

    }
    else {
      p->id  = (int)*p->i_id;
      listadd(p);
    }
/*     for (i = 0; i<= (len*len)/BITS_PER_UNIT; i++) { */
/*       printf("[%d,] %.8x\n", i, p->f[i]); */
/*     } */
/*     exit(1); */
}



/*
 *      Performance function for updater
 */

#define dt FL(1.0)

void scsnux(PSCSNUX *p)
{
    int n;
    int len    = p->len;
    long exti  = p->exti;
    long idx   = p->idx;
    MYFLT rate = p->rate;

    for (n = 0 ; n != ksmps ; n++) {

      /* Put audio input in external force */
      p->ext[exti] = p->a_ext[n];
      exti++;
      if (exti >= len) exti = 0;

      /* If it is time to calculate next phase, do it */
      if (idx >= rate) {
        int i, j, cnt = 0;      /* cnt is i*len+j */
        for (i = 0 ; i != len ; i++) {
          MYFLT a = FL(0.0);
                                /* Throw in audio drive */
          p->v[i] += p->ext[exti++] * ewin[i];
          if (exti >= len) exti = 0L;
                                /* And push feedback */
          scsnux_hammer(p, *p->k_x, *p->k_y);
                                /* Estimate acceleration */
          for (j = 0 ; j != len ; j++) {
#ifdef USING_CHAR
            if (p->f[cnt])  /* if connection */
              a += (p->x1[j] - p->x1[i])/* * p->f[cnt] */ * *p->k_f;
#else
            int wd = (cnt)>>LOG_BITS_PER_UNIT;
            int bt = (cnt)&(BITS_PER_UNIT-1);
/*             printf("(%d,%d): [%d,%d] %.8x %s\n", */
/*                    i, j, wd, bt, p->f[wd], (p->f[wd]&(1<<bt) ? "yes" : "no")); */
            if (p->f[wd]&(1<<bt))
              a += (p->x1[j] - p->x1[i]) * *p->k_f;
#endif
            cnt++;
          }
          a += - p->x1[i] * p->c[i] * *p->k_c -
               (p->x2[i] - p->x1[i]) * p->d[i] * *p->k_d;
          a /= p->m[i] * *p->k_m;
                                /* From which we get velocity */
          p->v[i] += /* dt * */ a;
                                /* ... and future position */
          p->x0[i] += p->v[i] /* * dt */;
        }
        /* Swap to get time order */
        for (i = 0 ; i != len ; i++) {
#if PHASE_INTERP == 3
          p->x3[i] = p->x2[i];
#endif
          p->x2[i] = p->x1[i];
          p->x1[i] = p->x0[i];
        }
        /* Reset index and display the state */
        idx = 0;
        if (*p->i_disp)
          display(p->win);
      }
      if (p->id<0) { /* Write to ftable */
        int i;
        MYFLT t  = (MYFLT)idx / rate;
        for (i = 0 ; i != p->len ; i++) {
#if PHASE_INTERP == 3
          p->out[i] = p->x1[i] +
            t*(-p->x3[i]*FL(0.5) +
               t*(p->x3[i]*FL(0.5) - p->x1[i] + p->x2[i]*FL(0.5))
               + p->x2[i]*FL(0.5));
#else
          p->out[i] = p->x2[i] + (p->x1[i] - p->x2[i]) * t;
#endif
        }
      }
      /* Update counter */
      idx++;
    }
    p->idx = idx;
    p->exti = exti;
}



/****************************************************************************
 *      Functions for scsnsx
 ***************************************************************************/


/*
 *      Succesive phase interpolator
 */
#if PHASE_INTERP == 3
#define pinterp(ii, x) \
        (pp->x1[p->t[ii]] + x*((pp->x2[p->t[ii]]-pp->x3[p->t[ii]])*FL(0.5) + \
         x*((pp->x3[p->t[ii]]+pp->x2[p->t[ii]])*FL(0.5) - pp->x1[p->t[ii]])))
#else
#define pinterp(ii, x) \
        (pp->x2[p->t[ii]] + (pp->x1[p->t[ii]] - pp->x2[p->t[ii]]) * x)
#endif

/*
 *      Init scaner
 */
void scsnsx_init(PSCSNSX *p)
{
    /* Get corresponding update */
    p->p = listget((int)*p->i_id);

    /* Get trajectory matrix */
    {
      int i;
      int oscil_interp = (int)*p->interp;
      FUNC *t = ftfind(p->i_trj);
      if (t == NULL) {
        initerror(Str(X_1526,"scans: Could not find the ifntraj table"));
      }
      if (oscil_interp<1 || oscil_interp>4) oscil_interp = 4;
      p->oscil_interp = oscil_interp;
/*       printf("interP %d\n", oscil_interp); */
      p->tlen = t->flen;
      /* Check that trajectory is within bounds */
      for (i = 0 ; i != p->tlen ; i++)
        if (t->ftable[i] < 0 || t->ftable[i] >= p->p->len)
          die(Str(X_1490,"scsn: Trajectory table includes values out of range"));
      /* Allocate memory and pad to accomodate interpolation */
                                /* Note that the 3 here is a hack -- jpff */
      auxalloc((p->tlen+3/*oscil_interp*/-1)*sizeof(long), &p->aux_t);
      p->t = (long*)p->aux_t.auxp + (int)(oscil_interp-1)/2;
      /* Fill 'er up */
      for (i = 0 ; i != p->tlen ; i++)
        p->t[i] = (long)t->ftable[i];
      /* Do wraparounds */
      for (i = 1 ; i <= (oscil_interp-1)/2 ; i++)
        p->t[-i] = p->t[i];
      for (i = 0 ; i <= oscil_interp/2 ; i++)
        p->t[p->tlen+1] = p->t[i];
    }
    /* Reset oscillator phase */
    p->phs = FL(0.0);
    /* Oscillator ratio */
    p->fix = (MYFLT)p->tlen/esr;
}



/*
 *      Performance function for scanner
 */
void scsnsx(PSCSNSX *p)
{
    int i;
    long tlen   = p->tlen;
    MYFLT phs   = p->phs, inc = *p->k_freq * p->fix;
    MYFLT t = (MYFLT)p->p->idx/p->p->rate;
    MYFLT amp = *p->k_amp;
    PSCSNUX *pp = p->p;

    switch (p->oscil_interp) {
    case 1:
      for (i = 0 ; i != ksmps ; i++) {
      /* Do various interpolations to get output sample ... */
/*      MYFLT x     = phs - (int)phs; */
        int ph = (int)phs;
        p->a_out[i] = amp * (pinterp(ph, t));
                /* Update oscillator phase and wrap around if needed */
        phs += inc;
        if (phs >= tlen) phs -= tlen;
      }
      break;
    case 2:
      for (i = 0 ; i != ksmps ; i++) {
      /* Do various interpolations to get output sample ... */
        int ph = (int)phs;
        MYFLT x     = phs - ph;
        MYFLT y1    = pinterp(ph  , t);
        MYFLT y2    = pinterp(ph+1, t);
        p->a_out[i] = amp * (y1 + x*(y2 - y1));
                /* Update oscillator phase and wrap around if needed */
        phs += inc;
        if (phs >= tlen) phs -= tlen;
      }
      break;
    case 3:
      for (i = 0 ; i != ksmps ; i++) {
      /* Do various interpolations to get output sample ... */
        int ph = (int)phs;
        MYFLT x     = phs - ph;
        MYFLT y1    = pinterp(ph-1, t);
        MYFLT y2    = pinterp(ph  , t);
        MYFLT y3    = pinterp(ph+1, t);
        p->a_out[i] = amp *
          (y2 + x*(-y1*FL(0.5) + x*(y1*FL(0.5) - y2 + y3*FL(0.5)) + y3*FL(0.5)));
                /* Update oscillator phase and wrap around if needed */
        phs += inc;
        if (phs >= tlen) phs -= tlen;
      }
      break;
    case 4:
      for (i = 0 ; i != ksmps ; i++) {
      /* Do various interpolations to get output sample ... */
        int ph = (int)phs;
        MYFLT x     = phs - ph;
        MYFLT y1    = pinterp(ph-1, t);
        MYFLT y2    = pinterp(ph  , t);
        MYFLT y3    = pinterp(ph+1, t);
        MYFLT y4    = pinterp(ph+2, t);
        p->a_out[i] = amp *
          (y2 + x*(-y1/FL(3.0) - y2*FL(0.5) + y3 +
                   x*(y1*FL(0.5) - y2 + y3*FL(0.5) +
                      x*((y2 - y3)*FL(0.5) + (y4-y1)/FL(6.0))) -
                   y4/FL(6.0)));
                /* Update oscillator phase and wrap around if needed */
        phs += inc;
        if (phs >= tlen) phs -= tlen;
      }
      break;
    }
    p->phs = phs;    /* Remember phase */
}
