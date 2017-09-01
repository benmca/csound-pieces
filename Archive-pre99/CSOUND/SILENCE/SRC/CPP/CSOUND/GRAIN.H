/*      Granular synthesizer designed and coded by Paris Smaragdis      */
/*      Berklee College of Music Csound development team                */
/*      Copyright (c) May 1994.  All rights reserved                    */

typedef struct {
    OPDS        h;
    MYFLT       *sr, *xamp, *xlfr, *xdns, *kabnd, *kbnd, *kglen;
    MYFLT       *igfn, *iefn, *imkglen, *opt;
    MYFLT       gcount;
    MYFLT       pr;
    AUXCH       aux;
    MYFLT       *x, *y;
    FUNC        *gftp, *eftp;
    short       dnsadv, ampadv, lfradv;
} PGRA;
