/* oscillator opcodes by Gabriel Maldonado */
#include "cs.h"
#include "Gab_osc.h"
extern   FUNC   *ftnp2find(MYFLT*);       /* permit non-power-of-2 ftable (no masks) */



void lposcint(LPOSC *p)
{
    
   	double	*phs= &p->phs;
   	double	si= *p->freq * (p->fsr/esr);
    MYFLT	*out = p->out;
	short	*ft = (short *) p->ftp->ftable, *curr_samp;
	MYFLT	fract; 
    long	n = ksmps;
    double	loop, end, looplength /* = p->looplength */ ; 

	if ((loop= *p->kloop) < 0) loop=0;
	if ((end= *p->kend) > p->tablen || end <=0) end = p->tablen;
	looplength = end - loop;
		
	do {
		curr_samp= ft + (long)*phs;
	    fract= (MYFLT)(*phs - (long)*phs);
	    *out++ = *p->amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
	    *phs += si;
	    while (*phs  >= end) *phs -= looplength;
	    while (*phs  < loop) *phs += looplength;
	}while (--n);
}


void lposcinta(LPOSC *p)
{
    
   	double	*phs= &p->phs;
   	double	si= *p->freq * (p->fsr/esr);
    MYFLT	*out = p->out,  *amp=p->amp;
	short	*ft = (short *) p->ftp->ftable, *curr_samp;
	MYFLT	fract; 
    long	n = ksmps;
    double	loop, end, looplength /* = p->looplength */ ; 

	if ((loop= *p->kloop) < 0) loop=0;
	if ((end= *p->kend) > p->tablen || end <=0) end = p->tablen;
	looplength = end - loop;
	do {
		curr_samp= ft + (long)*phs;
	    fract= (MYFLT)(*phs - (long)*phs);
	    *out++ = *amp++ * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
	    *phs += si;
	    while (*phs  >= end) *phs -= looplength;
	    while (*phs  < loop) *phs += looplength;
	}while (--n);
}

//-------------------------

void posc_set( POSC *p)
{
    FUNC *ftp;

    if ((ftp = ftnp2find(p->ift)) == NULL) return;
    p->ftp    = ftp;
    p->tablen = ftp->flen;
	p->tablenUPsr = p->tablen /esr;
    p->phs    = *p->iphs * p->tablen;
}

void posckk(POSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs = p->phs;
    double      si = *p->freq * p->tablenUPsr; /* gab c3 */
    long	n = ksmps;
    MYFLT       amp = *p->amp;

    do {
      curr_samp = ft + (long)phs;
      fract     = (MYFLT)(phs - (long)phs);
      *out++    = amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
      phs      += si;
      while (phs >= p->tablen)
        phs -= p->tablen;
      while (phs < 0 )
        phs += p->tablen;	

    } while (--n);
    p->phs = phs;
}


void poscaa(POSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs = p->phs;
    /*double      si = *p->freq * p->tablen / esr;*/

	MYFLT	*freq = p->freq;
    long	n = ksmps;
    MYFLT   *amp = p->amp; /*gab c3*/

    do {
      curr_samp = ft + (long)phs;
      fract     = (MYFLT)(phs - (long)phs);
      *out++    = *amp++ * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);/* gab c3 */
      phs      += *freq++ * p->tablenUPsr;/* gab c3 */
      while (phs >= p->tablen)
        phs -= p->tablen;
      while (phs < 0 )
        phs += p->tablen;	

    } while (--n);
    p->phs = phs;
}


void poscka(POSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs = p->phs;
    // double      si = *p->freq * p->tablenUPsr; /* gab c3 */
    long	n = ksmps;
    MYFLT       amp = *p->amp;
	MYFLT	*freq = p->freq;

    do {
      curr_samp = ft + (long)phs;
      fract     = (MYFLT)(phs - (long)phs);
      *out++    = amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
      phs      += *freq++ * p->tablenUPsr;/* gab c3 */
      while (phs >= p->tablen)
        phs -= p->tablen;
      while (phs < 0 )
        phs += p->tablen;	

    } while (--n);
    p->phs = phs;
}

void poscak(POSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs = p->phs;
	double      si = *p->freq * p->tablenUPsr;
    long	n = ksmps;
    MYFLT   *amp = p->amp; /*gab c3*/

    do {
      curr_samp = ft + (long)phs;
      fract     = (MYFLT)(phs - (long)phs);
      *out++    = *amp++ * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);/* gab c3 */
      phs      += si;
      while (phs >= p->tablen)
        phs -= p->tablen;
      while (phs < 0 )
        phs += p->tablen;	

    } while (--n);
    p->phs = phs;
}


void kposc(POSC *p)
{
    double	phs = p->phs;
    double      si = *p->freq * p->tablen / ekr;
    MYFLT	*curr_samp = p->ftp->ftable + (long)phs;
    MYFLT	fract = (MYFLT)(phs - (long)phs);

    *p->out = *p->amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
    phs    += si;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;	
    p->phs = phs;
}

