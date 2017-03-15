/*-----------------------------------------------------------------------------

© 1999, Steinberg Soft und Hardware GmbH, All Rights Reserved

-----------------------------------------------------------------------------*/
#include <windows.h>
#include "ACsoundVST.hpp"
//#include <iostream.h>
#include <strstrea.h>
//#include <stdio.h>
extern HANDLE thCsound;
HANDLE thVSTbox;
extern void VSTbox();
extern "C" void reset_all();
DWORD IDThreadVST;
extern "C" long VSTblock_size;
extern "C" float VSTsampleRate;
extern "C" HANDLE EvVST, EvCsound;
extern "C" void RegistrySet(); 
//long block_size;


ostrstream strgab; 

//-----------------------------------------------------------------------------
ACsoundVST::ACsoundVST(audioMasterCallback audioMaster)
	: AudioEffectX(audioMaster, 1, 1)	// 1 program, 1 parameter only
{
	fGain = 1.;				// default to 0 dB
	setNumInputs(2);		// stereo in
	setNumOutputs(2);		// stereo out
	setUniqueID('Csnd');	// identify
	canMono();				// makes sense to feed both inputs with the same signal
	canProcessReplacing();	// supports both accumulating and replacing output
	//isSynth();
	strcpy(programName, "Csound1");	// default program name
	
	EvVST = CreateEvent(NULL,TRUE,FALSE,NULL);
	EvCsound = CreateEvent(NULL,TRUE,TRUE,NULL);
	//ResetEvent(EvCsound);
/*

	AllocConsole();
	LPDWORD ncw;
	HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE); 
	strgab << "console created\n\n";
	WriteConsole( hConsole,  // handle to a console screen buffer 
			strgab.str(),  // pointer to buffer to write from 
			strgab.pcount(),  // number of characters to write 
			ncw,  // pointer to number of characters written 
			NULL // reserved 
	); 
 

*/
	
	thVSTbox = CreateThread(
						NULL,	// address of thread security attributes  
						8192,	// initial thread stack size, in bytes 
						(LPTHREAD_START_ROUTINE) VSTbox, // address of thread function 
						0,	// argument for new thread 
						0,	// creation flags 
						&IDThreadVST// address of returned thread ID 
					);
	/*VSTblock_size = getBlockSize();
	VSTsampleRate = getSampleRate();
*/
	VSTblock_size = updateBlockSize();
	VSTsampleRate = (float) updateSampleRate();
//	cout << "console created\n\n" << '\n';
//	puts("console created\n\n");
}



//-----------------------------------------------------------------------------------------
ACsoundVST::~ACsoundVST()
{
	RegistrySet();
	TerminateThread(thCsound,0);
	reset_all();
	TerminateThread(thVSTbox,0);
	CloseHandle( EvVST);
	CloseHandle( EvCsound);
}

/*
long ACsoundVST::processEvents (VstEvents* events)
{
	return 0;
}
*/
//-----------------------------------------------------------------------------------------
/*
void ACsoundVST::resume ()
{
	wantEvents ();
}
*/
//-----------------------------------------------------------------------------------------
/*
long ACsoundVST::processEvents (VstEvents* ev)
{
	for (long i = 0; i < ev->numEvents; i++)
	{
		if ((ev->events[i])->type != kVstMidiType)
			continue;
		VstMidiEvent* event = (VstMidiEvent*)ev->events[i];
		char* midiData = event->midiData;
		
		long status = midiData[0] & 0xf0;		// ignoring channel
		if (status == 0x90 || status == 0x80)	// we only look at notes
		{
			long note = midiData[1] & 0x7f;
			long velocity = midiData[2] & 0x7f;
			if (status == 0x80)
				velocity = 0;
			if (!velocity && (note == currentNote))
				noteIsOn = false;	// note off by velocity 0
			else
				noteOn (note, velocity, event->deltaFrames);
		}
		else if (status == 0xb0 && midiData[1] == 0x7e)	// all notes off
			noteIsOn = false;
		event++;
		
	}
	return 1;	// want more
}
*/
//-----------------------------------------------------------------------------------------
void ACsoundVST::setProgramName(char *name)
{
	strcpy(programName, name);
}

//-----------------------------------------------------------------------------------------
void ACsoundVST::getProgramName(char *name)
{
	strcpy(name, programName);
}

//-----------------------------------------------------------------------------------------
void ACsoundVST::setParameter(long index, float value)
{
	fGain = value;
}

//-----------------------------------------------------------------------------------------
float ACsoundVST::getParameter(long index)
{
	return fGain;
}

//-----------------------------------------------------------------------------------------
void ACsoundVST::getParameterName(long index, char *label)
{
	strcpy(label, "  Gain  ");
}

//-----------------------------------------------------------------------------------------
void ACsoundVST::getParameterDisplay(long index, char *text)
{
	dB2string(fGain, text);
}

//-----------------------------------------------------------------------------------------
void ACsoundVST::getParameterLabel(long index, char *label)
{
	strcpy(label, "   dB   ");
}

//-----------------------------------------------------------------------------------------

extern "C" float *spinVST, *spoutVST;
#include <stdio.h>
#define ONEUP32767 3.05185094759971922971282082583087e-5f


void ACsoundVST::process(float **inputs, float **outputs, long sampleFrames)
{
    float *in1  =  inputs[0];
    float *in2  =  inputs[1];
    float *out1 = outputs[0];
    float *out2 = outputs[1];
/*
    while(--sampleFrames >= 0)
    {
        (*out1++) += (*in1++) * fGain;    // accumulating
        (*out2++) += (*in2++) * fGain;
    }
*/

	float *cs_in = spinVST, *cs_out=spoutVST;

	ResetEvent(EvVST);
	SetEvent(EvCsound);
	WaitForSingleObject(EvVST, INFINITE);

	long n=sampleFrames;
    do {
        *cs_in++ = *in1++ * fGain;    
		*cs_in++ = *in2++ * fGain;
        *out1++ += *cs_out++ * ONEUP32767;    // accumulating
		*out2++ += *cs_out++ * ONEUP32767;
    } while(--n);



}

//-----------------------------------------------------------------------------------------



void ACsoundVST::processReplacing(float **inputs, float **outputs, long sampleFrames)
{
    float *in1  =  inputs[0];
    float *in2  =  inputs[1];
    float *out1 = outputs[0];
    float *out2 = outputs[1];
	float *cs_in = spinVST, *cs_out=spoutVST;
	
	ResetEvent(EvVST);
	SetEvent(EvCsound);
	WaitForSingleObject(EvVST, INFINITE);
	long n=sampleFrames;
    do    {
        *cs_in++ = *in1++ * fGain;    
		*cs_in++ = *in2++ * fGain;
        *out1++ = *cs_out++ * ONEUP32767;    // replacing
		*out2++ = *cs_out++ * ONEUP32767;
    } while(--n);

}

/*
void ACsoundVST::processReplacing(float **inputs, float **outputs, long sampleFrames)
{
    float *in1  =  inputs[0];
    float *in2  =  inputs[1];
    float *out1 = outputs[0];
    float *out2 = outputs[1];
	float *cs_in = spin, *cs_out=spout;
	
	ResetEvent(EvVST);
	SetEvent(EvCsound);
	WaitForSingleObject(EvVST, INFINITE);
	long n=sampleFrames;
    do    {
        *cs_in++ = *in1++ * fGain;    
		*cs_in++ = *in2++ * fGain;
        *out1++ = *cs_out++;    // replacing
		*out2++ = *cs_out++;
    } while(--n);

}
*/

