/*	
*	Plug-in opcodes for Csound.
*	By Michael Gogins.
*	24 February 1997.
*/
#include <io.h>
#include <direct.h>
#include <windows.h>
#include "cs.h"
#include "OpcLoad.h"
/*
*	References that may be used in opcode libraries.
*/
extern MYFLT esr;
extern MYFLT ekr;
extern int ksmps;
extern int nchnls;
extern FUNC *flist[];
extern OENTRY opcodlstBuiltin[];
extern OENTRY *opcodlst;
extern OENTRY *oplstend;
extern long opcodeCount;

int csYield()
{
#ifdef WIN32
	MSG Message;
    while(PeekMessage(&Message, NULL, 0, 0, PM_REMOVE))
    {                             
		if(Message.message == WM_QUIT)
		{
			return FALSE;
		}
		TranslateMessage(&Message);
		DispatchMessage(&Message); 
	}
#endif
	return 0;
}

int opcodeCompare(const void *v1, const void *v2)
{
	return strcmp(((OENTRY*)v1)->opname, ((OENTRY*)v2)->opname);
}

long csLibraryLoad(const char *libraryPath)
{
	long library = 0;
#ifdef WIN32
	library = (long) LoadLibrary(libraryPath);
#endif
	return library;
}

long csLibraryProcedureAddressGet(long library, 
								  const char *procedureName)
{
	void *procedureAddress = NULL;
#ifdef WIN32
	procedureAddress = GetProcAddress((HINSTANCE)library, 
									  procedureName);
#endif
	return (long) procedureAddress;
}

long csOpcodeLoad(const char* libraryPath)
{
	long returnValue = 0;
	long opcodeSubscript;
	struct oentry entry;
	struct oentry *pEntry = 0;
	MYFLT functionSubscript = (MYFLT) 1;
	csOpcodeRegisterType *pCsOpcodeRegister = NULL;
	/*	
	*	Load the opcode's shared library.
	*/	
	long library = csLibraryLoad(libraryPath);
	if(library == 0)	
	{
		return CS_OPCODE_NOT_FOUND;
	}
	memset(&entry, 
		0, 
		sizeof(entry));
	/*
	*	Get the address of the opcode's registration function.
	*/
	pCsOpcodeRegister = (csOpcodeRegisterType *)csLibraryProcedureAddressGet(library, 
		"csOpcodeRegister");
	if(pCsOpcodeRegister == NULL)
	{
		return CS_OPCODE_REGISTER_FAILED;
	}
	/*	
	*	Iterate through and register all the opcodes in the library.
	*/
	for (opcodeSubscript = 0L; 
	returnValue = (*pCsOpcodeRegister)(opcodeSubscript,
		 &esr,
		 &ekr,
		 &ksmps,
		 &nchnls,
		 flist,		
		 &entry); 
	++opcodeSubscript)
	{
		/*
		*	Increase the size of the opcode dispatch table.
		*/
		pEntry = mrealloc(opcodlst, sizeof(opcodlst[0]) * (opcodeCount + 1));
		if(pEntry == NULL)
		{
			return CS_OUT_OF_MEMORY;
		}
		opcodlst = pEntry;
		opcodeCount++;
		oplstend = opcodlst + opcodeCount;
		/*
		*	Copy the opcode entry buffer to the new entry in the dispatch table.
		*/
		memcpy(&opcodlst[opcodeCount - 1], 
			&entry, 
			sizeof(entry));
	}
	return returnValue;
}

long csOpcodeLoadAll()
{
	long returnValue = 0;
	char opcodeDirectory[MAX_PATH + 1];
	char opcodePath[MAX_PATH + 1];
	char drive[_MAX_DRIVE];
	char dir[_MAX_DIR];
	char *opcodeEnvironmentDirectory = NULL;
	struct _finddata_t findData;
	long search = 0;
	extern long OldOpcodeCount;
	int opcodlstSize;

	/*
	*	Copy the builtin opcode dispatch table to 
	*	the dynamic opcode dispatch table
	*	that will actually be used.
	*/
	opcodeCount=OldOpcodeCount;
	
	opcodlstSize = opcodeCount * sizeof(opcodlst[0]);

	opcodlst = (OENTRY*) mmalloc(opcodlstSize);
	if(opcodlst == NULL)
	{
		return CS_OUT_OF_MEMORY;
	}
	memcpy(&opcodlst[0], 
		   &opcodlstBuiltin[0], 
		   opcodlstSize);
	oplstend = opcodlst + opcodeCount;/* opcodlstSize GAB; */
	/*
	*	Locate the opcode directory from the environment variable,
	*	if it exists.
	*	A breakpoint can be set here in debugging to test this.
	*/
	returnValue = 0;
	if(returnValue)
	{
		returnValue = putenv("OPCODEDIR=C:\\Gogins\\Develop\\Silence\\Install");
	}
	opcodeEnvironmentDirectory = getenv("OPCODEDIR");
	if(opcodeEnvironmentDirectory != NULL)
	{
		strncpy(opcodeDirectory, 
				opcodeEnvironmentDirectory, 
				MAX_PATH);
		sprintf(opcodePath, 
				"%s\\%s\0", 
				opcodeDirectory, 
				"*.OPC");
	}
	/*
	*	Otherwise, use the current working directory,
	*	hopefully the Csound directory.
	*/
	else
	{
#ifdef WIN32
		GetModuleFileName(0, 
			opcodeDirectory, 
			_MAX_PATH);
		_splitpath(opcodeDirectory, 
			drive, 
			dir, 
			0, 
			0);
		sprintf(opcodeDirectory, 
				"%s%s\0", 
				drive,
				dir);
		sprintf(opcodePath, 
				"%s%s%s\0", 
				drive,
				dir, 
				"*.OPC");
#else
		getcwd(opcodeDirectory,
			_MAX_PATH);
		sprintf(opcodePath, 
				"%s/%s\0", 
				opcodeDirectory,
				"*.OPC");
#endif
	}
	search = _findfirst(opcodePath, &findData);
	if(search == -1)
	{
		_findclose(search);
		return CS_OPCODE_NOT_FOUND;
	}
	else
	{
		sprintf(opcodePath, 
				"%s\\%s\0", 
				opcodeDirectory, 
				findData.name);
		returnValue = csOpcodeLoad(opcodePath);
	}
	sprintf(opcodePath, 
			"%s\\%s\0", 
			opcodeDirectory, 
			findData.name);
	/*
	*	Register all OPC libraries in the opcode directory.
	*/
	while(_findnext(search, 
				    &findData) == 0)
	{
		sprintf(opcodePath, 
				"%s\\%s\0", 
				opcodeDirectory, 
				findData.name);
		returnValue = csOpcodeLoad(opcodePath);
	}
	_findclose(search);
	return returnValue;
}

void opcodesList()
{
	int i;
	int opcodesSize = opcodeCount * sizeof(OENTRY);
	OENTRY *templist = (OENTRY*)malloc(opcodesSize);
	memcpy(templist, opcodlst, opcodesSize);
	qsort(templist, 
		opcodeCount, 
		sizeof(OENTRY), 
		opcodeCompare);
	printf("NUMBER OPCODE           THREAD INTYPES                        OUTTYPES\n");
	for(i = 1; i < opcodeCount; i++)
	{
		printf("%6d %-20s %2d %-30s %s\n",
			i,
			templist[i].opname,
			templist[i].thread,
			templist[i].intypes,
			templist[i].outypes);
	}
	free(templist);
}