void posc3(POSC *p)
{
    MYFLT	*out = p->out, *ftab = p->ftp->ftable;
    MYFLT	fract;
    double	phs  = p->phs;
    double      si   = *p->freq * p->tablen / esr;
    long	n    = ksmps;
    MYFLT       amp = *p->amp;
    int         x0;
    MYFLT       y0, y1, ym1, y2;
	
    do {
		x0    = (long)phs;
		fract = (MYFLT)(phs - x0);
		x0--;
		if (x0<0) {
			ym1 = ftab[p->tablen-1]; x0 = 0;
		}
		else ym1 = ftab[x0++];
		y0    = ftab[x0++];
		y1    = ftab[x0++];
		if (x0>p->tablen) y2 = ftab[1]; else y2 = ftab[x0];
		{
			MYFLT frsq = fract*fract;
			MYFLT frcu = frsq*ym1;
			MYFLT t1   = y2 + 3.0f*y0;
			*out++     = amp * (y0 + 0.5f*frcu +
				fract*(y1 - frcu/6.0f - t1/6.0f - ym1/3.0f) +
				frsq*fract*(t1/6.0f - 0.5f*y1) +
				frsq*(0.5f* y1 - y0));
		}
		phs += si;
		while (phs >= p->tablen)
			phs -= p->tablen;
		while (phs < 0 )
			phs += p->tablen;	
    } while (--n);
    p->phs = phs;
}

void kposc3(POSC *p)
{
    double	phs   = p->phs;
    double      si    = *p->freq * p->tablen / ekr;
    MYFLT	*ftab = p->ftp->ftable;
    int         x0    = (long)phs;
    MYFLT	fract = (MYFLT)(phs - x0);
    MYFLT       y0, y1, ym1, y2;
	
    x0--;
    if (x0<0) {
		ym1 = ftab[p->tablen-1]; x0 = 0;
    }
    else ym1 = ftab[x0++];
    y0 = ftab[x0++];
    y1 = ftab[x0++];
    if (x0>p->tablen) y2 = ftab[1]; else y2 = ftab[x0];
    {
		MYFLT frsq = fract*fract;
		MYFLT frcu = frsq*ym1;
		MYFLT t1   = y2 + 3.0f*y0;
		*p->out    = *p->amp * (y0 + 0.5f*frcu +
			fract*(y1 - frcu/6.0f - t1/6.0f - ym1/3.0f) +
			frsq*fract*(t1/6.0f - 0.5f*y1) +
			frsq*(0.5f* y1 - y0));
    }
    phs += si;
    while (phs >= p->tablen)
		phs -= p->tablen;
    while (phs < 0 )
		phs += p->tablen;	
    p->phs = phs;
}

void lposc_set(LPOSC *p)
{
    FUNC *ftp;
    double  loop, end, looplength;
    if ((ftp = ftnp2find(p->ift)) == NULL) return;
    if (!(p->fsr=ftp->gen01args.sample_rate)){
      printf("lposcil: no sample rate stored in function assuming=sr\n");
      p->fsr=esr;
    }
    p->ftp    = ftp;
    p->tablen = ftp->flen;
    /* changed from
       p->phs    = *p->iphs * p->tablen;   */
    if ((loop = *p->kloop) < 0) loop=0;
    if ((end = *p->kend) > p->tablen || end <=0 ) end = p->tablen;
    looplength = end - loop;

	if (*p->iphs >= 0)
        p->phs = *p->iphs;
	while (p->phs >= end)
        p->phs -= looplength;
}


void lposc(LPOSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs= p->phs, si= *p->freq * (p->fsr/esr);
    long	n = ksmps;
    double	loop, end, looplength /* = p->looplength */;
    MYFLT       amp = *p->amp;

    if ((loop = *p->kloop) < 0) loop=0;
    if ((end = *p->kend) > p->tablen || end <=0 ) end = p->tablen;
    looplength = end - loop;

    do {
      curr_samp = ft + (long)phs;
      fract = (MYFLT) phs - (MYFLT)((long)phs);
      *out++ = amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
      phs += si;
      while (phs >= end) phs -= looplength;
      while (phs < loop) phs += looplength;
    } while (--n);
    p->phs = phs;
}

void lposc3(LPOSC *p)
{
    MYFLT	*out = p->out, *ftab = p->ftp->ftable;
    MYFLT	fract;
    double	phs = p->phs, si= *p->freq * (p->fsr/esr);
    long	n = ksmps;
    double	loop, end, looplength /* = p->looplength */;
    MYFLT       amp = *p->amp;
    int         x0;
    MYFLT       y0, y1, ym1, y2;

    if ((loop = *p->kloop) < 0) loop=0;
    if ((end = *p->kend) > p->tablen || end <=0 ) end = p->tablen;
    looplength = end - loop;

    do {
      x0    = (long)phs;
      fract = (MYFLT) phs - (MYFLT)x0;
      x0--;
      if (x0<0) {
        ym1 = ftab[p->tablen-1]; x0 = 0;
      }
      else ym1 = ftab[x0++];
      y0    = ftab[x0++];
      y1    = ftab[x0++];
      if (x0>p->tablen) y2 = ftab[1]; else y2 = ftab[x0];
      {
        MYFLT frsq = fract*fract;
        MYFLT frcu = frsq*ym1;
        MYFLT t1   = y2 + 3.0f*y0;
        *out++     = amp * (y0 + 0.5f*frcu +
                            fract*(y1 - frcu/6.0f - t1/6.0f - ym1/3.0f) +
                            frsq*fract*(t1/6.0f - 0.5f*y1) +
                            frsq*(0.5f* y1 - y0));
      }
      phs += si;
      while (phs >= end) phs -= looplength;
      while (phs < loop) phs += looplength;
    } while (--n);
    p->phs = phs;
}


