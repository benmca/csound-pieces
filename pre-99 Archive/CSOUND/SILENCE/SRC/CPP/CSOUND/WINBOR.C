#include <stdio.h>		/* 				WINFG.C	*/
#include <stdlib.h>
#include <io.h>
#include <graphics.h>		/* Graphs for Borlands C++ for IBM-PC */
/*#include "cwindow.h"*/
#define CAPSIZE  60

typedef struct {
	long	windid;			/* set by MakeGraph() */
	float   *fdata;			/* data passed to DrawGraph */
	long    npts;			/* size of above array */
	char    caption[CAPSIZE];	/* caption string for graph */
	short   waitflg;		/* set =1 to wait for ms after Draw */
	short	polarity;		/* controls positioning of X axis */
	float   max, min;		/* workspace .. extrema this frame */
	float	absmax;			/* workspace .. largest of above */
	float   oabsmax;		/* Y axis scaling factor */
	int	danflag;		/* set to 1 for extra Yaxis mid span */
} WINDAT;

enum {        /* symbols for WINDAT.polarity field */
        NOPOL,
	NEGPOL,
	POSPOL,
	BIPOL
};

typedef struct {	/* for 'joystick' input window */
        long     windid;	/* xwindow handle */
	int	 m_x,m_y;	/* current crosshair pixel adr */
	float	 x,y;		/* current proportions of fsd */
	int	 down;
} XYINDAT;

void dispset(WINDAT *, float *, long, char *, int, char *), display(WINDAT *);
WINDAT *NewWin(char *, int);
void   DoDisp(WINDAT *,float *,int);

int  Graphable(void);		/* initialise windows.  Returns 1 if X ok */
void MakeGraph(WINDAT *, char *);	/* create wdw for a graph */
void MakeXYin(XYINDAT *, double, double);
                                /* create a mouse input window; init scale */
void DrawGraph(WINDAT *);	/* update graph in existing window */
void ReadXYin(XYINDAT *);	/* fetch latest value from ms input wdw */
void KillGraph(WINDAT *);	/* remove a graph window */
void KillXYin(XYINDAT *);	/* remove a ms input window */
int  ExitGraph(void); /* print click-Exit message in most recently active window */
extern int strcmp(char *, char *);

#include <signal.h>
#include <dos.h>

static int first_graph;
static int no_ask;
int winbor_continuous = 0;	/* Whether to stay in graphics mode */

int graphactive = 0;

void my_term(int xxx)
{
	if (graphactive) {
		closegraph();
	}	
	exit(1);
}

static int gdriver = 0, gmode = 0;
static int gwidth =0, gheight = 0;

int Graphable(void)	/* called during program initialisation */
{
    char *env;
    
    detectgraph(&gdriver, &gmode);
    if (signal(SIGABRT,my_term) == SIG_ERR ||
	signal(SIGTERM,my_term) == SIG_ERR ||
	signal(SIGFPE, my_term) == SIG_ERR ||
	signal(SIGILL, my_term) == SIG_ERR ||
	signal(SIGSEGV,my_term) == SIG_ERR ||
        signal(SIGINT, my_term) == SIG_ERR) {
        	perror(Str(X_275,"Failed to set signal"));
        	abort();
        }
    first_graph = 1;
    env = getenv("CSNOSTOP");
    if (env==NULL) no_ask = 0;
    else if (strcmp(env,"yes")==0 && isatty(fileno(stdin))) no_ask=1;
    else no_ask=0;
    if (gdriver>=0) {
	   return 1;
   }
   else return 0;
} 

void MakeGraph(WINDAT *wdptr, char *name) 
	/* called from window.c to open a graphics window */
{
}

void DrawGraph(WINDAT *wdptr)    /* called from window.c to graph an array */
{ 
    float	*fdata = wdptr->fdata;
    long 	npts   = wdptr->npts;
    char	*msg   = wdptr->caption;
    int 	lsegs,pol;
    int		y_off = 10;
    int		x_off = 10;
    char	string[100];

    pol  = wdptr->polarity;
    if (first_graph && !no_ask) {
    	err_printf( Str(X_189,"About to draw graph...type ENTER to continue\n"));
	getchar();
	first_graph = 0;
    }
    initgraph(&gdriver, &gmode, "\\bc4\\bgi");
    gwidth = getmaxx() - 2*x_off;
    gheight = getmaxy() - 2*y_off;
    graphactive = 1;
    if (getmaxcolor>1)
	    setbkcolor(BLUE);
    else
	    setbkcolor(BLACK);
    setcolor(WHITE);
    cleardevice();
    setlinestyle(SOLID_LINE, 0, NORM_WIDTH);
    rectangle(x_off, y_off, gwidth+x_off, gheight+y_off);


    lsegs = npts;			/* one lineseg per datum */
    {       /* take scale factors out of for-loop for faster run-time */
	float x_scale = (float)gwidth / (float)(lsegs-1);
	float y_scale = (float)gheight / wdptr->oabsmax; /* unipolar default */
	float  f,ma,mi,*fdptr = fdata;
	int c,i = 0, j = lsegs;
	if (pol == (short)BIPOL) {
	    y_off += gheight/2;
	    setlinestyle(DOTTED_LINE, 0, NORM_WIDTH);
	    line(x_off+1, y_off, gwidth+x_off-1, y_off);
	    setlinestyle(SOLID_LINE, 0, NORM_WIDTH);
	    y_scale /= 2.0;  		/* max data scales to h/2 */
	}
	else y_off += gheight;
	moveto(x_off, y_off);	/* A safe start */
                     /* put x-y pairs into a point list for XDraw */
	while (j--) {
          int nx, ny;
          f = *fdptr++;
          lineto(x_off+(int)((float)i++ * x_scale),
                 y_off - (int)(f * y_scale));
	}	
	sprintf(string,Str(X_49,"%s  %ld points, max %5.3f"),msg,npts,wdptr->oabsmax);
	outtextxy(20, 4*gheight/5, string);
/*	if (wdptr->waitflg)*/ {
	    outtextxy(20, 9*gheight/10, Str(X_499,"Type ENTER to continue..."));
	    getchar();
	  }
	  graphactive = 0;
	  closegraph();
	}
}

void KillGraph(WINDAT *wdptr)
{
	  graphactive = 0;
    	closegraph();
}
    
   
int ExitGraph(void)
{
	  graphactive = 0;
	closegraph();
	return 0;
}

void MakeXYin(XYINDAT *wdptr, double x, double y)
{
	return;
}

void ReadXYin(XYINDAT *wdptr)
{
	return;
}


