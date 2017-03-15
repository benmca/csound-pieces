#include "cs.h"                                      /*  DUMPF.C  */
#include "dumpf.h"
#include <ctype.h>

extern int  openout(char *, int);
extern char *retfilnam;

void kdmpset(KDUMP *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
        if ((p->fdch.fd = openout(p->STRARG, 1)) < 0) {
            sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
            initerror(errmsg);
            return;
        }
        fdrecord(&p->fdch);
        if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
            initerror(Str(X_1335,"unknown format request"));
        if (p->format == 2 || p->format == 3)
            initerror(Str(X_587,"alaw and ulaw not implemented here"));
        if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
            p->timcount = 1;
        p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
}

void kdmp2set(KDUMP2 *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
        if ((p->fdch.fd = openout(p->STRARG, 1)) < 0) {
            sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
            initerror(errmsg);
            return;
        }
        fdrecord(&p->fdch);
        if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
            initerror(Str(X_1335,"unknown format request"));
        if (p->format == 2 || p->format == 3)
            initerror(Str(X_587,"alaw and ulaw not implemented here"));
        if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
            p->timcount = 1;
        p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
}

void kdmp3set(KDUMP3 *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
        if ((p->fdch.fd = openout(p->STRARG, 1)) < 0) {
            sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
            initerror(errmsg);
            return;
        }
        fdrecord(&p->fdch);
        if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
            initerror(Str(X_1335,"unknown format request"));
        if (p->format == 2 || p->format == 3)
            initerror(Str(X_587,"alaw and ulaw not implemented here"));
        if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
            p->timcount = 1;
        p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
}

void kdmp4set(KDUMP4 *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
        if ((p->fdch.fd = openout(p->STRARG, 1)) < 0) {
            sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
            initerror(errmsg);
            return;
        }
        fdrecord(&p->fdch);
        if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
            initerror(Str(X_1335,"unknown format request"));
        if (p->format == 2 || p->format == 3)
            initerror(Str(X_587,"alaw and ulaw not implemented here"));
        if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
            p->timcount = 1;
        p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
}

/*  void old_kdmpset(KDUMP *p) */
/*  { */
/*    printf(Str(X_424,"Please use dumpk rather than kdump\n")); kdmpset(p); */
/*  } */
/*  void old_kdmp2set(KDUMP2 *p) */
/*  { */
/*    printf(Str(X_425,"Please use dumpk2 rather than kdump2\n")); kdmp2set(p); */
/*  } */
/*  void old_kdmp3set(KDUMP3 *p) */
/*  { */
/*    printf(Str(X_426,"Please use dumpk3 rather than kdump3\n")); kdmp3set(p); */
/*  } */
/*  void old_kdmp4set(KDUMP4 *p) */
/*  { */
/*    printf(Str(X_427,"Please use dumpk4 rather than kdump4\n")); kdmp4set(p); */
/*  } */

static MYFLT kval[4];     /* handle up to four ksig arguments */

static void nkdump(int ofd, int format, int nk)
{
    char  outbuf[80];
    int   len;
    MYFLT *kp = kval;

    switch(format) {               /* place formatted kvals into outbuf */
    case 1: {
        char *bp = outbuf;
        len = nk;
        while (nk--)
            *bp++ = (char)(*kp++ / FL(256.0));
        break;
    }
    case 4: {
        short *bp = (short *) outbuf;
        len = nk * sizeof(short);
        while (nk--)
            *bp++ = (short) *kp++;
        break;
    }
    case 5: {
        long *bp = (long *) outbuf;
        len = nk * sizeof(long);
        while (nk--)
            *bp++ = (long) *kp++;
        break;
    }
    case 6: {
        MYFLT *bp = (MYFLT *) outbuf;
        len = nk * sizeof(MYFLT);
        while (nk--)
            *bp++ = *kp++;
        break;
    }
    case 7:
        *outbuf = '\0';
        while (--nk) {
            sprintf(errmsg,"%ld\t", (long) *kp++);
            strcat(outbuf, errmsg);
        }
        sprintf(errmsg,"%ld\n", (long) *kp);
        strcat(outbuf, errmsg);
        len = strlen(outbuf);
        break;
    case 8: *outbuf = '\0';
        while (--nk) {
            sprintf(errmsg,"%6.4f\t", *kp++);
            strcat(outbuf, errmsg);
        }
        sprintf(errmsg,"%6.4f\n", *kp);
        strcat(outbuf, errmsg);
        len = strlen(outbuf);
        break;
    default: die(Str(X_1337,"unknown kdump format"));
    }
    write(ofd, outbuf, len);            /* now write the buffer */
}

