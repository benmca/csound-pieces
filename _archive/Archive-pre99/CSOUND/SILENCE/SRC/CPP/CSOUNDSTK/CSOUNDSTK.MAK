# Microsoft Developer Studio Generated NMAKE File, Based on csoundStk.dsp
!IF "$(CFG)" == ""
CFG=csoundStk - Win32 Debug
!MESSAGE No configuration specified. Defaulting to csoundStk - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "csoundStk - Win32 Release" && "$(CFG)" != "csoundStk - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "csoundStk.mak" CFG="csoundStk - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "csoundStk - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "csoundStk - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "csoundStk - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\csoundStk.OPC"

!ELSE 

ALL : "SSound - Win32 Release" "Csound - Win32 Release" "$(OUTDIR)\csoundStk.OPC"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" "SSound - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\ADSR.obj"
	-@erase "$(INTDIR)\AifWvIn.obj"
	-@erase "$(INTDIR)\AifWvOut.obj"
	-@erase "$(INTDIR)\BeeThree.obj"
	-@erase "$(INTDIR)\BiQuad.obj"
	-@erase "$(INTDIR)\BlowHole.obj"
	-@erase "$(INTDIR)\Bowed.obj"
	-@erase "$(INTDIR)\BowedBar.obj"
	-@erase "$(INTDIR)\BowTabl.obj"
	-@erase "$(INTDIR)\Brass.obj"
	-@erase "$(INTDIR)\ByteSwap.obj"
	-@erase "$(INTDIR)\Clarinet.obj"
	-@erase "$(INTDIR)\Controller.obj"
	-@erase "$(INTDIR)\csoundStk.obj"
	-@erase "$(INTDIR)\DCBlock.obj"
	-@erase "$(INTDIR)\DLineA.obj"
	-@erase "$(INTDIR)\DLineL.obj"
	-@erase "$(INTDIR)\DLineN.obj"
	-@erase "$(INTDIR)\DrumSynt.obj"
	-@erase "$(INTDIR)\Envelope.obj"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\FIR.obj"
	-@erase "$(INTDIR)\Flute.obj"
	-@erase "$(INTDIR)\FM4Alg3.obj"
	-@erase "$(INTDIR)\FM4Alg4.obj"
	-@erase "$(INTDIR)\FM4Alg5.obj"
	-@erase "$(INTDIR)\FM4Alg6.obj"
	-@erase "$(INTDIR)\FM4Alg8.obj"
	-@erase "$(INTDIR)\FM4Op.obj"
	-@erase "$(INTDIR)\FMVoices.obj"
	-@erase "$(INTDIR)\FormSwep.obj"
	-@erase "$(INTDIR)\HeavyMtl.obj"
	-@erase "$(INTDIR)\Instrmnt.obj"
	-@erase "$(INTDIR)\JCRev.obj"
	-@erase "$(INTDIR)\JetTabl.obj"
	-@erase "$(INTDIR)\LipFilt.obj"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\mandplyr.obj"
	-@erase "$(INTDIR)\MatWvIn.obj"
	-@erase "$(INTDIR)\MatWvOut.obj"
	-@erase "$(INTDIR)\MD2SKINI.obj"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\ModalBar.obj"
	-@erase "$(INTDIR)\Modulatr.obj"
	-@erase "$(INTDIR)\Moog1.obj"
	-@erase "$(INTDIR)\Noise.obj"
	-@erase "$(INTDIR)\NRev.obj"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\OnePole.obj"
	-@erase "$(INTDIR)\OneZero.obj"
	-@erase "$(INTDIR)\PercFlut.obj"
	-@erase "$(INTDIR)\Plucked.obj"
	-@erase "$(INTDIR)\Plucked2.obj"
	-@erase "$(INTDIR)\PoleZero.obj"
	-@erase "$(INTDIR)\PRCRev.obj"
	-@erase "$(INTDIR)\RawWvIn.obj"
	-@erase "$(INTDIR)\RawWvOut.obj"
	-@erase "$(INTDIR)\ReedTabl.obj"
	-@erase "$(INTDIR)\Reverb.obj"
	-@erase "$(INTDIR)\Rhodey.obj"
	-@erase "$(INTDIR)\RtAudio.obj"
	-@erase "$(INTDIR)\RtDuplex.obj"
	-@erase "$(INTDIR)\RtMidi.obj"
	-@erase "$(INTDIR)\RtWvIn.obj"
	-@erase "$(INTDIR)\RtWvOut.obj"
	-@erase "$(INTDIR)\Sampler.obj"
	-@erase "$(INTDIR)\SamplFlt.obj"
	-@erase "$(INTDIR)\Shakers.obj"
	-@erase "$(INTDIR)\Simple.obj"
	-@erase "$(INTDIR)\SingWave.obj"
	-@erase "$(INTDIR)\SKINI11.obj"
	-@erase "$(INTDIR)\SndWvIn.obj"
	-@erase "$(INTDIR)\SndWvOut.obj"
	-@erase "$(INTDIR)\StkError.obj"
	-@erase "$(INTDIR)\StrmWvIn.obj"
	-@erase "$(INTDIR)\StrmWvOut.obj"
	-@erase "$(INTDIR)\SubNoise.obj"
	-@erase "$(INTDIR)\TablLook.obj"
	-@erase "$(INTDIR)\TubeBell.obj"
	-@erase "$(INTDIR)\TwoPole.obj"
	-@erase "$(INTDIR)\TwoZero.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VoicForm.obj"
	-@erase "$(INTDIR)\VoicMang.obj"
	-@erase "$(INTDIR)\WavWvIn.obj"
	-@erase "$(INTDIR)\WavWvOut.obj"
	-@erase "$(INTDIR)\Wurley.obj"
	-@erase "$(INTDIR)\WvIn.obj"
	-@erase "$(INTDIR)\WvOut.obj"
	-@erase "$(OUTDIR)\csoundStk.exp"
	-@erase "$(OUTDIR)\csoundStk.lib"
	-@erase "$(OUTDIR)\csoundStk.OPC"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /D "NDEBUG" /D "_LIB" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDSTK_EXPORTS" /D "__OS_Win_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\csoundStk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib dsound.lib csound.lib ssound.lib wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /incremental:no /pdb:"$(OUTDIR)\csoundStk.pdb" /machine:I386 /out:"$(OUTDIR)\csoundStk.OPC" /implib:"$(OUTDIR)\csoundStk.lib" /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\ADSR.obj" \
	"$(INTDIR)\AifWvIn.obj" \
	"$(INTDIR)\AifWvOut.obj" \
	"$(INTDIR)\BeeThree.obj" \
	"$(INTDIR)\BiQuad.obj" \
	"$(INTDIR)\BlowHole.obj" \
	"$(INTDIR)\Bowed.obj" \
	"$(INTDIR)\BowedBar.obj" \
	"$(INTDIR)\BowTabl.obj" \
	"$(INTDIR)\Brass.obj" \
	"$(INTDIR)\ByteSwap.obj" \
	"$(INTDIR)\Clarinet.obj" \
	"$(INTDIR)\Controller.obj" \
	"$(INTDIR)\csoundStk.obj" \
	"$(INTDIR)\DCBlock.obj" \
	"$(INTDIR)\DLineA.obj" \
	"$(INTDIR)\DLineL.obj" \
	"$(INTDIR)\DLineN.obj" \
	"$(INTDIR)\DrumSynt.obj" \
	"$(INTDIR)\Envelope.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\FIR.obj" \
	"$(INTDIR)\Flute.obj" \
	"$(INTDIR)\FM4Alg3.obj" \
	"$(INTDIR)\FM4Alg4.obj" \
	"$(INTDIR)\FM4Alg5.obj" \
	"$(INTDIR)\FM4Alg6.obj" \
	"$(INTDIR)\FM4Alg8.obj" \
	"$(INTDIR)\FM4Op.obj" \
	"$(INTDIR)\FMVoices.obj" \
	"$(INTDIR)\FormSwep.obj" \
	"$(INTDIR)\HeavyMtl.obj" \
	"$(INTDIR)\Instrmnt.obj" \
	"$(INTDIR)\JCRev.obj" \
	"$(INTDIR)\JetTabl.obj" \
	"$(INTDIR)\LipFilt.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\mandplyr.obj" \
	"$(INTDIR)\MatWvIn.obj" \
	"$(INTDIR)\MatWvOut.obj" \
	"$(INTDIR)\MD2SKINI.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\ModalBar.obj" \
	"$(INTDIR)\Modulatr.obj" \
	"$(INTDIR)\Moog1.obj" \
	"$(INTDIR)\Noise.obj" \
	"$(INTDIR)\NRev.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\OnePole.obj" \
	"$(INTDIR)\OneZero.obj" \
	"$(INTDIR)\PercFlut.obj" \
	"$(INTDIR)\Plucked.obj" \
	"$(INTDIR)\Plucked2.obj" \
	"$(INTDIR)\PoleZero.obj" \
	"$(INTDIR)\PRCRev.obj" \
	"$(INTDIR)\RawWvIn.obj" \
	"$(INTDIR)\RawWvOut.obj" \
	"$(INTDIR)\ReedTabl.obj" \
	"$(INTDIR)\Reverb.obj" \
	"$(INTDIR)\Rhodey.obj" \
	"$(INTDIR)\RtAudio.obj" \
	"$(INTDIR)\RtDuplex.obj" \
	"$(INTDIR)\RtMidi.obj" \
	"$(INTDIR)\RtWvIn.obj" \
	"$(INTDIR)\RtWvOut.obj" \
	"$(INTDIR)\Sampler.obj" \
	"$(INTDIR)\SamplFlt.obj" \
	"$(INTDIR)\Shakers.obj" \
	"$(INTDIR)\Simple.obj" \
	"$(INTDIR)\SingWave.obj" \
	"$(INTDIR)\SKINI11.obj" \
	"$(INTDIR)\SndWvIn.obj" \
	"$(INTDIR)\SndWvOut.obj" \
	"$(INTDIR)\StkError.obj" \
	"$(INTDIR)\StrmWvIn.obj" \
	"$(INTDIR)\StrmWvOut.obj" \
	"$(INTDIR)\SubNoise.obj" \
	"$(INTDIR)\TablLook.obj" \
	"$(INTDIR)\TubeBell.obj" \
	"$(INTDIR)\TwoPole.obj" \
	"$(INTDIR)\TwoZero.obj" \
	"$(INTDIR)\VoicForm.obj" \
	"$(INTDIR)\VoicMang.obj" \
	"$(INTDIR)\WavWvIn.obj" \
	"$(INTDIR)\WavWvOut.obj" \
	"$(INTDIR)\Wurley.obj" \
	"$(INTDIR)\WvIn.obj" \
	"$(INTDIR)\WvOut.obj" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib"

