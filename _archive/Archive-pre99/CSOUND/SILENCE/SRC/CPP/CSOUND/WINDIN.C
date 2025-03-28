#include "cs.h"                 /*                           WINDIN.C   */
#include "cwindow.h"
#include "windin.h"             /* real-time input control units        */
                                /* 26aug90 dpwe                         */

extern void (*mkxyFn)(XYINDAT*,MYFLT,MYFLT);/* pointer to xyinput window creator */
extern void (*rdxyFn)(XYINDAT*);            /* pointer to xyinput window creator */

void xyinset(XYIN *p)
{
    MYFLT       f;
    MYFLT       iymax = *p->iymax;
    MYFLT       iymin = *p->iymin;
    MYFLT       ixmax = *p->ixmax;
    MYFLT       ixmin = *p->ixmin;
    MYFLT       iyinit = *p->iyinit;
    MYFLT       ixinit = *p->ixinit;

    if ((p->timcount = (int)(ekr * *p->iprd)) <= 0)
      initerror(Str(X_863,"illegal iprd"));
    if (iymin > iymax) {                /* swap if wrong order */
      f = iymin; iymin = iymax; iymax = f;
    }
    if (iymin == iymax) { /* force some room (why?) */
      iymax = iymin + FL(1.0);          /* say.. */
      iymin -= FL(1.0);
    }
    if (iyinit < iymin)                 iyinit = iymin;
    else if (iyinit > iymax)    iyinit = iymax;

    if (ixmin > ixmax) {        /* swap if wrong order */
      f = ixmin; ixmin = ixmax; ixmax = f;
    }
    if (ixmin == ixmax) {       /* force some room (why?) */
      ixmax = ixmin + FL(1.0);          /* say.. */
      ixmin -= FL(1.0);
    }
    if (ixinit < ixmin)                 ixinit = ixmin;
    else if (ixinit > ixmax)    ixinit = ixmax;

    (*mkxyFn)(&p->w,(ixinit - ixmin)/(ixmax - ixmin),
                   (iyinit - iymin)/(iymax - iymin) );

    p->countdown = 1;           /* init counter to run xyin on first call */
}

#ifndef mills_macintosh
void xyin(XYIN *p)
{
    if (!(--p->countdown)) {                  /* at each countdown   */
      p->countdown = p->timcount;             /*   reset counter &   */
      (*rdxyFn)(&p->w);                       /*   read cursor postn */
      *(p->kxrslt) = *p->ixmin + p->w.x * (*p->ixmax - *p->ixmin);
      *(p->kyrslt) = *p->iymin + (FL(1.0) - p->w.y) * (*p->iymax - *p->iymin);
      /*  printf("x: %5.2f   y:%5.2f \n", *p->kxrslt, *p->kyrslt); */
    }
}
#else
void xyin(XYIN *p)
{
    int inside = 0;
    CursHandle cursor;

    if (!(--p->countdown)) {                  /* at each countdown   */
      p->countdown = p->timcount;             /*   reset counter &   */
      (*rdxyFn)(&p->w);                       /*   read cursor postn */
/*      *(p->kxrslt) = *p->ixmin + p->w.x * (*p->ixmax - *p->ixmin); */
/*      *(p->kyrslt) = *p->iymin + (1.0 - p->w.y) * (*p->iymax - *p->iymin); */
      if (p->w.x >= *p->ixmin && p->w.x <= *p->ixmax)   inside++;
      if (p->w.y >= *p->iymin && p->w.y <= *p->iymax) inside++;
      if (inside == 2) {
        *(p->kxrslt) = p->w.x;               /* Mike 11/2/96 for Mac */
        *(p->kyrslt) = p->w.y;               /* /Mike 11/2/96 for Mac */
        cursor = GetCursor(128);
        SetCursor(*cursor);
      } else {
        SetCursor(&(qd.arrow));
      }
      /*  printf("x: %5.2f   y:%5.2f \n", *p->kxrslt, *p->kyrslt); */
    }
}
#endif
