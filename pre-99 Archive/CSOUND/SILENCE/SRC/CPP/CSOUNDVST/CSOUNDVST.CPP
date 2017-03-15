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
#include <fcntl.h>
#include <io.h>
#include <stdio.h>
#include <CsoundVST/CsoundView.h>
#include <CsoundVST/CsoundVST.h>

extern HINSTANCE hInstance = 0;

//	Rescale Csound sample value ranges to VST sample value ranges.

const float CsoundVST::inputScale = (float) 32767.0;
const float CsoundVST::outputScale = (float) (1.0 / 32767.0);

BOOL WINAPI DllMain(HINSTANCE hInst, DWORD dwReason, LPVOID lpvReserved)
{
	hInstance = hInst;
	return 1;
}

std::string CsoundVST::aboutText = "C S O U N D   V S T   0 . 6\n\n"
"CsoundVST VST2 Synthesizer for Csound is copyright (c) 2001 by Michael Gogins. All rights reserved. CsoundVST is licensed under the terms of the GNU Lesser General Public License (see below).\n"
"\n"
"VST Plug-In Technology by Steinberg.\n"
"VST is a trademark of Steinberg Soft- und Hardware GmbH.\n"
"\n"
"Csound code incorporated herein is copyright 1986, 1992 by the Massachusetts Institute of Technology. All rights reserved. "
"Developed by Barry L. Vercoe at the Experimental Music Studio, Media Laboratory, M.I.T., Cambridge, Massachusetts, with partial support from the System Development Foundation and from National Science Foundation Grant # IRI-8704665. "
"Permission to use, copy, or modify these programs and their documentation for educational and research purposes only and without fee is hereby granted, provided that this copyright and permission notice appear on all copies and supporting documentation. For any other uses of this software, in original or modified form, including but not limited to distribution in whole or in part, specific prior permission from M.I.T. must be obtained. M.I.T. makes no representations about the suitability of this software for any purpose. It is provided \"as is\" without express or implied warranty. "
"\n"
"Parts of the Csound code incorporated herein were developed by an independent group of programmers, composers and scientists. Copyright to this code is held by the respective authors. The following people have contributed code to this version of Csound "
"(and probably others as well; please let me know if you should be added to this list):\n"
"\n"
"John ffitch\n"
"Paris Smaragdis\n"
"Richard Karpen\n"
"Gabriel Maldonado\n"
"Greg Sullivan\n"
"Michael Clark\n"
"Allan Lee\n"
"Michael Casey\n"
"Marc Resibois\n"
"Robin Whittle\n"
"Matt Ingals\n"
"Mike Berry\n"
"Eli Breder\n"
"David Macintyre\n"
"Dan Ellis\n"
"Richard Dobson\n"
"\n"
"Special thanks to Gabriel Maldonado for his MIDI and DirectSound code,\n"
"to Richard Dobson for the RESET code, \n"
"and to Matt Ingalls for host-driven playevents().\n"
"\n"
"This software is free software; you can redistribute it and/or "
"modify it under the terms of the GNU Lesser General Public License "
"as published by the Free Software Foundation; either version 2 "
"of the License, or (at your option) any later version. "
"This program is distributed in the hope that it will be useful, "
"but WITHOUT ANY WARRANTY; without even the implied warranty of "
"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the "
"GNU Lesser General Public License for more details. "
"You should have received a copy of the GNU Lesser General Public License "
"along with this program; if not, write to the Free Software "
"Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA. "
"\n";

static AudioEffect *effect = 0;
bool oome = false;

#if MAC
#pragma export on
#endif

#if BEOS
#define main main_plugin
extern "C" __declspec(dllexport) AEffect *main_plugin(audioMasterCallback audioMaster);

#else
extern "C" __declspec(dllexport) AEffect *main(audioMasterCallback audioMaster);
#endif

extern "C" __declspec(dllexport) AEffect *main(audioMasterCallback audioMaster)
{
	if(!audioMaster(0, audioMasterVersion, 0, 0, 0, 0))
	{
		return 0;  // old version
	}
	effect =  new CsoundVST(audioMaster);
	if(!effect)
	{
		return 0;
	}
	if(oome)
	{
		delete effect;
		effect = 0;
		return 0;
	}
	return effect->getAeffect();
}

#if MAC
#pragma export off
#endif

CsoundVST::CsoundVST(void) : AudioEffectX(0, kNumPrograms, 0),
performanceThread(0)
{
	editor = new CsoundView(this);
	setEditor(editor);
	vstIsVst = 0;
	programs.resize(kNumPrograms);
	loadOrcLibrary();
}

