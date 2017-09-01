#include "cs.h"                                       /*    MIDISEND.C    */
#include "midioops.h"

#ifdef LINUX
/* 
   This is very provisional code for Linux Csound MIDI output. Data
   from Gabriel Maldonado's opcodes is sent to these functions and out
   the indicated MIDI port. At this time the port is hardwired to the
   first available MIDI port (DEVNUM 0). I'll work on activating the
   -Q flag which should then allow the user to indicate which
   interface he or she wishes to use. 
   DLP October, 1997
*/
#include <unistd.h>
#include <stdarg.h>
#include <ctype.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/soundcard.h>

extern int midi_out;

#define MIDI_DEV "/dev/sequencer"
#define DEVNUM 0
#endif

/* The MIDI output requires the following functions to be defined */

void send_midi_message(int /*status*/, int /*data1*/, int /*data2*/);
void note_on(int /*chan*/, int /*num*/, int /*vel*/);
void note_off(int /*chan*/, int /*num*/, int /*vel*/);
void control_change(int /*chan*/, int /*num*/, int /*value*/);
void after_touch(int /*chan*/, int /*value*/);
void program_change(int /*chan*/, int /*num*/);
void pitch_bend(int /*chan*/, int /*lsb*/, int /*msb*/);
void poly_after_touch(int /*chan*/, int /*note_num*/, int /*value*/);
void openMIDIout(void);

int MIDIoutDONE = 0;

#ifdef LINUX
void seqbuf_dump(void);

int seqfd;
SEQ_DEFINEBUF(128);

unsigned char _seqbuf[];
int _seqbuflen;
int _seqbufptr;

void seqbuf_dump()
{
    if (_seqbufptr)
      if (write (seqfd, _seqbuf, _seqbufptr) == -1)
        perror("Can't write to MIDI device");
    _seqbufptr = 0;
}

#define gotMIDIout 1

void send_midi_message(int status, int data1, int data2)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,status);
  SEQ_MIDIOUT(DEVNUM,data1);
  SEQ_MIDIOUT(DEVNUM,data2);
  seqbuf_dump();  
}

void note_on(int chan, int num, int vel)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_NOTEON+chan);
  SEQ_MIDIOUT(DEVNUM,num);
  SEQ_MIDIOUT(DEVNUM,vel);
  seqbuf_dump();
}

void note_off(int chan, int num, int vel)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_NOTEOFF+chan);
  SEQ_MIDIOUT(DEVNUM,num);
  SEQ_MIDIOUT(DEVNUM,vel);
  seqbuf_dump();
}

void control_change(int chan, int num, int value)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_CNTRLCHG+chan);
  SEQ_MIDIOUT(DEVNUM,num);
  SEQ_MIDIOUT(DEVNUM,value);
  seqbuf_dump();
}

void after_touch(int chan, int value)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_CHANPRESS+chan);
  SEQ_MIDIOUT(DEVNUM,value);
  seqbuf_dump();
}

void program_change(int chan, int num)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_PGMCHG+chan);
  SEQ_MIDIOUT(DEVNUM,num);
  seqbuf_dump();
}

void pitch_bend(int chan, int lsb, int msb)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_PTCHBENDCHG+chan);
  SEQ_MIDIOUT(DEVNUM,lsb);
  SEQ_MIDIOUT(DEVNUM,msb);
  seqbuf_dump();
}

void poly_after_touch(int chan, int note_num, int value)
{
/*   openMIDIout(); */
  SEQ_MIDIOUT(DEVNUM,MD_POLYAFTER+chan);
  SEQ_MIDIOUT(DEVNUM,note_num);
  SEQ_MIDIOUT(DEVNUM,value);
  seqbuf_dump();
}  

void openMIDIout()
{
    if (MIDIoutDONE==0 && (seqfd = open(MIDI_DEV, O_WRONLY)) == -1)
      printf("Can't open MIDI device\n");
    MIDIoutDONE = 1;
}

#endif

/* ********************************* */
/* This section for Windows95 and NT */
/* ********************************* */

#ifdef WIN32
#define _gotMIDIout (1)

typedef unsigned long DWORD;

/* This is to fool the include file! */
#define _WINSOCKAPI_
#define _WINBASE_
#define _WINUSER_
#define _WINNLS_
#define _WINCON_
#define _WINREG_
#define _LZEXPAND_
#define _INC_SHELLAPI
#define _WINPERF_
#define _INC_COMMDLG
#define _PRSHT_H_
#define _WINSPOOL_
#define __objidl_h__
#define _OBJBASE_H_
#define __oaidl_h__
#define _OLEAUTO_H_
#define __oleidl_h__
#define _OLE2_H_

