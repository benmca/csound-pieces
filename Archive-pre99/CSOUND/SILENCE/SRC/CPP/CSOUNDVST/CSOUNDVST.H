#ifndef CSOUND_VST_H
#define CSOUND_VST_H
/**
* S I L E N C E
* 
* An auto-extensible system for making music on computers by means of software alone.
* Copyright (c) 2001 by Michael Gogins. All rights reserved.
*
* L I C E N S E
*
* This software is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this software; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
#include <windows.h>
#include <process.h>
#include <winbase.h>
#include <wincon.h>
#include <string>
#include <audioeffectx.h>
#include <AEffEditor.hpp>
#include <deque>
#include <SSound/SSound.h>

typedef union {
    unsigned long longData;
    unsigned char charData[4];
} MIDIMESSAGE;

class CsoundView;

class CsoundVST :
public AudioEffectX,
public SSound
{
	int vstIsPerforming;
	int vstCurrentSamplePosition;
	int vstPriorSamplePosition;
	int vstSpinFrameI;
	int vstSpinChannelI;
	int vstInputFrameI;
	int vstInputChannelI;
	int vstOutputFrameI;
	int vstOutputChannelI;
	int vstSpoutFrameI;
	int vstSpoutChannelI;
	double vstBeginPerformanceAt;
public:
	unsigned long performanceThread;
	int vstIsVst;
	static std::deque<VstMidiEvent*> midiQueue;
	bool areProgramsChunks;
	static float const inputScale;
	static float const outputScale;
	std::string bankBuffer;
	static std::string aboutText;
	typedef enum
	{
		kNumInputs = 2,
	};
	typedef enum
	{
		kNumOutputs = 2,
	};
	typedef enum
	{
		kNumPrograms = 10,
	};
	class Program
	{
	public:
		std::string name;
		std::string xml;
	};
	std::vector<Program> programs;
	int spoutI;
	int spoutN;
	int spinI;
	int spinN;
	CsoundVST(void);
	CsoundVST(audioMasterCallback audioMaster);
	//	AudioEffect
	virtual ~CsoundVST();
	virtual void process(float **inputs, float **outputs, long sampleFrames);
	virtual void processReplacing(float **inputs, float **outputs, long sampleFrames);
	//	AudioEffectX
	virtual bool getInputProperties(long index, VstPinProperties* properties);
	virtual bool getOutputProperties(long index, VstPinProperties* properties);
	virtual bool getProgramNameIndexed(long category, long index, char* text);
	virtual bool copyProgram(long destination);
	virtual bool getEffectName(char* name);
	virtual bool getVendorString(char* text);
	virtual bool getProductString(char* text);
	virtual long canDo(char* text);
	virtual long processEvents(VstEvents* events);
	virtual bool keysRequired();
	virtual void suspend();
	virtual void resume();
	virtual long getProgram();
	virtual AEffect& getAEffect();
	virtual AEffEditor *getEditor(void);
	//	Don't forget to set curProgram
	//	All following refer to curProgram
	virtual void setProgram(long program);
	virtual void setProgramName(char *name);
	virtual void getProgramName(char *name);
	//	Returns byteSize
	virtual long getChunk(void** data, bool isPreset = false);
	virtual long setChunk(void* data, long byteSize, bool isPreset = false);
	//	CsoundVST
	virtual void setVST(int isVST);
	virtual int isVST(void);
	virtual void startPerformance(void);
	virtual void stop(void);
	virtual void vstPerform(void);
	virtual void csoundPerform(void);
	virtual CsoundView *getView(void);
	static int midiRead(char *mbuf, int size);
	static void throwMessage(const char *exception);
	virtual void synchronizeScore(void);
	virtual void shellPlaySoundfile(void);
	virtual void shellEditSoundfile(void);
	//	SSound
	virtual void reset(void);
	virtual bool loadOrcLibrary(const char *filename = 0);
};

class CsoundView;

extern "C" 
{
	__declspec(dllexport) CsoundVST *CreateCsoundVST(void);
	void vstCsoundWxLogCallback(const char *message);
	void vstCsoundStderrLogCallback(const char *message);
};

#endif //	CSOUND_VST_H
