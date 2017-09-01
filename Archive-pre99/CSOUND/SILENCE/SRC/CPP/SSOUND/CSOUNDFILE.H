#ifndef CSOUND_FILE_H
#define CSOUND_FILE_H
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
* XML-like file for containing all elements of a Csound orchestra and score.
* It is assumed to be stored in an ".csd" file.
* Functions return true for success or false for failure.
* Note that standard C++ library iostreams are used, 
* but file modes are exclusively binary - 
* all text is written newline terminated, without carriage returns.
* This enables binary MIDI data to be embedded in the XML stream.
*/
#pragma warning(disable: 4786)
#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <fstream>
#include <sstream>
#include <stdlib.h>
#include <io.h>

std::string &trim(std::string &value);
std::string &trimQuotes(std::string &value);

//	Returns true if definition is a valid Csound instrument definition block.
//	Also returns the part before the instr number, the instr number, 
//	the name (all text after the first comment on the same line as the instr number),
//	and the part after the instr number, all by reference.

bool parseInstrument(const std::string &definition, std::string &preNumber, int &number, std::string &name, std::string &postNumber);

void gatherArgs(int argc, const char **argv, std::string &commandLine);

void scatterArgs(const std::string commandLine, int *argc, char ***argv);

void deleteArgs(int argc, char **argv);

class CsoundFile
{
public:
	CsoundFile();
	virtual ~CsoundFile(void){};
	virtual std::string getFilename(void);
	virtual void setFilename(std::string name);
	virtual int load(std::string filename);
	virtual int load(std::istream &stream);
	virtual int save(std::string filename) const;
	virtual int save(std::ostream &stream) const;
	virtual int import(std::string filename);
	virtual int import(std::istream &stream);
	virtual int importCommand(std::istream &stream);
	virtual int exportCommand(std::ostream &stream) const;
	virtual int importOrchestra(std::istream &stream);
	virtual int exportOrchestra(std::ostream &stream) const;
	virtual int importScore(std::istream &stream);
	virtual int exportScore(std::ostream &stream) const;
	virtual int importArrangement(std::istream &stream);
	virtual int exportArrangement(std::ostream &stream) const;
	virtual int exportArrangementForPerformance(std::string filename) const;
	virtual int exportArrangementForPerformance(std::ostream &stream) const;
	virtual int importMidifile(std::istream &stream);
	virtual int exportMidifile(std::ostream &stream) const;
	virtual std::string getCommand(void);
	virtual void setCommand(std::string commandLine);
	virtual std::string getOrcFilename(void) const;
	virtual std::string getScoFilename(void) const;
	virtual std::string getMidiFilename(void) const;
	virtual std::string getOutputSoundfileName(void) const;
	virtual std::string getOrchestra(void) const;
	virtual void setOrchestra(std::string orchestra);
	virtual int getInstrumentCount(void) const;
	virtual std::string getOrchestraHeader(void) const;
	virtual bool getInstrument(int index, std::string &definition) const;
	virtual bool getInstrumentNumber(int index, std::string &definition) const;
	virtual bool getInstrument(std::string name, std::string &definition) const;
	virtual std::string getScore() const;
	virtual void setScore(std::string score);
	virtual int getArrangementCount() const;
	virtual std::string getArrangement(int index) const;
	virtual void addArrangement(std::string instrument);
	virtual void setArrangement(int index, std::string instrument);
	virtual void insertArrangement(int index, std::string instrument);
	virtual void removeArrangement(int index);
	virtual void setXML(std::string xml);
	virtual std::string getXML(void) const;
	virtual void addScoreLine(const std::string note);
	virtual void addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8, double p9, double p10);
	virtual void addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8, double p9);
	virtual void addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8);
	virtual void addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7);
	virtual void addNote(double p1, double p2, double p3, double p4, double p5, double p6);
	virtual void addNote(double p1, double p2, double p3, double p4, double p5);
	virtual void addNote(double p1, double p2, double p3, double p4);
	virtual void addNote(double p1, double p2, double p3);
	virtual bool exportForPerformance(void);
	virtual void removeAll(void);
	virtual void removeCommand(void);
	virtual void removeOrchestra(void);
	virtual void removeScore(void);
	virtual void removeArrangement(void);
	virtual void removeMidifile(void);
	virtual void getInstrumentNames(std::vector<std::string> &names) const;
	virtual bool loadOrcLibrary(const char *filename = 0);
	//	Patch library and arrangement.
	std::string libraryFilename;
	std::vector<std::string> arrangement;
protected:
	//	What are we storing, anyway?
	std::string filename;
	//	<CsOptions>
	std::string command;
	//	<CsInstruments>
	std::string orchestra;
	//	<CsScore>
	std::string score;
	//	<CsMidi>
	std::vector<unsigned char> midifile;
};

#endif	//	CSOUND_FILE_H



