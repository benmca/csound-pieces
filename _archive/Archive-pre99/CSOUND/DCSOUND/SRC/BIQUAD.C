/***************************************************************/
/* biquad, moogvcf, rezzy                                      */
/* Biquadratic digital filter with K-Rate coeff.               */
/*      Moog VCF Simulation by Comajuncosas/Stilson/Smith      */
/*      Rezzy Filter by Hans Mikelson                          */
/* Nested allpass and Lorenz added                             */
/* October 1998 by Hans Mikelson                               */
/***************************************************************/
#include "cs.h"
#include <math.h>
#include "biquad.h"

/***************************************************************************/
/* The biquadratic filter computes the digital filter two x components and */
/* two y values.                                                           */
/* Coded by Hans Mikelson October 1998                                     */
/***************************************************************************/

void biquadset(BIQUAD *p)
{
    /* The biquadratic filter is initialized to zero.    */
    if (*p->reinit==FL(0.0)) {      /* Only reset in in non-legato mode */
      p->xnm1 = p->xnm2 = p->ynm1 = p->ynm2 = FL(0.0);
    }
} /* end biquadset(p) */


void biquad(BIQUAD *p)
{
    long n;
    MYFLT *out, *in;
    MYFLT xn, yn;
    MYFLT a0 = *p->a0, a1 = *p->a1, a2 = *p->a2;
    MYFLT b0 = *p->b0, b1 = *p->b1, b2 = *p->b2;
    MYFLT xnm1 = p->xnm1, xnm2 = p->xnm2, ynm1 = p->ynm1, ynm2 = p->ynm2;
    n    = ksmps;
    in   = p->in;
    out  = p->out;
    do {
      xn = *in++;
      yn = (b0*xn + b1*xnm1 + b2*xnm2 - a1*ynm1 - a2*ynm2)/a0;
      xnm2 = xnm1;
      xnm1 = xn;
      ynm2 = ynm1;
      ynm1 = yn;
      *out++ = yn;
    } while (--n);
    p->xnm1 = xnm1; p->xnm2 = xnm2; p->ynm1 = ynm1; p->ynm2 = ynm2;
}

/***************************************************************************/
/* begin MoogVCF by Stilson & Smith of CCRMA,  *****************************/
/* translated to Csound by Josep Comajuncosas, *****************************/
/* translated to C by Hans Mikelson            *****************************/
/***************************************************************************/

void moogvcfset(MOOGVCF *p)
{
    p->xnm1 = p->y1nm1 = p->y2nm1 = p->y3nm1 = FL(0.0);
    p->y1n  = p->y2n   = p->y3n   = p->y4n   = FL(0.0);
    p->fcocod = (p->XINCODE & 01) ? 1 : 0;
    p->rezcod = (p->XINCODE & 04) ? 1 : 0;
}

void moogvcf(MOOGVCF *p)
{
    long n;
    MYFLT *out, *in;
    MYFLT xn;
    MYFLT *fcoptr, *resptr;
    MYFLT fco, res, fcon, kp, pp1d2, scale, k;
    MYFLT max = *p->max;
    MYFLT xnm1 = p->xnm1, y1nm1 = p->y1nm1, y2nm1 = p->y2nm1, y3nm1 = p->y3nm1;
    MYFLT y1n  = p->y1n, y2n = p->y2n, y3n = p->y3n, y4n = p->y4n;

    n       = ksmps;
    in      = p->in;
    out     = p->out;
    fcoptr  = p->fco;
    resptr  = p->res;
    fco     = *fcoptr;
    res     = *resptr;
    
    fcon    = FL(2.0)*fco/esr;                /* normalized freq. 0 to Nyquist */
    kp      = FL(3.6)*fcon-FL(1.6)*fcon*fcon-FL(1.0);  /* Emperical tuning              */
    pp1d2   = (kp+FL(1.0))*FL(0.5);              /* Timesaver                     */
    scale   = (MYFLT)exp((1.0-(double)pp1d2)*1.386249); /* Scaling factor  */
    k       = res*scale;
    do {
      xn = *in++ / max;
      xn = xn - k * y4n; /* Inverted feed back for corner peaking */

      /* Four cascaded onepole filters (bilinear transform) */
      y1n   = xn     * pp1d2 + xnm1  * pp1d2 - kp * y1n;
      y2n   = y1n * pp1d2 + y1nm1 * pp1d2 - kp * y2n;
      y3n   = y2n * pp1d2 + y2nm1 * pp1d2 - kp * y3n;
      y4n   = y3n * pp1d2 + y3nm1 * pp1d2 - kp * y4n;
				/* Clipper band limited sigmoid */
      y4n   = y4n - y4n * y4n * y4n / FL(6.0);
      xnm1  = xn;		/* Update Xn-1	*/
      y1nm1 = y1n;	/* Update Y1n-1	*/
      y2nm1 = y2n;	/* Update Y2n-1	*/
      y3nm1 = y3n;	/* Update Y3n-1	*/
      *out++   = y4n * max;

      /* Handle a-rate modulation of fco & res. */
      if (p->fcocod) {
        fco = *(++fcoptr);
      }
      if (p->rezcod) {
        res = *(++resptr);
      }
      if ((p->rezcod==1) || (p->fcocod==1)) {
        fcon    = FL(2.0)*fco/esr;                /* normalized freq. 0 to Nyquist */
        kp      = FL(3.6)*fcon-FL(1.6)*fcon*fcon-FL(1.0);  /* Emperical tuning */
        pp1d2   = (kp+FL(1.0))*FL(0.5);              /* Timesaver */
        scale   = (MYFLT)exp((1.0-(double)pp1d2)*1.386249); /* Scaling factor */
        k       = res*scale;
      }
    } while (--n);
    p->xnm1 = xnm1; p->y1nm1 = y1nm1; p->y2nm1 = y2nm1; p->y3nm1 = y3nm1; 
    p->y1n  = y1n;  p->y2n  = y2n; p->y3n = y3n; p->y4n = y4n;
}
 
