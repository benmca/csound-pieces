#ifndef SSOUND_H
#define SSOUND_H
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
* Csound as a C++ class in a static library 
* to be used as a software synthesis engine
* in various projects on various platforms.
* <p>
* This is the main target of the Csound build system.
*/
#include <Csound/CS.H>
#include <Csound/csound.h>
#include <SSound/CsoundFile.h>
#include <string>
#include <vector>

class SSound : 
//	Mix in Csound file handling functionality.
public CsoundFile
{
	int keepPerforming;
public:
	//	Default creator.
	SSound(void);
	//	Virtual destructor.
	virtual ~SSound(void);
	//	Using the specified arguments, 
	//	compiles and performs the orchestra and score, 
	//	in one pass, just as Csound would do.
	virtual int perform(int argc, char **argv);
	//	Using stored arguments, 
	//	compiles and performs the orchestra and score,
	//	in one pass, just as Csound would do.
	virtual int perform(void);
	//	Stops the performance.
	virtual void stop(void);
	//	Compiles the score and orchestra without performing them,
	//	in preparation for calling performKsmps.
	virtual int compile(int argc, char **argv);
	//	Using stored arguments, 
	//	compiles the score and orchestra without performing them,
	//	in preparation for calling performKsmps.
	virtual int compile(void);
	//	Causes Csound to read ksmps of audio sample frames from its input buffer,
	//	compute the performance, 
	//	and write the performed sample frames to its output buffer.
	virtual int performKsmps(void);
	//	Must be called after the final call to performKsmps.
	virtual void cleanup(void);
	//	Resets all internal state.
	virtual void reset(void);
	//	Returns the address of the Csound input buffer;
	//	external software can write to it before calling performKsmps.
	virtual MYFLT *getSpin(void);
	//	Returns the address of the Csound output buffer;
	//	external software can read from it after calling performKsmps.
	virtual MYFLT *getSpout(void);
	//	Sets a function for Csound to call to print informational messages through external software.
	virtual void setMessageCallback(void (*messageCallback)(const char *message));
	//	Print an informational message.
	virtual void message(const char *text);
	//	Stops execution with an error message or exception.
	static void throwMessage(const char *exception);
	//	Called by external software to set a funtion for Csound to stop execution
	//	with an error message or exception.
	static void setThrowMessageCallback(void (*throwCallback)(const char *message));
	//	Returns 1 if MIDI input from external software is enabled, or 0 if not.
	virtual int isExternalMidiEnabled(void);
	//	Sets whether MIDI input from external software is enabled.
	virtual void setExternalMidiEnabled(int enabled);
	//	Called by external software to set a function for Csound to call to open MIDI input.
	virtual void setExternalMidiOpenCallback(void (*midiOpen)(void));
	//	Called by external software to set a function for Csound to call to read MIDI messages.
	virtual void setExternalMidiReadCallback(int (*readMidi)(char *mbuf, int size));
	//	Called by external software to set a function for Csound to call to close MIDI input.
	virtual void setExternalMidiCloseCallback(void (*closeMidi)(void));	
	//	Returns the number of audio sample frames per control sample.
	virtual int getKsmps(void);
	//	Returns the number of audio output channels.
	virtual int getNchnls(void);
	//	Sets the message level (0 to 7).
	static void setMessageLevel(int messageLevel);
	//	Returns the Csound message level (0 to 7).
	static int getMessageLevel(void);
	//	Appends an opcode to the opcode list.
	static int appendOpcode(OENTRY *opcodeEntry);
	//	Returns whether Csound's score is synchronized with external software.
	virtual int isScorePending(void);
	//	Sets whether Csound's score is synchronized with external software.
	virtual void setScorePending(int pending);
	//	Csound events prior to the offset are consumed and discarded prior to beginning performance.
	//	Can be used by external software to begin performance midway through a Csound score.
	virtual void setScoreOffsetSeconds(MYFLT offset);
	//	Csound events prior to the offset are consumed and discarded prior to beginning performance.	
	//	Can be used by external software to begin performance midway through a Csound score.
	virtual MYFLT getScoreOffsetSeconds(void);
	//	Rewind a compiled Csound score to its beginning.
	virtual void rewindScore(void);
	//	Returns the number of audio sample frames per second.
	virtual MYFLT getSr(void);
	//	Returns the number of control samples per second.
	virtual MYFLT getKr(void);
	//	Loads plugin opcodes.
	virtual int loadAllOpcodes(void);
	//	Returns a function table.
	FUNC *(*ftfind)(int index);
	//	Tests the specified instrument using the current orchestra,
	//	and returns the name of the output soundfile.
	virtual std::string test(std::string instrumentName) const;
};


#endif

