/*                                                      WINDIN.H        */

typedef struct
    {
    OPDS h;
    MYFLT   *kxrslt, *kyrslt;
    MYFLT   *iprd, *ixmin, *ixmax, *iymin, *iymax, *ixinit, *iyinit;
    int     countdown, timcount;
    XYINDAT w;          /* window specific data structure */
    } XYIN;

