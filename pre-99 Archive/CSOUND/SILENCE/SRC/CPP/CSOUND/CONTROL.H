/********************************************/
/* Controls                                 */
/********************************************/

typedef struct {
  OPDS  h;
  MYFLT *kdest, *kcntl;
} CNTRL;

typedef struct {
  OPDS  h;
  MYFLT *kcntl, *val, *which;
} SCNTRL;

typedef struct {
  OPDS  h;
  MYFLT *kcntl, *val;
} TXTWIN;
