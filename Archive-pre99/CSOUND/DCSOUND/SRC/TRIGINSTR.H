/*****************************************************************/
/* triginstr - Start instrument events at k-rate from orchestra. */
/* August 1999 by rasmus ekman.                                  */
/*****************************************************************/

typedef struct {
	OPDS   h;
	FLOAT  *trigger, *mintime, *maxinst;
	FLOAT  *args[PMAX+1];
	FLOAT  prvmintim;
	long   timrem, prvktim, kadjust;
} TRIGINSTR;


typedef struct eventnode {
	EVTBLK evt; /* Must be first in struct so it can be typecast & freed */
	struct eventnode *nxtevt;
	int    kstart, insno;
} EVTNODE;

extern EVTNODE OrcTrigEvts;
extern int sensOrcEvent(void);


typedef struct {
	OPDS   h;
	FLOAT  *trigger;
	FLOAT  *args[PMAX+1];
	//FLOAT  prvmintim;
	//long   timrem, prvktim, kadjust;
} SCHEDK2;
