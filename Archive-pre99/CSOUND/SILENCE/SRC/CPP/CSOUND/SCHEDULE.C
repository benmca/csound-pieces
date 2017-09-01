#include "cs.h"
#include "schedule.h"
#include <math.h>

extern INSTRTXT **instrtxtp;
extern OENTRY   *opcodlst;
extern INSDS   actanchor, *curip, *frstoff ,*instance(int);
extern MYFLT onedkr, ekr;
extern int   ksmps;
extern long  kcounter;
extern int   tieflag;
extern void    showallocs(void);
extern void    deact(INSDS *), schedofftim(INSDS *);

typedef struct rsched {
  void          *parent;
  INSDS         *kicked;
  struct rsched *next;
} RSCHED;

static RSCHED *kicked = NULL;

/******************************************************************************/
/* triginstr - Ignite instrument events at k-rate from orchestra.             */
/* August 1999 by rasmus ekman.                                               */
/******************************************************************************/

/* Some global declarations we need */
extern INSTRTXT **instrtxtp;   /* List of instrument declarations (orchestra) */
extern INSDS actanchor;        /* Chain of active instrument instances        */
extern void  infoff(MYFLT p1); /* Turn off an indef copy of instr p1          */
extern long  kcounter;         /* Count of k-periods throughout performance   */
extern int   sensType;         /* 0=score evt, 1=Linein, 2/3=midi,4=triginstr */

#define FZERO (FL(0.0))    /* (Shouldn't there be global decl's for these?) */
#define FONE  (FL(1.0))

EVTNODE OrcTrigEvts;    /* List of started events, used in playevents() */


INSDS *insert_event(MYFLT instr,
                    MYFLT when,
                    MYFLT dur,
                    int narg,
                    MYFLT **args,
                    int midi)
{
    int insno = (int)instr;
    EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
    int j;

    printf("insert_event: %.0f %f %f ...\n", instr, when, dur);

    tieflag = 0;
    e->opcod = 'i';
    e->pcnt = narg;
    e->offtim = when+dur;     /* indef perf */
    e->p[1] = instr;
    e->p[2] = when;
    e->p[3] = dur;
    e->p2orig = when;
    e->p3orig = dur;
    for (j= 0; j < narg-3; j++) {
      e->p[j+4] = *args[j];
    }
    if (instrtxtp[insno] == NULL) {
      printf(Str(X_1177,"schedule event ignored. instr %d undefined\n"), insno);
      perferrcnt++;
    }
    else {                      /* Insert this event into event queue */
      INSTRTXT  *tp;
      INSDS     *ip, *prvp, *nxtp;
      OPDS      *ids;
      VMSG(printf("activating instr %d\n",insno);)
      inerrcnt = 0;
      tp = instrtxtp[insno];
      if (tp->mdepends & 04) {
        printf(Str(X_925,"instr %d expects midi event data, cannot run from score\n"),
               insno);
        return NULL;
      }
      if ((ip = tp->instance) != NULL) { /* if allocs of text exist: */
        do {
          if (ip->insno == insno        /*       if find this insno,  */
              && ip->actflg             /*        active              */
              && ip->offtim < 0         /*        with indef (tie)    */
              && ip->p1 == e->p[1]){ /*  & matching p1  */
            tieflag++;
            goto init;                  /*        continue that event */
          }
        } while ((ip = ip->nxtinstance) != NULL);
        ip = tp->instance;              /*       else get alloc of text */
        do {
          if (!ip->actflg)              /*              that is free    */
            goto actlnk;                /*            and use its space */
        } while ((ip = ip->nxtinstance) != NULL);
      }

      if (O.msglevel & 2) printf(Str(X_1013,"new alloc for instr %d:\n"),insno);
      ip = instance(insno);     /* else alloc new dspace  */

    actlnk:
      ip->insno = insno;
      nxtp = &actanchor;        /* now splice into active list */
      while ((prvp = nxtp) && (nxtp = prvp->nxtact) != NULL)
        if (nxtp->insno > insno
            || nxtp->insno == insno
            && nxtp->p1 > e->p[1]) {
          nxtp->prvact = ip;
          break;
        }
      ip->nxtact = nxtp;
      ip->prvact = prvp;
      prvp->nxtact = ip;
      ip->actflg++;             /*        and mark the instr active */
      {
        int    n;
        MYFLT  *flp, *fep;

      init:
        if ((n = tp->pmax) != e->pcnt) {
          sprintf(errmsg,Str(X_928,"instr %d pmax = %d, note pcnt = %d"),
                  insno, n, e->pcnt);
          warning(errmsg);
        }
        if (e->p3orig >= 0.0)
          ip->offbet = e->p2orig + e->p3orig;
        else ip->offbet = -FL(1.0);
        flp = &ip->p1;
        fep = &e->p[1];
        VMSG(printf(Str(X_1137,"psave beg at %p\n"),flp);)
        do      *flp++ = *fep++; /* psave       */
        while (--n);
        VMSG(printf(Str(X_6,"   ending at %p\n"),flp);)
      }
      ip->offtim = ip->p3;      /* & duplicate p3 for now */
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
        return ip;
      }
      if (!midi) { /* if not MIDI activated */
        if (ip->p3 > FL(0.0)) { /* if still finite time, */
          ip->offtim = ip->p2 + ip->p3;
          schedofftim(ip);      /*       put in turnoff list */
        }
        else ip->offtim = -FL(1.0); /* else mark indef */
      }
      VMSG({    printf("instr %d now active:\n",insno); showallocs(); })
      return ip;
    }
    mfree(e);
    return NULL;
}

