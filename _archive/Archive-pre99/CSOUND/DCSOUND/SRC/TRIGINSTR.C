/******************************************************************************/
/* triginstr - Ignite instrument events at k-rate from orchestra.             */
/* August 1999 by rasmus ekman.                                               */
/* Changes made also to Cs.h, Musmon.c and Insert.c; look for "(re Aug 1999)" */
/******************************************************************************/

#include "cs.h"
#include "triginstr.h"

/* Some global declarations we need */
extern INSTRTXT **instrtxtp; 	/* List of instrument declarations (orchestra)  */
extern INSDS actanchor;	    	/* Chain of active instrument instances         */
extern void  infoff(FLOAT p1);	/* Turn off an indef copy of instr p1           */
extern long  kcounter;	    	/* Count of k-periods throughout performance    */
extern int   sensType;	    	/* 0=score evt, 1=Linein, 2/3=midi, 4=triginstr */

#define FZERO (0.0f)    /* (Shouldn't there be global decl's for these?) */
#define FONE  (1.0f)

EVTNODE OrcTrigEvts;    /* List of started events, used in playevents() (Musmon.c) */

/* Called from kperf() to see if any event to turn on */
int sensOrcEvent(void) {
	if(OrcTrigEvts.nxtevt && OrcTrigEvts.nxtevt->kstart <= kcounter) 
		return(4);    /* sensType value (0=score,1=line,2/3=midi) */
	else return(0);
}


void ktriginstr(TRIGINSTR *p);

void triginset(TRIGINSTR *p) {
	p->prvmintim = *p->mintime;
	p->timrem = 0;
	/* An instrument is initialised before kcounter is incremented for 
	   this k-cycle, and begins playing after kcounter++. 
	   Therefore, if we should start something at the very first k-cycle of 
	   performance, we must thus do it now, lest it be one k-cycle late. 
	   But in ktriginstr() we'll need to use kcounter-1 to set the start time 
	   of new events. So add a separate variable for the kcounter offset (-1). */
	if(kcounter == 0 && *p->trigger > FZERO && *p->args[1] <= FZERO) {
		p->kadjust = 0;   /* No kcounter offset at this time */
		ktriginstr(p); 
	}
	p->kadjust = -1;      /* Set kcounter offset for perf-time */
	return;
}


