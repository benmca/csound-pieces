/*                                                               RTAUDIO.C   */

/*  This module is included when RTAUDIO is defined at compile time.
    It provides an interface between Csound realtime record/play calls
    and the device-driver code that controls the actual hardware.
    Makefile defines must have ONE of:  -DDEC, -DSGI, -Dsun, -DNeXT, -DHP, -DLINUX
 */
#include <wtypes.h>
#include <mmsystem.h>

#include "cs.h"
#include "soundio.h"


#include <time.h>
#undef VERSION
#define _WINSOCKAPI_
#undef IGNORE

#define M8_11   0x011
#define S8_11   0x021
#define M6_11   0x111
#define S6_11   0x121
#define M8_22   0x012
#define S8_22   0x022
#define M6_22   0x112
#define S6_22   0x122
#define M8_44   0x014
#define S8_44   0x024
#define M6_44   0x114
#define S6_44   0x124


#define NUMBUF  (40) /*gab (before 4)*/	

int  ChooseAudioInDev(void);
int  ChooseAudioOutDev(void);
int NUMBUFgab=4;
void setbuf_num(int	num) { NUMBUFgab = num; } 
static int outdev_num = -1; 
void setoutdev_num(int num) { outdev_num = num;}
static int indev_num = -1; 
void setindev_num(int num) { indev_num = num;} 
static int no_check_flag = 0;
void setno_check() { no_check_flag = 1;} 
int critical_flag = 0;
void set_critical_priority_flag(){ critical_flag = 1; }
int sleep_flag = 0;
void set_sleep_flag() { sleep_flag = 1;}
void set_realtime_sleep();


HWAVEOUT outdev= NULL;                /* Device handle */
LPSTR wavbuff[NUMBUF];               /* N buffers */
WAVEHDR wavhdr[NUMBUF];              /* and associated headers */
HWAVEIN indev= NULL;                /* Device handle */
LPSTR wavInbuff[NUMBUF];               /* N buffers */
WAVEHDR wavInhdr[NUMBUF];              /* and associated headers */
static BOOL isActive=0;
int win_dev = 1024;
int rtin_enabled = 0;
void RTwavclose(void);
void set_current_process_priority_critical(void);
void set_current_process_priority_normal(void);

/* RWD.2.98 for GUI Device Selector control */
int getWaveOutDevices(void);
void getWaveOutName(int, char *);
extern int getWantedDevice(void);	/* cwin.cpp */
extern MYFLT *pcurp2;			/* musmon.c */

static  int     ishift = 0, oshift = 0, oMaxLag;
extern  long    nrecs;
        long    inrecs;
extern  OPARMS  O;
extern int Linefd;
#ifdef PIPES
extern FILE* Linepipe;
#endif

static int getshift(int dsize)  /* turn sample- or frame-size into shiftsize */
{
        switch(dsize) {
        case 1:  return(0);
        case 2:  return(1);
        case 4:  return(2);
        case 8:  return(3);
        default: die("rtaudio: illegal dsize");
	  return(-1);		/* Not reached */
        }
}


void playReset() /* gab d5*/
{
	if (outdev != NULL) {
		waveOutReset(outdev);  	
		waveOutClose(outdev);
		outdev = NULL;
		outdev_num =-1;
	}
}

void recReset() /* gab d5*/
{
	if (indev != NULL) {
		waveInReset(indev);  	
		waveInClose(indev);
		indev = NULL;
		indev_num = -1;
	}
}