void queue_event(MYFLT instr,
                 MYFLT when,
                 MYFLT dur,
                 int narg,
                 MYFLT **args)
{
    int i, insno;
    MYFLT starttime;
    EVTNODE *evtlist, *newnode;
    EVTBLK  *newevt;

    printf("queue_event: %.0f %f %f ...\n", instr, when, dur);
    insno = (int)instr;
    if (instrtxtp[insno] == NULL) {
      printf(Str(X_1177,"schedule event ignored. instr %d undefined\n"), insno);
      perferrcnt++;
      return;
    }
    /* Create the new event */
    newnode = (EVTNODE *) mmalloc((long)sizeof(EVTNODE));
    newevt = &newnode->evt;
    newevt->opcod = 'i';
    /* Set start time from kwhen */
    starttime = when;
    if (starttime < FZERO) {
      starttime = FZERO;
      warning(Str(X_1483,"schedkwhen warning: negative kwhen reset to zero"));
    }
    /* Add current time (see note about kadjust in triginset() above) */
    newnode->kstart = (long)(starttime * ekr + FL(0.5));
    newevt->p2orig = starttime;
    newevt->p3orig = dur;
    /* Copy all arguments to the new event */
    newevt->pcnt = narg;
    for (i = 0; i < narg-3; i++)
      newevt->p[i+4] = *args[i];
    newevt->p[3] = dur;
    newevt->p[2] = starttime;    /* Set actual start time in p2 */
    newevt->p[1] = (float)(newnode->insno = insno);

/*      printf("newevt: %c %f %f %f %f %f...\n", newevt->opcod, newevt->p2orig, */
/*             newevt->p3orig, newevt->p[1], newevt->p[2], newevt->p[3]); */

    /* Insert eventnode in list of generated events */
    evtlist = &OrcTrigEvts;
    while (evtlist->nxtevt) {
      if (newnode->kstart < evtlist->nxtevt->kstart) break;
      evtlist = evtlist->nxtevt;
    }
    newnode->nxtevt = evtlist->nxtevt;
    evtlist->nxtevt = newnode;
    O.RTevents = 1;     /* Make sure kperf() looks for RT events */
    O.ksensing = 1;
    O.OrcEvts  = 1;     /* - of the appropriate type */
    return;
}

/* ********** Need to add turnoff stuff *************** */
void schedule(SCHED *p)
{
    RSCHED *rr = kicked;        /* First ensure any stragglers die */
    RSCHED *ss = NULL;          /* really incase of reinit */
    while (rr!=NULL) {
      if (rr->parent==p) {
       if (rr->kicked->xtratim) { /*      if offtime delayed  */
        rr->kicked->relesing = 1;/*     enter reles phase     */
        rr->kicked->offtim = (kcounter + rr->kicked->xtratim) * onedkr;
        schedofftim(rr->kicked);        /*          & put in offqueue */
       }
       else deact(rr->kicked);  /*        else off now        */
       {
         RSCHED *tt = rr->next;
         free(rr);
         rr = tt;
         if (ss==NULL) kicked = rr;
       }
      }
      else {
        ss = rr; rr = rr->next;
      }
    }

    if (*p->which >= curip->p1 || *p->when>0) {
      RSCHED *rr;
      /* if duration is zero assume MIDI schedule */
      MYFLT dur = *p->dur;
      printf("SCH: when = %f dur = %f\n", *p->when, dur);
      p->midi = (dur<=FL(0.0));
      if (p->midi) {
        short *xtra;
        printf("SCH: MIDI case\n");
        /* set 1 k-cycle of extratime in ordeto allow mtrnoff to
           recognize whether the note is turned off */
        if (*(xtra = &(p->h.insdshead->xtratim)) < 1 )
          *xtra = 1;
      }
      if (*p->when == 0.0) {
        p->kicked = insert_event(*p->which, *p->when+kcounter*onedkr, dur,
                                 p->INOCOUNT, p->argums, p->midi);
        if (p->midi) {
          rr = (RSCHED*) malloc(sizeof(RSCHED));
          rr->parent = p; rr->kicked = p->kicked; rr->next = kicked;
          kicked = rr;
        }
      }
      else queue_event(*p->which, *p->when+kcounter*onedkr, dur,
                       p->INOCOUNT, p->argums);
    }
    else
      VMSG({printf("Cannot schedule instr %d at inc time %f\n",
                   (int)*p->which, *p->when);})
}

