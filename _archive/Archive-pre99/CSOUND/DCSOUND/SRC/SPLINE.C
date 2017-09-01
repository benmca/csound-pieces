#include "cs.h"
#include "spline.h"
#include <math.h>



void poscils_set( POSCILS2 *p)
{
    FUNC *ftp;

    if ((ftp = ftnp2find(p->ift)) == NULL) return;
    p->ftp    = ftp;
    p->tablen = ftp->flen;
	p->tablenUPsr = p->tablen /esr;
    p->phs    = fmod (((*p->iphs * p->tablen)+p->tablen-1),p->tablen);
}


void kposcils(POSCILS2 *p)
{
    double	phs   = p->phs;
    double  si    = *p->freq * p->tablen / ekr;
    int     x0    = (long)phs;
    float	*ftab = p->ftp->ftable + x0;
	float	fract = (float)(phs - x0);
    float   y0, y1, ym1, y2;
	
	ym1= *ftab++;
    y0 = *ftab++;
    y1 = *ftab++;
	y2 = *ftab;
	{
		float frsq = fract*fract;
		float frcu = frsq*ym1;
		float t1= y2 + 3.0f*y0;
		*p->out = *p->amp * (y0 + 0.5f*frcu +
		fract*(y1 - frcu/6.0f - t1/6.0f - ym1/3.0f) +
		frsq*fract*(t1/6.0f - 0.5f*y1) +
		frsq*(0.5f* y1 - y0));
    }
    phs += si;
    while (phs >= p->tablen)
		phs -= p->tablen;
    while (phs < 0 )
		phs += p->tablen;	
    p->phs = phs;
}


void test_set( TEST *p)
{
    double *xv = p->xv, *yv = p->yv;
	int j;
	for (j = 0; j < 16; j++) {
		xv[j] =0.f;
		yv[j] =0.f;
	}
}

#define GAIN   3.654528805400000000e+006
void test(TEST *p)
{
    double *xv = p->xv, *yv = p->yv;

      { xv[0] = xv[1]; xv[1] = xv[2]; xv[2] = xv[3]; xv[3] = xv[4]; xv[4] = xv[5]; xv[5] = xv[6]; xv[6] = xv[7]; xv[7] = xv[8]; xv[8] = xv[9]; xv[9] = xv[10]; 
        xv[10] = (double) *p->input / GAIN;
        yv[0] = yv[1]; yv[1] = yv[2]; yv[2] = yv[3]; yv[3] = yv[4]; yv[4] = yv[5]; yv[5] = yv[6]; yv[6] = yv[7]; yv[7] = yv[8]; yv[8] = yv[9]; yv[9] = yv[10]; 
        yv[10] =   (xv[10] - xv[0]) + 5 * (xv[2] - xv[8]) + 10 * (xv[6] - xv[4])
                     + (-0.921885817690000000 * yv[0]) + (9.292918437399999100 * yv[1])
                     + (-42.155320029000002000 * yv[2]) + (113.323929230000000000 * yv[3])
                     + (-199.927674200000010000 * yv[4]) + (241.868955919999990000 * yv[5])
                     + (-203.206489159999990000 * yv[6]) + (117.071429230000010000 * yv[7])
                     + (-44.263554014000000000 * yv[8]) + (9.917690396499999400 * yv[9]);
        *p->out = (float) yv[10];
      }


}



void poscilsa(POSCILS2 *p)
{
    float	*out = p->out, *ftab2 = p->ftp->ftable;
    double	phs  = p->phs;
    double  si   = *p->freq * p->tablen / esr;
    long	n    = ksmps;
    float   amp = *p->amp;
	do {
	    int	x0 = (long)phs;
		float fract = (float)(phs - x0);
		float *ftab = ftab2 + x0;
		float ym1= *ftab++;
		float y0 = *ftab++;
		float y1 = *ftab++;
		float y2 = *ftab;
		
			float frsq = fract*fract;
			float frcu = frsq*ym1;
			float t1   = y2 + 3.0f*y0;
			*out++     = amp * (y0 + 0.5f*frcu +
				fract*(y1 - frcu/6.0f - t1/6.0f - ym1/3.0f) +
				frsq*fract*(t1/6.0f - 0.5f*y1) +
				frsq*(0.5f* y1 - y0));
		
		phs += si;
		while (phs >= p->tablen)
			phs -= p->tablen;
		while (phs < 0 )
			phs += p->tablen;	
    } while (--n);
    p->phs = phs;
}










