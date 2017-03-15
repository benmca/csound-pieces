#pragma warning(disable: 4786)
#include <SSound/CsoundFile.h>
#include <algorithm>
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
char staticBuffer[0x1000];

/**
* Considerably more efficient than std::getline.
*/
bool getline(std::istream& stream, std::string &buffer)
{
	stream.getline(staticBuffer, sizeof(staticBuffer));
	buffer = staticBuffer;
	return stream.good();
}

void gatherArgs(int argc, const char **argv, std::string &commandLine)
{
	for(int i = 0; i < argc; i++)
	{
		if(i == 0)
		{
			commandLine = argv[i];
		}
		else
		{
			commandLine += " ";
			commandLine += argv[i];
		}
	}
}

void scatterArgs(const std::string commandLine, int *argc, char ***argv)
{
	char *buffer = strdup(commandLine.c_str());
	char *separators = " \t\n\r";
	int argcc = 0;
	char **argvv = (char **) calloc(sizeof(char *), 100);
	char *token = strtok(buffer, separators);   
	while(token)
	{
		argvv[argcc] = strdup(token);
		argcc++;
    	token = strtok(0, separators);
	}
	*argc = argcc;
	*argv = (char **) realloc(argvv, sizeof(char *) * (argcc + 1));
	free(buffer);
}

void deleteArgs(int argc, char **argv)
{
	for(int i = 0; i < argc; i++)
	{
		free(argv[i]);
	}
	free(argv);
}

bool parseInstrument(const std::string &definition, std::string &preNumber, int &number, std::string &name, std::string &postName)
{
	preNumber.erase();
	name.erase();
	postName.erase();
	number = -1;
	int beginPreNumber = definition.find("instr");
	if(beginPreNumber == -1)
	{
		return false;
	}
	int beginNumber = definition.find_first_of("1234567890", beginPreNumber);
	if(beginNumber == -1)
	{
		return false;
	}
	preNumber = definition.substr(beginPreNumber, beginNumber);
	int endNumber = definition.find_first_not_of("1234567890", beginNumber);
	if(endNumber == -1)
	{
		return false;
	}
	std::string numberString = definition.substr(beginNumber, endNumber - beginNumber);
	trim(numberString);
	number = atoi(numberString.c_str());
	int beginName = definition.find(";", endNumber) + 1;
	if(beginName == -1)
	{
		return false;
	}
	int endName = definition.find("\n", beginName);
	if(endName == -1)
	{
		return false;
	}
	name = definition.substr(beginName, endName - beginName);
	trim(name);
	postName = definition.substr(endName);
	return true;
}

std::string &trim(std::string &value)
{
	int i = value.find_first_not_of(" \n\r\t");
	if(i != value.npos)
	{
		value.erase(0, i);
	}
	i = value.find_last_not_of(" \n\r\t");
	if(i != value.npos)
	{
		value.erase(i + 1, value.npos);
	}
	return value;
}

std::string &trimQuotes(std::string &value)
{
	int i = value.find_first_not_of("\"");
	if(i != value.npos)
	{
		value.erase(0, i);
	}
	i = value.find_last_not_of("\"");
	if(i != value.npos)
	{
		value.erase(i + 1, value.npos);
	}
	return value;
}

CsoundFile::CsoundFile()
{
	removeAll();
}

int CsoundFile::load(std::string filename)
{
	removeAll();
	int returnValue = import(filename);
	this->filename = filename.c_str();
	return returnValue;
}

int CsoundFile::load(std::istream &stream)
{
	removeAll();
	return import(stream);
}

int CsoundFile::save(std::string filename) const
{
	int returnValue = false;
	std::ofstream stream(filename.c_str(), std::ios::binary);
	if(!((filename.find(".orc") == filename.npos) && (filename.find(".ORC") == filename.npos)))
	{
		returnValue += exportOrchestra(stream);
	}
	else if(!((filename.find(".sco") == filename.npos) && (filename.find(".SCO") == filename.npos)))
	{
		returnValue += exportScore(stream);
	}
	else if(!((filename.find(".mid") == filename.npos) && (filename.find(".MID") == filename.npos)))
	{
		returnValue += exportMidifile(stream);
	}
	else
	{
		returnValue += save(stream);
	}
	stream.close();
	return returnValue;
}

