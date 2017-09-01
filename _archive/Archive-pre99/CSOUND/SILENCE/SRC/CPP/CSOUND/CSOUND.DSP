# Microsoft Developer Studio Project File - Name="Csound" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=Csound - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Csound.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Csound.mak" CFG="Csound - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Csound - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "Csound - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Csound - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../../../lib"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD CPP /MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_LIB" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /FD /c
# SUBTRACT CPP /nologo /YX
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "Csound - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "../../../lib"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ /c
# ADD CPP /MTd /W3 /Gm /GX /ZI /Od /I ".." /I "." /I "../." /D "_LIB" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /FD /GZ /c
# SUBTRACT CPP /nologo /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# SUBTRACT LIB32 /nologo

!ENDIF 

# Begin Target

# Name "Csound - Win32 Release"
# Name "Csound - Win32 Debug"
# Begin Group "Modifications"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\Modifications\load_opcodes.c
# End Source File
# End Group
# Begin Group "Canonical"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\3DUG.H
# End Source File
# Begin Source File

SOURCE=.\aifc.c
# End Source File
# Begin Source File

SOURCE=.\AIFF.C
# End Source File
# Begin Source File

SOURCE=.\AIFF.H
# End Source File
# Begin Source File

SOURCE=.\AOPS.C
# End Source File
# Begin Source File

SOURCE=.\AOPS.H
# End Source File
# Begin Source File

SOURCE=.\argdecode.c
# End Source File
# Begin Source File

SOURCE=.\AUXFD.C
# End Source File
# Begin Source File

SOURCE=.\babo.c
# End Source File
# Begin Source File

SOURCE=.\babo.h
# End Source File
# Begin Source File

SOURCE=.\bbcut.c
# End Source File
# Begin Source File

SOURCE=.\bbcut.h
# End Source File
# Begin Source File

SOURCE=.\biquad.c
# End Source File
# Begin Source File

SOURCE=.\biquad.h
# End Source File
# Begin Source File

SOURCE=.\BOWED.H
# End Source File
# Begin Source File

SOURCE=.\bowedbar.c
# End Source File
# Begin Source File

SOURCE=.\bowedbar.h
# End Source File
# Begin Source File

SOURCE=.\BRASS.H
# End Source File
# Begin Source File

SOURCE=.\BUTTER.C
# End Source File
# Begin Source File

SOURCE=.\BUTTER.H
# End Source File
# Begin Source File

SOURCE=.\CLARINET.H
# End Source File
# Begin Source File

SOURCE=.\CMATH.C
# End Source File
# Begin Source File

SOURCE=.\CMATH.H
# End Source File
# Begin Source File

SOURCE=.\COMPLEX.C
# End Source File
# Begin Source File

SOURCE=.\COMPLEX.H
# End Source File
# Begin Source File

SOURCE=.\control.c
# End Source File
# Begin Source File

SOURCE=.\control.h
# End Source File
# Begin Source File

SOURCE=.\CONVOLVE.H
# End Source File
# Begin Source File

SOURCE=.\CROSS2.C
# End Source File
# Begin Source File

SOURCE=.\CS.H
# End Source File
# Begin Source File

SOURCE=.\CSCORE.C
# End Source File
# Begin Source File

SOURCE=.\CSCORE.H
# End Source File
# Begin Source File

SOURCE=.\CSCORFNS.C
# End Source File
# Begin Source File

SOURCE=.\CSliders.cpp
# End Source File
# Begin Source File

SOURCE=.\CSliders.h
# End Source File
# Begin Source File

SOURCE=.\csound.c
# End Source File
# Begin Source File

SOURCE=.\csound.h
# End Source File
# Begin Source File

SOURCE=.\CVANAL.C
# End Source File
# Begin Source File

SOURCE=.\CVDLG.CPP
# End Source File
# Begin Source File

SOURCE=.\CWIN.H
# End Source File
# Begin Source File

SOURCE=.\cwindow.h
# End Source File
# Begin Source File

SOURCE=.\DAM.C
# End Source File
# Begin Source File

SOURCE=.\DAM.H
# End Source File
# Begin Source File

SOURCE=.\dcblockr.c
# End Source File
# Begin Source File

SOURCE=.\dcblockr.h
# End Source File
# Begin Source File

SOURCE=.\DECAUDIO.H
# End Source File
# Begin Source File

SOURCE=.\DECPLAY.H
# End Source File
# Begin Source File

