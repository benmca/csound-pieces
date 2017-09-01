#include <dos.h>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define AE_SHORT (0x104)

/* ************************************************************
   Sound blaster and compatables? sound driver for CSound
   John Fitch, March 1994
   ************************************************************
*/
/* This version uses a double buffering scheme in low memory, and polls for
   completion. */
/* Version 12 */

#define VERBOS  (8)
#define TRUE    (1)
#define FALSE   (0)
unsigned int sb_ioaddr = 0x0220;
unsigned int sb_midiport = 0x0330;
#define DSP_MIXER_ADDR  (sb_ioaddr+0x04)
#define DSP_MIXER_DATA  (sb_ioaddr+0x05)
#define DSP_RST         (sb_ioaddr+0x06)
#define DSP_DIN         (sb_ioaddr+0x0A)
#define DSP_CMD         (sb_ioaddr+0x0C)
#define DSP_DAS         (sb_ioaddr+0x0E)
#define MIDI_DIN        (sb_midiport+0x0A)
#define MIDI_CMD        (sb_midiport+0x0C)
#define MIDI_DAS        (sb_midiport+0x0E)

#define SB_DMA_STATUS   0x08
#define SB_DMA_MASK     (dmaChns[channel].singleMask)
#define SB_DMA_MODE     (dmaChns[channel].mode)
#define SB_DMA_FF       (dmaChns[channel].clearFF)

static unsigned int channel;
struct dmaChannel {
/*    char	number;		/* channel number */
/*    char	bit;		/* channel bit */
    short		baseAddr;	/* address port*/
    short		wordCount;	/* word count port */
    short		request;	/* request port */
    short		singleMask;	/* mask port */
    short		mode;		/* mode port */
    short		clearFF;	/* clear flip-flop port */
    short		page;		/* page port */
} dmaChns[] = {
    { /*0, 1,*/ 0x00, 0x01, 0x09, 0x0A, 0x0B, 0x0C, 0x87 },
    { /*1, 2,*/ 0x02, 0x03, 0x09, 0x0A, 0x0B, 0x0C, 0x83 },
    { /*2, 4,*/ 0x04, 0x05, 0x09, 0x0A, 0x0B, 0x0C, 0x81 },
    { /*3, 8,*/ 0x06, 0x07, 0x09, 0x0A, 0x0B, 0x0C, 0x82 },
    { /*4, 1,*/ 0xC0, 0xC2, 0xD2, 0xD4, 0xD6, 0xD8, 0x8F },
    { /*5, 2,*/ 0xC4, 0xC6, 0xD2, 0xD4, 0xD6, 0xD8, 0x8B },
    { /*6, 4,*/ 0xC8, 0xCA, 0xD2, 0xD4, 0xD6, 0xD8, 0x89 },
    { /*7, 8,*/ 0xCC, 0xCE, 0xD2, 0xD4, 0xD6, 0xD8, 0x8A }
};


/* int pages[] = {0x87,0x83,0x81,0x82,0x8F,0x8B,0x89,0x8A}; */

/* DSP Commands */
#define SB_BASE                 (dmaChns[channel].baseAddr)
#define SB_COUNT                (dmaChns[channel].wordCount)
#define SB_DIRECT_8_BIT_DAC     0x10
#define SB_DMA_8_BIT_DAC        0x14
#define SB_DMA_2_BIT_DAC        0x16
#define SB_DIRECT_ADC           0x20
#define SB_DMA_ADC              0x24
#define SB_MIDI_READ_POLL       0x30
#define SB_MIDI_READ_IRQ        0x31
#define SB_MIDI_WRITE_POLL      0x38
#define SB_TIME_CONSTANT        0x40
#define SB_HS_SIZE              0x48
#define SB_DMA_4_BIT_DAC        0x74
#define SB_DMA_26_BIT_DAC       0x76
#define SB_HS_DAC               0x91
#define SB_DMA2                 0xC0
#define SB_HALT_DMA             0xD0
#define SB_SPEAKER_ON           0xD1
#define SB_SPEAKER_OFF          0xD3
#define SB_CONTINUE_DMA         0xD4
#define SB_DSP_ID               0xE0
#define SB_DSP_VER              0xE1