/***************************************************************/
/* This filter is the Mikelson low pass resonant 2-pole filter */
/* Coded by Hans Mikelson October 1998                         */
/***************************************************************/

void rezzyset(REZZY *p)
{
    p->xnm1 = p->xnm2 = p->ynm1 = p->ynm2 = FL(0.0); /* Initialize to zero */
    p->fcocod = (p->XINCODE & 01) ? 1 : 0;
    p->rezcod = (p->XINCODE & 04) ? 1 : 0;
    
} /* end rezzyset(p) */

void rezzy(REZZY *p)
{
    long n;
    MYFLT *out, *fcoptr, *rezptr, *in;
    MYFLT fco, rez, xn, yn;
    MYFLT fqcadj, c, rez2, a, csq, b, tval; /* Temporary varibles for the filter */
    MYFLT xnm1 = p->xnm1, xnm2 = p->xnm2, ynm1 = p->ynm1, ynm2 = p->ynm2;

    n      = ksmps;
    in     = p->in;
    out    = p->out;
    fcoptr = p->fco;
    rezptr = p->rez;
    fco    = *fcoptr;
    rez    = *rezptr;
    
    fqcadj = FL(0.149659863)*esr;	/* Freq. is adjusted based on sample rate */
    c      = fqcadj/fco;	/* Filter constant c=1/Fco * adjustment   */
    /* Try to keep the resonance under control     */
    if (*p->mode == FL(0.0)) { /* Low Pass */
      rez2   = rez/(FL(1.0) + (MYFLT)exp((double)fco/11000.0));
      a      = c/rez2 - FL(1.0);	/* a depends on both Fco and Rez */
      csq    = c*c;		/* Precalculate c^2 */
      b      = FL(1.0) + a + csq;	/* Normalization constant */
    
      do {			/* do ksmp times   */
        xn = *in++;		/* Get the next sample */
	/* Mikelson Biquad Filter Guts*/
        yn = (FL(1.0)/(MYFLT)sqrt(1.0+(double)rez)*xn -
              (-a-FL(2.0)*csq)*ynm1 - csq*ynm2)/b;
        
        xnm2 = xnm1; /* Update Xn-2 */
        xnm1 = xn;  /* Update Xn-1 */
        ynm2 = ynm1; /* Update Yn-2 */
        ynm1 = yn;  /* Update Yn-1 */
        *out++ = yn;  /* Generate the output sample */
        
        /* Handle a-rate modulation of fco and rez */
        if (p->fcocod) {
          fco = *(++fcoptr);
        }
        if (p->rezcod) {
          rez = *(++rezptr);
        }
        if ((p->rezcod==1) || (p->fcocod==1)) {
          c      = fqcadj/fco;
          rez2   = rez/(FL(1.0) + (MYFLT)exp((double) fco/11000.0));
          a      = c/rez2 - FL(1.0); /* a depends on both Fco and Rez */
          csq    = c*c;  /* Precalculate c^2 */
          b      = FL(1.0) + a + csq; /* Normalization constant */
        }
      } while (--n);
    }
    else { /* High Pass Rezzy */
      rez2   = rez/(FL(1.0) + (MYFLT)sqrt(sqrt(1.0/((double) c))));
      tval   = FL(0.75)/(MYFLT)sqrt(1.0 + (double) rez);
      csq    = c*c;
      b      = (c/rez2 + csq);
      do {   /* do ksmp times   */
        xn = *in++;  /* Get the next sample */
        /* Mikelson Biquad Filter Guts*/
        yn = ((c/rez2 + FL(2.0)*csq - FL(1.0))*ynm1 - csq*ynm2
              + ( c/rez2 + csq)*tval*xn + (-c/rez2 - FL(2.0)*csq)*tval*xnm1
              + csq*tval*xnm2)/b;
        
        xnm2 = xnm1;	/* Update Xn-2 */
        xnm1 = xn;		/* Update Xn-1 */
        ynm2 = ynm1;	/* Update Yn-2 */
        ynm1 = yn;		/* Update Yn-1 */
        *out++ = yn;		/* Generate the output sample */
          
        /* Handle a-rate modulation of fco and rez */
        if (p->fcocod) {
          fco = *(++fcoptr);
        }
        if (p->rezcod) {
          rez = *(++rezptr);
        }
        if (p->fcocod || p->rezcod) {
          c      = fqcadj/fco;
          rez2   = rez/(FL(1.0) + (MYFLT)sqrt(sqrt(1.0/((double) c))));
          tval   = FL(0.75)/(MYFLT)sqrt(1.0 + (double) rez);
          csq    = c*c;
          b      = (c/rez2 + csq);
        }
      } while (--n);
    }
    p->xnm1 = xnm1; p->xnm2 = xnm2; p->ynm1 = ynm1; p->ynm2 = ynm2;
}

