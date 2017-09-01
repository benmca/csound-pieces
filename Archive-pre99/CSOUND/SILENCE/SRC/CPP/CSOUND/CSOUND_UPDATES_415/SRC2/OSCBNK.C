
/* ---- oscbnk, grain2, and grain3 - written by Istvan Varga, 2001 ---- */

#include <math.h>
#include <time.h>
#include "cs.h"
#include "oscbnk.h"

static unsigned long	oscbnk_seed = 0UL;	/* global seed value */
static long		rnd31i_seed = 0L;	/* seed for rnd31i   */

/* update random seed */

void	oscbnk_rand31 (long *seed)
{
	unsigned long	x, xl, xh;

	/* x = (16807 * x) % 0x7FFFFFFF */
	x = (unsigned long) *seed;
	xl = (x & 0xFFFFUL) * 16807UL; xh = (x >> 16) * 16807UL;
	x = xl + ((xh & 0x7FFFUL) << 16) + (xh >> 15);
	if (x >= 0x7FFFFFFFUL) x = (x + 1UL) & 0x7FFFFFFFUL;
	*seed = (long) x;
}

/* initialise random seed */

void	oscbnk_seedrand (long *seed, MYFLT seedval)
{
	*seed = (long) (seedval + FL(0.5));
	if (*seed < 1L) {			/* seed from current time */
		if (oscbnk_seed > 0UL) {
			oscbnk_seed += 11UL;
		} else {
			oscbnk_seed = (unsigned long) time (NULL);
		}
		oscbnk_seed = ((oscbnk_seed - 1UL) % 0x7FFFFFFEUL) + 1UL;
		*seed = (long) oscbnk_seed;
	} else {
		*seed = ((*seed - 1L) % 0x7FFFFFFEL) + 1L;
	}
	oscbnk_rand31 (seed); oscbnk_rand31 (seed);
}

/* return a random phase value between 0 and OSCBNK_PHSMAX */

unsigned long	oscbnk_rnd_phase (long *seed)
{
	/* update random seed */

	oscbnk_rand31 (seed);

	/* convert seed to phase */

	return ((unsigned long) *seed >> OSCBNK_RNDPHS);
}

/* return a random value between -1 and 1 */

MYFLT	oscbnk_rnd_bipolar (long *seed, MYFLT rpow, int rmode)
{
	double	x;
	MYFLT	s;

	/* update random seed */

	oscbnk_rand31 (seed);

	/* convert to floating point */

	x = ((double) *seed - (double) 0x3FFFFFFFL) / (double) 0x3FFFFFFFL;

	if (!(rmode)) return ((MYFLT) x);	/* uniform distribution */

	/* change distribution */

	s = (x < 0.0 ? FL(-1.0) : FL(1.0));	/* sign			*/
	x = fabs (x);				/* absolute value	*/
	if (rmode == 2) x = fabs (1.0 - x);
	x = pow (x, (double) rpow);
	if (rmode == 2) x = 1.0 - x;

	return ((MYFLT) x * s);
}

/* set ftable parameters (mask etc.) according to table length */

void	oscbnk_flen_setup (long flen, unsigned long *mask,
			   unsigned long *lobits, MYFLT *pfrac)
{
	unsigned long	n;

	n = (unsigned long) flen;
	*lobits = 0UL; *mask = 1UL; *pfrac = FL(0.0);
	if (n < 2UL) return;
	while (n < OSCBNK_PHSMAX) {
		n <<= 1; *mask <<= 1; (*lobits)++;
	}
	*pfrac = FL(1.0) / (MYFLT) *mask; (*mask)--;
}

/* Update random seed, and return next value from parameter table (if	*/
/* enabled) or random value between 0 and 1. If output table is present	*/
/* store value in table.						*/

MYFLT	oscbnk_rand (OSCBNK *p)
{
	MYFLT	y;

	/* update random seed */

	oscbnk_rand31 (&(p->seed));

	/* convert to float */

	y = (MYFLT) (p->seed - 1L) / (MYFLT) 0x7FFFFFFDL;

	/* read from parameter table (if exists) */

	if ((p->tabl_cnt < p->tabl_len) && (p->tabl[p->tabl_cnt] >= FL(0.0)))
		y = p->tabl[p->tabl_cnt];
	switch (p->tabl_cnt % 5) {
		case 0:					/* wrap phase */
		case 1:
		case 3:	y -= (MYFLT) ((long) y); break;
		default: if (y > FL(1.0)) y = FL(1.0);	/* limit frequency */
	}

	/* store in output table */

	if (p->tabl_cnt < p->outft_len) p->outft[p->tabl_cnt] = y;

	p->tabl_cnt++;
	return y;
}

/* Read from ft at phase with linear interpolation. flen is the table	*/
/* length. Phase is limited to the range 0 - 1.				*/

MYFLT	oscbnk_interp_read_limit (MYFLT phase, MYFLT *ft, long flen)
{
	static MYFLT	x;
	static long	n;

	if (phase < FL(0.0)) return ft[0];
	else phase *= (MYFLT) flen;
	n = (long) phase; phase -= (MYFLT) n;
	if (n >= flen) return ft[flen];
	else x = ft[n]; x += phase * (ft[++n] - x);

	return x;
}

/* LFO / modulation */

