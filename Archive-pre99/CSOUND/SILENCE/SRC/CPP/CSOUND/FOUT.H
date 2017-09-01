typedef struct {
        OPDS    h;
        MYFLT   *fname,*iflag, *argums[VARGMAX];
        FILE    *fp;
        int     idx;
        void    (*outfilep) (void *);
        int     flag;
        int     nargs;
        long    cnt;
} OUTFILE;

typedef struct {
        OPDS    h;
        MYFLT   *fname,*iflag, *argums[VARGMAX];
        FILE *fp;
        int     idx;
        void (*koutfilep) (void *);
        int     flag;
        int nargs;
        long    cnt;
} KOUTFILE;

typedef struct {
        OPDS    h;
        MYFLT   *fname, *iskpfrms, *iflag, *argums[VARGMAX];
        FILE *fp;
        int     idx;
        void (*infilep) (void *);
        long currpos;
        int     flag;
        int nargs;
} INFILE;

typedef struct {
        OPDS    h;
        MYFLT   *fname, *iskpfrms, *iflag, *argums[VARGMAX];
        FILE *fp;
        int     idx;
        void (*kinfilep) (void *);
        long currpos;
        int     flag;
        int nargs;
} KINFILE;

typedef struct {
        OPDS    h;
        MYFLT   *fname, *iskpfrms, *iflag, *argums[VARGMAX];
        long    currpos;
        int     flag;
} I_INFILE;


typedef struct {
        OPDS    h;
        MYFLT   *avar,*aincr;
} INCR;


typedef struct {
        OPDS    h;
        MYFLT   *argums[VARGMAX];
} CLEARS;


typedef struct {
        OPDS    h;
        MYFLT   *ihandle, *fname;
        MYFLT   *iascii; /* iascii=0 open ascii (default), iflag=1 open binary */
} FIOPEN;


typedef struct {
        OPDS    h;
        MYFLT   *ihandle, *iascii, *iflag, *argums[VARGMAX];
  /*void (*ioutfilep) (void *); */
} IOUTFILE;


typedef struct {
        OPDS    h;
        MYFLT   *ihandle, *iascii, *iflag, *argums[VARGMAX];
        long counter;
        int done;
  /*  void (*ioutfilep) (void *); */
}IOUTFILE_R;
