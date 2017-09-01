/*                                                               RTAUDIO.C   */

/*  This module is included when RTAUDIO is defined at compile time.
    It provides an interface between Csound realtime record/play calls
    and the device-driver code that controls the actual hardware.
    Makefile defines must have ONE of:  -DDEC, -DSGI, -Dsun, -DNeXT, -DHP, -DLINUX
 */

#include "cs.h"
#include "soundio.h"

#ifdef DEC
#include "DECplay.h"   /* doesn't include record feature */
#endif

#ifdef SGI
#include <stdio.h>
#include <audio.h>
static  ALconfig iconfig, oconfig;
static  ALport   iport = NULL, oport = NULL;
#endif

#if defined(sun) || defined(sol)
#include <sys/audioio.h>
#include <sys/ioctl.h>
#include <sys/fcntl.h>
static  audio_info_t  audinfo;
int     audiofd, sampcnt = 0;
#endif

#ifdef HP
void AWopen(), AudioWrite(), AWclose();
#endif

#ifdef NeXT
#include <stdio.h>
#include <sound/sound.h>
#include <sound/sounddriver.h>
#include <mach.h>
int low_water = 48*1024;   /* Used by the driver to control the flow of samples */
int high_water = 64*1024;  /* Used by the driver to control the flow of samples */
static port_t dev_port, owner_port, write_port, reply_port ;
#endif

#ifdef LINUX                                  /* Jonathan Mohr  1995 Oct 17 */
#include <unistd.h>
#include <fcntl.h>
#define DSP_NAME    "/dev/dsp"
static int dspfd;
void setsndparms(int, int, int, float, unsigned);
void setvolume(unsigned);
#endif

#ifdef __BEOS__
#include <OS.h>
#include "BeAudio.h"
static char *adcBuffer;
const bigtime_t portTimeout = 5000000;
#endif

#ifdef mills_macintosh
#include <Types.h>
typedef struct IOBufferArray
{
  int readndx;                                          /* In Shorts */
  int readsize;                                         /* In bytes  */
  int writendx;                                         /* In Shorts */
Boolean loopback;
short buffer[1];
} IOBufferArray, *IOBufferPtr, **IOBufferHandle;

extern IOBufferHandle iobufhandle;
extern int MacRtBufsize;
extern int MacRtDACIOSize;

void MacRtPlayOpen(int nchnls, int dsize, float esr);
void MacRtPlay(char *outbuf, int nbytes);
void MacRtPlayClose(void);

void MacRtRecordOpen(int nchnls, int dsize, float esr);
void MacRtRecord(char *inbuf, int nbytes);
void MacRtRecordClose(void);
#endif

#ifdef WIN32
/*#include <windows.h>*/
#include <time.h>
#undef VERSION
#define _WINSOCKAPI_
#include <wtypes.h>
#include <mmsystem.h>
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
#define NUMBUF  (4)
HWAVEOUT outdev;                /* Device handle */
LPSTR wavbuff[NUMBUF];               /* N buffers */
WAVEHDR wavhdr[NUMBUF];              /* and associated headers */
HWAVEOUT indev;                /* Device handle */
LPSTR wavInbuff[NUMBUF];               /* N buffers */
WAVEHDR wavInhdr[NUMBUF];              /* and associated headers */
static BOOL isActive=0;
unsigned int win_dev = 1024;
int rtin_enabled = 0;
void RTwavclose(void);
void set_current_process_priority_critical(void);
void set_current_process_priority_normal(void);

/* RWD.2.98 for GUI Device Selector control */
int getWaveOutDevices(void);
void getWaveOutName(int, char *);
extern int getWantedDevice(void);       /* cwin.cpp */
extern float *pcurp2;                   /* musmon.c */
#endif
static  int     ishift = 0, oshift = 0, oMaxLag;
extern  long    nrecs;
        long    inrecs;
extern  OPARMS  O;
extern int Linefd;
#ifdef PIPES
extern FILE* Linepipe;
# if defined(SGI) || defined(LINUX) || defined(__BEOS__)
#  define _pclose pclose
# endif
#endif

