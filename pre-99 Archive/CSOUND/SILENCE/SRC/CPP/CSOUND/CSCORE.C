#include "cscore.h"                              /*  CSCORE_DEFAULT.C   */

void cscore(void)        /* callable from Csound or standalone cscore  */
                         /* csound -C will run Csound scores as normal */
{
    EVLIST *a;

    while ((a = lget()) != NULL
           && a->nevents > 0) { /* read each sect from score */
      lappstrev(a,"s");         /* re-append the s statement */
      lplay(a);                 /* play this section         */
      lrelev(a);                /* reclaim the space         */
    }
    a = lcreat(0);
    lappstrev(a,"e");
    lplay(a);                   /* end-of-score for summaries */
    lrelev(a);
}
