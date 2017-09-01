#include "sftype.h"
#include "sf.h"

typedef struct {
	OPDS	h;
	MYFLT	*ihandle, *fname;
} SFLOAD;

typedef struct {
	OPDS	h;
	MYFLT	*ihandle;
} SFPLIST;

typedef struct {
	OPDS	h;
	MYFLT	*startNum,*ihandle;
} SFPASSIGN;

typedef struct {
	OPDS	h;
	MYFLT	*ipresethandle, *iprog, *ibank, *isfhandle, *iPresetHandle;
} SFPRESET;

#define MAXSPLT 10

typedef struct {
	OPDS	h;
	MYFLT	*out1, *out2,  *ivel, *inotnum,*xamp, *xfreq, *ipresethandle, *iflag, *ioffset;
	int spltNum;
	SHORT *base[MAXSPLT], mode[MAXSPLT];
	DWORD end[MAXSPLT], startloop[MAXSPLT], endloop[MAXSPLT];
	double si[MAXSPLT],phs[MAXSPLT];
	MYFLT  leftlevel[MAXSPLT], rightlevel[MAXSPLT];
} SFPLAY;
										  

typedef struct {
	OPDS	h;
	MYFLT	*out1,  *ivel, *inotnum,*xamp, *xfreq, *ipresethandle, *iflag, *ioffset;
	int spltNum;
	SHORT *base[MAXSPLT], mode[MAXSPLT];
	DWORD end[MAXSPLT], startloop[MAXSPLT], endloop[MAXSPLT];
	double si[MAXSPLT],phs[MAXSPLT];
	MYFLT  attenuation[MAXSPLT] ;
} SFPLAYMONO;

typedef struct {
	OPDS	h;
	MYFLT	*out1,  *ivel, *inotnum, *xamp, *xfreq, *instrNum, *sfBank, *iflag, *ioffset;
	int spltNum;
	SHORT *base[MAXSPLT], mode[MAXSPLT];
	DWORD end[MAXSPLT], startloop[MAXSPLT], endloop[MAXSPLT];
	double si[MAXSPLT],phs[MAXSPLT];
	MYFLT  attenuation[MAXSPLT] ;
} SFIPLAYMONO;


typedef struct {
	OPDS	h;
	MYFLT	*out1, *out2, *ivel, *inotnum, *xamp, *xfreq, *instrNum, *sfBank, *iflag, *ioffset;
	int spltNum;
	SHORT *base[MAXSPLT], mode[MAXSPLT];
	DWORD end[MAXSPLT], startloop[MAXSPLT], endloop[MAXSPLT];
	double si[MAXSPLT],phs[MAXSPLT];
	MYFLT  leftlevel[MAXSPLT], rightlevel[MAXSPLT];
} SFIPLAY;
