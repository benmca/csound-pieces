                                                /*      FTGEN.H        */
void    makevt(void);
FUNC    *hfgens(EVTBLK *);

#define MAXFNUM    300

typedef struct {
        OPDS    h;
        MYFLT   *ifno, *p1, *p2, *p3, *p4, *p5, *argums[VARGMAX];
} FTGEN;

