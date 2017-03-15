/*
 *  Linux code based on examples in the "Hacker's Guide to VoxWare 2.4" 
 *  and the file "experimental.txt" accompanying the source code
 *  for VoxWare 2.9 and later (provided with the Linux kernel source),
 *  both by Hannu Savolainen (hannu@voxware.pp.fi).
 *  
 *  The code not only initializes the sound board and driver for the correct
 *  sample size, rate, and channels, but customizes the DMA buffers to
 *  match Csound's input or output buffer size.
 *
 *  A new option ('-V') was added to Csound to allow the user to set the
 *  master output volume on the soundcard.
 *
 *  Jonathan Mohr
 *  Augustana University College
 *  Camrose, Alberta, Canada  T4V 2R3
 *  mohrj@augustana.ab.ca             
 *
 *  1995 Oct 17 
 */

#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/soundcard.h>
#include "cs.h"
#include "soundio.h"

#define MIXER_NAME  "/dev/mixer"


void setsndparms( int dspfd, int format, int nchnls, FLOAT esr, 
		  unsigned bufsiz )
{
  int parm, original;
  unsigned frag_size;

  /* set sample size/format */
  switch ( format ) {
  case AE_UNCH:	 /* unsigned char - standard Linux 8-bit format */
    parm = AFMT_U8;
    break;
  case AE_CHAR:	 /* signed char. - probably not supported by Linux */
    parm = AFMT_S8;
    break;
  case AE_ULAW:
    parm = AFMT_MU_LAW; 
    break;
  case AE_ALAW:
    parm = AFMT_A_LAW;
    break;
  case AE_SHORT:
#ifdef LINUX_BE
    parm = AFMT_S16_BE;	/* Linux on SPARC is big-endian */
#else	     
    parm = AFMT_S16_LE;	/* Linux on Intel x86 is little-endian */
#endif
    break;
  case AE_LONG:
    die("Linux sound driver does not support long integer samples");
  case AE_FLOAT:
    die("Linux sound driver does not support floating-point samples");
  default:
    /* Linux sound driver provides these names for modes not used by Csound */
    /* parm = AFMT_IMA_ADPCM; */
    /* parm = AFMT_U16_LE;    */
    /* parm = AFMT_U16_BE;    */
    die("unknown sample format");
  }
  original = parm;
  if (ioctl(dspfd, SOUND_PCM_WRITE_BITS, &parm) == -1)
    die("unable to set requested sample format on soundcard");
  if (parm != original) 
    die("soundcard does not support the requested sample format");
  
  /* set number of channels (mono or stereo) */
  parm = nchnls;
  if (ioctl(dspfd, SOUND_PCM_WRITE_CHANNELS, &parm) == -1)
    die("unable to set mode (mono/stereo) on soundcard");
  if (parm != nchnls)
    die("DSP device does not support the requested mode (mono/stereo)");
  
  /* set the sample rate */
  parm = (int) esr;
  if (ioctl(dspfd, SOUND_PCM_WRITE_RATE, &parm) == -1)
    die("unable to set sample rate on soundcard");
  if (parm != (int) esr) {
    sprintf(errmsg,"Sample rate set to %d (instead of %d)",
	    parm, (int) esr);
    warning(errmsg);
  }
  
  /* set DMA buffer fragment size to Csound's output buffer size */
  parm = 0; frag_size = 1; 
  /* find least power of 2 >= bufsiz */
  while ( frag_size < bufsiz ) {
    frag_size <<= 1;
    parm++;
  }
  parm |= 0x00ff0000;	/* use max. number of buffer fragments */
  if (ioctl(dspfd, SNDCTL_DSP_SETFRAGMENT, &parm) == -1)
    die("failed while trying to set soundcard DMA buffer size");
  
  /* find out what buffer size the driver allocated */
  if (ioctl(dspfd, SNDCTL_DSP_GETBLKSIZE, &parm) == -1)
    die("failed while querying soundcard about buffer size");
  if (parm != frag_size) {
    sprintf(errmsg,
	    "Soundcard DMA buffer size set to %d bytes (instead of %d)",
	    parm, frag_size);
    warning(errmsg);
  }
  else
    printf("hardware buffers set to %d bytes\n", parm);
}


void setvolume( unsigned volume )
{
  int mixfd, parm;

  /* open mixer device for writing */
  if ( (mixfd = open(MIXER_NAME, O_WRONLY)) == -1 )
    die("unable to open soundcard mixer for setting volume");

  /* set volume (left and right channels the same) */
  parm = (volume & 0xff) | ((volume & 0xff) << 8); 
  if (ioctl(mixfd, SOUND_MIXER_WRITE_VOLUME, &parm) == -1)
    die("unable to set output volume on soundcard"); 

  /* close mixer device */
  if ( close(mixfd) == -1 )
    die("error while closing sound mixer device");
}

 
