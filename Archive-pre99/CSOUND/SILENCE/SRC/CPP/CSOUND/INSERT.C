#include "cs.h"                 /*                              INSERT.C        */
#include "insert.h"     /* for goto's */
#include "aops.h"       /* for cond's */
#include "midiops.h"
#include <string.h>             /* for memset() */

#ifdef mills_macintosh
#include "MacTransport.h"
#endif

extern  INSTRTXT **instrtxtp;
extern  OENTRY  *opcodlst;
extern MYFLT cpu_power_busy;  /* accumulates the supposed percent of cpu usage */
/* extern  INSDS *insalloc[]; */
extern  OPARMS  O;

INSDS   actanchor, *curip, *frstoff = NULL, *instance(int);
long    kcounter = 0;         /* count of k-periods throughout performance  */
int     inerrcnt = 0, perferrcnt = 0;

int     tieflag = 0;            /* toggled by insert for tigoto */
static  int     reinitflag = 0;         /* toggled by reinit for others */
static  OPDS    *ids, *pds;             /* used by init and perf loops  */
                                        /*  & modified by igoto, kgoto  */
static  OPDS    opdstmp;
void    showallocs(void);
extern  void    putop(TEXT*);
void    deact(INSDS *), schedofftim(INSDS *);
int     sensOrcEvent(void);     /* For triginstr (re Aug 1999) */

void insertRESET(void)
{
    memset(&actanchor,0,sizeof(INSDS));
    curip          = NULL;
    frstoff        = NULL;
    kcounter       = 0;
    inerrcnt       = 0;
    perferrcnt     = 0;
    tieflag        = 0;
    reinitflag     = 0;
    ids            = NULL;
    pds            = NULL;
    cpu_power_busy = FL(0.0);
    /* don't forget local externs in this file... */
}

int init0(void)
{
    INSDS  *ip;

    curip = ip = instance(0);               /* allocate instr 0     */
    ids = (OPDS *)ip;
    while ((ids = ids->nxti) != NULL) {
      (*ids->iopadr)(ids);            /*   run all i-code     */
    }
    return(inerrcnt);                       /*   return errcnt      */
}

