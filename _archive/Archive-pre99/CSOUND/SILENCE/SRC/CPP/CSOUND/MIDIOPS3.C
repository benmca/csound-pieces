/* sliders and other MIDI opcodes by Gabriel Maldonado */

#include "cs.h"
#include "midiops.h"
#include "midiops3.h"
#include <math.h>

#define f7bit           (FL(127.0))
#define oneTOf7bit      (MYFLT)(1./127.)
#define f14bit          (FL(16383.0))
#define oneTOf14bit     (MYFLT)(1/16383.)
#define f21bit          (FL(2097151.0))
#define oneTOf21bit     (MYFLT)(1/2097151.)

extern MCHNBLK *m_chnbp[16];

/* This set of macros is rather a cop-out! */
#define SLIDERI_INIT(p, n)                                        \
{                                                                 \
    unsigned char chan = p->slchan = (unsigned char)((*p->ichan)-1); \
    char sbuf[120];                                               \
    if (chan  > 15)  {                                            \
      initerror(Str(X_840,"illegal channel"));                    \
      return;                                                     \
    }                                                             \
    {                                                             \
      MYFLT value;                                                \
      int j = 0;                                                  \
      SLD *sld = p->s;                                            \
      unsigned char *slnum = p->slnum;                            \
      MYFLT *min = p->min, *max= p->max;                          \
      FUNC **ftp = p->ftp;                                        \
      MYFLT *chanblock = (MYFLT *) m_chnbp[chan]->ctl_val;        \
      while (j++ < n) {                                           \
      *slnum = (unsigned char) *sld->ictlno;                      \
        if (*slnum > 127) {                                       \
          sprintf(sbuf,                                           \
                  Str(X_843,"illegal control number at position n.%d"), j); \
          initerror(sbuf);                                        \
          break;                                                  \
        }                                                         \
        if ((value=*sld->initvalue) < (*min=*sld->imin) ||        \
            value > (*max=*sld->imax) ) {                         \
          sprintf(sbuf,                                           \
                  Str(X_856,"illegal initvalue at position n.%d"),\
                  j);                                             \
          initerror(sbuf);                                        \
          break;                                                  \
        }                                                         \
        if (*sld->ifn > 0)   *ftp++ = ftfind(sld->ifn);           \
        else                 *ftp++ = NULL;                       \
        value =  (*(sld++)->initvalue - *min) / (*max++ - *min);  \
        min++;                                                    \
        chanblock[*slnum++] =  (MYFLT)((int)(value * f7bit + FL(0.5)));\
      }                                                           \
    }                                                             \
}

#define SLIDER_INIT(p, n)                                         \
{                                                                 \
    MYFLT value;                                                  \
    int j = 0;                                                    \
    FUNC **ftp = p->ftp-1;                                        \
    MYFLT *chanblock = (MYFLT *) m_chnbp[p->slchan]->ctl_val;     \
    unsigned char  *slnum = p->slnum;                             \
    MYFLT *min = p->min, *max = p->max;                           \
    MYFLT **result = p->r;                                        \
    while (j++ < n) {                                             \
      value = (MYFLT) (chanblock[*slnum++] * oneTOf7bit);         \
      if (*(++ftp))             /* if valid ftable,use value as index   */  \
        value = *((*ftp)->ftable + (long)(value * (*ftp)->flen)); \
                                /* no interpolation */            \
      **result++ = value * (*max++ - *min) + *min;   /* scales the output */ \
      min++;;                                                     \
    }                                                             \
}


/*--------------------------------------------------------*/

void slider_i8(SLIDER8 *p)
{
    SLIDERI_INIT(p, 8);
}


void slider8(SLIDER8 *p)
{
    SLIDER_INIT(p, 8);
}

void slider_i16(SLIDER16 *p)
{
    SLIDERI_INIT(p, 16);
}


void slider16(SLIDER16 *p)
{
    SLIDER_INIT(p, 16);
}

void slider_i32(SLIDER32 *p)
{
    SLIDERI_INIT(p, 32);
}


void slider32(SLIDER32 *p)
{
    SLIDER_INIT(p, 32);
}

void slider_i64(SLIDER64 *p)
{
    SLIDERI_INIT(p, 64);
}