/***************************************************************************/
/* The distortion opcode uses modified hyperbolic tangent distortion.      */
/* Coded by Hans Mikelson November 1998                                    */
/***************************************************************************/

void distort(DISTORT *p)
{
    long  n;
    MYFLT *out, *in;
    MYFLT pregain = *p->pregain, postgain  = *p->postgain;
    MYFLT shape1 = *p->shape1, shape2 = *p->shape2;
    MYFLT sig, x1, x2, x3;
    
    n    = ksmps;
    in   = p->in;
    out  = p->out;
    pregain  = pregain*FL(0.0002);
    postgain = postgain*FL(20000.0);
    shape1 = shape1*FL(0.000125);
    shape2 = shape2*FL(0.000125);
    do {
      sig    = *in++;
      x1     =  sig*(pregain+shape1);  /* Precalculate a few values to make
                                          things faster */
      x2     = -sig*(pregain+shape2);
      x3     =  sig*pregain;
      
      /* Generate tanh distortion and output the result */
      *out++ =
        (MYFLT)((exp((double)x1)-exp((double)x2))/
                (exp((double)x3)+exp(-(double)x3))
                *postgain);
    } while (--n);
}

/***************************************************************************/
/* The vco is an analog modeling opcode                                    */
/* Generates bandlimited saw, square/PWM, triangle/Saw-Ramp-Mod            */
/* Coded by Hans Mikelson November 1998                                    */
/***************************************************************************/

void vcoset(VCO *p)
{
    unsigned long ndel = (long)(*p->maxd * esr);  /* Number of bytes in the
                                                     delay*/
    MYFLT *buf;    /* Delay buffer */
    FUNC  *ftp;    /* Pointer to a sine function */
    MYFLT ndsave;
    
    ndsave = (MYFLT) ndel;
    /* auxalloc(sizeof(MYFLT)*16385L, &p->auxd); Do this later
       p->sine = (MYFLT*)p->auxd.auxp;
       for (i=0; i<16384; i++)
       p->sine[i] = (MYFLT)sin(TWOPI*(double)i/4096.0); */
    
    p->iphs = 0;   /* Phasor */
  
    if ((ftp = ftfind(p->sine)) != NULL) {
      p->ftp = ftp;
      if (p->iphs >= 0)
        p->lphs = (long)(p->iphs * FL(0.5) * fmaxlen);
      p->ampcod = (p->XINCODE & 02) ? 1 : 0;
      p->cpscod = (p->XINCODE & 01) ? 1 : 0;
    }
  
    p->ynm1 = (*p->wave == FL(1.0)) ? -FL(0.5) : FL(0.0);
    p->ynm2 = FL(0.0);
  
    /* finished setting up buzz now set up internal vdelay */
  
    if (ndel == 0) ndel = 1;  /* fix due to Troxler */
    if (p->aux.auxp == NULL ||
        (int)(ndel*sizeof(MYFLT)) > p->aux.size)  /* allocate space for delay
                                                     buffer */
      auxalloc(ndel * sizeof(MYFLT), &p->aux);
    else {
      buf = (MYFLT *)p->aux.auxp;   /*    make sure buffer is empty       */
      do {
        *buf++ = FL(0.0);
      } while (--ndel);
    }
    p->left = 0;
    p->leaky = (*p->wave == FL(3.0)) ? FL(0.995) : FL(0.999);
    
} /* end vcoset(p) */

/* This code modified from Csound's buzz, integ, & vdelay opcodes */