int CsoundFile::save(std::ostream &stream) const
{
	int returnValue = 0;
	stream << "<CsoundSynthesizer>" << std::endl;
	stream << "<CsOptions>" << std::endl;
	returnValue += exportCommand(stream);
	stream << "</CsOptions>" << std::endl;
	stream << "<CsInstruments>" << std::endl;
	returnValue += exportOrchestra(stream);
	stream << "</CsInstruments>" << std::endl;
	stream << "<CsScore>" << std::endl;
	returnValue += exportScore(stream);
	stream << "</CsScore>" << std::endl;
	stream << "<CsArrangement>" << std::endl;
	returnValue += exportArrangement(stream);
	stream << "</CsArrangement>" << std::endl;
	if(midifile.size() > 0)
	{
		stream << "<CsMidifile>" << std::endl;
		stream << "<Size>" << std::endl;
		stream << midifile.size() << std::endl;
		stream << "</Size>" << std::endl;
		returnValue += exportMidifile(stream);
		stream << "</CsMidifile>" << std::endl;
	}
	stream << "</CsoundSynthesizer>" << std::endl;
	return returnValue;
}

int CsoundFile::import(std::string filename)
{
	struct _finddata_t findData;
	int returnValue = _findfirst(filename.c_str(), &findData);
	if(returnValue == -1)
	{
		return false;
	}
	std::ifstream stream(filename.c_str(), std::ios::binary);
	if((filename.find(".orc") != filename.npos) || (filename.find(".ORC") != filename.npos))
	{
		returnValue += importOrchestra(stream);
	}
	else if((filename.find(".sco") != filename.npos) || (filename.find(".SCO") != filename.npos))
	{
		returnValue += importScore(stream);
	}
	else if((filename.find(".mid") != filename.npos) || (filename.find(".MID") != filename.npos))
	{
		returnValue += importMidifile(stream);
	}
	else
	{
		returnValue += import(stream);
	}
	stream.close();
	return returnValue;
}

int CsoundFile::import(std::istream &stream)
{
	std::string buffer;
	while(getline(stream, buffer))
	{
		if(buffer.find("<CsoundSynthesizer>") == 0)
		{
			while(getline(stream, buffer))
			{
				if(buffer.find("</CsoundSynthesizer>") == 0)
				{
					return true;
				}
				else if(buffer.find("<CsOptions>") == 0)
				{
					importCommand(stream);
				}
				else if(buffer.find("<CsInstruments>") == 0)
				{
					importOrchestra(stream);
				}
				else if(buffer.find("<CsArrangement>") == 0)
				{
					importArrangement(stream);
				}
				else if(buffer.find("<CsScore>") == 0)
				{
					importScore(stream);
				}
				else if(buffer.find("<CsMidifile>") == 0)
				{
					importMidifile(stream);
				}
			}
		}
	}
	return false;
}

int CsoundFile::importCommand(std::istream &stream)
{
	std::string buffer;
	while(getline(stream, buffer))
	{
		if(buffer.find("</CsOptions") != buffer.npos)
		{
			return true;
		}
		command.append(buffer);
	}
	return false;
}

int CsoundFile::exportCommand(std::ostream &stream) const
{
	stream << command.c_str() << std::endl;
	return stream.good();
}

int CsoundFile::importOrchestra(std::istream &stream)
{
	orchestra.erase();
	std::string buffer;
	while(getline(stream, buffer))
	{
		if(buffer.find("</CsInstruments>") == 0)
		{
			return true;
		}
		else
		{
			orchestra.append(buffer);
			orchestra.append("\n");
		}
	}
	return false;
}

int CsoundFile::exportOrchestra(std::ostream &stream) const
{
	stream << orchestra;
	stream.flush();
	return stream.good();
}

int CsoundFile::importScore(std::istream &stream)
{
	score.erase();
	std::string buffer;
	while(getline(stream, buffer))
	{
		if(buffer.find("</CsScore>") == 0)
		{
			return true;
		}
		else
		{
			score.append(buffer);
			score.append("\n");
		}
	}
	return false;
}

int CsoundFile::exportScore(std::ostream &stream) const
{
	stream << score << std::endl;
	return stream.good();
}

std::string CsoundFile::getFilename()
{
	return filename.c_str();
}

void CsoundFile::setFilename(std::string name)
{
	filename = name;
}

