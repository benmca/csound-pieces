#include "cs.h"                                 /*      winascii.c           */
#include <stdio.h>                              /*  teletype csound graphs   */
#include "cwindow.h"

#define HOR     80
#define VER     20
#define YOFF    10
#define YOFF4   40

static  char    *points = NULL;

void MakeAscii(WINDAT *wdptr, char *n)
{
    wdptr->windid = -1;                         /* just so it's not null */
    if (points == NULL)
      points = mmalloc((long)((VER+1) * HOR));  /* alloc the 2-Dim array */
}

void KillAscii(WINDAT *wdptr)
{
    wdptr->windid = 0;          /* just to make out that it's dead */
}

void DrawAscii(WINDAT *wdptr)   /* display an n-pnt float array using simple ascii chars */
{
    long     npts    = wdptr->npts;
    MYFLT    absmax  = wdptr->absmax;

    printf(Str(X_75,"%s\t%ld points, scalemax %5.3f\n"), wdptr->caption, npts, absmax);
    if (absmax) {                                /* for non-triv fn: */
        char    *s, *t;
        MYFLT   *fp=wdptr->fdata, *fplim=fp + npts;
        int     n, vscale4, vpos, vmax, vmin, incr;
        MYFLT   scalefactor, max=wdptr->max, min=wdptr->min;

        for (s=points,n=(VER+1)*HOR; n; n--)            /* blank out all pts */
            *s++ = ' ';
        scalefactor = YOFF4 / absmax;                   /*   get normalizing */
        incr = (npts-1)/HOR + 1;                        /*   & sampling facs */
        for (s=points+(YOFF*HOR),n=0; fp<fplim; fp+=incr) {
            *(s+n) = '_';                               /* now write x-axis  */
            vscale4 = (int)(*fp * scalefactor + YOFF4);
            vpos = vscale4 >>2;
            t = points+(vpos*HOR + n++);                /* and sampled pnts  */
            switch (vscale4 - (vpos <<2)) {
            case 0: *t = '_';                           /*  (with 1/4 line  */
                    break;                              /*      resolution) */
            case 1: *t = '.';
                    break;
            case 2: *t = '-';
                    break;
            case 3: *t = '\'';
                    break;
            }                                           /* into dsplay array */
        }
        vmax = (int)(max*YOFF/absmax) + YOFF-1;         /* for all lines     */
        vmin = (int)(min*YOFF/absmax) + YOFF-1;
        if (vmax > VER)         vmax = VER;             /*   from max to     */
        if (vmin < 0)           vmin = 0;
        for (vpos=vmax; vpos>=vmin; vpos--) {           /*   min value:      */
            s = points+(vpos*HOR);
            t = s + HOR - 1;
            while (*t == ' ' && t >= s)                 /*  find last char & */
                t--;
            while (s <= t) {
              int ch = *s++;
              putchar(ch);                              /*  putline to there */
              if (dribble) putc(ch, dribble);
            }
            putchar('\n'); if (dribble) putc('\n', dribble);
            if (!POLL_EVENTS()) exit(1);  /* on Mac/Win, allow system events */
        }
    }
}
