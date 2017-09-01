/**************************************************************/
/*************sndwarp******************************************/
/*** By Richard Karpen - 1992, 1995, 1997 *********************/
/**************************************************************/
/*This is a version that uses table lookup instead of reading */
/*from soundfiles.                                            */
/**************************************************************/

#include "cs.h"			
#include "sndwarp.h"

extern	int	ksmps;

void sndwarpgetset(SNDWARP *p)
{
    int		i;
    int		nsections;
    FUNC	*ftpWind, *ftpSamp;
    WARPSECTION *exp;    
    char	*auxp;

    nsections = (int)*p->ioverlap;
    if ((auxp = p->auxch.auxp) == NULL || nsections != p->nsections) { 
      if (nsections != p->nsections) 
	auxp = p->auxch.auxp=NULL;
      auxalloc((long)nsections*sizeof(WARPSECTION), &p->auxch);
      auxp = p->auxch.auxp;
      p->nsections = nsections;
    }
    p->exp = (WARPSECTION *)auxp;

    if ((ftpSamp = ftfind(p->isampfun)) == NULL) return;
    p->ftpSamp  = ftpSamp;
    p->sampflen = ftpSamp->flen;
	
    if ((ftpWind = ftfind(p->ifn)) == NULL) return;
    p->ftpWind = ftpWind;
    p->flen=ftpWind->flen;
	
    p->maxFr  = -1 + ftpSamp->flen;
    p->prFlg = 1;    /* true */
    p->begin = (int)(*p->ibegin * esr);
    
    exp = p->exp;
    exp--;
    for (i=0; i< *p->ioverlap; i++) {
      exp++;
      if (i==0) {
	exp->wsize = (int)*p->iwsize;
	exp->cnt = 0;
	exp->ampphs = FL(0.0);
      }
      else {
	exp->wsize = (int)(*p->iwsize + 
			   (((MYFLT)rand()/RAND_MAX)*(*p->irandw)));
	exp->cnt=(int)(exp->wsize*((MYFLT)i/(*p->ioverlap)));
	exp->ampphs = p->flen*((MYFLT)i/(*p->ioverlap));
      }
      exp->offset = (MYFLT)p->begin;
      exp->ampincr = (MYFLT)p->flen/(exp->wsize-1);
      exp->section = i+1;  /* section number just used for debugging! */

    }
    p->ampcode = (p->XINCODE & 02) ? 1 : 0;
    p->timewarpcode = (p->XINCODE & 01) ? 1 : 0;
    p->resamplecode = (p->XINCODE & 04) ? 1 : 0;
}

void sndwarp(SNDWARP *p)
{
    int		nsmps = ksmps;
    MYFLT	frm0,frm1;
    long	base, longphase;
    MYFLT	frac, frIndx;
    MYFLT	*r1, *r2, *amp, *timewarpby, *resample;
    WARPSECTION *exp;    
    FUNC	*ftpWind, *ftpSamp;
    int		i;
    MYFLT	v1, v2, windowamp, fract;
    MYFLT	flen = (MYFLT)p->flen;
    MYFLT	iwsize = *p->iwsize;

    if (p->auxch.auxp==NULL) {
      initerror(Str(X_1193,"sndwarp: not initialized"));
      return;
    }
    r1 = p->r1;
    r2 = p->r2;
    for (i=0; i<nsmps; i++) {
    	*r1++ = FL(0.0);
    	if (p->OUTOCOUNT >1) *r2++ = FL(0.0);
    }
    exp = p->exp;
    ftpWind = p->ftpWind;
    ftpSamp = p->ftpSamp;
    
    exp--;
    for (i=0; i<*p->ioverlap; i++) {
      exp++;
      nsmps = ksmps;
      r1 = p->r1;
      if (p->OUTOCOUNT >1)  r2 = p->r2;
      resample = p->xresample;
      timewarpby = p->xtimewarp;
      amp = p->xamp;
      
      do {
	if (exp->cnt < exp->wsize) goto skipover;
		
 	if (*p->itimemode!=0)
 	  exp->offset=(esr * *timewarpby)+p->begin;
	else 
	  exp->offset += (MYFLT)exp->wsize/(*timewarpby);
/* printf("section=%d  offset=%f\n", exp->section, exp->offset); */
	
	exp->cnt=0;
	exp->wsize = (int)(iwsize + (((MYFLT)rand()/RAND_MAX)*(*p->irandw)));
	/* printf("section =%d  windowsize =%d\n", exp->section, exp->wsize); */
	exp->ampphs = FL(0.0);
	exp->ampincr = flen/(exp->wsize-1);

skipover:

	frIndx =(MYFLT)((exp->cnt * *resample)  + exp->offset);
	exp->cnt += 1;
	if (frIndx > (MYFLT)p->maxFr) { /* not past last one */
	    frIndx = (MYFLT)p->maxFr;
	    if (p->prFlg) {
		p->prFlg = 0;   /* false */
		warning(Str(X_451,"SNDWARP at last sample frame"));
	    }
	}
	longphase = (long)exp->ampphs;
	if(longphase > p->flen-1) longphase = p->flen-1;
	v1 = *(ftpWind->ftable + longphase);
	v2 = *(ftpWind->ftable + longphase + 1);
	fract = (MYFLT)(exp->ampphs - (long)exp->ampphs);
	windowamp = v1 + (v2 - v1)*fract;
	exp->ampphs += exp->ampincr;

	base = (long)frIndx;	/* index of basis frame of interpolation */
	frac = ((MYFLT)(frIndx - (MYFLT)base));
	frm0 = *(ftpSamp->ftable + base);
	frm1 = *(ftpSamp->ftable + (base+1));
/* printf("Base=%ld, frm0, frm1 = %f, %f; frac=%f\n", base, frm0, frm1, frac); */
	if (frac != FL(0.0)) {
	  *r1++ += ((frm0 + frac*(frm1-frm0)) * windowamp) * *amp;
	  if (i==0) 
	   if (p->OUTOCOUNT > 1)
	     *r2++ += (frm0 + frac*(frm1-frm0)) * *amp;
	}
	else {	    
	  *r1++ += (frm0 * windowamp) * *amp; 
	  if (i==0)
	    if (p->OUTOCOUNT > 1)
	      *r2++ += frm0 * *amp;
	}
	if (p->ampcode) amp++;
	if (p->timewarpcode) timewarpby++;
	if (p->resamplecode) resample++;
      } while(--nsmps); 
      		
    }

}