void vco(VCO *p)
{
    FUNC *ftp;
    MYFLT *ar, *ampp, *cpsp, *ftbl;
    /* MYFLT   *del = FL(1.0)/(*p->xcps); */
    long phs, inc, lobits, dwnphs, tnp1, lenmask, nn, maxd, indx;
    MYFLT   leaky, pw, pwn, rtfqc, amp, fqc;
    MYFLT sicvt2, over2n, scal, num, denom, pulse=FL(0.0), saw=FL(0.0);
    MYFLT sqr=FL(0.0), tri=FL(0.0);
    int n, knh;
    
    /* VDelay Inserted here */
    MYFLT *buf = (MYFLT *)p->aux.auxp;
    MYFLT  fv1, fv2, out1;
    long   v1, v2;
    
    leaky = p->leaky;
    
    if (buf==NULL) {            /* RWD fix */
      initerror(Str(X_1370,"vco: not initialized"));
      return;
    }
    maxd = (unsigned long) (*p->maxd * esr);
    if (maxd == 0) maxd = 1; /* Degenerate case */
    nn = ksmps;
    indx = p->left;
    /* End of VDelay insert */
    
    ftp = p->ftp;
    if (ftp==NULL) {        /* RWD fix */
      initerror(Str(X_1370,"vco: not initialized"));
      return;
    }
    ftbl = ftp->ftable;
    sicvt2 = sicvt * FL(0.5);  /* for theta/2 */
    lobits = ftp->lobits;
    lenmask = ftp->lenmask;
    ampp = p->xamp;
    cpsp = p->xcps;
    fqc = *cpsp;
    rtfqc = (MYFLT)sqrt(fqc);
    knh = (int)(esr/2/fqc);
    if ((n = (int)knh) <= 0) {
                                /* Line appaerntly missing here */
      printf(Str(X_1369,"vco knh (%d) <= 0; taken as 1\n"), n);
      n = 1;
    }
    tnp1 = (n <<1) + 1;   /* calc 2n + 1 */
    over2n = FL(0.5) / n;
    /*    scal = *ampp * over2n; */
    amp  = *ampp;
    scal = FL(1.0) * over2n;
    inc = (long)(fqc * sicvt2);
    ar = p->ar;
    phs = p->lphs;
    nn = ksmps;

/*-----------------------------------------------------*/
/* PWM Wave                                            */
/*-----------------------------------------------------*/
    if (*p->wave==FL(2.0)) {
      pw = *p->pw;
      pwn = pw - FL(0.5);
      do {
        dwnphs = phs >> lobits;
        denom = *(ftbl + dwnphs);
        if (denom > FL(0.0002) || denom < -FL(0.0002)) {
          num = *(ftbl + (dwnphs * tnp1 & lenmask));
          pulse = (num / denom - FL(1.0)) * scal;
        }
        /*   else pulse = *ampp; */
        else pulse = FL(1.0);
        phs += inc;
        phs &= PHMASK;
        if (p->ampcod) {
          /*    scal = *(++ampp) * over2n; */
          amp  = *(++ampp);
          scal = FL(1.0) * over2n;
        }
        if (p->cpscod) {
          fqc = *(++cpsp);
          inc  = (long)(fqc* sicvt2);
        }

        /* VDelay inserted here */
        buf[indx] = pulse;
        fv1 = indx - (FL(1.0)/fqc*FL(0.5)) * esr * pw;        /* Make sure Inside the
                                                           buffer      */
        while (fv1 > maxd)
          fv1 -= maxd;
        while (fv1 < 0)
          fv1 += maxd;
        
        if (fv1 < maxd - 1)  /* Find next sample for interpolation      */
          fv2 = fv1 + 1;
        else
          fv2 = FL(0.0);
        
        v1 = (long)fv1;
        v2 = (long)fv2;
        out1 = buf[v1] + (fv1 - ( long)fv1) * ( buf[v2] - buf[v1]);
        
        if (++indx == maxd) indx = 0;             /* Advance current pointer */
        /* End of VDelay */
        
        sqr  = pulse - out1 + leaky*p->ynm1;
        p->ynm1 = sqr;
        *ar++  = (sqr + pwn*FL(0.5)-FL(0.25)) * FL(1.5) * amp;
      }
      while (--nn);
    }
    
    /*-----------------------------------------------------*/
    /* Triangle Wave                                       */
    /*-----------------------------------------------------*/
    else if (*p->wave==FL(3.0)) {
      pw = *p->pw;
      pwn = pw - FL(0.5);
      do {
        dwnphs = phs >> lobits;
        denom = *(ftbl + dwnphs);
        if (denom > FL(0.0002) || denom < -FL(0.0002)) {
          num = *(ftbl + (dwnphs * tnp1 & lenmask));
          pulse = (num / denom - FL(1.0)) * scal;
        }
        /* else pulse = *ampp; */
        else pulse = FL(1.0);
        phs += inc;
        phs &= PHMASK;
        if (p->ampcod) {
          /* scal = *(++ampp) * over2n; */
          scal = FL(1.0) * over2n;
          amp = *(++ampp);
        }
        if (p->cpscod) {
          fqc = *(++cpsp);
          inc  = (long)(fqc* sicvt2);
        }
        
        /* VDelay inserted here */
        buf[indx] = pulse;
        fv1 = indx - (FL(1.0)/fqc*FL(0.5)) * esr * pw;        /* Make sure Inside the
                                                           buffer      */
        while (fv1 > maxd)
          fv1 -= maxd;
        while (fv1 < 0)
          fv1 += maxd;
        
        if (fv1 < maxd - 1)  /* Find next sample for interpolation      */
          fv2 = fv1 + 1;
        else
          fv2 = FL(0.0);
        
        v1 = (long)fv1;
        v2 = (long)fv2;
        out1 = buf[v1] + (fv1 - ( long)fv1) * ( buf[v2] - buf[v1]);
        
        if (++indx == maxd) indx = 0;             /* Advance current pointer */
        /* End of VDelay */
        
        /* Integrate twice and ouput */
        sqr  = pulse - out1 + leaky*p->ynm1;
        tri  = sqr + leaky*p->ynm2;
        p->ynm1 = sqr;
        p->ynm2 = tri;
        *ar++ =  tri/FL(600.0)/(FL(0.1)+pw)*amp*((MYFLT)sqrt(fqc));
      }
      while (--nn);
    }
    /*-----------------------------------------------------*/
    /* Sawtooth Wave                                       */
    /*-----------------------------------------------------*/
    else {
      do {
        dwnphs = phs >> lobits;
        denom = *(ftbl + dwnphs);
        if (denom > FL(0.0002) || denom < -FL(0.0002)) {
          num = *(ftbl + (dwnphs * tnp1 & lenmask));
          pulse = (num / denom - FL(1.0)) * scal;
        }
        /* else pulse = *ampp; */
        else pulse = FL(1.0);
        phs += inc;
        phs &= PHMASK;
        if (p->ampcod){
          /* scal = *(++ampp) * over2n; */
          scal = FL(1.0) * over2n;
          amp = *(++ampp);
        }
        if (p->cpscod) {
          fqc = *(++cpsp);
          inc  = (long)(fqc*sicvt2);
        }
        
        /* Leaky Integration */
        saw  = pulse + leaky*p->ynm1;
        p->ynm1 = saw;
        *ar++ = saw*FL(1.5)*amp;
      }
      while (--nn);
    }
    
    p->left = indx;             /*      and keep track of where you are */
    p->lphs = phs;
}