int
insert(int insno, EVTBLK *newevtp)  /* insert an instr copy into active list */
{                                   /*      then run an init pass           */
    INSTRTXT *tp;
    INSDS  *ip, *prvp, *nxtp;

    VMSG(printf("activating instr %d\n",insno);)
    inerrcnt = 0;
    tp = instrtxtp[insno];
    if (tp->mdepends & 04) {
      printf(Str(X_925,"instr %d expects midi event data, cannot run from score\n"),
             insno);
      return(1);
    }
    if ((ip = tp->instance) != NULL) {      /* if allocs of text exist: */
      do      if (ip->insno == insno  /*   if find this insno,  */
                  && ip->actflg         /*      active            */
                  && ip->offtim < 0     /*      with indef (tie)  */
                  && ip->p1 == newevtp->p[1]){ /*  & matching p1  */
        tieflag++;
        goto init;      /*     continue that event */
      }
      while ((ip = ip->nxtinstance) != NULL);
      ip = tp->instance;              /*   else get alloc of text */
      do      if (!ip->actflg)        /*      that is free        */
        goto actlnk;    /*      and use its space   */
      while ((ip = ip->nxtinstance) != NULL);
    }
    /* RWD: screen writes badly slow down RT playback */
    if (O.msglevel & 2) printf(Str(X_1013,"new alloc for instr %d:\n"),insno);
    ip = instance(insno);                   /* else alloc new dspace  */

 actlnk:
    cpu_power_busy += instrtxtp[insno]->cpuload;
    if (cpu_power_busy > 100.0) { /* if there is no more cpu processing time*/
      cpu_power_busy -= instrtxtp[insno]->cpuload;
      warning(Str(X_26,
                  "cannot allocate last note because it exceeds 100% of cpu time"));
      return(0);
    }
        /* Add an active instrument */
    if (instrtxtp[insno]->active++ > instrtxtp[insno]->maxalloc &&
        instrtxtp[insno]->maxalloc>0) {
      instrtxtp[insno]->active--;
      warning(Str(X_27,
                  "cannot allocate last note because it exceeds instr maxalloc"));
      return(0);
    }

#ifdef never
    printf("Now %d active instr %d\n", instrtxtp[insno]->active, insno);
#endif
    ip->insno = insno;
    nxtp = &actanchor;                      /* now splice into activ lst */
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
    ip->actflg++;                   /*    and mark the instr active */
    {
      int    n;
      MYFLT  *flp, *fep;

    init:
      if (tp->psetdata) {
        MYFLT *pfld = &ip->p3;              /* if pset data present */
        MYFLT *pdat = tp->psetdata + 2;
        long nn = tp->pmax - 2;             /*   put cur vals in pflds */
        do {
          *pfld++ = *pdat++;
        } while (nn--);
      }
      if ((n = tp->pmax) != newevtp->pcnt && !tp->psetdata) {
        sprintf(errmsg,Str(X_928,"instr %d pmanx = %d, note pcnt = %d"),
                insno, n, newevtp->pcnt);
        warning(errmsg);
      }
      if (newevtp->p3orig >= 0.0)
        ip->offbet = newevtp->p2orig + newevtp->p3orig;
      else ip->offbet = FL(-1.0);
      flp = &ip->p1;
      fep = &newevtp->p[1];
      VMSG(printf("psave beg at %p\n",flp);)
        do  *flp++ = *fep++;            /* psave        */
        while (--n);
        VMSG(printf("   ending at %p\n",flp);)
    }
    ip->offtim = ip->p3;                    /* & duplicate p3 for now */
    ip->xtratim = 0;
    ip->relesing = 0;
    curip = ip;
    ids = (OPDS *)ip;
    while ((ids = ids->nxti) != NULL) {   /* do init pass for this instr */
       VMSG({printf("init %s:\n", opcodlst[ids->optext->t.opnum].opname);})
      (*ids->iopadr)(ids);
    }
    tieflag = 0;
    if (inerrcnt || !ip->p3) {
      deact(ip);
      return(inerrcnt);
    }
    if (ip->p3 > FL(0.0) && ip->offtim > FL(0.0)) {   /* if still finite time, */
      ip->offtim = ip->p2 + ip->p3;
      schedofftim(ip);                    /*   put in turnoff list */
    }
    else ip->offtim = -FL(1.0);                      /* else mark indef */
    VMSG({  printf("instr %d now active:\n",insno); showallocs(); })
    return(0);
}

