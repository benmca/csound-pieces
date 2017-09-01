/*  				grainv4.c               */
/*    ASC.Lee@ee.qub.ac.uk                              */
/*Copyright 1994, 1995 by the Allan S C Lee, Queen's        */
/*University of Belfast. All rights reserved.               */
/*                                                          */
/*Permission to use, copy, or modify this software and      */
/*documentation for educational and research purposes only  */
/*and without fee is hereby granted, provided that this     */
/*copyright and permission notice appear on all copies and  */
/*supporting documentation.  For any other uses of this     */
/*software, in original or modified form, including but not */
/*limited to distribution in whole or in part, specific     */
/*prior permission from Allan S C Lee must be obtained.     */
/*Allan S C Lee and Queen's University of Belfast make      */
/*no representations about the suitability of this software */
/*for any purpose. It is provided "as is" without express   */
/*or implied warranty.                                      */
/*                                                          */
/*                                                      */
/* Verson 4.0 -    Mar 95                               */
/* Verson 4.1 - 10 Mar 95                               */
/*        Lifted restriction on pitch, now accept       */
/*        anything greater than zero                    */ 
/*        Improved code in handling the warp-round      */
/*        pointer.                                      */
/* Verson 4.2 - 20 Apr 95                               */      
/*        Add optional parameter ifnenv                 */ 
/*        Function table to be used for the shape of the*/
/*        envelop rise and decade curve                 */
/* Minor changes by John Fitch Dec 1995                 */

#include "cs.h"
#include "grain4.h"
#include <math.h>

#define        RNDMUL  15625L

#define		DEBUG	(0)

MYFLT grand(GRAINV4 *);
MYFLT envv4(int *, GRAINV4 *);

