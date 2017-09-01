/*              Butterworth filters coded by Paris Smaragdis 1994       */
/*              Berklee College of Music Csound development team        */
/*              Copyright (c) May 1994.  All rights reserved            */

typedef struct  {
        OPDS    h;
        MYFLT   *sr, *ain, *kfc, *istor;
        MYFLT   lkf;
        MYFLT   a[8];
} BFIL;

typedef struct  {
        OPDS    h;
        MYFLT   *sr, *ain, *kfo, *kbw, *istor;
        MYFLT   lkf, lkb;
        MYFLT   a[8];
} BBFIL;
