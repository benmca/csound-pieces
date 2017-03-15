/* coded by G.Maldonado 		InstrCall.C 	   */					 
#include "cs.h" 		  
#include "InstrCall.h"
#include "oload.h"

static int insert2(int, EVTBLK*,INSDS**);
static int insert3(int insno, EVTBLK *newevtp, INSDS *ip );	

extern	INSTRTXT **instrtxtp;
#ifdef WIN32 /*gab-A1*/
/* 	Michael Gogins 1997-02-24 changed: */
extern OENTRY *opcodlst;
/* 	End Gogins. */
#else
extern	OENTRY	opcodlst[];
#endif
extern INSDS   actanchor, *curip, *frstoff , *instance(int);
extern MYFLT onedkr, ekr;
extern int ksmps;
extern long kcounter;

static	int 	tieflag = 0;		   

extern void    showallocs(void);
extern void    deact(INSDS *), schedofftim(INSDS *);
static	int inst_ndx =0;
#define MAX_INST 200  /* MAX_INST intrument midi calls allowed in a circular buffer*/
static	INSDS * instrument_instance[MAX_INST];




void icall(ICALL *p)
{
	int n, j, insno;
	MYFLT	**argums = p->argums;
	int narg = p->INOCOUNT;
	EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
	e->opcod = 'i';
	e->pcnt = narg; 			   
	e->offtim = -1.0f;	   
	
	insno = (int) (e->p[1] = *argums[0]);
	e->p[2] = (MYFLT) kcounter * onedkr + *argums[1];
	for (j= 2; j < narg; j++) {
		e->p[j+1] = *argums[j];
	}

	if (instrtxtp[insno] == NULL) {  
		printf("icall deleted. instr %d undefined\n", insno);
		perferrcnt++;
	}
	else if ((n = insert2(insno, e, NULL)) != 0) {
		printf("icall deleted. instr %d ", insno);
		if (n < 0) printf("memory fault\n");
		else printf("had %d init errors\n", n);
		perferrcnt++;
	} 
	free((char *)e);
}
/*
void trigcall(TCALL *p)
{
	if (*p->ktrig) {
		int n, j, insno;
		float	**argums = p->argums;
		int narg = p->INOCOUNT-1;
		EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
		e->opcod = (char) *argums[1];
		e->pcnt = narg-1; 			   
		//e->offtim = -1.0f;
		
		
		insno = (int) (e->p[1] = *argums[1]);
		e->p[2] = (float) kcounter * onedkr + *argums[2];
		for (j= 3; j < narg; j++) {
			e->p[j] = *argums[j];
		}
		//e->offtim = e->p[2]+e->p[3];  //new
	    //e->p2orig = e->p[2];
		//e->p3orig = e->p[3];

		if (instrtxtp[insno] == NULL) {  
			printf("icall deleted. instr %d undefined\n", insno);
			perferrcnt++;
		}
		else if ((n = insert3(insno, e, curip)) != 0) {
			printf("icall deleted. instr %d ", insno);
			if (n < 0) printf("memory fault\n");
			else printf("had %d init errors\n", n);
			perferrcnt++;
		} 
		free((char *)e);
	}
}

*/
/*--------------------------------*/

static KARGT *target_p;

void kargc_set(KARGC *p) {	/* k-arguments of caller instr */
	p->target_argums = target_p->argums;
}


void kargc(KARGC *p) {	/* k-arguments of caller instr */
	int narg = p->INOCOUNT, j;
	MYFLT **targs = p->target_argums, **cargs = p->argums;
	for (j = 0; j < narg; j++) {
		**targs++ = **cargs++;
	}
}

void kargt_set(KARGT *p) {	 /* k-arguments of target instr */
	target_p = p; /* this functon is called before than kargc_set */
}

//void kargt(KARGT *p) {	  /*  k-arguments of target instr */
//	/* void function body: all the data transfer is done by kargc() */
//}

/*-------------------------------------*/
static KARGT *atarget_p;

void argc_set(KARGC *p) {	/* a-arguments of caller instr */
	p->target_argums = atarget_p->argums;
}

void argc(KARGC *p) {	/* a-arguments of caller instr */
	int narg = p->INOCOUNT, j, nsmps;
	MYFLT *t, *c;
	MYFLT **targs = p->target_argums, **cargs = p->argums;
	for (j = 0; j < narg; j++) {
		nsmps = ksmps;
		t = *targs++;
		c = *cargs++;
		do	
			*t++ = *c++;
		while (--nsmps);
	}
}

