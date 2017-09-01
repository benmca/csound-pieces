#include "cs.h"			/*				OLOAD.C	  */
#include "oload.h"
#include "midiops.h"

#define DKEY_DFLT  60

#ifdef RESET
#  include <string.h>
#endif

static  MYFLT   *gbloffbas;
MYFLT   **pctlist = NULL;
INSTRTXT **instrtxtp, instxtanchor;
short	*argoffspace;
MYFLT	*pool = NULL;
/* INSDS   **insalloc; */
short   *insbusy;
int	maxinsno = MAXINSNO;

OPARMS	O = {0,0, 0,1,1,0, 0,0, 0,0, 0,0, 1,0,0,7, 0,0,0, 0,0,0,0, 0,0 };

MYFLT	esr = DFLT_SR, ekr = DFLT_KR, ensmps = (MYFLT)DFLT_KSMPS;
int	nchnls = DFLT_NCHNLS, ksmps = DFLT_KSMPS;
MYFLT	tpidsr, mpidsr, mtpdsr;
MYFLT	hfkprd, *spin, *spout;
MYFLT	sicvt, kicvt, fmaxlen = (MYFLT)MAXLEN;
MYFLT	dv32768, dvensmps, loscal, onedsr, onedkr;
int	nspin, nspout, spoutactive, pnum(char*);
int	odebug = 0;
INX	inxbas;
int	strsmax = 0;

extern	void	cpsoctinit(void), reverbinit(void), sssfinit(void);
extern  MCHNBLK *m_chnbp[];

	OENTRY	*opcodlst = NULL;
	OENTRY	*oplstend = NULL;

/* RWD for reentry */
#ifdef RESET
void oloadRESET(void)
{
    int i;
    memset(&instxtanchor,0,sizeof(INSTRTXT));
    argoffspace = NULL;
    pool        = NULL;
    gbloffbas   = NULL;
    fmaxlen     = MAXLEN;
    spin        = NULL;
    spout       = NULL;
    odebug      = 0;
    /* clear instrtxtp array */
    if (instrtxtp != NULL) { /* gab 13/Jan/2001 */
		mfree(instrtxtp);           /* Start again */
		instrtxtp = NULL;
	}
    maxinsno    = MAXINSNO;
	if (opcodlst != NULL) {    /* gab 13/Jan/2001 */
		mfree(opcodlst);
		opcodlst    = NULL;
	}
}
#endif

