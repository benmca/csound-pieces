/******************************************/
/*  Simple Voice Manager (Mangler)        */
/*  for ToolKit96, 1996 Perry R. Cook     */
/*  Princeton University                  */
/*                                        */
/*  Make one of these by telling it the   */
/*  maximum number of voices you'll want, */
/*  and also what flavor instrument       */
/*  group it will be mangling.  Pipe SKINI*/
/*  messages into it and it will return   */
/*  the mixed channel signal each tick.   */
/*  For multi-channel (multi-timbral),    */
/*  make one for each channel and mix     */
/*  their outputs.                        */
/*                                        */
/*  Each note on returns a unique tag,    */
/*  (credits to the NeXT MusicKit here),  */
/*  so you can send control changes to    */
/*  unique instances of instruments       */
/*  within an ensemble.                   */
/*                                        */
/*  SKINI (Synthesis toolKit Instrument   */
/*  Network Interface) is like MIDI, but  */
/*  allows for floating point control     */
/*  changes, note numbers, etc. Example:  */
/*  noteOn 60.01 111.132 plays a sharp    */      
/*  middle C with a velocity of 111.132   */
/*  See SKINI09.txt for more information  */
/*                                        */
/******************************************/

#include "VoicMang.h"
#include "Mandolin.h"
#include "Plucked.h"
#include "Clarinet.h"
#include "Flute.h"
#include "Brass.h"
#include "Bowed.h"
#include "Rhodey.h"
#include "Wurley.h"
#include "TubeBell.h"
#include "HeavyMtl.h"
#include "PercFlut.h"
#include "BeeThree.h"
#include "Moog1.h"

VoicMang :: VoicMang(int maxVoices, char *instrType)
{
    int i;
    max_voices = maxVoices;
    if (max_voices > __VMang_MAX_) {
	printf("You ask for too many voices, setting to %i\n",__VMang_MAX_);
	max_voices = __VMang_MAX_;
    }
    if (!strcmp(instrType,"Mandolin"))     {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Mandolin((MY_FLOAT) 50.0);
		mute_time = 1000;
    }
    else if (!strcmp(instrType,"Plucked"))      {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Plucked(50.0);
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Clarinet"))     {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Clarinet(50.0);
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Flute"))        {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Flute(50.0);
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Brass"))        {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Brass(50.0);
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Bowed"))        {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Bowed(50.0);
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Rhodey"))       {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Rhodey;
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Wurley"))       {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Wurley;
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"TubeBell"))     {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new TubeBell;
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"HeavyMtl"))     {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new HeavyMtl;
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"PercFlut"))     {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new PercFlut;
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"BeeThree"))     {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new BeeThree;
	mute_time = 1000;
    }
    else if (!strcmp(instrType,"Moog1"))        {
	for (i=0;i<max_voices;i++)
	    instrument[i] = new Moog1;
	mute_time = 1000;
    }
    
    pitch_bend = (MY_FLOAT) 1.0;
    newTag = 1;
    for (i=0;i<max_voices;i++)  {
	notesOn[i] = -1;
	voicesOn[i] = 0;
	freqBases[i] = (MY_FLOAT) 1.0;
	frequencies[i] = (MY_FLOAT) 0.0;
    }    
}

VoicMang :: ~VoicMang()
{
    int i;
    for (i=0;i<max_voices;i++)
	    delete instrument[i];
}

long VoicMang :: noteOn(MY_FLOAT freq, MY_FLOAT amp)
{
    MY_FLOAT temp = 0.0;
    temp = freq / (MY_FLOAT) 220.0;
    temp = (MY_FLOAT) (log(temp) / log(2.0));
    temp = (temp * (MY_FLOAT) 12.0) + 57;
    return this->noteOn(temp,amp);
}

#define ONE_OVER_12 0.083333

