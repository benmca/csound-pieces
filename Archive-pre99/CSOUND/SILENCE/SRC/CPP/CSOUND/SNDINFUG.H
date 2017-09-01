typedef struct {
  OPDS  h;
  MYFLT *r1, *ifilno;
  long audsize;
} SNDINFO;

typedef struct {
  OPDS  h;
  MYFLT *r1, *ifilno, *channel;
  long audsize;
} SNDINFOPEAK;