CsoundVST::CsoundVST(audioMasterCallback audioMaster) : 
AudioEffectX(audioMaster, kNumPrograms, 0),
performanceThread(0)
{
	setThrowMessageCallback(throwMessage);
	setExternalMidiReadCallback(midiRead);
	editor = new CsoundView(this);
	setEditor(editor);
	if(audioMaster)
	{
		setNumInputs(kNumInputs); // stereo in
		setNumOutputs(kNumOutputs); // stereo out
		setUniqueID('CsdV'); // identify(you must change this for other plugs!)
		canMono(); // makes sense to feed both inputs with the same signal
		canProcessReplacing(); // supports both accumulating and replacing output
		programsAreChunks(true);
		//isSynth();
	}
	programs.resize(kNumPrograms);
	loadOrcLibrary();
}

CsoundVST::~CsoundVST()
{
	suspend();
	if(editor)
	{
		delete editor;
		editor = 0;
	}
}

void CsoundVST::stop(void)
{
	SSound::stop();
}

int CsoundVST::midiRead(char *mbuf, int size)
{
	if(CsoundVST::midiQueue.empty())
	{
		return 0;
	}
	else
	{
		VstMidiEvent *event = CsoundVST::midiQueue.front();
		CsoundVST::midiQueue.pop_front();
		MIDIMESSAGE *midiMessage = (MIDIMESSAGE *)mbuf;
		midiMessage->charData[0] = event->midiData[0];
		midiMessage->charData[1] = event->midiData[1];
		midiMessage->charData[2] = event->midiData[2];
		return 3;
	}
}

void CsoundVST::startPerformance(void)
{
	try
	{
		char message[0x100];
		vstIsPerforming = 0;
		vstPriorSamplePosition = 0;
		vstCurrentSamplePosition = 0;
		exportForPerformance();
		if(command.length() <= 0)
		{
			csoundMessage("No command - aborting performance.");
			vstIsPerforming = 0;
			return;
		}
		if(vstIsVst)
		{
			updateSampleRate();
			updateBlockSize();
			sprintf(message, "VST performance ksmps=%d nchnls=%d....", getKsmps(), getNchnls());
			csoundMessage(message);
			setExternalMidiEnabled(true);
			compile();
			wantEvents();
			vstIsVst = 1;
			vstIsPerforming = 1;
			setScorePending(0);
		}
		else
		{
			bool succeeded = false;
			//	Csound wants to produce read-only output soundfiles.
			//	For MY purposes of multiple generate-synthesize-listen cycles, this is no good.
			succeeded = SetFileAttributes(getOutputSoundfileName().c_str(), FILE_ATTRIBUTE_NORMAL);
			succeeded = DeleteFile(getOutputSoundfileName().c_str());
			vstIsVst = 0;
			vstIsPerforming = 0;
			sprintf(message, "Csound performance ksmps=%d nchnls=%d....", getKsmps(), getNchnls());
			csoundMessage(message);
			setExternalMidiEnabled(false);
			perform();
		}
		//	NOTE: printf is not used because it is redefined by the macro "dribble" 
		//	which should not be used in this context.
		fprintf(stdout, "Performance finished.\n");
	}
	catch(const char *x)
	{
		fprintf(stdout, "Exception: %s\n", x);
	}
}

AEffect& CsoundVST::getAEffect()
{
	return cEffect;
}

bool CsoundVST::getInputProperties(long index, VstPinProperties* properties)
{
    if(index < kNumInputs)
    {
        sprintf(properties->label, "My %1d In", index + 1);
        properties->flags = kVstPinIsStereo | kVstPinIsActive;
        return true;
    }
    return false;
}

bool CsoundVST::getOutputProperties(long index, VstPinProperties* properties)
{
    if(index < kNumOutputs)
    {
        sprintf(properties->label, "My %1d Out", index + 1);
        properties->flags = kVstPinIsStereo | kVstPinIsActive;
        return true;
    }
    return false;
}

bool CsoundVST::getEffectName(char* name)
{
    strcpy(name, "CsoundVST synthesizer");
    return true;
}

bool CsoundVST::getVendorString(char* text)
{
    strcpy(text, "Vineyard Productions");
    return true;
}

bool CsoundVST::getProductString(char* text)
{
    strcpy(text, "CsoundVST synthesizer");
    return true;
}

long CsoundVST::canDo(char* text)
{
    if(strcmp(text, "receiveVstEvents") == 0)
	{
        return 1;
	}
    if(strcmp(text, "receiveVstMidiEvent") == 0)
	{
        return 1;
	}
    if(strcmp(text, "plugAsChannelInsert") == 0)
	{
        return 1;
	}
    if(strcmp(text, "plugAsSend") == 0)
	{
        return 1;
	}
    if(strcmp(text, "2in2out") == 0)
	{
        return 1;
	}
    return 0;
}