int MIDIinsert(int insno, MCHNBLK *chn, MEVENT *mep)
    /* insert a MIDI instr copy into active list */
    /*  then run an init pass           */
{
    INSTRTXT *tp;
    INSDS    *ip, **ipp;
    extern   int      Mforcdecs;

    cpu_power_busy += instrtxtp[insno]->cpuload;
    if (cpu_power_busy > FL(100.0)) { /* if there is no more cpu processing time*/
      cpu_power_busy -= instrtxtp[insno]->cpuload;
      warning(
         Str(X_26,
             "cannot allocate last note because it exceeds 100%% of cpu time"));
      return(0);
    }
    VMSG(printf("activating instr %d\n",insno);)
    inerrcnt = 0;
    ipp = &chn->kinsptr[mep->dat1];         /* key insptr ptr           */
    tp = instrtxtp[insno];
    if (tp->instance != NULL) {             /* if allocs of text exist  */
      INSDS **spp;
      if ((ip = *ipp) != NULL) {          /*   if key currently activ */
        if (ip->xtratim == 0)           /*     if decay not needed  */
          goto m_dat2;                /*        usurp curr space  */
        else goto forcdec;              /*     else force a decay   */
      }
      spp = ipp + 128;                    /*   (struct dependent ! )  */
      if ((ip = *spp) != NULL) {          /*   else if pch sustaining */
        *spp = NULL;                    /*     remov from sus array */
        chn->ksuscnt--;
        if (ip->xtratim == 0) {
          *ipp = ip;
          goto m_dat2;
        }
        else {
        forcdec:
          ip->relesing = 1;           /*     else force a decay   */
          ip->offtim = (kcounter + ip->xtratim) * onedkr;
          schedofftim(ip);
          Mforcdecs++;
        }
      }                                   /*         & get new space  */
      ip = tp->instance;                  /*    srch existing allocs  */
      do  if (!ip->actflg)                /*      if one is free      */
        goto actlnk;                /*      then use its space  */
      while ((ip = ip->nxtinstance) != NULL);
    }
    printf(Str(X_1013,"new alloc for instr %d:\n"),insno);
    ip = instance(insno);                   /* else alloc new dspace  */

 actlnk:
    ip->insno = insno;
    if (instrtxtp[insno]->active++ > instrtxtp[insno]->maxalloc &&
        instrtxtp[insno]->maxalloc>0) {
      instrtxtp[insno]->active--;
      warning(Str(X_27,
                  "cannot allocate last note because it exceeds instr maxalloc"));
      return(0);
    }
#ifdef never
    printf("Now %d active instr %d\n", instrtxtp[insno]->active, insno);
#endif
    {
      INSDS  *prvp, *nxtp;       /* now splice into activ lst */
      nxtp = &actanchor;
      while ((prvp = nxtp) && (nxtp = prvp->nxtact) != NULL)
        if (nxtp->insno > insno) {
          nxtp->prvact = ip;
          break;
        }
      ip->nxtact = nxtp;
      ip->prvact = prvp;
      prvp->nxtact = ip;
    }
    ip->actflg++;           /*    and mark the instr active */
    if (tp->pmax > 3 && tp->psetdata==NULL) {
      sprintf(errmsg,Str(X_927,"instr %d p%d illegal for MIDI"),
              insno, tp->pmax);
      warning(errmsg);
    }
    ip->m_chnbp = chn;      /* rec address of chnl ctrl blk */
    *ipp = ip;              /* insds ptr for quick midi-off */
    ip->m_pitch = mep->dat1; /* rec MIDI data               */
 m_dat2:
    ip->m_veloc = mep->dat2;
    ip->xtratim = 0;
    ip->relesing = 0;
    ip->offtim = -FL(1.0);       /* set indef duration */
    if (tp->psetdata != NULL) {
      MYFLT *pfld = &ip->p3;              /* if pset data present */
      MYFLT *pdat = tp->psetdata + 2;
      long nn = tp->pmax - 2;             /*   put cur vals in pflds */
      do {
        *pfld++ = *pdat++;
      } while (nn--);
    }
    curip = ip;
    ids = (OPDS *)ip;
    while ((ids = ids->nxti) != NULL) { /* do init pass for this instr  */
      VMSG(printf("init %s:\n", opcodlst[ids->optext->t.opnum].opname);)
      (*ids->iopadr)(ids);
    }
    tieflag = 0;
    if (inerrcnt) {
      deact(ip);
      return(inerrcnt);
    }
    VMSG( { printf("instr %d now active:\n",insno); showallocs(); } )
    return(0);
}

void showallocs(void)    /* debugging aid        */
{
    extern   INSTRTXT instxtanchor;
    INSTRTXT *txtp;
    INSDS   *p;

    printf("insno\tinstanc\tnxtinst\tprvinst\tnxtact\t"
           "prvact\tnxtoff\tactflg\tofftim\n");
    for (txtp = &instxtanchor;  txtp != NULL;  txtp = txtp->nxtinstxt)
      if ((p = txtp->instance) != NULL) {
        /*
         * On Alpha, we print pointers as pointers.  heh 981101
         * and now on all platforms (JPff)
         */
        do  printf("%d\t%p\t%p\t%p\t%p\t%p\t%p\t%d\t%3.1f\n",
                   (int)p->insno, p,
                   p->nxtinstance,
                   p->prvinstance, p->nxtact,
                   p->prvact, p->nxtoff,
                   p->actflg, p->offtim);
        while ((p = p->nxtinstance) != NULL);
      }
}