/***************************************************************************/
/* This is a simplified model of a planet orbiting in a binary star system */
/* Coded by Hans Mikelson December 1998                                    */
/***************************************************************************/

void planetset(PLANET *p)
{
    p->x  = *p->xval;  p->y  = *p->yval;  p->z  = *p->zval;
    p->vx = *p->vxval; p->vy = *p->vyval; p->vz = *p->vzval;
    p->ax = FL(0.0); p->ay = FL(0.0); p->az = FL(0.0);
    p->hstep = *p->delta;
    p->friction = FL(1.0) - *p->fric/FL(10000.0);
    
} /* end planetset(p) */

/* Planet orbiting in a binary star system coded by Hans Mikelson */

void planet(PLANET *p)
{
    MYFLT *outx, *outy, *outz;
    MYFLT   sqradius1, sqradius2, radius1, radius2, fric;
    MYFLT xxpyy, dz1, dz2, mass1, mass2, msqror1, msqror2;
    long nn;
    
    fric = p->friction;
    
    outx = p->outx;
    outy = p->outy;
    outz = p->outz;
    
    p->s1z = *p->sep*FL(0.5);
    p->s2z = -p->s1z;

    mass1 = *p->mass1;
    mass2 = *p->mass2;

    nn = ksmps;
    do {
      xxpyy = p->x * p->x + p->y * p->y;
      dz1 = p->s1z - p->z;

      /* Calculate Acceleration */
      sqradius1 = xxpyy + dz1 * dz1 + FL(1.0);
      radius1 = (MYFLT) sqrt(sqradius1);
      msqror1 = mass1/sqradius1/radius1;
      
      p->ax = msqror1 * -p->x;
      p->ay = msqror1 * -p->y;
      p->az = msqror1 * dz1;
      
      dz2 = p->s2z - p->z;
      
      /* Calculate Acceleration */
      sqradius2 = xxpyy + dz2 * dz2 + FL(1.0);
      radius2 = (MYFLT) sqrt(sqradius2);
      msqror2 = mass2/sqradius2/radius2;
      
      p->ax += msqror2 * -p->x;
      p->ay += msqror2 * -p->y;
      p->az += msqror2 * dz2;
      
      /* Update Velocity */
      p->vx = fric * p->vx + p->hstep * p->ax;
      p->vy = fric * p->vy + p->hstep * p->ay;
      p->vz = fric * p->vz + p->hstep * p->az;
      
      /* Update Position */
      p->x += p->hstep * p->vx;
      p->y += p->hstep * p->vy;
      p->z += p->hstep * p->vz;
      
      /* Output the results */
      *outx++ = p->x;
      *outy++ = p->y;
      *outz++ = p->z;
    }
    while (--nn);
}