std::string CsoundFile::getCommand()
{
	return command;
}

void CsoundFile::setCommand(std::string value)
{
	command = value;
}

void CsoundFile::removeCommand(void)
{
	command.erase(command.begin(), command.end());
}

std::string CsoundFile::getOrcFilename() const
{
	int argc;
	char **argv;
	std::string buffer;
	scatterArgs(command, &argc, &argv);
	if(argc >= 3)
	{
		buffer = argv[argc - 2];
	}
	deleteArgs(argc, argv);
	return buffer.c_str();
}

std::string CsoundFile::getScoFilename() const
{
	int argc;
	char **argv;
	std::string buffer;
	scatterArgs(command, &argc, &argv);
	if(argc >= 3)
	{
		buffer = argv[argc - 1];
	}
	deleteArgs(argc, argv);
	return buffer;
}

std::string CsoundFile::getMidiFilename() const
{
	int argc;
	char **argv;
	std::string buffer;
	scatterArgs(command, &argc, &argv);
	for(int i = 1, n = argc - 2; i < n; i++)
	{
		std::string buffer = argv[i];
		if(buffer.find("F") != buffer.npos)
		{
			if(buffer.find("F") == buffer.length() - 1)
			{
				buffer = argv[i + 1];
				deleteArgs(argc, argv);
				return buffer.c_str();
			}
			else
			{
				buffer = buffer.substr(buffer.find("F") + 1);
				deleteArgs(argc, argv);
				return buffer.c_str();
			}
		}
	}
	deleteArgs(argc, argv);
	return buffer.c_str();
}

std::string CsoundFile::getOutputSoundfileName() const
{
	int argc;
	char **argv;
	std::string buffer;
	scatterArgs(command, &argc, &argv);
	for(int i = 1, n = argc - 2; i < n; i++)
	{
		std::string buffer = argv[i];
		if(buffer.find("o") != buffer.npos)
		{
			if(buffer.find("o") == buffer.length() - 1)
			{
				buffer = argv[i + 1];
				deleteArgs(argc, argv);
				return buffer.c_str();
			}
			else
			{
				buffer = buffer.substr(buffer.find("o") + 1);
				deleteArgs(argc, argv);
				return buffer.c_str();
			}
		}
	}
	deleteArgs(argc, argv);
	return buffer.c_str();
}

std::string CsoundFile::getOrchestra() const
{
	return orchestra;
}

void CsoundFile::setOrchestra(std::string value)
{
	orchestra = value;
}

void CsoundFile::removeOrchestra()
{
	orchestra.erase();
}

void CsoundFile::removeScore()
{
	score.erase();
}

std::string CsoundFile::getScore() const
{
	return score;
}

void CsoundFile::setScore(std::string score)
{
	this->score = score;
}

void CsoundFile::addScoreLine(std::string scoreLine)
{
	score.append(scoreLine);
	score.append("\n");
}

void CsoundFile::removeAll()
{
	filename.erase();
	command.erase();
	orchestra.erase();
	score.erase();
	arrangement.erase(arrangement.begin(), arrangement.end());
	removeMidifile();
}

int CsoundFile::importMidifile(std::istream &stream)
{
	//	Importing from a standard MIDI file
	//	(Chunk ID == MThd or RIFF).
	if(stream.peek() == 'M' || stream.peek() == 'R')
	{
		midifile.resize(0);
		char buffer;
		while(!(stream.get(buffer).eof()))
		{
			midifile.push_back(buffer);
		}
		return true;
	}
	//	Importing from a "csd" file.
	else
	{
		std::string buffer;
		while(getline(stream, buffer))
		{
			if(buffer.find("</CsMidifile>") == 0)
			{
				return true;
			}
			else if(buffer.find("<Size>") == 0)
			{
				getline(stream, buffer);
				int size = atoi(buffer.c_str());
				getline(stream, buffer);
				if(size > 0)
				{
					midifile.resize(0);
					char charbuffer = 0;
					for(int i = 0; i < size; i++)
					{
						stream.get(charbuffer);
						midifile.push_back(charbuffer);
					}
				}
			}
		}
	}
	return false;
}

int CsoundFile::exportMidifile(std::ostream &stream) const
{
	for(int i = 0, n = midifile.size(); i < n; i++)
	{
		stream.put(midifile[i]);
	}
	return stream.good();
}

