/*                                               RTAUDIO.C for WIN32   */

/*  This module is included when RTAUDIO is defined at compile time.
    It provides an interface between Csound realtime record/play calls
    and the device-driver code that controls the actual hardware.
 */
/* RWD modified 15.7.99 - NT-friendly, removed format switch blocks,
   enabling m/c performance eliminated timer from playback code
 */
#include "cs.h"
#include "soundio.h"
#undef MYFLT

/*#include <windows.h>*/
#include <time.h>
#undef VERSION
#define _WINSOCKAPI_
#include <wtypes.h>
#include <mmsystem.h>
#ifdef never
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
#endif
#define NUMBUF  (4)
HWAVEOUT outdev;                /* Device handle */
LPSTR wavbuff[NUMBUF];          /* N buffers */
WAVEHDR wavhdr[NUMBUF];         /* and associated headers */
HWAVEIN indev;                  /* Device handle */
LPSTR wavInbuff[NUMBUF];        /* N buffers */
WAVEHDR wavInhdr[NUMBUF];       /* and associated headers */
static BOOL isActive=0;         /*RWD 12:2001 use this for playback only... */
unsigned int win_dev = 1024;
int rtin_enabled = 0;           /* RWD 12:2001 and this for record only */

void RTwavclose(void);
void set_current_process_priority_critical(void);
void set_current_process_priority_normal(void);

/* RWD.2.98 for GUI Device Selector control */
int getWaveOutDevices(void);
void getWaveOutName(int, char *);
extern int getWantedDevice(void);       /* cwin.cpp */
extern float *pcurp2;                   /* musmon.c */

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
  default: die(Str(X_1169,"rtaudio: illegal dsize"));
    return(-1);         /* Not reached */
  }
}

