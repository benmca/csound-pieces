#ifndef __ACSOUNDVST_H
#define __ACSOUNDVST_H

#include "audioeffectx.h"

class ACsoundVST : public AudioEffectX
{
public:
	ACsoundVST(audioMasterCallback audioMaster);
	~ACsoundVST();

	virtual void process(float **inputs, float **outputs, long sampleFrames);
	virtual void processReplacing(float **inputs, float **outputs, long sampleFrames);
	virtual void setProgramName(char *name);
	virtual void getProgramName(char *name);
	virtual void setParameter(long index, float value);
	virtual float getParameter(long index);
	virtual void getParameterLabel(long index, char *label);
	virtual void getParameterDisplay(long index, char *text);
	virtual void getParameterName(long index, char *text);
	//virtual void resume();
	//virtual long processEvents (VstEvents* events);

protected:
	float fGain;
	char programName[32];
};

#endif
