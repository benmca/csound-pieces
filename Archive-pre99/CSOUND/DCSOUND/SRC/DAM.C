#include "cs.h"
#include "dam.h"
#include <math.h>

/*
 *   Dynamic Amplitude Modifier.
 *
 *	 (C) Marc Resibois 1997
 *
 *   I place this source code in the public domain. Just
 *   let me know if you do something you like with it ;-)
 *
 *   For bugs, question, please write to Marc.Resibois@ping.be
 */


/*
 *	Initialisation code
 */

void daminit(DAM *p)
{
int i ;

   /* Initialise gain value */
   
    p->gain=FL(1.0) ;

   /* Compute the gain speed changes from parameter given by Csound */
   /* the computed values are stored in the opcode data structure p */
   /* for later use in the main processing                          */

    p->rspeed=(*p->rtime)/esr*FL(1000.0) ;
    p->fspeed=(*p->ftime)/esr*FL(1000.0) ;

   /* Initialize power value and buffer */

	p->power=*(p->kthreshold) ;
	for (i=0;i<POWER_BUFSIZE;i++) {
		p->powerBuffer[i]=p->power/(MYFLT)POWER_BUFSIZE ;
	}

	p->powerPos=p->powerBuffer ;
}

/*
 * Run-time computation code
 */

void dam(DAM *p)
{
int i;
MYFLT *ain,*aout ;
MYFLT threshold ;
MYFLT gain ;  
MYFLT comp1,comp2;
MYFLT *powerPos;
MYFLT *powerBuffer ;
MYFLT power ;
MYFLT tg ;

	ain=p->ain ;
	aout=p->aout ;
	threshold=*(p->kthreshold) ;
	gain=p->gain ;
	comp1=*(p->icomp1) ;
	comp2=*(p->icomp2) ;
	powerPos=p->powerPos ;
	powerBuffer=p->powerBuffer ;
	power=p->power ;

 /* Process ksmps samples */

   for (i=0;i<ksmps;i++) {

	/* Estimates the current power level */

	 *powerPos=(MYFLT)(fabs(ain[i]))/(MYFLT)(POWER_BUFSIZE*sqrt(2.0)) ;
	 power+=(*powerPos++) ;
	 if ((powerPos-powerBuffer)==POWER_BUFSIZE) {
		 powerPos=p->powerBuffer ;
	 }
	 power-=(*powerPos) ;

	/* Looks where the power is related to the treshold
	   and compute target gain */

	 if (power>threshold) {
         tg=((power-threshold)*comp1+threshold)/power ;
	 } else {
		tg=threshold*(MYFLT)(pow((double)(power/threshold),
					1.0/(double)comp2))/power ;
	 }

	 /* move gain toward target */

	 if (gain<tg) {
		 gain+=p->rspeed ;
	 } else {
		 gain-=p->fspeed ;
	 }

	/* compute output */

	 aout[i]=ain[i]*gain ;
   }

  /* Store the last gain value for next call */

   p->gain=gain ;
   p->power=power ;
   p->powerPos=powerPos ;

}


