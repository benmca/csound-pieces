#include "cs.h"			/*				UGENS7.C	*/
#include "fof3.h"
#include <math.h>


/* This opcode was derived by G.Maldonado by FOF2: it allows linear interpolation
  in AUDIO sample table and support integer table for reducing memory needs (use only 
  with gen 22 generated tables) */
/* loosely based on code of Michael Clarke, University of Huddersfield */

#define FZERO	FL(0.0)
#define FONE	FL(1.0)

static	 int	newpulse2();

void fofset3(FOFS3 *p, int flag)
{
	if ((p->ftp1 = ftfind(p->ifna)) != NULL
	 && (p->ftp2 = ftfind(p->ifnb)) != NULL) {
	    OVRLAP3 *ovp, *nxtovp;
	    long   olaps;
	    p->durtogo = (long) (*p->itotdur * esr);
	    if (*p->iphs == FZERO)                      /* if fundphs zero,  */
			p->fundphs = MAXLEN;                    /*   trigger new FOF */
	    else p->fundphs = (long)(*p->iphs * fmaxlen) & PHMASK;
	    if ((olaps = (long) *p->iolaps) <= 0) {
			initerror("illegal value for iolaps");
			return;
	    }
	    auxalloc((long)olaps * sizeof(OVRLAP3), &p->auxch);
	    ovp = &p->basovrlap;
	    nxtovp = (OVRLAP3 *) p->auxch.auxp;
	    do {
	        ovp->nxtact = NULL;
			ovp->nxtfree = nxtovp;              /* link the ovlap spaces */
			ovp = nxtovp++;
	    } while (--olaps);
	    ovp->nxtact = NULL;
	    ovp->nxtfree = NULL;
	    p->fofcount = -1;
	    p->prvband = FZERO;
	    p->expamp = FONE;
	    p->prvsmps = 0;
	    p->preamp = FONE;
	    p->xincod   = (p->XINCODE & 0x7) ? 1 : 0;
	    p->ampcod	= (p->XINCODE & 0x2) ? 1 : 0;
	    p->fundcod	= (p->XINCODE & 0x1) ? 1 : 0;
	    p->formcod	= (p->XINCODE & 0x4) ? 1 : 0;
	}
}


void fof3(FOFS3 *p)
{
	OVRLAP3 *ovp;
	FUNC	*ftp1,	*ftp2;
	MYFLT	*ar, *amp, *fund, *form;
	long   nsmps = ksmps, fund_inc, form_inc;

	if (p->auxch.auxp==NULL) { /* RWD fix */
          initerror("fof: not initialized");
          return;
	}
	ar = p->ar;
	amp = p->xamp;
	fund = p->xfund;
	form = p->xform;
	ftp1 = p->ftp1;
	ftp2 = p->ftp2;
	fund_inc = (long) (*fund * sicvt);
	form_inc = (long) (*form * sicvt);
	do {
	    if (p->fundphs & MAXLEN) {               /* if phs has wrapped */
			p->fundphs &= PHMASK;
			if ((ovp = p->basovrlap.nxtfree) == NULL)
		    	perferror("FOF needs more overlaps");
			if (newpulse2(p, ovp, amp, fund, form)) {   /* init new fof */ 
		    	ovp->nxtact = p->basovrlap.nxtact;     /* & link into  */
		    	p->basovrlap.nxtact = ovp;             /*   actlist    */
		    	p->basovrlap.nxtfree = ovp->nxtfree;
			}
	    }
	    *ar	= FZERO;
	    ovp = &p->basovrlap;
	    while (ovp->nxtact != NULL) { 	  /* perform cur actlist:  */
	        MYFLT result;
			OVRLAP3 *prvact = ovp;
			ovp = ovp->nxtact; 		     /*  formant waveform  */
			
			{
				register long  * phs=&(ovp->formphs);
				register MYFLT fract=(*phs & ftp1->lomask) * ftp1->lodiv ;
				register short * ftab  =  (short *) (ftp1->ftable) + (*phs >> ftp1->lobits);/* short because gen22 handles shorts */
				register short v1 = *ftab++; 
				result = v1 + (*ftab - v1) * fract;
		
	 	 	 	*phs += (long) (ovp->forminc + ovp->glissbas * ovp->sampct++);
				*phs &= PHMASK;
			}

#define kgliss ifmode
			if (ovp->risphs < MAXLEN) { 		/*  formant ris envlp */
		    	result *= *(ftp2->ftable + (ovp->risphs >> ftp2->lobits) );
		    	ovp->risphs += ovp->risinc;
			}
			if (ovp->timrem <= ovp->dectim) {       /*  formant dec envlp */
		    	result *= *(ftp2->ftable + (ovp->decphs >> ftp2->lobits) );
		    	if ((ovp->decphs -= ovp->decinc) < 0)
		        	ovp->decphs = 0;
			}
			*ar += (result * ovp->curamp);          /*  add wavfrm to out */
			if (--ovp->timrem)                      /*  if fof not expird */
		    	ovp->curamp *= ovp->expamp;         /*   apply bw exp dec */
			else {
		    	prvact->nxtact = ovp->nxtact;       /*  else rm frm activ */
		    	ovp->nxtfree = p->basovrlap.nxtfree;/*  & ret spc to free */
		    	p->basovrlap.nxtfree = ovp;
		    	ovp = prvact;
			}
	    }
	    p->fundphs += fund_inc;
	    if (p->xincod) {
	        if (p->ampcod)	  amp++;
		if (p->fundcod)	  fund_inc = (long) (*++fund * sicvt);
		if (p->formcod)   form_inc = (long) (*++form * sicvt);
	    }
	    p->durtogo--;
	    ar++;
	} while (--nsmps);
}