void	oscbnk_lfo (OSCBNK *p, OSCBNK_OSC *o)
{
	unsigned long	n;
	int	eqmode;
	MYFLT	f, l, q, k, kk, vk, vkk, vkdq, sq;
	static MYFLT	lfo1val = FL(0.0), lfo2val = FL(0.0);

	/* lfo1val = LFO1 output, lfo2val = LFO2 output */

	if (p->ilfomode & 0xF0) {			/* LFO 1 */
		n = o->LFO1phs >> p->l1t_lobits; lfo1val = p->l1t[n++];
		lfo1val += (p->l1t[n] - lfo1val)
			   * (MYFLT) (o->LFO1phs & p->l1t_mask) * p->l1t_pfrac;
		/* update phase */
		f = o->LFO1frq * p->lf1_scl + p->lf1_ofs;
		o->LFO1phs = (o->LFO1phs + OSCBNK_PHS2INT (f)) & OSCBNK_PHSMSK;
	}

	if (p->ilfomode & 0x0F) {			/* LFO 2 */
		n = o->LFO2phs >> p->l2t_lobits; lfo2val = p->l2t[n++];
		lfo2val += (p->l2t[n] - lfo2val)
			   * (MYFLT) (o->LFO2phs & p->l2t_mask) * p->l2t_pfrac;
		/* update phase */
		f = o->LFO2frq * p->lf2_scl + p->lf2_ofs;
		o->LFO2phs = (o->LFO2phs + OSCBNK_PHS2INT (f)) & OSCBNK_PHSMSK;
	}

	/* modulate phase, frequency, and amplitude */

	if (p->ilfomode & 0x88) {		/* FM */
		o->osc_frq = FL(0.0);
		if (p->ilfomode & 0x80) o->osc_frq += lfo1val;
		if (p->ilfomode & 0x08) o->osc_frq += lfo2val;
		o->osc_frq = *(p->args[1]) + o->osc_frq * *(p->args[3]);
	} else {
		o->osc_frq = *(p->args[1]);
	}
	o->osc_frq *= p->frq_scl;

	if (p->ilfomode & 0x44) {		/* AM */
		o->osc_amp = FL(0.0);
		if (p->ilfomode & 0x40) o->osc_amp += lfo1val;
		if (p->ilfomode & 0x04) o->osc_amp += lfo2val;
		o->osc_amp--; o->osc_amp *= *(p->args[2]); o->osc_amp++;
	} else {
		o->osc_amp = FL(1.0);
	}

	o->osc_phm = FL(0.0);			/* PM */
	if (p->ilfomode & 0x22) {
		if (p->ilfomode & 0x20) o->osc_phm += lfo1val;
		if (p->ilfomode & 0x02) o->osc_phm += lfo2val;
		o->osc_phm *= *(p->args[4]);
	}

	if ((eqmode = p->ieqmode) < 0) return;		/* EQ disabled	*/

	/* modulate EQ */

	f = l = q = FL(0.0);
	lfo1val = lfo1val * FL(0.5) + FL(0.5);
	lfo2val = lfo2val * FL(0.5) + FL(0.5);
	if (p->ilfomode & 0x10) {		/* LFO1 to EQ */
		f += oscbnk_interp_read_limit (lfo1val, p->eqft, p->eqft_len);
		l += oscbnk_interp_read_limit (lfo1val, p->eqlt, p->eqlt_len);
		q += oscbnk_interp_read_limit (lfo1val, p->eqqt, p->eqqt_len);
	}
	if (p->ilfomode & 0x01) {		/* LFO2 to EQ */
		f += oscbnk_interp_read_limit (lfo2val, p->eqft, p->eqft_len);
		l += oscbnk_interp_read_limit (lfo2val, p->eqlt, p->eqlt_len);
		q += oscbnk_interp_read_limit (lfo2val, p->eqqt, p->eqqt_len);
	}
	/* calculate EQ frequency, level, and Q */
	f *= p->eqo_scl; f += p->eqo_ofs;
	l *= p->eql_scl; l += p->eql_ofs;
	q *= p->eqq_scl; q += p->eqq_ofs;

	/* EQ code taken from biquad.c */

	sq = (MYFLT) sqrt (2.0 * (double) l);			/* level     */
	/* frequency */
	k = (MYFLT) tan ((double) ((eqmode == 2 ? (PI_F - f) : f) * FL(0.5)));
	kk = k * k; vk = l * k; vkk = l * kk; vkdq = vk / q;	/* Q	     */

	if (eqmode != 0) {
		o->b0 = FL(1.0) + sq * k + vkk;
		o->b1 = FL(2.0) * (vkk - FL(1.0));
		o->b2 = FL(1.0) - sq * k + vkk;
	} else {
		o->b0 = FL(1.0) + vkdq + kk;
		o->b1 = FL(2.0) * (kk - FL(1.0));
		o->b2 = FL(1.0) - vkdq + kk;
	}
	o->a0 = FL(1.0) + (k / q) + kk;
	o->a1 = FL(2.0) * (kk - FL(1.0));
	o->a2 = FL(1.0) - (k / q) + kk;
	if (eqmode == 2) {
		o->a1 = -(o->a1);
		o->b1 = -(o->b1);
	}
	o->a0 = FL(1.0) / o->a0;
}

/* ---------------- oscbnk set-up ---------------- */