/* ************************************************** */
/* ******** Parametric EQ *************************** */
/* ************************************************** */

/* Implementation of Zoelzer's Parmentric Equalizer Filters */
void pareqset(PAREQ *p)
{
    /* The equalizer filter is initialized to zero.    */
    p->xnm1 = p->xnm2 = p->ynm1 = p->ynm2 = FL(0.0);
    p->imode = *p->mode;
} /* end pareqset(p) */


void pareq(PAREQ *p)
{
    long n;
    MYFLT *out, *in;
    MYFLT xn, yn, a0, a1, a2, b0, b1, b2;
    MYFLT fc = *p->fc, v = *p->v, q = *p->q;
    MYFLT omega, k, kk, vkk, vk, vkdq;
    MYFLT xnm1 = p->xnm1, xnm2 = p->xnm2, ynm1 = p->ynm1, ynm2 = p->ynm2;
    n    = ksmps;
    in   = p->in;
    out  = p->out;

    /* Low Shelf */
    if (p->imode == 1) {
      MYFLT sq = (MYFLT)sqrt(2.0*(double)v);
      omega = TWOPI_F*fc/esr;
      k = (MYFLT) tan((double)omega*0.5);
      kk = k*k;
      vkk = v*kk;
      b0 =  FL(1.0) + sq*k + vkk;
      b1 =  FL(2.0)*(vkk - FL(1.0));
      b2 =  FL(1.0) - sq*k + vkk;
      a0 =  FL(1.0) + k/q +kk;
      a1 =  FL(2.0)*(kk - FL(1.0));
      a2 =  FL(1.0) - k/q + kk;
    }
    /* High Shelf */
    else if (p->imode == 2) {
      MYFLT sq = (MYFLT)sqrt(2.0*(double)v);
      omega = TWOPI_F*fc/esr;
      k = (MYFLT) tan((PI - (double)omega)*0.5);
      kk = k*k;
      vkk = v*kk;
      b0 =  FL(1.0) + sq*k + vkk;
      b1 = -FL(2.0)*(vkk - FL(1.0));
      b2 =  FL(1.0) - sq*k + vkk;
      a0 =  FL(1.0) + k/q +kk;
      a1 = -FL(2.0)*(kk - FL(1.0));
      a2 =  FL(1.0) - k/q + kk;
    }
    /* Peaking EQ */
    else {
      omega = TWOPI_F*fc/esr;
      k = (MYFLT) tan((double)omega*0.5);
      kk = k*k;
      vk = v*k;
      vkdq = vk/q;
      b0 =  FL(1.0) + vkdq + kk;
      b1 =  FL(2.0)*(kk - FL(1.0));
      b2 =  FL(1.0) - vkdq + kk;
      a0 =  FL(1.0) + k/q +kk;
      a1 =  FL(2.0)*(kk - FL(1.0));
      a2 =  FL(1.0) - k/q + kk;
    }
    
    do {
      xn = *in++;
      yn = (b0*xn + b1*xnm1 + b2*xnm2 - a1*ynm1 - a2*ynm2)/a0;
      xnm2 = xnm1;
      xnm1 = xn;
      ynm2 = ynm1;
      ynm1 = yn;
      *out++ = yn;
    } while (--n);
    p->xnm1 = xnm1; p->xnm2 = xnm2; p->ynm1 = ynm1; p->ynm2 = ynm2;
}

/* Nested all-pass filters useful for creating reverbs */
/* Coded by Hans Mikelson January 1999                 */
/* Derived from Csound's delay opcode                  */
/* Set up nested all-pass filter                       */