void argt_set(KARGT *p) {	 /* a-arguments of target instr */
	atarget_p = p; /* this functon is called before than argc_set() */
}

//void argt(KARGT *p) {	  /*  a-arguments of target instr */
//	/* void function body: all the data transfer is done by argc() */
//}
/*--------------------------------*/
static KARGT *kreturn_p;

void krtrnc_set(KARGC *p) { /* k-arguments of caller instr */
	p->target_argums = kreturn_p->argums;
}


void krtrnc(KARGC *p) { /* k-arguments of caller instr */
	int narg = p->INOCOUNT, j;
	MYFLT **targs = p->target_argums, **cargs = p->argums;
	for (j = 0; j < narg; j++) {
		**cargs++ = **targs++;
	}
}

void krtrnt_set(KARGT *p) {  /* k-arguments of target instr */
	kreturn_p = p; /* this functon is called before than krtrnc_set() */
}

//void krtrnt(KARGT *p) {   /*  k-arguments of target instr */
//	/* void function body: all the data transfer is done by krtrnc() */
//}

/*----------------------------------------*/
static KARGT *areturn_p;


void artrnc_set(KARGC *p) { /* a-arguments of caller instr */
	p->target_argums = areturn_p->argums;
}


void artrnc(KARGC *p) { /* a-arguments of caller instr */
	int narg = p->INOCOUNT, j, nsmps;
	MYFLT *t, *c;
	MYFLT **targs = p->target_argums, **cargs = p->argums;
	for (j = 0; j < narg; j++) {
		nsmps = ksmps;
		t = *targs++;
		c = *cargs++;
		do	
			*c++ = *t++;
		while (--nsmps);
	}
}

void artrnt_set(KARGT *p) {  /* a-arguments of target instr */
	areturn_p = p; /* this functon is called before than artrnc_set() */
}

//void artrnt(KARGT *p) {   /*  a-arguments of target instr */
//	/* void function body: all the data transfer is done by artrnc() */
//}

/*----------------------------------------*/




void micall_set(MICALL *p)
{
	int n, j, insno;
	MYFLT	**argums = p->argums;
	int narg = p->INOCOUNT;
	EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
	INSDS *curr_instance;
	e->opcod = 'i';
	e->pcnt = narg; 			   
	e->offtim = -1.0f;	   
	{
	register short *xtra;
	/* set 1 k-cycle of extratime in order mtrnoff to recognize whether the note is turned off*/
	if (*(xtra = &(p->h.insdshead->xtratim)) < 1 )	/* gab-a5 revised */
		*xtra = 1;
	}
	insno = (int) (e->p[1] = *argums[0]);
	e->p[2] = (MYFLT) kcounter * onedkr + *argums[1];
	for (j= 2; j < narg; j++) {
		e->p[j+1] = *argums[j];
	}

	if (instrtxtp[insno] == NULL) {  
		printf("micall deleted. instr %d undefined\n", insno);
		perferrcnt++;
	}
	else if ((n = insert2(insno, e, &curr_instance)) != 0) {
		printf("micall deleted. instr %d ", insno);
		if (n < 0) printf("memory fault\n");
		else printf("had %d init errors\n", n);
		perferrcnt++;
	}
	else {
		p->instance_num = inst_ndx; /* return value identifies the instr instance just activated */
		instrument_instance[inst_ndx] = curr_instance;	/* returned by insert2() */
		if(++inst_ndx >= MAX_INST) inst_ndx = 0; /* circular buffer  */
		instrument_instance[inst_ndx] = NULL;
	}
	free((char *)e);
	p->flag=0;
	p->relesing = &(p->h.insdshead->relesing);
}

void micall(MICALL *p) {
	if (*p->relesing) {
		if(!p->flag) {
			INSDS *ip = instrument_instance[p->instance_num];
			if(ip == NULL) return; /* instr not allocated */
			if (ip->xtratim) {	/*	  if offtime delayed  */
				ip->relesing = 1;/* 	enter reles phase */
				ip->offtim = (kcounter + ip->xtratim) * onedkr;
				schedofftim(ip);/*		& put in offqueue */
			}
			else deact(ip); 	/*	  else off now		  */
			p->flag = 1;
		}
	}
}

