#include "cs.h"
#include "vpvoc.h"
#include "fractals.h"
#include <math.h>

/* mandelbrot set scanner */
void mandel_set(MANDEL *p)
{
	p->oldx=-99999; /* probably unused values */
	p->oldy=-99999;
	p->oldCount = -1;
}

void mandel(MANDEL *p)
{
	MYFLT px=*p->kx, py=*p->ky;
	if (*p->ktrig && (px != p->oldx || py != p->oldy)) {
		int maxIter = (int) *p->kmaxIter, j;
		MYFLT x=0.f, y=0.f, newx, newy;
		for (j=0; j<maxIter; j++) {
			newx = x*x - y*y + px;
			newy = 2*x*y + py;
			x=newx;
			y=newy;
			if (x*x+y*y >= 4) break;
		}
		p->oldx = px;
		p->oldy = py;
		if (p->oldCount != j) *p->koutrig = 1.f;
		else *p->koutrig = 0.f;
		*p->kr = (MYFLT) (p->oldCount = j);
	}
	else {
		*p->kr = (MYFLT) p->oldCount;
		*p->koutrig = 0.f;
	}
}



void cpstun_i(CPSTUNI *p)
{
	FUNC  *ftp;
	MYFLT *func;
	int notenum = (int) *p->input;
	int grade;
	int numgrades;
	int basekeymidi;
	MYFLT basefreq, factor,interval;
	if ((ftp = ftfind(p->tablenum)) == NULL) 
		perferror("cpstun: invalid table");
	func = ftp->ftable;
	numgrades = (int) *func++;
	interval = *func++;
	basefreq = *func++;
	basekeymidi = (int) *func++;
	
	if (notenum < basekeymidi) {
		notenum = basekeymidi - notenum;
		grade  = (numgrades-(notenum % numgrades)) % numgrades;
		factor = - (MYFLT)(int) ((notenum+numgrades-1) / numgrades) ;
	}
	else {
		notenum = notenum - basekeymidi;
		grade  = notenum % numgrades;
		factor = (MYFLT)(int) (notenum / numgrades);
	}
	factor = (MYFLT)pow((double)interval, (double)factor);
	*p->r = func[grade] * factor * basefreq;
}

void cpstun(CPSTUN *p)
{
	if (*p->ktrig) {
		FUNC  *ftp;
		MYFLT *func;
		int notenum = (int) *p->kinput;
		int grade;
		int numgrades;
		int basekeymidi;
		MYFLT basefreq, factor,interval;
		if ((ftp = ftfind(p->tablenum)) == NULL) 
			perferror("cpstun: invalid table");
		func = ftp->ftable;
		numgrades = (int) *func++;
		interval = *func++;
		basefreq = *func++;
		basekeymidi = (int) *func++;
		
		if (notenum < basekeymidi) {
			notenum = basekeymidi - notenum;
			grade  = (numgrades-(notenum % numgrades)) % numgrades;
			factor = - (MYFLT)(int) ((notenum+numgrades-1) / numgrades) ;
		}
		else {
			notenum = notenum - basekeymidi;
			grade  = notenum % numgrades;
			factor = (MYFLT)(int) (notenum / numgrades);
		}
		factor = (MYFLT)pow((double)interval, (double)factor);
		p->old_r = (*p->r = func[grade] * factor * basefreq);

	}
	else *p->r = p->old_r;

}

/*-------------------------*/
void vectorOp_set(VECTOROP *p)
{
	FUNC	*ftp;
    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->vector = ftp->ftable;
	  p->elements = (int) *p->ielements;
    }
	if ( p->elements >= ftp->flen )
		initerror("vectorop: invalid num of elements");
}

void vadd(VECTOROP *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT value = *p->kval;

	do  *vector++ += value;
	while (--elements);
}

void vmult(VECTOROP *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT value = *p->kval;
	
	do	*vector++ *= value;
	while (--elements);
}

