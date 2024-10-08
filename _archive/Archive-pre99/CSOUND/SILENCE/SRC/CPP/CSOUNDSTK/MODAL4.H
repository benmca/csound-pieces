/*******************************************/
/*
  Four Resonance Modal Synthesis Instrument
  by Perry R. Cook, 1995-2000

  This instrument contains an excitation
  wavetable, an envelope, an oscillator,
  and four resonances (Non-Sweeping BiQuad
  Filters).
*/
/*******************************************/

#if !defined(__Modal4_h)
#define __Modal4_h

#include "Instrmnt.h"
#include "Envelope.h"
#include "RawWvIn.h"
#include "BiQuad.h"
#include "OnePole.h"

class Modal4 : public Instrmnt
{
protected:  
  Envelope *envelope; 
  RawWvIn  *wave;
  BiQuad   *filters[4];
  OnePole  *onepole;
  RawWvIn  *vibr;
  MY_FLOAT vibrGain;
  MY_FLOAT masterGain;
  MY_FLOAT directGain;
  MY_FLOAT stickHardness;
  MY_FLOAT strikePosition;
  MY_FLOAT baseFreq;
  MY_FLOAT ratios[4];
  MY_FLOAT resons[4];
public:
  Modal4();
  virtual ~Modal4();
  void clear();
  virtual void setFreq(MY_FLOAT frequency);
  void setRatioAndReson(int whichOne, MY_FLOAT ratio, MY_FLOAT reson);
  void setMasterGain(MY_FLOAT aGain);
  void setDirectGain(MY_FLOAT aGain);
  void setFiltGain(int whichOne, MY_FLOAT gain);
  virtual void strike(MY_FLOAT amplitude);
  virtual void noteOn(MY_FLOAT freq, MY_FLOAT amp);
  virtual void noteOff(MY_FLOAT amp);
  void damp(MY_FLOAT amplitude);
  virtual void controlChange(int number, MY_FLOAT value);
  virtual MY_FLOAT tick();
};

#endif