"$(OUTDIR)\csoundStk.OPC" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "csoundStk - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\csoundStk.OPC"

!ELSE 

ALL : "SSound - Win32 Debug" "Csound - Win32 Debug" "$(OUTDIR)\csoundStk.OPC"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" "SSound - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\ADSR.obj"
	-@erase "$(INTDIR)\AifWvIn.obj"
	-@erase "$(INTDIR)\AifWvOut.obj"
	-@erase "$(INTDIR)\BeeThree.obj"
	-@erase "$(INTDIR)\BiQuad.obj"
	-@erase "$(INTDIR)\BlowHole.obj"
	-@erase "$(INTDIR)\Bowed.obj"
	-@erase "$(INTDIR)\BowedBar.obj"
	-@erase "$(INTDIR)\BowTabl.obj"
	-@erase "$(INTDIR)\Brass.obj"
	-@erase "$(INTDIR)\ByteSwap.obj"
	-@erase "$(INTDIR)\Clarinet.obj"
	-@erase "$(INTDIR)\Controller.obj"
	-@erase "$(INTDIR)\csoundStk.obj"
	-@erase "$(INTDIR)\DCBlock.obj"
	-@erase "$(INTDIR)\DLineA.obj"
	-@erase "$(INTDIR)\DLineL.obj"
	-@erase "$(INTDIR)\DLineN.obj"
	-@erase "$(INTDIR)\DrumSynt.obj"
	-@erase "$(INTDIR)\Envelope.obj"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\FIR.obj"
	-@erase "$(INTDIR)\Flute.obj"
	-@erase "$(INTDIR)\FM4Alg3.obj"
	-@erase "$(INTDIR)\FM4Alg4.obj"
	-@erase "$(INTDIR)\FM4Alg5.obj"
	-@erase "$(INTDIR)\FM4Alg6.obj"
	-@erase "$(INTDIR)\FM4Alg8.obj"
	-@erase "$(INTDIR)\FM4Op.obj"
	-@erase "$(INTDIR)\FMVoices.obj"
	-@erase "$(INTDIR)\FormSwep.obj"
	-@erase "$(INTDIR)\HeavyMtl.obj"
	-@erase "$(INTDIR)\Instrmnt.obj"
	-@erase "$(INTDIR)\JCRev.obj"
	-@erase "$(INTDIR)\JetTabl.obj"
	-@erase "$(INTDIR)\LipFilt.obj"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\mandplyr.obj"
	-@erase "$(INTDIR)\MatWvIn.obj"
	-@erase "$(INTDIR)\MatWvOut.obj"
	-@erase "$(INTDIR)\MD2SKINI.obj"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\ModalBar.obj"
	-@erase "$(INTDIR)\Modulatr.obj"
	-@erase "$(INTDIR)\Moog1.obj"
	-@erase "$(INTDIR)\Noise.obj"
	-@erase "$(INTDIR)\NRev.obj"
	-@erase "$(INTDIR)\Object.obj"
	-@erase "$(INTDIR)\OnePole.obj"
	-@erase "$(INTDIR)\OneZero.obj"
	-@erase "$(INTDIR)\PercFlut.obj"
	-@erase "$(INTDIR)\Plucked.obj"
	-@erase "$(INTDIR)\Plucked2.obj"
	-@erase "$(INTDIR)\PoleZero.obj"
	-@erase "$(INTDIR)\PRCRev.obj"
	-@erase "$(INTDIR)\RawWvIn.obj"
	-@erase "$(INTDIR)\RawWvOut.obj"
	-@erase "$(INTDIR)\ReedTabl.obj"
	-@erase "$(INTDIR)\Reverb.obj"
	-@erase "$(INTDIR)\Rhodey.obj"
	-@erase "$(INTDIR)\RtAudio.obj"
	-@erase "$(INTDIR)\RtDuplex.obj"
	-@erase "$(INTDIR)\RtMidi.obj"
	-@erase "$(INTDIR)\RtWvIn.obj"
	-@erase "$(INTDIR)\RtWvOut.obj"
	-@erase "$(INTDIR)\Sampler.obj"
	-@erase "$(INTDIR)\SamplFlt.obj"
	-@erase "$(INTDIR)\Shakers.obj"
	-@erase "$(INTDIR)\Simple.obj"
	-@erase "$(INTDIR)\SingWave.obj"
	-@erase "$(INTDIR)\SKINI11.obj"
	-@erase "$(INTDIR)\SndWvIn.obj"
	-@erase "$(INTDIR)\SndWvOut.obj"
	-@erase "$(INTDIR)\StkError.obj"
	-@erase "$(INTDIR)\StrmWvIn.obj"
	-@erase "$(INTDIR)\StrmWvOut.obj"
	-@erase "$(INTDIR)\SubNoise.obj"
	-@erase "$(INTDIR)\TablLook.obj"
	-@erase "$(INTDIR)\TubeBell.obj"
	-@erase "$(INTDIR)\TwoPole.obj"
	-@erase "$(INTDIR)\TwoZero.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VoicForm.obj"
	-@erase "$(INTDIR)\VoicMang.obj"
	-@erase "$(INTDIR)\WavWvIn.obj"
	-@erase "$(INTDIR)\WavWvOut.obj"
	-@erase "$(INTDIR)\Wurley.obj"
	-@erase "$(INTDIR)\WvIn.obj"
	-@erase "$(INTDIR)\WvOut.obj"
	-@erase "$(OUTDIR)\csoundStk.exp"
	-@erase "$(OUTDIR)\csoundStk.ilk"
	-@erase "$(OUTDIR)\csoundStk.lib"
	-@erase "$(OUTDIR)\csoundStk.OPC"
	-@erase "$(OUTDIR)\csoundStk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_DEBUG" /D "_LIB" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDSTK_EXPORTS" /D "__OS_Win_" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\csoundStk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib dsound.lib csound.lib ssound.lib wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /incremental:yes /pdb:"$(OUTDIR)\csoundStk.pdb" /debug /machine:I386 /out:"$(OUTDIR)\csoundStk.OPC" /implib:"$(OUTDIR)\csoundStk.lib" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\ADSR.obj" \
	"$(INTDIR)\AifWvIn.obj" \
	"$(INTDIR)\AifWvOut.obj" \
	"$(INTDIR)\BeeThree.obj" \
	"$(INTDIR)\BiQuad.obj" \
	"$(INTDIR)\BlowHole.obj" \
	"$(INTDIR)\Bowed.obj" \
	"$(INTDIR)\BowedBar.obj" \
	"$(INTDIR)\BowTabl.obj" \
	"$(INTDIR)\Brass.obj" \
	"$(INTDIR)\ByteSwap.obj" \
	"$(INTDIR)\Clarinet.obj" \
	"$(INTDIR)\Controller.obj" \
	"$(INTDIR)\csoundStk.obj" \
	"$(INTDIR)\DCBlock.obj" \
	"$(INTDIR)\DLineA.obj" \
	"$(INTDIR)\DLineL.obj" \
	"$(INTDIR)\DLineN.obj" \
	"$(INTDIR)\DrumSynt.obj" \
	"$(INTDIR)\Envelope.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\FIR.obj" \
	"$(INTDIR)\Flute.obj" \
	"$(INTDIR)\FM4Alg3.obj" \
	"$(INTDIR)\FM4Alg4.obj" \
	"$(INTDIR)\FM4Alg5.obj" \
	"$(INTDIR)\FM4Alg6.obj" \
	"$(INTDIR)\FM4Alg8.obj" \
	"$(INTDIR)\FM4Op.obj" \
	"$(INTDIR)\FMVoices.obj" \
	"$(INTDIR)\FormSwep.obj" \
	"$(INTDIR)\HeavyMtl.obj" \
	"$(INTDIR)\Instrmnt.obj" \
	"$(INTDIR)\JCRev.obj" \
	"$(INTDIR)\JetTabl.obj" \
	"$(INTDIR)\LipFilt.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\mandplyr.obj" \
	"$(INTDIR)\MatWvIn.obj" \
	"$(INTDIR)\MatWvOut.obj" \
	"$(INTDIR)\MD2SKINI.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\ModalBar.obj" \
	"$(INTDIR)\Modulatr.obj" \
	"$(INTDIR)\Moog1.obj" \
	"$(INTDIR)\Noise.obj" \
	"$(INTDIR)\NRev.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\OnePole.obj" \
	"$(INTDIR)\OneZero.obj" \
	"$(INTDIR)\PercFlut.obj" \
	"$(INTDIR)\Plucked.obj" \
	"$(INTDIR)\Plucked2.obj" \
	"$(INTDIR)\PoleZero.obj" \
	"$(INTDIR)\PRCRev.obj" \
	"$(INTDIR)\RawWvIn.obj" \
	"$(INTDIR)\RawWvOut.obj" \
	"$(INTDIR)\ReedTabl.obj" \
	"$(INTDIR)\Reverb.obj" \
	"$(INTDIR)\Rhodey.obj" \
	"$(INTDIR)\RtAudio.obj" \
	"$(INTDIR)\RtDuplex.obj" \
	"$(INTDIR)\RtMidi.obj" \
	"$(INTDIR)\RtWvIn.obj" \
	"$(INTDIR)\RtWvOut.obj" \
	"$(INTDIR)\Sampler.obj" \
	"$(INTDIR)\SamplFlt.obj" \
	"$(INTDIR)\Shakers.obj" \
	"$(INTDIR)\Simple.obj" \
	"$(INTDIR)\SingWave.obj" \
	"$(INTDIR)\SKINI11.obj" \
	"$(INTDIR)\SndWvIn.obj" \
	"$(INTDIR)\SndWvOut.obj" \
	"$(INTDIR)\StkError.obj" \
	"$(INTDIR)\StrmWvIn.obj" \
	"$(INTDIR)\StrmWvOut.obj" \
	"$(INTDIR)\SubNoise.obj" \
	"$(INTDIR)\TablLook.obj" \
	"$(INTDIR)\TubeBell.obj" \
	"$(INTDIR)\TwoPole.obj" \
	"$(INTDIR)\TwoZero.obj" \
	"$(INTDIR)\VoicForm.obj" \
	"$(INTDIR)\VoicMang.obj" \
	"$(INTDIR)\WavWvIn.obj" \
	"$(INTDIR)\WavWvOut.obj" \
	"$(INTDIR)\Wurley.obj" \
	"$(INTDIR)\WvIn.obj" \
	"$(INTDIR)\WvOut.obj" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib"