void vpow(VECTOROP *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT value = *p->kval;

	do	*vector++ = (MYFLT) pow (*vector, value);
	while (--elements);
}

void vexp(VECTOROP *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT value = *p->kval;

	do	*vector++ = (MYFLT) pow (value, *vector);
	while (--elements);
}
/*-------------------------*/

void vectorsOp_set(VECTORSOP *p)
{
	FUNC	*ftp1, *ftp2;
    if ((ftp1 = ftfind(p->ifn1)) != NULL) {
      p->vector1 = ftp1->ftable;
	 
    }
    if ((ftp2 = ftfind(p->ifn2)) != NULL) {
      p->vector2 = ftp2->ftable;
	 
    }
	p->elements = (int) *p->ielements;
	if ( p->elements >= ftp1->flen || p->elements >= ftp2->flen)
		initerror("vectorop: invalid num of elements");
}


void vcopy(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do 	*vector1++ = *vector2++;
	while (--elements);
}


void vaddv(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do	*vector1++ += *vector2++;
	while (--elements);
}

void vsubv(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do	*vector1++ -= *vector2++;
	while (--elements);
}

void vmultv(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do	*vector1++ *= *vector2++;
	while (--elements);
}

void vdivv(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do	*vector1++ /= *vector2++;
	while (--elements);
}

void vpowv(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do	*vector1++ = (MYFLT) pow (*vector1, *vector2++);
	while (--elements);
}

void vexpv(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do	*vector1++ = (MYFLT) pow (*vector1, *vector2++);
	while (--elements);
}

void vmap(VECTORSOP *p)
{
	int elements = p->elements;
	MYFLT *vector1 = p->vector1, *vector2 = p->vector2;

	do 	*vector1++ = (vector2++)[(int)*vector1];
	while (--elements);
}


void vlimit_set(VLIMIT *p)
{
	FUNC	*ftp;
    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->vector = ftp->ftable;
	  p->elements = (int) *p->ielements;
    }
	if ( p->elements >= ftp->flen )
		initerror("vectorop: invalid num of elements");
}

void vlimit(VLIMIT *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT min = *p->kmin, max = *p->kmax;
	do 	*vector++ = (*vector > min) ? ((*vector < max) ? *vector : max) : min;
	while (--elements);
}

/*-----------------------------*/
void vport_set(VPORT *p)
{
	FUNC	*ftp;
	int elements;
	MYFLT *vector, *yt1,*vecInit;
    
	if ((ftp = ftfind(p->ifn)) != NULL) {
      vector = (p->vector = ftp->ftable);
	  elements = (p->elements = (int) *p->ielements);
	  if ( elements >= ftp->flen ) initerror("vport: invalid table length or num of elements");
    }
	else initerror("vport: invalid table");
	if (*p->ifnInit) {
		if ((ftp = ftfind(p->ifnInit)) != NULL) {
			vecInit = ftp->ftable;
			if ( elements >= ftp->flen ) initerror("vport: invalid init table length or num of elements");
		}
		else initerror("vport: invalid init table");
	}
	if (p->auxch.auxp == NULL)
		auxalloc(elements * sizeof(MYFLT), &p->auxch);
	yt1 = (p->yt1 = (MYFLT *) p->auxch.auxp);
	if (vecInit) {
		do *yt1++ = *vecInit++;
		while (--elements);
	} else {
		do *yt1++ = 0.f;
		while (--elements);
	}
	p->prvhtim = -100.0f;
}

void vport(VPORT *p)
{
    int elements = p->elements;
	MYFLT *vector = p->vector, *yt1 = p->yt1, c1, c2;
	if (p->prvhtim != *p->khtim) {
      p->c2 = (MYFLT)pow(0.5, (double)onedkr / *p->khtim);
      p->c1 = 1.0f - p->c2;
      p->prvhtim = *p->khtim;
    }
	c1 = p->c1;
	c2 = p->c2;
	do 	*vector++ = (*yt1++ = c1 * *vector + c2 * *yt1);
	while (--elements);
}

