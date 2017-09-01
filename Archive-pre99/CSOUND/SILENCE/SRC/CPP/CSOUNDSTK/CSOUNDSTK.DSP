# Microsoft Developer Studio Project File - Name="csoundStk" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=csoundStk - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "csoundStk.mak".
!MESSAGE 
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

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "csoundStk - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../../../bin"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDSTK_EXPORTS" /YX /FD /c
# ADD CPP /MT /W3 /GX /Zd /O2 /Ob2 /I ".." /D "NDEBUG" /D "_LIB" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDSTK_EXPORTS" /D "__OS_Win_" /FD /c
# SUBTRACT CPP /nologo /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 winmm.lib dsound.lib csound.lib ssound.lib wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /machine:I386 /out:"../../../bin/csoundStk.OPC" /libpath:"../../../lib" /libpath:"../../../bin"
# SUBTRACT LINK32 /nologo /debug

!ELSEIF  "$(CFG)" == "csoundStk - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "../../../bin"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDSTK_EXPORTS" /YX /FD /GZ /c
# ADD CPP /MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_DEBUG" /D "_LIB" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDSTK_EXPORTS" /D "__OS_Win_" /FD /GZ /c
# SUBTRACT CPP /nologo /YX
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 winmm.lib dsound.lib csound.lib ssound.lib wsock32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /debug /machine:I386 /out:"../../../bin/csoundStk.OPC" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin"
# SUBTRACT LINK32 /nologo

!ENDIF 

# Begin Target

# Name "csoundStk - Win32 Release"
# Name "csoundStk - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\ADSR.cpp
# End Source File
# Begin Source File

SOURCE=.\AifWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\AifWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\BeeThree.cpp
# End Source File
# Begin Source File

SOURCE=.\BiQuad.cpp
# End Source File
# Begin Source File

SOURCE=.\BlowHole.cpp
# End Source File
# Begin Source File

SOURCE=.\Bowed.cpp
# End Source File
# Begin Source File

SOURCE=.\BowedBar.cpp
# End Source File
# Begin Source File

SOURCE=.\BowTabl.cpp
# End Source File
# Begin Source File

SOURCE=.\Brass.cpp
# End Source File
# Begin Source File

SOURCE=.\ByteSwap.cpp
# End Source File
# Begin Source File

SOURCE=.\Clarinet.cpp
# End Source File
# Begin Source File

SOURCE=.\Controller.cpp
# End Source File
# Begin Source File

SOURCE=.\csoundStk.cpp
# End Source File
# Begin Source File

SOURCE=.\DCBlock.cpp
# End Source File
# Begin Source File

SOURCE=.\DLineA.cpp
# End Source File
# Begin Source File

SOURCE=.\DLineL.cpp
# End Source File
# Begin Source File

SOURCE=.\DLineN.cpp
# End Source File
# Begin Source File

SOURCE=.\DrumSynt.cpp
# End Source File
# Begin Source File

SOURCE=.\Envelope.cpp
# End Source File
# Begin Source File

SOURCE=.\Filter.cpp
# End Source File
# Begin Source File

SOURCE=.\FIR.cpp
# End Source File
# Begin Source File

SOURCE=.\Flute.cpp
# End Source File
# Begin Source File

SOURCE=.\FM4Alg3.cpp
# End Source File
# Begin Source File

SOURCE=.\FM4Alg4.cpp
# End Source File
# Begin Source File

SOURCE=.\FM4Alg5.cpp
# End Source File
# Begin Source File

SOURCE=.\FM4Alg6.cpp
# End Source File
# Begin Source File

SOURCE=.\FM4Alg8.cpp
# End Source File
# Begin Source File

SOURCE=.\FM4Op.cpp
# End Source File
# Begin Source File

SOURCE=.\FMVoices.cpp
# End Source File
# Begin Source File

SOURCE=.\FormSwep.cpp
# End Source File
# Begin Source File

SOURCE=.\HeavyMtl.cpp
# End Source File
# Begin Source File

SOURCE=.\Instrmnt.cpp
# End Source File
# Begin Source File

SOURCE=.\JCRev.cpp
# End Source File
# Begin Source File

SOURCE=.\JetTabl.cpp
# End Source File
# Begin Source File

SOURCE=.\LipFilt.cpp
# End Source File
# Begin Source File

SOURCE=.\Mandolin.cpp
# End Source File
# Begin Source File

SOURCE=.\mandplyr.cpp
# End Source File
# Begin Source File

SOURCE=.\MatWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\MatWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\MD2SKINI.cpp
# End Source File
# Begin Source File

SOURCE=.\Modal4.cpp
# End Source File
# Begin Source File

SOURCE=.\ModalBar.cpp
# End Source File
# Begin Source File