void nestedapset(NESTEDAP *p)
{
    long    npts, npts1=0, npts2=0, npts3=0;
    char    *auxp;

    if (*p->istor && p->auxch.auxp != NULL)
      return;

    npts2 = (long)(*p->del2 * esr);
    npts3 = (long)(*p->del3 * esr);
    npts1 = (long)(*p->del1 * esr) - npts2 -npts3;
    
    if (((long)(*p->del1 * esr)) <=
        ((long)(*p->del2 * esr) + (long)(*p->del3 * esr))) {
      initerror(Str(X_846,"illegal delay time"));
      return;
    }
    npts = npts1 + npts2 + npts3;
    /* new space if reqd */
    if ((auxp = p->auxch.auxp) == NULL || npts != p->npts) { 
      auxalloc((long)npts*sizeof(MYFLT), &p->auxch);
      auxp = p->auxch.auxp;
      p->npts = npts;
      
      if (*p->mode == FL(1.0)) {
        if (npts1 <= 0) {
          initerror(Str(X_846,"illegal delay time"));
          return;
        }
        p->beg1p = (MYFLT *) p->auxch.auxp;
        p->end1p = (MYFLT *) p->auxch.endp;
      }
      else if (*p->mode == FL(2.0)) {
        if (npts1 <= 0 || npts2 <= 0) {
          initerror(Str(X_846,"illegal delay time"));
          return;
        }
        p->beg1p = (MYFLT *)  p->auxch.auxp;
        p->beg2p = (MYFLT *) (p->auxch.auxp + (long)npts1*sizeof(MYFLT));
        p->end1p = (MYFLT *) (p->beg2p - sizeof(MYFLT));
        p->end2p = (MYFLT *)  p->auxch.endp;
      }
      else if (*p->mode == FL(3.0)) {
        if (npts1 <= 0 || npts2 <= 0 || npts3 <= 0) {
          initerror(Str(X_846,"illegal delay time"));
          return;
        }
        p->beg1p = (MYFLT *)  p->auxch.auxp;
        p->beg2p = (MYFLT *) (p->auxch.auxp + (long)npts1*sizeof(MYFLT));
        p->beg3p = (MYFLT *) (p->auxch.auxp +
                              (long)npts1*sizeof(MYFLT) +
                              (long)npts2*sizeof(MYFLT));
        p->end1p = (MYFLT *) (p->beg2p - sizeof(MYFLT));
        p->end2p = (MYFLT *) (p->beg3p - sizeof(MYFLT));
        p->end3p = (MYFLT *)  p->auxch.endp;
      } 
    }
    /* else if requested */
    else if (!(*p->istor)) {
      long *lp = (long *)auxp;
      /*   clr old to zero */
      do  *lp++ = 0;
      while (--npts);
    }
    p->del1p = p->beg1p;
    p->del2p = p->beg2p;
    p->del3p = p->beg3p;
    p->out1 = FL(0.0);
    p->out2 = FL(0.0);
    p->out3 = FL(0.0);
}

void nestedap(NESTEDAP *p)
{
    MYFLT   *outp, *inp;
    MYFLT   *beg1p, *beg2p, *beg3p, *end1p, *end2p, *end3p;
    MYFLT   *del1p, *del2p, *del3p;
    MYFLT   in1, g1, g2, g3;
    int     nsmps = ksmps;

    if (p->auxch.auxp==NULL) { /* RWD fix */
      initerror(Str(X_687,"delay: not initialized"));
      return;
    }
    
    outp = p->out;
    inp  = p->in;
    
    /* Ordinary All-Pass Filter */
    if (*p->mode == FL(1.0)) {
      
      del1p = p->del1p;
      end1p = p->end1p;
      beg1p = p->beg1p;
      g1    = *p->gain1;
      
      do {
        in1 = *inp++;
        p->out1 = *del1p - g1*in1;

        /* dw1 delay dr1, dt1 */
        *del1p = in1 + g1 * p->out1;
        if (++del1p >= end1p)
          del1p = beg1p;
        
        *outp++ = p->out1;
      } while (--nsmps);
      p->del1p = del1p;         /* save the new curp */
    }
    
    /* Single Nested All-Pass Filter */
    else if (*p->mode == FL(2.0)) {

      del1p = p->del1p;
      end1p = p->end1p;
      beg1p = p->beg1p;
      g1    = *p->gain1;

      del2p = p->del2p;
      end2p = p->end2p;
      beg2p = p->beg2p;
      g2    = *p->gain2;

      do {
        in1 = *inp++;

        p->out2 = *del2p  - g2 * *del1p;
        p->out1 = p->out2 - g1 * in1;

        *del1p = in1    + g1 * p->out1;
        *del2p = *del1p + g2 * p->out2;

        /* delay 2 */
        if (++del2p >= end2p)
          del2p = beg2p;

        /* delay 1 */
        if (++del1p >= end1p)
          del1p = beg1p;

        *outp++ = p->out1;
      } while (--nsmps);
      p->del1p = del1p;         /* save the new del1p */
      p->del2p = del2p;         /* save the new del2p */
    }

    /* Double Nested All-Pass Filter */
    else if (*p->mode == FL(3.0)) {

      del1p = p->del1p;
      end1p = p->end1p;
      beg1p = p->beg1p;
      g1    = *p->gain1;
      
      del2p = p->del2p;
      end2p = p->end2p;
      beg2p = p->beg2p;
      g2    = *p->gain2;
      
      del3p = p->del3p;
      end3p = p->end3p;
      beg3p = p->beg3p;
      g3    = *p->gain3;

      do {
        in1 = *inp++;

        p->out2 = *del2p  - g2 * *del1p;
        p->out3 = *del3p  - g3 * p->out2;
        p->out1 = p->out3 - g1 * in1;

        *del1p = in1      + g1 * p->out1;
        *del2p = *del1p   + g2 * p->out2;
        *del3p = p->out2  + g3 * p->out3;

        /* delay 1 */
        if (++del1p >= end1p)
          del1p = beg1p;

        /* delay 2 */
        if (++del2p >= end2p)
          del2p = beg2p;

        /* delay 3 */
        if (++del3p >= end3p)
          del3p = beg3p;

        *outp++ = p->out1;
      } while (--nsmps);
      p->del1p = del1p;         /* save the new del1p */
      p->del2p = del2p;         /* save the new del2p */
      p->del3p = del3p;         /* save the new del3p */
    }
}

