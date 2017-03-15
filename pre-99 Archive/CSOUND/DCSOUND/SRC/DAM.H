#include "cs.h"

#define POWER_BUFSIZE 1000

typedef struct {
   OPDS h ;

   MYFLT *aout ;      /* Declare output array first  */
   MYFLT *ain ;       /* Input array   */
   MYFLT *kthreshold ;/* sound level threshold */
   MYFLT *icomp1 ;    /* Compression factors */
   MYFLT *icomp2 ;
   MYFLT *rtime ;	  /* Raise/Fall times */
   MYFLT *ftime ;

   MYFLT rspeed ;
   MYFLT fspeed ;

   MYFLT gain ;
   MYFLT power ;
   MYFLT powerBuffer[POWER_BUFSIZE] ;
   MYFLT *powerPos ;

} DAM ;

/* void daminit(DAM *p) ; */
/* void dam(DAM *p) ; */

