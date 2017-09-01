#include "cs.h"
#include <math.h>
#include "vibrato.h"
/*-------------- START Gab --------------------------------------------*/ /* gab d5*/

void ikRangeRand(RANGERAND *p) { /* gab d5*/
	*p->out = randGab * (*p->max - *p->min) + *p->min;
}

void aRangeRand(RANGERAND *p) { /* gab d5*/
	MYFLT min = *p->min, max = *p->max, *out = p->out;
	long n = ksmps;
	
	do {
		*out++ = randGab * (max - min) + min;
	} while (--n);
}

void ikDiscreteUserRand(DURAND *p) { /* gab d5*/
    if (p->pfn != (long)*p->tableNum) {
		if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
			sprintf(errmsg, "invalid table no. %f", *p->tableNum);
			perferror(errmsg);
			return ;
		}
		p->pfn = (long)*p->tableNum;
    }
	*p->out = p->ftp->ftable[(long)(randGab * p->ftp->flen+.5)];
}

void aDiscreteUserRand(DURAND *p) { /* gab d5*/
	MYFLT *out = p->out, *table;
	long n = ksmps, flen;

	if (p->pfn != (long)*p->tableNum) {
		if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
			sprintf(errmsg, "invalid table no. %f", *p->tableNum);
			perferror(errmsg);
			return ;
		}
		p->pfn = (long)*p->tableNum;
    }
	table = p->ftp->ftable;
	flen = p->ftp->flen;
	do {
		*out++ = table[(long)(randGab * flen +.5)]; 
	} while (--n);
}


void ikContinuousUserRand(CURAND *p) { /* gab d5*/
	long indx;
	MYFLT findx, fract,v1,v2;
    if (p->pfn != (long)*p->tableNum) {
		if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
			sprintf(errmsg, "invalid table no. %f", *p->tableNum);
			perferror(errmsg);
			return ;
		}
		p->pfn = (long)*p->tableNum;
    }
	findx = (MYFLT) (randGab * p->ftp->flen+.5);
	indx = (long) findx;
	fract = findx - indx;
    v1 = *(p->ftp->ftable + indx);
    v2 = *(p->ftp->ftable + indx + 1);
    *p->out = (v1 + (v2 - v1) * fract) * (*p->max - *p->min) + *p->min;
}

void aContinuousUserRand(CURAND *p) { /* gab d5*/
	MYFLT min = *p->min, max = *p->max;
	MYFLT *out = p->out, *table;
	long n = ksmps, flen, indx;
	MYFLT findx, fract,v1,v2;

    if (p->pfn != (long)*p->tableNum) {
		if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
			sprintf(errmsg, "invalid table no. %f", *p->tableNum);
			perferror(errmsg);
			return ;
		}
		p->pfn = (long)*p->tableNum;
    }

	table = p->ftp->ftable;
	flen = p->ftp->flen;

	do {
		findx = (MYFLT) (randGab * flen + .5);
		indx = (long) findx;
		fract = findx - indx;
		v1 = table[indx];
		v2 = table[indx+1];
		*out++ = (v1 + (v2 - v1) * fract) * (max - min) + min;
		//*out++ = table[(long)(randGab * flen +.5)]  * (*max - *min) + *min; 
	} while (--n);
}


void randomi_set(RANDOMI *p)  
{
    p->cpscod = (p->XINCODE & 01) ? 1 : 0;
	p->dfdmax=0;
}

void krandomi(RANDOMI *p)
{					
    *p->ar = (p->num1 + (MYFLT)p->phs * p->dfdmax) * (*p->max - *p->min) + *p->min ;
    p->phs += (long)(*p->xcps * kicvt);	
    if (p->phs >= MAXLEN) {		
		p->phs &= PHMASK;		
		p->num1 = p->num2;
		p->num2 = randGab ;	
		p->dfdmax = (p->num2 - p->num1) / fmaxlen;
    }
}

void randomi(RANDOMI *p)
{
    long	phs = p->phs, inc;
    int		n = ksmps;
    MYFLT	*ar, *cpsp;
	MYFLT amp, min;
	
    cpsp = p->xcps;
	min = *p->min;
    amp =  (*p->max - min);
    ar = p->ar;
    inc = (long)(*cpsp++ * sicvt);
    do {
		*ar++ = (p->num1 + (MYFLT)phs * p->dfdmax) * amp + min;
		phs += inc;	
		if (p->cpscod)
			inc = (long)(*cpsp++ * sicvt);	
		if (phs >= MAXLEN) {
			phs &= PHMASK;
			p->num1 = p->num2;
			p->num2 = randGab; 
			p->dfdmax = (p->num2 - p->num1) / fmaxlen;
		}
    } while (--n);
    p->phs = phs;
}

void randomh_set(RANDOMH *p)
{
    p->cpscod = (p->XINCODE & 01) ? 1 : 0;
}

void krandomh(RANDOMH *p)
{
    *p->ar = p->num1 * (*p->max - *p->min) + *p->min;  
    p->phs += (long)(*p->xcps * kicvt) ;
		if (p->phs >= MAXLEN) {
			p->phs &= PHMASK;	
			p->num1 = randGab; 
			
		}
}

void randomh(RANDOMH *p)
{
    long	phs = p->phs, inc;
    int	n = ksmps;
    MYFLT	*ar, *cpsp;
	MYFLT amp, min;

    cpsp = p->xcps;
	min = *p->min;
    amp =  (*p->max - min);
    ar = p->ar;
    inc = (long)(*cpsp++ * sicvt);
    do {
		*ar++ = p->num1 * amp + min;	
		phs += inc;				
		if (p->cpscod)
			inc = (long)(*cpsp++ * sicvt);
		if (phs >= MAXLEN) {			
			phs &= PHMASK;
			p->num1 = randGab; 
		}
    } while (--n);
    p->phs = phs;
}



static int one2kicvt;


void jitter2_set(JITTER2 *p)
{
	if (   *p->cps1==0 && *p->cps2==0 && *p->cps2==0 /* accept default values */
		&& *p->amp1==0 && *p->amp2==0 && *p->amp3==0) 
		p->flag = 1;
	else
		p->flag = 0;
	p->dfdmax1 = p->dfdmax2 = p->dfdmax3 = 0;
}


