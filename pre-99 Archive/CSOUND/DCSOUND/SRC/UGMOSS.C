							/* ugmoss.c */
#include "cs.h"
#include "ugmoss.h"

/****************************************************************************** 
  this code was written in feburary 2001
  by william 'pete' moss. <bantha@bigfoot.com>
  no copyright, since it seems silly to copyright a well-known algorithm.
******************************************************************************/

void dconvset(DCONV *p)
{
    FUNC *ftp;

    p->len = (int)*p->isize;
    if ((ftp = ftfind(p->ifn)) != NULL) {			/* find table */
      p->ftp = ftp;
      if (ftp->flen < p->len) p->len = ftp->flen;		/* correct len if flen shorter */
    }
    else 
      initerror(Str(X_1557,"No table for dconv"));
                    
    if (p->sigbuf.auxp == NULL || p->sigbuf.size < p->len*sizeof(MYFLT))
      auxalloc(p->len*sizeof(MYFLT), &p->sigbuf);
    p->curp = (MYFLT *)p->sigbuf.auxp;
}

void dconv(DCONV *p)
{
    long i;
    int nsmps = ksmps;
    long len = p->len;
    MYFLT *ar, *ain, *ftp, *startp, *endp, *curp;
    MYFLT sum;
    
    ain = p->ain;               		/* read saved values */
    ar = p->ar;
    ftp = p->ftp->ftable;
    startp = (MYFLT *) p->sigbuf.auxp;
    endp = startp + len;
    curp = p->curp;
    
    do {
      *curp = *ain++;				/* get next input sample */
      sum = FL(0.0);
      for (i=0; i<len; i++) {
        sum += *curp * *(ftp + i);		/* do the convolution */
        if (++curp >= endp) curp = startp;	/* update the ptr as well */
      }
      if (--curp < startp) curp += len;		/* correct for last ++curp */
      *ar++ = sum;
    } while (--nsmps);
    
    p->curp = curp;
}

/* end of ugmoss.c */