static int newpulse2(FOFS3 *p, OVRLAP3 *ovp, MYFLT *amp, MYFLT *fund, MYFLT *form)
{
	MYFLT	octamp = *amp, oct;
	long   rismps, newexp = 0;

	if ((ovp->timrem = (long) (*p->kdur * esr)) > p->durtogo)  /* ringtime    */
	    return(0);
	if ((oct = *p->koct) > FZERO) {                   /* octaviation */
	    long ioct = (long) oct, bitpat = (long)(~(-1 << ioct));
	    if (bitpat & ++p->fofcount)
	        return(0);
	    if ((bitpat += 1) & p->fofcount)
	        octamp *= (FONE + ioct - oct);
	}
	if (*fund == FZERO)                               /* formant phs */
	    ovp->formphs = 0;
	else ovp->formphs = (long)(p->fundphs * *form / *fund) & PHMASK;
	ovp->forminc = (long) (*form * sicvt);
	if (*p->kband != p->prvband) {                    /* bw: exp dec */
	    p->prvband = *p->kband;
	    p->expamp = (MYFLT) exp(*p->kband * mpidsr);
	    newexp = 1;
	}
	/* Init grain rise ftable phase. Negative kform values make 
	   the kris (ifnb) initial index go negative and crash csound. 
	   So insert another if-test with compensating code. */
	if (*p->kris >= onedsr && *form != FZERO) {      /* init fnb ris */
	  if(*form < FZERO && ovp->formphs != 0)
	    ovp->risphs = (long) ((MAXLEN - ovp->formphs) / -*form / *p->kris);
	  else 
	    ovp->risphs = (long) (ovp->formphs / *form / *p->kris);
	  ovp->risinc = (long) (sicvt / *p->kris);
	  rismps = MAXLEN / ovp->risinc;
	}
	else {
	  ovp->risphs = MAXLEN;
	  rismps = 0;
	}
	if (newexp || rismps != p->prvsmps) {            /* if new params */
	    if (p->prvsmps = rismps)                     /*   redo preamp */
	        p->preamp = (MYFLT) (pow(p->expamp, (MYFLT)(-rismps)));
	    else p->preamp = FONE;
	}
	ovp->curamp = octamp * p->preamp;                /* set startamp  */
	ovp->expamp = p->expamp;
	if ((ovp->dectim = (long) (*p->kdec * esr)) > 0)          /*      fnb dec  */
	    ovp->decinc = (long) (sicvt / *p->kdec);
	ovp->decphs = PHMASK;
	/*if (!p->foftype) { */
		/* Make fof take k-rate phase increment: 
		   Add current iphs to initial form phase */
	  ovp->formphs += (long) (*p->iphs * fmaxlen);              /*     krate phs */
	  ovp->formphs &= PHMASK;
	  	/* Set up grain gliss increment: ovp->glissbas will be added to 
		   ovp->forminc at each pass in fof2. Thus glissbas must be
		   equal to kgliss / grain playing time. Also make it harmonic,
		   so integer kgliss can represent octaves (ie pow() call). */
	  ovp->glissbas = (MYFLT)(ovp->forminc * pow((double)2.0, (double)*p->kgliss));
				/* glissbas should b diff of start & end pitch*/
	  ovp->glissbas -= ovp->forminc; 
	  ovp->glissbas /= ovp->timrem;
	  ovp->sampct = 0;   /* Must be reset in case ovp was used before  */
/*   } */
	return(1);
}

