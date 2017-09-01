/******************************************/
/* The applications in this file were     */
/* designed and coded by Richard Karpen   */
/* University of Washington, Seattle 1998 */
/******************************************/

/*    PVOCEXT.C        */

#include "cs.h"
#include "pvocext.h"
#include <math.h>

#define minval(val1, val2) (val1 <= val2 ? val1 : val2)

/* Spectral Extraction.  Based on ideas from Tom Erbe's SoundHack  */

void SpectralExtract(
    MYFLT   *inp,	/* pointer to input data */
    MYFLT   *pvcopy,
    long    fsize,	/* frame size we're working with */
    long    MaxFrame,
    int	    mode,
    MYFLT   freqlim
    )
{
    long    i, j, k;
    MYFLT   *frm0, *frm1;
    long    ampindex, freqindex, ampfrmjump;
    MYFLT   freqTemp, freqframes[10], freqdiff=FL(0.0), ampscale;
    long	    framecurb;

    frm0 = inp;
    frm1 = pvcopy;
    for(i=0; i<(fsize+2L)*MaxFrame; i++)
	*frm1++ = *frm0++;
    frm1 = pvcopy;
    ampfrmjump = (fsize+2L) / 2L;
    for (j=0; j<(fsize/2L + 1L); j++) {	
    	ampindex = 2L * j;
	freqindex = ampindex + 1L;
	for (i=0; i<MaxFrame; i++) {
	    framecurb = minval(6, MaxFrame-i);
	    freqdiff=FL(0.0);
	/* get frequencies from 6 or less consecutive frames */
	    for (k=0; k<=framecurb; k++)
	 	freqframes[k] = *(frm1 + freqindex + ((fsize+2L)*k) +
							((fsize+2L)*i)); 

	/* average the deviation over framecurb interframe periods */
	    for (k=0; k<framecurb; k++) {
		freqTemp = (MYFLT)fabs(freqframes[k] - freqframes[k+1L]);
		freqdiff += freqTemp * (FL(1.0)/(MYFLT)framecurb);
		}

	    if (mode==1) { /* lets through just the "noisy" parts */ 
	    	if (freqdiff > freqlim && freqdiff < freqlim * 2){ 
	   	    ampscale = (freqdiff - freqlim) / freqlim;
		    frm1[ampindex+((fsize+2L)*i)] *= ampscale;
		    }
		else if (freqdiff <= freqlim)
	  	    frm1[ampindex+((fsize+2L)*i)] = FL(0.0);
	    	}

	    else if (mode==2) { /* lets through just the stable-pitched parts */
	    	if (freqdiff < freqlim) {
	    	    ampscale = (freqlim - freqdiff) / freqlim;
		    frm1[ampindex+((fsize+2L)*i)] *= ampscale;
		    }
	    	else
		    frm1[ampindex+((fsize+2L)*i)] = FL(0.0);
	    	}
 	 }
    }
}

MYFLT PvocMaxAmp(
    MYFLT   *inp,	/* pointer to input data */
    long    fsize,	/* frame size we're working with */
    long	MaxFrame    
    )
{
    long    j, k;
    MYFLT   *frm0, *frmx;
    long    ampindex;
    MYFLT	MaxAmpInData = FL(0.0);
    
    frm0 = inp;
	
/* find max amp in the whole pvoc file */
   for (j=0; j<(fsize/2L + 1L); ++j) {	
 	ampindex = 2L * j;
	for (k=0; k<=MaxFrame; k++) {
	    frmx = frm0 + ((fsize+2L)*k);
	    MaxAmpInData = (frmx[ampindex] > MaxAmpInData ? frmx[ampindex] : MaxAmpInData);
	}
   }
	return(MaxAmpInData);
}


/*********************************************************************/
/* Different from Tom Erbe's Amplitude Gating. This one maps         */
/* the normalized amplitude values from the analysis bins onto       */
/* a user defined function. The amplitude values which are           */
/* normalized to be between 0 and 1 are used as indeces into         */
/* the table where and amplitude of 0 points at the beginning        */
/* of the table and an amplitude of 1 points to the end of the table */
/*********************************************************************/

void PvAmpGate(
    MYFLT   *buf,	/* where to get our mag/pha pairs */
    long    fsize,	/* frame size we're working with */
    FUNC    *ampfunc,
    MYFLT    MaxAmpInData
    )
{
    long    j;
    long    ampindex, funclen, mapPoint;
    
    funclen = ampfunc->flen;
			
    for (j=0; j<(fsize/2L + 1L); ++j) {
	 ampindex = 2L * j;
         /* use normalized amp as index into table for amp scaling */
	 mapPoint = (long)((buf[ampindex] / MaxAmpInData) * funclen);
	 buf[ampindex] *= *(ampfunc->ftable + mapPoint);
	 }
} 