void jitter2(JITTER2 *p)
{
    MYFLT out1,out2,out3;
	out1 = (p->num1a + (MYFLT)p->phs1 * p->dfdmax1);
	out2 = (p->num1b + (MYFLT)p->phs2 * p->dfdmax2);
	out3 = (p->num1c + (MYFLT)p->phs3 * p->dfdmax3);

	if (p->flag) { /* accept default values */
	   *p->out = (out1* .5f + out2 * .3f + out3* .2f ) * *p->gamp ;
	   p->phs1 += (long) (0.82071231913 * kicvt); 
	   p->phs2 += (long) (7.009019029039107 * kicvt);
	   p->phs3 += (long) (10 * kicvt);
	}
	else {
		*p->out = (out1* *p->amp1 + out2* *p->amp2 +out3* *p->amp3) * *p->gamp ;
		p->phs1 += (long)( *p->cps1 * kicvt);
		p->phs2 += (long)( *p->cps2 * kicvt);
		p->phs3 += (long)( *p->cps3 * kicvt);
	}
    if (p->phs1 >= MAXLEN) {		
		p->phs1 &= PHMASK;		
		p->num1a = p->num2a;
		p->num2a = BiRandGab ;	
		p->dfdmax1 = (p->num2a - p->num1a) / fmaxlen;
    }
    if (p->phs2 >= MAXLEN) {		
		p->phs2 &= PHMASK;		
		p->num1b = p->num2b;
		p->num2b = BiRandGab ;	
		p->dfdmax2 = (p->num2b - p->num1b) / fmaxlen;
    }
    if (p->phs3 >= MAXLEN) {		
		p->phs3 &= PHMASK;		
		p->num1c = p->num2c;
		p->num2c = BiRandGab ;	
		p->dfdmax3 = (p->num2c - p->num1c) / fmaxlen;
    }

}

void jitter_set(JITTER *p)
{
	p->num2 = BiRandGab;
	p->initflag=1;
}


void jitter(JITTER *p)
{
    if (p->initflag) {
		p->initflag = 0;
		*p->ar = p->num2 * *p->amp ;
		goto next;
	}
	*p->ar = (p->num1 + (MYFLT)p->phs * p->dfdmax) * *p->amp ;
    p->phs += (long)(p->xcps * kicvt);	

	if (p->phs >= MAXLEN) {
next:
		p->xcps =  randGab  * (*p->cpsMax - *p->cpsMin) + *p->cpsMin;
		p->phs &= PHMASK;		
		p->num1 = p->num2;
		p->num2 = BiRandGab ;	
		p->dfdmax = (p->num2 - p->num1) / fmaxlen;
    }
}

void jitters_set(JITTERS *p)
{
	p->num1 = BiRandGab;
	p->num2 = BiRandGab;
	p->df1=0;
	p->initflag=1;
	p->cod = (p->XINCODE & 02) ? 1 : 0;

}


void jitters(JITTERS *p)
{
	MYFLT	x, c3= p->c3, c2= p->c2;
	MYFLT	f0 = p->num0, df0= p->df0;

    if (p->initflag == 1) {
		p->initflag =0;
		goto next;
	}
	p->phs += p->si;
	if (p->phs >= 1.) {
		MYFLT	slope, resd1, resd0, f2, f1;
next:
		p->si =  (randGab  * (*p->cpsMax - *p->cpsMin) + *p->cpsMin)/ekr ;
		while (p->phs > 1.)
			p->phs -=1.;
		f0 = p->num0 = p->num1;
		f1 = p->num1 = p->num2;
		f2 = p->num2 = BiRandGab ;
		df0 = p->df0 = p->df1;
		p->df1 = ( f2  - f0 ) / 2.f;
		slope = f1 - f0 ;	
		resd0 = df0 - slope;		
		resd1 = p->df1 - slope;		
		c3 = p->c3 = resd0 + resd1;
		c2 = p->c2 = - (resd1 + 2.0f* resd0);
    }
	x= (MYFLT) p->phs;
	*p->ar = (((c3 * x + c2) * x + df0) * x + f0) * *p->amp ;
}

void jittersa(JITTERS *p)
{

	MYFLT	x, c3=p->c3, c2=p->c2;
	MYFLT   f0= p->num0, df0 = p->df0;
	MYFLT *ar = p->ar, *amp = p->amp;
	MYFLT  cpsMax = *p->cpsMax, cpsMin = *p->cpsMin;
	int		n = ksmps, cod = p->cod;
	double phs = p->phs, si = p->si;

    if (p->initflag) {
		p->initflag = 0;
		goto next;

	}
	do {
		phs += si;	
		if (phs >= 1.) {
			MYFLT	slope, resd1, resd0, f2, f1;
next:
			si =  (randGab  * (cpsMax - cpsMin) + cpsMin)/esr ;
			while (phs > 1.) 
				phs -=1.;
			f0 = p->num0 = p->num1;
			f1 = p->num1 = p->num2;
			f2 = p->num2 = BiRandGab ;
			df0 = p->df0 = p->df1;
			p->df1 = ( f2 - f0 )/ 2.f;
			slope = f1 - f0;	
			resd0 = df0 - slope;		
			resd1 = p->df1 - slope;		
			c3 = p->c3 = resd0 + resd1;
			c2 = p->c2 = - (resd1 + 2.0f* resd0);
		}
		x = (MYFLT) phs;
		*ar++ = (((c3 * x + c2) * x + df0) * x + f0) * *amp;
		if (cod) amp++;
	}while(--n);
	p->phs = phs;
	p->si =si;
}



void random3_set(RANDOM3 *p)
{
	p->num1 = randGab;
	p->num2 = randGab;
	p->df1=0;
	p->initflag=1;
	p->cod = (p->XINCODE & 02) ? 1 : 0;
}


void random3(RANDOM3 *p)
{
	MYFLT	x, c3= p->c3, c2= p->c2;
	MYFLT	f0 = p->num0, df0= p->df0;

    if (p->initflag) {
		p->initflag =0;
		goto next;
	}
	p->phs += p->si;
	if (p->phs >= 1.) {
		MYFLT	slope, resd1, resd0, f2, f1;
next:
		p->si =  (randGab  * (*p->cpsMax - *p->cpsMin) + *p->cpsMin)/ekr ;
		while (p->phs > 1.)
			p->phs -=1.;
		f0 = p->num0 = p->num1;
		f1 = p->num1 = p->num2;
		f2 = p->num2 = randGab ;
		df0 = p->df0 = p->df1;
		p->df1 = ( f2  - f0 ) / 2.f;
		slope = f1 - f0 ;	
		resd0 = df0 - slope;		
		resd1 = p->df1 - slope;		
		c3 = p->c3 = resd0 + resd1;
		c2 = p->c2 = - (resd1 + 2.0f* resd0);
    }
	x= (MYFLT) p->phs;
	*p->ar = (((c3 * x + c2) * x + df0) * x + f0) *
			  (*p->rangeMax - *p->rangeMin) + *p->rangeMin ;
}

