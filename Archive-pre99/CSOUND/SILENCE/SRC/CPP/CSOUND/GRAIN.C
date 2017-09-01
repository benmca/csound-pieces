/*      Granular synthesizer designed and coded by Paris Smaragdis      */
/*      Berklee College of Music Csound development team                */
/*      Copyright (c) May 1994.  All rights reserved                    */

/* Some speed hacks added by John Fitch */

#include "cs.h"
#include "grain.h"
#include <stdlib.h>

#ifndef RAND_MAX
#define RAND_MAX        (32767)
#endif

#define Unirand(a)      (((MYFLT)rand() / (MYFLT)RAND_MAX) * (a))

void agsset(PGRA *p)                    /*      Granular U.G. set-up */
{
    FUNC        *gftp, *eftp;
    long        bufsize;
    MYFLT       *d;

    if ((gftp = ftfind(p->igfn)) != NULL)
        p->gftp = gftp;

    if ((eftp = ftfind(p->iefn)) != NULL)
        p->eftp = eftp;

    p->gcount=FL(1.0);

    if (*p->opt == 0)
        p->pr = (MYFLT)(gftp->flen << gftp->lobits);

    if (*p->opt != 0)
        p->pr = FL(0.0);

    bufsize = sizeof(MYFLT)*(2L * (long)(esr * *p->imkglen) +  (3L * ksmps));

    if (p->aux.auxp == NULL || bufsize > p->aux.size)
        auxalloc(bufsize, &p->aux);
    else memset(p->aux.auxp, '\0', bufsize); /* Clear any old data */
    d = p->x = (MYFLT *)p->aux.auxp;
    d +=  (int)(esr * *p->imkglen) + ksmps;
    p->y = d;

    p->ampadv = (p->XINCODE & 0x2) ? 1 : 0;
    p->lfradv = (p->XINCODE & 0x1) ? 1 : 0;
    p->dnsadv = (p->XINCODE & 0x4) ? 1 : 0;
}

void ags(PGRA *p)               /*      Granular U.G. a-rate main routine       */
{
    FUNC        *gtp, *etp;
    MYFLT       *buf, *out, *rem, *gtbl, *etbl;
    MYFLT       *xdns, *xamp, *xlfr, *temp, amp;
    long        isc, isc2, inc, inc2, lb, lb2;
    long        n, i, bufsize;
    long        ekglen;
    MYFLT       kglen = *p->kglen;
    MYFLT       gcount = p->gcount;

                                /* Pick up common values to locals for speed */
    if (p->aux.auxp==NULL) {
      initerror(Str(X_798,"grain: not initialised"));
      return;
    }
    gtp  = p->gftp;
    gtbl = gtp->ftable;

    etp  = p->eftp;
    etbl = etp->ftable;
    lb   = gtp->lobits;
    lb2  = etp->lobits;

    buf  = p->x;
    rem  = p->y;

    out  = p->sr;

    if (kglen > *p->imkglen) kglen = *p->imkglen;

    ekglen  = (long)(esr * kglen);   /* Useful constant */
    inc2    = (long)(sicvt / kglen); /* Constant for each cycle */
    bufsize = ksmps + ekglen;
    xdns    = p->xdns;
    xamp    = p->xamp;
    xlfr    = p->xlfr;

    i       = bufsize;                /* Clear buffer */
    temp    = buf;
    do
      *temp++ = FL(0.0);
    while (--i);

    for (i = 0 ; i < ksmps ; i++) {
        if (gcount >= FL(0.1)) { /* I wonder..... */
            gcount = FL(0.0);
            amp = *xamp + Unirand(*p->kabnd);
            isc = (long) Unirand(p->pr);
            isc2 = 0;
            inc = (long) ((*xlfr + Unirand(*p->kbnd)) * sicvt);

            temp = buf + i;
            n = ekglen;
            do {
                *temp++ += amp  * *(gtbl + (isc >> lb)) *
                                  *(etbl + (isc2 >> lb2));
                isc  = (isc +inc )&PHMASK;
                isc2 = (isc2+inc2)&PHMASK;
            } while (--n);
        }

        xdns += p->dnsadv;
        gcount += *xdns / esr;
/*         printf("gcount = %f\n", gcount); */
        xamp += p->ampadv;
        xlfr += p->lfradv;
    }

    n = bufsize;
    temp = rem;
    do {
        *temp = *buf++ + *(temp + ksmps);
        temp++;
    } while (--n);

    n = ksmps;
    do
      *out++ = *rem++;
    while (--n);
    p->gcount = gcount;
}
