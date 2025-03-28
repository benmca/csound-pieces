/******************************************/
/*  Hammond(OID) Organ Subclass           */
/*  of Algorithm 8 (TX81Z) Subclass of    */ 
/*  4 Operator FM Synth                   */
/*  by Perry R. Cook, 1995-96             */ 
/******************************************/

#include "BeeThree.h"

BeeThree :: BeeThree() : FM4Alg8()
{
  // Concatenate the STK RAWWAVE_PATH to the rawwave file
  char file1[128];
  char file2[128];
  char file3[128];
  char file4[128];
  strcpy(file1, RAWWAVE_PATH);
  strcpy(file2, RAWWAVE_PATH);
  strcpy(file3, RAWWAVE_PATH);
  strcpy(file4, RAWWAVE_PATH);
  this->loadWaves(strcat(file1,"rawwaves/sinewave.raw"),
                  strcat(file2,"rawwaves/sinewave.raw"),
                  strcat(file3,"rawwaves/sinewave.raw"),
                  strcat(file4,"rawwaves/fwavblnk.raw"));

  this->setRatio(0,(MY_FLOAT) 0.999);
  this->setRatio(1,(MY_FLOAT) 1.997);
  this->setRatio(2,(MY_FLOAT) 3.006);
  this->setRatio(3,(MY_FLOAT) 6.009);
  gains[0] = __FM4Op_gains[95];
  gains[1] = __FM4Op_gains[95];
  gains[2] = __FM4Op_gains[99];
  gains[3] = __FM4Op_gains[95];
  adsr[0]->setAllTimes((MY_FLOAT) 0.005,(MY_FLOAT) 0.003,(MY_FLOAT) 1.0,(MY_FLOAT) 0.01);
  adsr[1]->setAllTimes((MY_FLOAT) 0.005,(MY_FLOAT) 0.003,(MY_FLOAT) 1.0,(MY_FLOAT) 0.01);
  adsr[2]->setAllTimes((MY_FLOAT) 0.005,(MY_FLOAT) 0.003,(MY_FLOAT) 1.0,(MY_FLOAT) 0.01);
  adsr[3]->setAllTimes((MY_FLOAT) 0.005,(MY_FLOAT) 0.001,(MY_FLOAT) 0.4,(MY_FLOAT) 0.03);
  twozero->setGain((MY_FLOAT) 0.1);
} 

BeeThree :: ~BeeThree()
{

}

void BeeThree :: setFreq(MY_FLOAT frequency)
{    
    baseFreq = frequency;
    waves[0]->setFreq(baseFreq * ratios[0]);
    waves[1]->setFreq(baseFreq * ratios[1]);
    waves[2]->setFreq(baseFreq * ratios[2]);
    waves[3]->setFreq(baseFreq * ratios[3]);
}

MY_FLOAT BeeThree :: tick()
{
    MY_FLOAT temp;
    if (modDepth > 0.0)	{
        temp = (MY_FLOAT) 1.0 + (modDepth * vibWave->tick() * (MY_FLOAT) 0.1);
        waves[0]->setFreq(baseFreq * ratios[0] * temp);
        waves[1]->setFreq(baseFreq * ratios[1] * temp);
        waves[2]->setFreq(baseFreq * ratios[2] * temp);
        waves[3]->setFreq(baseFreq * ratios[3] * temp);
    }
    lastOutput = FM4Alg8 :: tick();
    return lastOutput;
}

void BeeThree :: noteOn(MY_FLOAT freq, MY_FLOAT amp)
{
    gains[0] = amp * __FM4Op_gains[95];
    gains[1] = amp * __FM4Op_gains[95];
    gains[2] = amp * __FM4Op_gains[99];
    gains[3] = amp * __FM4Op_gains[95];
    this->setFreq(freq);
    this->keyOn();
#if defined(_debug_)        
    printf("BeeThree : NoteOn: Freq=%lf Amp=%lf\n",freq,amp);
#endif    
}