void oload(void)
{
    long   n, nn, combinedsize, gblabeg, lclabeg, insno, *lp;
    MYFLT  *combinedspc, *gblspace, *fp1, *fp2;
    short  *pgmdim = NULL;
    INSTRTXT *ip;
    OPTXT *optxt;
	
    odebug = O.odebug;
    ip = instxtanchor.nxtinstxt;		/* for instr 0 optxts:  */
    optxt = (OPTXT *) ip;
    while ((optxt = optxt->nxtop) !=  NULL) {
		TEXT  *ttp = &optxt->t;
		ARGOFFS *inoffp, *outoffp;
		int opnum = ttp->opnum;
		if (opnum == ENDIN) break;
		if (opnum == LABEL) continue;
		outoffp = ttp->outoffs;		/* use unexpanded ndxes */
		inoffp = ttp->inoffs;		/* to find sr.. assigns */
		if (outoffp->count == 1 && inoffp->count == 1) {
			short rindex = (short)outoffp->indx[0] - (short)O.poolcount;
			MYFLT conval = pool[inoffp->indx[0] - 1];
			switch(rindex) {
			case 1:  esr = conval;  break;	/* & use those values */
		#ifndef VST /* gab e1 */
			case 2:  ekr = conval;  break;	/*  to set params now */
			case 3:  ksmps = (int)(ensmps = conval);  break;
		#endif
			case 4:  nchnls = (int)conval;  break;
			default: break;
			}
		}
    }
    VMSG( printf("esr = %7.1f, ekr = %7.1f, ksmps = %d, nchnls = %d\n",
		esr ,ekr, ksmps, nchnls); ) ; 
    if (O.sr_override) {	/* if command-line overrides, apply now */
		esr = (MYFLT)O.sr_override;
		ekr = (MYFLT)O.kr_override;
		ksmps = (int)(ensmps = (MYFLT)(O.sr_override / O.kr_override));
		printf(Str(X_1173,"sample rate overrides: esr = %7.1f, ekr = %7.1f, ksmps = %d\n"),
			esr, ekr, ksmps);
    }
    combinedsize = (O.poolcount + O.gblfixed + O.gblacount * ksmps)
		* sizeof(MYFLT);
    combinedspc = (MYFLT *)mcalloc((long)combinedsize);
    for (fp1 = pool, fp2 = combinedspc, nn = O.poolcount; nn--; )
		*fp2++ = *fp1++;	            /* copy pool into combined space */
    mfree((char *)pool);
    pool = combinedspc;
    gblspace = pool + O.poolcount;
    gblspace[0] = esr;	            /*   & enter	*/
    gblspace[1] = ekr;	            /*   rsvd word	*/
    gblspace[2] = ensmps;	    /*   curr vals  */
    gblspace[3] = (MYFLT)nchnls;
    gbloffbas = pool - 1;
	
    gblabeg = O.poolcount + O.gblfixed + 1;
    ip = &instxtanchor;
    while ((ip = ip->nxtinstxt) != NULL) {      /* EXPAND NDX for A Cells */
		optxt = (OPTXT *) ip; 		/*   (and set localen)    */
		lclabeg = (long)(ip->pmax + ip->lclfixed + 1);
		VMSG( printf("lclabeg %ld\n",lclabeg); ) ; 
#ifdef __alpha__
		/*
		* On Alpha, we need to align on 2*sizeof(MYFLT) (i.e. 64 bits).  So
		* we round up to that size.  heh 981101
		*/
		ip->localen = ((ip->lclfixed + ip->lclacnt*ksmps + 1) & ~0x1) *
			sizeof(MYFLT);
#else
		ip->localen = (ip->lclfixed + ip->lclacnt*ksmps) * sizeof(MYFLT);
#endif
		for (insno=0, n=0; insno <= maxinsno; insno++)
			if (instrtxtp[insno] == ip)  n++;              /* count insnos  */
			lp = ip->inslist = (long *) mmalloc((long)(n+1) * sizeof(long));
			for (insno=0; insno <= maxinsno; insno++)
				if (instrtxtp[insno] == ip)  *lp++ = insno;    /* creat inslist */
				*lp = -1;                                        /*   & terminate */
				insno = *ip->inslist;                            /* get the first */
				while ((optxt = optxt->nxtop) !=  NULL) {
					TEXT *ttp = &optxt->t;
					ARGOFFS *aoffp;
					long  indx, posndx;
					short *ndxp;
					int opnum = ttp->opnum;
					if (opnum == ENDIN) break;
					if (opnum == LABEL) continue;
					aoffp = ttp->outoffs;
					n=aoffp->count;
					for (ndxp=aoffp->indx; n--; ndxp++) {
						if ((indx = *ndxp) > gblabeg) {
							indx = gblabeg + (indx - gblabeg) * ksmps;
						}
						else if (indx <= 0 && (posndx = -indx) > lclabeg
							&& indx >= LABELIM) {
							indx = -(lclabeg + (posndx - lclabeg) * ksmps);
						}
						else if (indx > 0 && indx <= 3 && O.sr_override
							&& ip == instxtanchor.nxtinstxt) { /* for instr 0 */
							indx += 3;    /* deflect any old sr,kr,ksmps targets */
						}
						else continue;
						if ((short)indx != indx) {
							printf(Str(X_910,"indx=%ld (%lx); (short)indx = %d (%x)\n"),
								indx, indx, (short)indx, (short)indx);
							die(Str(X_909,"indexing overflow error"));
						}
						*ndxp = (short)indx;
					}
					aoffp = ttp->inoffs;            /* inargs:                  */
					if (opnum >= SETEND) goto realops;
					switch(opnum) {                 /*      do oload SETs NOW  */
					case STRSET:
						if (strsets == NULL)
							strsets = (char **)
							mcalloc((long)((strsmax=STRSMAX)+1) * sizeof(char *));
						indx = (long)gbloffbas[*aoffp->indx];
						if (indx > strsmax) {
							long newmax = strsmax + STRSMAX;
							int i;
							while (indx > newmax) newmax += STRSMAX;
							strsets = (char**)mrealloc(strsets, (newmax+1)*sizeof(char *));
							for (i=strsmax; i<newmax+1; i++) strsets[i] = NULL;
							strsmax = newmax;
						}
						if (strsets == NULL || indx < 0) { /* No space left or -ve index */
							warning(Str(X_887,"illegal strset index"));
							exit(1);
						}
						if (strsets[indx] != NULL)
							warning(Str(X_1249,"strset index conflict"));
						else {
							strsets[indx] = ttp->strarg;     
						}
						printf("Strsets[%d]:%s\n", indx, strsets[indx]);
						break;    
					case PSET:
						printf("PSET: isno=%d, pmax=%d\n", insno, ip->pmax);
						if ((n = aoffp->count) != ip->pmax) {
							sprintf(errmsg,Str(X_834,"i%ld pset args != pmax"), insno);
							warning(errmsg);
							if (n < ip->pmax) n = ip->pmax; /* cf pset, pmax    */
						}                                   /* alloc the larger */
						ip->psetdata = (MYFLT *) mcalloc((long)n * sizeof(MYFLT));
						for (n=aoffp->count,fp1=ip->psetdata,ndxp=aoffp->indx;
						n--; ) {
							*fp1++ = gbloffbas[*ndxp++];
							printf("..%f..", *(fp1-1));
						}
						printf("\n");
						break;
					}
					
					continue;       /* no runtime role for the above SET types */
					
realops:
					n = aoffp->count;
					for (ndxp=aoffp->indx; n--; ndxp++) {
						if ((indx = (long)*ndxp) > gblabeg) {
							indx = gblabeg + (indx - gblabeg) * ksmps;
						}
						else if (indx <= 0 && (posndx = -indx) > lclabeg
							&& indx >= LABELIM) {
							indx = -(lclabeg + (posndx - lclabeg) * ksmps);
						}
						else continue;
						if ((short)indx != indx) {
							printf(Str(X_218,"Case2: indx=%ld (%lx); (short)indx = %d (%x)\n"),
								indx, indx, (short)indx, (short)indx);
							die(Str(X_909,"indexing overflow error"));
						}
						*ndxp = (short)indx;
					}
				}
				if (!POLL_EVENTS()) exit(1);		/* on Mac/Win, allow system events */
    }
    if (pgmdim != NULL) free((char *)pgmdim);
	pctlist = (MYFLT **) mcalloc((long)256 * sizeof(MYFLT *));
    insbusy = (short *) mcalloc((long)((maxinsno+1) * sizeof(short)));
	
    if ((nn = init0()) > 0)				/* run instr 0 inits */
		die(Str(X_828,"header init errors"));
#ifdef VST /* gab e1 */
	gblspace[2] = ensmps;
#endif
	if (gblspace[0]/gblspace[1] != gblspace[2]) {	/* & chk consistency */
		printf("sr = %f, kr = %f, ksmps = %f\n",
			gblspace[0], gblspace[1], gblspace[2]);
		die(Str(X_903,"inconsistent sr, kr, ksmps"));		/*   one more time   */
    }
    tpidsr = TWOPI_F / esr;				/* now set internal  */
    mtpdsr = -tpidsr;				        /*    consts	     */
    mpidsr = -PI_F / esr;
    sicvt = fmaxlen / esr;
    kicvt = fmaxlen / ekr;
    hfkprd = FL(0.5) / ekr;
    onedsr = FL(1.0) / esr;
    onedkr = FL(1.0) / ekr;
    dv32768 = FL(1.0) / FL(32768.0);
    loscal = FL(1.0) / LOFACT;
    dvensmps = FL(1.0) / ensmps;
    cpsoctinit();
    reverbinit();
    sssfinit();
    nspin = nspout = ksmps * nchnls;		        /* alloc spin & spout */
    spin =  (MYFLT *) mcalloc((long)nspout*sizeof(MYFLT));
    spout = (MYFLT *) mcalloc((long)nspout*sizeof(MYFLT));
}