void schedofftim(INSDS *ip)     /* put an active instr into offtime list  */
                                /* called by insert() & midioff + xtratim */
{
    INSDS *prvp, *nxtp;

    if ((nxtp = frstoff) == NULL
        || nxtp->offtim > ip->offtim)          /*   set into      */
      frstoff = ip;                       /*   firstoff chain */
    else {
      while ((prvp = nxtp)
             && (nxtp = nxtp->nxtoff) != NULL
             && ip->offtim >= nxtp->offtim);
      prvp->nxtoff = ip;
    }
    ip->nxtoff = nxtp;
}


void insxtroff(short insno)     /* deactivate all schedofftim copies    */
{                               /*  (such as xtratims still playing)    */
    INSDS *ip, *prvp;

    for (ip = frstoff; ip != NULL; ip = ip->nxtoff) {
      if (ip->insno == insno && ip->actflg) {
        deact(ip);
        if (frstoff == ip)
          frstoff = ip->nxtoff;
        else prvp->nxtoff = ip->nxtoff;
      }
      else prvp = ip;
    }
}

void deact(INSDS *ip)           /* unlink single instr from activ chain */
                                /*      and mark it inactive            */
{                               /*   close any files in fd chain        */
    INSDS  *nxtp;

/*     printf("active(%d) = %d\n", ip->insno, instrtxtp[ip->insno]->active); */
    instrtxtp[ip->insno]->active--;     /* remove an active instrument */
    cpu_power_busy -= instrtxtp[ip->insno]->cpuload;
#if 0
    printf("removed instance of instr %d\n", ip->insno);
#endif
    if ((nxtp = ip->prvact->nxtact = ip->nxtact) != NULL)
      nxtp->prvact = ip->prvact;
    ip->actflg = 0;
    if (ip->fdch.nxtchp != NULL)
      fdchclose(ip);
}

void beatexpire(MYFLT beat)     /* unlink expired notes from activ chain */
{                               /*      and mark them inactive          */
    INSDS  *ip, *nxtp;     /*    close any files in each fdchain   */

    if ((ip = frstoff) != NULL && ip->offbet <= beat) {
      do {
        if ((nxtp = ip->prvact->nxtact = ip->nxtact) != NULL)
          nxtp->prvact = ip->prvact;
        instrtxtp[ip->insno]->active--;
        cpu_power_busy -= instrtxtp[ip->insno]->cpuload;
#ifdef never
        printf("removed instance of instr %d\n", ip->insno);
#endif
        ip->actflg = 0;
        if (ip->fdch.nxtchp != NULL)
          fdchclose(ip);
      }
      while ((ip = ip->nxtoff) != NULL && ip->offbet <= beat);
      frstoff = ip;
      VMSG( { printf("deactivated all notes to beat %7.3f\n",beat);
      printf("frstoff = %p\n",frstoff);  } )
        }
}

void timexpire(MYFLT time)      /* unlink expired notes from activ chain */
{                               /*      and mark them inactive           */
    INSDS  *ip, *nxtp;          /*    close any files in each fdchain    */

    if ((ip = frstoff) != NULL && ip->offtim <= time) {
      do {
        if ((nxtp = ip->prvact->nxtact = ip->nxtact) != NULL)
          nxtp->prvact = ip->prvact;
        ip->actflg = 0;
        instrtxtp[ip->insno]->active--;
        cpu_power_busy -= instrtxtp[ip->insno]->cpuload;
#ifdef never
        printf("removed instance of instr %d\n", ip->insno);
#endif
        if (ip->fdch.nxtchp != NULL)
          fdchclose(ip);
      }
      while ((ip = ip->nxtoff) != NULL && ip->offtim <= time);
      frstoff = ip;
      VMSG( { printf("deactivated all notes to time %7.3f\n",time);
      printf("frstoff = %p\n",frstoff); } )
        }
}

void ihold(void)                        /* make this note indefinit duration */
{                                       /* called by ihold statmnt at Itime */
        if (!reinitflag) {              /* no-op at reinit                  */
                curip->offbet = -FL(1.0);
                curip->offtim = -FL(1.0);
        }
}