void recopen(int nchnls, int dsize, float esr, int scale)
                                /* open for audio input */
{
    oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
    if (oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
      oMaxLag = IODACSAMPS;   /*    use the default value               */
    {
      unsigned int ndev = waveInGetNumDevs(), ntmp = 0;
      WAVEINCAPS caps;
      WAVEFORMATEX wavform;     /*RWD: I assume Win32s knows about this...*/
      MMRESULT res;
      UINT b;
      if (ndev < 1) die(Str(X_371,"No sound input capabilities"));
      if (ndev>1) {             /* We ought to allow used to choise but how? */
        int j;
        printf(Str(X_29,"%d WAVE IN devices found\n"), ndev);
        for (j=0; j<(int)ndev; j++) {
          waveInGetDevCaps(j, &caps, sizeof(caps));
          printf(Str(X_528,"WAVE IN device %d: %s\n"), j, caps.szPname);
        }
        j = (win_dev < ndev ? win_dev : 0u);
        printf(Str(X_460,"Selecting device %d\n"), j);
        ndev = j;
      }
      else ndev = 0;
      if (waveInGetDevCaps(ndev, &caps, sizeof(WAVEOUTCAPS)))
        die(Str(X_207,"Cannot get capabilities"));
      switch (O.outformat) {
      case AE_ALAW:
      case AE_ULAW:
        sprintf(errmsg, Str(X_281,"Forcing 8bit -c sound format\n"));
        warning(errmsg);
        O.outformat = AE_CHAR;
      case AE_CHAR:
        wavform.wBitsPerSample = 8;
        ntmp = 0x000;
/*  printf("8bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp); */
        break;
      default:
        err_printf(Str(X_530,"WAVE OUT unknown wave format\n"));
        exit(1);
      case AE_LONG:
      case AE_FLOAT:
        sprintf(errmsg, Str(X_280,"Forcing 16bit -s sound format\n"));
        warning(errmsg);
        O.outformat = AE_SHORT;
      case AE_SHORT:
        wavform.wBitsPerSample = 16;
        ntmp = 0x100;
/*  printf("16bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp);*/
      }
#ifdef never
      ntmp += (esr==11025.0) + ((esr==22050.0)<<1) + ((esr==44100.0)<<2) +
             (nchnls<<4);
      /*      printf("ntmp = %x\n", ntmp); */
      switch (ntmp) {
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
      die(Str(X_305,"Incompatible sample/channel/width"));
    ok:
#endif
      wavform.wFormatTag = WAVE_FORMAT_PCM;
      wavform.nChannels = nchnls;
      wavform.nSamplesPerSec = (int)esr;
      wavform.nAvgBytesPerSec = (int)esr*nchnls*(wavform.wBitsPerSample>>3);
      wavform.nBlockAlign = nchnls*(wavform.wBitsPerSample>>3);
      /*      printf("Fields are: %d %d %d %d %d\n",
              wavform.wBitsPerSample,
              nchnls, (int)esr, wavform.wf.nAvgBytesPerSec, wavform.wf.nBlockAlign); */
      if (b = waveInOpen((LPHWAVEIN)&indev, ndev,
                          /*(LPCWAVEFORMATEX)*/&wavform,
                          (DWORD)NULL,
                          (DWORD)NULL, CALLBACK_NULL)) {
          printf(Str(X_253,"Error code: %s\n"),
                 b==MMSYSERR_BADDEVICEID ? Str(X_295,"ID is out of range") :
                 b==MMSYSERR_ALLOCATED   ? Str(X_190,"already allocated") :
                 b==MMSYSERR_NOMEM       ? Str(X_501,"unable to allocate or lock memory") :
                 b==WAVERR_BADFORMAT     ? Str(X_1360,"unsupported wave format") :
                                           Str(X_184,"???"));
        die(Str(X_272,"Failed to open dac"));
      }
      {
        WAVEINCAPS  wic;
        waveInGetDevCaps(ndev, &wic, sizeof(wic) );
        printf(Str(X_92,"--->WAVE IN DEV.#%d ENABLED  ( %s )\n"),ndev,wic.szPname);
      }
/*       waveInReset(indev); */
/*     isActive = TRUE;*/       /*RWD 12:2001 */
      for (b=0; b<NUMBUF; b++) {
        wavInbuff[b] = wavInhdr[b].lpData =
          GlobalLock(GlobalAlloc(GMEM_MOVEABLE|GMEM_SHARE,
                                 oMaxLag*dsize*nchnls));
        memset( wavInbuff[b], 0, oMaxLag*dsize*nchnls );
        printf(Str(X_620,"buffer %p size %d\n"), wavInbuff[b], oMaxLag*dsize*nchnls);
        wavInhdr[b].dwBufferLength = oMaxLag*dsize*nchnls;
        wavInhdr[b].dwFlags = WHDR_DONE;
        wavInhdr[b].dwLoops = 1;
        res=waveInPrepareHeader(indev, &wavInhdr[b], sizeof(WAVEHDR));
      }
      waveInStart(indev);
      rtin_enabled = 1;
    }
    ishift = getshift(dsize);
}

void playopen(int nchnls, int dsize, float esr, int scale)
                                /* open for audio output */
{
    int b = 0;

    oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
    if (oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
      oMaxLag = IODACSAMPS;   /*    use the default value               */
    {
      unsigned int ndev = waveOutGetNumDevs(), ntmp = 0;
      WAVEOUTCAPS caps;
      /*PCMWAVEFORMAT wavform;*/
      WAVEFORMATEX wavform;     /*RWD: I assume Win32s knows about this...*/
      if (ndev < 1) die(Str(X_370,"No sound capabilities"));
      if (ndev>1) {             /* We ought to allow used to choise but how? */
        int j;
        printf(Str(X_30,"%d WAVE OUT devices found\n"), ndev);
        for (j=0; j<(int)ndev; j++) {
          waveOutGetDevCaps(j, &caps, sizeof(caps));
          printf(Str(X_529,"WAVE OUT device %d: %s\n"), j, caps.szPname);
        }
#ifdef CWIN
        j = (win_dev != 1024u ? win_dev : getWantedDevice()); /* RWD.2.98 */
#else
        j = (win_dev < ndev ? win_dev : 0u);
#endif
        printf(Str(X_460,"Selecting device %d\n"), j);
        ndev = j;
      }
      else ndev = 0;
      if (waveOutGetDevCaps(ndev, &caps, sizeof(WAVEOUTCAPS)))
        die(Str(X_207,"Cannot get capabilities"));
      /*       printf("Outformat=%x\n", O.outformat); */
      switch (O.outformat) {
      case AE_ALAW:
      case AE_ULAW:
        sprintf(errmsg, Str(X_281,"Forcing 8bit -c sound format\n"));
        warning(errmsg);
        O.outformat = AE_CHAR;
      case AE_CHAR:
        wavform.wBitsPerSample = 8;
        ntmp = 0x000;
/*   printf("8bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp); */
        break;
      default:
        err_printf(Str(X_530,"WAVE OUT unknown wave format\n"));
        exit(1);
      case AE_LONG:
      case AE_FLOAT:
        sprintf(errmsg, Str(X_280,"Forcing 16bit -s sound format\n"));
        warning(errmsg);
        O.outformat = AE_SHORT;
      case AE_SHORT:
        wavform.wBitsPerSample = 16;
        ntmp = 0x100;
/*    printf("16bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp);*/
      }
#ifdef never
      ntmp += (esr==11025.0) + ((esr==22050.0)<<1) + ((esr==44100.0)<<2) +
        (nchnls<<4);
      /*      printf("ntmp = %x\n", ntmp); */
      switch (ntmp) {
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
      die(Str(X_305,"Incompatible sample/channel/width"));
    ok:
#endif
      wavform.wFormatTag = WAVE_FORMAT_PCM;     /*all these now w-out ~.wf.~*/
      wavform.nChannels = nchnls;
      wavform.nSamplesPerSec = (int)esr;
      wavform.nAvgBytesPerSec = (int)esr*nchnls*(wavform.wBitsPerSample>>3);
      wavform.nBlockAlign = nchnls*(wavform.wBitsPerSample>>3);
/*   printf("Fields are: %d %d %d %d %d\n",
     wavform.wBitsPerSample, nchnls, (int)esr, wavform.wf.nAvgBytesPerSec,
     wavform.wf.nBlockAlign); */
      if (b = waveOutOpen((LPHWAVEOUT)&outdev, ndev,
                          /*(LPCWAVEFORMATEX)*/&wavform,
                          (DWORD)NULL,
                          (DWORD)NULL, CALLBACK_NULL)) {
          printf(Str(X_253,"Error code: %s\n"),
                 b==MMSYSERR_BADDEVICEID ? Str(X_295,"ID is out of range") :
                 b==MMSYSERR_ALLOCATED   ? Str(X_190,"already allocated") :
                 b==MMSYSERR_NOMEM       ? Str(X_501,"unable to allocate or lock memory") :
                 b==WAVERR_BADFORMAT     ? Str(X_1360,"unsupported wave format") :
                                           Str(X_184,"???"));
        die(Str(X_272,"Failed to open dac"));
      }
      {
        WAVEOUTCAPS  woc;
        waveOutGetDevCaps(ndev, &woc, sizeof(woc) );
        printf(Str(X_93,"--->WAVE OUT DEV.#%d ENABLED  ( %s )\n"),ndev,woc.szPname);
      }
      /*       waveOutReset(outdev); */
      isActive = TRUE;
      for (b=0; b<NUMBUF; b++) {
        wavbuff[b] = wavhdr[b].lpData =
          GlobalLock(GlobalAlloc(GMEM_MOVEABLE|GMEM_SHARE,
                                 oMaxLag*dsize*nchnls));
        printf(Str(X_620,"buffer %p size %d\n"),
               wavbuff[b], oMaxLag*dsize*nchnls);
        wavhdr[b].dwBufferLength = oMaxLag*dsize*nchnls;
        wavhdr[b].dwFlags = WHDR_DONE;
        wavhdr[b].dwLoops = 0;                  /*RWD was 1*/
        /*RWD don't want to do this here...     */
        /*res=waveOutPrepareHeader(outdev, &wavhdr[b], sizeof(WAVEHDR));*/
      }
#ifdef never
      set_current_process_priority_critical();
#endif
    }
}

int rtrecord(char *inbuf, int nbytes) /* get samples from ADC */
{
    MMRESULT res;
    if (inrecs>= NUMBUF) {   /*RWD 12:2001 */
      while ((wavInhdr[inrecs%NUMBUF].dwFlags & WHDR_DONE)==0){
        Sleep(1);                    /* if input too fast */
      }
    }
    memcpy(inbuf, wavInbuff[inrecs%NUMBUF], nbytes);
    /*RWD*/
    waveInPrepareHeader(indev,&wavInhdr[(inrecs+(NUMBUF-1))%NUMBUF],sizeof(WAVEHDR));
    wavInhdr[inrecs%NUMBUF].dwBufferLength = nbytes;
    res=waveInAddBuffer(indev, &wavInhdr[(inrecs+(NUMBUF-1))%NUMBUF],
                        sizeof(WAVEHDR));
    /*RWD*/
    inrecs++;
    return(nbytes);
}

void rtplay(char *outbuf, int nbytes) /* put samples to DAC  */
    /* N.B. This routine serves as a THROTTLE in Csound Realtime Performance, */
    /* delaying the actual writes and return until the hardware output buffer */
    /* passes a sample-specific THRESHOLD.  If the I/O BLOCKING functionality */
    /* is implemented ACCURATELY by the vendor-supplied audio-library write,  */
    /* that is sufficient.  Otherwise, requires some kind of IOCTL from here. */
    /* This functionality is IMPORTANT when other realtime I/O is occurring,  */
    /* such as when external MIDI data is being collected from a serial port. */
    /* Since Csound polls for MIDI input at the software synthesis K-rate     */
    /* (the resolution of all software-synthesized events), the user can      */
    /* eliminate MIDI jitter by requesting that both be made synchronous with */
    /* the above audio I/O blocks, i.e. by setting -b to some 1 or 2 K-prds.  */
{
    long sampframes = nbytes >> oshift;
    MMRESULT res;
    long ndx = nrecs%NUMBUF;
    DWORD *flgwd = &(wavhdr[ndx].dwFlags);
    /*RWD.7.99: only test WHDR_DONE when all blocks have been used for the first time! */
    if(nrecs>= NUMBUF){
      while ((*flgwd & WHDR_DONE)==0){
        Sleep(1);                    /* if input too fast */
      }
      res = waveOutUnprepareHeader(outdev,&wavhdr[nrecs%NUMBUF],sizeof(WAVEHDR));
#ifdef _DEBUG
      if(res!= MMSYSERR_NOERROR)
        printf("waveoutUnPrepareHeader: error %d\n",res);
#endif
    }
    memcpy(wavbuff[ndx], outbuf, nbytes);
    wavhdr[ndx].dwBufferLength = nbytes;
    /* RWD.7.99 ...but we do want to do it here */
    res = waveOutPrepareHeader(outdev,&wavhdr[(nrecs + (NUMBUF))%NUMBUF],
                               sizeof(WAVEHDR));
#ifdef _DEBUG
    if(res!= MMSYSERR_NOERROR)
      printf("waveoutPrepareHeader: error %d\n",res);
#endif
    res=waveOutWrite(outdev, &wavhdr[(nrecs+NUMBUF)%NUMBUF],
                     sizeof(WAVEHDR));
#ifdef _DEBUG
    if(res!= MMSYSERR_NOERROR)
      printf("waveoutPrepareHeader: error %d\n",res);
#endif
    nrecs++;
}

void rtclose(void)              /* close the I/O device entirely  */
{                               /* called only when both complete */
#ifdef never
    clock_t t0;
          /* and wait for everything to finish */
    do {
      while ((wavhdr[nrecs%NUMBUF].dwFlags & WHDR_DONE)==0) Sleep(1);
      waveOutWrite(outdev, &wavhdr[(nrecs++)%NUMBUF], sizeof(WAVEHDR));
    } while (nrecs * O.outbufsamps <= *pcurp2 * esr) ;
    t0 = clock();               /* From Gabriel Maldanado */
    while(clock() < t0+ 2* CLOCKS_PER_SEC) ; /* 2 seconds delay for flushing buffers */
#else
        /*RWD.7.99: just wait for the last block to be DONE, and we're done!    */
    /*RWD 12:2001 test we are doing this! */
    if (isActive) {
      int lastblock = nrecs-1+NUMBUF;
      while((wavhdr[lastblock%NUMBUF].dwFlags & WHDR_DONE)==0)
        Sleep(1);
    }
#endif
    /*RWD 12:2001 and test here... */
    if (isActive) {
      waveOutReset(outdev);
      waveOutClose(outdev);
      isActive = FALSE;
    }
    if (rtin_enabled) {
      waveInStop (indev);
      waveInReset (indev);
      waveInClose (indev);
      rtin_enabled = 0;
    }
    isActive=FALSE;
#ifdef never
    set_current_process_priority_normal();
#endif
    if (O.Linein) {
#ifdef PIPES
      if (O.Linename[0]=='|') _pclose(Linepipe);
      else
#endif
        if (strcmp(O.Linename, "stdin")!=0) close(Linefd);
    }
}

/*RWD: extra func for use in cwin_exit(): to close device on premature exit,*/
/* and make all this reentry-friendly*/
void RTwavclose(void)
{
    if (isActive) {
      waveOutReset(outdev);
      waveOutClose(outdev);
      isActive=FALSE;
    }
}

/* RWD.2.98 new wrapper funcs for GUI selection of WaveOut Device */
int getWaveOutDevices(void)
{
    return waveOutGetNumDevs();
}

void getWaveOutName(int dev, char *name)
{
    WAVEOUTCAPS caps;
    if (name==NULL) return;
    waveOutGetDevCaps(dev, &caps, sizeof(caps));
    strcpy(name,caps.szPname);
}


void set_current_process_priority_critical(void)
{
    BOOL nRet;
    HANDLE currProcess, currThread;
    currProcess=GetCurrentProcess();
    nRet=SetPriorityClass(  currProcess, REALTIME_PRIORITY_CLASS);
    currThread = GetCurrentThread();
    nRet=SetThreadPriority( currThread,  THREAD_PRIORITY_HIGHEST );
}


void set_current_process_priority_normal(void)
{
    BOOL nRet;
    HANDLE currProcess, currThread;
    currProcess=GetCurrentProcess();
    nRet=SetPriorityClass(  currProcess, NORMAL_PRIORITY_CLASS  );
    currThread = GetCurrentThread();
    nRet=SetThreadPriority( currThread,  THREAD_PRIORITY_NORMAL );
}
