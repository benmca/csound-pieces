                                                        /* repluck.h */
typedef struct _DelayLine {
    MYFLT   *data;
    int length;
    MYFLT   *pointer;
    MYFLT   *end;
} DelayLine;

typedef struct  {
    OPDS    h;
    MYFLT   *ar, *plk, *xamp, *icps, *pickup, *reflect;
    MYFLT   *ain;
    AUXCH   upper;
    AUXCH   lower;
    AUXCH   up_data;
    AUXCH   down_data;
    MYFLT   state;
    int     scale;
    int     rail_len;
} WGPLUCK2;

/****************************************************/
/* streson.h : string resonator header file         */
/*                                                  */
/*           Victor Lazzarini, 1998                 */
/****************************************************/
typedef struct{
        OPDS h;
        MYFLT   *result, *ainput, *afr, *ifdbgain;
        MYFLT   LPdelay, APdelay, *Cdelay;
        AUXCH   aux;
        int     wpointer, rpointer, vdtime, size;
} STRES;
