/****************** hrtferxk.h *******************/

#include "3Dug.h"

typedef struct {
  OPDS 	h;
  MYFLT		*aLeft, *aRight, *aIn, *kAz, *kElev, *ifilno;   /* outputs and inputs */
  MEMFIL	*mfp;      /* file pointer */
  short		*fpbegin;
  int		oldel_index, oldaz_index;
  long		incount, outfront, outend, outcount;
  AUXCH		auxch;      /* will point to allocated memory */
  HRTF_DATUM	hrtf_data, oldhrtf_data;  /* matrix to store HRTF data */
  MYFLT		outl[BUF_LEN], outr[BUF_LEN];
  MYFLT		x[BUF_LEN], yl[BUF_LEN], yr[BUF_LEN];
  MYFLT		bl[FILT_LENm1], br[FILT_LENm1];
  MYFLT		rampup[FILT_LEN], rampdown[FILT_LEN];
} HRTFER;
