# Microsoft Developer Studio Generated NMAKE File, Based on extractor.dsp
!IF "$(CFG)" == ""
CFG=EXTRACTOR - WIN32 RELEASE
!MESSAGE No configuration specified. Defaulting to EXTRACTOR - WIN32 RELEASE.
!ENDIF 

!IF "$(CFG)" != "extractor - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "extractor.mak" CFG="EXTRACTOR - WIN32 RELEASE"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "extractor - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\extracto
INTDIR=.\extracto
# Begin Custom Macros
OutDir=.\extracto
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\extractor.exe"

!ELSE 

ALL : "$(OUTDIR)\extractor.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\xtrct.obj"
	-@erase "$(OUTDIR)\extractor.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\extractor.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD\
 /c 
CPP_OBJS=.\extracto/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\extractor.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\extractor.pdb" /machine:I386 /out:"$(OUTDIR)\extractor.exe" 
LINK32_OBJS= \
	"$(INTDIR)\xtrct.obj" \
	".\Release\aifc.obj" \
	".\Release\Aiff.obj" \
	".\Release\Filopen.obj" \
	".\Release\getstring.obj" \
	".\Release\Ieee80.obj" \
	".\Release\Memalloc.obj" \
	".\Release\Sfheader.obj" \
	".\Release\Soundin.obj" \
	".\Release\Ulaw.obj" \
	".\Release\Wave.obj"

"$(OUTDIR)\extractor.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "extractor - Win32 Release"
SOURCE=..\csound\Util2\Mixer\xtrct.c
DEP_CPP_XTRCT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ustub.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\xtrct.obj" : $(SOURCE) $(DEP_CPP_XTRCT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