"$(OUTDIR)\csoundStk.OPC" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("csoundStk.dep")
!INCLUDE "csoundStk.dep"
!ELSE 
!MESSAGE Warning: cannot find "csoundStk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "csoundStk - Win32 Release" || "$(CFG)" == "csoundStk - Win32 Debug"
SOURCE=.\ADSR.cpp

"$(INTDIR)\ADSR.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\AifWvIn.cpp

"$(INTDIR)\AifWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\AifWvOut.cpp

"$(INTDIR)\AifWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\BeeThree.cpp

"$(INTDIR)\BeeThree.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\BiQuad.cpp

"$(INTDIR)\BiQuad.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\BlowHole.cpp

"$(INTDIR)\BlowHole.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Bowed.cpp

"$(INTDIR)\Bowed.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\BowedBar.cpp

"$(INTDIR)\BowedBar.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\BowTabl.cpp

"$(INTDIR)\BowTabl.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Brass.cpp

"$(INTDIR)\Brass.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ByteSwap.cpp

"$(INTDIR)\ByteSwap.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Clarinet.cpp

"$(INTDIR)\Clarinet.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Controller.cpp

"$(INTDIR)\Controller.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\csoundStk.cpp

"$(INTDIR)\csoundStk.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DCBlock.cpp

"$(INTDIR)\DCBlock.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DLineA.cpp