extern short nlabels;
extern short ngotos;

 INSDS *
instance(int insno)		/* create instance of an instr template	*/
				/*   allocates and sets up all pntrs	*/
{
	INSTRTXT *tp;
	INSDS	*ip, *prvip;
	OPTXT	*optxt;
	OPDS	*opds, *prvids, *prvpds;
	OENTRY	*ep;
	LBLBLK  **lopds, **lopdsp;
	LARGNO	*larg, *largp/* = larg */;
	int	n, pextent, opnum, reqd;
	char	*nxtopds, *opdslim;
	MYFLT   **argpp, *fltp, *lclbas, *lcloffbas, *csetoffbas;
	ARGOFFS *aoffp;
	short	indx, posndx,*ndxp;
	MCHNBLK *chp;

	lopds = (LBLBLK**)mmalloc(sizeof(LBLBLK*)*nlabels);
	lopdsp = lopds;
	larg = (LARGNO*)mmalloc(sizeof(LARGNO)*ngotos);
	largp = larg;
        lopdsp = lopds;
	tp = instrtxtp[insno];
	if (tp->mdepends & 06) {                /* if need midi chan, chk ok */
	  MCHNBLK **chpp = m_chnbp;
	  for (n = MAXCHAN; n--; ) {
	    if ((chp = *chpp++) !=((MCHNBLK*)NULL))	{ 
	      csetoffbas = chp->ctl_val;
	      if (!chp->insno) {
		chp->insno = insno;
		printf(Str(X_929,"instr %d seeking midi chnl data, assigned chnl %d\n"),
		       insno, chp->insno);
		break;
	      }
	      if (chp->insno != insno)
		continue;
	    }
	  }
	}
	pextent = sizeof(INSDS) + tp->pextrab;          /* alloc new space,  */
	ip = (INSDS *) mcalloc((long)pextent + tp->localen + tp->opdstot);
	if (tp->mdepends & 06)
	    ip->m_chnbp = chp;
	if ((prvip = tp->instance) == NULL)
	    tp->instance = ip;				/*    and add to     */
	else {
	    while (prvip->nxtinstance != NULL)		/*    txt instance   */
		prvip = prvip->nxtinstance;		/*    chain	     */
	    prvip->nxtinstance = ip;
	    ip->prvinstance = prvip;
	}
	lcloffbas = &ip->p0;
	lclbas = (MYFLT *)((char *)ip + pextent);	/* split local space */
	nxtopds = (char *)lclbas + tp->localen;
	opdslim = nxtopds + tp->opdstot;
	VMSG( printf(Str(X_923,"instr %d allocated at %p\n\tlclbas %p, opds %p\n"),
				insno,ip,lclbas,nxtopds); )
	optxt = (OPTXT *)tp;
	prvids = prvpds = (OPDS *)ip;
	while ((optxt = optxt->nxtop) != NULL) {     /* for each op in instr */
	    TEXT *ttp = &optxt->t;
	    if ((opnum = ttp->opnum) == ENDIN)		/*  (until ENDIN)  */
		break;
	    if (opnum == STRSET) {
	      nxtopds +=  2 * sizeof(MYFLT*);
	      continue; /* Only at load time */
	    }
	    if (opnum == PSET) {
	      ip->p1 = (MYFLT)insno; continue;
	    }
	    ep = &opcodlst[opnum];			/* for all ops:     */
	    opds = (OPDS *) nxtopds;			/*   take reqd opds */
	    nxtopds += ep->dsblksiz;
	    VMSG( printf(Str(X_1091,"op %d (%s) allocated at %p\n"),
			opnum,ep->opname,opds); )
	    opds->optext = optxt;			/* set common headata */
	    opds->insdshead = ip;
	    if (opnum == LABEL) {			/* LABEL:	*/
		LBLBLK	*lblbp = (LBLBLK *) opds;
		lblbp->prvi = prvids;			/*    save i/p links */
		lblbp->prvp = prvpds;
		*lopdsp++ = lblbp;			/*    log the lbl bp */
		continue;				/*    for later refs */
	    }
	    if ((ep->thread & 07)==0) {                   /* thread 1 OR 2:  */
		if (ttp->pftype == 'b') {
		    prvids = prvids->nxti = opds;
		    opds->iopadr = ep->iopadr;
		}
		else {
		    prvpds = prvpds->nxtp = opds;
		    opds->opadr = ep->kopadr;
		}
		goto args;
	    }
	    if ((ep->thread & 01)!=0) {			/* thread 1:	    */
		prvids = prvids->nxti = opds;		/* link into ichain */
		opds->iopadr = ep->iopadr;		/*   & set exec adr */
		if (opds->iopadr == NULL)
		    die(Str(X_1082,"null iopadr"));
	    }
	    if ((n = ep->thread & 06)!=0) {			/* thread 2 OR 4:   */
		prvpds = prvpds->nxtp = opds;		/* link into pchain */
		if (!(n & 04)
		  || ttp->pftype == 'k' && ep->kopadr != NULL)
		    opds->opadr = ep->kopadr;		/*	krate or    */
		else opds->opadr = ep->aopadr;		/*	arate	    */
		VMSG( printf("opadr = %p\n",opds->opadr); )
		if (opds->opadr == NULL)
		    die(Str(X_1083,"null opadr"));
	    }
      args: argpp = (MYFLT **)((char *)opds + sizeof(OPDS));
	    VMSG( printf("argptrs:"); )
	    aoffp = ttp->outoffs;		/* for outarg codes: */
	    reqd = strlen(ep->outypes);
	    for (n=aoffp->count, ndxp=aoffp->indx; n--; reqd--) {
		if ((indx = *ndxp++) > 0)           /* cvt index to lcl/gbl adr */
		    fltp = gbloffbas + indx;    
		else if ((posndx = -indx) < CBAS)
		    fltp = lcloffbas + posndx;
		else 
		    fltp = csetoffbas + posndx - CBAS;      
		VMSG( printf("\t%p", fltp); )
		*argpp++ = fltp;
	    }
	    while (reqd--) {     		/* if more outypes, pad */
		VMSG( printf("\tPADOUT"); )
		*argpp++ = NULL;
	    }
	    aoffp = ttp->inoffs;		/* for inarg codes: */
	    for (n=aoffp->count, ndxp=aoffp->indx; n--; ) {
	        if ((indx = *ndxp++) < LABELIM) {
		    VMSG( printf("\t***lbl"); )
		    largp->lblno = indx - MIN_SHORT;  /* if label ref, defer */
		    largp->argpp = argpp++;
		    largp++;
		} else {
		    if (indx > 0)                   /* else cvt ndx to lcl/gbl */
			fltp = gbloffbas + indx; 
		    else if ((posndx = -indx) < CBAS)
			fltp = lcloffbas + posndx;
		    else 
			fltp = csetoffbas + posndx - CBAS;      
		    VMSG( printf("\t%p", fltp); )
		    *argpp++ = fltp;
		}
	    }
	    VMSG( {putchar('\n');  if (dribble) putc('\n', dribble);} )
	}
	if (nxtopds != opdslim) {
	  printf(Str(X_1087,"nxtopds = %p opdslim = %p\n"), nxtopds, opdslim);
	  if (nxtopds > opdslim) die(Str(X_902,"inconsistent opds total"));
	}
	while (--largp >= larg)
	    *largp->argpp = (MYFLT *) lopds[largp->lblno]; /* now label refs */
	return(ip);
}

int pnum(char *s)		/* check a char string for pnum format	*/
				/*   and return the pnum ( >= 0 )	*/
{				/* else return -1			*/
    int	n;

    if (*s == 'p' || *s == 'P')
      if (sscanf(++s, "%d", &n))
	return(n);
    return(-1);
}