void random3a(RANDOM3 *p)
{

	MYFLT	x, c3=p->c3, c2=p->c2;
	MYFLT   f0= p->num0, df0 = p->df0;
	MYFLT *ar = p->ar, *rangeMin = p->rangeMin;
	MYFLT *rangeMax = p->rangeMax;
	MYFLT cpsMin = *p->cpsMin, cpsMax = *p->cpsMax;
	int		n = ksmps, cod = p->cod;
	double phs = p->phs, si = p->si;

    if (p->initflag) {
		p->initflag = 0;
		goto next;

	}
	do {
		phs += si;	
		if (phs >= 1.) {
			MYFLT	slope, resd1, resd0, f2, f1;
next:
			si =  (randGab  * (cpsMax - cpsMin) + cpsMin)/esr ;
			while (phs > 1.) 
				phs -=1.;
			f0 = p->num0 = p->num1;
			f1 = p->num1 = p->num2;
			f2 = p->num2 = BiRandGab ;
			df0 = p->df0 = p->df1;
			p->df1 = ( f2 - f0 )/ 2.f;
			slope = f1 - f0;	
			resd0 = df0 - slope;		
			resd1 = p->df1 - slope;		
			c3 = p->c3 = resd0 + resd1;
			c2 = p->c2 = - (resd1 + 2.0f* resd0);
		}
		x = (MYFLT) phs;
		*ar++ = (((c3 * x + c2) * x + df0) * x + f0) * 
				(*rangeMax - *rangeMin) + *rangeMin;
		if (cod) {
			rangeMin++;
			rangeMax++;
		}
	}while(--n);
	p->phs = phs;
	p->si =si;
}


void vibrato_set(VIBRATO *p)
{
    FUNC	*ftp;

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
      if (*p->iphs >= 0)
        p->lphs = ((long)(*p->iphs * fmaxlen)) & PHMASK;
    }
	p->xcpsAmpRate = randGab  * (*p->cpsMaxRate - *p->cpsMinRate) + *p->cpsMinRate;
	p->xcpsFreqRate = randGab  * (*p->ampMaxRate - *p->ampMinRate) + *p->ampMinRate;
    p->tablen = ftp->flen;
	p->tablenUPkr = p->tablen /ekr;

}


void vibrato(VIBRATO *p)
{
 
    FUNC	*ftp;
    double	phs, inc;
    MYFLT   *ftab, fract, v1;
	//extern MYFLT pow(2,MYFLT x);
	MYFLT RandAmountAmp,RandAmountFreq;
	
	RandAmountAmp = (p->num1amp + (MYFLT)p->phsAmpRate * p->dfdmaxAmp) * *p->randAmountAmp ;
	RandAmountFreq = (p->num1freq + (MYFLT)p->phsFreqRate * p->dfdmaxFreq) * *p->randAmountFreq ;
  
	phs = p->lphs;
	ftp = p->ftp;
	if (ftp==NULL) {
          initerror("vibrato(krate): not initialized");
          return;
	}
	fract = (MYFLT) (phs - (long)phs);  
	ftab = ftp->ftable + (long)phs;
	v1 = *ftab++;
	*p->out = (v1 + (*ftab - v1) * fract) * (*p->AverageAmp * pow(2,RandAmountAmp));
	inc = ( *p->AverageFreq * pow(2,RandAmountFreq)) *  p->tablenUPkr; //(long)(( *p->AverageFreq * powof2(RandAmountFreq) ) * kicvt);
	phs += inc;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;	

	p->lphs = phs;

	p->phsAmpRate += (long)(p->xcpsAmpRate * kicvt);	
    if (p->phsAmpRate >= MAXLEN) {
		p->xcpsAmpRate =  randGab  * (*p->ampMaxRate - *p->ampMinRate) + *p->ampMinRate;
		p->phsAmpRate &= PHMASK;		
		p->num1amp = p->num2amp;
		p->num2amp = BiRandGab ;	
		p->dfdmaxAmp = (p->num2amp - p->num1amp) / fmaxlen;
    }

	p->phsFreqRate += (long)(p->xcpsFreqRate * kicvt);	
    if (p->phsFreqRate >= MAXLEN) {
		p->xcpsFreqRate =  randGab  * (*p->cpsMaxRate - *p->cpsMinRate) + *p->cpsMinRate;
		p->phsFreqRate &= PHMASK;		
		p->num1freq = p->num2freq;
		p->num2freq = BiRandGab ;	
		p->dfdmaxFreq = (p->num2freq - p->num1freq) / fmaxlen;
    }
}




void vibr_set(VIBR *p)	  /* faster and easier to use than vibrato, but less flexible */
{
	
    FUNC	*ftp;

	#define randAmountAmp	1.59055f   /* these default values are far from being the best */
	#define	randAmountFreq	0.629921f  /* if you think you found better ones, please tell me*/
	#define	ampMinRate		1.f 		  /* them by posting a message to g.maldonado@agora.stm.it */
	#define	ampMaxRate		3.f 
	#define	cpsMinRate		1.19377f
	#define	cpsMaxRate		2.28100f  
	#define	iphs			0.f

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
      p->lphs = ((long)(iphs * fmaxlen)) & PHMASK;
    }
	p->xcpsAmpRate = randGab  * (cpsMaxRate - cpsMinRate) + cpsMinRate;
	p->xcpsFreqRate = randGab  * (ampMaxRate - ampMinRate) + ampMinRate;
	p->tablen = ftp->flen;
	p->tablenUPkr = p->tablen /ekr;
}

