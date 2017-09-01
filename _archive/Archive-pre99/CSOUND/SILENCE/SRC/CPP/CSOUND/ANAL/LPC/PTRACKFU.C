#include <stdio.h>                                        /*     PTRACKFUNS.C   */

static float    ZERO = 0., ONE = 1., TWO = 2., TWOPI = 6.2831853;
static float	tphi[50][5][25], tpsi[50][6][25];
static float	tgamph[50][5],   tgamps[50][6],   freq[50];
static float    NYQ10, search(), lowpass();
static int 	FRAME, JMAX, MM;
static void     trigpo(), filfun();

void ptable(fmin, fmax, esr, framsiz)
     float fmin, fmax, esr;
     int   framsiz;
{
	int   i, n, nt;
	float omega, t, fstep, tpidsrd10;

	NYQ10  = esr/20.;
	FRAME  = framsiz;
	JMAX   = framsiz/10;
	MM     = (JMAX+1)/2;
	tpidsrd10 = TWOPI / (esr/10.);
	fstep = (fmax - fmin) / 50.;
	for (i=0 ; i<50 ; ++i) {
		freq[i] = fmin + (float)i * fstep;
		t = NYQ10 / freq[i];
		nt = (int) t;
		n = (nt < 5 ? nt : 5);
		omega = freq[i] * tpidsrd10;
		trigpo(omega, tphi[i], tpsi[i], tgamph[i], tgamps[i], n);
	}
}

static void trigpo(omega, phi, psi, gamphi, gampsi, n)
     float omega, phi[5][25], psi[6][25], gamphi[5], gampsi[6];
     int n;
{
	int    j=0, k, np;
	double alpha, beta, gamma, wcos[25], wsin[25];
	double p, z, a, b, yy, sin(), cos();

	np = n+1;
	for (k=0 ; k<MM ; ++k) {
		yy = omega * (float)k;
		wcos[k] = cos(yy);
		wsin[k] = sin(yy);
	}
	beta = gamma = ZERO;
	for (k=0 ; k<MM ; ++k) {
		p = wsin[k];
		z = p * p;
		beta += z * wcos[k];
		gamma += z;
		phi[0][k] = p;
	}
	gamphi[0] = gamma;
	a = TWO * beta/gamma;
	alpha = beta = gamma = ZERO;
	for (k=0 ; k<MM ; ++k) {
		p = (TWO * wcos[k]-a) * phi[0][k];
		alpha += wcos[k] * p * phi[0][k];
		beta += wcos[k] * ( p * p ) ;
		gamma +=  p * p ;
		phi[1][k] = p ;
	}
	gamphi[1] = gamma;
	a = TWO * beta/gamma;
	b = TWO *alpha/gamphi[0];
	for (j=2 ; j<n ; ++j) {
		alpha = beta = gamma = ZERO;
		for (k=0 ; k< MM ; ++k)	{
			p = (TWO * wcos[k] - a ) * phi[j-1][k] - b * phi[j-2][k];
			alpha += wcos[k] * p * phi[j-1][k];
			beta += wcos[k] * (p * p);
			gamma += (p * p) ;
			phi[j][k] = p ;
		}
		gamphi[j] = gamma;
		a = TWO * beta/gamma;
		b = TWO *alpha/gamphi[j-1];
	}
	beta = ZERO ;
	gamma = (double) MM;
	for ( k=0; k < MM ; ++k) {
		beta += wcos[k];
		psi[0][k] = ONE;
	}
	gampsi[0] = gamma;
	a = beta/gamma;
	alpha = beta = gamma = ZERO;
	for ( k=0 ; k < MM ; ++k) {
		p = wcos[k]-a;
		alpha += wcos[k] * p*psi[0][k];
		beta += wcos[k] * ( p * p );
		gamma += (p * p);
		psi[1][k] = p ;
	}
	gampsi[1] = gamma ;
	a = TWO * beta / gamma ;
	b = TWO * alpha / gampsi[0];
	for (j=2 ; j<np ;++j) {
		alpha = beta = gamma = ZERO;
		for (k=0; k < MM ; ++k) {
			p = (TWO * wcos[k]-a)* psi[j-1][k]-b*psi[j-2][k];
			alpha += wcos[k]*p*psi[j-1][k];
			beta += wcos[k]* (p*p);
			gamma += (p*p);
			psi[j][k] = p;
		}
		gampsi[j] = gamma;
		a = TWO * beta/gamma;
		b = TWO * alpha/gampsi[j-1];
	}
}