void	oscbnkset (OSCBNK *p)
{
	long	i;
	FUNC	*ftp;
	MYFLT	x;

	p->init_k = 1;
	p->nr_osc = (int) (*(p->args[5]) + FL(0.5));	/* number of oscs */
	if (p->nr_osc <= 0) p->nr_osc = -1;	/* no output */
	oscbnk_seedrand (&(p->seed), *(p->args[6]));	/* random seed	  */
	p->ilfomode = (int) (*(p->args[11]) + FL(0.5)) & 0xFF;	/* LFO mode */
	p->eq_interp = 0;					/* EQ mode */
	if (*(p->args[18]) < FL(-0.5)) {
		p->ieqmode = -1; p->ilfomode &= 0xEE;	/* disable EQ */
	} else {
		p->ieqmode = (int) (*(p->args[18]) + FL(0.5));
		if (p->ieqmode > 2) {
			p->ieqmode -= 3;
		} else {
			p->eq_interp = 1;	/* enable interpolation */
		}
		if (p->ieqmode > 2) p->ieqmode = 2;
	}

	/* set up ftables */

	if (p->ilfomode & 0xF0) {
		ftp = ftfind (p->args[20]);		/* LFO 1 */
		if ((ftp == NULL) || ((p->l1t = ftp->ftable) == NULL)) return;
		oscbnk_flen_setup (ftp->flen, &(p->l1t_mask), &(p->l1t_lobits),
				   &(p->l1t_pfrac));
	} else {
		p->l1t = NULL;		/* LFO1 not used */
		p->l1t_lobits = p->l1t_mask = 0UL; p->l1t_pfrac = FL(0.0);
	}

	if (p->ilfomode & 0x0F) {
		ftp = ftfind (p->args[21]);		/* LFO 2 */
		if ((ftp == NULL) || ((p->l2t = ftp->ftable) == NULL)) return;
		oscbnk_flen_setup (ftp->flen, &(p->l2t_mask), &(p->l2t_lobits),
				   &(p->l2t_pfrac));
	} else {
		p->l2t = NULL;		/* LFO2 not used */
		p->l2t_lobits = p->l2t_mask = 0UL; p->l2t_pfrac = FL(0.0);
	}

	if (p->ieqmode >= 0) {
		ftp = ftfind (p->args[22]);		/* EQ frequency */
		if ((ftp == NULL) || ((p->eqft = ftp->ftable) == NULL)) return;
		p->eqft_len = ftp->flen;

		ftp = ftfind (p->args[23]);		/* EQ level */
		if ((ftp == NULL) || ((p->eqlt = ftp->ftable) == NULL)) return;
		p->eqlt_len = ftp->flen;

		ftp = ftfind (p->args[24]);		/* EQ Q */
		if ((ftp == NULL) || ((p->eqqt = ftp->ftable) == NULL)) return;
		p->eqqt_len = ftp->flen;
	} else {
		p->eqft = p->eqlt = p->eqqt = NULL;	/* EQ disabled */
		p->eqft_len = p->eqlt_len = p->eqqt_len = 0L;
	}

	if (*(p->args[25]) >= FL(1.0)) {	/* parameter table */
		ftp = ftfind (p->args[25]);
		if ((ftp == NULL) || ((p->tabl = ftp->ftable) == NULL)) return;
		p->tabl_len = ftp->flen;
	} else {
		p->tabl = NULL; p->tabl_len = 0L;
	}
	p->tabl_cnt = 0L;	/* table ptr. */

	if (*(p->args[26]) >= FL(1.0)) {	/* output table */
		ftp = ftfind (p->args[26]);
		if ((ftp == NULL) || ((p->outft = ftp->ftable) == NULL)) return;
		p->outft_len = ftp->flen;
	} else {
		p->outft = NULL; p->outft_len = 0L;
	}

	/* allocate space */

	if (p->nr_osc < 1) return;
	i = (long) p->nr_osc * (long) sizeof (OSCBNK_OSC);
	if ((p->auxdata.auxp == NULL) || (p->auxdata.size < i))
		auxalloc (i, &(p->auxdata));
	p->osc = (OSCBNK_OSC *) p->auxdata.auxp;

	i = 0; while (i++ < p->outft_len)	/* clear output ftable */
		p->outft[i] = FL(0.0);

	/* initialise oscillators */

	for (i = 0; i < p->nr_osc; i++) {
		/* oscillator phase */
		x = oscbnk_rand (p); p->osc[i].osc_phs = OSCBNK_PHS2INT (x);
		/* LFO1 phase */
		x = oscbnk_rand (p); p->osc[i].LFO1phs = OSCBNK_PHS2INT (x);
		/* LFO1 frequency */
		p->osc[i].LFO1frq = oscbnk_rand (p);
		/* LFO2 phase */
		x = oscbnk_rand (p); p->osc[i].LFO2phs = OSCBNK_PHS2INT (x);
		/* LFO2 frequency */
		p->osc[i].LFO2frq = oscbnk_rand (p);
		/* EQ data */
		p->osc[i].xnm1 = p->osc[i].xnm2 = FL(0.0);
		p->osc[i].ynm1 = p->osc[i].ynm2 = FL(0.0);
		p->osc[i].a0 = p->osc[i].b0 = FL(1.0);
		p->osc[i].a1 = p->osc[i].b1 = FL(0.0);
		p->osc[i].a2 = p->osc[i].b2 = FL(0.0);
	}
}

/* ---------------- oscbnk performance ---------------- */