"$(INTDIR)\DLineA.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DLineL.cpp

"$(INTDIR)\DLineL.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DLineN.cpp

"$(INTDIR)\DLineN.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DrumSynt.cpp

"$(INTDIR)\DrumSynt.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Envelope.cpp

"$(INTDIR)\Envelope.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Filter.cpp

"$(INTDIR)\Filter.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FIR.cpp

"$(INTDIR)\FIR.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Flute.cpp

"$(INTDIR)\Flute.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4Alg3.cpp

"$(INTDIR)\FM4Alg3.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4Alg4.cpp

"$(INTDIR)\FM4Alg4.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4Alg5.cpp

"$(INTDIR)\FM4Alg5.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4Alg6.cpp

"$(INTDIR)\FM4Alg6.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4Alg8.cpp

"$(INTDIR)\FM4Alg8.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4Op.cpp

"$(INTDIR)\FM4Op.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FMVoices.cpp

"$(INTDIR)\FMVoices.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FormSwep.cpp

"$(INTDIR)\FormSwep.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\HeavyMtl.cpp

"$(INTDIR)\HeavyMtl.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Instrmnt.cpp

"$(INTDIR)\Instrmnt.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\JCRev.cpp

"$(INTDIR)\JCRev.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\JetTabl.cpp

"$(INTDIR)\JetTabl.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LipFilt.cpp