void slider64(SLIDER64 *p)
{
    SLIDER_INIT(p, 64);
}


/*==============================*/
#define SLIDERIF(p, n)                                            \
{                                                                 \
    unsigned char chan = p->slchan = (unsigned char)((*p->ichan)-1); \
    char sbuf[120];                                               \
    if (chan  > 15)  {                                            \
      initerror(Str(X_840,"illegal channel"));                    \
      return;                                                     \
    }                                                             \
    {                                                             \
      MYFLT value;                                                \
      int j = 0;                                                  \
      SLDf *sld = p->s;                                           \
      unsigned char *slnum = p->slnum;                            \
      MYFLT *min = p->min, *max= p->max;                          \
      FUNC **ftp = p->ftp;                                        \
      MYFLT     b;                                                \
      MYFLT *yt1 = p->yt1, *c1=p->c1, *c2=p->c2;                  \
      MYFLT *chanblock = (MYFLT *) m_chnbp[chan]->ctl_val;        \
      while (j++ < 8) {                                           \
      *slnum = (unsigned char) *sld->ictlno;                      \
        if (*slnum > 127) {                                       \
          sprintf(sbuf,                                           \
                  Str(X_843,"illegal control number at position n.%d"), j); \
          initerror(sbuf);                                        \
          break;                                                  \
        }                                                         \
        if ((value=*sld->initvalue) < (*min=*sld->imin) ||        \
            value > (*max=*sld->imax) ) {                         \
          sprintf(sbuf,                                           \
                  Str(X_856,"illegal initvalue at position n.%d"), j); \
          initerror(sbuf);                                        \
          break;                                                  \
        }                                                         \
        if (*sld->ifn > 0)   *ftp++ = ftfind(sld->ifn);           \
        else                 *ftp++ = NULL;                       \
        value =  (*sld->initvalue - *min) / (*max++ - *min);      \
        min++;;                                                   \
        chanblock[*slnum++] =  (MYFLT)(int)(value * f7bit + .5);  \
                                                                  \
                /*----- init filtering coeffs*/                   \
        *yt1++ = FL(0.0);                                            \
        b = (MYFLT)(2.0 - cos((double)(*(sld++)->ihp * tpidsr * ksmps))); \
        *c2 = (MYFLT)(b - sqrt((double)(b * b - FL(1.0))));       \
        *c1++ = FL(1.0) - *c2++;                                  \
      }                                                           \
    }                                                             \
}

#define SLIDERF(p, n)                                             \
{                                                                 \
    MYFLT value;                                                  \
    int j = 0;                                                    \
    FUNC **ftp = p->ftp-1;                                        \
    MYFLT *chanblock = (MYFLT *) m_chnbp[p->slchan]->ctl_val;     \
    unsigned char  *slnum = p->slnum;                             \
    MYFLT *min = p->min, *max = p->max;                           \
    MYFLT **result = p->r;                                        \
    MYFLT *yt1 = p->yt1, *c1=p->c1, *c2=p->c2;                    \
    while (j++ < n) {                                             \
      value = chanblock[*slnum++] * oneTOf7bit;                   \
      if (*(++ftp))    /* if valid ftable,use value as index   */ \
        value = *( (*ftp)->ftable + (long)(value * (*ftp)->flen));\
      value = value * (*max++ - *min) + *min; /* scales the output */ \
      min++;                                                      \
      **result++ =                                                \
        *yt1++ = *c1++ * value + *c2++ * *yt1; /* filters the output */ \
    }                                                             \
}

void slider_i8f(SLIDER8f *p)
{
    SLIDERIF(p, 8);
}

void slider8f(SLIDER8f *p)
{
    SLIDERF(p, 8);
}

void slider_i16f(SLIDER16f *p)
{
    SLIDERIF(p, 16);
}

void slider16f(SLIDER16f *p)
{
    SLIDERF(p, 16);
}

void slider_i32f(SLIDER32f *p)
{
    SLIDERIF(p, 32);
}

void slider32f(SLIDER32f *p)
{
    SLIDERF(p, 32);
}


void slider_i64f(SLIDER64f *p)
{
    SLIDERIF(p, 64);
}

void slider64f(SLIDER64f *p)
{
    SLIDERF(p, 64);
}

