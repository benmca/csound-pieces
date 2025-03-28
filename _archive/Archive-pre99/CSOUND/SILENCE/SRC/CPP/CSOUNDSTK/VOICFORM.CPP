/*******************************************/
/*  4 Formant Synthesis Instrument         */
/*  by Perry R. Cook, 1995-96              */ 
/*  This instrument contains an excitation */
/*  singing wavetable (looping wave with   */
/*  random and periodic vibrato, smoothing */
/*  on frequency, etc.), excitation noise, */
/*  and four sweepable complex resonances. */
/*                                         */
/*  Measured Formant data (from me) is     */
/*  included, and enough data is there to  */
/*  support either parallel or cascade     */
/*  synthesis.  In the floating point case */
/*  cascade synthesis is the most natural  */
/*  so that's what you'll find here.       */
/*                                         */
/*******************************************/

#include "VoicForm.h"
#include "SKINI11.msg"

VoicForm :: VoicForm() : Instrmnt()
{
  // Concatenate the STK RAWWAVE_PATH to the rawwave file
  char file[128];
  strcpy(file, RAWWAVE_PATH);
	voiced = new SingWave(strcat(file,"rawwaves/impuls20.raw"));
	voiced->normalize();
	voiced->setGainRate((MY_FLOAT) 0.001);
	voiced->setGainTarget((MY_FLOAT) 0.0);

	noise = new Noise;

	filters[0] = new FormSwep;
	filters[1] = new FormSwep;
	filters[2] = new FormSwep;
	filters[3] = new FormSwep;
	filters[0]->setSweepRate((MY_FLOAT) 0.001);
	filters[1]->setSweepRate((MY_FLOAT) 0.001);
	filters[2]->setSweepRate((MY_FLOAT) 0.001);
	filters[3]->setSweepRate((MY_FLOAT) 0.001);
    
	onezero = new OneZero;
	onezero->setCoeff((MY_FLOAT) -0.9);
	onepole = new OnePole;
	onepole->setPole((MY_FLOAT) 0.9);
    
	noiseEnv = new Envelope;
	noiseEnv->setRate((MY_FLOAT) 0.001);
	noiseEnv->setTarget((MY_FLOAT) 0.0);
    
	this->setPhoneme("eee");
	this->clear();
}  

VoicForm :: ~VoicForm()
{
	delete voiced;
	delete noise;
	delete filters[0];
	delete filters[1];
	delete filters[2];
	delete filters[3];
	delete onezero;
	delete onepole;
	delete noiseEnv;
}

void VoicForm :: clear()
{
	onezero->clear();
	onepole->clear();
	filters[0]->clear();
	filters[1]->clear();
	filters[2]->clear();
	filters[3]->clear();
}

void VoicForm :: setFreq(MY_FLOAT frequency)
{    
	MY_FLOAT temp;
	if ((frequency * 22) > SRATE)	{
	   printf("This note is too high!!\n");
	   frequency = SRATE / 22;
	}
	lastFreq = frequency;
	temp = fabs(1500 - frequency) + 200;
	lastGain = 10000.0 / temp / temp;
	voiced->setFreq(frequency);
}

void VoicForm :: setFormantAll(int whichOne, MY_FLOAT freq,MY_FLOAT reson,MY_FLOAT gain)
{
	filters[whichOne]->setTargets(freq,reson,gain);
}

#include "phontabl.h"

int VoicForm :: setPhoneme(char *phoneme)
{
	int i=0,found=0;

	while(i<32 && !found)      {
		if (!strcmp(phonemes[i],phoneme))      {
			found = 1;
			this->setFormantAll(0,(MY_FLOAT) phonParams[i][0][0],(MY_FLOAT) phonParams[i][0][1],(MY_FLOAT) pow(10.0,phonParams[i][0][2] / 20.0));
			this->setFormantAll(1,(MY_FLOAT) phonParams[i][1][0],(MY_FLOAT) phonParams[i][1][1],(MY_FLOAT) 1.0);
			this->setFormantAll(2,(MY_FLOAT) phonParams[i][2][0],(MY_FLOAT) phonParams[i][2][1],(MY_FLOAT) 1.0);
			this->setFormantAll(3,(MY_FLOAT) phonParams[i][3][0],(MY_FLOAT) phonParams[i][3][1],(MY_FLOAT) 1.0);
			this->setVoicedUnVoiced((MY_FLOAT) phonGains[i][0],(MY_FLOAT) phonGains[i][1]);
			printf("Found Formant: %s (number %i)\n",phoneme,i);
		}
		i++;
	}
	if (!found) printf("Phoneme %s not found\n",phoneme);
	return found;
}

void VoicForm :: setVoiced(MY_FLOAT vGain)
{
	voiced->setGainTarget(vGain);
}

