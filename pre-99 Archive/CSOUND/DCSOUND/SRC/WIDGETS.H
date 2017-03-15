
typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *iexp, *itype, *idisp, *iwidth, *iheight, *ix, *iy;
	MYFLT min, base, *table;
	long tablen;
} FLSLIDER;



typedef struct	{
	OPDS	h;
	MYFLT *kout, *args[PMAX+1];
} FLKEYB;

typedef struct	{
	OPDS	h;
	MYFLT *kvalue, *ihandle;
} FLBUTTONCALL;


typedef struct	{
	OPDS	h;
	MYFLT *koutx, *kouty, *ihandle1, *ihandle2,    *name, *iminx, *imaxx, *iminy, *imaxy;
	MYFLT *iexpx, *iexpy, *idispx, *idispy, *iwidth, *iheight, *ix, *iy;
	MYFLT basex, basey, *tablex, *tabley;
	long tablenx, tableny;
} FLJOYSTICK;

typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *istep, *iexp, *itype, *idisp, *iwidth, *iheight, *ix, *iy;
	MYFLT min, base, *table;
	long tablen;
	
} FLROLLER;


typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *iexp, *itype, *idisp, *iwidth, *ix, *iy;
	MYFLT min, base, *table;
	long tablen;
} FLKNOB;

typedef struct	{
	OPDS	h;
	MYFLT *kout, *ihandle, *name, *imin, *imax, *istep, *itype, *iwidth, *iheight, *ix, *iy;
} FLTEXT;
/*---------------*/
typedef struct	{
	OPDS	h;
	MYFLT *red1,*green1,*blue1,*red2,*green2,*blue2;
} FLWIDGCOL;

typedef struct	{
	OPDS	h;
	MYFLT *size, *font, *align, *red, *green,*blue;
} FLWIDGLABEL;
      /*----*/
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
	MYFLT *red,*green,*blue, *ihandle;
} FL_SET_COLOR;

typedef struct	{
	OPDS	h;
	MYFLT *ivalue, *ihandle;
} FL_SET_TEXTSIZE;

typedef struct	{
	OPDS	h;
	MYFLT *itype, *ihandle;
} FL_SET_FONT;

typedef struct	{
	OPDS	h;
	MYFLT *itext, *ihandle;
} FL_SET_TEXT;

typedef struct	{
	OPDS	h;
	MYFLT *itype, *ihandle;
} FL_TALIGN;

typedef struct	{
	OPDS	h;
	MYFLT *iwidth, *iheight, *ihandle;
} FL_SET_SIZE;
typedef struct	{
	OPDS	h;
	MYFLT *ix, *iy,  *ihandle;
} FL_SET_POSITION;
typedef struct	{
	OPDS	h;
	MYFLT *ihandle;
} FL_WIDHIDE;
typedef struct	{
	OPDS	h;
	MYFLT *ihandle;
} FL_WIDSHOW;
typedef struct	{
	OPDS	h;
	MYFLT *itype, *ihandle;
} FL_SETBOX;
typedef struct	{
	OPDS	h;
	MYFLT *ihandle, *itext, *itype, *ifont, *isize, *iwidth, *iheight, *ix, *iy;
} FL_BOX;


/*---------------*/
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
	MYFLT  *inum_snap, *inum_val, *index, *ifn;
} FLSETSNAP;

typedef struct	{
	OPDS	h;
	MYFLT  *inum_el, *index;
} FLGETSNAP;

typedef struct	{
	OPDS	h;
	MYFLT *filename;
} FLSAVESNAPS;

typedef struct	{
	OPDS	h;
	MYFLT *filename;
} FLLOADSNAPS;

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

typedef struct	{
	OPDS	h;
	MYFLT	*kout, *ihandle, *name, *ion,    *ioff,   *itype, *iwidth, *iheight, *ix, *iy, *args[PMAX];
} FLBUTTON;

typedef struct	{
	OPDS	h;
	MYFLT	*kout, *ihandle; // outs
	MYFLT	*itype, *inumx, *inumy, *iwidth, *iheight, *ix, *iy, *args[PMAX];
} FLBUTTONBANK;

typedef struct	{
	OPDS	h;
	MYFLT	*kout, *ihandle, *name, *imin, *imax, *istep1, *istep2, *itype, *iwidth, *iheight, *ix, *iy, *args[PMAX];
} FLCOUNTER;

typedef struct {
	OPDS	h;
	MYFLT	*ptime, *val, *idisp;		
	MYFLT	initime, ctime;	
	long	cysofar;
} FLPRINTK;


typedef struct {
	OPDS	h;
	MYFLT 	*val, *idisp;
	MYFLT	oldvalue;
	//int	pspace;
} FLPRINTK2;

