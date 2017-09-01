#include <stdio.h>		/* 				WINFG.C	*/
#include <io.h>
#include <fg.h>			/* Graphs for Flash Graphics for IBM-PC */
#include "cs.h"
#include "cwindow.h"
#include <signal.h>
#include <sound.h>

#define XINIT    fg_displaybox[FG_X1]
#define YINIT    fg_displaybox[FG_Y1]
#define WIDTH    (fg_displaybox[FG_X2]-XINIT)
#define HEIGHT   (fg_displaybox[FG_Y2]-YINIT)
#define XLIMIT   (fg_displaybox[FG_X2])
#define YLIMIT   (fg_displaybox[FG_Y2])

static int first_graph;
static int no_ask;
int winfg_continuous = 0;	/* Whether to stay in graphics mode */
#define fileno(fp) ((fp)->_file)	/* from stdio.h */

void my_term(int xxx)
{
	sound_beep(1331);
	fg_term();
	sound_beep(665);
	exit(1);
}

int Graphable(void) /* called during program initialisation */
{		    /* decides whether to use Flash; initializes Flash if so */
    int t = fg_init_all();
    char *env;
    fg_term();
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
/*    err_printf( "no_ask = %d\n", no_ask); */
    return t;
} 

void MakeGraph(WINDAT *wdptr, char *name) 
	/* called from window.c to open a graphics window */
{
    wdptr->windid = fg_get_type();
    err_printf( Str(X_537,"Window type =%d\n"), wdptr->windid);
} 

void DrawGraph(WINDAT *wdptr)    /* called from window.c to graph an array */
{ 
    float	*fdata = wdptr->fdata;
    long 	npts   = wdptr->npts;
    char	*msg   = wdptr->caption;
    fg_box_t	wbox;
    int 	lsegs,pol;
    int		y_off = 0;
    char	string[100];

    pol  = wdptr->polarity;
    wbox[FG_X1] = XINIT;
    wbox[FG_Y1] = YINIT;
    wbox[FG_X2] = XLIMIT;
    wbox[FG_Y2] = YLIMIT;
    if (first_graph && !no_ask) {
    	err_printf( Str(X_189,"About to draw graph...type ENTER to continue\n"));
	getchar();
	first_graph = 0;
    }
    fg_init();
    fg_drawbox(FG_WHITE,FG_MODE_SET, ~0, FG_LINE_SOLID, wbox, fg.displaybox);

    lsegs = npts;			/* one lineseg per datum */
    {       /* take scale factors out of for-loop for faster run-time */
	float x_scale = WIDTH / (float)(lsegs-1);
	float y_scale = HEIGHT / wdptr->oabsmax; /* unipolar default */
	float  f,ma,mi,*fdptr = fdata;
	int c,i = 0, j = lsegs;
	fg_line_t line;

	line[FG_X2]=0; line[FG_Y2]=0;
	if (pol == (short)BIPOL) {
	    y_off += HEIGHT/2;
	    y_scale /= 2.0;  		/* max data scales to h/2 */
	}
                     /* put x-y pairs into a point list for XDraw */
	while (j--) {
	    line[FG_X1] = line[FG_X2]; line[FG_Y1] = line[FG_Y2];
	    line[FG_X2] = (int)((float)i++ * x_scale);
            f = *fdptr++;
	    line[FG_Y2] = y_off + (int)(f * y_scale);
	    fg_drawlineclip(FG_WHITE,FG_MODE_SET,~0, FG_LINE_SOLID,
	                    line, fg_displaybox);
        }
    }
    /*        if (wdptr->danflag)	/* flag to add dotted divider */
    {
      fg_line_t ll;
      ll[FG_X1] = 1;       ll[FG_Y1] = y_off;
      ll[FG_X2] = WIDTH-1; ll[FG_Y2] = y_off;
      fg_drawlineclip(FG_WHITE, FG_MODE_SET, ~0, FG_LINE_DENSE_DOTTED,
                      ll, fg_displaybox);
    }
    sprintf(string,Str(X_49,"%s  %ld points, max %5.3f"),msg,npts,wdptr->oabsmax);
    fg_puts(FG_WHITE, FG_MODE_SET, ~0, FG_ROT0,
            20, HEIGHT/5, string, fg.displaybox);
    /*	fg_flush(); */
    if (!winfg_continuous || wdptr->waitflg) {
      if (!no_ask) {
        fg_puts(FG_WHITE, FG_MODE_SET, ~0, FG_ROT0, 
                20, HEIGHT/10, Str(X_499,"Type ENTER to continue..."), fg.displaybox);
        getchar();
      }
      else { fg_flush(); sleep(1); }
      fg_term();
    }
}

void KillGraph(WINDAT *wdptr)
{
    	fg_term();
}
    
   
int ExitGraph(void)
{
	fg_term();
	return 0;
}

void MakeXYin(XYINDAT *wdptr, float x, float y)	/* initial proportions */
{
}

void ReadXYin(XYINDAT *wdptr)
{
}


