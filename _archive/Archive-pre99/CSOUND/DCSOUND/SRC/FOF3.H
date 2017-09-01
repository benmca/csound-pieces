/*								UGENS7.H	*/

typedef struct ovrlap3 {
    struct ovrlap3  *nxtact, *nxtfree;
	long	timrem, dectim, formphs, forminc, risphs, risinc, decphs, decinc;
	MYFLT	curamp, expamp;
    MYFLT	glissbas;/* Gliss factor to add to forminc (ifna index incr) */
	long	sampct;		/* Sample count since grain started */
} OVRLAP3;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *xfund, *xform, *koct, *kband, *kris, *kdur, *kdec;
	MYFLT	*iolaps, *ifna, *ifnb, *itotdur, *iphs, *ifmode;
  /* kgliss and ifmode are same field */
	OVRLAP3	basovrlap;
	long	durtogo, fundphs, fofcount, prvsmps;
	MYFLT   prvband, expamp, preamp;
	short	xincod, ampcod, fundcod, formcod, fmtmod;
	AUXCH	auxch;
	FUNC	*ftp1, *ftp2;
} FOFS3;