bool CsoundVST::keysRequired()
{
	return true;
}		

long CsoundVST::getProgram() 
{
	programs[curProgram].xml = getXML();
	return curProgram;
}

bool CsoundVST::getProgramNameIndexed(long category, long index, char* text)
{
	if(index < kNumPrograms)
	{
		strcpy(text, programs[index].name.c_str());
		return true;
	}
    return false;
}

bool CsoundVST::copyProgram(long destination)
{
    if(destination < kNumPrograms)
    {
        programs[destination] = programs[curProgram];
        return true;
    }
    return false;
}

// don't forget to set curProgram
// all following refer to curProgram
void CsoundVST::setProgram(long program)
{
    if(program < kNumPrograms)
    {
		curProgram = program;
        setXML(programs[curProgram].xml);
		editor->update();
    }
}

void CsoundVST::setProgramName(char *name)
{
	programs[curProgram].name = name;
}

void CsoundVST::getProgramName(char *name)
{
	if(curProgram < programs.size())
	{
		strcpy(name, programs[curProgram].name.c_str());
	}
}

/** Bank format:

  presetCount\n
  chunk1Length\n
  name\n
  text\n
  chunk2Length\n
  name\n
  text\n
  
*/

//	returns byteSize
//	when isPreset is true, you are asked to deal with *one* 'program'
//	(or preset) as opposed to a 'bank'.

long CsoundVST::getChunk(void** data, bool isPreset)
{
	if(isPreset)
	{
		programs[curProgram].xml = getXML();
		*data = (void *)programs[curProgram].xml.c_str();
		int size = strlen((char *)*data) + 1;
		return size;
	}
	else
	{
		std::ostringstream stream;
		int n = programs.size();
		stream << n << "\n";
		for(std::vector<Program>::iterator it = programs.begin(); it != programs.end(); ++it)
		{
			Program &program = (*it);
			stream << program.name.c_str() << "\n";
			stream << program.xml.size() << "\n";
			for(std::string::iterator jt = program.xml.begin(); jt != program.xml.end(); ++jt)
			{
				stream.put(*jt);	
			}
			stream << "\n";
		}
		bankBuffer = stream.str();
		*data = (void *)bankBuffer.c_str();
		return bankBuffer.size();
	}
	return 0;
}

long CsoundVST::setChunk(void* data, long byteSize, bool isPreset)
{
	if(isPreset)
	{
		programs[curProgram].xml = (char *)data;
		setXML(programs[curProgram].xml);
		editor->update();
		return byteSize;
	}
	else
	{
		std::istringstream stream((char *)data, byteSize);
		std::string buffer;
		stream >> buffer;
		stream >> std::ws;
		int n = atoi(buffer.c_str());
		programs.resize(n);
		for(int i = 0; i < n; i++)
		{
			Program program;
			stream >> program.name;
			stream >> std::ws;
			stream >> buffer;
			stream >> std::ws;
			int length = atoi(buffer.c_str());
			program.xml.resize(length);
			char c;
			for(int j = 0; j < length; j++)
			{
				stream.get(c);
				program.xml[j] = c;
			}
			stream >> std::ws;
			programs[i] = program;
		}
		setProgram(0);
		return byteSize;
	}
	return 0;
}

//	Enqueues VstMidiEvents 
//	for the Csound MIDI driver's readmidi() function.

std::deque<VstMidiEvent*> CsoundVST::midiQueue;

long CsoundVST::processEvents(VstEvents *vstEvents)
{
    for(int i = 0; i < vstEvents->numEvents; i++)
    {
        if(vstEvents->events[i]->type == kVstMidiType)
        {
            VstMidiEvent *vstMidiEvent = (VstMidiEvent *)vstEvents->events[i];
			midiQueue.push_back(vstMidiEvent);
        }
    }
	return 1;
}

//	Adds audio data from Csound's spout buffer to the VST output buffer.
//	Note that the buffers have different sizes and even different shapes.