void	oscbnk (OSCBNK *p)
{
	int	nn, osc_cnt, pm_enabled, am_enabled;
	FUNC	*ftp;
	MYFLT	*ft;
	unsigned long	n, lobits, mask, ph, f_i;
	MYFLT	onedksmps, pfrac, pm, a, f, a0, a1, a2, b0, b1, b2;
	MYFLT	k, a_d = FL(0.0), a0_d, a1_d, a2_d, b0_d, b1_d, b2_d;
	MYFLT	xnm1, xnm2, ynm1, ynm2;
	OSCBNK_OSC	*o;

	/* clear output signal */

	for (nn = 0; nn < ksmps; nn++) p->args[0][nn] = FL(0.0);

	if (p->nr_osc == -1) {
		return;		/* nothing to render */
	} else if ((p->seed == 0L) || (p->osc == NULL)) {
		initerror (Str(X_1665,"oscbnk: not initialised")); return;
	}

	/* check oscillator ftable */

	ftp = ftfindp (p->args[19]);
	if ((ftp == NULL) || ((ft = ftp->ftable) == NULL)) return;
	oscbnk_flen_setup (ftp->flen, &(mask), &(lobits), &(pfrac));

	/* some constants */
	onedksmps = FL(1.0) / (MYFLT) ksmps;
	pm_enabled = (p->ilfomode & 0x22 ? 1 : 0);
	am_enabled = (p->ilfomode & 0x44 ? 1 : 0);
	p->frq_scl = FL(1.0) / esr;			/* osc. freq.	*/
	p->lf1_scl = (*(p->args[8]) - *(p->args[7])) / ekr;
	p->lf1_ofs = *(p->args[7]) / ekr;		/* LFO1 freq.	*/
	p->lf2_scl = (*(p->args[10]) - *(p->args[9])) / ekr;
	p->lf2_ofs = *(p->args[9]) / ekr;		/* LFO2 freq.	*/
	if (p->ieqmode >= 0) {
		p->eqo_scl = (*(p->args[13]) - *(p->args[12])) * TWOPI_F / esr;
		p->eqo_ofs = *(p->args[12]) * TWOPI_F / esr;	/* EQ omega */
		p->eql_scl = *(p->args[15]) - *(p->args[14]);
		p->eql_ofs = *(p->args[14]);			/* EQ level */
		p->eqq_scl = *(p->args[17]) - *(p->args[16]);
		p->eqq_ofs = *(p->args[16]);			/* EQ Q     */
	}

	for (osc_cnt = 0, o = p->osc; osc_cnt < p->nr_osc; osc_cnt++, o++) {
		if (p->init_k) oscbnk_lfo (p, o);
		ph = o->osc_phs;			/* phase	*/
		pm = o->osc_phm;			/* phase mod.	*/
		if ((p->init_k) && (pm_enabled)) {
			f = pm - (MYFLT) ((long) pm);
			ph = (ph + OSCBNK_PHS2INT (f)) & OSCBNK_PHSMSK;
		}
		a = o->osc_amp;				/* amplitude	*/
		f = o->osc_frq;				/* frequency	*/
		if (p->ieqmode < 0) {		/* EQ disabled */
			oscbnk_lfo (p, o);
			/* initialise ramps */
			f = (o->osc_frq + f) * FL(0.5);
			if (pm_enabled) {
				f += (MYFLT) ((double) o->osc_phm - (double) pm)
				     * onedksmps;
				f -= (MYFLT) ((long) f);
			}
			f_i = OSCBNK_PHS2INT (f);
			if (am_enabled) a_d = (o->osc_amp - a) * onedksmps;
			/* oscillator */
			for (nn = 0; nn < ksmps; nn++) {
				/* read from table */
				n = ph >> lobits; k = ft[n++];
				k += (ft[n] - k) * (MYFLT) (ph & mask) * pfrac;
				/* amplitude modulation */
				if (am_enabled) k *= (a += a_d);
				/* mix to output */
				p->args[0][nn] += k;
				/* update phase */
				ph = (ph + f_i) & OSCBNK_PHSMSK;
			}
		} else {			/* EQ enabled */
			a0 = o->a0; b0 = o->b0;		/* EQ coeffs	*/
			a1 = o->a1; b1 = o->b1;
			a2 = o->a2; b2 = o->b2;
			xnm1 = o->xnm1; xnm2 = o->xnm2;
			ynm1 = o->ynm1; ynm2 = o->ynm2;
			oscbnk_lfo (p, o);
			/* initialise ramps */
			f = (o->osc_frq + f) * FL(0.5);
			if (pm_enabled) {
				f += (MYFLT) ((double) o->osc_phm - (double) pm)
				     * onedksmps;
				f -= (MYFLT) ((long) f);
			}
			f_i = OSCBNK_PHS2INT (f);
			if (am_enabled) a_d = (o->osc_amp - a) * onedksmps;
			if (p->eq_interp) {	/* EQ w/ interpolation */
				a0_d = (o->a0 - a0) * onedksmps;
				a1_d = (o->a1 - a1) * onedksmps;
				a2_d = (o->a2 - a2) * onedksmps;
				b0_d = (o->b0 - b0) * onedksmps;
				b1_d = (o->b1 - b1) * onedksmps;
				b2_d = (o->b2 - b2) * onedksmps;
				/* oscillator */
				for (nn = 0; nn < ksmps; nn++) {
					/* update ramps */
					a0 += a0_d; a1 += a1_d; a2 += a2_d;
					b0 += b0_d; b1 += b1_d; b2 += b2_d;
					/* read from table */
					n = ph >> lobits; k = ft[n++];
					k += (ft[n] - k) * (MYFLT) (ph & mask)
					     * pfrac;
					/* amplitude modulation */
					if (am_enabled) k *= (a += a_d);
					/* EQ */
					k = b2 * xnm2 + b1 * (xnm2 = xnm1)
					    + b0 * (xnm1 = k);
					k -= a2 * ynm2 + a1 * (ynm2 = ynm1);
					ynm1 = a0 * k;
					/* mix to output */
					p->args[0][nn] += ynm1;
					/* update phase */
					ph = (ph + f_i) & OSCBNK_PHSMSK;
				}
				/* save EQ coeffs */
				o->a0 = a0; o->a1 = a1; o->a2 = a2;
				o->b0 = b0; o->b1 = b1; o->b2 = b2;
			} else {		/* EQ w/o interpolation */
				/* oscillator */
				for (nn = 0; nn < ksmps; nn++) {
					/* read from table */
					n = ph >> lobits; k = ft[n++];
					k += (ft[n] - k) * (MYFLT) (ph & mask)
					     * pfrac;
					/* amplitude modulation */
					if (am_enabled) k *= (a += a_d);
					/* EQ */
					k = b2 * xnm2 + b1 * (xnm2 = xnm1)
					    + b0 * (xnm1 = k);
					k -= a2 * ynm2 + a1 * (ynm2 = ynm1);
					ynm1 = a0 * k;
					/* mix to output */
					p->args[0][nn] += ynm1;
					/* update phase */
					ph = (ph + f_i) & OSCBNK_PHSMSK;
				}
			}
			o->xnm1 = xnm1; o->xnm2 = xnm2;	/* save EQ state */
			o->ynm1 = ynm1; o->ynm2 = ynm2;
		}
		/* save amplitude and phase */
		o->osc_amp = a;
		o->osc_phs = ph;
	}
	p->init_k = 0;
}

