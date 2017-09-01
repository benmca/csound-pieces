/* Resonant Lowpass filters by G.Maldonado */

#include <math.h>
#include "cs.h"
#include "lowpassr.h"

void lowpr_set(LOWPR *p)
{
    if (*p->istor==FL(0.0))
      p->ynm1 = p->ynm2 = FL(0.0);
    p->okf = FL(0.0);
    p->okr = FL(0.0);
}

void lowpr(LOWPR *p)
{
    MYFLT b, k;
    MYFLT *ar, *asig, yn, ynm1, ynm2 ;
    MYFLT kfco = *p->kfco;
    MYFLT kres = *p->kres;
    MYFLT coef1 = p->coef1, coef2 = p->coef2;
    int nsmps = ksmps;

    if (p->okf != kfco || p->okr != kres) { /* Only if changed */
      b = FL(10.0) / (*p->kres * (MYFLT)sqrt((double)kfco)) - FL(1.0);
      k = FL(1000.0) / kfco;
      p->coef1 = coef1 = (b+FL(2.0) * k);
      p->coef2 = coef2 = FL(1.0)/(FL(1.0) + b + k);
    }
    ar = p->ar;
    asig = p->asig;
    ynm1 = p->ynm1;
    ynm2 = p->ynm2;

    do {
      *ar++ = yn = (coef1 * ynm1 - k * ynm2 + *asig++) * coef2;
      ynm2 = ynm1;
      ynm1 =  yn;
    } while (--nsmps);
    p->ynm1 = ynm1;
    p->ynm2 = ynm2;             /* And save */

}

void lowpr_setx(LOWPRX *p)
{
    int j;
    if ((p->loop = (int) (*p->ord + FL(0.5))) < 1) p->loop = 4; /*default value*/
    else if (p->loop > 10)
      initerror(Str(X_878,"illegal order num. (min 1, max 10)"));

    if (*p->istor!= 0)
      for (j=0; j< p->loop; j++)  p->ynm1[j] = p->ynm2[j] = FL(0.0);

}

void lowprx(LOWPRX *p)
{
    MYFLT b, k;
    MYFLT *ar, *asig, yn,*ynm1, *ynm2 ;
    MYFLT coef1 = p->coef1, coef2 = p->coef2;
    MYFLT kfco = *p->kfco, kres = *p->kres;
    int nsmps, j;

    if (p->okf != kfco || p->okr != kres) { /* Only if changed */
      b = FL(10.0) / (*p->kres * (MYFLT)sqrt((double)kfco)) - FL(1.0);
      k = FL(1000.0) / kfco;
      p->coef1 = coef1 = (b+FL(2.0) * k);
      p->coef2 = coef2 = FL(1.0)/(FL(1.0) + b + k);
    }

    ynm1 = p->ynm1;
    ynm2 = p->ynm2;
    asig = p->asig;

    for (j=0; j< p->loop; j++) {
      nsmps = ksmps;
      ar = p->ar;

      do {
        *ar++ = yn = (coef1 * *ynm1 - k * *ynm2 + *asig++) * coef2;
        *ynm2 = *ynm1;
        *ynm1 = yn;
      } while (--nsmps);
      ynm1++;
      ynm2++;
      asig= p->ar;
    }
}


void lowpr_w_sep_set(LOWPR_SEP *p)
{
    int j;
    if ((p->loop = (int) (*p->ord + 0.5)) < 1) p->loop = 4; /*default value*/
    else if (p->loop > 10)
      initerror(Str(X_878,"illegal order num. (min 1, max 10)"));

    for (j=0; j< p->loop; j++)  p->ynm1[j] = p->ynm2[j] = FL(0.0);
}

void lowpr_w_sep(LOWPR_SEP *p)
{
    MYFLT b, k;
    MYFLT *ar, *asig, yn,*ynm1, *ynm2 ;
    MYFLT coef1, coef2;
    MYFLT kfcobase = *p->kfco;
    MYFLT sep = (*p->sep / p->loop);
    int nsmps, j;

    MYFLT kres = *p->kres;
    MYFLT kfco;
    ynm1 = p->ynm1;
    ynm2 = p->ynm2;
    asig = p->asig;

    for (j=0; j< p->loop; j++) {
                /*
                linfco=log((double) kfco)*ONEtoLOG2     ;
                linfco = linfco + (sep / p->loop)*j;
                kfco = (MYFLT) pow(2.0,linfco);
                */
      kfco = kfcobase * (FL(1.0) + (sep * j));

      b = FL(10.0) / ( kres * (MYFLT)sqrt((double)kfco)) - FL(1.0);
      k = FL(1000.0) / kfco;
      coef1 = (b+FL(2.0) *k);
      coef2 = FL(1.0)/(FL(1.0) + b + k);

      nsmps = ksmps;
      ar = p->ar;
      do {                      /* This can be speeded up avoiding indirection */
        *ar++ = yn = (coef1 * *ynm1 - k * *ynm2 + *asig++) * coef2;
        *ynm2 = *ynm1;
        *ynm1 =  yn;
      } while (--nsmps);
      ynm1++;
      ynm2++;
      asig= p->ar;
    }
}