#include <wtypes.h>
#include <mmsystem.h>
/* typedef unsigned short HMIDIOUT; */

static HMIDIOUT MIDIoutport = NULL;

#ifndef GAB_RT	/* gab-A1 */
void send_midi_message(int status, int data1, int data2)
{
  midiOutShortMsg(MIDIoutport, (data2<<16)+(data1<<8)+status);
}

void note_on(int chan, int num, int vel)
{
   midiOutShortMsg(MIDIoutport, (vel<<16)+(num<<8)+MD_NOTEON+chan);
}

void note_off(int chan, int num, int vel)
{
   midiOutShortMsg(MIDIoutport, (vel<<16)+(num<<8)+MD_NOTEOFF+chan);
}

void control_change(int chan, int num, int value)
{
   midiOutShortMsg(MIDIoutport, (value<<16)+(num<<8)+MD_CNTRLCHG+chan);
}

void after_touch(int chan, int value)
{
   midiOutShortMsg(MIDIoutport, (value<<8)+MD_CHANPRESS+chan);
}

void program_change(int chan, int num)
{
   midiOutShortMsg(MIDIoutport, (num<<8)+MD_PGMCHG+chan);
}

void pitch_bend(int chan, int lsb, int msb)
{
   midiOutShortMsg(MIDIoutport, (msb<<16)+(lsb<<8)+MD_PTCHBENDCHG+chan);
}

void poly_after_touch(int chan, int note_num, int value)
{
   midiOutShortMsg(MIDIoutport, (value<<16)+(note_num<<8)+MD_POLYAFTER+chan);
}
#endif /*GAB_RT*/

void openMIDIout(void)
{
  unsigned int DeviceNum = midiOutGetNumDevs();
  unsigned int j=0;
  char *dev;
  MIDIOUTCAPS moc;
  if (DeviceNum==0) {
    err_printf("No MIDI device available\n");
    return;
  }
  /* For now select MIDI device 0 */
  dev = getenv("MIDIOUTDEV");
  if (dev==NULL) j = 0;
  else sscanf(dev,"%ud", &j);
  if (j>=DeviceNum) j = 0;
  midiOutGetDevCaps(j, &moc, sizeof(moc));
  err_printf("MIDI OUT %u: %s\n", j, moc.szPname);
  if (j=midiOutOpen(&MIDIoutport, j, (DWORD)NULL, 0, 0)) {
    err_printf("Failed to open MIDI OUT due to %s\n",
               j==MMSYSERR_BADDEVICEID ? "Specified device is out of range" :
               j==MMSYSERR_ALLOCATED   ? "Already allocated" :
               j==MMSYSERR_NOMEM       ? "Unable to allocate or lock memory" :
               j==MIDIERR_NOMAP        ? "No current MIDI map" :
               j==MIDIERR_NODEVICE     ? "Port in map does not exist" :
               "Unknown");
    return;
  }
  MIDIoutDONE = 1;
}

#endif

#ifdef SGI
#include <fcntl.h>
#include <sys/types.h>
#include <sys/termio.h>
#include <sys/z8530.h>
#include <sys/stropts.h>

#define _gotMIDIout (1)
static int MIDIoutport = -1;

void send_midi_message(int status, int data1, int data2)
{
  char xx[3];
  xx[0] = status;
  xx[1] = data1;
  xx[2] = data2;
  write(MIDIoutport, xx, 3);
}

void note_on(int chan, int num, int vel)
{
  char xx[3];
  xx[0] = MD_NOTEON+chan;
  xx[1] = num;
  xx[2] = vel;
  write(MIDIoutport, xx, 3);
}

void note_off(int chan, int num, int vel)
{
  char xx[3];
  xx[0] = MD_NOTEOFF+chan;
  xx[1] = num;
  xx[2] = vel;
  write(MIDIoutport, xx, 3);
}

void control_change(int chan, int num, int value)
{
  char xx[3];
  xx[0] = MD_CNTRLCHG+chan;
  xx[1] = num;
  xx[2] = value;
  write(MIDIoutport, xx, 3);
}

void after_touch(int chan, int value)
{
  char xx[3];
  xx[0] = MD_CHANPRESS+chan;
  xx[1] = value&0xff;
  xx[2] = value>>8;
  write(MIDIoutport, xx, 3);
}