/*===================================*/

#define ISLIDER(p, n)                                             \
{                                                                 \
    unsigned char chan= (unsigned char) ((*p->ichan)-1);          \
    char sbuf[120];                                               \
    if (chan  > 15)  {                                            \
      initerror(Str(X_840,"illegal channel"));                    \
      return;                                                     \
    }                                                             \
    {                                                             \
      MYFLT value;                                                \
      int j = 0;                                                  \
      ISLD *sld = p->s;                                           \
      unsigned char slnum;                                        \
      MYFLT *chanblock = (MYFLT *) m_chnbp[chan]->ctl_val;        \
      FUNC *ftp;                                                  \
      MYFLT **result = p->r;                                      \
                                                                  \
      while (j++ < n) {                                           \
        slnum=(unsigned char) *sld->ictlno;                       \
        if (slnum > 127) {                                        \
          sprintf(sbuf, Str(X_843,"illegal control number at position n.%d"), j); \
          initerror(sbuf);                                        \
          break;                                                  \
        }                                                         \
        value = chanblock[slnum] * oneTOf7bit;                    \
        if (*sld->ifn > 0)  {                                     \
          ftp = ftfind(sld->ifn);                                 \
          value = *( ftp->ftable + (long)(value * ftp->flen));    \
                                /* no interpolation */            \
        }                                                         \
        **result++ = value * (*sld->imax - *sld->imin) + *sld->imin;   /* scales the output */ \
        sld++;                                                    \
      }                                                           \
    }                                                             \
}


void islider8(ISLIDER8 *p)
{
    ISLIDER(p, 8);
}

void islider16(ISLIDER16 *p)
{
    ISLIDER(p, 16);
}

void islider32(ISLIDER32 *p)
{
    ISLIDER(p, 32);
}

void islider64(ISLIDER64 *p)
{
    ISLIDER(p, 64);
}



/*-------------------------------*/

#define SLIDERI14(p, n)                                                \
{                                                                      \
    unsigned char chan= p->slchan = (unsigned char)((*p->ichan)-1);    \
    char sbuf[120];                                                    \
    if (chan  > 15)  {                                                 \
      initerror(Str(X_840,"illegal channel"));                         \
      return;                                                          \
    }                                                                  \
    {                                                                  \
      MYFLT value;                                                     \
      int intvalue, j = 0;                                             \
      SLD14 *sld = p->s;                                               \
      unsigned char *slnum_msb = p->slnum_msb;                         \
      unsigned char *slnum_lsb = p->slnum_lsb;                         \
      MYFLT *min = p->min, *max= p->max;                               \
      FUNC **ftp = p->ftp;                                             \
      MYFLT *chanblock = (MYFLT *) m_chnbp[chan]->ctl_val;             \
                                                                       \
      while (j++ < n) {                                                \
        *slnum_msb = (unsigned char)*sld->ictlno_msb;                  \
        if (*slnum_msb > 127) {                                        \
          sprintf(sbuf,                                                \
                  Str(X_872,"illegal msb control number at position n.%d"), \
                  j);                                                  \
          initerror(sbuf);                                             \
          break;                                                       \
        }                                                              \
        *slnum_lsb = (unsigned char)*sld->ictlno_lsb;                  \
        if (*slnum_lsb > 127) {                                        \
          sprintf(sbuf,                                                \
                  Str(X_868,"illegal lsb control number at position n.%d"), \
                  j);                                                  \
          initerror(sbuf);                                             \
          break;                                                       \
        }                                                              \
        if ((value=*sld->initvalue) < (*min=*sld->imin) ||             \
            value > (*max=*sld->imax) ) {                              \
          sprintf(sbuf,                                                \
                  Str(X_856,"illegal initvalue at position n.%d"), j); \
          initerror(sbuf);                                             \
          break;                                                       \
        }                                                              \
        if (*sld->ifn > 0)   *ftp++ = ftfind(sld->ifn);                \
        else                 *ftp++ = NULL;                            \
        intvalue = (int) (((*(sld++)->initvalue - *min) / (*max++ - *min)) \
                          * f14bit+FL(0.5));                           \
        min++;                                                         \
        chanblock[*slnum_msb++] =  (MYFLT) (intvalue >> 7);            \
        chanblock[*slnum_lsb++] =  (MYFLT) (intvalue & 0x7f);          \
      }                                                                \
    }                                                                  \
}