void kdump(KDUMP *p)
{
    if (--p->countdown <= 0) {
        p->countdown = p->timcount;
        kval[0] = *p->ksig;
        nkdump(p->fdch.fd, p->format, 1);
    }
}

void kdump2(KDUMP2 *p)
{
    if (--p->countdown <= 0) {
        p->countdown = p->timcount;
        kval[0] = *p->ksig1;
        kval[1] = *p->ksig2;
        nkdump(p->fdch.fd, p->format, 2);
    }
}

void kdump3(KDUMP3 *p)
{
    if (--p->countdown <= 0) {
        p->countdown = p->timcount;
        kval[0] = *p->ksig1;
        kval[1] = *p->ksig2;
        kval[2] = *p->ksig3;
        nkdump(p->fdch.fd, p->format, 3);
    }
}

void kdump4(KDUMP4 *p)
{
    if (--p->countdown <= 0) {
        p->countdown = p->timcount;
        kval[0] = *p->ksig1;
        kval[1] = *p->ksig2;
        kval[2] = *p->ksig3;
        kval[3] = *p->ksig4;
        nkdump(p->fdch.fd, p->format, 4);
    }
}


/* ******************************************************************** */
/* ******** READK and friends; new code 1999 Feb 14 by JPff    ******** */
/* ******************************************************************** */
extern int openin(char*);

void krdset(KREAD *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
      if ((p->fdch.fd = openin(p->STRARG)) < 0) {
        sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
        initerror(errmsg);
        return;
      }
      fdrecord(&p->fdch);
      if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
        initerror(Str(X_1335,"unknown format request"));
      if (p->format == 2 || p->format == 3)
        initerror(Str(X_587,"alaw and ulaw not implemented here"));
      if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
        p->timcount = 1;
      p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
    p->k[0] = p->k[1] = p->k[2] = p->k[3] = FL(0.0);
}

void krd2set(KREAD2 *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
      if ((p->fdch.fd = openin(p->STRARG)) < 0) {
        sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
        initerror(errmsg);
        return;
      }
      fdrecord(&p->fdch);
      if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
        initerror(Str(X_1335,"unknown format request"));
      if (p->format == 2 || p->format == 3)
        initerror(Str(X_587,"alaw and ulaw not implemented here"));
      if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
        p->timcount = 1;
      p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
    p->k[0] = p->k[1] = p->k[2] = p->k[3] = FL(0.0);
}

void krd3set(KREAD3 *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
      if ((p->fdch.fd = openin(p->STRARG)) < 0) {
        sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
        initerror(errmsg);
        return;
      }
      fdrecord(&p->fdch);
      if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
        initerror(Str(X_1335,"unknown format request"));
      if (p->format == 2 || p->format == 3)
        initerror(Str(X_587,"alaw and ulaw not implemented here"));
      if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
        p->timcount = 1;
      p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
    p->k[0] = p->k[1] = p->k[2] = p->k[3] = FL(0.0);
}

void krd4set(KREAD4 *p)
{
    if (*p->ifilcod == sstrcod) {       /* open in curdir or pathname */
      if ((p->fdch.fd = openin(p->STRARG)) < 0) {
        sprintf(errmsg,Str(X_210,"Cannot open %s"), retfilnam);
        initerror(errmsg);
        return;
      }
      fdrecord(&p->fdch);
      if ((p->format = (int)*p->iformat) < 1 || p->format > 8)
        initerror(Str(X_1335,"unknown format request"));
      if (p->format == 2 || p->format == 3)
        initerror(Str(X_587,"alaw and ulaw not implemented here"));
      if ((p->timcount = (long)(*p->iprd * ekr)) <= 0)
        p->timcount = 1;
      p->countdown = p->timcount;
    }
    else initerror(Str(X_1009,"need quoted filename"));
    p->k[0] = p->k[1] = p->k[2] = p->k[3] = FL(0.0);
}

