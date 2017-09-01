
typedef struct {
        OPDS    h;
        MYFLT   *ar, *asig, *kfco, *kres, *istor;
        MYFLT   ynm1, ynm2;
        MYFLT   coef1, coef2, okf, okr;
} LOWPR;


typedef struct {
        OPDS    h;
        MYFLT   *ar, *asig, *kfco, *kres, *ord, *istor;
        MYFLT   ynm1[10], ynm2[10] ;
        int     loop;
        MYFLT   coef1, coef2, okf, okr;
} LOWPRX;

typedef struct {
        OPDS    h;
        MYFLT   *ar, *asig, *kfco, *kres, *ord, *sep;
        MYFLT   ynm1[10], ynm2[10], cut[10];
        int     loop;
} LOWPR_SEP;