void CsoundVST::process(float **vstInputs, float **vstOutputs, long vstKsmps)
{
	if(vstIsPerforming)
	{
		int nchnls = getNchnls();
		int ksmps = getKsmps();
		float *spin = getSpin();
		float *spout = getSpout();
		synchronizeScore();
		//	Input must be delayed ksmps relative to output. Use ksmps = 1 for minimal delay.
		if(vstInputs)
		{
			for(vstInputFrameI = 0, vstOutputFrameI = 0; vstOutputFrameI < vstKsmps; vstInputFrameI++, vstOutputFrameI++)
			{
				for(vstInputChannelI = 0; vstInputChannelI < cEffect.numInputs; vstInputChannelI++)
				{
					spin[(vstSpinFrameI * nchnls) + vstInputChannelI] = inputScale * vstInputs[vstInputChannelI][vstInputFrameI];
				}
				if(vstSpinFrameI >= ksmps)
				{
					vstSpinFrameI = 0;
				}
				if(vstSpoutFrameI == 0)
				{
					performKsmps();
				}
				for(vstOutputChannelI = 0; vstOutputChannelI < cEffect.numInputs; vstOutputChannelI++)
				{
					vstOutputs[vstOutputChannelI][vstOutputFrameI] += (outputScale * spout[(vstSpoutFrameI * nchnls) + vstOutputChannelI]);
				}
				vstSpoutFrameI++;
				if(vstSpoutFrameI >= ksmps)
				{
					vstSpoutFrameI = 0;
				}
			}
		}
		else
		{
			for(vstOutputFrameI = 0; vstOutputFrameI < vstKsmps; vstOutputFrameI++)
			{
				if(vstSpoutFrameI == 0)
				{
					performKsmps();
				}
				for(vstOutputChannelI = 0; vstOutputChannelI < cEffect.numInputs; vstOutputChannelI++)
				{
					vstOutputs[vstOutputChannelI][vstOutputFrameI] += (outputScale * spout[(vstSpoutFrameI * nchnls) + vstOutputChannelI]);
				}
				vstSpoutFrameI++;
				if(vstSpoutFrameI >= ksmps)
				{
					vstSpoutFrameI = 0;
				}	
			}
		}
	}
	else
	{
		for(vstOutputChannelI = 0; vstOutputChannelI < cEffect.numInputs; vstOutputChannelI++)
		{
			for(vstOutputFrameI = 0; vstOutputFrameI < vstKsmps; vstOutputFrameI++)
			{
				vstOutputs[vstOutputChannelI][vstOutputFrameI] += vstInputs[vstOutputChannelI][vstOutputFrameI];
			}
		}
	}	
}

void CsoundVST::processReplacing(float **vstInputs, float **vstOutputs, long vstKsmps)
{
	if(vstIsPerforming)
	{
		int nchnls = getNchnls();
		int ksmps = getKsmps();
		float *spin = getSpin();
		float *spout = getSpout();
		synchronizeScore();
		//	Input must be delayed ksmps relative to output. Use ksmps = 1 for minimal delay.
		if(vstInputs)
		{
			for(vstInputFrameI = 0, vstOutputFrameI = 0; vstOutputFrameI < vstKsmps; vstInputFrameI++, vstOutputFrameI++)
			{
				for(vstInputChannelI = 0; vstInputChannelI < cEffect.numInputs; vstInputChannelI++)
				{
					spin[(vstSpinFrameI * nchnls) + vstInputChannelI] = inputScale * vstInputs[vstInputChannelI][vstInputFrameI];
				}
				if(vstSpinFrameI >= ksmps)
				{
					vstSpinFrameI = 0;
				}
				if(vstSpoutFrameI == 0)
				{
					performKsmps();
				}
				for(vstOutputChannelI = 0; vstOutputChannelI < cEffect.numInputs; vstOutputChannelI++)
				{
					vstOutputs[vstOutputChannelI][vstOutputFrameI] = outputScale * spout[(vstSpoutFrameI * nchnls) + vstOutputChannelI];
				}
				vstSpoutFrameI++;
				if(vstSpoutFrameI >= ksmps)
				{
					vstSpoutFrameI = 0;
				}
			}
		}
		else
		{
			for(vstOutputFrameI = 0; vstOutputFrameI < cEffect.numInputs; vstOutputFrameI++)
			{
				if(vstSpoutFrameI == 0)
				{
					performKsmps();
				}
				for(vstOutputChannelI = 0; vstOutputChannelI < cEffect.numInputs; vstOutputChannelI++)
				{
					vstOutputs[vstOutputChannelI][vstOutputFrameI] = outputScale * spout[(vstSpoutFrameI * nchnls) + vstOutputChannelI];
				}
				vstSpoutFrameI++;
				if(vstSpoutFrameI >= ksmps)
				{
					vstSpoutFrameI = 0;
				}
			}
		}
	}
	else
	{
		for(vstOutputChannelI = 0; vstOutputChannelI < cEffect.numInputs; vstOutputChannelI++)
		{
			for(vstOutputFrameI = 0; vstOutputFrameI < vstKsmps; vstOutputFrameI++)
			{
				vstOutputs[vstOutputChannelI][vstOutputFrameI] = vstInputs[vstOutputChannelI][vstOutputFrameI];
			}
		}
	}	
}

