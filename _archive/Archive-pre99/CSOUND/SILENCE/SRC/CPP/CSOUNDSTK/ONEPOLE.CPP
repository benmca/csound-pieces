/*******************************************/
/*
   One Pole Filter Class,
   by Perry R. Cook, 1995-96.
   Added methods by Julius Smith, 2000.

   The parameter gain is an additional
   gain parameter applied to the filter
   on top of the normalization that takes
   place automatically.  So the net max
   gain through the system equals the
   value of gain.  sgain is the combina-
   tion of gain and the normalization
   parameter, so if you set the poleCoeff
   to alpha, sgain is always set to
   gain * (1.0 - fabs(alpha)).
*/
/*******************************************/

#include "OnePole.h"

OnePole :: OnePole() : Filter()
{
  poleCoeff = (MY_FLOAT) 0.9;
  gain = (MY_FLOAT) 1.0;
  sgain = (MY_FLOAT) 0.1;
  outputs = (MY_FLOAT *) malloc(sizeof(MY_FLOAT));
  outputs[0] = (MY_FLOAT) 0.0;
  lastOutput = (MY_FLOAT) 0.0;
}

OnePole :: OnePole(MY_FLOAT thePole) : Filter()
{
  poleCoeff = thePole;
  gain = (MY_FLOAT) 1.0;
  sgain = (MY_FLOAT) 1.0 - fabs(thePole);
  outputs = (MY_FLOAT *) malloc(sizeof(MY_FLOAT));
  outputs[0] = (MY_FLOAT) 0.0;
  lastOutput = (MY_FLOAT) 0.0;
}

OnePole :: ~OnePole()    
{
  free(outputs);
}

void OnePole :: clear()
{
  outputs[0] = (MY_FLOAT) 0.0;
  lastOutput = (MY_FLOAT) 0.0;
}

void OnePole :: setB0(MY_FLOAT aValue)
{
  sgain = aValue;
}

void OnePole :: setNum(MY_FLOAT *values)
{
  sgain = values[0];
}

void OnePole :: setA1(MY_FLOAT aValue)
{
  poleCoeff = -aValue;
}

void OnePole :: setDen(MY_FLOAT *values)
{
  poleCoeff = -values[0];
}

void OnePole :: setPole(MY_FLOAT aValue)
{
  poleCoeff = aValue;
  // Normalize gain to 1.0 max
  if (poleCoeff > (MY_FLOAT) 0.0)
    sgain = gain * ((MY_FLOAT) 1.0 - poleCoeff);
  else
    sgain = gain * ((MY_FLOAT) 1.0 + poleCoeff);
}

void OnePole :: setGain(MY_FLOAT aValue)
{
  gain = aValue;

  // Normalize gain to 1.0 max
  if (poleCoeff > (MY_FLOAT) 0.0)
    sgain = gain * ((MY_FLOAT) 1.0 - poleCoeff);
  else
    sgain = gain * ((MY_FLOAT) 1.0 + poleCoeff);
}

// Perform Filter Operation
MY_FLOAT OnePole :: tick(MY_FLOAT sample)
{
  outputs[0] = (sgain * sample) + (poleCoeff * outputs[0]);              
  lastOutput = outputs[0];
  return lastOutput;
}