void recopen(int nchnls, int dsize, MYFLT esr, int scale)
/* open for audio input */
{
	oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
	if (oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
		oMaxLag = IODACSAMPS;   /*    use the default value               */
	{
		int b;
		unsigned int ndev, numDev = waveInGetNumDevs();
		WAVEINCAPS caps;
		WAVEFORMATEX wavform;
		
		if (O.oMaxLag < O.inbufsamps)	 O.oMaxLag = O.inbufsamps ;  /* gab  for not crashing */
		if (O.oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
			oMaxLag = IODACSAMPS;   /*    use the default value               */
		oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
		
		if (numDev < 1) 	die("No WAVE IN capabilities");
		if (indev_num < 0) indev_num = ChooseAudioInDev();
		if (waveInGetDevCaps(indev_num, &caps, sizeof(WAVEINCAPS)))  die("Cannot get capabilities");
		switch (O.informat) {
		case AE_ALAW:
		case AE_ULAW:
			sprintf(errmsg, "Forcing 8bit -c sound format\n");
			warning(errmsg);
			O.outformat = AE_CHAR;
		case AE_CHAR:
			wavform.wBitsPerSample = 8;
			ndev = 0x000;
			break;
		case AE_LONG:
		case AE_FLOAT:
			sprintf(errmsg, "Forcing 16bit -s sound format\n");
			warning(errmsg);
			O.outformat = AE_SHORT;
		case AE_SHORT:
			wavform.wBitsPerSample = 16;
			ndev = 0x100;
			break;
		case AE_NO_AUDIO: /* gab */
			return;
		default:
			printf("WAVE IN opening: unknown wave format\n");
			exit(0);
		}
		
		if (no_check_flag)  goto ok; 
		else {
			ndev += (esr==11025.0) + ((esr==22050.0)<<1) + ((esr==44100.0)<<2) + (nchnls<<4);
			switch (ndev) {
			case M8_11:
				if (caps.dwFormats&WAVE_FORMAT_1M08) goto ok;
				break;
			case S8_11:
				if (caps.dwFormats&WAVE_FORMAT_1S08) goto ok;
				break;
			case M6_11:
				if (caps.dwFormats&WAVE_FORMAT_1M16) goto ok;
				break;
			case S6_11:
				if (caps.dwFormats&WAVE_FORMAT_1S16) goto ok;
				break;
			case M8_22:
				if (caps.dwFormats&WAVE_FORMAT_2M08) goto ok;
				break;
			case S8_22:
				if (caps.dwFormats&WAVE_FORMAT_2S08) goto ok;
				break;
			case M6_22:
				if (caps.dwFormats&WAVE_FORMAT_2M16) goto ok;
				break;
			case S6_22:
				if (caps.dwFormats&WAVE_FORMAT_2S16) goto ok;
				break;
			case M8_44:
				if (caps.dwFormats&WAVE_FORMAT_4M08) goto ok;
				break;
			case S8_44:
				if (caps.dwFormats&WAVE_FORMAT_4S08) goto ok;
				break;
			case M6_44:
				if (caps.dwFormats&WAVE_FORMAT_4M16) goto ok;
				break;
			case S6_44:
				if (caps.dwFormats&WAVE_FORMAT_4S16) goto ok;
				break;
			}
		}
		{
			printf("Error opening WAVE IN port: Incompatable sample/channel/width");
			MessageBox( NULL,	
				"Incompatable sampling_rate/channel/width.\n (Hint: If you are using a SoundBlaster card, try to set -+e flag)",
                "Error opening WAVE IN port",	
                MB_TASKMODAL|MB_ICONSTOP 	
				);
			exit(0);
		}
ok:
		wavform.wFormatTag = WAVE_FORMAT_PCM;
		wavform.nChannels = nchnls;
		wavform.nSamplesPerSec = (int)esr;
		wavform.nAvgBytesPerSec =  (int)esr * nchnls * (wavform.wBitsPerSample >> 3);
		wavform.nBlockAlign = nchnls*(wavform.wBitsPerSample>>3);
		if (b = waveInOpen((LPHWAVEIN)&indev,
			indev_num,	
			&wavform,    
			(DWORD)NULL,
			
			(DWORD)NULL, CALLBACK_NULL)) {
			char *error_string;
			error_string = 		    b==MMSYSERR_BADDEVICEID ? "WAVE OUT device ID is out of range" :
			b==MMSYSERR_ALLOCATED   ? "WAVE OUT device already allocated" :
			b==MMSYSERR_NOMEM       ? "WAVE OUT: unable to allocate memory" :
			b==WAVERR_BADFORMAT     ? "WAVE OUT: unsupported wave format" :
			"???";
			printf("Failed to open ADC: %s\n", error_string);
			MessageBox( NULL,	
				error_string,
				"Realtime Csound error: failed to open ADC",	
				MB_TASKMODAL|MB_ICONSTOP 	
				);
			exit(0);
		}
		else{
			WAVEINCAPS  wic;
			waveInGetDevCaps(indev_num, &wic, sizeof(wic) );	
			printf("--->WAVE IN DEV.#%d ENABLED  ( %s )\n",indev_num,wic.szPname);   
		}
		
		for (b=0; b<NUMBUFgab; b++) {
			wavInbuff[b] = wavInhdr[b].lpData =   malloc(oMaxLag*dsize);
			memset( wavInbuff[b], 0, oMaxLag*dsize ); 
			wavInhdr[b].dwBufferLength = oMaxLag*dsize;
			wavInhdr[b].dwFlags = WHDR_DONE;
			wavInhdr[b].dwLoops = 1;
			waveInPrepareHeader(indev, &wavInhdr[b], sizeof(WAVEHDR));
		}
		waveInStart(indev);
		rtin_enabled = 1;
	}
	ishift = getshift(dsize);
}

void playopen(int nchnls, int dsize, MYFLT esr, int scale)
                                /* open for audio output */
{
	int b;
	
	oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
	if (oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
		oMaxLag = IODACSAMPS;   /*    use the default value               */
	{
		unsigned int ndev, numDev = waveOutGetNumDevs();
		WAVEOUTCAPS caps;
		WAVEFORMATEX wavform;
		if (sleep_flag) set_realtime_sleep();
		
		
		if (O.oMaxLag < O.outbufsamps)	 O.oMaxLag = O.outbufsamps ;  /* gab  for not crashing*/
		if (O.oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
            oMaxLag = IODACSAMPS;   /*    use the default value               */
		oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
		
		if (numDev < 1) 	die("No WAVE OUT capabilities");
		if (outdev_num < 0) outdev_num = ChooseAudioOutDev();
		if (waveOutGetDevCaps(outdev_num, &caps, sizeof(WAVEOUTCAPS)))  die("Cannot get WAVE OUT capabilities");

		switch (O.outformat) {
       	case AE_ALAW:
		case AE_ULAW:
			sprintf(errmsg, "Forcing 8bit -c sound format\n");
			warning(errmsg);
			O.outformat = AE_CHAR;
		case AE_CHAR:
			wavform.wBitsPerSample = 8;
			ndev = 0x000;
			break;
		case AE_LONG:
		case AE_FLOAT:
			sprintf(errmsg, "Forcing 16bit -s sound format\n");
			warning(errmsg);
			O.outformat = AE_SHORT;
		case AE_SHORT:
			wavform.wBitsPerSample = 16;
			ndev = 0x100;
			break;
		case AE_NO_AUDIO: /* gab-A1 */
			return;
		default:
			printf("WAVE OUT opening: unknown wave format\n");
			exit(0);
		}

		if (no_check_flag)  goto ok; 
		else {
			ndev += (esr==11025.0) + ((esr==22050.0)<<1) + ((esr==44100.0)<<2) + (nchnls<<4);
			switch (ndev) {
			case M8_11:
				if (caps.dwFormats&WAVE_FORMAT_1M08) goto ok;
				break;
			case S8_11:
				if (caps.dwFormats&WAVE_FORMAT_1S08) goto ok;
				break;
			case M6_11:
				if (caps.dwFormats&WAVE_FORMAT_1M16) goto ok;
				break;
			case S6_11:
				if (caps.dwFormats&WAVE_FORMAT_1S16) goto ok;
				break;
			case M8_22:
				if (caps.dwFormats&WAVE_FORMAT_2M08) goto ok;
				break;
			case S8_22:
				if (caps.dwFormats&WAVE_FORMAT_2S08) goto ok;
				break;
			case M6_22:
				if (caps.dwFormats&WAVE_FORMAT_2M16) goto ok;
				break;
			case S6_22:
				if (caps.dwFormats&WAVE_FORMAT_2S16) goto ok;
				break;
			case M8_44:
				if (caps.dwFormats&WAVE_FORMAT_4M08) goto ok;
				break;
			case S8_44:
				if (caps.dwFormats&WAVE_FORMAT_4S08) goto ok;
				break;
			case M6_44:
				if (caps.dwFormats&WAVE_FORMAT_4M16) goto ok;
				break;
			case S6_44:
				if (caps.dwFormats&WAVE_FORMAT_4S16) goto ok;
				break;
			}
		}
		{
			printf("Error opening WAVE OUT port: Incompatable sample/channel/width");
			MessageBox( NULL,	
				"Incompatable sampling_rate/channel/width.\n (Hint: If you are using a SoundBlaster card, try to set -+e flag)\nUse standard Sampling Rates",	
                "Error opening WAVE OUT port", 
                MB_TASKMODAL|MB_ICONSTOP 	
				);
			exit(0);
		}
 ok:
		wavform.wFormatTag = WAVE_FORMAT_PCM;
		wavform.nChannels = nchnls;
		wavform.nSamplesPerSec = (int)esr;
		wavform.nAvgBytesPerSec =  (int)esr * nchnls * (wavform.wBitsPerSample >> 3);
		wavform.nBlockAlign = nchnls*(wavform.wBitsPerSample>>3);
		if (b = waveOutOpen((LPHWAVEOUT)&outdev,
			outdev_num,	
			&wavform,    
			(DWORD)NULL,
			
			(DWORD)NULL, CALLBACK_NULL)) {
			char *error_string;
			error_string = 		    b==MMSYSERR_BADDEVICEID ? "WAVE OUT device ID is out of range" :
			b==MMSYSERR_ALLOCATED   ? "WAVE OUT device already allocated" :
			b==MMSYSERR_NOMEM       ? "WAVE OUT: unable to allocate memory" :
			b==WAVERR_BADFORMAT     ? "WAVE OUT: unsupported wave format" :
			"???";
			printf("Failed to open DAC: %s\n", error_string);
			MessageBox( NULL,
				error_string,
				"Realtime Csound error: failed to open DAC",	 
				MB_TASKMODAL|MB_ICONSTOP 
				);
			exit(0);
		}
		else{
			WAVEOUTCAPS  woc;
			waveOutGetDevCaps(outdev_num, &woc, sizeof(woc) );	
			printf("--->WAVE OUT DEV.#%d ENABLED  ( %s )\n",outdev_num,woc.szPname);   
		}
		isActive = TRUE;
		for (b=0; b<NUMBUFgab; b++) {
			wavbuff[b] = wavhdr[b].lpData =   malloc(oMaxLag*dsize);
			/*        printf("buffer %p size %d\n", wavbuff[b], oMaxLag*dsize); */
			wavhdr[b].dwBufferLength = oMaxLag*dsize;
			wavhdr[b].dwFlags = WHDR_DONE;
			wavhdr[b].dwLoops = 1;
			waveOutPrepareHeader(outdev, &wavhdr[b], sizeof(WAVEHDR));
			/*        printf("Hdr %p done\n", b); */
		}
		if (critical_flag)  set_current_process_priority_critical(); /*Gab 18/8/97*/
	}
}


#ifdef WIN32 /*gab-A1*/
void set_current_process_priority_critical(void)
{
 	 BOOL nRet;
 	 HANDLE currProcess, currThread;
 	 currProcess=GetCurrentProcess();
	 nRet=SetPriorityClass(  currProcess, HIGH_PRIORITY_CLASS);
	 currThread = GetCurrentThread();
	 nRet=SetThreadPriority( currThread, THREAD_PRIORITY_NORMAL );
}


void set_current_process_priority_normal(void)
{
 	 BOOL nRet;
 	 HANDLE currProcess, currThread;
 	 currProcess=GetCurrentProcess();
	 nRet=SetPriorityClass(  currProcess, NORMAL_PRIORITY_CLASS	);
	 currThread = GetCurrentThread();
	 nRet=SetThreadPriority( currThread,  THREAD_PRIORITY_NORMAL );
}
#endif /*WIN32*/