void turnoff(void)                      /* terminate the current instrument  */
{                                       /* called by turnoff statmt at Ptime */
    INSDS  *curip = pds->insdshead;
    if (curip->xtratim) {               /* if extra time needed:  */
      INSDS *nxt;
      MYFLT oldtim = curip->offtim;
      MYFLT newtim = (kcounter + curip->xtratim) * onedkr;
/* printf("Turnoff called %d offtime %f->%f\n", curip->xtratim,oldtim,newtim); */
      curip->relesing = 1;
      curip->offtim = newtim;
      if (oldtim < FL(0.0))             /* if indef duratn instr   */
        schedofftim(curip);             /*    schedoff at new time */
      else if ((nxt = curip->nxtoff) != NULL
               && newtim > nxt->offtim) {
        INSDS *prv, *newip = nxt;       /* else relink if reqd  */
        while ((prv = nxt)
               && (nxt = nxt->nxtoff) != NULL
               && newtim > nxt->offtim);
        prv->nxtoff = curip;
        curip->nxtoff = nxt;
        if (curip == frstoff)
          frstoff = newip;
      }
      curip->xtratim--;         /* Decay the delay */
    }
    else {                                /* no extra time needed:  */
      INSDS   *ip, *prvip;
      MCHNBLK *chn;
      short   pch;
      deact(curip);                       /* deactivate immediately */
      if ((chn = curip->m_chnbp) != NULL
          && (pch = curip->m_pitch)) {    /* if this was a MIDI note */
        INSDS **ipp = &chn->kinsptr[pch];
        if (*ipp == curip) *ipp = NULL;   /*    remov from activ lst */
        else if (chn->ksuscnt) {
          ipp += 128;                     /* STRUCT DEPEND */
          if (*ipp == curip) {
            *ipp = NULL;                  /*    or from sustain list */
            chn->ksuscnt--;
          }
        }
      }
      if (curip->offtim >= FL(0.0)      /* skip indefinite durs    */
          && (ip = frstoff) != NULL) {
        if (ip == curip)                /* else rm from nxtoff chn */
          frstoff = ip->nxtoff;
        else while ((prvip = ip) && (ip = ip->nxtoff) != NULL)
          if (ip == curip) {
            prvip->nxtoff = ip->nxtoff;
            break;
          }
      }
    }
}

void xturnoff(INSDS *ip)                /* turnoff a particular insalloc */
{                                       /* called by inexclus on ctrl 111 */
    pds = &opdstmp;
    pds->insdshead = ip;
    turnoff();
}

void insdealloc(short insno)      /* dealloc all instances of an insno */
{                                 /*   called by midirecv on pgm_chng  */
    INSDS   *ip, *nxtip;

    if ((ip = instrtxtp[insno]->instance) != NULL) {
      do {                              /* for all instances: */
        if (ip->actflg)                 /* if active, deact   */
          deact(ip);                    /*    & close files   */
        if (ip->auxch.nxtchp != NULL)
          auxchfree(ip);                /* free auxil space   */
        nxtip = ip->nxtinstance;
        free((char *)ip);               /* & free the INSDS   */
      } while ((ip = nxtip) != NULL);
      instrtxtp[insno]->instance = NULL;/* now there are none */
    }
}

void orcompact(void)                    /* free all inactive instr spaces */
{
    extern   INSTRTXT instxtanchor;
    INSTRTXT *txtp;
    INSDS   *ip, *nxtip, *prvip, **prvnxtloc;

    for (txtp = &instxtanchor;  txtp != NULL;  txtp = txtp->nxtinstxt)
      if ((ip = txtp->instance) != NULL) {        /* if instance exists */
        prvip = NULL;
        prvnxtloc = &txtp->instance;
        do {
          if (ip->actflg == 0) {
            OPDS* off = ip->nxtp;
            while (off!=NULL) {
              if (off->dopadr) (*off->dopadr)(off);
              off = off->nxtp;
            }
            if (ip->fdch.nxtchp != NULL)
              fdchclose(ip);
            if (ip->auxch.nxtchp != NULL)
              auxchfree(ip);
            if ((nxtip = ip->nxtinstance) != NULL)
              nxtip->prvinstance = prvip;
            *prvnxtloc = nxtip;
            mfree((char *)ip);
          }
          else {
            prvip = ip;
            prvnxtloc = &ip->nxtinstance;
          }
        }
        while ((ip = *prvnxtloc) != NULL);
      }
    printf(Str(X_897,"inactive allocs returned to freespace\n"));
}