void dicall_set(DICALL *p) {
	int  j;
	MYFLT	**argums = p->argums;
	int narg = p->INOCOUNT;
	EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
	e->opcod = 'i';
	e->pcnt = narg; 			   
	e->offtim = -1.0f;	   
	
	p->insno = (int) (e->p[1] = *argums[0]);
	e->p[2] = (MYFLT) kcounter * onedkr + *argums[1];
	p->actime = kcounter + (long) (*argums[1] * ekr);
	for (j= 2; j < narg; j++) {
		e->p[j+1] = *argums[j];
	}
	p->active_flag=0;
	p->e = e;
}

void dicall(DICALL *p) {
	int n;
	if (p->active_flag) return;
	if (kcounter >= p->actime) {
		int insno = p->insno;
		p->active_flag = 1;
		if (instrtxtp[insno] == NULL) {
			printf("dicall deleted. instr %d undefined\n", insno);
			perferrcnt++;
		}
		else if ((n = insert2(p->insno, p->e, NULL)) != 0) {
			printf("dicall deleted. instr %d ",insno);
			if (n < 0) printf("memory fault\n");
			else printf("had %d perf errors\n", n);
			perferrcnt++;
		} 
		free((char *) p->e);
	}
}

void dmicall_set(DMICALL *p) {
	int  j;
	MYFLT	**argums = p->argums;
	int narg = p->INOCOUNT;
	EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
	{
	register short *xtra;
	/* set 1 k-cycle of extratime in order mtrnoff to recognize whether the note is turned off*/
	if (*(xtra = &(p->h.insdshead->xtratim)) < 1 )
		*xtra = 1;
	}
	e->opcod = 'i';
	e->pcnt = narg; 			   
	e->offtim = -1.0f;	   
	p->insno = (int) (e->p[1] = *argums[0]);
	e->p[2] = (MYFLT) kcounter * onedkr + *argums[1];
	p->actime = kcounter + (long) (*argums[1] * ekr);
	for (j= 2; j < narg; j++) {
		e->p[j+1] = *argums[j];
	}
	p->active_flag=0;
	p->e = e;
	p->instance_num = inst_ndx; /* return value identifies the instr instance just activated */
	if(++inst_ndx >= MAX_INST) inst_ndx = 0; /* circular buffer index */
	instrument_instance[inst_ndx] = NULL;
	p->flag=0;
	p->relesing = (short *) &(p->h.insdshead->relesing);

}

void butta1_set(BUTTA *p) {
}

void butta1(BUTTA *p){
}


void dmicall(DMICALL *p) {
	int n;
	if (p->active_flag) {
		if (*p->relesing) {
			if(!p->flag) {
				INSDS *ip = instrument_instance[p->instance_num];
				if(ip == NULL) return; /* instr not allocated */
				if (ip->xtratim) {	/*	  if offtime delayed  */
					ip->relesing = 1;/* 	enter reles phase */
					ip->offtim = (kcounter + ip->xtratim) * onedkr;
					schedofftim(ip);/*		& put in offqueue */
				}
				else deact(ip); 	/*	  else off now		  */
				p->flag = 1;
			}
		}
	}
	else if (kcounter >= p->actime) {
		int insno = p->insno;
		INSDS * curr_instance;
		p->active_flag = 1;
		if (instrtxtp[insno] == NULL) { 		 
			printf("dmicall deleted. instr %d undefined\n", insno);
			perferrcnt++;
		}
		else if ((n = insert2(p->insno, p->e, &curr_instance)) != 0) {
			printf("dmicall deleted. instr %d ",insno);
			if (n < 0) printf("memory fault\n");
			else printf("had %d perf errors\n", n);
			perferrcnt++;
		} 
		else {
			instrument_instance[p->instance_num] = curr_instance;
		}
		free((char *) p->e);
	}
}



