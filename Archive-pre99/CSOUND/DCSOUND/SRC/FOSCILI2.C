/*  foscil2 by Gabriel Maldonado      */
#include "cs.h"                 
#include "foscili2.h"
#include <math.h>

void foscset2(FOSC2 *p)
{
        FUNC   *ftp_car, *ftp_mod ;

        if ((ftp_car = ftfind(p->ifn_car)) != NULL) {
                p->ftp_car = ftp_car;
                if (*p->iphs >= 0)
                        p->cphs = p->mphs = (long)(*p->iphs * fmaxlen);
        }
		else initerror("foscili: invalid carrier table");
		if	 ((ftp_mod = ftfind(p->ifn_mod)) != NULL) 
				p->ftp_mod = ftp_mod;
		else initerror("foscili: invalid modulator table");
		

}

void foscili2(FOSC2   *p) 
{
        FUNC   *ftp_car, *ftp_mod;
        MYFLT  *ar, *ampp, fract, v1, car, fmod, cfreq, mod;
        MYFLT  ndx, *ftab;
        long   mphs, cphs, minc, cinc, lobits_car, lobits_mod;
        int    nsmps = ksmps;

        ar = p->rslt;
        ftp_car = p->ftp_car;
		ftp_mod = p->ftp_mod;
        lobits_car = ftp_car->lobits;
		lobits_mod = ftp_mod->lobits;
        mphs = p->mphs;
        cphs = p->cphs;
        car = *p->kcps * *p->kcar;
        mod = *p->kcps * *p->kmod;
        ndx = *p->kndx * mod;
        ampp = p->xamp;
        minc = (long)(mod * sicvt);
        if (p->XINCODE) {
                do {
                        mphs &= PHMASK;
                        fract =((MYFLT)((mphs) & ftp_mod->lomask) * ftp_mod->lodiv);
						/*fract = PFRAC(mphs);*/
                        ftab = ftp_mod->ftable + (mphs >>lobits_mod);
                        v1 = *ftab++;
                        fmod = (v1 + (*ftab - v1) * fract) * ndx;
                        mphs += minc;
                        cfreq = car + fmod;
                        cinc = (long)(cfreq * sicvt);
                        cphs &= PHMASK;
                        /* fract = PFRAC(cphs);*/
						fract =((MYFLT)((cphs) & ftp_car->lomask) * ftp_car->lodiv);
                        ftab = ftp_car->ftable + (cphs >>lobits_car);
                        v1 = *ftab++;
                        *ar++ = (v1 + (*ftab - v1) * fract) * *ampp++;
                        cphs += cinc;
                }
                while (--nsmps);
        }
        else {
                MYFLT amp;
                amp = *ampp;
                do {
                        mphs &= PHMASK;
						fract =((MYFLT)((mphs) & ftp_mod->lomask) * ftp_mod->lodiv);
                        /*fract = PFRAC(mphs);*/
                        ftab = ftp_mod->ftable + (mphs >>lobits_mod);
                        v1 = *ftab++;
                        fmod = (v1 + (*ftab - v1) * fract) * ndx;
                        mphs += minc;
                        cfreq = car + fmod;
                        cinc = (long)(cfreq * sicvt);
                        cphs &= PHMASK;
                        /*fract = PFRAC(cphs);*/
						fract =((MYFLT)((cphs) & ftp_car->lomask) * ftp_car->lodiv);
                        ftab = ftp_car->ftable + (cphs >>lobits_car);
                        v1 = *ftab++;
                        *ar++ = (v1 + (*ftab - v1) * fract) * amp;
                        cphs += cinc;
                }
                while (--nsmps);
        }
        p->mphs = mphs;
        p->cphs = cphs;
}