void CsoundFile::removeMidifile()
{
	midifile.resize(0);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8, double p9, double p10)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p5, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p6, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p7, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p8, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p9, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p10, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8, double p9)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p5, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p6, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p7, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p8, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p9, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p5, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p6, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p7, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p8, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4, double p5, double p6, double p7)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p5, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p6, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p7, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4, double p5, double p6)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p5, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p6, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4, double p5)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p5, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3, double p4)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p4, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

void CsoundFile::addNote(double p1, double p2, double p3)
{
	std::string note = "i ";
	_gcvt(p1, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p2, 10, staticBuffer);
	note += staticBuffer;
	note += " ";
	_gcvt(p3, 10, staticBuffer);
	note += staticBuffer;
	addScoreLine(note);
}

int CsoundFile::getInstrumentCount() const
{
	std::string definition;
	for(int i = 0; getInstrument(i, definition); i++)
	{
	}
	return i;
}

bool isToken(std::string text, int position, std::string token)
{
	for(int i = position - 1; i >= 0; --i)
	{
		if(text[i] == ';')
		{
			return false;
		}
		else if(text[i] == '\n')
		{
			return true;
		}
	}
	return true;
}

int findToken(std::string text, std::string token, int position)
{
	int foundPosition = 0;
	while((foundPosition = text.find(token, position)) != -1)
	{
		if(isToken(text, foundPosition, token))
		{
			return foundPosition;
		}
		position = foundPosition + 1;
	}
	return foundPosition;
}

bool CsoundFile::getInstrument(int index_, std::string &definition_) const
{
	int beginDefinition = 0;
	int endDefinition = 0;
	for(int index = 0; true; index++)
	{
		beginDefinition = findToken(orchestra, "instr", beginDefinition);
		if(beginDefinition == -1)
		{
			return false;
		}
		endDefinition = findToken(orchestra, "endin", beginDefinition);
		if(endDefinition == -1)
		{
			return false;
		}
		endDefinition += 6;
		std::string definition = orchestra.substr(beginDefinition, endDefinition - beginDefinition);
		std::string pre;
		int number;
		std::string name;
		std::string post;
		if(parseInstrument(definition, pre, number, name, post))
		{
			if(index_ == index)
			{
				definition_ = definition;
				return true;
			}
		}
		beginDefinition++;
	}
	return false;
}

bool CsoundFile::getInstrumentNumber(int number_, std::string &definition_) const
{
	int beginDefinition = 0;
	int endDefinition = 0;
	for(int index = 0; true; index++)
	{
		beginDefinition = findToken(orchestra, "instr", beginDefinition);
		if(beginDefinition == -1)
		{
			return false;
		}
		endDefinition = findToken(orchestra, "endin", beginDefinition);
		if(endDefinition == -1)
		{
			return false;
		}
		endDefinition += 6;
		std::string definition = orchestra.substr(beginDefinition, endDefinition - beginDefinition);
		std::string pre;
		int number;
		std::string name;
		std::string post;
		if(parseInstrument(definition, pre, number, name, post))
		{
			if(number_ == number)
			{
				definition_ = definition;
				return true;
			}
			index++;
		}
		beginDefinition++;
	}
	return false;
}

bool CsoundFile::getInstrument(std::string name_, std::string &definition_) const
{
	trim(name_);
	int beginDefinition = 0;
	int endDefinition = 0;
	for(;;)
	{
		beginDefinition = findToken(orchestra, "instr ", beginDefinition);
		if(beginDefinition == -1)
		{
			return false;
		}
		endDefinition = findToken(orchestra, "endin", beginDefinition);
		if(endDefinition == -1)
		{
			return false;
		}
		endDefinition += 6;
		std::string definition = orchestra.substr(beginDefinition, endDefinition - beginDefinition);
		std::string pre;
		int number;
		std::string name;
		std::string post;
		if(parseInstrument(definition, pre, number, name, post))
		{
			if(name_.compare(name) == 0)
			{
				definition_ = definition;
				return true;
			}
		}
		beginDefinition++;
	}
	return false;
}