void infoff(MYFLT p1)           /*  turn off an indef copy of instr p1  */
{                               /*      called by musmon                */
    INSDS *ip;
    int   insno;

    insno = (int)p1;
    if ((ip = (instrtxtp[insno])->instance) != NULL) {
      do if (ip->insno == insno          /* if find the insno */
             && ip->actflg                 /*      active       */
             && ip->offtim < 0             /*      but indef,   */
             && ip->p1 == p1) {
        if (ip->xtratim && ip->offbet < 0)    { /* Gab: delays the off event is xtratim > 0 */
#include "schedule.h"
          MYFLT starttime;
          EVTNODE *evtlist, *newnode;
          EVTBLK  *newevt;

          newnode         = (EVTNODE *) mmalloc((long)sizeof(EVTNODE));
          newevt          = &newnode->evt;
          newevt->opcod   = 'i';
          starttime       = (MYFLT) (kcounter + ip->xtratim) * onedkr;
          newnode->kstart = kcounter + ip->xtratim;
          newevt->p2orig  = starttime;
          newevt->p3orig  = FL(0.0);
          newevt->p[1]    = (MYFLT) -insno; /* negative p1 */
          newevt->p[2]    = starttime;    /* Set actual start time in p2 */
          newevt->p[3]    = FL(0.0);
          newevt->pcnt    = 2;
          newnode->insno  = insno;
          evtlist         = &OrcTrigEvts;
          while (evtlist->nxtevt) {
            if (newnode->kstart < evtlist->nxtevt->kstart) break;
            evtlist = evtlist->nxtevt;
          }
          newnode->nxtevt = evtlist->nxtevt;
          evtlist->nxtevt = newnode;
          O.RTevents      = 1;     /* Make sure kperf() looks for RT events */
          O.ksensing      = 1;
          O.OrcEvts       = 1;
          ip->offbet      = 0; /* to avoid another check */
          ip->relesing    = 1;
          return;
        }
        VMSG(printf("turning off inf copy of instr %d\n",insno);)
        deact(ip);
        return;                     /*  turn it off */
      } while ((ip = ip->nxtinstance) != NULL);
    }
    printf(Str(X_669,"could not find indefinitely playing instr %d\n"),insno);
}

long kperf(long kcnt)   /* perform currently active instrs for kcnt kperiods */
                        /*      & send audio result to output buffer    */
{
    extern  int     sensLine(void);
    extern  int     sensType, sensMidi(void), sensFMidi(void);
    extern  long    FMidiNxtk;
    extern  int     spoutactive;
    extern  void    (*spinrecv)(void), (*spoutran)(void), (*nzerotran)(long);
    INSDS  *ip;
    long    kreq = kcnt;
    VMSG(printf("perfing %ld kprds\n",kcnt);)
    if (!O.ksensing && actanchor.nxtact == NULL) {  /* if !kreads & !instrs_activ, */
      kcounter += kcnt;
#if defined(mills_macintosh) || defined(CWIN) || defined(SYMANTEC)
      /* silence here, so we can afford to check events more often */
      {
        long pcnt = kcnt;
        while (pcnt!=0) {
          long pp = (pcnt>128 ? 128 : pcnt);
          (*nzerotran)(pp);     /*   send chunk up to kcnt zerospouts  */
          if (!POLL_EVENTS()) exit(1);
          pcnt -= pp;
        }
      }
#else
      (*nzerotran)(kcnt);     /*   send kcnt zerospouts  */
#endif
    }
    else do {                 /* else for each kcnt:     */
      if (O.RTevents) {
        if (O.Midiin && (sensType = sensMidi()) /*   if MIDI note message  */
            || O.FMidiin && kcounter >= FMidiNxtk
            && (sensType = sensFMidi())
            || O.Linein && (sensType = sensLine()) /* or Linein event */
            || O.OrcEvts && (sensType = sensOrcEvent())) /* or triginstr event (re Aug 1999) */
          return(kreq - kcnt); /*      do early return    */
      }
#if defined(mills_macintosh) || defined(CWIN) || defined(SYMANTEC)
      else if (O.Midiin && actanchor.nxtact == NULL) /* no midi or notes on so ok to check events */
        if (!POLL_EVENTS()) exit(1);
#endif
      kcounter += 1;
      if (O.sfread)           /*   if audio_infile open  */
        (*spinrecv)();        /*      fill the spin buf  */
      spoutactive = 0;        /*   make spout inactive   */
      ip = &actanchor;
      while ((ip = ip->nxtact) != NULL) { /*   for each instr active */
#ifdef CWIN
        if (!POLL_EVENTS()) exit(1); /* PC GUI needs attention */
#endif
        pds = (OPDS *)ip;
        while ((pds = pds->nxtp) != NULL) {
          (*pds->opadr)(pds); /*      run each opcode    */
        }
      }
      if (spoutactive)        /*   results now in spout? */
        (*spoutran)();        /*      send to audio_out  */
      else (*nzerotran)(1L);  /*   else send zerospout   */
    } while (--kcnt);         /* on Mac/Win, allow system events */
    return(kreq);
}