/* ---------------- grain2 set-up ---------------- */

void	grain2set (GRAIN2 *p)
{
	int	i;
	FUNC	*ftp;
	long	n;
	double	x, y;

	/* check opcode params */

	i = (int) (*(p->imode) + FL(0.5));	/* mode */
	if (i & 1) return;			/* skip initialisation */
	p->init_k = 1;
	p->mode = i & 0x0E;
	p->nr_osc = (int) (*(p->iovrlp) + FL(0.5));	/* nr of oscillators */
	if (p->nr_osc < 1) p->nr_osc = -1;
	oscbnk_seedrand (&(p->seed), *(p->iseed));	/* initialise seed */
	p->rnd_pow = *(p->irpow);		/* random distribution */
	if ((p->rnd_pow == FL(0.0)) || (p->rnd_pow == FL(-1.0))
	    || (p->rnd_pow == FL(1.0))) {
		p->rnd_pow = FL(1.0); p->rnd_mode = 0;
	} else if (p->rnd_pow < FL(0.0)) {
		p->rnd_pow = -(p->rnd_pow); p->rnd_mode = 2;
	} else {
		p->rnd_mode = 1;
	}
	ftp = ftfind (p->iwfn);			/* window table */
	if ((ftp == NULL) || ((p->wft = ftp->ftable) == NULL)) return;
	oscbnk_flen_setup (ftp->flen, &(p->wft_mask), &(p->wft_lobits),
			   &(p->wft_pfrac));

	/* allocate space */

	if (p->nr_osc == -1) return;		/* no oscillators */
	n = (long) p->nr_osc * (long) sizeof (GRAIN2_OSC);
	if ((p->auxdata.auxp == NULL) || (p->auxdata.size < n))
		auxalloc (n, &(p->auxdata));
	p->osc = (GRAIN2_OSC *) p->auxdata.auxp;

	/* initialise oscillators */

	y = (double) OSCBNK_PHSMAX / (double) p->nr_osc;
	x = (double) OSCBNK_PHSMAX + 0.5;
	for (i = 0; i < p->nr_osc; i++) {
		if ((x -= y) < 0.0) x = 0.0;
		p->osc[i].window_phs = (unsigned long) x;
	}
}

/* ---------------- grain2 performance ---------------- */

/* set initial phase of grains with start time less than zero */

void	grain2_init_grain_phase (GRAIN2_OSC *o, unsigned long frq,
				 unsigned long w_frq, MYFLT frq_scl,
				 int f_nolock)
{
	double	d;
	MYFLT	f;

	if (!(w_frq)) return;
	if (f_nolock) {
		d = (double) o->grain_frq_flt * (double) frq_scl
		    * (double) OSCBNK_PHSMAX + (double) frq;
	} else {
		d = (double) o->grain_frq_int;
	}
	d *= (double) o->window_phs / ((double) w_frq * (double) OSCBNK_PHSMAX);
	d -= (double) ((long) d); f = (MYFLT) d;
	o->grain_phs = (o->grain_phs + OSCBNK_PHS2INT (f)) & OSCBNK_PHSMSK;
}

/* initialise grain */

void	grain2_init_grain (GRAIN2 *p, GRAIN2_OSC *o)
{
	MYFLT	f;

	/* random phase */

	o->grain_phs = oscbnk_rnd_phase (&(p->seed));

	/* random frequency */

	f = oscbnk_rnd_bipolar (&(p->seed), p->rnd_pow, p->rnd_mode);
	if (p->mode & 2) {
		o->grain_frq_flt = f;
	} else {				/* lock frequency */
		f = p->grain_frq + p->frq_scl * f;
		o->grain_frq_int = OSCBNK_PHS2INT (f);
	}
}

/* ---- grain2 opcode ---- */