float getpch(sigi)
     short *sigi;
{
static	float s[80];   /* room for adding 25 or so new samples to JMAX */
static  int   tencount = 0;
	int   i, newcount = 0;
	float g[25], h[25], fm, qsum, y, *sp, *fp = s + JMAX;
	
        for (i=0; i < FRAME; i++) {
	    y = lowpass(sigi[i]);        /* lowpass every sample  */
	    if (++tencount == 10) {
	        *fp++ = y;               /*  & save every 10th    */
		tencount = 0;
		newcount++;
	    }
	}
	for (sp = s, fp = s+newcount, i = JMAX;  i--; )
	    *sp++ = *fp++;               /* use latest JMAX samples */
	for (i=0 ; i<MM ; ++i) {
	    g[i] = .5 * ( s[MM+i-1] - s[MM-i-1] );
	    h[i] = .5 * ( s[MM+i-1] + s[MM-i-1] );
	}
	qsum = 0.;
	for (i=0 ; i<MM ; ++i)
	    qsum += (g[i]*g[i]) + (h[i]*h[i]);
	return ( search(&fm, qsum, g, h) );
}

static float search(fm, qsum, g, h)
     float *fm, qsum, g[], h[];
{
	float fun[50], funmin = 1.e10;
	float f1, f2, f3, x0, x1, x2, x3, a, b, c, ftemp;
	int   i, istar = 0;

	filfun(fun, g, h, qsum);
	for (i=0 ; i<50 ; ++i) {
	    ftemp = fun[i];
	    if (ftemp < funmin) {
		funmin = ftemp;
		istar = i;
	    }
	}
	if (istar == 0 || istar == 49) {
	    *fm = fun[istar];
	    return (freq[istar]);
	}
	x1 = freq[istar-1];
	f1 = fun[istar-1];
	x2 = freq[istar];
	f2 = fun[istar];
	x3 = freq[istar+1];
	f3 = fun[istar+1];
	a = f3/((x3-x1)*(x3-x2));
	b = f2/((x2-x1)*(x2-x3));
	c = f1/((x1-x2)*(x1-x3));
	x0 = .5*(a*(x1+x2)+b*(x1+x3)+c*(x2+x3))/(a+b+c);
	*fm = a*(x0-x1)*(x0-x2)+b*(x0-x1)*(x0-x3)+c*(x0-x2)*(x0-x3);
	return (x0);
}

static void filfun(fun, g, h, qsum)
     float *fun, *g, *h, qsum;
{
	float c, sum;
	int   i, n, np, j, k;

        for (i=0 ; i < 50 ;++i) {
		n = NYQ10 / freq[i];
		n = (n < 5) ? n : 5;
		np = n+1;
		sum = ZERO;
                for (j=0 ; j < n ; ++j) {
			c = ZERO;
                        for (k=0 ; k< MM ; ++k)  
				c += g[k] * tphi[i][j][k];
			sum += (c*c) / tgamph[i][j];
		}
		for (j=0 ; j<np ; ++j) {
			c = ZERO;
			for (k=0 ; k < MM ; ++k) 
				c += h[k] * tpsi[i][j][k];
			sum += (c*c) / tgamps[i][j];
		}
		fun[i] = qsum - sum;
	}
}

static float lowpass(x)
     short x;		/* from float */
{
static	float c = .00048175311;
static	float a1 = -1.89919924, c1 = -1.92324804, d1 = .985720370;
static	float a2 = -1.86607670, c2 = -1.90075003, d2 = .948444690;
static	float a3 = -1.66423461, c3 = -1.87516686, d3 = .896241023;
static	float c4 = -.930449120;
static  float w1 = 0., w11 = 0., w12 = 0.;
static	float w2 = 0., w21 = 0., w22 = 0.;
static  float w3 = 0., w31 = 0., w32 = 0.;
static	float w4 = 0., w41 = 0., w42 = 0.;
        float temp,y;
	
	w1 = c*x - c1*w11 - d1*w12;
	temp = w1 + a1*w11 + w12;
	w12 = w11;
	w11 = w1;
	w2 = temp - c2*w21 - d2*w22;
	temp = w2 + a2*w21 + w22;
	w22 = w21;
	w21 = w2;
	w3 = temp - c3*w31 - d3*w32;
	temp = w3 + a3*w31 + w32;
	w32 = w31;
	w31 = w3;
	w4 = temp - c4*w41;
	y = w4 + w41;
	w42 = w41;   /* w42 set but not used in lowpass */
	w41 = w4;
	return(y);
}