void grainsetv4(GRAINV4 *p)
{
    FUNC	*ftp, *ftp_env;
    int		nvoice, cnt;
    long	tmplong1, tmplong2;
    MYFLT	tmpfloat1;
    MYFLT	pitch[4];

    /* call ftfind() to get the function table...*/
    if ((ftp = ftfind(p->ifn)) != NULL) {
      if (DEBUG) printf("granule_set: Find ftable OK...\n");
      p->ftp = ftp;
    }
    else {
      initerror(Str(X_805,"granule_set: Unable to find function table"));
      return;
    } 

    /* call ftfind() to get the function table for the envelop...*/
    if (DEBUG) printf ("*p->ifnenv is %f \n", *p->ifnenv);

    if (*p->ifnenv > 0) {
      if ((ftp_env = ftfind(p->ifnenv)) != NULL) {
        if (DEBUG) printf("granule_set: Find ftable for envelop OK...\n");
        p->ftp_env = ftp_env;
      }
      else {
        initerror(Str(X_804,"granule_set: Unable to find function table for envelop"));
        return;
      }
    }

    if (*p->ivoice > MAXVOICE) {
      initerror(Str(X_803,"granule_set: Too many voices"));
      return;
    }
    if (*p->iratio <= 0) {
      initerror(Str(X_816,"granule_set: iratio must be greater then 0"));
      return;
    }
    if ((*p->imode != 0) && ((*p->imode != -1) && (*p->imode != 1))) {
      initerror(Str(X_810,"granule_set: imode must be -1, 0 or +1"));
      return;
    }
    if (*p->ithd < 0) {
      initerror(Str(X_800,"granule_set: Illegal ithd, must be greater then 0"));
      return;
    }
    if ((*p->ipshift != 1) && (*p->ipshift!=2) && (*p->ipshift!=3) &&
	(*p->ipshift!=4) && (*p->ipshift!=0) ) {
      initerror(Str(X_815,"granule_set: ipshift must be integer between 0 and 4"));
      return;
    }
    if (((*p->ipshift >=1) && (*p->ipshift <=4)) &&
	(*p->ivoice < *p->ipshift) ){
      initerror(Str(X_802,"granule_set: Not enough voices for the number of pitches"));
      return;
    }
    if ( *p->ipshift !=FL(0.0) ) {
      if (*p->ipitch1 < FL(0.0) ) {
        initerror(Str(X_811,"granule_set: ipitch1 must be greater then zero"));
        return;
      }
      if (*p->ipitch2 < FL(0.0) ) {
        initerror(Str(X_812,"granule_set: ipitch2 must be greater then zero"));
        return;
      }
      if (*p->ipitch3 < FL(0.0) ) {
        initerror(Str(X_813,"granule_set: ipitch3 must be greater then zero"));
        return;
      }
      if (*p->ipitch4 < FL(0.0) ) {
        initerror(Str(X_814,"granule_set: ipitch4 must be greater then zero"));
        return;
      }
    }

    if ((*p->igskip < 0) || (*p->igskip * esr > ftp->flen) ) {
      initerror(Str(X_819,"granule_set: must be positive and smaller than"
		"function table length"));
      return;
    } 
    if (*p->igskip_os < 0) {
      initerror(Str(X_809,"granule_set: igskip_os must be greater then 0"));
      return;
    }

    p->gstart = (long)(*p->igskip * esr);
    p->glength = (long)(*p->ilength * esr);
    p->gend = p->gstart + p->glength;

    if (*p->kgap < 0) {
      initerror(Str(X_817,"granule_set: kgap must be greater then 0"));
      return;
    }
    if ((*p->igap_os < 0) || (*p->igap_os > 100)) {
      initerror(Str(X_807,"granule_set: igap_os must be 0%% to 100%%"));
      return;
    }
    if (*p->kgsize < 0) {
      initerror(Str(X_818,"granule_set: kgsize must be greater then 0"));
      return;
    }
    if ((*p->igsize_os < 0) || (*p->igsize_os >100)) {
      initerror(Str(X_808,"granule_set: igsize_os must be 0%% to 100%%"));
      return;
    }
    if ((*p->iatt < FL(0.0)) || (*p->idec < 0.0) ||
	((*p->iatt + *p->idec) > FL(100.0))) {
      initerror(Str(X_801,"granule_set: Illegal value of iatt and/or idec"));
      return;
    } /* end if */


    /* Initialize random number generator */
    if (*p->iseed >=0)
      p->grnd = (short)(*p->iseed * FL(32768.0));

				/* Initialize variables....*/
    p->gskip_os = (long)(*p->igskip_os * esr);/* in number of samples */
    p->gap_os = *p->igap_os / FL(100.0);
    p->gsize_os = *p->igsize_os / FL(100.0);

    for (nvoice = 0; nvoice < *p->ivoice; nvoice++) {
      p->fpnt[nvoice] = 0;
      p->cnt[nvoice]  = 0;
      p->phs[nvoice]  = FL(0.0);
      p->gskip[nvoice] = (long)(*p->igskip * esr);
      p->gap[nvoice] = (long)(*p->kgap * esr);
    }

    if (*p->igap_os != 0) {
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++) 
	p->gap[nvoice] += (long)((MYFLT)p->gap[nvoice] * p->gap_os * grand(p));
    }

    if (*p->imode == 0) {
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++)
	p->mode[nvoice] = (grand(p) < 0) ? -1 : 1;
    }
    else {
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++)
	p->mode[nvoice] = (long)*p->imode;
    }

    if ((*p->ipshift >=1) && (*p->ipshift <=4)) {
      pitch[0] = *p->ipitch1;
      pitch[1] = *p->ipitch2;
      pitch[2] = *p->ipitch3;
      pitch[3] = *p->ipitch4;
      cnt = 0;
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++) {
	p->pshift[nvoice] = pitch[cnt++];
	cnt = (cnt < *p->ipshift) ? cnt : 0;
      }
    }
    if (*p->ipshift == 0) {
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++) {
	tmpfloat1 = grand(p);
	p->pshift[nvoice] =
	  (tmpfloat1 <FL(0.0)) ? (tmpfloat1*FL(0.5))+FL(1.0) : tmpfloat1+1.0f;
      }
    }

    for (nvoice = 0; nvoice < *p->ivoice; nvoice++)
      p->gsize[nvoice] = (long)(*p->kgsize * esr * p->pshift[nvoice]);

    if (*p->igsize_os != 0) {
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++)
        p->gsize[nvoice] += (long)(p->gsize[nvoice] * p->gsize_os * grand(p));
    }

    for (nvoice = 0; nvoice < *p->ivoice; nvoice++)
      p->stretch[nvoice] = p->gsize[nvoice] + p->gap[nvoice];

    if (*p->igskip_os != 0) 
      for (nvoice = 0; nvoice < *p->ivoice; nvoice++) {
	tmplong1 = (long)((p->gskip_os * grand(p)) + (MYFLT)p->gskip[nvoice]);
	p->gskip[nvoice] = (tmplong1 < p->gstart) ? p->gstart : tmplong1;
	p->gskip[nvoice]=
          ((p->gskip[nvoice]+p->stretch[nvoice])>p->gend) ?
	  p->gstart :
	  p->gskip[nvoice];
      }


    if (DEBUG)
      printf("granule_set: User define sampling rate esr is %f samp/sec.\n",
	     esr);
    if (DEBUG)
      printf("granule_set: Funtion table length in samples is %d\n", ftp->flen);
    if (DEBUG)
      printf("granule_set: Funtion table length in seconds is %f\n",
	     (MYFLT)ftp->flen / esr);

    if (*p->ithd != 0) {	/* Do thresholding.... */
      if (DEBUG) printf("granule_set: Doing thresholding %f \n",*p->ithd);
      tmplong2 = 0;
      for (tmplong1=0; tmplong1<ftp->flen; tmplong1++)
	if (fabs(*(ftp->ftable + tmplong1)) >= *p->ithd )
	  *(ftp->ftable + tmplong2++) = *(ftp->ftable + tmplong1);
      ftp->flen = tmplong2;
      if (DEBUG)
	printf("granule_set: Function table shrink to %d samples\n",ftp->flen);
      if (DEBUG)
	printf("granule_set: Function table shrink to %f sec"
	       "after thresholding\n", (MYFLT)ftp->flen / esr);
    }

    if (p->gend > ftp->flen) {
      initerror(Str(X_799,"granule_set: Illegal combination of igskip and ilength"));
      return;
    }
 

    nvoice = (int)*p->ivoice;
    if (DEBUG) printf("granule_set: nvoice is %d\n",nvoice);

    if (*p->ilength < (20 * *p->kgsize)) {
      printf(Str(X_806,"granule_set: WARNING * ilength may be too short * \n"));
      printf(Str(X_1,"            ilength should be greater than kgsize * max up\n"));
      printf(Str(X_2,"            pitch shift. Also, igsize_os and igskip_os should\n"));
      printf(Str(X_1416,"            be taken into consideration.\nilength is "));
      printf(Str(X_43,"%f Sec, kgsize is %f Sec\n"), *p->ilength, *p->kgsize);
    }
   
    p->clock = 0;		/* init clock */

} /* end grainsetv4(p) */