void	grain2 (GRAIN2 *p)
{
	int	i, nn, w_interp, g_interp, f_nolock;
	MYFLT	*aout, *ft, *w_ft, grain_frq, frq_scl, pfrac, w_pfrac, f, a, k;
	unsigned long	n, mask, lobits, w_mask, w_lobits;
	unsigned long	g_ph, g_frq, w_ph, w_frq;
	GRAIN2_OSC	*o;
	FUNC	*ftp;

	/* assign object data to local variables */

	aout = p->ar;			/* audio output			*/
	o = p->osc;			/* oscillator array		*/
	w_interp = (p->mode & 8 ? 1 : 0);	/* interpolate window	*/
	g_interp = (p->mode & 4 ? 0 : 1);	/* interpolate grain	*/
	f_nolock = (p->mode & 2 ? 1 : 0);	/* don't lock grain frq	*/
	w_ft = p->wft;			/* window ftable		*/
	w_mask = p->wft_mask; w_lobits = p->wft_lobits; w_pfrac = p->wft_pfrac;

	/* clear output signal */

	for (nn = 0; nn < ksmps; nn++) aout[nn] = FL(0.0);

	if (p->nr_osc == -1) {
		return;			/* nothing to render */
	} else if ((p->seed == 0L) || (p->osc == NULL)) {
		initerror ("grain2: not initialised"); return;
	}

	/* check grain ftable */

	ftp = ftfindp (p->kfn);
	if ((ftp == NULL) || ((ft = ftp->ftable) == NULL)) return;
	oscbnk_flen_setup (ftp->flen, &mask, &lobits, &pfrac);

	p->grain_frq = grain_frq = *(p->kcps) * onedsr;	/* grain frequency */
	p->frq_scl = frq_scl = *(p->kfmd) * onedsr;

	f = onedsr / *(p->kgdur);		/* window frequency	*/
	w_frq = OSCBNK_PHS2INT (f);

	/* initialisation */

	if (p->init_k) {
		g_frq = OSCBNK_PHS2INT (grain_frq);
		for (i = 0; i < p->nr_osc; i++) {
			grain2_init_grain (p, o + i);
			grain2_init_grain_phase (o + i, g_frq, w_frq, frq_scl,
						 f_nolock);
		}
		p->init_k = 0;
	}

	for (i = 0; i < p->nr_osc; i++, o++) {
		g_ph = o->grain_phs;		/* grain phase		*/
		if (f_nolock) {			/* grain frequency	*/
			f = grain_frq + frq_scl * o->grain_frq_flt;
			g_frq = OSCBNK_PHS2INT (f);
		} else {
			g_frq = o->grain_frq_int;
		}
		w_ph = o->window_phs;		/* window phase		*/
		aout = p->ar;			/* audio output		*/
		nn = ksmps; while (nn--) {
			/* window waveform */
			n = w_ph >> w_lobits; a = w_ft[n++];
			if (w_interp)
				a += (w_ft[n] - a) * (MYFLT) (w_ph & w_mask)
				     * w_pfrac;
			/* grain waveform */
			n = g_ph >> lobits; k = ft[n++];
			if (g_interp)
				k += (ft[n] - k) * (MYFLT) (g_ph & mask)
				     * pfrac;
			/* mix to output */
			*(aout++) += a * k;
			/* update phase */
			g_ph = (g_ph + g_frq) & OSCBNK_PHSMSK;
			w_ph = w_ph + w_frq;
			if (w_ph >= OSCBNK_PHSMAX) {	/* new grain	*/
				w_ph &= OSCBNK_PHSMSK;
				grain2_init_grain (p, o);
				/* new grain params */
				g_ph = o->grain_phs;	/* grain phase	*/
				if (f_nolock) {		/* grain frequency */
					f = grain_frq
					    + frq_scl * o->grain_frq_flt;
					g_frq = OSCBNK_PHS2INT (f);
				} else {
					g_frq = o->grain_frq_int;
				}
			}
		}
		/* save phase */
		o->grain_phs = g_ph;
		o->window_phs = w_ph;
	}
}

/* ---------------- grain3 set-up ---------------- */

void	grain3set (GRAIN3 *p)
{
	int	i;
	FUNC	*ftp;
	long	n;

	/* check opcode params */

	i = (int) (*(p->imode) + FL(0.5));	/* mode */
	if (i & 1) return;			/* skip initialisation */
	p->init_k = 1;
	p->mode = i & 0x7E;
	p->x_phs = OSCBNK_PHSMAX;

	p->ovrlap = (int) (*(p->imaxovr) + FL(0.5));	/* max. overlap */
	p->ovrlap = (p->ovrlap < 1 ? 1 : p->ovrlap) + 1;

	oscbnk_seedrand (&(p->seed), *(p->iseed));	/* initialise seed */

	ftp = ftfind (p->iwfn);			/* window table */
	if ((ftp == NULL) || ((p->wft = ftp->ftable) == NULL)) return;
	oscbnk_flen_setup (ftp->flen, &(p->wft_mask), &(p->wft_lobits),
			   &(p->wft_pfrac));

	/* allocate space */

	n = ((long) ksmps + 1L) * (long) sizeof (unsigned long);
	n += (long) p->ovrlap * (long) sizeof (GRAIN2_OSC);
	if ((p->auxdata.auxp == NULL) || (p->auxdata.size < n))
		auxalloc (n, &(p->auxdata));
	p->phase = (unsigned long *) p->auxdata.auxp;
	p->osc = (GRAIN2_OSC *) ((unsigned long *) p->phase + ksmps + 1);
	p->osc_start = p->osc;
	p->osc_end = p->osc;
	p->osc_max = p->osc + (p->ovrlap - 1);
}

/* ---------------- grain3 performance ---------------- */

/* initialise grain */

void	grain3_init_grain (GRAIN3 *p, GRAIN2_OSC *o,
			   unsigned long w_ph, unsigned long g_ph)
{
	MYFLT	f;

	/* start phase */

	f = oscbnk_rnd_bipolar (&(p->seed), p->p_rnd_pow, p->p_rnd_mode);
	f *= *(p->kpmd); if (p->pm_wrap) f -= (MYFLT) ((long) f);
	o->grain_phs = (g_ph + OSCBNK_PHS2INT (f)) & OSCBNK_PHSMSK;
	o->window_phs = w_ph;

	/* frequency */

	f = oscbnk_rnd_bipolar (&(p->seed), p->f_rnd_pow, p->f_rnd_mode);
	if (p->mode & 2) {
		o->grain_frq_flt = f;
	} else {				/* lock frequency */
		f *= p->frq_scl;
		o->grain_frq_int = (p->grain_frq + OSCBNK_PHS2INT (f))
				   & OSCBNK_PHSMSK;
	}
}

