typedef struct{
  OPDS          h;
  MYFLT         *out, *as, *af, *len, *ovlp, *iwin, *bias;
  AUXCH         mem;
  MYFLT         *buffer_in1, *buffer_in2, *buffer_out;
  FUNC          *win;
  MYFLT         *in1, *in2, *w;
  long          m, count;
  MYFLT         s_ovlp;
} CON;

/* typedef struct{ */
/*   OPDS               h; */
/*   MYFLT              *out, *as, *imp, *iwin, *ienv; */
/*   AUXCH              mem; */
/*   MYFLT              *buffer_in, *buffer_out; */
/*   FUNC               *win; */
/*   MYFLT              *in, *in2, norm; */
/*   long               flen, count, count2; */
/* } CNV; */

/* typedef struct{ */
/*   OPDS               h; */
/*   MYFLT              *out, *as, *str, *len, *ovlp, *iwin; */
/*   AUXCH              mem; */
/*   MYFLT              *buffer_in, *buffer_out; */
/*   FUNC               *win; */
/*   MYFLT              *in; */
/*   long               m, count; */
/* } STCH; */

/* typedef struct{ */
/*   OPDS               h; */
/*   MYFLT              *out, *as, *af, *len, *ovlp, *iwin, *bias, *peaks; */
/*   AUXCH              mem; */
/*   MYFLT              *buffer_in, *buffer_in2, *buffer_out; */
/*   FUNC               *win; */
/*   MYFLT              *in, *in2, *mor; */
/*   long               *clx, *cly; */
/*   long               m, count; */
/* } MRH; */

void getmag(MYFLT *x, long size);
void makepolar(MYFLT *x, long size);
void makerect(MYFLT *x, long size);
void makelog(MYFLT *x, long size);
void unlog(MYFLT *x, long size);
void scalemod(MYFLT *y, long size);
void scalemag(MYFLT *x, long size);
void mult(MYFLT *x, MYFLT *y, long size, MYFLT w);
void lineaprox(MYFLT *x, long size, long m);
long plog2(long x);
void do_fht(MYFLT *real, long n);
void do_ifht(MYFLT *real, long n);
void pfht(MYFLT *fz, long n);