/*-------------------------------*/
void vwrap(VLIMIT *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT min = *p->kmin, max = *p->kmax;

    if (min >= max) {
		MYFLT average = (min+max)/2;
		do *vector++ = average;
		while (--elements);
	}
	else {
		do {	
			if (*vector >= max)	
				*vector++ = min + (MYFLT) fmod(*vector - min, fabs(min-max));
			else							
				*vector++ = max - (MYFLT) fmod(max - *vector, fabs(min-max));
		}while (--elements);
	}
}

void vmirror(VLIMIT *p)
{
	int elements = p->elements;
	MYFLT *vector = p->vector;
	MYFLT min = *p->kmin, max = *p->kmax;

    if (min >= max) {
		MYFLT average = (min+max)/2;
		do *vector++ = average;
		while (--elements);
	}
	else {
		do {	
			while (!((*vector <= max) && (*vector >=min))) {
				if (*vector > max)
					*vector = max + max - *vector;
				else 
					*vector = min + min - *vector;
			}
			vector++;
		}while (--elements);
	}
}

#include "vibrato.h"

void vrandh_set(VRANDH *p)
{
	FUNC	*ftp;
	int elements;
	MYFLT *num1;
    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->vector = ftp->ftable;
	  elements = (p->elements = (int) *p->ielements);
    }
	if ( p->elements >= ftp->flen )
		initerror("vectorop: invalid num of elements");

	p->phs = 0;
	if (p->auxch.auxp == NULL)
		auxalloc(p->elements * sizeof(MYFLT), &p->auxch);
	num1 = (p->num1 = (MYFLT *) p->auxch.auxp);
	do  *num1++ = BiRandGab;
	while (--elements);
	
}

void vrandh(VRANDH *p)
{   	
	MYFLT *vector = p->vector, *num1 = p->num1;
	MYFLT value = *p->krange;
	int elements = p->elements;

	do *vector++ += *num1++ * value;
	while (--elements);
    
	p->phs += (long)(*p->kcps * kicvt);
	if (p->phs >= MAXLEN) {
		p->phs &= PHMASK;
		elements = p->elements;
		vector = p->vector;
		num1 = p->num1;
		do 	*num1++ = BiRandGab;
		while (--elements);
	}
}

void vrandi_set(VRANDI *p)  
{
	FUNC	*ftp;
	int elements;
	MYFLT *dfdmax, *num1, *num2;
    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->vector = ftp->ftable;
	  elements = (p->elements = (int) *p->ielements);
    }
	if ( p->elements >= ftp->flen )
		initerror("vectorop: invalid num of elements");

	p->phs = 0;
	if (p->auxch.auxp == NULL)
		auxalloc(elements * sizeof(MYFLT) * 3, &p->auxch);
	num1 = (p->num1 = (MYFLT *) p->auxch.auxp);
	num2 = (p->num2 = &num1[elements]); 
	dfdmax = (p->dfdmax = &num1[elements * 2]); 

	do	{
		*num1 = 0.f;
		*num2 = BiRandGab;	
		*dfdmax++ = (*num2++ - *num1++) / fmaxlen;
	} while (--elements);
}


void vrandi(VRANDI *p)
{					
   	MYFLT *vector = p->vector, *num1 = p->num1, *num2, *dfdmax = p->dfdmax;
	MYFLT value = *p->krange;
    int elements = p->elements;

	do *vector++ += (*num1++ + (MYFLT)p->phs * *dfdmax++) * value;
    while (--elements);

	p->phs += (long)(*p->kcps * kicvt);	
    if (p->phs >= MAXLEN) {		
		p->phs &= PHMASK;
		elements = p->elements;
		vector = p->vector;
		num1 = p->num1;
		num2 = p->num2;
		dfdmax = p->dfdmax;

		do {
			*num1 = *num2;
			*num2 = BiRandGab ;	
			*dfdmax++ = (*num2++ - *num1++) / fmaxlen;
		} while (--elements);
    }
}


