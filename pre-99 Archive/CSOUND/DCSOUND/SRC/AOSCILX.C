/*	Oscilx coded by Paris Smaragdis					*/
/*	Berklee College of Music Csound development team		*/
/*	Copyright (c) August 1994.  All rights reserved			*/

#include "cs.h"
#include "aoscilx.h"

void aoscilxset(AOX *p)
{
    FUNC *ftp;

    if ((ftp = ftfind(p->ift)) != NULL)
	p->ftp = ftp;

    p->phs =  (MYFLT) ftp->flen / (esr / *p->freq);
    p->indx = 0.0f;
    p->mask = ftp->flen-1;
    p->end = (long)*p->periods;
}

void aoscilxplay(AOX *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    long	n = ksmps;

    if (ft==NULL) {
      initerror("oscilx: not initialized");
      return;
    }     
    if (!p->end)
	goto rest;
    else
	do {
	    *out++ = *p->amp * *(ft + ((long)p->indx));
	    p->indx += p->phs;
	    if (p->indx > p->mask) {
		p->indx -= p->mask;
		p->end--;
		if (!p->end)
		    goto rest;
	    }
	} while (--n);
    return;

  rest:
    do {	
	*out++ = 0.0f;
    } while (--n);
}