bool CsoundFile::exportForPerformance(void)
{
	std::string orcFilename = getOrcFilename();
	if(orcFilename.length() > 0)
	{
		exportArrangementForPerformance(orcFilename);
	}
	std::string scoFilename = getScoFilename();
	if(scoFilename.length() > 0)
	{
		save(scoFilename);
	}
	std::string midiFilename = getMidiFilename();
	if(midiFilename.length() > 0 && midifile.size() > 0)
	{
		save(midiFilename);
	}
	return true;
}

void CsoundFile::setXML(const std::string xml)
{
	std::istringstream stringStream(xml);
	load(stringStream);
}

std::string CsoundFile::getXML(void) const
{
	std::ostringstream stringStream;
	save(stringStream);
	return stringStream.str();

}

int CsoundFile::getArrangementCount(void) const
{
	return arrangement.size();
}

void CsoundFile::removeArrangement(void)
{
	arrangement.erase(arrangement.begin(), arrangement.end());
}

void CsoundFile::addArrangement(std::string instrumentName)
{
	arrangement.push_back(instrumentName);
}

std::string CsoundFile::getArrangement(int index) const
{
	return arrangement[index];
}

int CsoundFile::importArrangement(std::istream &stream)
{
	removeArrangement();
	std::string buffer;
	while(getline(stream, buffer))
	{
		if(buffer.find("</CsArrangement>") == 0)
		{
			return true;
		}
		else
		{
			trim(buffer);
			arrangement.push_back(buffer);
		}
	}
}

int CsoundFile::exportArrangement(std::ostream &stream) const
{
	for(int i = 0, n = arrangement.size(); i < n; ++i)
	{
		stream << arrangement[i].c_str() << std::endl;
	}
	return stream.good();	
}

std::string CsoundFile::getOrchestraHeader(void) const
{
	int instrIndex = findToken(orchestra, "instr", 0);
	if(instrIndex == orchestra.npos)
	{
		return "";
	}
	return orchestra.substr(0, instrIndex);
}

int CsoundFile::exportArrangementForPerformance(std::string filename) const
{
	std::ofstream stream(filename.c_str(), std::ios::binary);
	exportArrangementForPerformance(stream);
	stream.close();
	return stream.good();
}

int CsoundFile::exportArrangementForPerformance(std::ostream &stream) const
{
	if(arrangement.size() > 0)
	{
		stream << "; ARRANGEMENT " << getOrcFilename().c_str() << std::endl;
		stream << getOrchestraHeader() << std::endl;
		for(int i = 0, n = arrangement.size(); i < n; ++i)
		{
			std::string instrumentName = arrangement[i];
			std::string definition;
			if(getInstrument(instrumentName, definition))
			{
				std::string preNumber;
				int number;
				std::string postNumber;
				if(parseInstrument(definition, preNumber, number, instrumentName, postNumber))
				{
					stream << std::endl << "instr " << (i + 1) << " ; " << instrumentName << std::endl << postNumber << std::endl;
					stream.flush();
				}
			}
		}
	}
	else
	{
		exportOrchestra(stream);
	}
	return stream.good();
}

void CsoundFile::getInstrumentNames(std::vector<std::string> &names) const
{
	names.erase(names.begin(), names.end());
	std::string definition;
	for(int i = 0; getInstrument(i, definition); i++)
	{
		std::string preNumber;
		int number;
		std::string name;
		std::string postName;
		if(parseInstrument(definition, preNumber, number, name, postName))
		{
			names.push_back(name);
		}
	}
	std::sort(names.begin(), names.end());
}

void CsoundFile::insertArrangement(int index, std::string instrument)
{
	arrangement.insert(arrangement.begin() + index, instrument);
}

void CsoundFile::removeArrangement(int index)
{
	arrangement.erase(arrangement.begin() + index);
}

void CsoundFile::setArrangement(int index, std::string instrument)
{
	arrangement[index] = instrument;
}

bool CsoundFile::loadOrcLibrary(const char *filename)
{
	std::fstream stream;
	if(strlen(filename) > 0)
	{
		stream.open(filename, std::fstream::in | std::fstream::binary);
	}
	else
	{
		std::string orcLibraryFilename = getenv("CSOUND_HOME");
		orcLibraryFilename.append("/");
		orcLibraryFilename.append("library.orc");
		stream.open(orcLibraryFilename.c_str(), std::fstream::in | std::fstream::binary);
	}
	if(stream.good())
	{
		removeOrchestra();
		importOrchestra(stream);
		return true;
	}
	return false;
};