/*-----------------------------------------------*/
void vseg_set(VSEG *p)
{
    TSEG	*segp;
    int	nsegs;
    MYFLT	**argp, dur, *vector;
    FUNC *nxtfunc, *curfunc, *ftp;
    long	flength;

    nsegs = ((p->INCOUNT-2) >> 1);	/* count segs & alloc if nec */
	
    if ((segp = (TSEG *) p->auxch.auxp) == NULL) {
		auxalloc((long)(nsegs+1)*sizeof(TSEG), &p->auxch);
		p->cursegp = segp = (TSEG *) p->auxch.auxp;
		(segp+nsegs)->cnt = MAXPOS; 
    } 
    argp = p->argums; 
    if ((nxtfunc = ftfind(*argp++)) == NULL)
        return;
    if ((ftp = ftfind(p->ioutfunc)) != NULL) {
      p->vector = ftp->ftable;
	  p->elements = (int) *p->ielements;
    }
	if ( p->elements >= ftp->flen )
		initerror("vlinseg/vexpseg: invalid num. of elements");
	vector = p->vector;
	flength = p->elements;
    
	do	*vector++ = 0.0f;
	while (--flength);

    if (**argp <= 0.0)  return;		/* if idur1 <= 0, skip init  */
    p->cursegp = segp;              /* else proceed from 1st seg */
    segp--;
    do {
		segp++; 	 	/* init each seg ..  */
		curfunc = nxtfunc;
		dur = **argp++;
		if ((nxtfunc = ftfind(*argp++)) == NULL) return;
		if (dur > 0.0f) {
			segp->d = dur * ekr;
			segp->function =  curfunc;
			segp->nxtfunction = nxtfunc;
			segp->cnt = (long) (segp->d + .5); 
		}
		else break;		/*  .. til 0 dur or done */
    } while (--nsegs);
    segp++;
    segp->d = 0.0f;
    segp->cnt = MAXPOS;     	/* set last cntr to infin */
    segp->function =  nxtfunc;
    segp->nxtfunction = nxtfunc;
}

void vlinseg(VSEG *p)
{
    TSEG	*segp;
    MYFLT       *curtab, *nxttab,curval, nxtval, durovercnt=0.0f, *vector;
    long        flength, upcnt;
    if (p->auxch.auxp==NULL) {
		initerror(Str(X_1270,"tableseg: not initialized"));
		return;
    }
    segp = p->cursegp;
    curtab = segp->function->ftable;
    nxttab = segp->nxtfunction->ftable;
    upcnt = (long)segp->d-segp->cnt;
    if (upcnt > 0) 
		durovercnt = segp->d/upcnt;
    while (--segp->cnt < 0)
		p->cursegp = ++segp;
	flength = p->elements;
	vector = p->vector;
	do {
		curval = *curtab++;
		nxtval = *nxttab++;
		if (durovercnt > 0.0) 
			*vector++ = (curval + ((nxtval - curval) / durovercnt));
		else
			*vector++ = curval;
	} while (--flength);
}

void vexpseg(VSEG *p)
{
    TSEG	*segp;
    MYFLT       *curtab, *nxttab,curval, nxtval, cntoverdur=0.0f, *vector;
    long        flength, upcnt;

    if (p->auxch.auxp==NULL) {
		initerror(Str(X_1271,"tablexseg: not initialized"));
		return;
    }
    segp = p->cursegp;
    curtab = segp->function->ftable;
    nxttab = segp->nxtfunction->ftable;
    upcnt = (long)segp->d-segp->cnt;
    if (upcnt > 0) cntoverdur = upcnt/ segp->d;
    while(--segp->cnt < 0)
		p->cursegp = ++segp;
	flength = p->elements;
	vector = p->vector;
	cntoverdur *= cntoverdur;
	do {
		curval = *curtab++;
		nxtval = *nxttab++;
		*vector++ = (curval + ((nxtval - curval) * cntoverdur));
	} while (--flength);
}