SOURCE=.\Modulatr.cpp
# End Source File
# Begin Source File

SOURCE=.\Moog1.cpp
# End Source File
# Begin Source File

SOURCE=.\Noise.cpp
# End Source File
# Begin Source File

SOURCE=.\NRev.cpp
# End Source File
# Begin Source File

SOURCE=.\Object.cpp
# End Source File
# Begin Source File

SOURCE=.\OnePole.cpp
# End Source File
# Begin Source File

SOURCE=.\OneZero.cpp
# End Source File
# Begin Source File

SOURCE=.\PercFlut.cpp
# End Source File
# Begin Source File

SOURCE=.\Plucked.cpp
# End Source File
# Begin Source File

SOURCE=.\Plucked2.cpp
# End Source File
# Begin Source File

SOURCE=.\PoleZero.cpp
# End Source File
# Begin Source File

SOURCE=.\PRCRev.cpp
# End Source File
# Begin Source File

SOURCE=.\RawWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\RawWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\ReedTabl.cpp
# End Source File
# Begin Source File

SOURCE=.\Reverb.cpp
# End Source File
# Begin Source File

SOURCE=.\Rhodey.cpp
# End Source File
# Begin Source File

SOURCE=.\RtAudio.cpp
# End Source File
# Begin Source File

SOURCE=.\RtDuplex.cpp
# End Source File
# Begin Source File

SOURCE=.\RtMidi.cpp
# End Source File
# Begin Source File

SOURCE=.\RtWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\RtWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\Sampler.cpp
# End Source File
# Begin Source File

SOURCE=.\SamplFlt.cpp
# End Source File
# Begin Source File

SOURCE=.\Shakers.cpp
# End Source File
# Begin Source File

SOURCE=.\Simple.cpp
# End Source File
# Begin Source File

SOURCE=.\SingWave.cpp
# End Source File
# Begin Source File

SOURCE=.\SKINI11.cpp
# End Source File
# Begin Source File

SOURCE=.\SndWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\SndWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\StkError.cpp
# End Source File
# Begin Source File

SOURCE=.\StrmWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\StrmWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\SubNoise.cpp
# End Source File
# Begin Source File

SOURCE=.\TablLook.cpp
# End Source File
# Begin Source File

SOURCE=.\TubeBell.cpp
# End Source File
# Begin Source File

SOURCE=.\TwoPole.cpp
# End Source File
# Begin Source File

SOURCE=.\TwoZero.cpp
# End Source File
# Begin Source File

SOURCE=.\VoicForm.cpp
# End Source File
# Begin Source File

SOURCE=.\VoicMang.cpp
# End Source File
# Begin Source File

SOURCE=.\WavWvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\WavWvOut.cpp
# End Source File
# Begin Source File

SOURCE=.\Wurley.cpp
# End Source File
# Begin Source File

SOURCE=.\WvIn.cpp
# End Source File
# Begin Source File

SOURCE=.\WvOut.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\ADSR.h
# End Source File
# Begin Source File

SOURCE=.\AifWvIn.h
# End Source File
# Begin Source File

SOURCE=.\AifWvOut.h
# End Source File
# Begin Source File

SOURCE=.\BeeThree.h
# End Source File
# Begin Source File

SOURCE=.\BiQuad.h
# End Source File
# Begin Source File

SOURCE=.\BlowHole.h
# End Source File
# Begin Source File

SOURCE=.\Bowed.h
# End Source File
# Begin Source File

SOURCE=.\BowedBar.h
# End Source File
# Begin Source File

SOURCE=.\BowTabl.h
# End Source File
# Begin Source File

SOURCE=.\Brass.h
# End Source File
# Begin Source File

SOURCE=.\ByteSwap.h
# End Source File
# Begin Source File

SOURCE=.\Clarinet.h
# End Source File
# Begin Source File

SOURCE=.\Controller.h
# End Source File
# Begin Source File

SOURCE=.\DCBlock.h
# End Source File
# Begin Source File

SOURCE=.\DLineA.h
# End Source File
# Begin Source File

SOURCE=.\DLineL.h
# End Source File
# Begin Source File

SOURCE=.\DLineN.h
# End Source File
# Begin Source File

SOURCE=.\DrumSynt.h
# End Source File
# Begin Source File

SOURCE=.\Envelope.h
# End Source File
# Begin Source File

SOURCE=.\Filter.h
# End Source File
# Begin Source File

SOURCE=.\FIR.h
# End Source File
# Begin Source File

SOURCE=.\Flute.h
# End Source File
# Begin Source File

SOURCE=.\FM4Alg3.h
# End Source File
# Begin Source File

SOURCE=.\FM4Alg4.h
# End Source File
# Begin Source File

SOURCE=.\FM4Alg5.h
# End Source File
# Begin Source File

