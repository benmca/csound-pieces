/*                                                      UGENSM.H  */

#define PFRAC1(x)   ((MYFLT)((x) & ftp1->lomask) * ftp1->lodiv)

typedef struct overlap {
  struct overlap *nxtact;
  struct overlap *nxtfree;
  long           timrem, dectim, formphs, forminc;
  unsigned long  risphs;
  long           risinc, decphs, decinc;
  MYFLT          curamp, expamp;
} OVERLAP;


typedef struct {
  OPDS  h;
  MYFLT *ar, *xamp, *xdens, *xtrans, *xspd, *koct, *kband, *kris, *kdur, *kdec;
  MYFLT *iolaps, *ifna, *ifnb, *itotdur, *iphs, *itmode;
  OVERLAP       basovrlap;
  long  durtogo, fundphs, fofcount, prvsmps, spdphs; /*last added JMC for FOG*/
  MYFLT prvband, expamp, preamp, fogcvt; /*last added JMC for FOG*/
  short xincod, ampcod, fundcod;
  short formcod, fmtmod, speedcod; /*last added JMC for FOG*/
  AUXCH auxch;
  FUNC  *ftp1, *ftp2;
} FOGS;


/*typedef struct {
        OPDS    h;
        MYFLT   *sr, *xamp, *xcps, *ifn, *iphs;
        long    lphs;
        FUNC    *ftp;
} JMC;
*/
