# Microsoft Developer Studio Generated NMAKE File, Based on dnoise.dsp
!IF "$(CFG)" == ""
CFG=DNOISE - WIN32 RELEASE
!MESSAGE No configuration specified. Defaulting to DNOISE - WIN32 RELEASE.
!ENDIF 

!IF "$(CFG)" != "dnoise - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dnoise.mak" CFG="DNOISE - WIN32 RELEASE"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dnoise - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\dnoise__
INTDIR=.\dnoise__
# Begin Custom Macros
OutDir=.\dnoise__
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dnoise.exe"

!ELSE 

ALL : "$(OUTDIR)\dnoise.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dnoise.obj"
	-@erase "$(INTDIR)\fft.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dnoise.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "e:\csound" /D "WIN32" /D "NDEBUG" /D\
 "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\dnoise.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\dnoise__/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dnoise.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\dnoise.pdb" /machine:I386 /out:"$(OUTDIR)\dnoise.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dnoise.obj" \
	"$(INTDIR)\fft.obj" \
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

"$(OUTDIR)\dnoise.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "dnoise - Win32 Release"
SOURCE=..\csound\Util2\dnoise.dir\dnoise.c
DEP_CPP_DNOIS=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ustub.h"\
	"..\csound\version.h"\
	
CPP_SWITCHES=/nologo /ML /W3 /GX /O2 /I "e:\csound" /I "..\..\csound" /D\
 "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\dnoise.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\dnoise.obj" : $(SOURCE) $(DEP_CPP_DNOIS) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


SOURCE=..\csound\Util2\dnoise.dir\fft.c
DEP_CPP_FFT_C=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	
CPP_SWITCHES=/nologo /ML /W3 /GX /O2 /I "e:\csound" /I "..\..\csound" /D\
 "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\dnoise.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\fft.obj" : $(SOURCE) $(DEP_CPP_FFT_C) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<



!ENDIF 