/* ---- grain3 opcode ---- */

void	grain3 (GRAIN3 *p)
{
	int	i, nn, w_interp, g_interp, f_nolock;
	MYFLT	*aout0, *aout, *ft, *w_ft, frq_scl, pfrac, w_pfrac, f, a, k;
	MYFLT	wfdivxf, w_frq_f, x_frq_f;
	unsigned long	n, mask, lobits, w_mask, w_lobits;
	unsigned long	*phs, frq, x_ph, x_frq, g_ph, g_frq, w_ph, w_frq;
	GRAIN2_OSC	*o;
	FUNC	*ftp;

	/* clear output */

	for (nn = 0; nn < ksmps; nn++) p->ar[nn] = FL(0.0);

	if ((p->seed == 0L) || (p->osc == NULL)) {
		initerror ("grain3: not initialised"); return;
	}

	/* assign object data to local variables */

	aout0 = p->ar;				/* audio output		*/
	w_interp = (p->mode & 8 ? 1 : 0);	/* interpolate window	*/
	g_interp = (p->mode & 4 ? 0 : 1);	/* interpolate grain	*/
	f_nolock = (p->mode & 2 ? 1 : 0);	/* don't lock grain frq	*/
	w_ft = p->wft;				/* window ftable	*/
	w_mask = p->wft_mask; w_lobits = p->wft_lobits; w_pfrac = p->wft_pfrac;
	phs = p->phase;				/* grain phase offset	*/
	x_ph = p->x_phs;

	ftp = ftfindp (p->kfn);		/* check grain ftable		*/
	if ((ftp == NULL) || ((ft = ftp->ftable) == NULL)) return;
	oscbnk_flen_setup (ftp->flen, &mask, &lobits, &pfrac);

	p->f_rnd_pow = *(p->kfrpow);	/* random distribution (frequency) */
	if ((p->f_rnd_pow == FL(0.0)) || (p->f_rnd_pow == FL(-1.0))
	    || (p->f_rnd_pow == FL(1.0))) {
		p->f_rnd_pow = FL(1.0); p->f_rnd_mode = 0;
	} else if (p->f_rnd_pow < FL(0.0)) {
		p->f_rnd_pow = -(p->f_rnd_pow); p->f_rnd_mode = 2;
	} else {
		p->f_rnd_mode = 1;
	}

	p->p_rnd_pow = *(p->kprpow);	/* random distribution (phase)	*/
	if ((p->p_rnd_pow == FL(0.0)) || (p->p_rnd_pow == FL(-1.0))
	    || (p->p_rnd_pow == FL(1.0))) {
		p->p_rnd_pow = FL(1.0); p->p_rnd_mode = 0;
	} else if (p->p_rnd_pow < FL(0.0)) {
		p->p_rnd_pow = -(p->p_rnd_pow); p->p_rnd_mode = 2;
	} else {
		p->p_rnd_mode = 1;
	}

	if (p->init_k) {			/* initial phase	*/
		f = *(p->kphs); g_ph = OSCBNK_PHS2INT (f);
	} else {
		f = p->phs0; g_ph = phs[ksmps];
	}
	p->phs0 = *(p->kphs);
	/* convert phase modulation to frequency modulation */
	f = (MYFLT) ((double) p->phs0 - (double) f) / (MYFLT) ksmps;
	f -= (MYFLT) ((long) f); g_frq = OSCBNK_PHS2INT (f);
	f = *(p->kcps) * onedsr;		/* grain frequency	*/
	frq = (g_frq + OSCBNK_PHS2INT (f)) & OSCBNK_PHSMSK;
	if (p->mode & 0x40) g_frq = frq;	/* phase sync	*/
	/* calculate phase offset values for this k-cycle */
	for (nn = 0; nn <= ksmps; nn++) {
		phs[nn] = g_ph; g_ph = (g_ph + g_frq) & OSCBNK_PHSMSK;
	}

	w_frq_f = onedsr / *(p->kgdur);		/* window frequency	*/
	if ((w_frq_f < (FL(1.0) / (MYFLT) OSCBNK_PHSMAX))
	    || (w_frq_f >= FL(1.0))) {
		perferror ("grain3: invalid grain duration");
		return;
	}
	w_frq = OSCBNK_PHS2INT (w_frq_f);
	x_frq_f = onedsr * *(p->kdens);		/* density		*/
	if ((x_frq_f < (FL(1.0) / (MYFLT) OSCBNK_PHSMAX))
	    || (x_frq_f >= FL(1.0))) {
		perferror ("grain3: invalid grain density");
		return;
	}
	x_frq = OSCBNK_PHS2INT (x_frq_f);
	wfdivxf = w_frq_f / ((MYFLT) OSCBNK_PHSMAX * x_frq_f);
	p->grain_frq = frq;			/* grain frequency	*/
	p->frq_scl = frq_scl = *(p->kfmd) * onedsr;
	p->pm_wrap = (fabs ((double) *(p->kpmd)) > 0.9 ? 1 : 0);

	/* initialise grains (if enabled) */

	if ((p->init_k) && (!(p->mode & 0x10))) {
		f = w_frq_f / x_frq_f;
		g_frq = (f > FL(0.99999) ? OSCBNK_PHSMAX : OSCBNK_PHS2INT (f));
		/* initial window phase */
		g_ph = OSCBNK_PHSMAX % g_frq;
		if (g_ph < (OSCBNK_PHSMAX >> 16)) g_ph += g_frq;
		g_ph = OSCBNK_PHSMAX - g_ph;
		while (g_ph) {
			grain3_init_grain (p, p->osc_end, g_ph, *phs);
			if (!(p->mode & 0x40))	/* init. grain phase	*/
				grain2_init_grain_phase (p->osc_end, frq, w_frq,
							 frq_scl, f_nolock);
			if (++(p->osc_end) > p->osc_max) p->osc_end = p->osc;
			if (p->osc_end == p->osc_start) {
				perferror ("grain3 needs more overlaps");
				return;
			}
			g_ph -= g_frq;
		}
	}
	p->init_k = 0;

	nn = ksmps; o = p->osc_start;
	while (nn) {
		if (x_ph >= OSCBNK_PHSMAX) {	/* check for new grain	*/
			x_ph &= OSCBNK_PHSMSK;
			if (!(p->mode & 0x20)) {
				f = (MYFLT) x_ph * wfdivxf;
				w_ph = OSCBNK_PHS2INT (f);
			} else {
				w_ph = 0UL;
			}
			grain3_init_grain (p, p->osc_end, w_ph, *phs);
			if (++(p->osc_end) > p->osc_max) p->osc_end = p->osc;
			if (p->osc_end == p->osc_start) {
				perferror ("grain3 needs more overlaps");
				return;
			}
		}

		if (o == p->osc_end) {		/* no active grains	*/
			x_ph += x_frq; nn--; aout0++; phs++; continue;
		}

		g_ph = o->grain_phs;		/* grain phase		*/
		if (f_nolock) {
			/* grain frequency */
			f = o->grain_frq_flt * frq_scl;
			g_frq = OSCBNK_PHS2INT (f);
			g_frq = (g_frq + frq) & OSCBNK_PHSMSK;
		} else {			/* lock frequency	*/
			g_frq = o->grain_frq_int;
		}
		w_ph = o->window_phs;		/* window phase		*/

		/* render grain */
		aout = aout0; i = nn;
		while (i--) {
			/* window waveform */
			n = w_ph >> w_lobits; a = w_ft[n++];
			if (w_interp) a += (w_ft[n] - a) * w_pfrac
					   * (MYFLT) (w_ph & w_mask);
			/* grain waveform */
			n = g_ph >> lobits; k = ft[n++];
			if (g_interp) k += (ft[n] - k) * pfrac
					   * (MYFLT) (g_ph & mask);
			/* mix to output */
			*(aout++) += a * k;
			/* update phase */
			g_ph = (g_ph + g_frq) & OSCBNK_PHSMSK;
			/* check for end of grain */
			if ((w_ph += w_frq) >= OSCBNK_PHSMAX) {
				if (++(p->osc_start) > p->osc_max)
					p->osc_start = p->osc;
				break;
			}
		}
		/* save phase */
		o->grain_phs = g_ph; o->window_phs = w_ph;
		/* next grain */
		if (++o > p->osc_max) o = p->osc;
	}
	p->x_phs = x_ph;
}