/*---Based very losely on------------------------------------------------------
 * Copyright (c), David Welch, 1993
 * and on the David Baggett code in the public domain
 *----------------------------------------------------------------------------*/
#ifdef TESTING
#define dspwrite(c)     { err_printf( "dspwrite(%2x) ", c); while(inp(DSP_CMD)&0x80);  OUTP(DSP_CMD,c); }
#define dspread(c)      { while(!(inp(DSP_DAS)&0x80)); c = inp(DSP_DIN); err_printf( "dspread()=%2x ",c); }
#define OUTP(p,c)       { err_printf( "out(%.2x,%.2x) ", p,c); outp(p,c); }
#else
#define dspwrite(c)     { while(inp(DSP_CMD)&0x80);  OUTP(DSP_CMD,c); }
#define dspread(c)      { while(!(inp(DSP_DAS)&0x80)); c = inp(DSP_DIN);}
#define OUTP(p,c)       outp(p,c)
#endif
#define dmahalt()       dspwrite(SB_HALT_DMA);
#define spkon()         dspwrite(SB_SPEAKER_ON);
#define spkoff()        dspwrite(SB_SPEAKER_OFF);
#define dmastatus()     (inp(SB_DMA_STATUS)&2);

static int stereo = FALSE;
static int sixteen = FALSE;

int next_buff = 0;              /* Which buffer to use next */
unsigned char* data_ptr[3];     /* Allow 3 although only use 2 */
unsigned int aligned[3];
unsigned char aligned_physical[3];
static int advanced_features;
static int high_speed = 0;
static int sb_active = FALSE;   /* Keep track of whether we started the DMA */
static int buff_size;           /* Remember buffer sizes */
static int verbos;

extern void* outbuf;

/* Get a buffer of suitable length and alignment */
void* 
sbmalloc( long oMaxLag, int msglevel )
{
  union REGS regin;
  union REGS regout;
  unsigned int space; 
  int i = 0;
  regin.h.ah = 0x48;
#ifdef __WATCOMC__
  regin.x.ebx = (3*oMaxLag)>>4;  /* Get 3 buffers so can use 2 */
#else
  regin.x.bx = (3*oMaxLag)>>4;  /* Get 3 buffers so can use 2 */
#endif
  intdos(&regin,&regout);       /* DOS call to get low memory */
  if (regout.x.cflag) {
    err_printf( "Failed to get memory\n");
    if (O.Linein) RTclose();
    exit(1);
  }
#ifdef __WATCOMC__  
  space = regout.x.eax<<4;
#else
  space = regout.x.ax<<4;
#endif
  if (space==0) {
    err_printf( "Memory Allocation Error\n");
    if (O.Linein) RTclose();
    exit(1);
  }
  else if (verbos =(msglevel & VERBOS))
        err_printf( "Dataspace = %x\n", space);
  if ((space+oMaxLag-1)>>16 == space>>16) {
    aligned_physical[i] = space>>16;
    aligned[i] = space;
#ifdef __WATCOMC__
    data_ptr[i] = (unsigned char *)regout.x.ebx;
#else
    data_ptr[i] = (unsigned char *)regout.e.ebx;
#endif
    i++;
  }
  if ((space+2*oMaxLag-1)>>16 == (space+oMaxLag)>>16) {
    aligned[i] = space+oMaxLag;
    aligned_physical[i] = (space+oMaxLag)>>16;
#ifdef __WATCOMC__
    data_ptr[i] = (unsigned char *)regout.x.ebx + oMaxLag;
#else
    data_ptr[i] = (unsigned char *)regout.e.ebx + oMaxLag;
#endif
    i++;
  }
  if ((space+3*oMaxLag-1)>>16 == (space+2*oMaxLag)>>16) {
    aligned[i] = space+2*oMaxLag;
    aligned_physical[i] = (space+2*oMaxLag)>>16;
#ifdef __WATCOMC__
    data_ptr[i] = (unsigned char *)regout.x.ebx + 2*oMaxLag;
#else
    data_ptr[i] = (unsigned char *)regout.e.ebx + 2*oMaxLag;
#endif
    i++;
  }
  if (verbos) {
    err_printf( "Physical[0] = %2x, aligned[0] = %x, Pointer[0]=%p\n",
            aligned_physical[0], aligned[0], data_ptr[0]);
    err_printf( "Physical[1] = %2x, aligned[1] = %x, Pointer[1]=%p\n",
            aligned_physical[1], aligned[1], data_ptr[1]);
    if (i==3) 
      err_printf( "Physical[2] = %2x, aligned[2] = %x, Pointer[2]=%p\n",
              aligned_physical[2], aligned[2], data_ptr[2]);
  }
  buff_size = oMaxLag;
  return data_ptr[0];
}

