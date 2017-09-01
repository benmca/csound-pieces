/*              Envelope follower by Paris Smaragdis                    */
/*              Berklee College of Music Csound development team        */
/*              Copyright (c) August 1994.  All rights reserved         */

typedef struct  {
        OPDS            h;
        MYFLT           *out, *in, *len;
        MYFLT           max, wgh;
        long            length;
        long            count;
} FOL;

/* For implementation of Jot envelope follower -- JPff Feb 2000 */
typedef struct {
        OPDS    h;
        MYFLT   *out, *in, *attack, *release;
        MYFLT   lastatt, lastrel, envelope, ga, gr;
} ENV;