void ktriginstr(TRIGINSTR *p) {   	/* k-rate event generator */
	int i, absinsno, argnum;
	FLOAT insno, starttime;
	EVTNODE *evtlist, *newnode;
	EVTBLK  *newevt;

	if(*p->trigger == FZERO) /* Only do something if triggered */
		return;

	/* Get absolute instr num */
	insno = *p->args[0];
	absinsno = abs((int)insno);
	/* Check that instrument is defined */
	if(absinsno > maxinsno || instrtxtp[absinsno] == NULL) {
		printf("triginstr ignored. Instrument %d undefined\n", absinsno);
		perferrcnt++;
		return;
	}

	/* On neg instrnum, turn off a held copy. 
	   (Regardless of mintime/maxinst) */
	if(insno < FZERO) {
		infoff(-insno); 
		return;
	}

	/* Check if mintime has changed */
	if(p->prvmintim != *p->mintime) {
		long timrem = (int)(*p->mintime * ekr + 0.5f);
		if(timrem > 0) {
			/* Adjust countdown for new mintime */
			p->timrem += timrem - p->prvktim;
			p->prvktim = timrem;
		} else timrem = 0;
		p->prvmintim = *p->mintime;
	}

	/* Check for rate limit on event generation and count down */
	if(*p->mintime > FZERO && --p->timrem > 0) 
		return;

	/* See if there are too many instances already */
	if(*p->maxinst >= FONE) {
		INSDS *ip;
		int numinst = 0;
		/* Count active instr instances */
		ip = &actanchor;
		while ((ip = ip->nxtact) != NULL)
			if(ip->insno == absinsno) numinst++;
		if(numinst >= (int)*p->maxinst)
			return;
	}

	/* Create the new event */
	newnode = (EVTNODE *) mmalloc((long)sizeof(EVTNODE));
	newevt = &newnode->evt;
	newevt->opcod = 'i';
	/* Set start time from kwhen */
	starttime = *p->args[1];
	if(starttime < FZERO) {
		starttime = FZERO;
		warning("triginstr warning: negative kwhen reset to zero");
	}
	/* Add current time (see note about kadjust in triginset() above) */
	starttime += (FLOAT)(kcounter + p->kadjust) * onedkr;
	newnode->kstart = (long)(starttime * ekr + 0.5f);
	newevt->p2orig = starttime;
	newevt->p3orig = *p->args[2];
	/* Copy all arguments to the new event */
	newevt->pcnt = argnum = p->INOCOUNT-3;
	for(i = 0; i < argnum; i++) 
		newevt->p[i+1] = *p->args[i];
	newevt->p[2] = starttime;    /* Set actual start time in p2 */
	
	newnode->insno = absinsno;
	/* Set event activation time in k-cycles */
	newnode->kstart = (long)(starttime * ekr + 0.5f);

	/* Insert eventnode in list of generated events */
	evtlist = &OrcTrigEvts;
	while (evtlist->nxtevt) {
		if(newnode->kstart < evtlist->nxtevt->kstart) break;
		evtlist = evtlist->nxtevt;
	}
	newnode->nxtevt = evtlist->nxtevt;
	evtlist->nxtevt = newnode;
	O.RTevents = 1;     /* Make sure kperf() looks for RT events */
	O.ksensing = 1;
	O.OrcEvts  = 1;     /* - of the appropriate type */

	/* Reset min pause counter */
	if(*p->mintime > FZERO)
		p->timrem = (long)(*p->mintime * ekr + 0.5f);
	else p->timrem = 0;
	return;
}



void schedk(SCHEDK2 *p) { /* based on code of rasmus */
	int i, absinsno, argnum;
	FLOAT insno, starttime;
	EVTNODE *evtlist, *newnode;
	EVTBLK  *newevt;

	if(*p->trigger == FZERO) /* Only do something if triggered */
		return;

	/* Get absolute instr num */
	insno = *p->args[1];
	if(insno < FZERO) {
		infoff(-insno); 
		return;
	}
	absinsno = abs((int)insno);
	/* Create the new event */
	newnode = (EVTNODE *) mmalloc((long)sizeof(EVTNODE));
	newevt = &newnode->evt;
	newevt->opcod = (char) *p->args[0];
	/* Set start time from kwhen */
	starttime = *p->args[2];
	if(starttime < FZERO) {
		starttime = FZERO;
		//warning("triginstr warning: negative kwhen reset to zero");
	}
	/* Add current time (see note about kadjust in triginset() above) */
	starttime += (FLOAT)(kcounter-1L) * onedkr;
	newnode->kstart = (long)(starttime * ekr + 0.5f);
	newevt->p2orig = starttime;
	newevt->p3orig = *p->args[3];
	/* Copy all arguments to the new event */
	newevt->pcnt = (argnum = p->INOCOUNT-1) -1;
	for(i = 1; i < argnum; i++) 
		newevt->p[i] = *p->args[i];
	newevt->p[2] = starttime;    /* Set actual start time in p2 */
	
	newnode->insno = absinsno;
	/* Set event activation time in k-cycles */
	newnode->kstart = (long)(starttime * ekr + 0.5f);

	/* Insert eventnode in list of generated events */
	evtlist = &OrcTrigEvts;
	while (evtlist->nxtevt) {
		if(newnode->kstart < evtlist->nxtevt->kstart) break;
		evtlist = evtlist->nxtevt;
	}
	newnode->nxtevt = evtlist->nxtevt;
	evtlist->nxtevt = newnode;
	O.RTevents = 1;     /* Make sure kperf() looks for RT events */
	O.ksensing = 1;
	O.OrcEvts  = 1;     /* - of the appropriate type */
}