static int getshift(int dsize)  /* turn sample- or frame-size into shiftsize */
{
        switch(dsize) {
        case 1:  return(0);
        case 2:  return(1);
        case 4:  return(2);
        case 8:  return(3);
        default: die(Str(X_1169,"rtaudio: illegal dsize"));
          return(-1);           /* Not reached */
        }
}

void recopen(int nchnls, int dsize, float esr, int scale)
                                /* open for audio input */
{
        oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
        if (oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
            oMaxLag = IODACSAMPS;   /*    use the default value               */
#ifdef mills_macintosh
        /* we don't use nchnls, etc */
        MacRtRecordOpen(nchnls, dsize, esr);
#endif
#ifdef DEC
/*        rec_set(nchnls, dsize, esr, scale);  */
        die(Str(X_238,"DECaudio record not available"));
#endif
#ifdef SGI
        iconfig = ALnewconfig();
        ALsetchannels(iconfig, (long)nchnls);
        ALsetwidth(iconfig, (long)dsize);
/*      ALsetsamplerate(iconfig, (long)esr);    */
        {   long cmdBuf[2];
            cmdBuf[0] = AL_INPUT_RATE;
            cmdBuf[1] = (long)esr;
            ALsetparams(AL_DEFAULT_DEVICE,cmdBuf,2);
        }
        ALsetqueuesize(iconfig, (long)oMaxLag);
        iport = ALopenport("soundi", "r", iconfig);
#endif
#ifdef sun
        die(Str(X_454,"SUN audio record not available"));
#endif
#ifdef HP
        die(Str(X_292,"HP audio record not available"));
#endif
#ifdef NeXT
        die(Str(X_354,"NeXT audio record not available"));
#endif
#ifdef LINUX                                  /* Jonathan Mohr  1995 Oct 17 */
        /* open DSP device for reading */
        if ( (dspfd = open(DSP_NAME, O_RDONLY)) == -1 )
          die(Str(X_1307,"unable to open soundcard for audio input"));

        /* initialize data format, channels, sample rate, and buffer size */
        setsndparms( dspfd, O.informat, nchnls, esr, oMaxLag * O.insampsiz );
#endif
#ifdef __BEOS__
        if (nchnls != 1 && nchnls != 2) {
          die(Str(X_1154,"recopen: BeOS supports either one or two channels."));
        } else if (!(adcBuffer = malloc(oMaxLag))) {
          die(Str(X_1155,"recopen: Cannot allocate ADC buffer."));
        } else if (openADCPort(nchnls, O.informat, esr, oMaxLag) < B_NO_ERROR) {
          die(Str(X_1156,"recopen: cannot open ADC."));
        }
#endif
#ifdef WIN32
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
        /*        printf("8bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp); */
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
        /*        printf("16bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp);*/
      }
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
      wavform.wFormatTag = WAVE_FORMAT_PCM;
      wavform.nChannels = nchnls;
      wavform.nSamplesPerSec = (int)esr;
      wavform.nAvgBytesPerSec = (int)esr*nchnls*(wavform.wBitsPerSample>>3);
      wavform.nBlockAlign = nchnls*(wavform.wBitsPerSample>>3);
      /*      printf("Fields are: %d %d %d %d %d\n", wavform.wBitsPerSample, nchnls, (int)esr, wavform.wf.nAvgBytesPerSec, wavform.wf.nBlockAlign); */
      if (b = waveInOpen((LPHWAVEOUT)&indev, ndev,
                          /*(LPCWAVEFORMATEX)*/&wavform,
                          (DWORD)NULL,
                          (DWORD)NULL, CALLBACK_NULL)) {
          printf(Str(X_253,"Error code: %s\n"),
                 b==MMSYSERR_BADDEVICEID ? Str(X_295,"ID is out of range") :
                 b==MMSYSERR_ALLOCATED   ? Str(X_190,"already allocated") :
                 b==MMSYSERR_NOMEM       ? Str(X_501,"unable to allocate or lock memory") :
                 b==WAVERR_BADFORMAT     ? Str(X_1360,"unsupported wave format") :
                                           X_184,"???");
        die(Str(X_272,"Failed to open dac"));
      }
      {
        WAVEINCAPS  wic;
        waveInGetDevCaps(ndev, &wic, sizeof(wic) );
        printf(Str(X_92,"--->WAVE IN DEV.#%d ENABLED  ( %s )\n"),ndev,wic.szPname);
      }
/*       waveInReset(indev); */
      isActive = TRUE;
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
#endif
        ishift = getshift(dsize);
}