void CsoundVST::suspend()
{
	stop();
	fcloseall();
}		

void CsoundVST::resume()
{
	vstPerform();
}		

static void __cdecl performanceThreadRoutine(void *data)
{
	((CsoundVST *)data)->startPerformance();
}

void CsoundVST::vstPerform(void)
{
	try
	{	
		stop();
		int orcLength = getOrchestra().length();
		if(orcLength <= 1)
		{
			fprintf(stdout, "No orchestra, no performance.\n");
			return;
		}
		vstIsVst = 1;
		performanceThread = _beginthread(performanceThreadRoutine, 0, this);
	}
	catch(...)
	{
		MessageBox(0, "Compilation error.", "CsoundVST", MB_ICONEXCLAMATION);
	}
}

void CsoundVST::csoundPerform(void)
{
	try
	{	
		stop();
		int orcLength = getOrchestra().length();
		if(orcLength <= 1)
		{
			fprintf(stdout, "No orchestra, no performance.\n");
			return;
		}
		vstIsVst = 0;
		performanceThread = _beginthread(performanceThreadRoutine, 0, this);
	}
	catch(...)
	{
		MessageBox(0, "Compilation error.", "CsoundVST", MB_ICONEXCLAMATION);
	}
}

AEffEditor *CsoundVST::getEditor(void)
{
	return editor;
}

CsoundView *CsoundVST::getView(void)
{
	return (CsoundView *)editor;
}

void CsoundVST::setVST(int isVST)
{
	vstIsVst = isVST;
}

int CsoundVST::isVST(void)
{
	return vstIsVst;
}

void CsoundVST::reset(void)
{
	SSound::reset();
	vstBeginPerformanceAt = 0.0;
	vstSpinFrameI = 0;
	vstSpinChannelI = 0;
	vstInputFrameI = 0;
	vstInputChannelI = 0;
	vstOutputFrameI = 0;
	vstOutputChannelI = 0;
	vstSpoutFrameI = 0;
	vstSpoutChannelI = 0;
	vstIsVst = 0;
	vstIsPerforming = 0;
	vstPriorSamplePosition = 0;
	vstCurrentSamplePosition = 0;
}

void CsoundVST::throwMessage(const char *x)
{
	if(x)
	{
		throw strdup(x);
	}
	else
	{
		throw strdup("Unidentified exception.");
	}
}

extern "C"
{
	
	__declspec(dllexport) CsoundVST *CreateCsoundVST(void)
	{
		return new CsoundVST;
	}
	
	void vstCsoundWxLogCallback(const char *message);

	void vstCsoundStderrLogCallback(const char *message)
	{
		std::cerr << message;
	}
};

void CsoundVST::synchronizeScore(void)
{
	VstTimeInfo *vstTimeInfo = getTimeInfo(0);
	vstPriorSamplePosition = vstCurrentSamplePosition;
	vstCurrentSamplePosition = vstTimeInfo->samplePos;
	if((vstCurrentSamplePosition && !vstPriorSamplePosition) || (vstCurrentSamplePosition < vstPriorSamplePosition))
	{
		setScorePending(1);
		rewindScore();
		vstBeginPerformanceAt = double(vstTimeInfo->samplePos) / double(vstTimeInfo->sampleRate);
		setScoreOffsetSeconds(vstBeginPerformanceAt);
		message("Score synchronized.");
	}
}

void CsoundVST::shellPlaySoundfile(void)
{
	std::string filename = getOutputSoundfileName();
	std::string text = "Attempting to play ";
	text += filename;
	text += ".";
	message(text.c_str());
	HINSTANCE returnValue = ShellExecute(0,
		"open",
		filename.c_str(),
		0,
		0,
		SW_SHOWNORMAL);
}

void CsoundVST::shellEditSoundfile(void)
{
	std::string filename = getOutputSoundfileName();
	std::string text = "Attempting to edit ";
	text += filename;
	text += ".";
	message(text.c_str());
	HINSTANCE returnValue = ShellExecute(0,
		"edit",
		filename.c_str(),
		0,
		0,
		SW_SHOWNORMAL);
}

bool CsoundVST::loadOrcLibrary(const char *filename)
{
	char buffer[0x200];
	int length = ::GetPrivateProfileString("CsoundVST", "OrchestraLibraryFilename", "", buffer, 0x200, "CsoundVST.ini");
	return CsoundFile::loadOrcLibrary(buffer);
}