void vibr(VIBR *p)
{
    FUNC	*ftp;
    double	phs, inc;
    MYFLT   *ftab, fract, v1;
	//extern MYFLT powof2(MYFLT x);
	MYFLT rAmountAmp,rAmountFreq;
	
	rAmountAmp = (p->num1amp + (MYFLT)p->phsAmpRate * p->dfdmaxAmp) * randAmountAmp ;
	rAmountFreq = (p->num1freq + (MYFLT)p->phsFreqRate * p->dfdmaxFreq) * randAmountFreq ;
  
	phs = p->lphs;
	ftp = p->ftp;
	if (ftp==NULL) {
          initerror("vibrato(krate): not initialized");
          return;
	}
	fract = (MYFLT) (phs - (long)phs); //PFRAC(phs);
	ftab = ftp->ftable + (long)phs; //(phs >> ftp->lobits);
	v1 = *ftab++;
	*p->out = (v1 + (*ftab - v1) * fract) * (*p->AverageAmp * pow(2,rAmountAmp));
	inc = ( *p->AverageFreq * pow(2,rAmountFreq) ) *  p->tablenUPkr;  //* kicvt);
	phs += inc;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;	
	p->lphs = phs;

	p->phsAmpRate += (long)(p->xcpsAmpRate * kicvt);	
    if (p->phsAmpRate >= MAXLEN) {
		p->xcpsAmpRate =  randGab  * (ampMaxRate - ampMinRate) + ampMinRate;
		p->phsAmpRate &= PHMASK;		
		p->num1amp = p->num2amp;
		p->num2amp = BiRandGab ;	
		p->dfdmaxAmp = (p->num2amp - p->num1amp) / fmaxlen;
    }

	p->phsFreqRate += (long)(p->xcpsFreqRate * kicvt);	
    if (p->phsFreqRate >= MAXLEN) {
		p->xcpsFreqRate =  randGab  * (cpsMaxRate - cpsMinRate) + cpsMinRate;
		p->phsFreqRate &= PHMASK;		
		p->num1freq = p->num2freq;
		p->num2freq = BiRandGab ;	
		p->dfdmaxFreq = (p->num2freq - p->num1freq) / fmaxlen;
    }
	#undef  randAmountAmp 
	#undef	randAmountFreq	 
	#undef	ampMinRate		 
	#undef	ampMaxRate		 
	#undef	cpsMinRate		 
	#undef	cpsMaxRate		  
	#undef	iphs			

}
/*
void vibr_set(VIBR *p)	  
	
    FUNC	*ftp;

	#define randAmountAmp	1.59055f   
	#define	randAmountFreq	0.629921f  
	#define	ampMinRate		1.f 	
	#define	ampMaxRate		3.f 
	#define	cpsMinRate		1.19377f
	#define	cpsMaxRate		2.28100f  
	#define	iphs			0.f

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
  //    p->lphs = ((long)(iphs * fmaxlen)) & PHMASK;
	  
    }
	else initerror("vibr: invalid table");
	p->xcpsAmpRate = randGab  * (cpsMaxRate - cpsMinRate) + cpsMinRate;
	p->xcpsFreqRate = randGab  * (ampMaxRate - ampMinRate) + ampMinRate;
	p->tablen = ftp->flen;
	p->tablenUPkr = p->tablen /ekr;
}

void vibr(VIBR *p)
{
    FUNC	*ftp;
    double	phs, inc;
    MYFLT   *ftab, fract, v1;
	//extern MYFLT powof2(MYFLT x);
	MYFLT rAmountAmp,rAmountFreq;
	
	rAmountAmp = (p->num1amp + (MYFLT)p->phsAmpRate * p->dfdmaxAmp) * randAmountAmp ;
	rAmountFreq =(p->num1freq + (MYFLT)p->phsFreqRate * p->dfdmaxFreq) * randAmountFreq ;
  
	phs = p->lphs;
	ftp = p->ftp;
	if (ftp==NULL) {
          initerror("vibrato(krate): not initialized");
          return;
	}
	fract = (MYFLT) (phs - (long)phs); //PFRAC(phs);
	ftab = ftp->ftable + (long)phs; //(phs >> ftp->lobits);
	v1 = *ftab++;
	*p->out = (v1 + (*ftab - v1) * fract) * (*p->AverageAmp * pow(2,rAmountAmp));
	inc = ( *p->AverageFreq * pow(2,rAmountFreq) ) *  p->tablenUPkr; // * kicvt);
	phs += inc;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;	
	p->lphs = phs;

	p->phsAmpRate += (p->xcpsAmpRate);	
    if (p->phsAmpRate >= 1) {
		p->xcpsAmpRate =  (randGab  * (ampMaxRate - ampMinRate) + ampMinRate)/ekr;
		p->phsAmpRate -=1;
		//p->phsAmpRate &= PHMASK;		
		p->num1amp = p->num2amp;
		p->num2amp = BiRandGab ;	
		p->dfdmaxAmp = (p->num2amp - p->num1amp);
    }

	p->phsFreqRate += (p->xcpsFreqRate);	
    if (p->phsFreqRate >= 1) {
		p->xcpsFreqRate =  (randGab  * (cpsMaxRate - cpsMinRate) + cpsMinRate)/ekr;
		p->phsAmpRate -=1;
		//p->phsFreqRate &= PHMASK;		
		p->num1freq = p->num2freq;
		p->num2freq = BiRandGab ;	
		p->dfdmaxFreq = (p->num2freq - p->num1freq);
    }
	#undef  randAmountAmp 
	#undef	randAmountFreq	 
	#undef	ampMinRate		 
	#undef	ampMaxRate		 
	#undef	cpsMinRate		 
	#undef	cpsMaxRate		  
	#undef	iphs			

}
*/

void krsnsetx(KRESONX *p) /* Gabriel Maldonado, modifies for arb order */
{
    int scale;
    p->scale = scale = (int) *p->iscl;
    if((p->loop = (int) (*p->ord + .5)) < 1) p->loop = 4; /*default value*/
    if (!*p->istor && (p->aux.auxp == NULL ||
                      (int)(p->loop*2*sizeof(MYFLT)) > p->aux.size))
      auxalloc((long)(p->loop*2*sizeof(MYFLT)), &p->aux);
    p->yt1 = (MYFLT*)p->aux.auxp; p->yt2 = (MYFLT*)p->aux.auxp + p->loop;
    if (scale && scale != 1 && scale != 2) {
      sprintf(errmsg,"illegal reson iscl value, %f",*p->iscl);
      initerror(errmsg);
    }
    p->prvcf = p->prvbw = -100.0f;

    if (!(*p->istor)) {
      int j;
      for (j=0; j< p->loop; j++) p->yt1[j] = p->yt2[j] = 0.0f;
    }
}

void kresonx(KRESONX *p) /* Gabriel Maldonado, modified  */
{
    int	flag = 0, j;
    MYFLT	*ar, *asig;
    MYFLT	c3p1, c3t4, omc3, c2sqr;
    MYFLT *yt1, *yt2, c1,c2,c3; 
	
    if (*p->kcf != p->prvcf) {
		p->prvcf = *p->kcf;
		p->cosf = (MYFLT) cos((double)(*p->kcf * tpidsr * ksmps));
		flag = 1;
    }
    if (*p->kbw != p->prvbw) {
		p->prvbw = *p->kbw;
		p->c3 = (MYFLT) exp((double)(*p->kbw * mtpdsr * ksmps));
		flag = 1;
    }
    if (flag) {
		c3p1 = p->c3 + 1.0f;
		c3t4 = p->c3 * 4.0f;
		omc3 = 1.0f - p->c3;
		p->c2 = c3t4 * p->cosf / c3p1;		/* -B, so + below */
		c2sqr = p->c2 * p->c2;
		if (p->scale == 1)
			p->c1 = omc3 * (MYFLT)sqrt(1.0 - (double)(c2sqr / c3t4));
		else if (p->scale == 2)
			p->c1 = (MYFLT)sqrt((double)((c3p1*c3p1-c2sqr) * omc3/c3p1));
		else p->c1 = 1.0f;
    }
    c1=p->c1; 
    c2=p->c2;
    c3=p->c3;
    yt1= p->yt1;
    yt2= p->yt2;
    asig = p->asig;
	ar = p->ar;
    for (j=0; j< p->loop; j++) {
		*ar = c1 * *asig + c2 * *yt1 - c3 * *yt2;
		*yt2 = *yt1;
		*yt1 = *ar;
		yt1++;
		yt2++;
		asig= p->ar;
    }
}