void playopen(int nchnls, int dsize, float esr, int scale)
                                /* open for audio output */
{
        int b = 0;

        oMaxLag = O.oMaxLag;        /* import DAC setting from command line   */
        if (oMaxLag <= 0)           /* if DAC sampframes ndef in command line */
            oMaxLag = IODACSAMPS;   /*    use the default value               */
#ifdef mills_macintosh
        MacSetRtBufSizes(nchnls, dsize);
        MacRtPlayOpen(nchnls, dsize, esr);
#endif
#ifdef DEC
        if ((b = O.outbufsamps / nchnls) >= 8192) {
            sprintf(errmsg, Str(X_137,"-b %d probably too large, suggest <= 2048"), b);
            warning(errmsg);
        }
        if (oMaxLag * esr / 11025 > 2048) {
            sprintf(errmsg, Str(X_97,"-B %d probably too large, suggest 1024"), oMaxLag);
            warning(errmsg);
        }
        play_set(nchnls, dsize, esr, scale);
        oshift = getshift(nchnls * dsize);
#endif
#ifdef SGI
    {   int PMLqueuesize;
        oconfig = ALnewconfig();
        ALsetchannels(oconfig, (long)nchnls);
        ALsetwidth(oconfig, (long)dsize);
/*      ALsetsamplerate(oconfig, (long)esr);    */
        {   long cmdBuf[2];
            cmdBuf[0] = AL_OUTPUT_RATE;
            cmdBuf[1] = (long)esr;
            ALsetparams(AL_DEFAULT_DEVICE,cmdBuf,2);
        }
        ALsetqueuesize(oconfig, (long)oMaxLag);
        PMLqueuesize = ALgetqueuesize(oconfig);
        printf(Str(X_545,"\n PMLqueuesize = %d\n"), PMLqueuesize);
        oport = ALopenport("soundo", "w", oconfig);
        oshift = getshift(dsize);
    }
#endif
#ifdef sun
        if (oMaxLag < 1024) {
            sprintf(errmsg, Str(X_99,"-B %d probably too small, suggest 1024"), oMaxLag);
            warning(errmsg);
        }
        if ((audiofd = open("/dev/audio", O_WRONLY)) < 0)
            die(Str(X_1188,"sfinit: cannot open /dev/audio"));
        oshift = getshift(nchnls * dsize);
#endif
#ifdef HP
        AWopen(nchnls, (long)esr, oMaxLag);
/*      if ((audiofd = open("/dev/audio", O_WRONLY)) < 0)
            die(X_1188,"sfinit: cannot open /dev/audio");  */
        oshift = getshift(nchnls * dsize);
#endif
#ifdef NeXT
    {   int protocol, sampleRate;
        if (esr > 33075.0)
            sampleRate = SNDDRIVER_STREAM_TO_SNDOUT_44 ;
        else sampleRate = SNDDRIVER_STREAM_TO_SNDOUT_22 ;
        if (esr != 44100.0 && esr != 22050) {
            long isr = esr, actual = isr > 33075 ? 44100 : 22050;
            sprintf(errmsg,Str(X_452,"SRate 44.1K or 22.05K only. This %ld playing at %ld"),
                    isr, actual);
            warning(errmsg);
        }
        if (nchnls != 2)
            die(Str(X_355,"NeXT supports nchnls = 2 (stereo) output only"));
        SNDAcquire(SND_ACCESS_OUT,0,0,0,NULL_NEGOTIATION_FUN,0,&dev_port,&owner_port);
        snddriver_stream_setup(dev_port, owner_port,
                        sampleRate,  /* make this a switch */
                        4096, 2, low_water, high_water, &protocol, &write_port);
        snddriver_stream_control(write_port, 0, SNDDRIVER_PAUSE_STREAM);
/*      oshift = getshift(dsize);   */  /* what's correct here? oshift currently 0 */
    }                                   /* perhaps driver-writing takes bytes ?    */
#endif
#ifdef LINUX                                       /*  J. Mohr  1995 Oct 17 */
/* The following code not only opens the DSP device (soundcard and driver)
   for writing and initializes it for the proper sample size, rate, and
   channels, but allows the user to set the output volume.                  */
    {
        /* open DSP device for writing */
        if ( (dspfd = open(DSP_NAME, O_WRONLY)) == -1 )
          die(Str(X_1308,"unable to open soundcard for audio output"));

        /* set sample size/format, rate, channels, and DMA buffer size */
        setsndparms( dspfd, O.outformat, nchnls, esr,
                     O.outbufsamps * O.outsampsiz);

        /* check if volume was specified as command line parameter */
        if (O.Volume) {
          /* check range of value specified */
          if (O.Volume > 100 || O.Volume < 0)
            die(Str(X_524,"Volume must be between 0 and 100"));
          setvolume( O.Volume );
        }

        /* 'oshift' is not currently used by the Linux driver, but ... */
        oshift = getshift(nchnls * dsize);
    }
#endif
#ifdef __BEOS__
        if (nchnls != 1 && nchnls != 2) {
          die(Str(X_1128,"playopen: BeOS supports either one or two channels."));
        } else if (openDACPort(nchnls, O.outformat, esr, oMaxLag) < B_NO_ERROR) {
          die(Str(X_1129,"playopen: cannot open DAC."));
        }
#endif
#ifdef WIN32
    {
      unsigned int ndev = waveOutGetNumDevs(), ntmp = 0;
      WAVEOUTCAPS caps;
      /*PCMWAVEFORMAT wavform;*/
      WAVEFORMATEX wavform;     /*RWD: I assume Win32s knows about this...*/
      MMRESULT res;
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
        /*        printf("8bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp); */
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
        /*        printf("16bit %x %d %x\n", O.outformat, wavform.wBitsPerSample, ntmp);*/
      }
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
      die(Str(X_305,"Incompatible sample/channel/width"));    /*RWD.5.97: spelling!*/
    ok:
      wavform.wFormatTag = WAVE_FORMAT_PCM;     /*all these now w-out ~.wf.~*/
      wavform.nChannels = nchnls;
      wavform.nSamplesPerSec = (int)esr;
      wavform.nAvgBytesPerSec = (int)esr*nchnls*(wavform.wBitsPerSample>>3);
      wavform.nBlockAlign = nchnls*(wavform.wBitsPerSample>>3);
      /*      printf("Fields are: %d %d %d %d %d\n", wavform.wBitsPerSample, nchnls, (int)esr, wavform.wf.nAvgBytesPerSec, wavform.wf.nBlockAlign); */
      if (b = waveOutOpen((LPHWAVEOUT)&outdev, ndev,
                          /*(LPCWAVEFORMATEX)*/&wavform,
                          (DWORD)NULL,
                          (DWORD)NULL, CALLBACK_NULL)) {
          printf(Str(X_253,"Error code: %s\n"),
                 b==MMSYSERR_BADDEVICEID ? Str(X_295,"ID is out of range") :
                 b==MMSYSERR_ALLOCATED   ? Str(X_190,"already allocated") :
                 b==MMSYSERR_NOMEM       ? Str(X_501,"unable to allocate or lock memory") :
                 b==WAVERR_BADFORMAT     ? Str(X_1360,"unsupported wave format") :
                                           X_184,"???");
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
        printf(Str(X_620,"buffer %p size %d\n"), wavbuff[b], oMaxLag*dsize*nchnls);
        wavhdr[b].dwBufferLength = oMaxLag*dsize*nchnls;
        wavhdr[b].dwFlags = WHDR_DONE;
        wavhdr[b].dwLoops = 1;
        res=waveOutPrepareHeader(outdev, &wavhdr[b], sizeof(WAVEHDR));
      }
      set_current_process_priority_critical();
    }
