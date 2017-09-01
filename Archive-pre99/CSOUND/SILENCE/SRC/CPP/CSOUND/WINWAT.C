#include <stdio.h>              /*                      WINWAT.C        */
#include <stdlib.h>
#include <io.h>
#include <graph.h>              /* Graphs for WatCom C++ for IBM-PC */
#include "cs.h"
#define CAPSIZE  60

typedef struct {
        long    windid;                 /* set by MakeGraph() */
        MYFLT   *fdata;                 /* data passed to DrawGraph */
        long    npts;                   /* size of above array */
        char    caption[CAPSIZE];       /* caption string for graph */
        short   waitflg;                /* set =1 to wait for ms after Draw */
        short   polarity;               /* controls positioning of X axis */
        MYFLT   max, min;               /* workspace .. extrema this frame */
        MYFLT   absmax;                 /* workspace .. largest of above */
        MYFLT   oabsmax;                /* Y axis scaling factor */
        int     danflag;                /* set to 1 for extra Yaxis mid span */
} WINDAT;

enum {        /* symbols for WINDAT.polarity field */
        NOPOL,
        NEGPOL,
        POSPOL,
        BIPOL
};

typedef struct {        /* for 'joystick' input window */
        long     windid;        /* xwindow handle */
        int      m_x,m_y;       /* current crosshair pixel adr */
        MYFLT    x,y;           /* current proportions of fsd */
        int      down;
} XYINDAT;

void dispset(WINDAT *, MYFLT *, long, char *, int, char *), display(WINDAT *);
WINDAT *NewWin(char *, int);
void   DoDisp(WINDAT *,MYFLT *,int);

int  Graphable(void);           /* initialise windows.  Returns 1 if X ok */
void MakeGraph(WINDAT *, char *);       /* create wdw for a graph */
void MakeXYin(XYINDAT *, double, double);
                                /* create a mouse input window; init scale */
void DrawGraph(WINDAT *);       /* update graph in existing window */
void ReadXYin(XYINDAT *);       /* fetch latest value from ms input wdw */
void KillGraph(WINDAT *);       /* remove a graph window */
void KillXYin(XYINDAT *);       /* remove a ms input window */
int  ExitGraph(void); /* print click-Exit message in most recently active window */
extern int strcmp(char *, char *);

#include <signal.h>
#include <dos.h>

static int first_graph;
static int no_ask;
int win_continuous = 0;      /* Whether to stay in graphics mode */

int graphactive = 0;

void my_term(int xxx)
{
    IGN(xxx);
    if (graphactive) {
      graphactive = 0;
      _setvideomode(_DEFAULTMODE);
    }
    exit(1);
}

static short gdriver = 0;
static short gwidth = 0, gheight = 0;
static struct videoconfig screen;

#define SOLID_LINE (0xFFFF)
#define DOTTED_LINE (0xCCCC)

int Graphable(void)     /* called during program initialisation */
{
    char *env;

    gdriver = _setvideomode(_MAXRESMODE);
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
    if (gdriver>0) {
      _getvideoconfig(&screen);
/*        _setvideomode(_DEFAULTMODE); */
      return 1;
   }
   else return 0;
}

void MakeGraph(WINDAT *wdptr, char *name)
        /* called from window.c to open a graphics window */
{
    IGN(wdptr); IGN(name);
}

void DrawGraph(WINDAT *wdptr)    /* called from window.c to graph an array */
{
    MYFLT       *fdata = wdptr->fdata;
    long        npts   = wdptr->npts;
    char        *msg   = wdptr->caption;
    int         lsegs,pol;
    short       y_off = 10;
    short       x_off = 10;
    char        string[100];

    pol  = wdptr->polarity;
    if (first_graph && !no_ask) {
        err_printf( Str(X_189,"About to draw graph...type ENTER to continue\n"));
        getchar();
        first_graph = 0;
    }
    _setvideomode(_MAXRESMODE);
    gwidth = screen.numxpixels - 2*x_off;
    gheight = screen.numypixels - 2*y_off;
    graphactive = 1;
    if (screen.monitor != _MONO)
            _setbkcolor(_BLUE);
    else
            _setbkcolor(_BLACK);
    _setcolor(_WHITE);
    _clearscreen(_GCLEARSCREEN);
    _setlinestyle(SOLID_LINE);
    _rectangle(_GBORDER, x_off, y_off, gwidth+x_off, gheight+y_off);


    lsegs = npts;                       /* one lineseg per datum */
    {       /* take scale factors out of for-loop for faster run-time */
      MYFLT x_scale = (MYFLT)gwidth / (MYFLT)(lsegs-1);
      MYFLT y_scale = (MYFLT)gheight / wdptr->oabsmax; /* unipolar default */
      MYFLT  f,*fdptr = fdata;
      int i = 0, j = lsegs;
      if (pol == (short)BIPOL) {
        y_off += gheight/2;
        _setlinestyle(DOTTED_LINE);
        _moveto(x_off+1, y_off);
        _lineto(gwidth+x_off-1, y_off);
        _setlinestyle(SOLID_LINE);
        y_scale /= 2.0;             /* max data scales to h/2 */
      }
      else y_off += gheight;
      _moveto(x_off, y_off);  /* A safe start */
      /* put x-y pairs into a point list for XDraw */
      while (j--) {
        f = *fdptr++;
        _lineto(x_off+(int)((MYFLT)i++ * x_scale),
                y_off - (int)(f * y_scale));
      }
      sprintf(string,Str(X_49,"%s  %ld points, max %5.3f"),msg,npts,wdptr->oabsmax);
      _settextposition(screen.numtextrows-8, 5); _outtext(string);
      /*      if (wdptr->waitflg)*/ {
        _settextposition(screen.numtextrows-4, 5);
        _outtext(Str(X_499,"Type ENTER to continue..."));
        getchar();
      }
      graphactive = 0;
      _setvideomode(_DEFAULTMODE);
    }
}

void KillGraph(WINDAT *wdptr)
{
    IGN(wdptr);
    if (graphactive) {
        graphactive = 0;
        _setvideomode(_DEFAULTMODE);
    }
}


int ExitGraph(void)
{
    if (graphactive) {
        graphactive = 0;
        _setvideomode(_DEFAULTMODE);
    }
    return 0;
}

void MakeXYin(XYINDAT *wdptr, double x, double y)
{
    IGN(wdptr); IGN(x); IGN(y);
    return;
}

void ReadXYin(XYINDAT *wdptr)
{
    IGN(wdptr);
    return;
}