/*-------------- END Gab --------------------------------------------*/ /* gab d5*/



void lineto_set(LINETO *p)
{
	p->current_time = 0.f;
	p->incr=0.f; 
	p->old_time=0.f;
	p->flag = 1;
}

void lineto(LINETO *p)
{
	if (p->flag){
		p->val_incremented = p->current_val = *p->ksig;
		p->flag=0;
	}
	if (*p->ksig != p->current_val && p->current_time > p->old_time) {
		p->old_time = *p->ktime;
		p->val_incremented = p->current_val;
		p->current_time = 0.f;
		p->incr = (*p->ksig - p->current_val) /  ((long) (ekr * p->old_time) + 1);
		p->current_val = *p->ksig;
	}
	else if (p->current_time < p->old_time) {

		p->val_incremented += p->incr;
	} 
	p->current_time += 1/ekr;
	*p->kr = p->val_incremented;
}


/*
void lineto(LINETO *p)
{
	if (p->flag){
		p->val_incremented = p->current_val = *p->ksig;
		p->flag=0;
	}
	if (*p->ksig != p->current_val) {
		p->old_time = *p->ktime;
		p->val_incremented = p->current_val;
		p->current_time = 0.f;
		p->incr = (*p->ksig - p->current_val) /  ((long) (ekr * p->old_time) + 1);
		p->current_val = *p->ksig;
	}
	else if (p->current_time < p->old_time) {
		p->current_time += 1/ekr;
		p->val_incremented += p->incr;
	} 
	*p->kr = p->val_incremented;
}
*/
void tlineto_set(LINETO2 *p)
{
	p->current_time = 0.f;
	p->incr=0.f; 
	p->old_time=1.f;
	p->flag = 1;
}


void tlineto(LINETO2 *p)
{
	if (p->flag){
		p->val_incremented = p->current_val = *p->ksig;
		p->flag=0;
	}
	if (*p->ktrig) {
		p->old_time = *p->ktime;
		//p->val_incremented = p->current_val;
		p->current_time = 0.f;
		p->incr = (*p->ksig - p->current_val) /  ((long) (ekr * p->old_time) + 1);
		p->current_val = *p->ksig;

	}
	else if (p->current_time < p->old_time) {
		p->current_time += 1/ekr;
		p->val_incremented += p->incr;
	} 
	*p->kr = p->val_incremented;
}


/*//////////////////////////////////////////*/

/*--------------------------------*/
#define FZERO	FL(0.0)
#define FONE	FL(1.0)

void metro_set(METRO *p)
{
    MYFLT	phs;
    long  longphs;
	if ((phs = *p->iphs) >= FZERO) {
		if ((longphs = (long)phs))
			warning("metro:init phase truncation");
		p->curphs = phs - (MYFLT)longphs;
	}
	p->flag=1;
}


void metro(METRO *p)
{
    double	phs= p->curphs;
	if(phs == FZERO && p->flag) {
		*p->sr = FONE;
		p->flag = 0;
	}
	else if ((phs += *p->xcps * onedkr) >= FONE) {
		*p->sr = FONE;
		phs -= FONE;
		p->flag = 0;
	}
	else 
		*p->sr = FZERO;
	p->curphs = phs;
	
}





/*--------------------------------*/

void mtable_i(MTABLEI *p)
{
	
	FUNC *ftp;
	int j, nargs;
	MYFLT *table, xbmul, **out = p->outargs;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtablei: incorrect table number");
          return;
	}
	table = ftp->ftable;
	nargs = p->INOCOUNT-4;
	if (*p->ixmode)
		xbmul = (MYFLT) (ftp->flen / nargs);

	if (*p->kinterp) {
		MYFLT 	v1, v2 ;
		MYFLT fndx = (*p->ixmode) ? *p->xndx * xbmul : *p->xndx;
		long indx = (long) fndx;
		MYFLT fract = fndx - indx;
		for (j=0; j < nargs; j++) {
		    v1 = table[indx * nargs + j];
			v2 = table[(indx + 1) * nargs + j];
			**out++ = v1 + (v2 - v1) * fract;
		}
	}
	else {
		long indx = (*p->ixmode) ? (long)(*p->xndx * xbmul) : (long) *p->xndx;
		for (j=0; j < nargs; j++)
			**out++ =  table[indx * nargs + j];
	}
}

void mtable_set(MTABLE *p)	 /* mtab by G.Maldonado */
{
	FUNC *ftp;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtable: incorrect table number");
          return;
	}
	p->ftable = ftp->ftable;
	p->nargs = p->INOCOUNT-4;
	p->len = ftp->flen / p->nargs;
	p->pfn = (long) *p->xfn;
	if (*p->ixmode)
		p->xbmul = (MYFLT) ftp->flen / p->nargs;
}

void mtable_k(MTABLE *p)
{
	int j, nargs = p->nargs;
	MYFLT **out = p->outargs;
	MYFLT *table;
	long len;
    if (p->pfn != (long)*p->xfn) {
		FUNC *ftp;
		if ( (ftp = ftfindp(p->xfn) ) == NULL) {
			perferror("mtable: incorrect table number");
			return;
		}
		p->pfn = (long)*p->xfn;
		p->ftable = ftp->ftable;
		p->len = ftp->flen / nargs;
		if (*p->ixmode)
			p->xbmul = (MYFLT) ftp->flen / nargs;
    }
	table= p->ftable;
	len = p->len;
	if (*p->kinterp) {
		MYFLT fndx;
		long indx;
		MYFLT fract;
		long indxp1;
		MYFLT 	v1, v2 ;
		fndx = (*p->ixmode) ? *p->xndx * p->xbmul : *p->xndx;
		if (fndx >= len)
			fndx = (MYFLT) fmod(fndx, len);
		indx = (long) fndx;
		fract = fndx - indx;
		indxp1 = (indx < len-1) ? (indx+1) * nargs : 0;
		indx *=nargs;
		for (j=0; j < nargs; j++) {
		    v1 = table[indx + j];
			v2 = table[indxp1 + j];
			**out++ = v1 + (v2 - v1) * fract;
		}
	}
	else {
		long indx = (*p->ixmode) ? ((long)(*p->xndx * p->xbmul) % len) * nargs : ((long) *p->xndx % len ) * nargs ;
		for (j=0; j < nargs; j++)
			**out++ =  table[indx + j];
	}
}

