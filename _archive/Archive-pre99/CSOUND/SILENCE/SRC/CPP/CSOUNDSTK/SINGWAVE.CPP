/*******************************************/
/*  "Singing" Looped Soundfile Class,      */
/*  by Perry R. Cook, 1995-96              */ 
/*  This Object contains all that's needed */
/*  to make a pitched musical sound, like  */
/*  a simple voice or violin.  In general, */  
/*  it will not be used alone (because of  */
/*  of munchinification effects from pitch */
/*  shifting.  It will be used as an       */
/*  excitation source for other instruments*/
/*******************************************/

#include "SingWave.h"
#include <sys/stat.h>
#include <sys/types.h>

#ifdef __LITTLE_ENDIAN__
  #include "ByteSwap.h"
#endif
 
SingWave :: SingWave(char *fileName)
{
	FILE *fd;
  char msg[256];

  // Use the system call "stat" to determine the file length
  struct stat filestat;
  if (stat(fileName, &filestat) == -1)
    { /* Opening file failed */
      sprintf(msg, "SingWave: Couldn't stat or find file (%s).\n", fileName);
      throw StkError(msg, StkError::FILE_NOT_FOUND);
    }
  length = (long) filestat.st_size / 2;  // length in 2-byte samples

  // Open the file and read samples into data[]
  fd = fopen(fileName,"rb");
  if (!fd)   {
    sprintf(msg, "SingWave: Couldn't open or find file (%s).\n", fileName);
    throw StkError(msg, StkError::FILE_NOT_FOUND);
  }

	fseek(fd,0,0);
  data = (MY_FLOAT *) new MY_FLOAT[(length+1)];

  // Read samples into data[].  Use MY _FLOAT data structure to store INT16 samples
  INT16 *buf = (INT16 *)data;
  fseek(fd,0,SEEK_SET);  // Only here to bypass bug in Linux glibc 2.1x (RedHat 6.0)
  fread(buf,length,2,fd);
  // Convert in place (unpack) to MY_FLOAT from the end of the array
  for (int i=length-1; i>=0; i--) {
#ifdef __LITTLE_ENDIAN__
    swap16((unsigned char *)(buf+i));
#endif
    data[i] = buf[i];
  }
  fclose(fd);

	data[length] = data[length-1];
	mytime = (MY_FLOAT) 0.0;
	rate = (MY_FLOAT) 1.0;
	sweepRate = (MY_FLOAT) 0.001;
	modulator = new Modulatr;
	modulator->setVibFreq((MY_FLOAT) 6.0);
	modulator->setVibAmt((MY_FLOAT) 0.04);
	modulator->setRndAmt((MY_FLOAT) 0.005);
	envelope = new Envelope;
	pitchEnvelope = new Envelope;
	this->setFreq((MY_FLOAT) 75.0);
	pitchEnvelope->setRate((MY_FLOAT) 1.0);
	this->tick();
	this->tick();
	pitchEnvelope->setRate(sweepRate * rate);
}

SingWave :: ~SingWave()
{
	delete modulator;
	delete envelope;
	delete pitchEnvelope;
	free(data);
}

void SingWave :: reset()
{
	mytime = (MY_FLOAT)  0.0;
	lastOutput = (MY_FLOAT) 0.0;
}

void SingWave :: normalize()
{
	long i;
	MY_FLOAT max = (MY_FLOAT) 0.0;
	for (i=0;i<=length;i++)
		if (fabs(data[i]) > max) 
	    max = (MY_FLOAT) fabs((double) data[i]);
	if (max > 0.0)       {
		max = (MY_FLOAT) 1.0 / max;
		for (i=0;i<=length;i++)
	    data[i] *= max;
	}
}

void SingWave :: normalize(MY_FLOAT newPeak)
{
	long i;
	MY_FLOAT max = (MY_FLOAT) 0.0;
	for (i=0;i<=length;i++)
		if (fabs(data[i]) > max) 
	    max = (MY_FLOAT) fabs((double) data[i]);
	if (max > 0.0)       {
		max = (MY_FLOAT) 1.0 / max;
		max *= newPeak;
		for (i=0;i<=length;i++)
	    data[i] *= max;
	}
}

