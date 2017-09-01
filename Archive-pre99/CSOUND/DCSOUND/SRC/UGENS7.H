/*							UGENS7.H	*/

#define PFRAC1(x)   ((MYFLT)((x) & ftp1->lomask) * ftp1->lodiv)

typedef struct ovrlap {
        struct ovrlap  *nxtact, *nxtfree;
	long	timrem, dectim, formphs, forminc, risphs, risinc, decphs, decinc;
	MYFLT	curamp, expamp;
        MYFLT	glissbas;/* Gliss factor to add to forminc (ifna index incr) */
	long	sampct;		/* Sample count since grain started */
} OVRLAP;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *xfund, *xform, *koct, *kband, *kris, *kdur, *kdec;
	MYFLT	*iolaps, *ifna, *ifnb, *itotdur, *iphs, *ifmode;
  /* kgliss and ifmode are same field */
        int	foftype;	/* Distinguish fof and fof2 */
	OVRLAP	basovrlap;
	long	durtogo, fundphs, fofcount, prvsmps;
	MYFLT   prvband, expamp, preamp;
	short	xincod, ampcod, fundcod, formcod, fmtmod;
	AUXCH	auxch;
	FUNC	*ftp1, *ftp2;
} FOFS;

typedef struct {
	OPDS    h;
	MYFLT   *ar, *asig, *kest, *kvar, *kfrq1, *kfrq2;
        MYFLT	*icpsmode, *ilowest, *iptrkprd;
	long    nbufsmps, n2bufsmps, phase1, phase2, period, autoktim, autokcnt;
	long    mindist, maxdist, max2dist, lomaxdist, cpsmode;
	MYFLT   c1, c2, prvq, prvest, prvar, minfrq, estprd, sicvt;
	MYFLT   *bufp, *midp, *inp1, *inp2;
	MYFLT   *bufq, *midq, *inq1, *inq2, *autobuf;
	MYFLT   *puls1, *puls2, *puls3, lin1, lin2, lin3;
	MYFLT   inc1, inc2, inc11, inc12, inc21, inc22, inc31, inc32;
	long    cnt1, cnt2, cnt3, pnt1, pnt2, pnt3;
	long    pnt11, pnt12, pnt13, pnt21, pnt22, pnt23, pnt31, pnt32, pnt33;
	AUXCH   auxch;
} HARMON;