void poscils_set_bak( POSCILS *p)
{
    FUNC *ftp;
	float * table;
	if ((ftp = ftnp2find(p->ift)) == NULL) return;
    p->ftp    = ftp;
    table = ftp->ftable;
	p->tablen = ftp->flen;
	p->tablenUPsr = p->tablen /esr;
    p->phs = 0.;

	p->df0 = 0.0f;
	p->old_si = *p->freq * p->tablen / ekr;
	p->f0 = table[0];
	p->f1 = table[1];
	/*
	p->f2 = table[2];
	p->phs=0;
	p->old_int_phs=0;
	*/
}


void kposcils_bak(POSCILS *p)
{
    double	phs = p->phs;
    double      si = *p->freq * p->tablen / ekr;
    float	*curr_samp = p->ftp->ftable + (long)phs;
	float	fract = (float)(phs - (long)phs);
	float	 x, c3, c2, c1, c0;
	float	f2, f1, f0, df1, df0, dx, dx2;
	float	slope, resd1, resd0;
	
	dx = (float) fabs( p->old_si); /* distance beetween points*/
	dx2 = dx+dx;
	//f0 = *(curr_samp);
	//f1 = *(curr_samp+1);
	f2 = *(curr_samp+2);
	
	if (p->old_si < 0) {
		fract = 1- fract;
		f2 = *(curr_samp -1);
	}

	f0 = p->f0;
	f1 = p->f1;
	df0 = p->df0;
	df1 = ( f2*dx*dx /* + f1*(dx12-dx01)*dx02 */ - f0*dx*dx ) / (dx*dx2*dx);
	slope = (f1 - f0) / dx;	/*   get slope x0 to x1	    */
	resd0 = df0 - slope;		/*   then residual slope    */
	resd1 = df1 - slope;		/*     at x0 and x1	    */
	c3 = (resd0 + resd1) / (dx*dx);
	c2 = - (resd1 + 2.0f*resd0) / dx;
	c1 = df0;			/*   and calc cubic coefs   */
	c0 = f0;

	x= (float) (fract * dx  /*si*/ );
	//R = ;
	*p->out = *p->amp * (((c3*x + c2) * x +c1) *x +c0);
	phs    += si;
    while (phs > p->tablen)
		phs -= p->tablen;
    while (phs < 0 )
		phs += p->tablen;	

	if ((long) phs != p->old_int_phs) {
		p->f0 = f1;
		p->f1 = f2;
		p->df0 = df1;
		p->old_int_phs = (long) phs;
	}
	p->old_si = si;
	p->phs = phs;
}


void kposcils_bak2(POSCILS *p)
{
    double	phs = p->phs;
    double      si = *p->freq * p->tablen / ekr;
    float	*curr_samp = p->ftp->ftable + (long)phs;
	float	fract = (float)(phs - (long)phs);
    
	float	R, x, c3, c2, c1, c0;
	float	f2, f1, f0, df1, df0, dx, dx2;
	float	slope, resd1, resd0;

	dx = (float) ( 1/si); /* distance beetween points*/
	dx2 = dx+dx;
	f0 = p->f0;
	f1 = p->f1;
	f2 = *curr_samp;
	df0 = p->df0;
	df1 = ( f2*dx*dx /* + f1*(dx12-dx01)*dx02 */ - f0*dx*dx ) / (dx*dx2*dx);

	slope = (f1 - f0) / dx;	/*   get slope x0 to x1	    */
	resd0 = df0 - slope;		/*   then residual slope    */
	resd1 = df1 - slope;		/*     at x0 and x1	    */
	c3 = (resd0 + resd1) / (dx*dx);
	c2 = - (resd1 + 2.0f*resd0) / dx;
	c1 = df0;			/*   and calc cubic coefs   */
	c0 = f0;

	
	/*formula: f(x) = ((c3 x + c2) x + c1) x + c0  */
	x= (float) (fract*(1/si));
	R = c3;
	R *= x;
	R += c2;	     
	R *= x;
	R += c1;
	R *= x;
	R += c0;
	
	*p->out = *p->amp * (R);

	phs    += si;
	if ((long) phs != p->old_int_phs) {
		p->f0 = f1;
		p->f1 = f2;
		p->df0 = df1;
		p->old_int_phs = (long) phs;
	}
	
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;	
    p->phs = phs;
}


