/****************************************/
/** midicXX   UGs by Gabriel Maldonado **/
/****************************************/

typedef struct {
    OPDS   h;
    MYFLT  *r, *ictlno, *imin, *imax, *ifn;
    short flag;
    FUNC *ftp;
    long   ctlno;
} MIDICTL2;


typedef struct {
    OPDS   h;
    MYFLT  *r, *ictlno1, *ictlno2, *imin, *imax, *ifn;
    short flag;
    FUNC *ftp;
    long   ctlno1, ctlno2;
} MIDICTL3;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ictlno1, *ictlno2, *ictlno3, *imin, *imax, *ifn;
    short flag;
    FUNC *ftp;
    long   ctlno1, ctlno2, ctlno3;
} MIDICTL4;

/*----------------------------------------*/
/* GLOBAL MIDI IN CONTROLS activable by score-oriented instruments*/

typedef struct {
    OPDS   h;
    MYFLT  *r, *ichan, *ictlno, *imin, *imax, *ifn;
    short flag;
    FUNC *ftp;
    long   ctlno;
} CTRL7;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ichan, *ictlno1, *ictlno2, *imin, *imax, *ifn;
    short flag;
    FUNC *ftp;
    long   ctlno1, ctlno2;
} CTRL14;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ichan, *ictlno1, *ictlno2, *ictlno3, *imin, *imax, *ifn;
    short flag;
    FUNC *ftp;
    long   ctlno1, ctlno2, ctlno3;
} CTRL21;


typedef struct {
    OPDS   h;
    MYFLT  *ichan, *ictlno, *ivalue;
} INITC7;

typedef struct {
    OPDS   h;
    MYFLT  *ichan, *ictlno1, *ictlno2, *ivalue;
} INITC14;

typedef struct {
    OPDS   h;
    MYFLT  *ichan, *ictlno1, *ictlno2, *ictlno3, *ivalue;
} INITC21;
/* gab-A1 */
typedef struct {
    OPDS   h;
    MYFLT  *status, *chan, *data1, *data2;
	unsigned long local_buf_index;
} MIDIIN;
/* end gab-A1 */