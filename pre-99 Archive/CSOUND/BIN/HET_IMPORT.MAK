# Microsoft Developer Studio Generated NMAKE File, Based on het_import.dsp
!IF "$(CFG)" == ""
CFG=het_import - Win32 Release
!MESSAGE No configuration specified. Defaulting to het_import - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "het_import - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "het_import.mak" CFG="het_import - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "het_import - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\het_impo
INTDIR=.\het_impo
# Begin Custom Macros
OutDir=.\het_impo
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\het_import.exe"

!ELSE 

ALL : "$(OUTDIR)\het_import.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\Het_impo.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\het_import.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\het_import.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD\
 /c 
CPP_OBJS=.\het_impo/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\het_import.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\het_import.pdb" /machine:I386 /out:"$(OUTDIR)\het_import.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Het_impo.obj" \
	".\Release\getstring.obj"

"$(OUTDIR)\het_import.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "het_import - Win32 Release"
SOURCE=..\csound\Het_impo.c
DEP_CPP_HET_I=\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	

"$(INTDIR)\Het_impo.obj" : $(SOURCE) $(DEP_CPP_HET_I) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