void mtable_a(MTABLE *p)
{
	int j, nargs = p->nargs;
	int	nsmps = ksmps, ixmode = (int) *p->ixmode, k=0;
	MYFLT **out = p->outargs;
	MYFLT *table;
	MYFLT *xndx = p->xndx, xbmul;
	long len;

    if (p->pfn != (long)*p->xfn) {
		FUNC *ftp;
		if ( (ftp = ftfindp(p->xfn) ) == NULL) {
			perferror("mtable: incorrect table number");
			return;
		}
		p->pfn = (long)*p->xfn;
		p->ftable = ftp->ftable;
		p->len = ftp->flen / nargs;
		if (ixmode)
			p->xbmul = (MYFLT) ftp->flen / nargs;
    }
	table = p->ftable;
	len = p->len;
	xbmul = p->xbmul;
	if (*p->kinterp) {
		MYFLT fndx;
		long indx;
		MYFLT fract;
		long indxp1;
		do {
			MYFLT 	v1, v2 ;
			fndx = (ixmode) ? *xndx++ * xbmul : *xndx++;
			if (fndx >= len)
				fndx = (MYFLT) fmod(fndx, len);
			indx = (long) fndx;
			fract = fndx - indx;
			indxp1 = (indx < len-1) ? (indx+1) * nargs : 0;
			indx *=nargs;
			for (j=0; j < nargs; j++) {
				v1 = table[indx + j];
				v2 = table[indxp1 + j];
				out[j][k] = v1 + (v2 - v1) * fract;
				
			}
			k++;
		} while(--nsmps);

	}
	else {
		do {
			long indx = (ixmode) ? ((long)(*xndx++ * xbmul)%len) * nargs : ((long) *xndx++ %len) * nargs;
			for (j=0; j < nargs; j++) {
				out[j][k] =  table[indx + j];
			}
			k++;
		} while(--nsmps);
	}
}




//////////// mtab start /////////////


void mtab_i(MTABI *p)
{
	FUNC *ftp;
	int j, nargs;
	long indx;
	MYFLT *table, **out = p->outargs;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtabi: incorrect table number");
          return;
	}
	table = ftp->ftable;
	nargs = p->INOCOUNT-2;

	indx = (long) *p->xndx;
	for (j=0; j < nargs; j++)
			**out++ =  table[indx * nargs + j];
}

void mtab_set(MTAB *p)	 /* mtab by G.Maldonado */
{
	FUNC *ftp;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtable: incorrect table number");
          return;
	}
	p->ftable = ftp->ftable;
	p->nargs = p->INOCOUNT-2;
	p->len = ftp->flen / p->nargs;
	p->pfn = (long) *p->xfn;
}

void mtab_k(MTAB *p)
{
	int j, nargs = p->nargs;
	MYFLT **out = p->outargs;
	MYFLT *table;
	long len, indx;

	table= p->ftable;
	len = p->len;
	indx = ((long) *p->xndx % len ) * nargs ;
	for (j=0; j < nargs; j++)
			**out++ =  table[indx + j];
}

void mtab_a(MTAB *p)
{
	int j, nargs = p->nargs;
	int	nsmps = ksmps, k=0;
	MYFLT **out = p->outargs;
	MYFLT *table;
	MYFLT *xndx = p->xndx;
	long len;
	table = p->ftable;
	len = p->len;
	do {
			long indx = ((long) *xndx++ %len) * nargs;
			for (j=0; j < nargs; j++) {
				out[j][k] =  table[indx + j];
			}
			k++;
	} while(--nsmps);
	
}


//////////// mtab end ///////////////


void mtablew_i(MTABLEIW *p)
{
	
	FUNC *ftp;
	int j, nargs;
	long indx;
	MYFLT *table, xbmul, **in = p->inargs;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtablewi: incorrect table number");
          return;
	}
	table = ftp->ftable;
	nargs = p->INOCOUNT-3;
	if (*p->ixmode)
		xbmul = (MYFLT) (ftp->flen / nargs);
	indx = (*p->ixmode) ? (long)(*p->xndx * xbmul) : (long) *p->xndx;
	for (j=0; j < nargs; j++)
		table[indx * nargs + j] = **in++;
}

void mtablew_set(MTABLEW *p)	 /* mtabw by G.Maldonado */
{
	FUNC *ftp;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtabw: incorrect table number");
          return;
	}
	p->ftable = ftp->ftable;
	p->nargs = p->INOCOUNT-3;
	p->len = ftp->flen / p->nargs;
	p->pfn = (long) *p->xfn;
	if (*p->ixmode)
		p->xbmul = (MYFLT) ftp->flen / p->nargs;
}

void mtablew_k(MTABLEW *p)
{
	int j, nargs = p->nargs;
	MYFLT **in = p->inargs;
	MYFLT *table;
	long len, indx;
    if (p->pfn != (long)*p->xfn) {
		FUNC *ftp;
		if ( (ftp = ftfindp(p->xfn) ) == NULL) {
			perferror("mtabw: incorrect table number");
			return;
		}
		p->pfn = (long)*p->xfn;
		p->ftable = ftp->ftable;
		p->len = ftp->flen / nargs;
		if (*p->ixmode)
			p->xbmul = (MYFLT) ftp->flen / nargs;
    }
	table= p->ftable;
	len = p->len;
	indx = (*p->ixmode) ? ((long)(*p->xndx * p->xbmul) % len) * nargs : ((long) *p->xndx % len ) * nargs ;
	for (j=0; j < nargs; j++)
		table[indx + j] = **in++;
}

void mtablew_a(MTABLEW *p)
{
	int j, nargs = p->nargs;
	int	nsmps = ksmps, ixmode = (int) *p->ixmode, k=0;
	MYFLT **in = p->inargs;
	MYFLT *table;
	MYFLT *xndx = p->xndx, xbmul;
	long len;

    if (p->pfn != (long)*p->xfn) {
		FUNC *ftp;
		if ( (ftp = ftfindp(p->xfn) ) == NULL) {
			perferror("mtabw: incorrect table number");
			return;
		}
		p->pfn = (long)*p->xfn;
		p->ftable = ftp->ftable;
		p->len = ftp->flen / nargs;
		if (ixmode)
			p->xbmul = (MYFLT) ftp->flen / nargs;
    }
	table = p->ftable;
	len = p->len;
	xbmul = p->xbmul;
	do {
		long indx = (ixmode) ? ((long)(*xndx++ * xbmul)%len) * nargs : ((long) *xndx++ %len) * nargs;
		for (j=0; j < nargs; j++) {
			table[indx + j] = in[j][k];
		}
		k++;
	} while(--nsmps);
}

////////////////////////////////////////

void mtabw_i(MTABIW *p)
{
	FUNC *ftp;
	int j, nargs;
	long indx;
	MYFLT *table, **in = p->inargs;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtabwi: incorrect table number");
          return;
	}
	table = ftp->ftable;
	nargs = p->INOCOUNT-2;
	indx = (long) *p->xndx;
	for (j=0; j < nargs; j++)
		table[indx * nargs + j] = **in++;
}