void schedwatch(SCHED *p)
{                               /* If MIDI case watch for release */
    if (p->midi && p->h.insdshead->relesing) {
      p->midi = 0;
      if (p->kicked==NULL) return;
      if (p->kicked->xtratim) { /*        if offtime delayed  */
        p->kicked->relesing = 1; /*     enter reles phase */
        p->kicked->offtim = (kcounter + p->kicked->xtratim) * onedkr;
        schedofftim(p->kicked); /*              & put in offqueue */
      }
      else deact(p->kicked);    /*        else off now            */
      {
        RSCHED *rr = kicked;
        RSCHED *ss = NULL;
        while (rr!=NULL) {
          if (rr->parent==p) {
            RSCHED *tt = rr->next;
            free(rr);
            rr = tt;
            if (ss==NULL) kicked = rr;
          }
          else {
            ss = rr; rr = rr->next;
          }
        }
      }
      p->kicked = NULL;
    }
}

void ifschedule(WSCHED *p)
{                       /* All we need to do is ensure the trigger is set */
    p->todo = 1;
    p->abs_when = curip->p2;            /* Adjust time */
    p->midi = 0;
}

void kschedule(WSCHED *p)
{
    if (p->todo && *p->trigger!=0.0) { /* If not done and trigger */
      RSCHED *rr;
      MYFLT dur = *p->dur;
      p->midi = (dur<=FL(0.0));
      p->todo = 0;
                                /* Insert event */
      if (*p->when==0) {
        p->kicked = insert_event(*p->which, p->abs_when, dur,
                               p->INOCOUNT, p->argums-1, p->midi);
        if (p->midi) {
          rr = (RSCHED*) malloc(sizeof(RSCHED));
          rr->parent = p; rr->kicked = p->kicked; rr->next = kicked;
          kicked = rr;
        }
      }
      else queue_event(*p->which, *p->when+p->abs_when, dur,
                       p->INOCOUNT, p->argums-1);
    }
    else if (p->midi && p->h.insdshead->relesing) {
                                /* If MIDI case watch for release */
      p->midi = 0;
      if (p->kicked==NULL) return;
      if (p->kicked->xtratim) { /*        if offtime delayed  */
        p->kicked->relesing = 1;/*      enter reles phase     */
        p->kicked->offtim = (kcounter + p->kicked->xtratim) * onedkr;
        schedofftim(p->kicked); /*          & put in offqueue */
      }
      else deact(p->kicked);    /*        else off now        */
      {
        RSCHED *rr = kicked;
        RSCHED *ss = NULL;
        while (rr!=NULL) {
          if (rr->parent==p) {
            RSCHED *tt = rr->next;
            free(rr);
            rr = tt;
            if (ss==NULL) kicked = rr;
          }
          else {
            ss = rr; rr = rr->next;
          }
        }
      }
      p->kicked = NULL;
    }
}

extern MYFLT kicvt;

/* tables are 4096 entries always */

#define MAXPHASE 0x1000000
#define MAXMASK  0x0ffffff
void lfoset(LFO *p)
{
  /* Types: 0:  sine
            1:  triangles
            2:  square (biplar)
            3:  square (unipolar)
            4:  saw-tooth
            5:  saw-tooth(down)
            */
    int type = (int)*p->type;
    if (type == 0) {            /* Sine wave so need to create */
      int i;
      if (p->auxd.auxp==NULL) {
        auxalloc(sizeof(MYFLT)*4097L, &p->auxd);
        p->sine = (MYFLT*)p->auxd.auxp;
      }
      for (i=0; i<4096; i++)
        p->sine[i] = (MYFLT)sin(TWOPI*(double)i/4096.0);
/*        printf("Table set up (max is %d)\n", MAXPHASE>>10); */
    }
    else if (type>5 || type<0) {
      sprintf(errmsg, Str(X_320,"LFO: unknown oscilator type %d"), type);
      initerror(errmsg);
    }
    p->lasttype = type;
    p->phs = 0;
}