/****************************************************************/
/**************STEREO VERSION OF SNDWARP*************************/
/****************************************************************/

void sndwarpstgetset(SNDWARPST *p)
{
    int		i;
    int		nsections;
    FUNC	*ftpWind, *ftpSamp;
    WARPSECTION *exp;    
    char	*auxp;

    if (p->OUTOCOUNT > 2 && p->OUTOCOUNT < 4) {
   	 sprintf(errmsg,
		 Str(X_543,"Wrong number of outputs in sndwarpst; must be 2 or 4"));
        goto sndwerr;
    }
    nsections = (int)*p->ioverlap;
    if ((auxp = p->auxch.auxp) == NULL || nsections != p->nsections) { 
      if (nsections != p->nsections) 
	auxp=p->auxch.auxp=NULL;
      auxalloc((long)nsections*sizeof(WARPSECTION), &p->auxch);
      auxp = p->auxch.auxp;
      p->nsections = nsections;
    }
    p->exp = (WARPSECTION *)auxp;

    if ((ftpSamp = ftfind(p->isampfun)) == NULL) return;
    p->ftpSamp = ftpSamp;
    p->sampflen=ftpSamp->flen;
	
    if ((ftpWind = ftfind(p->ifn)) == NULL) return;
    p->ftpWind = ftpWind;
    p->flen=ftpWind->flen;
	
    p->maxFr  = -1L + (long)(ftpSamp->flen*FL(0.5));
    p->prFlg = 1;    /* true */
    p->begin = (int)(*p->ibegin * esr);
    
    exp = p->exp;
    exp--;
    for (i=0; i< *p->ioverlap; i++) {
      exp++;
      if (i==0) {
	exp->wsize = (int)*p->iwsize;
	exp->cnt=0;
	exp->ampphs = FL(0.0);
      }
      else {
	exp->wsize = (int)(*p->iwsize + 
	  (((MYFLT)rand()/RAND_MAX)*(*p->irandw)));
	exp->cnt=(int)(exp->wsize*((MYFLT)i/(*p->ioverlap)));
	exp->ampphs = p->flen*(i/(*p->ioverlap));
      }
      exp->offset = (MYFLT)p->begin;
      exp->ampincr = (MYFLT)p->flen/(exp->wsize-1);
      exp->section = i+1;  /* section number just used for debugging! */

    }
    p->ampcode = (p->XINCODE & 02) ? 1 : 0;
    p->timewarpcode = (p->XINCODE & 01) ? 1 : 0;
    p->resamplecode = (p->XINCODE & 04) ? 1 : 0;
    return;
sndwerr:
    initerror(errmsg);
}

void sndwarpstset(SNDWARPST *p)
{
    sndwarpstgetset(p);
}