SOURCE=.\DIALOGS.H
# End Source File
# Begin Source File

SOURCE=.\DISKIN.C
# End Source File
# Begin Source File

SOURCE=.\DISKIN.H
# End Source File
# Begin Source File

SOURCE=.\DISPREP.C
# End Source File
# Begin Source File

SOURCE=.\DISPREP.H
# End Source File
# Begin Source File

SOURCE=.\DPWELIB.H
# End Source File
# Begin Source File

SOURCE=.\DSPUTIL.C
# End Source File
# Begin Source File

SOURCE=.\DSPUTIL.H
# End Source File
# Begin Source File

SOURCE=.\DUMPF.C
# End Source File
# Begin Source File

SOURCE=.\DUMPF.H
# End Source File
# Begin Source File

SOURCE=.\entry1.c
# End Source File
# Begin Source File

SOURCE=.\entry2.c
# End Source File
# Begin Source File

SOURCE=.\EXPRESS.C
# End Source File
# Begin Source File

SOURCE=.\EXTRACT.C
# End Source File
# Begin Source File

SOURCE=.\FFT.C
# End Source File
# Begin Source File

SOURCE=.\FFT.H
# End Source File
# Begin Source File

SOURCE=.\FGENS.C
# End Source File
# Begin Source File

SOURCE=.\FHTFUN.H
# End Source File
# Begin Source File

SOURCE=.\FILOPEN.C
# End Source File
# Begin Source File

SOURCE=.\FILTER.C
# End Source File
# Begin Source File

SOURCE=.\FILTER.H
# End Source File
# Begin Source File

SOURCE=.\flanger.c
# End Source File
# Begin Source File

SOURCE=.\flanger.h
# End Source File
# Begin Source File

SOURCE=.\FLUTE.H
# End Source File
# Begin Source File

SOURCE=.\FM4OP.C
# End Source File
# Begin Source File

SOURCE=.\FM4OP.H
# End Source File
# Begin Source File

SOURCE=.\FOLLOW.C
# End Source File
# Begin Source File

SOURCE=.\FOLLOW.H
# End Source File
# Begin Source File

SOURCE=.\fout.c
# End Source File
# Begin Source File

SOURCE=.\fout.h
# End Source File
# Begin Source File

SOURCE=.\FTGEN.H
# End Source File
# Begin Source File

SOURCE=.\getstring.c
# End Source File
# Begin Source File

SOURCE=.\GRAIN.C
# End Source File
# Begin Source File

SOURCE=.\GRAIN.H
# End Source File
# Begin Source File

SOURCE=.\GRAIN4.C
# End Source File
# Begin Source File

SOURCE=.\GRAIN4.H
# End Source File
# Begin Source File

SOURCE=.\HETDLG.CPP
# End Source File
# Begin Source File

SOURCE=.\HETRO.C
# End Source File
# Begin Source File

SOURCE=.\HRTFERX.C
# End Source File
# Begin Source File

SOURCE=.\HRTFERX.H
# End Source File
# Begin Source File

SOURCE=.\IEEE80.C
# End Source File
# Begin Source File

SOURCE=.\IEEE80.H
# End Source File
# Begin Source File

SOURCE=.\INSERT.C
# End Source File
# Begin Source File

SOURCE=.\INSERT.H
# End Source File
# Begin Source File

SOURCE=.\LINEVENT.C
# End Source File
# Begin Source File

SOURCE=.\locsig.c
# End Source File
# Begin Source File

SOURCE=.\locsig.h
# End Source File
# Begin Source File

SOURCE=.\lowpassr.c
# End Source File
# Begin Source File

SOURCE=.\lowpassr.h
# End Source File
# Begin Source File

SOURCE=.\LPANAL.C
# End Source File
# Begin Source File

SOURCE=.\LPC.H
# End Source File
# Begin Source File

SOURCE=.\LPCDLG.CPP
# End Source File
# Begin Source File

SOURCE=.\LPTRKFNS.C
# End Source File
# Begin Source File

SOURCE=.\MAIN.C
# End Source File
# Begin Source File

SOURCE=.\MANDOLIN.C
# End Source File
# Begin Source File

SOURCE=.\MANDOLIN.H
# End Source File
# Begin Source File

SOURCE=.\MARIMBA.H
# End Source File
# Begin Source File

SOURCE=.\MEMALLOC.C
# End Source File
# Begin Source File

