# Microsoft Developer Studio Generated NMAKE File, Based on CsoundMathLink.dsp
!IF "$(CFG)" == ""
CFG=CsoundMathLink - Win32 Debug
!MESSAGE No configuration specified. Defaulting to CsoundMathLink - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "CsoundMathLink - Win32 Release" && "$(CFG)" != "CsoundMathLink - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CsoundMathLink.mak" CFG="CsoundMathLink - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CsoundMathLink - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "CsoundMathLink - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundMathLink.exe"

!ELSE 

ALL : "csoundStk - Win32 Release" "csoundFreeverb - Win32 Release" "SSoundConsole - Win32 Release" "CsoundWindows - Win32 Release" "CsoundConsole - Win32 Release" "SSound - Win32 Release" "CsoundVST - Win32 Release" "Csound - Win32 Release" "$(OUTDIR)\CsoundMathLink.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" "CsoundVST - Win32 ReleaseCLEAN" "SSound - Win32 ReleaseCLEAN" "CsoundConsole - Win32 ReleaseCLEAN" "CsoundWindows - Win32 ReleaseCLEAN" "SSoundConsole - Win32 ReleaseCLEAN" "csoundFreeverb - Win32 ReleaseCLEAN" "csoundStk - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CsoundMathLink.obj"
	-@erase "$(INTDIR)\CsoundMathLink.res"
	-@erase "$(INTDIR)\CsoundMathLinkImplementation.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\CsoundMathLink.exe"
	-@erase "$(OUTDIR)\CsoundMathLink.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_WINDOWS" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CsoundMathLink.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundMathLink.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ml32i2m.lib csoundvst.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\CsoundMathLink.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CsoundMathLink.exe" /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\CsoundMathLink.obj" \
	"$(INTDIR)\CsoundMathLinkImplementation.obj" \
	"$(INTDIR)\CsoundMathLink.res" \
	"..\..\..\lib\Csound.lib" \
	"$(OUTDIR)\CsoundVST.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\csoundFreeverb.lib" \
	"$(OUTDIR)\csoundStk.lib"

"$(OUTDIR)\CsoundMathLink.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundMathLink.exe"

!ELSE 

ALL : "csoundStk - Win32 Debug" "csoundFreeverb - Win32 Debug" "SSoundConsole - Win32 Debug" "CsoundWindows - Win32 Debug" "CsoundConsole - Win32 Debug" "SSound - Win32 Debug" "CsoundVST - Win32 Debug" "Csound - Win32 Debug" "$(OUTDIR)\CsoundMathLink.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" "CsoundVST - Win32 DebugCLEAN" "SSound - Win32 DebugCLEAN" "CsoundConsole - Win32 DebugCLEAN" "CsoundWindows - Win32 DebugCLEAN" "SSoundConsole - Win32 DebugCLEAN" "csoundFreeverb - Win32 DebugCLEAN" "csoundStk - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CsoundMathLink.obj"
	-@erase "$(INTDIR)\CsoundMathLink.res"
	-@erase "$(INTDIR)\CsoundMathLinkImplementation.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CsoundMathLink.exe"
	-@erase "$(OUTDIR)\CsoundMathLink.ilk"
	-@erase "$(OUTDIR)\CsoundMathLink.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_WINDOWS" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CsoundMathLink.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundMathLink.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ml32i2m.lib csoundvst.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\CsoundMathLink.pdb" /debug /machine:I386 /force /out:"$(OUTDIR)\CsoundMathLink.exe" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\CsoundMathLink.obj" \
	"$(INTDIR)\CsoundMathLinkImplementation.obj" \
	"$(INTDIR)\CsoundMathLink.res" \
	"..\..\..\lib\Csound.lib" \
	"$(OUTDIR)\CsoundVST.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\csoundFreeverb.lib" \
	"$(OUTDIR)\csoundStk.lib"

"$(OUTDIR)\CsoundMathLink.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CsoundMathLink.dep")
!INCLUDE "CsoundMathLink.dep"
!ELSE 
!MESSAGE Warning: cannot find "CsoundMathLink.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CsoundMathLink - Win32 Release" || "$(CFG)" == "CsoundMathLink - Win32 Debug"
SOURCE=.\CsoundMathLink.c

"$(INTDIR)\CsoundMathLink.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CsoundMathLink.rc

"$(INTDIR)\CsoundMathLink.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\CsoundMathLinkImplementation.cpp

"$(INTDIR)\CsoundMathLinkImplementation.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\CsoundMathLink"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\CsoundMathLink"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"CsoundVST - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Release" 
   cd "..\CsoundMathLink"

"CsoundVST - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"CsoundVST - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Debug" 
   cd "..\CsoundMathLink"

"CsoundVST - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"SSound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" 
   cd "..\CsoundMathLink"

"SSound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"SSound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" 
   cd "..\CsoundMathLink"

"SSound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"CsoundConsole - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Release" 
   cd "..\CsoundMathLink"

"CsoundConsole - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"CsoundConsole - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Debug" 
   cd "..\CsoundMathLink"

"CsoundConsole - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"CsoundWindows - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundWindows"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundWindows.mak CFG="CsoundWindows - Win32 Release" 
   cd "..\CsoundMathLink"

"CsoundWindows - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundWindows"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundWindows.mak CFG="CsoundWindows - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"CsoundWindows - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundWindows"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundWindows.mak CFG="CsoundWindows - Win32 Debug" 
   cd "..\CsoundMathLink"

"CsoundWindows - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundWindows"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundWindows.mak CFG="CsoundWindows - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"SSoundConsole - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Release" 
   cd "..\CsoundMathLink"

"SSoundConsole - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"SSoundConsole - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Debug" 
   cd "..\CsoundMathLink"

"SSoundConsole - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"csoundFreeverb - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Release" 
   cd "..\CsoundMathLink"

"csoundFreeverb - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"csoundFreeverb - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Debug" 
   cd "..\CsoundMathLink"

"csoundFreeverb - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 

!IF  "$(CFG)" == "CsoundMathLink - Win32 Release"

"csoundStk - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Release" 
   cd "..\CsoundMathLink"

"csoundStk - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ELSEIF  "$(CFG)" == "CsoundMathLink - Win32 Debug"

"csoundStk - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Debug" 
   cd "..\CsoundMathLink"

"csoundStk - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundMathLink"

!ENDIF 


!ENDIF 