long VoicMang :: noteOnN(MY_FLOAT note_num, MY_FLOAT amp)
{
    int i,gotOne;
    MY_FLOAT freq;
    freq = (MY_FLOAT) 220.0 * pow(2.0,(note_num - 57.0) * ONE_OVER_12);
    gotOne = 0;
    for (i=0;i<max_voices;i++) {
	if (notesOn[i] < 0)    {      /* find a dormant instrument */
	    voicesOn[i] = newTag;
	    newTag += 1;
	    notesOn[i] = (int) (note_num + (MY_FLOAT) 0.5);  /* Nearest Neighbor MIDI Note# */
	    instrument[i]->noteOn(freq,amp*(MY_FLOAT) NORM_7);
	    frequencies[i] = freq;
	    gotOne = 1;
	    i = max_voices;
	}
    }
    if (!gotOne)        {              /* if can't find a free one */
	return -1;                     /* report back */
    }
    return newTag-1;
}

long VoicMang :: oldestVoice()
{
    int i;
    long temp2,gotOne;
    temp2 = newTag;
    gotOne = -1;
    for (i=0;i<max_voices;i++)  {
	temp2 = voicesOn[i];
	if (temp2 > 0 && temp2 < newTag)  {
	    gotOne = temp2;
	}
    }
    return gotOne;
}

long VoicMang :: noteOffN(int note_num, MY_FLOAT amp)
{
    int i,gotOne;
    gotOne = -1;
    for (i=0;i<max_voices;i++)  {
	    if (notesOn[i]==note_num)       {
		instrument[i]->noteOff(amp * (MY_FLOAT) NORM_7); 
		gotOne = voicesOn[i];
		voicesOn[i] = -mute_time - 2;
	    }
    }
    return gotOne;
}

void VoicMang :: noteOffT(long tag, MY_FLOAT amp)
{
    int i;
    for (i=0;i<max_voices;i++)  {
	if (voicesOn[i]==tag)       {
	    instrument[i]->noteOff(amp * (MY_FLOAT) NORM_7); 
	    voicesOn[i] = -mute_time - 2;
	}
    }
}

void VoicMang :: kill(long tag)
{
    int i;
    for (i=0;i<max_voices;i++)  {
	if (voicesOn[i]==tag)       {
	    instrument[i]->noteOff((MY_FLOAT) 1.0); 
	    voicesOn[i] = 0;
	    notesOn[i] = -1;
	}
    }
}

void VoicMang :: pitchBend(MY_FLOAT value)
{
    int i;
    pitch_bend = value;
    for (i=0;i<max_voices;i++)  {
	freqBases[i] = pitch_bend;
	instrument[i]->setFreq(freqBases[i]*frequencies[i]);
    }
}

void VoicMang :: pitchBendT(long tag, MY_FLOAT value)
{
    int i;
    for (i=0;i<max_voices;i++)  { 
	if (voicesOn[i] == tag)    {
	    freqBases[i] = value;
	    instrument[i]->setFreq(freqBases[i]*frequencies[i]);
	    i = max_voices;
	}
    }
}

MY_FLOAT VoicMang :: tick()
{
    int i;
    MY_FLOAT temp;
    temp = (MY_FLOAT) 0.0;
    for (i=0;i<max_voices;i++)  {
	if (voicesOn[i] != 0)   {
	    temp += instrument[i]->tick();
	}
	if (voicesOn[i] < 0) {
	    voicesOn[i] += 1;
	    if (voicesOn[i] == 0)       {
		notesOn[i] = -1;
		frequencies[i] = (MY_FLOAT) 0.0;
		freqBases[i] = (MY_FLOAT) 1.0;
	    }
	}        
    }
    return temp;
}

void VoicMang :: controlChange(int number, MY_FLOAT value)
{
    int i;
    for (i=0;i<max_voices;i++)  {
	instrument[i]->controlChange(number,value);
    }
}

void VoicMang :: controlChangeT(long tag, int number, MY_FLOAT value)
{
    int i;
    for (i=0;i<max_voices;i++)  { 
	if (voicesOn[i] == tag)    {
	    instrument[i]->controlChange(number,value);
	    i = max_voices;
	}
    }
}