SOURCE=.\MEMFILES.C
# End Source File
# Begin Source File

SOURCE=.\MIDIOOPS.H
# End Source File
# Begin Source File

SOURCE=.\MIDIOPS.C
# End Source File
# Begin Source File

SOURCE=.\MIDIOPS.H
# End Source File
# Begin Source File

SOURCE=.\MIDIOPS2.C
# End Source File
# Begin Source File

SOURCE=.\MIDIOPS2.H
# End Source File
# Begin Source File

SOURCE=.\midiops3.c
# End Source File
# Begin Source File

SOURCE=.\midiops3.h
# End Source File
# Begin Source File

SOURCE=.\MIDIOUT.C
# End Source File
# Begin Source File

SOURCE=.\MIDIOUT.H
# End Source File
# Begin Source File

SOURCE=.\MIDIRECV.C
# End Source File
# Begin Source File

SOURCE=.\MIDISEND.C
# End Source File
# Begin Source File

SOURCE=.\MODAL4.C
# End Source File
# Begin Source File

SOURCE=.\MODAL4.H
# End Source File
# Begin Source File

SOURCE=.\MOOG1.C
# End Source File
# Begin Source File

SOURCE=.\MOOG1.H
# End Source File
# Begin Source File

SOURCE=.\MUSMON.C
# End Source File
# Begin Source File

SOURCE=.\mxfft.c
# End Source File
# Begin Source File

SOURCE=.\NLFILT.C
# End Source File
# Begin Source File

SOURCE=.\NLFILT.H
# End Source File
# Begin Source File

SOURCE=.\nreverb.h
# End Source File
# Begin Source File

SOURCE=.\OLOAD.C
# End Source File
# Begin Source File

SOURCE=.\OLOAD.H
# End Source File
# Begin Source File

SOURCE=.\one_file.c
# End Source File
# Begin Source File

SOURCE=.\OPCODE.C
# End Source File
# Begin Source File

SOURCE=.\oscbnk.c
# End Source File
# Begin Source File

SOURCE=.\oscbnk.h
# End Source File
# Begin Source File

SOURCE=.\oscils.c
# End Source File
# Begin Source File

SOURCE=.\oscils.h
# End Source File
# Begin Source File

SOURCE=.\OTRAN.C
# End Source File
# Begin Source File

SOURCE=.\phisem.c
# End Source File
# Begin Source File

SOURCE=.\phisem.h
# End Source File
# Begin Source File

SOURCE=.\PHYSMOD.C
# End Source File
# Begin Source File

SOURCE=.\PHYSUTIL.C
# End Source File
# Begin Source File

SOURCE=.\PHYSUTIL.H
# End Source File
# Begin Source File

SOURCE=.\pitch.c
# End Source File
# Begin Source File

SOURCE=.\pitch.h
# End Source File
# Begin Source File

SOURCE=.\PLUCK.C
# End Source File
# Begin Source File

SOURCE=.\PLUCK.H
# End Source File
# Begin Source File

SOURCE=.\PROTOTYP.H
# End Source File
# Begin Source File

SOURCE=.\pstream.c
# End Source File
# Begin Source File

SOURCE=.\pstream.h
# End Source File
# Begin Source File

SOURCE=.\PTRIGTBL.H
# End Source File
# Begin Source File

SOURCE=.\PVADD.C
# End Source File
# Begin Source File

SOURCE=.\PVADD.H
# End Source File
# Begin Source File

SOURCE=.\PVANAL.C
# End Source File
# Begin Source File

SOURCE=.\PVDLG.CPP
# End Source File
# Begin Source File

SOURCE=.\pvfileio.c
# End Source File
# Begin Source File

SOURCE=.\pvfileio.h
# End Source File
# Begin Source File

SOURCE=.\PVINTERP.C
# End Source File
# Begin Source File

SOURCE=.\PVINTERP.H
# End Source File
# Begin Source File

SOURCE=.\pvlook.c
# End Source File
# Begin Source File

SOURCE=.\Pvlookdlg.cpp
# End Source File
# Begin Source File

SOURCE=.\PVOC.C
# End Source File
# Begin Source File

SOURCE=.\PVOC.H
# End Source File
# Begin Source File

SOURCE=.\pvocext.c
# End Source File
# Begin Source File

SOURCE=.\pvocext.h
# End Source File
# Begin Source File

SOURCE=.\PVREAD.C
# End Source File
# Begin Source File

