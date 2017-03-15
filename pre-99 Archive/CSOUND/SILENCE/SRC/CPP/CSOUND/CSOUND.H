#ifndef CSOUND_H
#define CSOUND_H
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
*
* P U R P O S E
*
* Declares the public C application programming interface to Csound.
*/
#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
	
	/*
	* Platform-dependent definitions and declarations.
	*/
#ifdef WIN32
#define PUBLIC __declspec(dllexport) 
#define LIBRARY_CALL WINAPI
#else
#define PUBLIC
#define LIBRARY_CALL
#endif
#include <Csound/CS.H>
	
	/**
	* Compiles and renders a Csound performance, 
	* as directed by the supplied command-line arguments,
	* in one pass. Returns true for success, or false for failure.
	*/
	int csoundPerform(int argc, char **argv);
	
	/**
	* Compiles Csound input files (such as an orchestra and score)
	* as directed by the supplied command-line arguments,
	* but does not perform them. Returns true for success, or false for failure.
	* <p>
	* In this (host-driven) mode, the sequence of calls should be as follows:
	* <pre>
	csoundCompile(argc, argv);
	while(!csoundPerformKsmps());
	csoundCleanup();
	csoundReset();
	</pre>
	*/
	int csoundCompile(int argc, char **argv);
	
	/**
	* Senses input events, and performs one control sample worth (ksmps) of audio output.
	* Note that csoundCompile must be called first.
	* Returns false during performance, and true when performance is finished.
	* If called until it returns true, will perform an entire score.
	* Enables external software to control the execution of Csound,
	* and to synchronize performance with audio input and output.
	*/
	int csoundPerformKsmps(void);
	
	/**
	* Returns the address of the Csound audio input working buffer (spin).
	* Enables external software to write audio into Csound before calling csoundPerformKsmps.
	*/
	MYFLT *csoundGetSpin(void);
	
	/**
	* Returns the address of the Csound audio output working buffer (spout).
	* Enables external software to read audio from Csound after calling csoundPerformKsmps.
	*/
	MYFLT *csoundGetSpout(void);
	
	/**
	* Prints information about the end of a performance.
	* Must be called after the final call to csoundPerformKsmps.
	*/
	void csoundCleanup(void);
	
	/**
	* Resets all internal memory and state in preparation for a new performance.
	* Enables external software to run successive Csound performances
	* without reloading Csound.
	*/
	void csoundReset(void);
	
	/**
	* Sets a function to be called by Csound to print an informational message.
	*/
	void csoundSetMessageCallback(void (*CsoundMessageCallback)(const char *message));
	
	/**
	* Called by Csound to print an informational message.
	*/
	void csoundMessage(const char *message);
	
	/**
	* Stops execution with an error message or exception.
	*/
	void csoundThrowMessage(const char *exception);
	
	/**
	* Called by external software to set a funtion for Csound to stop execution
	* with an error message or exception.
	*/
	void csoundSetThrowMessageCallback(void (*throwCallback)(const char *message));
	
	/**
	* Returns 1 if MIDI input from external software is enabled, or 0 if not.
	*/
	int csoundIsExternalMidiEnabled(void);
	
	/**
	* Sets whether MIDI input from external software is enabled.
	*/
	void csoundSetExternalMidiEnabled(int enabled);
	
	/**
	* Called by external software to set a function for Csound to call to open MIDI input.
	*/
	void csoundSetExternalMidiOpenCallback(void (*midiOpen)(void));
	
	/**
	* Called by Csound to open a MIDI input in external software.
	*/
	void csoundExternalMidiOpen(void);
	
	/**
	* Called by external software to set a function for Csound to call to read MIDI messages.
	*/
	void csoundSetExternalMidiReadCallback(int (*readMidi)(char *mbuf, int size));
	
	/**
	* Called by Csound to read MIDI messages from external software.
	*/
	int csoundExternalMidiRead(char *mbuf, int size);
	
	/**
	* Called by external software to set a function for Csound to call to close MIDI input.
	*/
	void csoundSetExternalMidiCloseCallback(void (*closeMidi)(void));
	
	/**
	* Called by Csound to close MIDI input from external software.
	*/
	void csoundExternalMidiClose(void);
	
	/**
	* Returns the number of audio sample frames per control sample.
	*/
	int csoundGetKsmps(void);
	
	/**
	* Returns the number of audio output channels.
	*/
	int csoundGetNchnls(void);
	
	/**
	* Sets the Csound message level (from 0 to 7).
	*/
	void csoundSetMessageLevel(int messageLevel);
	
	/**
	* Returns the Csound message level (from 0 to 7).
	*/
	int csoundGetMessageLevel(void);
	
	/**
	* Appends an opcode implemented by external software
	* to Csound's internal opcode list.
	* The opcode list is extended by one slot,
	* and the data pointed to by opcodeEntry is copied
	* into the new slot.
	*/
	int csoundAppendOpcode(OENTRY *opcodeEntry);
	
	/**
	* Returns whether Csound's score is synchronized with external software.
	*/
	int csoundIsScorePending(void);
	
	/**
	* Sets whether Csound's score is synchronized with external software.
	*/
	void csoundSetScorePending(int pending);
	
	/**
	* Csound events prior to the offset are consumed and discarded prior to beginning performance.
	* Can be used by external software to begin performance midway through a Csound score.
	*/
	MYFLT csoundGetScoreOffsetSeconds(void);
	
	/**
	* Csound events prior to the offset are consumed and discarded prior to beginning performance.
	* Can be used by external software to begin performance midway through a Csound score.
	*/
	void csoundSetScoreOffsetSeconds(MYFLT offset);
	
	/**
	* Rewinds a compiled Csound score to its beginning.
	*/
	void csoundRewindScore(void);
	
	/**
	* Returns the number of audio sample frames per second.
	*/
	MYFLT csoundGetSr(void);
	
	/**
	* Returns the number of control samples per second.
	*/
	MYFLT csoundGetKr(void);
	
	/*
	* Platform-independent function 
	* to load a shared library.
	*/
	int csoundLoadLibrary(const char *libraryPath);
	
	/*
	* Platform-independent function 
	* to get a function address
	* in a shared library.
	*/
	int csoundFindLibraryProcedure(int library,
		const char *procedureName);

	/*
	* Signature for opcode registration function.
	* Both Csound and opcode must be compiled 
	* with 8 byte structure member alignment (for OENTRY).
	* This function returns true if an opcode exists at index, or false otherwise.
	* The opcode may store and call ftfind_, csoundGetSr_, csoundGetKr_,
	* and csoundGetNchnls_.
	*/
	typedef	PUBLIC int (*CsoundEnumerateOpcodesType)(int index,
		OENTRY *oentry, 
		FUNC *(*ftfind_)(int index), 
		MYFLT (*csoundGetSr_)(), 
		MYFLT (*csoundGetKr_)(),
		int (*csoundGetNchnls_)());
		
	/*
	* Registers all opcodes in the library.
	*/
	long csoundLoadOpcodes(const char *libraryPath);

	/*
	* Registers all opcodes in all libraries in the opcodes directory.
	*/
	long csoundLoadAllOpcodes(void);

	/**
	* Deinitializes all opcodes in the instrument instance.
	*/
	void csoundOpcodeDeinitialize(INSDS *instrumentInstance);

	
#ifdef __cplusplus
};
#endif // __cplusplus

#endif // CSOUND_H




