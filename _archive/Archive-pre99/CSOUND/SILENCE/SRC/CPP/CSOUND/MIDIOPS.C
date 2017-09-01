#include "cs.h"                                       /*    MIDIOPS.C    */
#include "midiops.h"
#include <math.h>

#define dv127   (FL(1.0)/FL(127.0))

extern MYFLT *cpsocint, *cpsocfrc, octresol;
extern INSDS    *curip;         /* valid at I-time */
extern MCHNBLK  *m_chnbp[];

#define MIDI_VALUE(m,field) ((m != (MCHNBLK *) NULL) ? m->field : FL(0.0))

    /*
     * m (=m_chnbp) can easily be NULL (the only place it gets set, as
     * of 3.484, is in MIDIinsert) so we should check for validity
     *                                  [added by nicb@axnet.it]
     */

/* This line has reverted to checking the null pointer as the code in oload
 * does leaves it null if there is no chanel.  The correct fix is to fix that
 * code so the test is not dynamic, but until I understand it.... */
#define pitchbend_value(m) MIDI_VALUE(m,pchbend)

extern INSTRTXT **instrtxtp;  /* gab-A3 (added) */
void midibset(MIDIKMB *);

void massign(MASSIGN *p)
{
    MCHNBLK *chn;
    short chnl = (short)(*p->chnl - FL(1.0));
    m_chinsno(chnl, (short) *p->insno);
                                /* Changes from gab */
    if ((chn = m_chnbp[chnl]) == NULL)
      m_chnbp[chnl] = chn = (MCHNBLK *) mcalloc((long)sizeof(MCHNBLK));
    if (instrtxtp[(int) *p->insno] != NULL)           /* if corresp instr exists  */
      chn->pgmno = (short) *p->insno;                 /*     assign as pgmno      */
    else {
      char s[80];
      sprintf(s,Str(X_924,"instr %d does not exit. Can't assign it to chan %d"),
              (int) *p->insno, (int) *p->chnl );
      initerror(s);
    }
}

void ctrlinit(CTLINIT *p)
{
    short chnl = (short)(*p->chnl - FL(1.0));
    short nargs = p->INOCOUNT;
    if ((nargs & 0x1) == 0)
        initerror(Str(X_1319,"uneven ctrl pairs"));
    else {
        MCHNBLK *chn;
        MYFLT **argp = p->ctrls;
        short ctlno, nctls = nargs >> 1;
        if ((chn = m_chnbp[chnl]) == NULL)
            chn = m_getchnl(chnl);
        do {
            ctlno = (short) **argp++;
            if (ctlno < 0 || ctlno > 120) {
                initerror(Str(X_845,"illegal ctrl no"));
                return;
            }
            chn->ctl_val[ctlno] = **argp++;
        } while (--nctls);
    }
}

MYFLT **uctl_map = NULL;                /* accessed by midirecv */
MYFLT dsctl_map[12] = {FL(1.0),FL(0.0),FL(1.0),FL(0.0),FL(1.0),FL(0.0),
                       FL(1.0),FL(0.0),FL(1.0),FL(0.0),FL(1.0),FL(0.0)};

void notnum(MIDIKMB *p)      /* valid only at I-time */
{
    *p->r = curip->m_pitch;
}