void 
sbsettc ( int isr )
/* tc = time constant = 256L - (1000000UL/samples per second) */
{
    unsigned char tc;
    if (stereo) isr *= 2;
    tc = 256UL-(1000000UL/isr);
    inp(DSP_DAS);
    dspwrite(SB_TIME_CONSTANT);
    dspwrite(tc);
    high_speed = (isr > 22222);
    err_printf( "Time set to %d (representing %d)\n", tc, isr);
    if (high_speed) err_printf( "High speed set\n");
}

static void 
sb_wait(void)
{       /* Wait for -1 count */
    unsigned short x,y;
    int i= 1000;		/* A timout control */
    err_printf( "wait %d..(%x)", channel, SB_COUNT);
    do {
	x = inp(SB_COUNT);
	y = inp(SB_COUNT);
	i--;
	err_printf( "%.2x%.2x ", y, x);
    } while ((x != 0xff || y != 0xff) && i>0);
}

void 
sbinit(float esr, int oMaxLag, int nchnls, int format)
{
  unsigned short x;
  int isr = (int) esr;
  int major, minor;
  char *env = getenv("BLASTER");
  char tmp[128];
  int dma = 1, hidma = 6;
  int irq = 5, type = 6;

  if (env == NULL) {
      sb_ioaddr = 0x0220;
      sb_midiport = 0x330;
  }
  else {
      err_printf( "BLASTER=%s\n", env);
      if (strlen(env)>=128) 
          err_printf( "BLASTER environment rather long!\n");
      strncpy(tmp,env,128);
      env = strtok(tmp, " \t");
      while (env != NULL) {
          switch(toupper(env[0])) {
          case 'A':
              sb_ioaddr = (int)strtol(env+1, NULL, 16);
              break;
          case 'I':
              irq = atoi(env+1);
              break;
          case 'D':
              dma = atoi(env+1);
              break;
          case 'H':
              hidma = atoi(env+1);
              break;
          case 'P':
              sb_midiport = (int)strtol(env+1, NULL, 16);
              break;
          case 'T':
              type = atoi(env+1);
              break;
          default:
              err_printf(
                      "Unknown component of BLASTER environment variable: %c\n",
                      env[0]);
          }
          env = strtok(NULL, " \t");
      }
  }
  if (format==AE_SHORT) 
      channel = hidma, sixteen = TRUE;
  else 
      channel = dma, sixteen = FALSE;
      
err_printf( "Channel = %d, sixteen=%d\n", channel, sixteen);

  inp(DSP_DAS);
  OUTP(DSP_RST,0x01);           /* Send reset */
  inp(DSP_RST);
  inp(DSP_RST);
  inp(DSP_RST);
  inp(DSP_RST);         /* Wait a while */
  OUTP(DSP_RST,0x00);
  for (x=0;x<100;x++) {
      if (inp(DSP_DAS)&0x80) {
          if (inp(DSP_DIN)==0xAA) break; /* Found SndBlster */
      }
  }
  if (x==100) {
      err_printf("Sound Blaster not found at %xh\n", sb_ioaddr);
      if (O.Linein) RTclose();
      exit(1);
  }
  else err_printf("Sound Blaster found at %xh\n", sb_ioaddr);
  dspwrite(SB_DSP_VER);
  dspread(major);
  dspread(minor);
  err_printf( "DSP version %u.%u\n",major,minor);
  advanced_features = major;
  if (nchnls == 2) {
      if (advanced_features>=2) {
          err_printf(
            "Stereo will work on this Sound Blaster, but not certain how!\n");
          stereo = TRUE;
      }
      else {
          err_printf(
                  "Stereo will not work on this model of Sound Blaster\n");
      }
  }
  else if (nchnls == 4) {
      err_printf( "No quadsound on this hardware!!\n");
  }
  sbsettc(isr);
  spkon();
  sb_active = FALSE;            /* Nothing happening yet */
  next_buff = 0;                /* Use buffer zero first */
}

