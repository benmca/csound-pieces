                                                        /*  DUMPF.H  */
typedef struct {
        OPDS   h;
	MYFLT  *ksig, *ifilcod, *iformat, *iprd;
	int    format;
	long   countdown, timcount;
	FDCH   fdch;
} KDUMP;

typedef struct {
        OPDS   h;
	MYFLT  *ksig1, *ksig2, *ifilcod, *iformat, *iprd;
	int    format;
	long   countdown, timcount;
	FDCH   fdch;
} KDUMP2;

typedef struct {
        OPDS   h;
	MYFLT  *ksig1, *ksig2, *ksig3, *ifilcod, *iformat, *iprd;
	int    format;
	long   countdown, timcount;
	FDCH   fdch;
} KDUMP3;

typedef struct {
        OPDS   h;
	MYFLT  *ksig1, *ksig2, *ksig3, *ksig4, *ifilcod, *iformat, *iprd;
	int    format;
	long   countdown, timcount;
	FDCH   fdch;
} KDUMP4;

typedef struct {
        OPDS   h;
	MYFLT  *k1, *ifilcod, *iformat, *iprd, *interp;
	int    format;
	long   countdown, timcount;
        MYFLT  k[4];
	FDCH   fdch;
} KREAD;

typedef struct {
        OPDS   h;
	MYFLT  *k1, *k2, *ifilcod, *iformat, *iprd, *interp;
	int    format;
	long   countdown, timcount;
        MYFLT  k[4];
	FDCH   fdch;
} KREAD2;

typedef struct {
        OPDS   h;
	MYFLT  *k1, *k2, *k3, *ifilcod, *iformat, *iprd, *interp;
	int    format;
	long   countdown, timcount;
        MYFLT  k[4];
	FDCH   fdch;
} KREAD3;

typedef struct {
        OPDS   h;
	MYFLT  *k1, *k2, *k3, *k4, *ifilcod, *iformat, *iprd, *interp;
	int    format;
	long   countdown, timcount;
        MYFLT  k[4];
	FDCH   fdch;
} KREAD4;

