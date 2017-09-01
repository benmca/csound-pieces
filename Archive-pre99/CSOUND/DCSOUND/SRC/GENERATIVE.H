/*
typedef struct {
  OPDS  h;
  float *ktrig, *kstart, *kloop, *initndx, *kfn, *outargs[VARGMAX];
  long ndx;
  int nargs, done;
  long  pfn;
  float *table;
} TRIGSEQ;

typedef struct {
  OPDS  h;
  float *ktrig, *unit_time, *kstart, *kloop, *initndx, *kfn;
  long ndx;
  int done,flag;
  double start, newtime;
  long  pfn;
  float *table;
} SEQTIM;
*/
typedef struct {
  OPDS  h;
  MYFLT *ktrig, *ktrigin, *unit_time, *kstart, *kloop, *kinitndx, *kfn;
  long ndx;
  int done,flag;
  double start, newtime;
  long  pfn;
  MYFLT *table;
} SEQTIM2;
