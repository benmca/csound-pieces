# Microsoft Developer Studio Generated NMAKE File, Based on CsoundConsole.dsp
!IF "$(CFG)" == ""
CFG=CsoundConsole - Win32 Debug
!MESSAGE No configuration specified. Defaulting to CsoundConsole - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "CsoundConsole - Win32 Release" && "$(CFG)" != "CsoundConsole - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CsoundConsole.mak" CFG="CsoundConsole - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CsoundConsole - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "CsoundConsole - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CsoundConsole - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundConsole.exe"

!ELSE 

ALL : "Csound - Win32 Release" "$(OUTDIR)\CsoundConsole.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CsoundConsole.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\CsoundConsole.exe"
	-@erase "$(OUTDIR)\CsoundConsole.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_CONSOLE" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundConsole.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=Csound.lib winmm.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:console /incremental:no /pdb:"$(OUTDIR)\CsoundConsole.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CsoundConsole.exe" /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\CsoundConsole.obj" \
	"..\..\..\lib\Csound.lib"

"$(OUTDIR)\CsoundConsole.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CsoundConsole - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundConsole.exe"

!ELSE 

ALL : "Csound - Win32 Debug" "$(OUTDIR)\CsoundConsole.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CsoundConsole.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CsoundConsole.exe"
	-@erase "$(OUTDIR)\CsoundConsole.ilk"
	-@erase "$(OUTDIR)\CsoundConsole.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_CONSOLE" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundConsole.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib winmm.lib dsound.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\CsoundConsole.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CsoundConsole.exe" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\CsoundConsole.obj" \
	"..\..\..\lib\Csound.lib"

"$(OUTDIR)\CsoundConsole.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CsoundConsole.dep")
!INCLUDE "CsoundConsole.dep"
!ELSE 
!MESSAGE Warning: cannot find "CsoundConsole.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CsoundConsole - Win32 Release" || "$(CFG)" == "CsoundConsole - Win32 Debug"
SOURCE=.\CsoundConsole.cpp

"$(INTDIR)\CsoundConsole.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "CsoundConsole - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\CsoundConsole"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundConsole"

!ELSEIF  "$(CFG)" == "CsoundConsole - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\CsoundConsole"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundConsole"

!ENDIF 


!ENDIF 