SOURCE=.\PVREAD.H
# End Source File
# Begin Source File

SOURCE=.\pvsanal.c
# End Source File
# Begin Source File

SOURCE=.\pvxanal.c
# End Source File
# Begin Source File

SOURCE=.\pvxanal.h
# End Source File
# Begin Source File

SOURCE=.\RDORCH.C
# End Source File
# Begin Source File

SOURCE=.\RDSCOR.C
# End Source File
# Begin Source File

SOURCE=.\REPLUCK.C
# End Source File
# Begin Source File

SOURCE=.\REPLUCK.H
# End Source File
# Begin Source File

SOURCE=.\REVSETS.H
# End Source File
# Begin Source File

SOURCE=.\rtwin32.c
# End Source File
# Begin Source File

SOURCE=.\scansyn.c
# End Source File
# Begin Source File

SOURCE=.\scansyn.h
# End Source File
# Begin Source File

SOURCE=.\scansynx.c
# End Source File
# Begin Source File

SOURCE=.\scansynx.h
# End Source File
# Begin Source File

SOURCE=.\schedule.c
# End Source File
# Begin Source File

SOURCE=.\schedule.h
# End Source File
# Begin Source File

SOURCE=.\SCOT.C
# End Source File
# Begin Source File

SOURCE=.\SCOT.H
# End Source File
# Begin Source File

SOURCE=.\SCSORT.C
# End Source File
# Begin Source File

SOURCE=.\SCXTRACT.C
# End Source File
# Begin Source File

SOURCE=".\sdif-mem.c"
# End Source File
# Begin Source File

SOURCE=".\sdif-mem.h"
# End Source File
# Begin Source File

SOURCE=.\sdif.c
# End Source File
# Begin Source File

SOURCE=.\sdif.h
# End Source File
# Begin Source File

SOURCE=.\sf.h
# End Source File
# Begin Source File

SOURCE=.\sfenum.h
# End Source File
# Begin Source File

SOURCE=.\SFHEADER.C
# End Source File
# Begin Source File

SOURCE=.\SFHEADER.H
# End Source File
# Begin Source File

SOURCE=.\sfont.c
# End Source File
# Begin Source File

SOURCE=.\sfont.h
# End Source File
# Begin Source File

SOURCE=.\sftype.h
# End Source File
# Begin Source File

SOURCE=.\SHAKER.C
# End Source File
# Begin Source File

SOURCE=.\SHAKER.H
# End Source File
# Begin Source File

SOURCE=.\SINGWAVE.C
# End Source File
# Begin Source File

SOURCE=.\SINGWAVE.H
# End Source File
# Begin Source File

SOURCE=.\SNDINFO.C
# End Source File
# Begin Source File

SOURCE=.\sndinfUG.c
# End Source File
# Begin Source File

SOURCE=.\sndinfUG.h
# End Source File
# Begin Source File

SOURCE=.\SNDWARP.C
# End Source File
# Begin Source File

SOURCE=.\SNDWARP.H
# End Source File
# Begin Source File

SOURCE=.\SORT.C
# End Source File
# Begin Source File

SOURCE=.\SORT.H
# End Source File
# Begin Source File

SOURCE=.\SOUNDIN.C
# End Source File
# Begin Source File

SOURCE=.\SOUNDIO.C
# End Source File
# Begin Source File

SOURCE=.\SOUNDIO.H
# End Source File
# Begin Source File

SOURCE=.\SPACE.C
# End Source File
# Begin Source File

SOURCE=.\SPACE.H
# End Source File
# Begin Source File

SOURCE=.\spat3d.c
# End Source File
# Begin Source File

SOURCE=.\spat3d.h
# End Source File
# Begin Source File

SOURCE=.\SPECTRA.C
# End Source File
# Begin Source File

SOURCE=.\SPECTRA.H
# End Source File
# Begin Source File

SOURCE=.\SREAD.C
# End Source File
# Begin Source File

SOURCE=.\SWRITE.C
# End Source File
# Begin Source File

SOURCE=.\SYSDEP.H
# End Source File
# Begin Source File

SOURCE=.\text.h
# End Source File
# Begin Source File

SOURCE=.\TWARP.C
# End Source File
# Begin Source File

SOURCE=.\UGENS1.C
# End Source File
# Begin Source File

SOURCE=.\UGENS1.H
# End Source File
# Begin Source File

SOURCE=.\UGENS2.C
# End Source File
# Begin Source File