SOURCE=.\FM4Alg6.h
# End Source File
# Begin Source File

SOURCE=.\FM4Alg8.h
# End Source File
# Begin Source File

SOURCE=.\FM4Op.h
# End Source File
# Begin Source File

SOURCE=.\FMVoices.h
# End Source File
# Begin Source File

SOURCE=.\FormSwep.h
# End Source File
# Begin Source File

SOURCE=.\HeavyMtl.h
# End Source File
# Begin Source File

SOURCE=.\Instrmnt.h
# End Source File
# Begin Source File

SOURCE=.\JCRev.h
# End Source File
# Begin Source File

SOURCE=.\JetTabl.h
# End Source File
# Begin Source File

SOURCE=.\LipFilt.h
# End Source File
# Begin Source File

SOURCE=.\Mandolin.h
# End Source File
# Begin Source File

SOURCE=.\mandplyr.h
# End Source File
# Begin Source File

SOURCE=.\MatWvIn.h
# End Source File
# Begin Source File

SOURCE=.\MatWvOut.h
# End Source File
# Begin Source File

SOURCE=.\miditabl.h
# End Source File
# Begin Source File

SOURCE=.\Modal4.h
# End Source File
# Begin Source File

SOURCE=.\ModalBar.h
# End Source File
# Begin Source File

SOURCE=.\Modulatr.h
# End Source File
# Begin Source File

SOURCE=.\Moog1.h
# End Source File
# Begin Source File

SOURCE=.\Noise.h
# End Source File
# Begin Source File

SOURCE=.\NRev.h
# End Source File
# Begin Source File

SOURCE=.\Object.h
# End Source File
# Begin Source File

SOURCE=.\OnePole.h
# End Source File
# Begin Source File

SOURCE=.\OneZero.h
# End Source File
# Begin Source File

SOURCE=.\PercFlut.h
# End Source File
# Begin Source File

SOURCE=.\phontabl.h
# End Source File
# Begin Source File

SOURCE=.\Plucked.h
# End Source File
# Begin Source File

SOURCE=.\Plucked2.h
# End Source File
# Begin Source File

SOURCE=.\PoleZero.h
# End Source File
# Begin Source File

SOURCE=.\PRCRev.h
# End Source File
# Begin Source File

SOURCE=.\RawWvIn.h
# End Source File
# Begin Source File

SOURCE=.\RawWvOut.h
# End Source File
# Begin Source File

SOURCE=.\ReedTabl.h
# End Source File
# Begin Source File

SOURCE=.\Reverb.h
# End Source File
# Begin Source File

SOURCE=.\Rhodey.h
# End Source File
# Begin Source File

SOURCE=.\RtAudio.h
# End Source File
# Begin Source File

SOURCE=.\RtDuplex.h
# End Source File
# Begin Source File

SOURCE=.\RtMidi.h
# End Source File
# Begin Source File

SOURCE=.\RtWvIn.h
# End Source File
# Begin Source File

SOURCE=.\RtWvOut.h
# End Source File
# Begin Source File

SOURCE=.\Sampler.h
# End Source File
# Begin Source File

SOURCE=.\SamplFlt.h
# End Source File
# Begin Source File

SOURCE=.\Shakers.h
# End Source File
# Begin Source File

SOURCE=.\Simple.h
# End Source File
# Begin Source File

SOURCE=.\SingWave.h
# End Source File
# Begin Source File

SOURCE=.\SKINI11.h
# End Source File
# Begin Source File

SOURCE=.\SndWvIn.h
# End Source File
# Begin Source File

SOURCE=.\SndWvOut.h
# End Source File
# Begin Source File

SOURCE=.\StkError.h
# End Source File
# Begin Source File

SOURCE=.\StrmWvIn.h
# End Source File
# Begin Source File

SOURCE=.\StrmWvOut.h
# End Source File
# Begin Source File

SOURCE=.\SubNoise.h
# End Source File
# Begin Source File

SOURCE=.\TablLook.h
# End Source File
# Begin Source File

SOURCE=.\TubeBell.h
# End Source File
# Begin Source File

SOURCE=.\TwoPole.h
# End Source File
# Begin Source File

SOURCE=.\TwoZero.h
# End Source File
# Begin Source File

SOURCE=.\VoicForm.h
# End Source File
# Begin Source File

SOURCE=.\VoicMang.h
# End Source File
# Begin Source File

SOURCE=.\WavWvIn.h
# End Source File
# Begin Source File

SOURCE=.\WavWvOut.h
# End Source File
# Begin Source File

SOURCE=.\Wurley.h
# End Source File
# Begin Source File

SOURCE=.\WvIn.h
# End Source File
# Begin Source File

SOURCE=.\WvOut.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