#define SLIDER14(p, n)                                                 \
{                                                                      \
    MYFLT value;                                                       \
    int j = 0;                                                         \
    FUNC **ftp = p->ftp-1;                                             \
    MYFLT *chanblock = (MYFLT *) m_chnbp[p->slchan]->ctl_val;          \
    unsigned char  *slnum_msb = p->slnum_msb;                          \
    unsigned char  *slnum_lsb = p->slnum_lsb;                          \
    MYFLT *min = p->min, *max = p->max;                                \
    MYFLT **result = p->r;                                             \
                                                                       \
    while (j++ < n) {                                                  \
      value = (MYFLT)((chanblock[*slnum_msb++]  * 128                  \
                       + chanblock[*slnum_lsb++]) * oneTOf14bit);      \
      if (*(++ftp)) {      /* if valid ftable,use value as index   */  \
        MYFLT phase = value * (*ftp)->flen;                            \
        MYFLT *base = (*ftp)->ftable + (long)(phase);                  \
        value = *base + (*(base+1) - *base) * (phase - (long) phase);  \
      }                                                                \
      **result++ = value * (*max++ - *min) + *min; /* scales the output */ \
      min++;                                                           \
    }                                                                  \
}

void slider_i16bit14(SLIDER16BIT14 *p)
{
    SLIDERI14(p, 16);
}

void slider16bit14(SLIDER16BIT14 *p)
{
    SLIDER14(p, 16);
}

void slider_i32bit14(SLIDER32BIT14 *p)
{
    SLIDERI14(p, 32);
}


void slider32bit14(SLIDER32BIT14 *p)
{
    SLIDER14(p, 32);
}

/*--------------------------------*/
#define ISLIDER14(p, n)                                                \
{                                                                      \
    unsigned char chan = (unsigned char)((*p->ichan)-1);               \
    char sbuf[120];                                                    \
    if (chan  > 15)  {                                                 \
      initerror(Str(X_840,"illegal channel"));                         \
      return;                                                          \
    }                                                                  \
    {                                                                  \
      MYFLT value;                                                     \
      int j = 0;                                                       \
      ISLD14 *sld = p->s;                                              \
      unsigned char slnum_msb;                                         \
      unsigned char slnum_lsb;                                         \
      MYFLT *chanblock = (MYFLT *) m_chnbp[chan]->ctl_val;             \
      MYFLT **result = p->r;                                           \
                                                                       \
      while (j++ < n) {                                                \
        slnum_msb=(unsigned char)*sld->ictlno_msb;                     \
        if (slnum_msb > 127) {                                         \
          sprintf(sbuf,                                                \
                  Str(X_872,"illegal msb control number at position n.%d"), \
                  j);                                                  \
          initerror(sbuf);                                             \
          break;                                                       \
        }                                                              \
        slnum_lsb=(unsigned char)*sld->ictlno_lsb;                     \
        if (slnum_lsb > 127) {                                         \
          sprintf(sbuf,                                                \
                  Str(X_868,"illegal lsb control number at position n.%d"), \
                  j);                                                  \
          initerror(sbuf);                                             \
          break;                                                       \
        }                                                              \
                                                                       \
        value = (MYFLT)((chanblock[slnum_msb]  * 128                   \
                         + chanblock[slnum_lsb]) * oneTOf14bit);       \
        if (*sld->ifn > 0) {    /* linear interpolation routine */     \
          FUNC *ftp= ftfind(sld->ifn);                                 \
          MYFLT phase = value * ftp->flen;                             \
          MYFLT *base = ftp->ftable + (long)(phase);                   \
          value = *base + (*(base + 1) - *base) * (phase - (long) phase); \
        }                                                              \
                                /* scales the output */                \
        **result++ = value * (*sld->imax - *sld->imin) + *sld->imin;   \
        sld++;                                                         \
      }                                                                \
    }                                                                  \
}

void islider16bit14(ISLIDER16BIT14 *p)
{
    ISLIDER14(p, 16);
}

void islider32bit14(ISLIDER32BIT14 *p)
{
    ISLIDER14(p, 16);
}