void sndwarpst(SNDWARPST *p)
{
    int		nsmps = ksmps;
    MYFLT	frm10,frm11, frm20, frm21;
    long	base, longphase;
    MYFLT	frac, frIndx;
    MYFLT	*r1, *r2,*r3, *r4, *amp, *timewarpby, *resample;
    WARPSECTION *exp;    
    FUNC	*ftpWind, *ftpSamp;
    int		i;
    MYFLT	v1, v2, windowamp, fract;
    MYFLT	flen = (MYFLT)p->flen;
    MYFLT	iwsize = *p->iwsize;

    if (p->auxch.auxp==NULL) {  /* RWD fix */
      initerror(Str(X_1194,"sndwarpst: not initialized"));
      return;
    }
    r1 = p->r1;
    r2 = p->r2;
    r3 = p->r3;
    r4 = p->r4;
    for (i=0; i<nsmps; i++) {
    	*r1++ = FL(0.0);
    	*r2++ = FL(0.0);
    	if (p->OUTOCOUNT >2) {
		*r3++ = FL(0.0);
		*r4++ = FL(0.0);
	}
    }
    exp = p->exp;
    ftpWind = p->ftpWind;
    ftpSamp = p->ftpSamp;
    
    exp--;
    for (i=0; i<*p->ioverlap; i++) {
      exp++;
      nsmps = ksmps;
      r1 = p->r1;
      r2 = p->r2;
      if (p->OUTOCOUNT >2)  {
	r3 = p->r3;
	r4 = p->r4;
      }
      resample = p->xresample;
      timewarpby = p->xtimewarp;
      amp = p->xamp;
      
      do {
	if (exp->cnt < exp->wsize) goto skipover;
		
 	if (*p->itimemode!=0)
 	  exp->offset=(esr * *timewarpby)+p->begin;
	else 
	  exp->offset += (MYFLT)exp->wsize/(*timewarpby);
/* printf("section=%d  offset=%f\n", exp->section, exp->offset); */

	exp->cnt=0;
	exp->wsize = (int)(iwsize + (((MYFLT)rand()/RAND_MAX)*(*p->irandw)));
	/* printf("section =%d  windowsize =%d\n", exp->section, exp->wsize); */
	exp->ampphs = FL(0.0);
	exp->ampincr = flen/(exp->wsize-1);

skipover:
	frIndx =(MYFLT)(exp->cnt * *resample)  + (MYFLT)exp->offset;
	exp->cnt += 1;
	if (frIndx > (MYFLT)p->maxFr) {  /* not past last one */
	    frIndx = (MYFLT)p->maxFr;
	    if (p->prFlg) {
		p->prFlg = 0;   /* false */
		warning(Str(X_451,"SNDWARP at last sample frame"));
	    }
	}
	longphase = (long)exp->ampphs;
	if(longphase > p->flen-1) longphase = p->flen-1;
	v1 = *(ftpWind->ftable + longphase);
	v2 = *(ftpWind->ftable + longphase + 1);
	fract = (MYFLT)(exp->ampphs - (long)exp->ampphs);
	windowamp = v1 + (v2 - v1)*fract;
	exp->ampphs += exp->ampincr;

	base = (long)frIndx;	/* index of basis frame of interpolation */
	frac = ((MYFLT)(frIndx - (MYFLT)base));

	frm10 = *(ftpSamp->ftable + (base * 2));
	frm11 = *(ftpSamp->ftable + ((base+1)*2));
	frm20 = *(ftpSamp->ftable + (base*2)+1);
	frm21 = *(ftpSamp->ftable + (((base+1)*2)+1));
	if (frac != FL(0.0)) {
	  *r1++ += ((frm10 + frac*(frm11-frm10)) * windowamp) * *amp;
	  *r2++ += ((frm20 + frac*(frm21-frm20)) * windowamp) * *amp;
	  if (i==0) 
	   if (p->OUTOCOUNT > 2) {
	     *r3++ += (frm10 + frac*(frm11-frm10)) * *amp;
	     *r4++ += (frm20 + frac*(frm21-frm20)) * *amp;
	   }
	}
	else {	    
	  *r1++ += (frm10 * windowamp) * *amp; 
	  *r2++ += (frm20 * windowamp) * *amp;
	  if (i==0)
	    if (p->OUTOCOUNT > 2) {
	     *r3++ += frm10 * *amp;  
	     *r4++ += frm20 * *amp;
	   }
	}
	if (p->ampcode) amp++;
	if (p->timewarpcode) timewarpby++;
	if (p->resamplecode) resample++;
      } while(--nsmps); 
      		
    }
}