void mtabw_set(MTABW *p)	 /* mtabw by G.Maldonado */
{
	FUNC *ftp;
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("mtabw: incorrect table number");
          return;
	}
	p->ftable = ftp->ftable;
	p->nargs = p->INOCOUNT-2;
	p->len = ftp->flen / p->nargs;
	p->pfn = (long) *p->xfn;
}

void mtabw_k(MTABW *p)
{
	int j, nargs = p->nargs;
	MYFLT **in = p->inargs;
	MYFLT *table;
	long len, indx;
    if (p->pfn != (long)*p->xfn) {
		FUNC *ftp;
		if ( (ftp = ftfindp(p->xfn) ) == NULL) {
			perferror("mtablew: incorrect table number");
			return;
		}
		p->pfn = (long)*p->xfn;
		p->ftable = ftp->ftable;
		p->len = ftp->flen / nargs;
    }
	table= p->ftable;
	len = p->len;
	indx = ((long) *p->xndx % len ) * nargs ;
	for (j=0; j < nargs; j++)
		table[indx + j] = **in++;
}

void mtabw_a(MTABW *p)
{
	int j, nargs = p->nargs;
	int	nsmps = ksmps, k=0;
	MYFLT **in = p->inargs;
	MYFLT *table;
	MYFLT *xndx = p->xndx;
	long len;

    if (p->pfn != (long)*p->xfn) {
		FUNC *ftp;
		if ( (ftp = ftfindp(p->xfn) ) == NULL) {
			perferror("mtabw: incorrect table number");
			return;
		}
		p->pfn = (long)*p->xfn;
		p->ftable = ftp->ftable;
		p->len = ftp->flen / nargs;
    }
	table = p->ftable;
	len = p->len;
	do {
		long indx = ((long) *xndx++ %len) * nargs;
		for (j=0; j < nargs; j++) {
			table[indx + j] = in[j][k];
		}
		k++;
	} while(--nsmps);
}

/*/////////////////////////////////////////////*/

void fastab_set(FASTAB *p)
{
	if ((p->ftp = ftfind(p->xfn)) == NULL) {
		  initerror("fastab: incorrect table number");
          return;
	}
	if (*p->ixmode)
		p->xbmul = (MYFLT) p->ftp->flen;
	else 
		p->xbmul = FONE;
 
}

void fastabw (FASTAB *p)
{
	int	nsmps = ksmps;
	MYFLT *tab = p->ftp->ftable;
	MYFLT *rslt = p->rslt, *ndx = p->xndx;
	if (*p->ixmode) {
		do *(tab + (long) (*ndx++ * p->xbmul)) = *rslt++;
		while(--nsmps);
	}
	else {
		do *(tab + (long) *ndx++) = *rslt++;
		while(--nsmps);
	}
}

void fastabk(FASTAB *p) 
{
	if (*p->ixmode)
		*p->rslt =  *(p->ftp->ftable + (long) (*p->xndx * p->xbmul));
	else
		*p->rslt =  *(p->ftp->ftable + (long) *p->xndx);
}

void fastabkw(FASTAB *p) 
{
	
	if (*p->ixmode) 
		*(p->ftp->ftable + (long) (*p->xndx * p->xbmul)) = *p->rslt;		
	else
		*(p->ftp->ftable + (long) *p->xndx) = *p->rslt;
}


void fastabi(FASTAB *p) 
{
	
	FUNC *ftp;
	//ftp = ftfind(p->xfn);

	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("tab_i: incorrect table number");
          return;
	}
	if (*p->ixmode)
		*p->rslt =  *(ftp->ftable + (long) (*p->xndx * ftp->flen));
	else
		*p->rslt =  *(ftp->ftable + (long) *p->xndx);
}

void fastabiw(FASTAB *p) 
{
	FUNC *ftp;
	//ftp = ftfind(p->xfn);
	if ((ftp = ftfind(p->xfn)) == NULL) {
		  initerror("tabw_i: incorrect table number");
          return;
	}
	if (*p->ixmode)
		*(ftp->ftable + (long) (*p->xndx * ftp->flen)) = *p->rslt;
	else
		*(ftp->ftable + (long) *p->xndx) = *p->rslt;
}


void fastab(FASTAB *p)
{
	int	nsmps = ksmps;
	MYFLT *tab = p->ftp->ftable;
	MYFLT *rslt = p->rslt, *ndx = p->xndx;
	if (*p->ixmode) {
		do *rslt++ = *(tab + (long) (*ndx++ * p->xbmul));
		while(--nsmps);
	}
	else {
		do *rslt++ = *(tab + (long) *ndx++ );
		while(--nsmps);
	}
}











/* ************************************************************ */
/* Opcodes from Peter Neubäcker                              */
/* ************************************************************ */


void printi(PRINTI *p)
{
    char    *sarg;

    if ((*p->ifilcod != sstrcod) || (*p->STRARG == 0)) 
    {   sprintf(errmsg, "printi parameter was not a \"quoted string\"\n");
        initerror(errmsg);
        return;
    }
    else 
    {   sarg = p->STRARG;
        do 
        { putchar(*sarg);
        } while (*++sarg != 0);
        putchar(10);
        putchar(13);
    }
}


/*====================
opcodes from Jens Groh
======================*/

void nlalp_set(NLALP *p) {
   if (!(*p->istor)) {
      p->m0 = 0.;
      p->m1 = 0.;
   }
}



void nlalp(NLALP *p) {
   int nsmps;
   MYFLT *rp;
   MYFLT *ip;
   double m0;
   double m1;
   double tm0;
   double tm1;
   double klfact;
   double knfact;

   nsmps = ksmps;
   rp = p->aresult;
   ip = p->ainsig;
   klfact = (double)*p->klfact;
   knfact = (double)*p->knfact;
   tm0 = p->m0;
   tm1 = p->m1;
   if (knfact == 0.) { /* linear case */
      if (klfact == 0.) { /* degenerated linear case */
         m0 = (double)*ip++ - tm1;
         *rp++ = (MYFLT)(tm0);
         while (--nsmps) {
            *rp++ = (MYFLT)(m0);
            m0 = (double)*ip++;
         }
         tm0 = m0;
         tm1 = 0.;
      } else { /* normal linear case */
         do {
            m0 = (double)*ip++ - tm1;
            m1 = m0 * klfact;
            *rp++ = (MYFLT)(tm0 + m1);
            tm0 = m0;
            tm1 = m1;
         } while (--nsmps);
      }
   } else { /* non-linear case */
      if (klfact == 0.) { /* simplified non-linear case */
         do {
            m0 = (double)*ip++ - tm1;
            m1 = fabs(m0) * knfact;
            *rp++ = (MYFLT)(tm0 + m1);
            tm0 = m0;
            tm1 = m1;
         } while (--nsmps);
      } else { /* normal non-linear case */
         do {
            m0 = (double)*ip++ - tm1;
            m1 = m0 * klfact + fabs(m0) * knfact;
            *rp++ = (MYFLT)(tm0 + m1);
            tm0 = m0;
            tm1 = m1;
         } while (--nsmps);
      }
   }
   p->m0 = tm0;
   p->m1 = tm1;
}