/* cpstmid by G.Maldonado */
void cpstmid(CPSTABLE *p)
{
    FUNC  *ftp;
    MYFLT *func;
    int notenum = curip->m_pitch;
    int grade;
    int numgrades;
    int basekeymidi;
    MYFLT basefreq, factor,interval;

    if ((ftp = ftfind(p->tablenum)) == NULL)
      initerror(Str(X_675,"cpstabm: invalid modulator table"));
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

void veloc(MIDIMAP *p)          /* valid only at I-time */
{
    *p->r = *p->ilo + curip->m_veloc * (*p->ihi - *p->ilo) * dv127;
}

void pchmidi(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    double fract, oct, ioct;
    oct = curip->m_pitch / 12.0 + 3.0;
    fract = modf(oct, &ioct);
    fract *= 0.12;
    *p->r = (MYFLT)(ioct + fract);
}

void pchmidib(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    double fract, oct, ioct;
    MYFLT bend = pitchbend_value(curip->m_chnbp);
    oct = (curip->m_pitch + (bend * p->scale)) / FL(12.0) + FL(3.0);
    fract = modf(oct, &ioct);
    fract *= 0.12;
    *p->r = (MYFLT)(ioct + fract);
}

void pchmidib_i(MIDIKMB *p)
{
    midibset(p);
    pchmidib(p);
}

void octmidi(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = curip->m_pitch / FL(12.0) + FL(3.0);
}

void octmidib(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = (curip->m_pitch + (pitchbend_value(curip->m_chnbp) * p->scale)) / FL(12.0) + FL(3.0);
}

void octmidib_i(MIDIKMB *p)
{
  midibset(p);
  octmidib(p);
}

void cpsmidi(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    long  loct;
    /*    loct = (long)(((curip->m_pitch + */
    /*       pitchbend_value(curip->m_chnbp) * p->iscal)/ 12.0f + 3.0f) * octresol); */
    loct = (long)((curip->m_pitch/ FL(12.0) + FL(3.0)) * octresol);
    *p->r = CPSOCTL(loct);
}

void icpsmidib(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    long  loct;
    MYFLT bend = pitchbend_value(curip->m_chnbp);
    p->prvbend = bend;
    loct = (long)(((curip->m_pitch +
                    bend * p->scale) / FL(12.0) + FL(3.0)) * octresol);
    *p->r = CPSOCTL(loct);
}

void icpsmidib_i(MIDIKMB *p)
{
    midibset(p);
    icpsmidib(p);
}

void kcpsmidib(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    MYFLT bend = pitchbend_value(curip->m_chnbp);
    if (bend == p->prvbend || curip->relesing)
        *p->r = p->prvout;
    else {
      long  loct;
      p->prvbend = bend;
      loct = (long)(((curip->m_pitch +
                      bend * p->scale) / FL(12.0) + FL(3.0)) * octresol);
      *p->r = p->prvout = CPSOCTL(loct);
    }
}

void ampmidi(MIDIAMP *p)        /* convert midi veloc to amplitude */
                                /*   valid only at I-time          */
{
    MYFLT amp;
    long  fno;
    FUNC *ftp;

    amp = curip->m_veloc / FL(128.0);                   /* amp = normalised veloc */
    if ((fno = (long)*p->ifn) > 0) {
        if ((ftp = ftfind(p->ifn)) == NULL)         /* if valid ftable,       */
            return;                                 /*     use amp as index   */
        amp = *(ftp->ftable + (long)(amp * ftp->flen));
    }
    *p->r = amp * *p->imax;                         /* now scale the output   */
}

/*      MWB 2/11/97  New optional field to set pitch bend range
        I also changed each of the xxxmidib opcodes, adding * p->scale*/
void midibset(MIDIKMB *p)
{
    if (*p->iscal > 0) {
      p->scale = *p->iscal;
    }
    else {
      p->scale = FL(2.0);
    }
    p->prvbend = FL(0.0);          /* Start from sane position */
}

void aftset(MIDIKMAP *p)
{
    p->lo = *p->ilo;
    p->scale = (*p->ihi - p->lo) * dv127;
}

void aftouch(MIDIKMAP *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = p->lo + MIDI_VALUE(curip->m_chnbp, aftouch) * p->scale;
}

/* void chpress(MIDIKMB *p) */
/* { */
/*     INSDS *curip = p->h.insdshead; */
/*     *p->r = curip->m_chnbp->chnpress * p->scale; */
/* } */

/* void pbenset(MIDIKMB *p) */
/* { */
/*     p->scale = *p->iscal; */
/* } */

/* void pchbend(MIDIKMB *p) */
/* { */
/*     INSDS *curip = p->h.insdshead; */
/*     *p->r = curip->m_chnbp->pchbend * p->scale; */
/* } */

void imidictl(MIDICTL *p)
{
    long  ctlno;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
        initerror(Str(X_844,"illegal controller number"));
    else *p->r = MIDI_VALUE(curip->m_chnbp, ctl_val[ctlno])
            * (*p->ihi - *p->ilo) * dv127 + *p->ilo;
}

void mctlset(MIDICTL *p)
{
    long  ctlno;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
        initerror(Str(X_844,"illegal controller number"));
    else {
      p->ctlno = ctlno;
      p->scale = (*p->ihi - *p->ilo) * dv127;
      p->lo = *p->ilo;
      /* MWB If the controller value is 0, it is initialised to the optional
         value */
      /*
       * the m_chnbp pointer may very well be null here, so we better check
       * [nicb@axnet.it]
       */
      if (p->h.insdshead->m_chnbp != (MCHNBLK *) NULL)
      if (p->h.insdshead->m_chnbp->ctl_val[p->ctlno] == 0) {
        p->h.insdshead->m_chnbp->ctl_val[p->ctlno] = p->lo;
      }
    }
}

void midictl(MIDICTL *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = MIDI_VALUE(curip->m_chnbp,ctl_val[p->ctlno]) * p->scale + p->lo;
}


void imidiaft(MIDICTL *p)
{
    long  ctlno;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
        initerror(Str(X_844,"illegal controller number"));
    else *p->r = MIDI_VALUE(curip->m_chnbp, polyaft[ctlno])
            * (*p->ihi - *p->ilo) * dv127 + *p->ilo;
}

void maftset(MIDICTL *p)
{
    long  ctlno;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
        initerror(Str(X_844,"illegal controller number"));
    else {
      p->ctlno = ctlno;
      p->scale = (*p->ihi - *p->ilo) * dv127;
      p->lo = *p->ilo;
      /* MWB If the controller value is 0, it is initialised to the optional
         value */
      /*
       * the m_chnbp pointer may very well be null here, so we better check
       * [nicb@axnet.it]
       */
      if (p->h.insdshead->m_chnbp != (MCHNBLK *) NULL)
      if (p->h.insdshead->m_chnbp->polyaft[p->ctlno] == 0) {
        p->h.insdshead->m_chnbp->polyaft[p->ctlno] = p->lo;
      }
    }
}

void midiaft(MIDICTL *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = MIDI_VALUE(curip->m_chnbp,polyaft[p->ctlno]) * p->scale + p->lo;
}


void ichanctl(CHANCTL *p)
{
    long  ctlno, chan = (long)(*p->ichano - FL(1.0));
    if (chan < 0 || chan > 15 || m_chnbp[chan] == NULL)
        initerror(Str(X_839,"illegal channel number"));
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
        initerror(Str(X_844,"illegal controller number"));
    else *p->r = m_chnbp[chan]->ctl_val[ctlno] * (*p->ihi - *p->ilo) * dv127
                + *p->ilo;
}

void chctlset(CHANCTL *p)
{
    long  ctlno, chan = (long)(*p->ichano - FL(1.0));
    if (chan < 0 || chan > 15 || m_chnbp[chan] == NULL)
        initerror(Str(X_839,"illegal channel number"));
    else p->chano = chan;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
        initerror(Str(X_844,"illegal controller number"));
    else {
        p->ctlno = ctlno;
        p->scale = (*p->ihi - *p->ilo) * dv127;
        p->lo = *p->ilo;
    }
}

void chanctl(CHANCTL *p)
{
    *p->r = m_chnbp[p->chano]->ctl_val[p->ctlno] * p->scale + p->lo;
}

void ipchbend(MIDIMAP *p)
{
    *p->r = *p->ilo + (*p->ihi - *p->ilo) *
            pitchbend_value(p->h.insdshead->m_chnbp);
}

void kbndset(MIDIKMAP *p)
{
    p->lo = *p->ilo;
    p->scale = *p->ihi - *p->ilo;
}

void kpchbend(MIDIKMAP *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = p->lo + pitchbend_value(curip->m_chnbp) * p->scale;
}