void graingenv4(GRAINV4 *p)
{
    FUNC	*ftp, *ftp_env;
    MYFLT	*ar, *ftbl, *ftbl_env;
    int		nsmps = ksmps;
    int		nvoice;
    long	flen, tmplong1, tmplong2, tmplong3, tmpfpnt, flen_env;
    MYFLT	fract, v1, tmpfloat1;
    long	att_len, dec_len, att_sus;
    MYFLT	envlop;

    /* Optimisations */
    long        gstart  = p->gstart;
    long        gend    = p->gend;
    long        glength = p->glength;
    MYFLT       iratio  = *p->iratio;


 /* Recover parameters from previous call.... */
   ftp = p->ftp;
   if (p->ftp==NULL) {          /* RWD fix */
     initerror(Str(X_797,"grain4: not initialized"));
     return;
   }
   flen = ftp->flen;
   ftbl = ftp->ftable;

   if (*p->ifnenv > 0) {
     ftp_env = p->ftp_env;
     flen_env = ftp_env->flen;
     ftbl_env = ftp_env->ftable;
   }

   /* Recover audio output pointer... */
   ar   = p->ar;


   /* *** Start the loop .... *** */
   do {				/* while (--nsmps) */
                                /* Optimisations */
     long       *fpnt = p->fpnt, *cnt = p->cnt, *gskip = p->gskip;
     long       *gap = p->gap, *gsize = p->gsize;
     long       *stretch = p->stretch, *mode = p->mode;
     MYFLT      *pshift = p->pshift, *phs = p->phs;
     *ar = FL(0.0);

     for (nvoice = 0; nvoice < *p->ivoice; nvoice++) {

       if (*fpnt >= (*gsize -1)) {
	 *ar += 0;
         *cnt +=1L;
       }
       else {
         fract = *phs - *fpnt;

         if (*mode < 0) {
           tmplong1 = *gskip - gstart;
           if (*fpnt >= tmplong1) {
             tmplong1= *fpnt - tmplong1;
             tmplong2= tmplong1/glength;
             tmplong1 -= tmplong2 * glength;
             tmpfpnt = gend - tmplong1;
	   }
	   else
             tmpfpnt = *gskip - *fpnt;
	 }
	 else {
           tmplong1 = gend - *gskip;
           if (*fpnt >= tmplong1) {
             tmplong1= *fpnt - tmplong1;
             tmplong2= tmplong1/glength;
             tmplong1 -= tmplong2 * glength;
             tmpfpnt = gstart + tmplong1;
	   }
	   else
             tmpfpnt = *gskip + *fpnt;
	 }

         att_len = (long)(*gsize * *p->iatt * FL(0.01));
         dec_len = (long)(*gsize * *p->idec * FL(0.01));
         att_sus =  *gsize -  dec_len;
	 
         if (*fpnt < att_sus) {
           tmpfloat1 = (FL(1.0) * *fpnt) / att_len;
	   envlop = ((tmpfloat1 >=FL(1.0)) ? FL(1.0) : tmpfloat1);
	 }
	 else 
	   envlop =
             ((MYFLT)(dec_len - (MYFLT)(*fpnt - att_sus)))/((MYFLT)dec_len);

	 v1 = *(ftbl + tmpfpnt);
	 
         tmpfpnt = tmpfpnt + *mode;
         if (tmpfpnt < gstart)
           tmpfpnt = gend - (gstart - tmpfpnt) + 1;
         if (tmpfpnt > gend)
           tmpfpnt = gstart + (tmpfpnt - gend) - 1;
	 
	 if (*p->ifnenv > 0) {
	   tmplong3 = (long)(envlop * flen_env) -1L;
	   envlop = *(ftbl_env + tmplong3);
	 }

	 *ar +=(v1 + ( *(ftbl + tmpfpnt)   - v1) * fract ) * envlop ;
	 
         *phs += *pshift;
         *fpnt = (long)*phs;
         *cnt  = (long)*phs;
       } /* end if (*fpnt >= (*gsize -1)) */

       if (*cnt >= *stretch) {
         *cnt = 0;
         *fpnt= 0;
         *phs = FL(0.0);
	 
				/* pick up new values... */

				/* Use the old value of the pshift, gsize and gap */
				/*           to determine the time advanced */
         /*           *gskip+=
                      ((*gsize / *pshift) + 
                      *gap) * iratio;
		      */
         *gskip +=
           (long)((*gsize / *pshift) * iratio);

	 if (*p->igskip_os != 0) 
           *gskip  += (long)(p->gskip_os * grand(p));
	 
         if (*gskip >= gend) {
           tmplong1 = *gskip - gend;
           tmplong2 = tmplong1 /glength;
           tmplong1 -= tmplong2 * glength;
           *gskip = gstart + tmplong1;
	 }

         if (*gskip < gstart) *gskip = gstart;

	 if (*p->imode == 0)
           *mode = (grand(p) < 0) ? -1 : 1;
	   
           if (*p->ipshift == 0) {
	     tmpfloat1 = grand(p);
             *pshift = (tmpfloat1 < FL(0.0)) ?
	       (tmpfloat1*FL(0.5))+FL(1.0) : tmpfloat1+FL(1.0);
           }

           *gap = (long)(*p->kgap * esr);
           if (*p->igap_os != 0) {
             *gap += (long)((*gap * p->gap_os) * grand(p));
           } 

           *gsize = (long)(*p->kgsize * esr * *pshift);
           if (*p->igsize_os != 0)
             *gsize += (long)((*gsize * p->gsize_os) * grand(p));

             *stretch = *gsize + *gap;

         } 
       fpnt++; cnt++; gskip++; gap++; gsize++;
       stretch++; mode++; pshift++; phs++;
     }

				/*   p->clock++; */
     *ar++ *= *p->xamp;		/* increment audio pointer and multiply the xamp */

   } while (--nsmps);
} /* end graingenv4(p) */


/* Function takes in fpnt pointing to a relative
    position of gsize,
    returns a float between 0.0 to 1.0
*/
#ifdef never
MYFLT envv4(int *nvoice, GRAINV4 *p)
{
    long     att_len, dec_len, att_sus;
    MYFLT    tmp, result;
 
    att_len = (p->gsize[*nvoice] * *p->iatt) * FL(0.01);
    dec_len = (p->gsize[*nvoice] * *p->idec) * FL(0.01);
    att_sus =  p->gsize[*nvoice] -  dec_len;
 
    if (p->fpnt[*nvoice] < att_sus) {
      tmp = ((MYFLT) p->fpnt[*nvoice]) / (MYFLT)att_len;
      result = (tmp >=FL(1.0)) ? FL(1.0) : tmp;
    }
    else 
      result = ((MYFLT)(dec_len - (p->fpnt[*nvoice]-att_sus)) / (MYFLT)dec_len);
 
printf("envv4: %f\n", result);
    return (result);
}
#endif


/* Function return a float random number between -1 to +1 */
MYFLT grand( GRAINV4 *p)
{
   p->grnd *= (int)RNDMUL;
   p->grnd += 1;
   return ( (MYFLT)p->grnd * dv32768 );
} /* end grand(p) */