static int insert2(int insno, EVTBLK *newevtp, INSDS ** curr_instance)	
{
	INSTRTXT *tp;
	INSDS  *ip, *prvp, *nxtp;
	OPDS	*ids;	
	extern MYFLT cpu_power_busy;
	VMSG(printf("activating instr %d\n",insno);)
		inerrcnt = 0;
	tp = instrtxtp[insno];
	if (tp->mdepends & 04) {
		printf("instr %d expects midi event data, can't run from score\n",
			insno);
		return(1);
	}
/*-------------------------- gab b3 (start) */
//	cpu_power_busy += cpu_power_percent[insno];
//		if (cpu_power_busy > 100.0) {
//			cpu_power_busy -= cpu_power_percent[insno];
//			warning( "can't allocate last note because it exceeds 100% of cpu time");
//			return(0);
//	}
/*-------------------------- gab b3 (end) */
	if ((ip = tp->instance) != NULL) {		/* if allocs of text exist: */
		do	{
			if (ip->insno == insno	/*	 if find this insno,  */
				&& ip->actflg		  /*	  active			*/
				&& ip->offtim < 0	  /*	  with indef (tie)	*/
				&& ip->p1 == newevtp->p[1])	 /*  & matching p1	*/
			{ 
				tieflag++;		
				goto init;		/*	   continue that event */
			}
		} while ((ip = ip->nxtinstance) != NULL);
		ip = tp->instance;				/*	 else get alloc of text */
		do		if (!ip->actflg)		/*		that is free		*/
			goto actlnk;	/*		and use its space	*/
		while ((ip = ip->nxtinstance) != NULL);
	}

	if (O.msglevel & 2) 
		printf("new alloc for instr %d:\n",insno);
	ip = instance(insno);					/* else alloc new dspace  */
	
actlnk: 
    cpu_power_busy += instrtxtp[insno]->cpuload;
    if (cpu_power_busy > 100.0) { /* if there is no more cpu processing time*/
      cpu_power_busy -= instrtxtp[insno]->cpuload;
      warning(Str(X_26,"can't allocate last note because it exceeds 100% of cpu time"));
      return(0);
    }
	/* Add an active instrument */
    if (instrtxtp[insno]->active++ > instrtxtp[insno]->maxalloc &&
        instrtxtp[insno]->maxalloc>0) {
      instrtxtp[insno]->active--;
      warning(Str(X_27,"can't allocate last note because it exceeds instr maxalloc"));
      return(0);
    }
#ifdef never
    printf("Now %d active instr %d\n", instrtxtp[insno]->active, insno);
#endif
	ip->insno = insno;
	nxtp = &actanchor;						/* now splice into activ lst */
	while ((prvp = nxtp) && (nxtp = prvp->nxtact) != NULL)
		if (nxtp->insno > insno
			|| nxtp->insno == insno
			&& nxtp->p1 > newevtp->p[1]) {
			nxtp->prvact = ip;
			break;
		}
	ip->nxtact = nxtp;
	ip->prvact = prvp;
	prvp->nxtact = ip;
	ip->actflg++;					/*	  and mark the instr active */
	{
		int    n;
		MYFLT  *flp, *fep;
		
init:	
		if ((n = tp->pmax) != newevtp->pcnt) {
			sprintf(errmsg,"instr %d pmax = %d, note pcnt = %d",
				insno, n, newevtp->pcnt);
			warning(errmsg);
		}
		if (newevtp->p3orig >= 0.0)
			ip->offbet = newevtp->p2orig + newevtp->p3orig;
		else ip->offbet = -1.0f;
		flp = &ip->p1;
		fep = &newevtp->p[1];
		VMSG(printf("psave beg at %p\n",flp);)
		do	*flp++ = *fep++;			/* psave		*/
		while (--n);
		VMSG(printf("   ending at %p\n",flp);)
	}
	ip->offtim = ip->p3;					/* & duplicate p3 for now */
	ip->xtratim = 0;
	ip->relesing = 0;
	curip = ip;
	ids = (OPDS *)ip;
	while ((ids = ids->nxti) != NULL) {  /* do init pass for this instr */
		VMSG(printf("init %s:\n",
			opcodlst[ids->optext->t.opnum].opname);)
		(*ids->iopadr)(ids);
	}
	tieflag = 0;
	if (inerrcnt || !ip->p3) {
		deact(ip);
		return(inerrcnt);
	}
	if (curr_instance == NULL) { /* if not MIDI activated */
		if (ip->p3 > 0.0f && ip->offtim > 0.0f) {	/* if still finite time, */
			ip->offtim = ip->p2 + ip->p3;
			schedofftim(ip);					/*	 put in turnoff list */
		}
		else ip->offtim = -1.0f;					  /* else mark indef */
	}
	else {
		*curr_instance = ip;
	}
	VMSG({	printf("instr %d now active:\n",insno); showallocs(); })
	return(0);
}

