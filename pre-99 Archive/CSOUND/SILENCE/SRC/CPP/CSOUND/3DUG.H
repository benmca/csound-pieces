#ifndef _3DUG_H_
#define _3DUG_H_

#define SAMP_RATE 44100  /* sampling rate of HRTFs */

#define FILT_LEN 128L
#define FILT_LENm1 (FILT_LEN-1)
#define BUF_LEN (FILT_LEN*2)
#define BLOCK_SIZE 1024

#define MIN_ELEV        -40
#define MAX_ELEV        90
#define ELEV_INC        10
#define N_ELEV          (((MAX_ELEV - MIN_ELEV) / ELEV_INC) + 1)
#define MIN_AZIM        -180
#define MAX_AZIM        180

/*
 * This array gives the total number of azimuths measured
 * per elevation, and hence the AZIMUTH INCREMENT. Note that
 * only azimuths up to and including 180 degrees actually
 * exist in file system (because the data is symmetrical.
 */

/* int elevation_data[N_ELEV] = {56, 60, 72, 72, 72, 72, 72, 60, 56, 45, 36, 24, */
/* 12, 1 }; */

typedef struct {
  MYFLT left[256];  /* left and right will hold FFTed values of HRTFs */
  MYFLT right[256];
} HRTF_DATUM;

#endif
