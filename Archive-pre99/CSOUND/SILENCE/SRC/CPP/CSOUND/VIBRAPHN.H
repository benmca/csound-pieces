/*******************************************/
/*  Vibraphone SubClass of Modal4          */
/*  Instrument, by Perry R. Cook, 1995-96  */
/*                                         */
/*   Controls:    stickHardness            */
/*                strikePosition           */
/*                vibFreq                  */
/*                vibAmt                   */
/*******************************************/

#if !defined(__Vibraphn_h)
#define __Vibraphn_h

typedef struct Vibraphn {
    OPDS        h;
    MYFLT       *ar;                  /* Output */
    MYFLT       *amplitude, *frequency;
    MYFLT       *hardness, *spos, *ifn;
    MYFLT       *vibFreq, *vibAmt, *ivfn, *dettack;

    Modal4      m4;
    MYFLT       strikePosition;
    MYFLT       stickHardness;
    int         kloop;
} VIBRAPHN;

#endif