#endif
}

int rtrecord(char *inbuf, int nbytes) /* get samples from ADC */
{
#ifdef mills_macintosh
        MacRTRecord(inbuf,nbytes);
#endif
#ifdef DEC
/*      rec_on(inbuf, (long)nbytes >> ishift);   */  /* not yet supported */
#endif
#ifdef SGI
        ALreadsamps(iport, inbuf, (long)nbytes >> ishift);
#endif
#ifdef LINUX                                       /*  J. Mohr  1995 Oct 17 */
        if ( (nbytes = read(dspfd, inbuf, nbytes)) == -1 )
          die(Str(X_736,"error while reading DSP device for audio input"));
#endif
#ifdef __BEOS__
        static size_t bufStart = 0;
        static size_t bufLimit = 0;

        size_t toRead = nbytes;
        while (toRead > 0) {
          size_t bufSize = bufLimit - bufStart;
          if (bufSize > toRead) {
            memcpy(inbuf, adcBuffer + bufStart, toRead);
            bufStart += toRead;
            toRead -= toRead;

          } else {
            int32 dummy;
            ssize_t nRead;

            memcpy(inbuf, adcBuffer + bufStart, bufSize);
            inbuf += bufSize;
            toRead -= bufSize;

            nRead =
              read_port_etc(gADCPort, &dummy, adcBuffer, oMaxLag,
                                                B_TIMEOUT, portTimeout);
            if (nRead < B_NO_ERROR) {
              die(Str(X_1171,"rtrecord: error reading from ADC port"));
            }
            bufStart = 0;
            bufLimit = (size_t)nRead;
          }
        }
#endif
#ifdef WIN32
        {
          MMRESULT res;
          while ((wavInhdr[inrecs%NUMBUF].dwFlags & WHDR_DONE)==0){
            Sleep(1);                    /* if input too fast */
          }
          memcpy(inbuf, wavInbuff[inrecs%NUMBUF], nbytes);
          wavInhdr[inrecs%NUMBUF].dwBufferLength = nbytes;
          res=waveInAddBuffer(indev, &wavInhdr[(inrecs+(NUMBUF-1))%NUMBUF],
                           sizeof(WAVEHDR));
        }
#endif
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
#ifdef mills_macintosh
        /*      while ((((*iobufhandle)->writendx + (MacRtBufsize >> 1)) > (*iobufhandle)->readndx) */
        /*              && (*iobufhandle)->loopback == TRUE); */
        MacRtPlay(outbuf, nbytes);
#endif
#ifdef DEC
        while (get_playbuf_remains() > oMaxLag);  /* once lag is below threshold, */
        play_on(outbuf, sampframes);              /*    send these sample-frames  */
#endif
#ifdef SGI
        ALwritesamps(oport, outbuf, sampframes);
#endif
#ifdef sun
        do {
            if (ioctl(audiofd, AUDIO_GETINFO, &audinfo) < 0)
                die(Str(X_175,"/dev/audio: cannot do AUDIO_GETINFO"));
        } while (sampcnt - audinfo.play.samples > oMaxLag);
        sampcnt += sampframes;
        if (write(audiofd, outbuf, nbytes) < nbytes)
            printf(Str(X_176,"/dev/audio: could not write all bytes requested\n"));
#endif
#ifdef HP
        AudioWrite(outbuf, nbytes);
        /*  should synchcronize with buffer writes here by a wait loop */
/*      do {
            if (ioctl(audiofd, AUDIO_GETINFO, &audinfo) < 0)
                die(X_175,"/dev/audio: cannot do AUDIO_GETINFO");
        } while (sampcnt - audinfo.play.samples > oMaxLag);
*/
#endif
#ifdef NeXT
        snddriver_stream_start_writing(write_port,outbuf,
                        sampframes,1,0,0,1,1,1,1,1,0, reply_port);
        if (nrecs == 3)
            snddriver_stream_control(write_port, 0, SNDDRIVER_RESUME_STREAM);
#endif

#ifdef LINUX                                       /*  J. Mohr  1995 Oct 17 */
        if (write(dspfd, outbuf, nbytes) < nbytes)
            printf(Str(X_177,"/dev/dsp: could not write all bytes requested\n"));
#endif
#ifdef __BEOS__
        while (nbytes > 0) {
          size_t toWrite = (nbytes < oMaxLag) ? nbytes : oMaxLag;
          if (write_port_etc(gDACPort, 0, outbuf, toWrite,
                             B_TIMEOUT, portTimeout) < B_NO_ERROR) {
            printf(Str(X_1170,"rtplay: failed write to DAC port\n"));
          }
          outbuf += toWrite;
          nbytes -= toWrite;
        }
#endif
#ifdef WIN32
        {
          MMRESULT res;
          long ndx = nrecs%NUMBUF;
          DWORD *flgwd = &(wavhdr[ndx].dwFlags);
          while ((*flgwd & WHDR_DONE)==0){
            Sleep(1);                    /* if input too fast */
          }
          memcpy(wavbuff[ndx], outbuf, nbytes);
          wavhdr[ndx].dwBufferLength = nbytes;
          res=waveOutWrite(outdev, &wavhdr[(nrecs+NUMBUF)%NUMBUF],
                           sizeof(WAVEHDR));
        }
#endif
        nrecs++;
}