void program_change(int chan, int num)
{
  char xx[2];
  xx[0] = MD_PGMCHG+chan;
  xx[1] = num;
  write(MIDIoutport, xx, 2);
}

void pitch_bend(int chan, int lsb, int msb)
{
  char xx[3];
  xx[0] = MD_PTCHBENDCHG+chan;
  xx[1] = lsb;
  xx[2] = msb;
  write(MIDIoutport, xx, 3);
}

void poly_after_touch(int chan, int note_num, int value)
{
  char xx[3];
  xx[0] = MD_POLYAFTER+chan;
  xx[1] = note_num;
  xx[2] = value;
  write(MIDIoutport, xx, 3);
}

void openMIDIout(void)
{
  int		  OutputFlag;
  int             arg;
  struct termio   t;
  struct strioctl str;

  OutputFlag = O_RDWR | O_NDELAY;
  MIDIoutport = open("/dev/midi", OutputFlag, 0666);
  if (MIDIoutport < 0) {
    err_printf("Unable to open Midi Port %s\n", "/dev/midi");
    return;
  }
  t.c_iflag = IGNBRK;
  t.c_oflag = 0;
  t.c_cflag = B9600 | CS8 | CREAD | CLOCAL | HUPCL;
  t.c_lflag = 0;
  t.c_line = 1;
  t.c_cc[VINTR] = 0;
  t.c_cc[VQUIT] = 0;
  t.c_cc[VERASE] = 0;
  t.c_cc[VKILL] = 0;
  t.c_cc[VMIN] = 1;
  t.c_cc[VTIME] = 0;
  ioctl(MIDIoutport, TCSETAF, &t);
  if (ioctl(MIDIoutport, I_POP, 0) < 0) {
    err_printf("Unable to configure MIDI port\n");
    return;
  }
  str.ic_cmd = SIOC_RS422;
  str.ic_timout = 0;
  str.ic_len = 4;
  arg = RS422_ON;
  str.ic_dp = (char *)&arg;
  if (ioctl(MIDIoutport, I_STR, &str) < 0) {
      err_printf("Can't ioctl RS422\n");
      return;
  }
  str.ic_cmd = SIOC_EXTCLK;
  str.ic_timout = 0;
  str.ic_len = 4;
  arg = EXTCLK_32X;
  str.ic_dp = (char *)&arg;
  if (ioctl(MIDIoutport, I_STR, &str) < 0) {
      err_printf("Can't ioctl EXTCLK\n");
      return;
  }
  str.ic_cmd = SIOC_ITIMER;
  str.ic_timout = 0;
  str.ic_len = 4;
  arg = 0;
  str.ic_dp = (char *)&arg;
  if (ioctl(MIDIoutport, I_STR, &str) < 0) {
      err_printf("Can't ioctl ITIMER");
      return;
  }
  MIDIoutDONE = 1;
}

#endif

#ifndef _gotMIDIout

void send_midi_message(int status, int data1, int data2)
{
  err_printf("No MIDI: send_midi_message(%d,%d,%d)\n", status, data1, data2);
  exit(1);
}

void note_on(int chan, int num, int vel)
{
  err_printf("No MIDI: note_on(%d,%d,%d)\n", chan, num, vel);
  exit(1);
}

void note_off(int chan, int num, int vel)
{
  err_printf("No MIDI: note_off(%d,%d,%d)\n", chan, num, vel);
  exit(1);
}

void control_change(int chan, int num, int value)
{
  err_printf("No MIDI: control_change(%d,%d,%d)\n", chan, num, value);
  exit(1);
}

void after_touch(int chan, int value)
{
  err_printf("No MIDI: after_touch(%d,%d)\n", chan, value);
  exit(1);
}

void program_change(int chan, int num)
{
  err_printf("No MIDI: program_change(%d,%d)\n", chan, num);
  exit(1);
}

void pitch_bend(int chan, int lsb, int msb)
{
  err_printf("No MIDI: pitch_bend(%d,%d,%d)\n", chan, lsb, msb);
  exit(1);
}

void poly_after_touch(int chan, int note_num, int value)
{
  err_printf("No MIDI: poly_after_touch(%d,%d,%d)\n", chan, note_num, value);
  exit(1);
}

void openMIDIout(void)
{
  err_printf("No MIDI: openMIDIout()\n");
  exit(1);
}

#endif