void lfok(LFO *p)
{
    long        phs;
    MYFLT       fract;
    MYFLT       res;
    long        iphs;

    phs = p->phs;
    switch (p->lasttype) {
    case 0:
      iphs = phs >> 12;
      fract = (MYFLT)(phs & 0xfff)/FL(4096.0);
      res = p->sine[iphs];
      res = res + (p->sine[iphs+1]-res)*fract;
      break;
    case 1:                     /* Trangular */
      res = (MYFLT)((phs<<2)&MAXMASK)/(MYFLT)MAXPHASE;
      if (phs < MAXPHASE/4) {}
      else if (phs < MAXPHASE/2)
        res = FL(1.0) - res;
      else if (phs < 3*MAXPHASE/4)
        res = - res;
      else
        res = res - FL(1.0);
      break;
    case 2:                     /* Bipole square wave */
      if (phs<MAXPHASE/2) res = FL(1.0);
      else res = -FL(1.0);
      break;
    case 3:                     /* Unipolar square wave */
      if (phs<MAXPHASE/2) res = FL(1.0);
      else res = FL(0.0);
      break;
    case 4:                     /* Saw Tooth */
      res = (MYFLT)phs/(MYFLT)MAXPHASE;
      break;
    case 5:                     /* Reverse Saw Tooth */
      res = FL(1.0) - (MYFLT)phs/(MYFLT)MAXPHASE;
      break;
    }
    phs += (long)(*p->xcps * MAXPHASE / ekr);
    phs &= MAXMASK;
    p->phs = phs;
    *p->res = *p->kamp * res;
}

void lfoa(LFO *p)
{
    int         nsmps = ksmps;
    long        phs;
    MYFLT       fract;
    MYFLT       res;
    long        iphs, inc;
    MYFLT       *ar, amp;

    phs = p->phs;
    inc = (long)((*p->xcps * (MYFLT)MAXPHASE)/esr);
    amp = *p->kamp;
    ar = p->res;
    do {
      switch (p->lasttype) {
      case 0:
        iphs = phs >> 12;
        fract = (MYFLT)(phs & 0xfff)/FL(4096.0);
        res = p->sine[iphs];
        res = res + (p->sine[iphs+1]-res)*fract;
        break;
      case 1:                   /* Triangular */
        res = (MYFLT)((phs<<2)&MAXMASK)/(MYFLT)MAXPHASE;
        if (phs < MAXPHASE/4) {}
        else if (phs < MAXPHASE/2)
          res = FL(1.0) - res;
        else if (phs < 3*MAXPHASE/4)
          res = - res;
        else
          res = res - FL(1.0);
        break;
      case 2:                   /* Bipole square wave */
        if (phs<MAXPHASE/2) res = FL(1.0);
        else res = -FL(1.0);
        break;
      case 3:                   /* Unipolar square wave */
        if (phs<MAXPHASE/2) res = FL(1.0);
        else res = FL(0.0);
        break;
      case 4:                   /* Saw Tooth */
        res = (MYFLT)phs/(MYFLT)MAXPHASE;
        break;
      case 5:                   /* Reverse Saw Tooth */
        res = FL(1.0) - (MYFLT)phs/(MYFLT)MAXPHASE;
        break;
      }
      phs += inc;
      phs &= MAXMASK;
      *ar++ = res * amp;
    } while (--nsmps);
    p->phs = phs;
}

/******************************************************************************/
/* triginstr - Ignite instrument events at k-rate from orchestra.             */
/* August 1999 by rasmus ekman.                                               */
/* Changes made also to Cs.h, Musmon.c and Insert.c; look for "(re Aug 1999)" */
/******************************************************************************/

/* Called from kperf() to see if any event to turn on */
int sensOrcEvent(void)
{
    if (OrcTrigEvts.nxtevt && OrcTrigEvts.nxtevt->kstart <= kcounter)
      return(4);    /* sensType value (0=score,1=line,2/3=midi) */
    else return(0);
}

void ktriginstr(TRIGINSTR *p);