void SingWave :: setFreq(MY_FLOAT aFreq)
{
	MY_FLOAT temp;
	temp = rate;
	rate = length * ONE_OVER_SRATE * aFreq;
	temp -= rate;
	if (temp<0) temp = -temp;
	pitchEnvelope->setTarget(rate);
	pitchEnvelope->setRate(sweepRate * temp);
}

void SingWave :: setVibFreq(MY_FLOAT vibFreq)
{
	modulator->setVibFreq(vibFreq);
}

void SingWave :: setVibAmt(MY_FLOAT vibAmount)
{
	modulator->setVibAmt(vibAmount);
}

void SingWave :: setRndAmt(MY_FLOAT rndAmount)
{
	modulator->setRndAmt(rndAmount);
}

void SingWave :: setSweepRate(MY_FLOAT swpRate)
{
	sweepRate = swpRate;
}

void SingWave :: setGainRate(MY_FLOAT gainRate)
{
	envelope->setRate(gainRate);
}

void SingWave :: setGainTarget(MY_FLOAT aTarget)
{
	envelope->setTarget(aTarget);
}

void SingWave :: noteOn()
{
	envelope->keyOn();
}

void SingWave :: noteOff()
{
	envelope->keyOff();
}

MY_FLOAT SingWave ::  tick()
{
	long temp;
	MY_FLOAT alpha, temp_rate;
    
	temp_rate = pitchEnvelope->tick();
	mytime += temp_rate;                /* Update current time */
	mytime += temp_rate * modulator->tick();   /* Add vibratos */
    
	while (mytime >= length)  {  /* Check for end of sound */
		mytime -= length;          /* loop back to beginning */
	}
	while (mytime < 0.0)  {      /* Check for end of sound */
		mytime += length;          /* loop back to beginning */
	}

	temp = (long) mytime;               /* Integer part of time address */
	alpha = mytime - (MY_FLOAT) temp;   /*  fractional part of time address */

	lastOutput = alpha * data[temp+1];                   /* Do linear */
	lastOutput += ((MY_FLOAT) 1.0 - alpha) * data[temp]; /* interpolation */
	lastOutput *= envelope->tick();
    
	return lastOutput;                        
}

MY_FLOAT SingWave :: lastOut()
{
	return lastOutput;
}

/************   Test Main Program   *****************/
/*
void main()
{
    SingWave ahhWave("rawwaves/ahh.raw");
    SingWave eeeWave("rawwaves/eee.raw");
    SingWave oooWave("rawwaves/ooo.raw");
    FILE *fd;
    short data;
    long i,j;
    
    fd = fopen("test.raw","wb");
    
    ahhWave.normalize();
    ahhWave.noteOn();
    for (j=0;j<6;j++)   {
	ahhWave.setFreq(100 * pow(2.0,j*0.25));
	for (i=0;i<10000;i++) {
	    data = ahhWave.tick() * 32000.0;
	    fwrite(&data,2,1,fd);
	}
    }
    ahhWave.noteOff();
    for (i=0;i<5000;i++) {
	data = ahhWave.tick() * 32000.0;
	fwrite(&data,2,1,fd);
    }

    eeeWave.normalize();
    eeeWave.noteOn();
    for (j=0;j<6;j++)   {
	eeeWave.setFreq(100 * pow(2.0,j*0.25));
	for (i=0;i<10000;i++) {
	    data = eeeWave.tick() * 32000.0;
	    fwrite(&data,2,1,fd);
	}
    }
    eeeWave.noteOff();
    for (i=0;i<5000;i++) {
	data = eeeWave.tick() * 32000.0;
	fwrite(&data,2,1,fd);
    }

    oooWave.normalize();
    oooWave.noteOn();
    for (j=0;j<6;j++)   {
	oooWave.setFreq(100 * pow(2.0,j*0.25));
	for (i=0;i<10000;i++) {
	    data = oooWave.tick() * 32000.0;
	    fwrite(&data,2,1,fd);
	}
    }
    oooWave.noteOff();
    for (i=0;i<5000;i++) {
	data = oooWave.tick() * 32000.0;
	fwrite(&data,2,1,fd);
    }

    fclose(fd);
}
*/