/*-------------------------*/
void ca_set(CELLA *p)  
{
	FUNC	*ftp;
	int elements;
	MYFLT *currLine, *initVec;

    if ((ftp = ftfind(p->ioutFunc)) != NULL) {
      p->outVec = ftp->ftable;
	  elements = (p->elements = (int) *p->ielements);
	  if ( elements >= ftp->flen ) initerror("cella: invalid num of elements");
    }
	else initerror("cella: invalid output table");
    if ((ftp = ftfind(p->initStateFunc)) != NULL) {
      initVec = (p->initVec = ftp->ftable);
	  if ( elements >= ftp->flen ) initerror("cella: invalid num of elements");
    }
	else initerror("cella: invalid initial state table");
    if ((ftp = ftfind(p->iRuleFunc)) != NULL) {
      p->ruleVec = ftp->ftable;
    }
	else initerror("cella: invalid rule table");
	
	if (p->auxch.auxp == NULL)
		auxalloc(elements * sizeof(MYFLT) * 2, &p->auxch);
	currLine = (p->currLine = (MYFLT *) p->auxch.auxp);
	p->NewOld = 0;
	p->ruleLen = (int) *p->irulelen;
	do	*currLine++ = *initVec++;
	while (--elements);
}


void ca(CELLA *p)
{					
	if (*p->kreinit) {
		MYFLT *currLine = p->currLine, *initVec = p->initVec;
		int elements =  p->elements;
		p->NewOld = 0;
		do	*currLine++ = *initVec++;
		while (--elements);
	}
	if (*p->ktrig) {
	   	int j, elements = p->elements, jm1, ruleLen = p->ruleLen;
		MYFLT *actual, *previous, *outVec = p->outVec, *ruleVec = p->ruleVec;
		previous = &(p->currLine[elements * p->NewOld]);
		p->NewOld += 1;
		p->NewOld %= 2;
		actual   = &(p->currLine[elements * p->NewOld]);
		if (*p->iradius == 1) {		
			for (j=0; j < elements; j++) {
				jm1 = (j < 1) ? elements-1 : j-1;
				outVec[j] = previous[j];
				actual[j] = ruleVec[ (int) (previous[jm1] + previous[j] + previous[(j+1) % elements] ) % ruleLen];
			}
		} else {
			int jm2;
			for (j=0; j < elements; j++) {
				jm1 = (j < 1) ? elements-1 : j-1;
				jm2 = (j < 2) ? elements-2 : j-2;
				outVec[j] = previous[j];
				actual[j] = ruleVec[ (int) (previous[jm2] +	previous[jm1] + 
											previous[j] + 
											previous[(j+1) % elements] + previous[(j+2) % elements])
											% ruleLen];
			}
		}

	} else {
		int elements =  p->elements;
		MYFLT *actual = &(p->currLine[elements * !(p->NewOld)]), *outVec = p->outVec;
		do  *outVec++ = *actual++ ;
		while (--elements);
	}
}

/*-------------------------*/
void kdel_set(KDEL *p)
{
    unsigned long n;
    MYFLT *buf;
	n = (p->maxd = (long) (*p->imaxd * ekr));
    if (n == 0)	n = (p->maxd = 1);
    	 
	

    if (!*p->istod) {
		if (p->aux.auxp == NULL || (int)(n*sizeof(MYFLT)) > p->aux.size) 
			auxalloc(n * sizeof(MYFLT), &p->aux);
		else {
			buf = (MYFLT *)p->aux.auxp;  
			do {
				*buf++ = 0.0f;
			} while (--n);
		}
		p->left = 0;
    }
}

