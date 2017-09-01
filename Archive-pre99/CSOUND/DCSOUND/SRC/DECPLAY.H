/*******************************************************************\
*   DECplay.h							    *
*   Play via LoFi 56k & Sony D/a on DecStation for dspBench	    *
*   07aug90 dpwe						    *
\*******************************************************************/

#ifdef __STDC__
int  play_set(int chans, int dsize, double srate, int scale);
void play_rls(void);
void play_on(short *buf, long siz);	/* siz = number of frames */
int get_playbuf_remains(void);	/* return number of unplayed sample frames */
#else
int  play_set();
void play_rls();
void play_on();
int get_playbuf_remains();
#endif
