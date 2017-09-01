typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *iexp, *itype, *idisp, *iwidth, *iheight, *ix, *iy;
	MYFLT min, base;
} FLSLIDER;

typedef struct	{
	OPDS	h;
	MYFLT *ihandle, *name, *itype, *iwidth, *iheight, *ix, *iy, *args[PMAX+1];
	MYFLT min, base;
} FLBUTTON;


typedef struct	{
	OPDS	h;
	MYFLT *koutx, *kouty, *ihandle,    *name, *iminx, *imaxx, *iminy, *imaxy;
	MYFLT *iexpx, *iexpy, *idispx, *idispy, *iwidth, *iheight, *ix, *iy;
	MYFLT basex, basey;
} FLJOYSTICK;


typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *istep, *iexp, *itype, *idisp, *iwidth, *iheight, *ix, *iy;
	MYFLT min, base;
	
} FLROLLER;


typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *iexp, *itype, *idisp, *iwidth, *ix, *iy;
	MYFLT min, base;
} FLKNOB;

typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *istep, *itype, *iwidth, *iheight, *ix, *iy;
} FLTEXT;

typedef struct	{
	OPDS	h;
	MYFLT *red1,*green1,*blue1,*red2,*green2,*blue2;
} FLWIDGCOL;

typedef struct	{
	OPDS	h;
	MYFLT *size, *font, *align, *red, *green,*blue;
} FLWIDGLABEL;

typedef struct	{
	OPDS	h;
	MYFLT *ivalue, *ihandle;
} FL_SET_WIDGET_VALUE_I;

typedef struct	{
	OPDS	h;
	MYFLT *ktrig, *kvalue, *ihandle;
} FL_SET_WIDGET_VALUE;


typedef struct	{
	OPDS	h;
	MYFLT *ihandle, *name, *iwidth, *iheight, *ix, *iy;
} FLVALUE;

typedef struct	{
	OPDS	h;
} FLRUN;

typedef struct	{
	OPDS	h;
	MYFLT  *name, *iwidth, *iheight, *ix, *iy, *border;
} FLPANEL;

typedef struct	{
	OPDS	h;
} FLPANELEND;


typedef struct	{
	OPDS	h;
	MYFLT  *iwidth, *iheight, *ix, *iy;
} FLSCROLL;

typedef struct	{
	OPDS	h;
} FLSCROLLEND;

typedef struct	{
	OPDS	h;
	MYFLT  *iwidth, *iheight, *ix, *iy;
} FLTABS;

typedef struct	{
	OPDS	h;
} FLTABSEND;

typedef struct	{
	OPDS	h;
	MYFLT  *name, *iwidth, *iheight, *ix, *iy, *border;
} FLGROUP;

typedef struct	{
	OPDS	h;
} FLGROUPEND;


typedef struct	{
	OPDS	h;
	MYFLT  *iwidth, *iheight, *ix, *iy;
} FLPACK;

typedef struct	{
	OPDS	h;
} FLPACKEND;