"$(INTDIR)\LipFilt.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Mandolin.cpp

"$(INTDIR)\Mandolin.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\mandplyr.cpp

"$(INTDIR)\mandplyr.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MatWvIn.cpp

"$(INTDIR)\MatWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MatWvOut.cpp

"$(INTDIR)\MatWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MD2SKINI.cpp

"$(INTDIR)\MD2SKINI.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Modal4.cpp

"$(INTDIR)\Modal4.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ModalBar.cpp

"$(INTDIR)\ModalBar.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Modulatr.cpp

"$(INTDIR)\Modulatr.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Moog1.cpp

"$(INTDIR)\Moog1.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Noise.cpp

"$(INTDIR)\Noise.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\NRev.cpp

"$(INTDIR)\NRev.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Object.cpp

"$(INTDIR)\Object.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\OnePole.cpp

"$(INTDIR)\OnePole.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\OneZero.cpp

"$(INTDIR)\OneZero.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PercFlut.cpp

"$(INTDIR)\PercFlut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Plucked.cpp

"$(INTDIR)\Plucked.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Plucked2.cpp

"$(INTDIR)\Plucked2.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PoleZero.cpp

"$(INTDIR)\PoleZero.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PRCRev.cpp

"$(INTDIR)\PRCRev.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RawWvIn.cpp