void loopseg_set(LOOPSEG *p)
{
	p->nsegs = p->INOCOUNT-4;
	p->phs	= 0.0;
}


void loopseg(LOOPSEG *p)
{
	MYFLT **argp=p->argums;
	MYFLT period=1/ *p->freq, beg_seg=0, end_seg=0, durtot=0;
	double   phs, si=*p->freq/ekr;
	int nsegs=p->nsegs;
	int j;

	if (*p->retrig) {
		phs=0.;
		p->phs=0.;
	}
	else 
		phs=p->phs;
	
	for ( j=0; j <=nsegs; j+=2) 
		durtot += *argp[j];

	

	for ( j=0; j < nsegs; j+=2) {
		beg_seg += *argp[j] / durtot;
		end_seg = beg_seg + *argp[j+2] / durtot;
		if (beg_seg <= phs && end_seg > phs) {

			MYFLT diff = end_seg - beg_seg;
			MYFLT fract = ((MYFLT)phs-beg_seg)/diff;
			MYFLT v1 = *argp[j+1];
			MYFLT v2 = *argp[j+3];
			*p->out = v1 + (v2-v1) * fract;
			break;
		}
	}
    phs    += si;
    while (phs >= 1.)
      phs -= 1.;
    while (phs < 0. )
      phs += 1.;	
    p->phs = phs;
}


void lpshold(LOOPSEG *p)
{
	MYFLT **argp=p->argums;
	MYFLT period=1/ *p->freq, beg_seg=0, end_seg=0,durtot=0;
	double   phs, si=*p->freq/ekr;
	int nsegs=p->nsegs;
	int j;

	if (*p->retrig) {
		phs=0.;
		p->phs=0.;
	}
	else 
		phs=p->phs;
	
	for ( j=0; j <=nsegs; j+=2) 
		durtot += *argp[j];


	for ( j=0; j < nsegs; j+=2) {
		beg_seg += *argp[j] / durtot;
		end_seg = beg_seg + *argp[j+2] / durtot;
		if (beg_seg <= phs && end_seg > phs) {

			//MYFLT diff = end_seg - beg_seg;
			//MYFLT fract = (phs-beg_seg)/diff;
			//MYFLT v1 = *argp[j+1];
			//MYFLT v2 = *argp[j+3];
			//*p->out = v1 + (v2-v1) * fract;
			*p->out = *argp[j+1];
			break;
		}
	}
    phs    += si;
    while (phs >= 1.)
      phs -= 1.;
    while (phs < 0. )
      phs += 1.;	
    p->phs = phs;
}
/* -----------------------------------------------*/

void adsynt2_set(ADSYNT2 *p)
{
    FUNC    *ftp;
    int     count;
    long    *lphs;
	MYFLT	*pAmp;
    p->inerr = 0;

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
    }
    else {
      p->inerr = 1;
      initerror(Str(X_173,"adsynt: wavetable not found!"));
      return;
    }

    count = (int)*p->icnt;
    if (count < 1)
      count = 1;
    p->count = count;

    if ((ftp = ftfind(p->ifreqtbl)) != NULL) {
      p->freqtp = ftp;
    }
    else {
      p->inerr = 1;
      initerror(Str(X_309,"adsynt: freqtable not found!"));
      return;
    }
    if (ftp->flen < count) {
      p->inerr = 1;
      initerror(Str(X_1424,"adsynt: partial count is greater than freqtable size!"));
      return;
    }

    if ((ftp = ftfind(p->iamptbl)) != NULL) {
      p->amptp = ftp;
    }
    else {
      p->inerr = 1;
      initerror(Str(X_1473, "adsynt: amptable not found!"));
      return;
    }
    if (ftp->flen < count) {
      p->inerr = 1;
      initerror(Str(X_1474,"adsynt: partial count is greater than amptable size!"));
      return;
    }

    if (p->lphs.auxp==NULL || p->lphs.size < (long)(sizeof(long)+sizeof(MYFLT))*count)
      auxalloc((sizeof(long)+sizeof(MYFLT))*count, &p->lphs);

    lphs = (long*)p->lphs.auxp;
    if (*p->iphs > 1) {
      do
        *lphs++ = ((long)((MYFLT)((double)rand()/(double)RAND_MAX)
                          * fmaxlen)) & PHMASK;
      while (--count);
    }
    else if (*p->iphs >= 0){
      do
        *lphs++ = ((long)(*p->iphs * fmaxlen)) & PHMASK;
      while (--count);
    }
	pAmp = p->previousAmp = (MYFLT *) lphs + sizeof(MYFLT)*count;
	count = (int)*p->icnt;
	do 
		*pAmp++ = FL(0.);
    while (--count);
}

void adsynt2(ADSYNT2 *p)
{
    FUNC    *ftp, *freqtp, *amptp;
    MYFLT   *ar, *ar0, *ftbl, *freqtbl, *amptbl, *prevAmp;
    MYFLT   amp0, amp, cps0, cps, ampIncr,amp2;
    long    phs, inc, lobits;
    long    *lphs;
    int     nsmps, count;

    if (p->inerr) {
      initerror(Str(X_1475,"adsynt: not initialized"));
      return;
    }
    ftp = p->ftp;
    ftbl = ftp->ftable;
    lobits = ftp->lobits;
    freqtp = p->freqtp;
    freqtbl = freqtp->ftable;
    amptp = p->amptp;
    amptbl = amptp->ftable;
    lphs = (long*)p->lphs.auxp;
	prevAmp = p->previousAmp;

    cps0 = *p->kcps;
    amp0 = *p->kamp;
    count = p->count;

    ar0 = p->sr;
    ar = ar0;
    nsmps = ksmps;
    do
      *ar++ = FL(0.0);
    while (--nsmps);

    do {
      ar = ar0;
      nsmps = ksmps;
      amp2 = *prevAmp;
	  amp = *amptbl++ * amp0;
      cps = *freqtbl++ * cps0;
      inc = (long) (cps * sicvt);
      phs = *lphs;
	  ampIncr = (amp - *prevAmp) / ensmps;
      do {
        *ar++ += *(ftbl + (phs >> lobits)) * amp2;
        phs += inc;
        phs &= PHMASK;
		amp2 += ampIncr;
      }
      while (--nsmps);
	  *prevAmp++ = amp;
      *lphs++ = phs;
    }
    while (--count);
}