void triginset(TRIGINSTR *p)
{
    p->prvmintim = *p->mintime;
    p->timrem = 0;
    /* An instrument is initialised before kcounter is incremented for
       this k-cycle, and begins playing after kcounter++.
       Therefore, if we should start something at the very first k-cycle of
       performance, we must thus do it now, lest it be one k-cycle late.
       But in ktriginstr() we'll need to use kcounter-1 to set the start time
       of new events. So add a separate variable for the kcounter offset (-1). */
    if (kcounter == 0 && *p->trigger != FZERO /*&& *p->args[1] <= FZERO*/) {
      p->kadjust = 0;   /* No kcounter offset at this time */
      ktriginstr(p);
    }
    p->kadjust = -1;      /* Set kcounter offset for perf-time */
    /* Catch p3==0 (i-time only) event triggerings. */
    if (kcounter > 0 && *p->trigger != FZERO && p->h.insdshead->p3 == 0)
      ktriginstr(p);
    return;
}


void ktriginstr(TRIGINSTR *p)
{         /* k-rate event generator */
    int i, absinsno, argnum;
    MYFLT insno, starttime;
    EVTNODE *evtlist, *newnode;
    EVTBLK  *newevt;

    if (*p->trigger == FZERO) /* Only do something if triggered */
      return;

    /* Get absolute instr num */
    insno = *p->args[0];
    absinsno = abs((int)insno);
    /* Check that instrument is defined */
    if (absinsno > maxinsno || instrtxtp[absinsno] == NULL) {
      printf(Str(X_1482,"schedkwhen ignored. Instrument %d undefined\n"),
             absinsno);
      perferrcnt++;
      return;
    }

    /* On neg instrnum to turn off a held copy, skip mintime/maxinst tests */
    if (insno >= FZERO) {
      /* On neg instrnum, turn off a held copy.
         (Regardless of mintime/maxinst) */
      if (insno < FZERO) {
        infoff(-insno);
        return;
      }

      /* Check if mintime has changed */
      if (p->prvmintim != *p->mintime) {
        long timrem = (int)(*p->mintime * ekr + FL(0.5));
        if (timrem > 0) {
          /* Adjust countdown for new mintime */
          p->timrem += timrem - p->prvktim;
          p->prvktim = timrem;
        } else timrem = 0;
        p->prvmintim = *p->mintime;
      }

      /* Check for rate limit on event generation and count down */
      if (*p->mintime > FZERO && --p->timrem > 0)
        return;

      /* See if there are too many instances already */
      if (*p->maxinst >= FONE) {
        INSDS *ip;
        int numinst = 0;
        /* Count active instr instances */
        ip = &actanchor;
        while ((ip = ip->nxtact) != NULL)
          if (ip->insno == absinsno) numinst++;
        if (numinst >= (int)*p->maxinst)
          return;
      }
    } /* end test for non-turnoff events (pos insno) */

    /* Create the new event */
    newnode = (EVTNODE *) mmalloc((long)sizeof(EVTNODE));
    newevt = &newnode->evt;
    newevt->opcod = 'i';
    /* Set start time from kwhen */
    starttime = *p->args[1];
    if (starttime < FZERO) {
      starttime = FZERO;
      warning(Str(X_1483,"schedkwhen warning: negative kwhen reset to zero"));
    }
    /* Add current time (see note about kadjust in triginset() above) */
    starttime += (MYFLT)(kcounter + p->kadjust) * onedkr;
    newnode->kstart = (long)(starttime * ekr + FL(0.5));
    newevt->p2orig = starttime;
    newevt->p3orig = *p->args[2];
    /* Copy all arguments to the new event */
    newevt->pcnt = argnum = p->INOCOUNT-3;
    for (i = 0; i < argnum; i++)
      newevt->p[i+1] = *p->args[i];
    newevt->p[2] = starttime;    /* Set actual start time in p2 */

    newnode->insno = absinsno;
    /* Set event activation time in k-cycles */
    newnode->kstart = (long)(starttime * ekr + FL(0.5));

    /* Insert eventnode in list of generated events */
    evtlist = &OrcTrigEvts;
    while (evtlist->nxtevt) {
      EVTNODE *nextlistevt = evtlist->nxtevt;
      if (newnode->kstart < nextlistevt->kstart) break;
      /* Sort events starting at same time by instr number (re dec 01) */
      if (newnode->kstart == nextlistevt->kstart && 
          newnode->insno == nextlistevt->insno &&
          newnode->evt.p[1] <= nextlistevt->evt.p[1]) 
        break;
      evtlist = evtlist->nxtevt;
    }
    newnode->nxtevt = evtlist->nxtevt;
    evtlist->nxtevt = newnode;
    O.RTevents = 1;     /* Make sure kperf() looks for RT events */
    O.ksensing = 1;
    O.OrcEvts  = 1;     /* - of the appropriate type */

    /* Reset min pause counter */
    if (*p->mintime > FZERO)
      p->timrem = (long)(*p->mintime * ekr + FL(0.5));
    else p->timrem = 0;
    return;
}