"$(INTDIR)\RawWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RawWvOut.cpp

"$(INTDIR)\RawWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ReedTabl.cpp

"$(INTDIR)\ReedTabl.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Reverb.cpp

"$(INTDIR)\Reverb.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Rhodey.cpp

"$(INTDIR)\Rhodey.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RtAudio.cpp

"$(INTDIR)\RtAudio.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RtDuplex.cpp

"$(INTDIR)\RtDuplex.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RtMidi.cpp

"$(INTDIR)\RtMidi.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RtWvIn.cpp

"$(INTDIR)\RtWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RtWvOut.cpp

"$(INTDIR)\RtWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Sampler.cpp

"$(INTDIR)\Sampler.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SamplFlt.cpp

"$(INTDIR)\SamplFlt.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Shakers.cpp

"$(INTDIR)\Shakers.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Simple.cpp

"$(INTDIR)\Simple.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SingWave.cpp

"$(INTDIR)\SingWave.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SKINI11.cpp

"$(INTDIR)\SKINI11.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SndWvIn.cpp

"$(INTDIR)\SndWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SndWvOut.cpp

"$(INTDIR)\SndWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\StkError.cpp

"$(INTDIR)\StkError.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\StrmWvIn.cpp

"$(INTDIR)\StrmWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\StrmWvOut.cpp

