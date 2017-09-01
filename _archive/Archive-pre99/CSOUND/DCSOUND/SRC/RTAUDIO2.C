/* Windows realtime features revised by G.Maldonado */
#include <windows.h>
#include "cs.h"
#include "soundio.h"
#include <time.h>

#undef VERSION
#define _WINSOCKAPI_
#undef IGNORE

#ifdef FLOAT	/* gab c3 otherwise it generates an error */
#	undef FLOAT
#endif



#define NUMBUF  (40)/*(4) GAB*/

extern int rtin_enabled;
extern MYFLT *pcurp2;
extern LPSTR wavbuff[];               /* N buffers */
extern WAVEHDR wavhdr[];              /* and associated headers */
extern LPSTR wavInbuff[]; 
extern WAVEHDR wavInhdr[];  

extern  long    nrecs;
static  long	ninrecs=0;
static  long	newrecs=0;

extern HWAVEOUT outdev;
extern HWAVEIN  indev; 
extern int NUMBUFgab; /*GAB*/

void set_current_process_priority_normal();

static void play_nowait(char *outbuf, int nbytes);
static void play_sleep(char *outbuf, int nbytes);

static void play_and_file_nowait(char *outbuf, int nbytes);
static void play_and_file_sleep(char *outbuf, int nbytes);

static int record_nowait(char *outbuf, int nbytes);
static int record_sleep(char *outbuf, int nbytes);

void (*rtplay)(char *, int) = play_nowait;
void (*rtplay_and_file)(char *, int) = play_and_file_nowait;
int (*rtrecord) (char *, int ) = record_nowait;/* get samples from ADC */

void  (*write_to_file) (char *, int);
void set_critical_priority_flag();

void set_realtime_sleep()
{ 
	rtplay = play_sleep;
	rtplay_and_file = play_and_file_sleep;
	rtrecord = record_sleep;
	set_critical_priority_flag();
}


void play_nowait(char *outbuf, int nbytes) /* put samples to DAC  */
{
		register long hdr_ndx = nrecs % NUMBUFgab;
		register DWORD * whdr_dwFlags = &(wavhdr[hdr_ndx].dwFlags);

        while ((*whdr_dwFlags & WHDR_DONE)==0) ;
        memcpy(wavbuff[hdr_ndx], outbuf, nbytes);
        waveOutWrite(outdev, &wavhdr[(nrecs + NUMBUFgab) % NUMBUFgab], sizeof(WAVEHDR));
        nrecs++;
}

void play_sleep(char *outbuf, int nbytes) /* put samples to DAC. This routine makes	*/
										  /* Csound to consume less cpu time yelding */
										  /* control to Windows while buffer is not empty */
{
		register long hdr_ndx = nrecs % NUMBUFgab;
		register DWORD * whdr_dwFlags = &(wavhdr[hdr_ndx].dwFlags);

        while ((*whdr_dwFlags & WHDR_DONE)==0) Sleep(1);
        memcpy(wavbuff[hdr_ndx], outbuf, nbytes);
        waveOutWrite(outdev, &wavhdr[(nrecs + NUMBUFgab) % NUMBUFgab], sizeof(WAVEHDR));
        nrecs++;
}


void play_and_file_nowait(char *outbuf, int nbytes)	
{
		register long hdr_ndx = newrecs % NUMBUFgab;
		register DWORD * whdr_dwFlags = &(wavhdr[hdr_ndx].dwFlags);

		
		while ((*whdr_dwFlags & WHDR_DONE)==0) ;
        memcpy(wavbuff[hdr_ndx], outbuf, nbytes);
		waveOutWrite(outdev, &wavhdr[(newrecs + NUMBUFgab) % NUMBUFgab], sizeof(WAVEHDR));
		write_to_file(outbuf, nbytes);
        newrecs++;
}


void play_and_file_sleep(char *outbuf, int nbytes)
{
   		register long hdr_ndx = newrecs % NUMBUFgab;
		register DWORD * whdr_dwFlags = &(wavhdr[hdr_ndx].dwFlags);

 	    
	    while ((*whdr_dwFlags & WHDR_DONE)==0) Sleep(1);
        memcpy(wavbuff[hdr_ndx], outbuf, nbytes);
		waveOutWrite(outdev, &wavhdr[(newrecs + NUMBUFgab) % NUMBUFgab], sizeof(WAVEHDR));
		write_to_file(outbuf, nbytes);
        newrecs++;
}



int record_nowait(char *inbuf, int nbytes) 	   /* get samples from ADC */
{
		register long hdr_ndx = ninrecs % NUMBUFgab;
		register DWORD * whdr_dwFlags = &(wavInhdr[hdr_ndx].dwFlags);
				       
        while ((*whdr_dwFlags & WHDR_DONE)==0) ;
        memcpy(inbuf, wavInbuff[hdr_ndx], nbytes);
        waveInAddBuffer(indev, &wavInhdr[(ninrecs + NUMBUFgab) % NUMBUFgab], sizeof(WAVEHDR));
        ninrecs++;
		return(nbytes);
}


int record_sleep(char *inbuf, int nbytes) /* get samples from ADC. This routine makes	*/
										  /* Csound to consume less cpu time yelding */
										  /* control to Windows while in buffer is not full */
{
		register long hdr_ndx = ninrecs % NUMBUFgab;
		register DWORD * whdr_dwFlags = &(wavInhdr[hdr_ndx].dwFlags);
				       
        while ((*whdr_dwFlags & WHDR_DONE)==0)  Sleep(1);
        memcpy(inbuf, wavInbuff[hdr_ndx], nbytes);
        waveInAddBuffer(indev, &wavInhdr[(ninrecs + NUMBUFgab) % NUMBUFgab], sizeof(WAVEHDR));
        ninrecs++;
		return(nbytes);
}

void rtclose(void)              /* close the I/O device entirely  */
{                               /* called only when both complete */
          int cnt = 0;
		  clock_t t0;
                 
		  //do {
		  // 		while ((wavhdr[nrecs%NUMBUFgab].dwFlags & WHDR_DONE)==0) Sleep(1);
		  //     	waveOutWrite(outdev, &wavhdr[(nrecs+NUMBUFgab)%NUMBUFgab], sizeof(WAVEHDR));
          //   	nrecs++;
		  //} while (nrecs * O.outbufsamps <= *pcurp2 * esr) ;
          t0 = clock();
		  while(clock() < t0 + CLOCKS_PER_SEC) ; /* 1 second delay for flushing buffers*/
          waveOutReset(outdev);
          waveOutClose(outdev);
		  if (rtin_enabled) {
		  	waveInStop (indev);
		  	waveInReset (indev);
		  	waveInClose (indev);
		  }
	set_current_process_priority_normal();
}

