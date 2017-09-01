# Microsoft Developer Studio Generated NMAKE File, Based on lpc_export.dsp
!IF "$(CFG)" == ""
CFG=lpc_export - Win32 Release
!MESSAGE No configuration specified. Defaulting to lpc_export - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "lpc_export - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "lpc_export.mak" CFG="lpc_export - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "lpc_export - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\lpc_expo
INTDIR=.\lpc_expo
# Begin Custom Macros
OutDir=.\lpc_expo
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\lpc_export.exe"

!ELSE 

ALL : "$(OUTDIR)\lpc_export.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\Lpc_expo.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\lpc_export.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\lpc_export.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD\
 /c 
CPP_OBJS=.\lpc_expo/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\lpc_export.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\lpc_export.pdb" /machine:I386 /out:"$(OUTDIR)\lpc_export.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Lpc_expo.obj" \
	".\Release\getstring.obj"

"$(OUTDIR)\lpc_export.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "lpc_export - Win32 Release"
SOURCE=..\csound\Lpc_expo.c
DEP_CPP_LPC_E=\
	"..\csound\lpc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	

"$(INTDIR)\Lpc_expo.obj" : $(SOURCE) $(DEP_CPP_LPC_E) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

