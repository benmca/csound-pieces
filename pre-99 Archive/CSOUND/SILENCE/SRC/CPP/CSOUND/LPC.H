/*                                                                      LPC.H   */

#define LP_MAGIC    999
#define LP_MAGIC2   2399                   /* pole file type */
#define LPBUFSIZ    4096           /* in lpanal */
#define MAXWINDIN   1000           /* for 10ms hops at 50 KC */
#define MAXPOLES    50
#define NDATA       4   /* number of data values stored with frame */

typedef struct {
        long    headersize, lpmagic, npoles, nvals;
        MYFLT   framrate, srate, duration;
        char    text[4];
} LPHEADER;