"$(INTDIR)\StrmWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SubNoise.cpp

"$(INTDIR)\SubNoise.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\TablLook.cpp

"$(INTDIR)\TablLook.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\TubeBell.cpp

"$(INTDIR)\TubeBell.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\TwoPole.cpp

"$(INTDIR)\TwoPole.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\TwoZero.cpp

"$(INTDIR)\TwoZero.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VoicForm.cpp

"$(INTDIR)\VoicForm.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VoicMang.cpp

"$(INTDIR)\VoicMang.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WavWvIn.cpp

"$(INTDIR)\WavWvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WavWvOut.cpp

"$(INTDIR)\WavWvOut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Wurley.cpp

"$(INTDIR)\Wurley.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WvIn.cpp

"$(INTDIR)\WvIn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WvOut.cpp

"$(INTDIR)\WvOut.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "csoundStk - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\csoundStk"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\csoundStk"

!ELSEIF  "$(CFG)" == "csoundStk - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\csoundStk"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\csoundStk"

!ENDIF 

!IF  "$(CFG)" == "csoundStk - Win32 Release"

"SSound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" 
   cd "..\csoundStk"

"SSound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\csoundStk"

!ELSEIF  "$(CFG)" == "csoundStk - Win32 Debug"

"SSound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" 
   cd "..\csoundStk"

"SSound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\csoundStk"

!ENDIF 


!ENDIF 

