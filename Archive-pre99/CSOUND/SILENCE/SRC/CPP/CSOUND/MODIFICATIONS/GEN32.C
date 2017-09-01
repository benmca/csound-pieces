
/* gen32: transpose, phase shift, and mix source tables */

static void gen32 (void)
{
  complex *ex, *x, *y;
  MYFLT   a, p;
  double  d_re, d_im, p_re, p_im, ptmp;
  long    i, j, k, n, l1, l2, ntabl, *pnum, ft;
  FUNC    *f;

  if (nargs < 4) {
    fterror(Str(X_941, "insufficient gen arguments")); return;
  }

  ntabl = nargs >> 2;		/* number of waves to mix */
  pnum = (long*) mmalloc (sizeof (long) * ntabl);
  for (i = 0; i < ntabl; i++)
    pnum[i] = (i << 2) + 5;	/* p-field numbers */
  do {
    i = k = 0;			/* sort by table number */
    while (i < (ntabl - 1)) {
      if (e->p[pnum[i]] > e->p[pnum[i + 1]]) {
        j = pnum[i]; pnum[i] = pnum[i + 1]; pnum[i + 1] = j;
        k = 1;
      }
      i++;
    }
  } while (k);

  l1 = ftp->flen;		/* dest. table length */
  for (i = 0; i <= l1; i++) ftp->ftable[i] = FL(0.0);
  x = y = NULL;

  ft = -0x80000000L;		/* last table number */
  j = -1L;			/* current wave number */

  while (++j < ntabl) {
    p = e->p[pnum[j]];		/* table number */
    i = (long) (p + (p < FL(0.0) ? FL(-0.5) : FL(0.5)));
    p = (MYFLT) (abs (i));
    if ((f = ftfind (&p)) == NULL) return;	/* source table */
    l2 = f->flen;		/* src table length */
    if (i < 0) {		/* use linear interpolation */
      ft = i;
      p_re = (double) e->p[pnum[j] + 3];	/* start phase */
      p_re -= (double) ((long) p_re); if (p_re < 0.0) p_re++;
      p_re *= (double) l2;
      d_re = (double) e->p[pnum[j] + 1];	/* frequency */
      d_re *= (double) l2 / (double) l1;
      a = e->p[pnum[j] + 2];			/* amplitude */
      for (i = 0; i <= l1; i++) {
        k = (long) p_re; p = (MYFLT) (p_re - (double) k);
        if (k >= l2) k -= l2;
        ftp->ftable[i] += f->ftable[k++] * a * (FL(1.0) - p);
        ftp->ftable[i] += f->ftable[k] * a * p;
        p_re += d_re;
        while (p_re < 0.0) p_re += (double) l2;
        while (p_re >= (double) l2) p_re -= (double) l2;
      }
    } else {			/* use FFT */
      if (i != ft) {
        ft = i;		/* new table */
        if (y == NULL)
          y = (complex*) mcalloc (sizeof (complex) * ((l1 >> 1) + 1));
        if (x != NULL) mfree (x);
        x = (complex*) mcalloc (sizeof (complex) * ((l2 >> 1) + 1));
        /* read and analyze src table */
        for (i = 0; i < l2; i++) {
          x[i >> 1].re = f->ftable[i]; i++;
          x[i >> 1].im = f->ftable[i];
        }
        ex = AssignBasis (NULL, l2);
        FFT2realpacked (x, l2, ex);
      }
      n = (long) (FL(0.5) + e->p[pnum[j] + 1]);		/* frequency */
      if (n < 1) n = 1;
      a = e->p[pnum[j] + 2] / (MYFLT) l2;		/* amplitude */
      p = e->p[pnum[j] + 3];				/* phase */
      p -= (MYFLT) ((long) p); if (p < FL(0.0)) p += FL(1.0); p *= TWOPI_F;
      d_re = cos ((double) p); d_im = sin ((double) p);
      p_re = 1.0; p_im = 0.0;		/* init. phase */
      i = k = 0; do {
        /* mix to table */
        y[i].re += a * (x[k].re * (MYFLT) p_re - x[k].im * (MYFLT) p_im);
        y[i].im += a * (x[k].im * (MYFLT) p_re + x[k].re * (MYFLT) p_im);
        /* update phase */
        ptmp = p_re * d_re - p_im * d_im;
        p_im = p_im * d_re + p_re * d_im;
        p_re = ptmp;
        i += n; k++;
      } while ((i <= (l1 >> 1)) && (k <= (l2 >> 1)));
    }
  }
  /* write dest. table */
  if (y != NULL) {
    ex = AssignBasis (NULL, l1);
    FFT2torlpacked (y, l1, FL(1.0), ex);
    for (i = 0; i < l1; i++) {
      ftp->ftable[i] += y[i >> 1].re; i++;
      ftp->ftable[i] += y[i >> 1].im;
    }
    ftp->ftable[l1] += y[0].re;		/* write guard point */
    mfree (x);				/* free tmp memory */
    mfree (y);
  }
  mfree (pnum);
}

