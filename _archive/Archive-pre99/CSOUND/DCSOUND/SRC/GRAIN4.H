/* include file for grainv4.c		grainv4.h */
/*     ASC.Lee@ee.qub.ac.uk                       */
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
/* */

#define MAXVOICE 128

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *ivoice, *iratio;
	MYFLT   *imode, *ithd, *ifn, *ipshift;
        MYFLT   *igskip;
	MYFLT	*igskip_os;
	MYFLT	*ilength, *kgap, *igap_os, *kgsize, *igsize_os, *iatt, *idec;
	MYFLT	*iseed, *ipitch1, *ipitch2, *ipitch3, *ipitch4, *ifnenv;
	long	fpnt[MAXVOICE], cnt[MAXVOICE], gskip[MAXVOICE], gap[MAXVOICE];
	long	gsize[MAXVOICE], stretch[MAXVOICE], mode[MAXVOICE];
        MYFLT	pshift[MAXVOICE], phs[MAXVOICE];
	short	grnd;
	long	clock, gskip_os,gstart, gend, glength;
	MYFLT	gap_os, gsize_os;
	FUNC	*ftp, *ftp_env;
} GRAINV4;

/*
ar - audio results
xamp - amplitude
ivoice - number of voices
iratio - ratio of the speed of the gskip pointer relative to audio sample rate.
   0.5 will be half speed.
imode - +1 grain pointer move forward (same direction of the gskip pointer),
   -1 backward (oppose direction fo the gskip pointer) or 0 for random
ithd - threshold, if the sample signal is smaller then ithd, it will be skiped
ifn - function table number
ipshift - pitch shift control. If ipshift set to 0, pitch will be set randomly
   up and dow an octave. If ipshift set to 1, 2, 3 or 4, up to four different
   pitches can be set amount all the voices set in ivoice, optional parmaters
   ipitch1, ipitch2, ipitch3 and ipitch4 will be used.
igskip - initial skip from the beginning of the function table in sec.
igskip_os - gskip pointer random offset in sec, 0 will be no offset.
ilength - length of the table to be used start from igskip in sec.
kgap - gap in sec.
igap_os - gap random offset in % of the gap size, 0 will be no offset.
kgsize - grain size in sec.
igsize_os - grain size random offset in % of grain size.
iatt - attack in % of grain size.
idec - decade in % of grain size.
[iseed] - optional, seed for the random number generator, default is 0.5.
[ipitch1], [ipitch2], [ipitch3], [ipitch4] - optional, pitch shift parameter
   if ipshift set to 1, 2, 3 or 4. Range: 0.1 (down 10 octave) to
   10 (up 10 octave). Default value is 1, original pitch.
[ifnenv] Optional function table number to be used to generate the
   shape of the rise and decade of envlop. 
*/