/* ----------------------------- rnd31 opcode ------------------------------ */

void	rnd31set (RND31 *p)
{
	/* initialise random seed */
	oscbnk_seedrand (&(p->seed), *(p->iseed));
}

/* ---- rnd31 / i-rate ---- */

void	rnd31i (RND31 *p)
{
	MYFLT	rpow;
	int	rmode;

	/* random distribution */
	rpow = *(p->rpow);
	if ((rpow == FL(0.0)) || (rpow == FL(-1.0)) || (rpow == FL(1.0))) {
		rpow = FL(1.0); rmode = 0;
	} else if (rpow < FL(0.0)) {
		rpow = -(rpow); rmode = 2;
	} else {
		rmode = 1;
	}

	/* initialise seed */
	if (*(p->iseed) < FL(0.5)) {	/* seed from current time	*/
		if (rnd31i_seed <= 0L)	/* check if already initialised	*/
			oscbnk_seedrand (&rnd31i_seed, FL(0.0));
	} else {			/* explicit seed value		*/
		oscbnk_seedrand (&rnd31i_seed, *(p->iseed));
	}

	*(p->out) = *(p->scl) * oscbnk_rnd_bipolar (&rnd31i_seed, rpow, rmode);
}

/* ---- rnd31 / k-rate ---- */

void	rnd31k (RND31 *p)
{
	MYFLT	rpow;
	int	rmode;

	if ((p->seed < 1L) || (p->seed > 0x7FFFFFFEL)) {
		initerror ("rnd31: not initialised"); return;
	}

	/* random distribution */
	rpow = *(p->rpow);
	if ((rpow == FL(0.0)) || (rpow == FL(-1.0)) || (rpow == FL(1.0))) {
		rpow = FL(1.0); rmode = 0;
	} else if (rpow < FL(0.0)) {
		rpow = -(rpow); rmode = 2;
	} else {
		rmode = 1;
	}

	*(p->out) = *(p->scl) * oscbnk_rnd_bipolar (&(p->seed), rpow, rmode);
}

/* ---- rnd31 / a-rate ---- */

void	rnd31a (RND31 *p)
{
	MYFLT	scl, *out, rpow;
	int	rmode, nn;

	if ((p->seed < 1L) || (p->seed > 0x7FFFFFFEL)) {
		initerror ("rnd31: not initialised"); return;
	}

	/* random distribution */
	rpow = *(p->rpow);
	if ((rpow == FL(0.0)) || (rpow == FL(-1.0)) || (rpow == FL(1.0))) {
		rpow = FL(1.0); rmode = 0;
	} else if (rpow < FL(0.0)) {
		rpow = -(rpow); rmode = 2;
	} else {
		rmode = 1;
	}

	scl = *(p->scl); out = p->out;
	nn = ksmps; while (nn--) {
		*(out++) = scl * oscbnk_rnd_bipolar (&(p->seed), rpow, rmode);
	}
}