void rtclose(void)              /* close the I/O device entirely  */
{                               /* called only when both complete */
        MacRtPlayClose();
#endif
#ifdef DEC
        play_rls();
#endif
#ifdef SGI
        if (iport != NULL)
            ALcloseport(iport);
        if (oport != NULL) {
            while (ALgetfilled(oport) > 0)
                sginap(1);
            ALcloseport(oport);
        }
#endif
#ifdef HP
        AWclose();
#endif
#ifdef NeXT
        if (dev_port) {
            SNDRelease(SND_ACCESS_OUT,dev_port, owner_port) ;
            port_deallocate(task_self(),reply_port);
        }
#endif
#ifdef LINUX                                       /*  J. Mohr  1995 Oct 17 */
        if (close(dspfd) == -1)
          die(Str(X_1306,"unable to close DSP device"));
#endif
#ifdef __BEOS__
        closeADCPort();
        closeDACPort();
#endif
#ifdef WIN32
        {
          clock_t t0;
          /* and wait for everything to finish */
          do {
            while ((wavhdr[nrecs%NUMBUF].dwFlags & WHDR_DONE)==0) Sleep(1);
            waveOutWrite(outdev, &wavhdr[(nrecs++)%NUMBUF], sizeof(WAVEHDR));
          } while (nrecs * O.outbufsamps <= *pcurp2 * esr) ;
          t0 = clock();         /* From Gabriel Maldanado */
          while(clock() < t0+ 2* CLOCKS_PER_SEC) ; /* 2 seconds delay for flushing buffers */
          waveOutReset(outdev);
          waveOutClose(outdev);
          if (rtin_enabled) {
            waveInStop (indev);
            waveInReset (indev);
            waveInClose (indev);
            rtin_enabled = 0;
          }
          isActive=FALSE;
        }
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

#ifdef WIN32
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
         nRet=SetPriorityClass(  currProcess, NORMAL_PRIORITY_CLASS     );
         currThread = GetCurrentThread();
         nRet=SetThreadPriority( currThread,  THREAD_PRIORITY_NORMAL );
}


#endif
