#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <time.h>
#include <SSound/SSound.h>
#include <Csound/csound.h>
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
SSound::SSound(void) : keepPerforming(0)
{
}

SSound::~SSound(void)
{
}

int SSound::perform(void)
{
	int argc = 0;
	char **argv = 0;
	scatterArgs(getCommand(), &argc, &argv);
	int returnValue = perform(argc, argv);
	deleteArgs(argc, argv);
	return returnValue;
}

int SSound::perform(int argc, char **argv)
{
	if(argc <= 0)
	{
		return 0;
	}
	compile(argc, argv);
	keepPerforming = 1;
	while(keepPerforming && !performKsmps());
	csoundCleanup();
	return 1;
}

void SSound::stop(void)
{
	keepPerforming = 0;
}

void SSound::reset(void)
{
	//fcloseall();
	//csoundReset();
}

int SSound::compile(int argc, char **argv)
{
	return csoundCompile(argc, argv);
}

int SSound::compile(void)
{
	int argc = 0;
	char **argv = 0;
	scatterArgs(getCommand(), &argc, &argv);
	int returnValue = compile(argc, argv);
	deleteArgs(argc, argv);
	return returnValue;
}

int SSound::performKsmps()
{
	return csoundPerformKsmps();
}

void SSound::cleanup(void)
{
	csoundCleanup();
}

MYFLT *SSound::getSpin(void)
{
	return csoundGetSpin();
}

MYFLT *SSound::getSpout(void)
{
	return csoundGetSpout();
}

void SSound::setMessageCallback(void (*messageCallback)(const char *message))
{
	csoundSetMessageCallback(messageCallback);
}

int SSound::getKsmps(void)
{
	return csoundGetKsmps();
}

int SSound::getNchnls(void)
{
	return csoundGetNchnls();
}

int SSound::getMessageLevel(void)
{
	return csoundGetMessageLevel();
}

void SSound::setMessageLevel(int messageLevel)
{
	csoundSetMessageLevel(messageLevel);
}

void SSound::throwMessage(const char *exception)
{
	csoundThrowMessage(exception);
}
	
void SSound::setThrowMessageCallback(void (*throwCallback)(const char *message))
{
	csoundSetThrowMessageCallback(throwCallback);
}

int SSound::isExternalMidiEnabled(void)
{
	return csoundIsExternalMidiEnabled();
}

void SSound::setExternalMidiEnabled(int enabled)
{
	csoundSetExternalMidiEnabled(enabled);
}

void SSound::setExternalMidiOpenCallback(void (*midiOpen)(void))
{
	csoundSetExternalMidiOpenCallback(midiOpen);
}

void SSound::setExternalMidiReadCallback(int (*midiRead)(char *mbuf, int size))
{
	csoundSetExternalMidiReadCallback(midiRead);
}

void SSound::setExternalMidiCloseCallback(void (*midiClose)(void))
{
	csoundSetExternalMidiCloseCallback(midiClose);
}

int SSound::isScorePending(void)
{
	return csoundIsScorePending();
}

void SSound::setScorePending(int pending)
{
	csoundSetScorePending(pending);
}

void SSound::setScoreOffsetSeconds(MYFLT offset)
{
	csoundSetScoreOffsetSeconds(offset);
}

MYFLT SSound::getScoreOffsetSeconds(void)
{
	return csoundGetScoreOffsetSeconds();
}

void SSound::rewindScore(void)
{
	csoundRewindScore();
}

MYFLT SSound::getSr(void)
{
	return csoundGetSr();
}

MYFLT SSound::getKr(void)
{
	return csoundGetKr();
}

int SSound::appendOpcode(OENTRY *opcodeEntry)
{
	return csoundAppendOpcode(opcodeEntry);
}

void SSound::message(const char *text)
{
	csoundMessage(text);
}

int SSound::loadAllOpcodes(void)
{
	return csoundLoadAllOpcodes();
}

std::string SSound::test(std::string instrumentName) const
{
	SSound test;
	//	Test command line.
	test.command = "csound -RWdo ./test.wav ./test.orc ./test.sco";
	//	Test orchestra.
	test.orchestra = getOrchestraHeader();
	std::string definition;
	bool returnValue = getInstrument(instrumentName, definition);
	if(!returnValue)
	{
		return "";
	}
	test.orchestra.append("\n");
	test.orchestra.append(definition);
	test.addArrangement(instrumentName);
	//	Test score.
	double time = 0;
	for(double decibels = 80.0; decibels >= 40; decibels = decibels - 20.0)
	{
		for(double duration = 4.0; duration >= 0.0125; duration = duration / 4.0)
		{
			for(double key = 36.0; key <= 96.0; key += 6.0)
			{
				test.addNote(1.0, time, duration, key / 12.0 + 3, decibels, 0, 0, 0, 0, 0);
				time += duration;
				time += 0.25;
			}
		}
	}
	//	Performance.
	test.exportForPerformance();
	test.perform();
	return "./test.wav";
}