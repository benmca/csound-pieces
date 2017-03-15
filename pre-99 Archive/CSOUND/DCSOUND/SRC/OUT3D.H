typedef struct {
	OPDS	h;
	MYFLT	*asig, *num;
} OUT3D;

typedef struct {
	OPDS	h;
	MYFLT	*num;
} INIT3D;


typedef struct {
	OPDS	h;
	MYFLT	*x, *y, *z, *num;
} OUT3DPOS;

typedef struct {
	OPDS	h;
	MYFLT	*distance, *num;
} OUT3DDIST;

typedef struct {
	OPDS	h;
	MYFLT	*inside, *outside, *num;
} OUT3DCONEANG;


typedef struct {
	OPDS	h;
	MYFLT	*volume, *num;
} OUT3DCONEVOL;


typedef struct {
	OPDS	h;
	MYFLT	*mode, *num;
} OUT3DMODE;

typedef struct {
	OPDS	h;
	MYFLT	*p1, *p2, *p3, *p4, *p5, *p6, *p7, *p8, *p9, *p10, *p11, *p12, *num;
} OUT3DSETALL;

typedef struct {
	OPDS	h;
	MYFLT	*p1, *p2, *p3, *p4, *p5, *p6, *p7, *p8, *p9, *p10, *p11;
} LISTSETALL;

typedef struct {
	OPDS	h;
	MYFLT	*x, *y, *z;
} LISTPOS;

typedef struct {
	OPDS	h;
	MYFLT	*xFront, *yFront, *zFront; 
	MYFLT	*xTop,   *yTop,   *zTop;
} LISTOR;

typedef struct {
	OPDS	h;
	MYFLT	*rolloff, *num;
} LISTROLL;

typedef struct {
	OPDS	h;
	MYFLT	*distance, *num;
} LISTDIST;

typedef struct {
	OPDS	h;
	MYFLT	*flag;
} SET_DEFERRED;

typedef struct {
	OPDS	h;
} COMMIT_DEFERRED;

typedef struct {
	OPDS	h;
	MYFLT	*parm;
} EAX_PARM;

typedef struct {
	OPDS	h;
	MYFLT	*p1, *p2, *p3, *p4, *p5, *p6, *p7, *p8, *p9, *p10, *p11, *p12, *p13 ;
} EAX_LISTALL;

typedef struct {
	OPDS	h;
	MYFLT	*p1, *p2, *p3, *p4, *p5, *p6;
} EAX_LISTFLAGS;

typedef struct {
	OPDS	h;
	MYFLT	*parm,*num;
} EAX_SOURCEPARM;

typedef struct {
	OPDS	h;
	MYFLT	*p1, *p2, *p3, *num;
} EAX_SOURCEFLAGS;

typedef struct {
	OPDS	h;
	MYFLT	*p1, *p2, *p3, *p4, *p5, *p6, *p7, *p8, *p9, *p10, *p11, *p12, *num ;
} EAX_SOURCEALL;