/***************************************************************************/
/* The Lorenz System                                                       */
/* Coded by Hans Mikelson Jauarary 1999                                    */
/***************************************************************************/

void lorenzset(LORENZ *p)
{
    p->valx = *p->inx; p->valy = *p->iny; p->valz = *p->inz;
}

/* Lorenz System coded by Hans Mikelson */

void lorenz(LORENZ *p)
{
    MYFLT   *outx, *outy, *outz;
    MYFLT   x, y, z, xx, yy, s, r, b, hstep;
    long    nn, skip;

    outx  = p->outx;
    outy  = p->outy;
    outz  = p->outz;

    s     = *p->s;
    r     = *p->r;
    b     = *p->b;
    hstep = *p->hstep;
    skip  = (long) *p->skip;
    x     = p->valx;
    y     = p->valy;
    z     = p->valz;

    nn = ksmps;
    do {
      do {
        xx   =      x+hstep*s*(y-x);
        yy   =      y+hstep*(-x*z+r*x-y);
        z    =      z+hstep*(x*y-b*z);
        x    =      xx;
        y    =      yy;
      } while (--skip>0);

      /* Output the results */
      *outx++ = x;
      *outy++ = y;
      *outz++ = z;
    } while (--nn);

    p->valx = x;
    p->valy = y;
    p->valz = z;
}


/**************************************************************************/
/* TBVCF by Hans Mikelson December 2000-January 2001                      */
/* This opcode attempts to model some of the filter characteristics of    */
/* a TB303.  Euler's method is used to approximate the system rather      */
/* than traditional filter methods.  Cut-off frequency, Q and distortion  */
/* are all coupled.  Empirical methods were used to try to unentwine them */
/* but frequency is only approximate.                                     */
/**************************************************************************/

void tbvcfset(TBVCF *p)
{
    p->y = p->y1 = p->y2 = FL(0.0);
    p->fcocod = (p->XINCODE & 01) ? 1 : 0;
    p->rezcod = (p->XINCODE & 04) ? 1 : 0;
}

void tbvcf(TBVCF *p)
{
    long n;
    MYFLT *out, *in;
    MYFLT x;
    MYFLT *fcoptr, *resptr, *distptr, *asymptr;
    MYFLT fco, res, dist, asym;
    MYFLT y = p->y, y1 = p->y1, y2 = p->y2;
    MYFLT ih, fc, fco1, q, q1, fdbk, d, ad;

    ih  = FL(0.001); /* ih is the incremental factor */

 /* Set up the pointers */
    n       = ksmps;
    in      = p->in;
    out     = p->out;
    fcoptr  = p->fco;
    resptr  = p->res;
    distptr = p->dist;
    asymptr = p->asym;

 /* Get the values for the k-rate variables */
    fco     = *fcoptr;
    res     = *resptr;
    dist = *distptr;
    asym = *asymptr;

 /* Try to decouple the variables */
    q1  = res/(FL(1.0) + (MYFLT)sqrt((double)dist));
    fco1 = (MYFLT)pow((double)fco*260.0/(1.0+(double)q1*0.5),0.58);
    q  = q1*fco1*fco1*FL(0.0005);
    fc  = fco1/FL(8.0)/esr*FL(44100.0);
    do {
      x  = *in++;
      fdbk = q*y/(FL(1.0) + (MYFLT)exp(-3.0*(double)y)*asym);
      y1  = y1 + ih*((x - y1)*fc - fdbk);
      d  = -FL(0.1)*y*FL(20.0);
      ad  = (d*d*d + y2)*FL(100.0)*dist;
      y2  = y2 + ih*((y1 - y2)*fc + ad);
      y  = y + ih*((y2 - y)*fc);
      *out++ = y*fc/FL(1000.0)*(1.0f + q1)*FL(3.2);

      /* Handle a-rate modulation of fco & res. */
      if (p->fcocod) {
        fco = *(++fcoptr);
      }
      if (p->rezcod) {
        res = *(++resptr);
      }
      if ((p->rezcod==1) || (p->fcocod==1)) {
        q1  = res/(FL(1.0) + (MYFLT)sqrt((double)dist));
        fco1 = (MYFLT)pow((double)(fco*260.0/(1.0+q1*0.5)),0.58);
        q  = q1*fco1*fco1*FL(0.0005);
        fc  = fco1/FL(8.0)/esr*FL(44100.0);
      }
    } while (--n);
    p->y = y; p->y1 = y1; p->y2 = y2;
}

