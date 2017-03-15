
typedef struct {
    	OPDS   h;
	MYFLT  *which, *when, *dur;
	MYFLT  *argums[VARGMAX-3];
	int    midi;
	INSDS  *kicked;
} SCHED;


typedef struct {
    	OPDS   h;
	MYFLT  *trigger;
	MYFLT  *which, *when, *dur;
	MYFLT  *argums[VARGMAX-3];
	int    todo;
	MYFLT  abs_when;
	int    midi;
	INSDS  *kicked;
} WSCHED;

typedef struct {
    	OPDS    h;
	MYFLT   *res;
	MYFLT   *kamp, *xcps, *type;
	AUXCH   auxd;
	MYFLT   *sine;
	int     lasttype;
	long    phs;
} LFO;

/*****************************************************************/
/* triginstr - Start instrument events at k-rate from orchestra. */
/* August 1999 by rasmus ekman.                                  */
/*****************************************************************/

typedef struct {
	OPDS   h;
	MYFLT  *trigger, *mintime, *maxinst;
	MYFLT  *args[PMAX+1];
	MYFLT  prvmintim;
	long   timrem, prvktim, kadjust;
} TRIGINSTR;


typedef struct eventnode {
	EVTBLK evt; /* Must be first in struct so it can be typecast & freed */
	struct eventnode *nxtevt;
	int    kstart, insno;
} EVTNODE;

extern EVTNODE OrcTrigEvts;
extern int sensOrcEvent(void);

/*****************************************************************/
/* trigseq, seqtime -                                            */
/* May 2000 by Gabriel Maldonado                                 */
/*****************************************************************/

typedef struct {
  OPDS  h;
  MYFLT	*ktrig, *kstart, *kloop, *initndx, *kfn, *outargs[VARGMAX];
  long  ndx;
  int   nargs, done;
  long  pfn;
  MYFLT *table;
} TRIGSEQ;

typedef struct {
  OPDS  h;
  MYFLT *ktrig, *unit_time, *kstart, *kloop, *initndx, *kfn;
  long  ndx;
  int   done;
  double start, newtime;
  long  pfn;
  MYFLT *table;
} SEQTIM;

typedef struct { /* GAB 11/Jan/2001 */
	OPDS   h;
	MYFLT  *trigger;
	MYFLT  *args[PMAX+1];
} SCHEDK2;

