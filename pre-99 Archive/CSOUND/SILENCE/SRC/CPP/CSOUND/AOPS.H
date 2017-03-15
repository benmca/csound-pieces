/*                                                                              AOPS.H          */

typedef struct {
        OPDS    h;
        MYFLT   *r, *a;
} ASSIGN;

typedef struct {
        OPDS    h;
        int     *rbool;
        MYFLT   *a, *b;
} RELAT;

typedef struct {
        OPDS    h;
        int     *rbool, *ibool, *jbool;
} LOGCL;

typedef struct {
        OPDS    h;
        MYFLT   *r;
        int     *cond;
        MYFLT   *a, *b;
} CONVAL;

typedef struct {
        OPDS    h;
        MYFLT   *r, *a, *b;
} AOP;

typedef struct {
        OPDS    h;
        MYFLT   *r, *a, *b, *def;
} DIVZ;

typedef struct {
        OPDS    h;
        MYFLT   *r, *a;
} EVAL;

typedef struct {
        OPDS    h;
        MYFLT   *ar;
} IN;

typedef struct {
        OPDS    h;
        MYFLT   *ar1, *ar2;
} INS;

typedef struct {
        OPDS    h;
        MYFLT   *ar1, *ar2, *ar3, *ar4;
} INQ;

typedef struct {
        OPDS    h;
        MYFLT   *ar1, *ar2, *ar3, *ar4, *ar5, *ar6;
} INH;

typedef struct {
        OPDS    h;
        MYFLT   *ar1, *ar2, *ar3, *ar4, *ar5, *ar6, *ar7, *ar8;
} INO;

typedef struct {
        OPDS    h;
        MYFLT   *ar[VARGMAX];
} INALL;

typedef struct {
        OPDS    h;
        MYFLT   *ar;
        MYFLT   *ch;
} INCH;

typedef struct {
        OPDS    h;
        MYFLT   *asig;
} OUT;

typedef struct {
        OPDS    h;
        MYFLT   *asig1, *asig2;
} OUTS;

typedef struct {
        OPDS    h;
        MYFLT   *asig1, *asig2, *asig3, *asig4;
} OUTQ;

typedef struct {
        OPDS    h;
        MYFLT   *asig1, *asig2, *asig3, *asig4, *asig5, *asig6;
} OUTH;

typedef struct {
        OPDS    h;
        MYFLT   *asig1, *asig2, *asig3, *asig4, *asig5, *asig6, *asig7, *asig8;
} OUTO;

typedef struct {
        OPDS    h;
        MYFLT   *asig[VARGMAX];
} OUTX;

typedef struct {
        OPDS    h;
        MYFLT   *args[VARGMAX];
} OUTCH;

typedef struct {
        OPDS    h;
        MYFLT   *ndx;
} IOZ;

typedef struct {
        OPDS    h;
        MYFLT   *r, *pc, *et, *cy, *ref;
} XENH;

typedef struct {
        OPDS   h;
        MYFLT *r, *ktrig, *kinput, *tablenum;
        MYFLT old_r;
} CPSTUN;


typedef struct {
        OPDS   h;
        MYFLT *r, *input, *tablenum;
} CPSTUNI;