void VoicForm :: setUnVoiced(MY_FLOAT nGain)
{
	noiseEnv->setTarget(nGain);
}

void VoicForm :: setVoicedUnVoiced(MY_FLOAT vGain, MY_FLOAT nGain)
{
	this->setVoiced(vGain);
	this->setUnVoiced(nGain);
}

void VoicForm :: setFiltSweepRate(int whichOne,MY_FLOAT rate)
{
	filters[whichOne]->setSweepRate(rate);
}

void VoicForm :: setPitchSweepRate(MY_FLOAT rate)
{
	voiced->setSweepRate(rate);
}

void VoicForm :: speak()
{
	voiced->noteOn();
}

void VoicForm :: quiet()
{
	voiced->noteOff();
	noiseEnv->setTarget((MY_FLOAT) 0.0);
}

void VoicForm :: noteOn(MY_FLOAT freq, MY_FLOAT amp)
{
	this->setFreq(freq);
	voiced->setGainTarget(amp);
	onepole->setPole((MY_FLOAT) 0.95 - (amp * (MY_FLOAT) NORM_7 * (MY_FLOAT) 0.2));
}

void VoicForm :: noteOff(MY_FLOAT amp)
{
	this->quiet();
}

MY_FLOAT VoicForm :: tick()
{
	MY_FLOAT temp;
	temp   = onepole->tick(onezero->tick(voiced->tick()));
	temp  += noiseEnv->tick() * noise->tick();
	lastOutput  = filters[0]->tick(temp);
	lastOutput  = filters[1]->tick(lastOutput);
	lastOutput  = filters[2]->tick(lastOutput);
	lastOutput  = filters[3]->tick(lastOutput);
	lastOutput *= lastGain;
	return lastOutput;
}
 
void VoicForm :: controlChange(int number, MY_FLOAT value)
{
#if defined(_debug_)        
	printf("VoicForm : ControlChange: Number=%i Value=%f\n",number,value);
#endif
	if (number == __SK_Breath_)	{
		this->setVoiced((MY_FLOAT) 1.0 - (value *(MY_FLOAT) NORM_7));
		this->setUnVoiced((MY_FLOAT) 0.01 * value * (MY_FLOAT) NORM_7);
	}
	else if (number == __SK_FootControl_)	{
    MY_FLOAT temp = 0.0;
		int tempi = (int) value;
		if (tempi < 32)	{
      tempi = tempi;
      temp = (MY_FLOAT) 0.9;
		}
		else if (tempi < 64)	{
      tempi = tempi - 32;
      temp = (MY_FLOAT) 1.0;
		}
		else if (tempi < 96)	{
      tempi = tempi - 64;
      temp = (MY_FLOAT) 1.1;
		}
		else if (tempi <= 128)	{
      tempi = tempi - 96;
      temp = (MY_FLOAT) 1.2;
		}
		this->setFormantAll(0,temp*(MY_FLOAT) phonParams[tempi][0][0],
                        (MY_FLOAT) phonParams[tempi][0][1],
                        (MY_FLOAT) pow(10.0,phonParams[tempi][0][2] / 20.0));
		this->setFormantAll(1,temp*(MY_FLOAT) phonParams[tempi][1][0],
                        (MY_FLOAT) phonParams[tempi][1][1],(MY_FLOAT) 1.0);
		this->setFormantAll(2,temp*(MY_FLOAT) phonParams[tempi][2][0],
                        (MY_FLOAT) phonParams[tempi][2][1],(MY_FLOAT) 1.0);
		this->setFormantAll(3,temp*(MY_FLOAT) phonParams[tempi][3][0],
                        (MY_FLOAT) phonParams[tempi][3][1],(MY_FLOAT) 1.0);
    this->setVoicedUnVoiced(phonGains[tempi][0],phonGains[tempi][1]);
	}
	else if (number == __SK_ModFrequency_)
		voiced->setVibFreq(value * (MY_FLOAT) NORM_7 * (MY_FLOAT) 12.0);  /* 0 to 12 Hz */
	else if (number == __SK_ModWheel_)
		voiced->setVibAmt(value * (MY_FLOAT) NORM_7 * (MY_FLOAT) 0.2);
	else if (number == __SK_AfterTouch_Cont_)	{
		this->setVoiced(value*NORM_7);
		onepole->setPole((MY_FLOAT) 0.99 - (value *(MY_FLOAT) NORM_7 * (MY_FLOAT) 0.2));
		//onepole->setPole((MY_FLOAT) 0.5 - (value * (MY_FLOAT) NORM_7 * (MY_FLOAT) 0.2));
	}
	else	{
		printf("VoicForm : Undefined Control Number!!\n");
	}  
}