/* Maldonado triggering of events */

void trigseq_set(TRIGSEQ *p)     /* by G.Maldonado */
{
    FUNC *ftp;
    if ((ftp = ftfind(p->kfn)) == NULL) {
      initerror(Str(X_1535,"trigseq: incorrect table number"));
      return;
    }
    p->done=0;
    p->table = ftp->ftable;
    p->pfn = (long)*p->kfn;
    p->ndx = (long)*p->initndx;
    p->nargs = p->INOCOUNT-5;
}

void trigseq(TRIGSEQ *p)
{
    if (p->done) return;
    else {
      int j, nargs = p->nargs;
      long start = (long) *p->kstart, loop = (long) *p->kloop;
      long *ndx = &p->ndx;
      MYFLT *out = *p->outargs;

      if (p->pfn != (long)*p->kfn) {
        FUNC *ftp;
        if ((ftp = ftfindp(p->kfn)) == NULL) {
          perferror(Str(X_1535,"trigseq: incorrect table number"));
          return;
        }
        p->pfn = (long)*p->kfn;
        p->table = ftp->ftable;
      }
      if (*p->ktrig) {
        int nn = nargs * (int)*ndx;
        for (j=0; j < nargs; j++) {
          *out++ = p->table[nn+j];
        }
        if (loop > 0) {
          (*ndx)++;
          *ndx %= loop;
          if (*ndx == 0) {
            if (start == loop) {
              p->done = 1;      /* Was bug here -- JPff 2000 May 28*/
              return;
            }
            *ndx += start;
          }
        }
        else if (loop < 0) {
          (*ndx)--;
          while (*ndx < start) {
            if (start == loop) {
              p->done = 1;
              return;
            }
            *ndx -= loop + start;
          }
        }
      }
    }
}

void seqtim_set(SEQTIM *p)       /* by G.Maldonado */
{
    FUNC *ftp;
    long start, loop;
    long *ndx = &p->ndx;
    p->pfn = (long) *p->kfn;
    if ((ftp = ftfind(p->kfn)) == NULL) {
      initerror(Str(X_1536,"seqtim: incorrect table number"));
      return;
    }
    *ndx = (long) *p->initndx;
    p->done = 0;
    p->table =  ftp->ftable;
    p->newtime = p->table[p->ndx];
    p->start = kcounter * onedkr ;
    start = (long) *p->kstart;
    loop = (long) *p->kloop;
    if (loop > 0) {
      (*ndx)++;
      *ndx %= loop;
      if (*ndx == 0) {
        *ndx += start;
      }
    }
    else if (loop < 0) {
      (*ndx)--;
      while (*ndx < start) {
        *ndx -= loop + start;
      }
    }
}

void seqtim(SEQTIM *p)
{
    if (p->done)
      *p->ktrig=FL(0.0);
    else {
      long start = (long) *p->kstart, loop = (long) *p->kloop;
      long *ndx = &p->ndx;
      if (p->pfn != (long)*p->kfn) {
        FUNC *ftp;
        if ((ftp = ftfindp(p->kfn)) == NULL) {
          perferror(Str(X_1536,"seqtim: incorrect table number"));
          return;
        }
        p->pfn = (long)*p->kfn;
        p->table = ftp->ftable;
      }
      if (kcounter * onedkr > p->newtime * *p->unit_time + p->start) {
        p->newtime += p->table[p->ndx];
        if (loop > 0) {
          (*ndx)++;
          *ndx %= loop;
          if (*ndx == 0){
            if (start == loop) {
              p->done = 1;
              return;
            }
            *ndx += start;
          }
        }
        else if (loop < 0 ){
          (*ndx)--;
          while (p->ndx < 0) {
            if (start == loop) {
              p->done = 1;
              return;
            }
            *ndx -= loop + start;
          }
        }
        *p->ktrig = FL(1.0);
      }
      else
      *p->ktrig=FL(0.0);
    }
}