SOURCE=.\UGENS2.H
# End Source File
# Begin Source File

SOURCE=.\UGENS3.C
# End Source File
# Begin Source File

SOURCE=.\UGENS3.H
# End Source File
# Begin Source File

SOURCE=.\UGENS4.C
# End Source File
# Begin Source File

SOURCE=.\UGENS4.H
# End Source File
# Begin Source File

SOURCE=.\UGENS5.C
# End Source File
# Begin Source File

SOURCE=.\UGENS5.H
# End Source File
# Begin Source File

SOURCE=.\UGENS6.C
# End Source File
# Begin Source File

SOURCE=.\UGENS6.H
# End Source File
# Begin Source File

SOURCE=.\UGENS7.C
# End Source File
# Begin Source File

SOURCE=.\UGENS7.H
# End Source File
# Begin Source File

SOURCE=.\UGENS8.C
# End Source File
# Begin Source File

SOURCE=.\UGENS8.H
# End Source File
# Begin Source File

SOURCE=.\UGENS9.C
# End Source File
# Begin Source File

SOURCE=.\UGENS9.H
# End Source File
# Begin Source File

SOURCE=.\UGENSA.C
# End Source File
# Begin Source File

SOURCE=.\UGENSA.H
# End Source File
# Begin Source File

SOURCE=.\uggab.c
# End Source File
# Begin Source File

SOURCE=.\uggab.h
# End Source File
# Begin Source File

SOURCE=.\ugmoss.c
# End Source File
# Begin Source File

SOURCE=.\ugmoss.h
# End Source File
# Begin Source File

SOURCE=.\UGRW1.C
# End Source File
# Begin Source File

SOURCE=.\UGRW1.H
# End Source File
# Begin Source File

SOURCE=.\UGRW2.C
# End Source File
# Begin Source File

SOURCE=.\UGRW2.H
# End Source File
# Begin Source File

SOURCE=.\ugsc.c
# End Source File
# Begin Source File

SOURCE=.\ugsc.h
# End Source File
# Begin Source File

SOURCE=.\ULAW.C
# End Source File
# Begin Source File

SOURCE=.\USTUB.H
# End Source File
# Begin Source File

SOURCE=.\vbap.c
# End Source File
# Begin Source File

SOURCE=.\vbap.h
# End Source File
# Begin Source File

SOURCE=.\vbap_eight.c
# End Source File
# Begin Source File

SOURCE=.\vbap_four.c
# End Source File
# Begin Source File

SOURCE=.\vbap_sixteen.c
# End Source File
# Begin Source File

SOURCE=.\vbap_zak.c
# End Source File
# Begin Source File

SOURCE=.\VDELAY.C
# End Source File
# Begin Source File

SOURCE=.\VDELAY.H
# End Source File
# Begin Source File

SOURCE=.\VERSION.H
# End Source File
# Begin Source File

SOURCE=.\VIBRAPHN.H
# End Source File
# Begin Source File

SOURCE=.\VPVOC.C
# End Source File
# Begin Source File

SOURCE=.\VPVOC.H
# End Source File
# Begin Source File

SOURCE=.\WAVE.C
# End Source File
# Begin Source File

SOURCE=.\WAVE.H
# End Source File
# Begin Source File

SOURCE=.\WAVEGDE.C
# End Source File
# Begin Source File

SOURCE=.\WAVEGDE.H
# End Source File
# Begin Source File

SOURCE=.\WINASCII.C
# End Source File
# Begin Source File

SOURCE=.\WINCWIN.C
# End Source File
# Begin Source File

SOURCE=.\WINDIN.C
# End Source File
# Begin Source File

SOURCE=.\WINDIN.H
# End Source File
# Begin Source File

SOURCE=.\WINDOW.C
# End Source File
# Begin Source File

SOURCE=.\WINDOW.H
# End Source File
# Begin Source File

SOURCE=.\WINEPS.C
# End Source File
# Begin Source File

SOURCE=.\WINEPS.H
# End Source File
# Begin Source File

SOURCE=.\WINSOUND.RC
# End Source File
# End Group
# Begin Group "varga"

# PROP Default_Filter ""
# End Group
# Begin Source File

SOURCE=.\DREAM.ICO
# End Source File
# Begin Source File

SOURCE=.\mtrc.ico
# End Source File
# Begin Source File

SOURCE=.\WINSOUND.ICO
# End Source File
# End Target
# End Project