void kdelay(KDEL *p)              
{
    long maxd = p->maxd, indx, v1, v2;
    MYFLT *buf = (MYFLT *)p->aux.auxp, fv1, fv2;

    if (buf==NULL) {            
		initerror("vdelayk: not initialized");
		return;
    }

    indx = p->left;
	buf[indx] = *p->kin;
    fv1 = indx - *p->kdel * ekr;
    while (fv1 < 0.0f)	fv1 += (MYFLT)maxd;
    while (fv1 >= (MYFLT)maxd) fv1 -= (MYFLT)maxd;
    if (fv1 < maxd - 1) fv2 = fv1 + 1;
    else                fv2 = 0.0f;
    v1 = (long)fv1;
    v2 = (long)fv2;
	*p->kr = buf[v1] + (fv1 - v1) * (buf[v2]-buf[v1]);

    if (++(p->left) == maxd) p->left = 0;

}

/*-----------------*/
void vecdly_set(VECDEL *p) { 
	FUNC	*ftp;
	int elements = (p->elements = (int) *p->ielements), j;
    long n;

    if ((ftp = ftfind(p->ifnOut)) != NULL) {
      p->outvec = ftp->ftable;
	  elements = (p->elements = (int) *p->ielements);
	  if ( elements >= ftp->flen ) initerror("vecdelay: invalid num of elements");
    }
	else initerror("vecdly: invalid output table");
    if ((ftp = ftfind(p->ifnIn)) != NULL) {
      p->invec = ftp->ftable;
	  if ( elements >= ftp->flen ) initerror("vecdelay: invalid num of elements");
    }
	else initerror("vecdly: invalid input table");
    if ((ftp = ftfind(p->ifnDel)) != NULL) {
      p->dlyvec = ftp->ftable;
	  if ( elements >= ftp->flen ) initerror("vecdelay: invalid num of elements");
    }
	else initerror("vecdly: invalid delay table");
	
	n = (p->maxd = (long) (*p->imaxd * ekr));
    if (n == 0)	n = (p->maxd = 1);

    if (!*p->istod) {
		if (p->aux.auxp == NULL || 
			(int)(elements * sizeof(MYFLT *) 
			+ n * elements * sizeof(MYFLT) 
			+ elements * sizeof(long)) > p->aux.size) {
					auxalloc(elements * sizeof(MYFLT *) 
							+ n * elements * sizeof(MYFLT) 
							+ elements * sizeof(long), 
							&p->aux);
			p->buf= (MYFLT **) p->aux.auxp;
			for (j = 0; j < elements; j++) {
				p->buf[j] = (MYFLT *) (p->aux.auxp + sizeof(MYFLT *)* elements 
														  +sizeof(MYFLT ) * n * j);
			}
			p->left= (long *)  (p->aux.auxp +sizeof(MYFLT *)* elements 
											+sizeof(MYFLT ) * n * elements);
		}
		else {
			MYFLT **buf= p->buf;
			for (j = 0; j < elements; j++) {
				MYFLT *temp = buf[j];
				int count = n;
				do 	*temp++ = 0.0f;
				while (--count);
				p->left[j] = 0;
			}
		}
    }
}


void vecdly(VECDEL *p)              
{
    long maxd = p->maxd, *indx=p->left, v1, v2;
    MYFLT **buf = p->buf, fv1, fv2, *inVec = p->invec;
	MYFLT *outVec = p->outvec, *dlyVec = p->dlyvec;
	int elements = p->elements;
    if (buf==NULL) {            
		initerror("vecdly: not initialized");
		return;
    }
	do {
		(*buf)[*indx] = *inVec++;
		fv1 = *indx - *dlyVec++ * ekr;
		while (fv1 < 0.0f)	fv1 += (MYFLT)maxd;
		while (fv1 >= (MYFLT)maxd) fv1 -= (MYFLT)maxd;
		if (fv1 < maxd - 1) fv2 = fv1 + 1;
		else                fv2 = 0.0f;
		v1 = (long)fv1;
		v2 = (long)fv2;
		*outVec++ = (*buf)[v1] + (fv1 - v1) * ((*buf)[v2]-(*buf)[v1]);
		++buf;
		if (++(*indx) == maxd) *indx = 0;
		++indx;
	} while (--elements);
}




