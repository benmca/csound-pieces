							/* biquad.h */


				/* Structure for biquadratic filter */
typedef struct {
    OPDS    h;
    MYFLT   *out, *in, *b0, *b1, *b2, *a0, *a1, *a2, *reinit;
    MYFLT   xnm1, xnm2, ynm1, ynm2;
} BIQUAD;

				/* Structure for moogvcf filter */
typedef struct {
    OPDS    h;
    MYFLT   *out, *in, *fco, *res, *max;
    MYFLT   xnm1, y1nm1, y2nm1, y3nm1, y1n, y2n, y3n, y4n;
    short   fcocod, rezcod;
} MOOGVCF;

				/* Structure for rezzy filter */
typedef struct {
    OPDS    h;
    MYFLT *out, *in, *fco, *rez, *mode;
    MYFLT   xnm1, xnm2, ynm1, ynm2;
    short   fcocod, rezcod;
} REZZY;

                                /* Structure for distortion */
typedef struct {
    OPDS    h;
    MYFLT   *out, *in, *pregain, *postgain, *shape1, *shape2;
} DISTORT;

                                /* Structure for vco, analog modeling opcode */
typedef struct {
    OPDS    h;
    MYFLT   *ar, *xamp, *xcps, *wave, *pw, *sine, *maxd;
    MYFLT   ynm1, ynm2, leaky;
    short   ampcod, cpscod;
    int     iphs;
    long    lphs;
    FUNC    *ftp;
 /* Insert VDelay here */
    AUXCH   aux;
 /* AUXCH   auxd; */
    long    left;
 /* End VDelay insert  */
} VCO;

typedef struct {
    OPDS    h;
    MYFLT   *outx, *outy, *outz, *mass1, *mass2, *sep, *xval, *yval, *zval;
    MYFLT   *vxval, *vyval, *vzval, *delta, *fric;
    MYFLT   s1z, s2z, friction;
    MYFLT   x, y, z, vx, vy, vz, ax, ay, az, hstep;
} PLANET;

typedef struct {
    OPDS h;
    MYFLT *out, *in, *fc, *v, *q, *mode;
    MYFLT xnm1, xnm2, ynm1, ynm2, imode;
} PAREQ;

typedef struct {
    OPDS    h;
    MYFLT   *out, *in, *mode, *maxdel, *del1, *gain1, *del2, *gain2;
    MYFLT   *del3, *gain3, *istor;
    MYFLT   *curp, out1, out2, out3;
    MYFLT   *beg1p, *beg2p, *beg3p, *end1p, *end2p, *end3p;
    MYFLT   *del1p, *del2p, *del3p;
    long    npts;
    AUXCH   auxch;
} NESTEDAP;

typedef struct {
    OPDS    h;
    MYFLT   *outx, *outy, *outz, *s, *r, *b, *hstep, *inx, *iny, *inz, *skip;
    MYFLT   valx, valy, valz;
} LORENZ;

/* And also opcodes of  Jens Groh, Munich, Germany.   mail: groh@irt.de */

// typedef double NLALP_MYFLT_TYPE;
// typedef struct { /* for nlalp opcode */
//    OPDS h; /* header */
//    MYFLT *aresult; /* resulting signal */
//    MYFLT *ainsig; /* input signal */
//    MYFLT *klfact; /* linear factor */
//    MYFLT *knfact; /* nonlinear factor */
//    MYFLT *istor; /* initial storage disposition */
//    MYFLT *iupdm; /* coefficient update mode */
// 
//    NLALP_MYFLT_TYPE m0; /* energy storage */
//    NLALP_MYFLT_TYPE m1; /* energy storage */
//    MYFLT sto_lfact; /* stored linear factor */
//    MYFLT sto_nfact; /* stored nonlinear factor */
//    MYFLT updm; /* coefficient update mode */
// } NLALP;

/* Structure for tbvcf filter */
typedef struct {
    OPDS    h;
    MYFLT   *out, *in, *fco, *res, *dist, *asym;
    MYFLT   y, y1, y2;
    short   fcocod, rezcod;
} TBVCF;

