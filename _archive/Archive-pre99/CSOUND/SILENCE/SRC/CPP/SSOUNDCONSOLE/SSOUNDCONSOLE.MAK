# Microsoft Developer Studio Generated NMAKE File, Based on SSoundConsole.dsp
!IF "$(CFG)" == ""
CFG=SSoundConsole - Win32 Debug
!MESSAGE No configuration specified. Defaulting to SSoundConsole - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "SSoundConsole - Win32 Release" && "$(CFG)" != "SSoundConsole - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "SSoundConsole.mak" CFG="SSoundConsole - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "SSoundConsole - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "SSoundConsole - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "SSoundConsole - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\SSound.exe"

!ELSE 

ALL : "CsoundVST - Win32 Release" "SSound - Win32 Release" "Csound - Win32 Release" "$(OUTDIR)\SSound.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" "SSound - Win32 ReleaseCLEAN" "CsoundVST - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\SSoundConsole.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\SSound.exe"
	-@erase "$(OUTDIR)\SSound.pdb"

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\SSoundConsole.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib dsound.lib winmm.lib csoundvst.lib /subsystem:console /incremental:no /pdb:"$(OUTDIR)\SSound.pdb" /debug /machine:I386 /out:"$(OUTDIR)\SSound.exe" /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\SSoundConsole.obj" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\CsoundVST.lib"

"$(OUTDIR)\SSound.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "SSoundConsole - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\SSound.exe"

!ELSE 

ALL : "CsoundVST - Win32 Debug" "SSound - Win32 Debug" "Csound - Win32 Debug" "$(OUTDIR)\SSound.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" "SSound - Win32 DebugCLEAN" "CsoundVST - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\SSoundConsole.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\SSound.exe"
	-@erase "$(OUTDIR)\SSound.pdb"

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\SSoundConsole.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib dsound.lib winmm.lib csoundvst.lib /subsystem:console /incremental:no /pdb:"$(OUTDIR)\SSound.pdb" /debug /machine:I386 /force /out:"$(OUTDIR)\SSound.exe" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\SSoundConsole.obj" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\CsoundVST.lib"

"$(OUTDIR)\SSound.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("SSoundConsole.dep")
!INCLUDE "SSoundConsole.dep"
!ELSE 
!MESSAGE Warning: cannot find "SSoundConsole.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "SSoundConsole - Win32 Release" || "$(CFG)" == "SSoundConsole - Win32 Debug"
SOURCE=.\SSoundConsole.cpp

"$(INTDIR)\SSoundConsole.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "SSoundConsole - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\SSoundConsole"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\SSoundConsole"

!ELSEIF  "$(CFG)" == "SSoundConsole - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\SSoundConsole"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\SSoundConsole"

!ENDIF 

!IF  "$(CFG)" == "SSoundConsole - Win32 Release"

"SSound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" 
   cd "..\SSoundConsole"

"SSound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\SSoundConsole"

!ELSEIF  "$(CFG)" == "SSoundConsole - Win32 Debug"

"SSound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" 
   cd "..\SSoundConsole"

"SSound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\SSoundConsole"

!ENDIF 

!IF  "$(CFG)" == "SSoundConsole - Win32 Release"

"CsoundVST - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Release" 
   cd "..\SSoundConsole"

"CsoundVST - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Release" RECURSE=1 CLEAN 
   cd "..\SSoundConsole"

!ELSEIF  "$(CFG)" == "SSoundConsole - Win32 Debug"

"CsoundVST - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Debug" 
   cd "..\SSoundConsole"

"CsoundVST - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\SSoundConsole"

!ENDIF 


!ENDIF 