void initerror(char *s)
{
    /* RWD: need this! */
    if (ids==NULL) {
      dies(Str(X_551,"\nINIT ERROR: %s\n"),s);
    }
    printf(Str(X_299,"INIT ERROR in instr %d: %s\n"), ids->insdshead->insno, s);
    putop(&ids->optext->t);
    inerrcnt++;
}

void perferror(char *s)
{
    /*RWD and probably this too... */
    if (pds==NULL) {
      dies(Str(X_553,"\nPERF ERROR: %s\n"),s);
    }
    printf(Str(X_403,"PERF ERROR in instr %d: %s\n"), pds->insdshead->insno, s);
    putop(&pds->optext->t);
    printf(Str(X_7,"   note aborted\n"));
    perferrcnt++;
    deact(pds->insdshead);                    /* rm ins fr actlist */
    while (pds->nxtp != NULL)
      pds = pds->nxtp;                        /* loop to last opds */
}                                             /* contin from there */

void igoto(GOTO *p)
{
    ids = p->lblblk->prvi;
}

void kgoto(GOTO *p)
{
    pds = p->lblblk->prvp;
}

void icgoto(CGOTO *p)
{
    if (*p->cond)
      ids = p->lblblk->prvi;
}

void kcgoto(CGOTO *p)
{
    if (*p->cond)
      pds = p->lblblk->prvp;
}

void timset(TIMOUT *p)
{
    if ((p->cnt1 = (long)(*p->idel * ekr + .5)) < 0L
        || (p->cnt2 = (long)(*p->idur * ekr + .5)) < 0L)
      initerror(Str(X_1012,"negative time period"));
}

void timout(TIMOUT *p)
{
    if (p->cnt1)                            /* once delay has expired, */
      p->cnt1--;
    else if (--p->cnt2 >= 0L)               /*  br during idur countdown */
      pds = p->lblblk->prvp;
}

void rireturn(LINK *p)
{
    IGN(p);
}

void reinit(GOTO *p)
{
    reinitflag = 1;
    curip = p->h.insdshead;
    ids = p->lblblk->prvi;        /* now, despite ANSI C warning:  */
    while ((ids = ids->nxti) != NULL && ids->iopadr != (SUBR)rireturn)
      (*ids->iopadr)(ids);
    reinitflag = 0;
}

void rigoto(GOTO *p)
{
    if (reinitflag)
      ids = p->lblblk->prvi;
}

void tigoto(GOTO *p)                    /* I-time only, NOP at reinit */
{
    if (tieflag && !reinitflag)
      ids = p->lblblk->prvi;
}

void tival(EVAL *p)                     /* I-time only, NOP at reinit */
{
    if (!reinitflag)
      *p->r = (tieflag ? FL(1.0) : FL(0.0));
}