void 
sbplay(char* outbuff, int nbytes)
{
/*  if (nbytes > buff_size) {
 *      err_printf( "Buffer too long (%d) cut to %d\n", nbytes, buff_size);
 *      nbytes = buff_size;
 *  }
 */

  if (sixteen) nbytes = nbytes >> 1; /* 16 bit rather than bytes */
  nbytes--;
  if (verbos) err_printf( "\nBuff=%p\n", outbuff);
  if (sb_active) sb_wait();     /* Wait for last transfer to finish */

  OUTP(SB_DMA_MASK,0x04 | (channel&3)); 
  if (sixteen) {
      OUTP(SB_BASE,(aligned[next_buff]>>1)&0xff); /* Offset in page */
      OUTP(SB_BASE,(aligned[next_buff]>>9)&0xff);
      OUTP(dmaChns[channel].page, (aligned_physical[next_buff])>>1);
  }
  else {
      OUTP(SB_BASE, aligned[next_buff]&0xff);  /* Offset in page */
      OUTP(SB_BASE, (aligned[next_buff]>>8)&0xff);
      OUTP(dmaChns[channel].page, aligned_physical[next_buff]);
  }
  OUTP(SB_DMA_FF,0x00);
  OUTP(SB_COUNT, (unsigned char)(nbytes&0xFF));
  OUTP(SB_COUNT, (unsigned char)((nbytes>>8)&0xFF));
  OUTP(SB_DMA_MODE,0x48|(channel&3)); /* Used to be 49 */
  OUTP(SB_DMA_MASK,channel&3);

  if (!sb_active && stereo) {
      OUTP(DSP_MIXER_ADDR, 0x0e);
      OUTP(DSP_MIXER_DATA, 0x13);
  }
  if (advanced_features>= 2 && high_speed) {
      dspwrite(SB_HS_SIZE);
      dspwrite((unsigned char)(nbytes&0xFF));
      dspwrite((unsigned char)((nbytes>>8)&0xFF));
      dspwrite(SB_HS_DAC);
  }
  else {
      dspwrite(SB_DMA_8_BIT_DAC);
      dspwrite((unsigned char)(nbytes&0xFF));
      dspwrite((unsigned char)((nbytes>>8)&0xFF));
  }
  sb_active = TRUE;
  next_buff = (1-next_buff); /* Only two buffers */
  outbuf = data_ptr[next_buff];
}

void 
sbfinish(void)
{
  int i = 10000;
  if (sb_active) {
      sb_wait();
  }
  sb_active = FALSE;
  if (stereo) {
      OUTP(DSP_MIXER_ADDR, 0x0e);
      OUTP(DSP_MIXER_DATA, 0x11);
  }
  OUTP(dmaChns[channel].singleMask, (channel&3)|4); /* Switch off DMA */
  OUTP(dmaChns[channel].clearFF, 0);
  spkoff();
/*  dos_free(data_space); */
}

int readmidi(char *mbuf, int size)
{
    int n = -1;
    dspwrite(SB_MIDI_READ_POLL); 
    if (!(inp(MIDI_DAS) & 0x80)) return (0);    /* Nothing waiting */
    while (inp(MIDI_DAS) & 0x80) {
        mbuf[++n] = inp(MIDI_DIN);      /* Store data */
        if (n==size-1) break;           /* Buffer full */
    }
    return n+1;
}