static void nkread(int ifd, int format, int nk)
{
    int   len;
    char  inbuf[256];
    MYFLT *kp = kval;

    switch(format) {               /* place formatted kvals into outbuf */
    case 1: {
        unsigned char *bp = (unsigned char*)inbuf;
        len = nk;
        read(ifd, inbuf, len);            /* now read the buffer */
        while (nk--) {
          *kp++ = FL(256.0) * *bp++;
        break;
        }
    }
    case 4: {
        short *bp = (short *) inbuf;
        len = nk * sizeof(short);
        read(ifd, inbuf, len);            /* now read the buffer */
        while (nk--)
          *kp++ = (MYFLT) *bp++;
        break;
    }
    case 5: {
        long *bp = (long *) inbuf;
        len = nk * sizeof(long);
        read(ifd, inbuf, len);            /* now read the buffer */
        while (nk--)
           *kp++ = (MYFLT) *bp++;
        break;
    }
    case 6: {
        MYFLT *bp = (MYFLT *) inbuf;
        len = nk * sizeof(MYFLT);
        read(ifd, inbuf, len);            /* now read the buffer */
        while (nk--)
           *kp++ = (MYFLT) *bp++;
        break;
    }
    case 7:
        while (nk--) {
          char *bp = inbuf;
          do {                  /* Skip whitespace */
            read(ifd, bp, 1);
          } while (isspace(*bp));
          if (*bp=='+' || *bp=='-') bp++;
          do {                  /* Absorb digits */
            read(ifd, bp++, 1);
          } while (isdigit(*(bp-1)));
          lseek(ifd, (off_t)(-1), SEEK_CUR);
          sscanf(inbuf,"%ld", kp);
          kp++;
        }
        break;
    case 8:
        while (nk--) {
          char * bp = inbuf;
          do {                  /* Skip whitespace */
            read(ifd, bp, 1);
          } while (isspace(*bp));
          if (*bp=='+' || *bp=='-') bp++;
          do {                  /* Absorb digits and such*/
            read(ifd, bp++, 1);
          } while (!isspace(*(bp-1)));
          if (sizeof(MYFLT)==4)
            sscanf(inbuf,"%f", kp);
          else
            sscanf(inbuf,"%lf", kp);
          kp++;
        }
        break;
    default: die(Str(X_1337,"unknown kdump format"));
    }
}

void kread(KREAD *p)
{
    if (--p->countdown <= 0) {
      p->countdown = p->timcount;
      nkread(p->fdch.fd, p->format, 1);
      *p->k1 = kval[0];
    }
    else *p->k1 = p->k[0];
}

void kread2(KREAD2 *p)
{
    if (--p->countdown <= 0) {
      p->countdown = p->timcount;
      nkread(p->fdch.fd, p->format, 2);
      *p->k1 = kval[0];
      *p->k2 = kval[1];
    }
    else {
      *p->k1 = p->k[0];
      *p->k2 = p->k[1];
    }
}

void kread3(KREAD3 *p)
{
    if (--p->countdown <= 0) {
      p->countdown = p->timcount;
      nkread(p->fdch.fd, p->format, 2);
      *p->k1 = kval[0];
      *p->k2 = kval[1];
      *p->k3 = kval[2];
    }
    else {
      *p->k1 = p->k[0];
      *p->k2 = p->k[1];
      *p->k3 = p->k[2];
    }
}

void kread4(KREAD4 *p)
{
    if (--p->countdown <= 0) {
      p->countdown = p->timcount;
      nkread(p->fdch.fd, p->format, 2);
      *p->k1 = kval[0];
      *p->k2 = kval[1];
      *p->k3 = kval[2];
      *p->k4 = kval[3];
    }
    else {
      *p->k1 = p->k[0];
      *p->k2 = p->k[1];
      *p->k3 = p->k[2];
      *p->k4 = p->k[3];
    }
}
