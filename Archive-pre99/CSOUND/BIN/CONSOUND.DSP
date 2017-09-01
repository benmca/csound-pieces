# Microsoft Developer Studio Project File - Name="consound" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=consound - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "consound.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "consound.mak" CFG="consound - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "consound - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "consound - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "consound - Win32 Release64" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "consound - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "TCKTK" /YX /FD /c
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "TCLTK" /D "MEMDEBUG" /YX /FD /c
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib ws2_32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "consound"
# PROP BASE Intermediate_Dir "consound"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "consound"
# PROP Intermediate_Dir "consound"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D MYFLT=double /YX /FD /c
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /machine:I386

!ENDIF 

# Begin Target

# Name "consound - Win32 Release"
# Name "consound - Win32 Debug"
# Name "consound - Win32 Release64"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=..\csound\aifc.c
# End Source File
# Begin Source File

SOURCE=..\csound\Aiff.c
# End Source File
# Begin Source File

SOURCE=..\csound\aops.c
# End Source File
# Begin Source File

SOURCE=..\csound\argdecode.c
# End Source File
# Begin Source File

SOURCE=..\csound\Auxfd.c
# End Source File
# Begin Source File

SOURCE=..\csound\babo.c
# End Source File
# Begin Source File

SOURCE=..\csound\bbcut.c
# End Source File
# Begin Source File

SOURCE=..\csound\biquad.c
# End Source File
# Begin Source File

SOURCE=..\csound\bowedbar.c
# End Source File
# Begin Source File

SOURCE=..\csound\butter.c
# End Source File
# Begin Source File

SOURCE=..\csound\cmath.c
# End Source File
# Begin Source File

SOURCE=..\csound\Complex.c
# End Source File
# Begin Source File

SOURCE=..\csound\control.c
# End Source File
# Begin Source File

SOURCE=..\csound\Cross2.c
# End Source File
# Begin Source File

SOURCE=..\csound\Cscore.c
# End Source File
# Begin Source File

SOURCE=..\csound\cscorfns.c
# End Source File
# Begin Source File

SOURCE=..\csound\Cvanal.c
# End Source File
# Begin Source File

SOURCE=..\csound\Dam.c
# End Source File
# Begin Source File

SOURCE=..\csound\dcblockr.c
# End Source File
# Begin Source File

SOURCE=..\csound\Diskin.c
# End Source File
# Begin Source File

SOURCE=..\csound\Disprep.c
# End Source File
# Begin Source File

SOURCE=..\csound\dsputil.c
# End Source File
# Begin Source File

SOURCE=..\csound\Dumpf.c
# End Source File
# Begin Source File

SOURCE=..\csound\entry1.c
# End Source File
# Begin Source File

SOURCE=..\csound\entry2.c
# End Source File
# Begin Source File

SOURCE=..\csound\Express.c
# End Source File
# Begin Source File

SOURCE=..\csound\Extract.c
# End Source File
# Begin Source File

SOURCE=..\csound\Fft.c
# End Source File
# Begin Source File

SOURCE=..\csound\Fgens.c
# End Source File
# Begin Source File

SOURCE=..\csound\Filopen.c
# End Source File
# Begin Source File

SOURCE=..\csound\Filter.c
# End Source File
# Begin Source File

SOURCE=..\csound\flanger.c
# End Source File
# Begin Source File

SOURCE=..\csound\Fm4op.c
# End Source File
# Begin Source File

SOURCE=..\csound\Follow.c
# End Source File
# Begin Source File

SOURCE=..\csound\fout.c
# End Source File
# Begin Source File

SOURCE=..\csound\getstring.c
# End Source File
# Begin Source File

SOURCE=..\csound\Grain.c
# End Source File
# Begin Source File

SOURCE=..\csound\Grain4.c
# End Source File
# Begin Source File

SOURCE=..\csound\Hetro.c
# End Source File
# Begin Source File

SOURCE=..\csound\Hrtferx.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ieee80.c
# End Source File
# Begin Source File

SOURCE=..\csound\Insert.c
# End Source File
# Begin Source File

SOURCE=..\csound\linevent.c
# End Source File
# Begin Source File

SOURCE=..\csound\locsig.c
# End Source File
# Begin Source File

SOURCE=..\csound\lowpassr.c
# End Source File
# Begin Source File

SOURCE=..\csound\Lpanal.c
# End Source File
# Begin Source File

SOURCE=..\csound\Lptrkfns.c
# End Source File
# Begin Source File

SOURCE=..\csound\Main.c
# End Source File
# Begin Source File

SOURCE=..\csound\Mandolin.c
# End Source File
# Begin Source File

SOURCE=..\csound\Memalloc.c
# End Source File
# Begin Source File

SOURCE=..\csound\Memfiles.c
# End Source File
# Begin Source File

SOURCE=..\csound\Midiops.c
# End Source File
# Begin Source File

SOURCE=..\csound\Midiops2.c
# End Source File
# Begin Source File

SOURCE=..\csound\midiops3.c
# End Source File
# Begin Source File

SOURCE=..\csound\Midiout.c
# End Source File
# Begin Source File

SOURCE=..\csound\Midirecv.c
# End Source File
# Begin Source File

SOURCE=..\csound\Midisend.c
# End Source File
# Begin Source File

SOURCE=..\csound\Modal4.c
# End Source File
# Begin Source File

SOURCE=..\csound\moog1.c
# End Source File
# Begin Source File

SOURCE=..\csound\Musmon.c
# End Source File
# Begin Source File

SOURCE=..\csound\mxfft.c
# End Source File
# Begin Source File

SOURCE=..\csound\Nlfilt.c
# End Source File
# Begin Source File

SOURCE=..\csound\Oload.c
# End Source File
# Begin Source File

SOURCE=..\csound\one_file.c
# End Source File
# Begin Source File

SOURCE=..\csound\Opcode.c
# End Source File
# Begin Source File

SOURCE=..\csound\oscbnk.c
# End Source File
# Begin Source File

SOURCE=..\csound\oscils.c
# End Source File
# Begin Source File

SOURCE=..\csound\Otran.c
# End Source File
# Begin Source File

SOURCE=..\csound\phisem.c
# End Source File
# Begin Source File

SOURCE=..\csound\physmod.c
# End Source File
# Begin Source File

SOURCE=..\csound\physutil.c
# End Source File
# Begin Source File

SOURCE=..\csound\pitch.c
# End Source File
# Begin Source File

SOURCE=..\csound\Pluck.c
# End Source File
# Begin Source File

SOURCE=..\csound\pstream.c
# End Source File
# Begin Source File

SOURCE=..\csound\pvadd.c
# End Source File
# Begin Source File

SOURCE=..\csound\Pvanal.c
# End Source File
# Begin Source File

SOURCE=..\csound\pvfileio.c
# End Source File
# Begin Source File

SOURCE=..\csound\Pvinterp.c
# End Source File
# Begin Source File

SOURCE=..\csound\pvlook.c
# End Source File
# Begin Source File

SOURCE=..\csound\Pvoc.c
# End Source File
# Begin Source File

SOURCE=..\csound\pvocext.c
# End Source File
# Begin Source File

SOURCE=..\csound\Pvread.c
# End Source File
# Begin Source File

SOURCE=..\csound\pvsanal.c
# End Source File
# Begin Source File

SOURCE=..\csound\pvxanal.c
# End Source File
# Begin Source File

SOURCE=..\csound\Rdorch.c
# End Source File
# Begin Source File

SOURCE=..\csound\Rdscor.c
# End Source File
# Begin Source File

SOURCE=..\csound\Repluck.c
# End Source File
# Begin Source File

SOURCE=..\csound\rtwin32.c
# End Source File
# Begin Source File

SOURCE=..\csound\scansyn.c
# End Source File
# Begin Source File

SOURCE=..\csound\scansynx.c
# End Source File
# Begin Source File

SOURCE=..\csound\schedule.c
# End Source File
# Begin Source File

SOURCE=..\csound\Scot.c
# End Source File
# Begin Source File

SOURCE=..\csound\Scsort.c
# End Source File
# Begin Source File

SOURCE=..\csound\Scxtract.c
# End Source File
# Begin Source File

SOURCE="..\csound\sdif-mem.c"
# End Source File
# Begin Source File

SOURCE=..\csound\sdif.c
# End Source File
# Begin Source File

SOURCE=..\csound\Sfheader.c
# End Source File
# Begin Source File

SOURCE=..\csound\sfont.c
# End Source File
# Begin Source File

SOURCE=..\csound\shaker.c
# End Source File
# Begin Source File

SOURCE=..\csound\singwave.c
# End Source File
# Begin Source File

SOURCE=..\csound\Sndinfo.c
# End Source File
# Begin Source File

SOURCE=..\csound\sndinfUG.c
# End Source File
# Begin Source File

SOURCE=..\csound\Sndwarp.c
# End Source File
# Begin Source File

SOURCE=..\csound\Sort.c
# End Source File
# Begin Source File

SOURCE=..\csound\Soundin.c
# End Source File
# Begin Source File

SOURCE=..\csound\soundio.c
# End Source File
# Begin Source File

SOURCE=..\csound\space.c
# End Source File
# Begin Source File

SOURCE=..\csound\spat3d.c
# End Source File
# Begin Source File

SOURCE=..\csound\Spectra.c
# End Source File
# Begin Source File

SOURCE=..\csound\Sread.c
# End Source File
# Begin Source File

SOURCE=..\csound\Swrite.c
# End Source File
# Begin Source File

SOURCE=..\csound\Twarp.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens1.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens2.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens3.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens4.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens5.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens6.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens7.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens8.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugens9.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugensa.c
# End Source File
# Begin Source File

SOURCE=..\csound\uggab.c
# End Source File
# Begin Source File

SOURCE=..\csound\ugmoss.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugrw1.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ugrw2.c
# End Source File
# Begin Source File

SOURCE=..\csound\ugsc.c
# End Source File
# Begin Source File

SOURCE=..\csound\Ulaw.c
# End Source File
# Begin Source File

SOURCE=..\csound\vbap.c
# End Source File
# Begin Source File

SOURCE=..\csound\vbap_eight.c
# End Source File
# Begin Source File

SOURCE=..\csound\vbap_four.c
# End Source File
# Begin Source File

SOURCE=..\csound\vbap_sixteen.c
# End Source File
# Begin Source File

SOURCE=..\csound\vbap_zak.c
# End Source File
# Begin Source File

SOURCE=..\csound\Vdelay.c
# End Source File
# Begin Source File

SOURCE=..\csound\Vpvoc.c
# End Source File
# Begin Source File

SOURCE=..\csound\Wave.c
# End Source File
# Begin Source File

SOURCE=..\csound\Wavegde.c
# End Source File
# Begin Source File

SOURCE=..\csound\Winascii.c
# End Source File
# Begin Source File

SOURCE=..\csound\Windin.c
# End Source File
# Begin Source File

SOURCE=..\csound\Window.c
# End Source File
# Begin Source File

SOURCE=..\csound\wineps.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=..\csound\aiff.h
# End Source File
# Begin Source File

SOURCE=..\csound\aops.h
# End Source File
# Begin Source File

SOURCE=..\csound\biquad.h
# End Source File
# Begin Source File

SOURCE=..\csound\butter.h
# End Source File
# Begin Source File

SOURCE=..\csound\cmath.h
# End Source File
# Begin Source File

SOURCE=..\csound\complex.h
# End Source File
# Begin Source File

SOURCE=..\csound\cscore.h
# End Source File
# Begin Source File

SOURCE=..\csound\dam.h
# End Source File
# Begin Source File

SOURCE=..\csound\dcblockr.h
# End Source File
# Begin Source File

SOURCE=..\csound\diskin.h
# End Source File
# Begin Source File

SOURCE=..\csound\disprep.h
# End Source File
# Begin Source File

SOURCE=..\csound\dsputil.h
# End Source File
# Begin Source File

SOURCE=..\csound\dumpf.h
# End Source File
# Begin Source File

SOURCE=..\csound\fft.h
# End Source File
# Begin Source File

SOURCE=..\csound\filter.h
# End Source File
# Begin Source File

SOURCE=..\csound\flanger.h
# End Source File
# Begin Source File

SOURCE=..\csound\fm4op.h
# End Source File
# Begin Source File

SOURCE=..\csound\follow.h
# End Source File
# Begin Source File

SOURCE=..\csound\grain.h
# End Source File
# Begin Source File

SOURCE=..\csound\grain4.h
# End Source File
# Begin Source File

SOURCE=..\csound\hrtferx.h
# End Source File
# Begin Source File

SOURCE=..\csound\ieee80.h
# End Source File
# Begin Source File

SOURCE=..\csound\insert.h
# End Source File
# Begin Source File

SOURCE=..\csound\locsig.h
# End Source File
# Begin Source File

SOURCE=..\csound\lowpassr.h
# End Source File
# Begin Source File

SOURCE=..\csound\mandolin.h
# End Source File
# Begin Source File

SOURCE=..\csound\midiops.h
# End Source File
# Begin Source File

SOURCE=..\csound\midiops2.h
# End Source File
# Begin Source File

SOURCE=..\csound\midiops3.h
# End Source File
# Begin Source File

SOURCE=..\csound\midiout.h
# End Source File
# Begin Source File

SOURCE=..\csound\modal4.h
# End Source File
# Begin Source File

SOURCE=..\csound\moog1.h
# End Source File
# Begin Source File

SOURCE=..\csound\nlfilt.h
# End Source File
# Begin Source File

SOURCE=..\csound\oload.h
# End Source File
# Begin Source File

SOURCE=..\csound\physutil.h
# End Source File
# Begin Source File

SOURCE=..\csound\pluck.h
# End Source File
# Begin Source File

SOURCE=..\csound\pvadd.h
# End Source File
# Begin Source File

SOURCE=..\csound\pvinterp.h
# End Source File
# Begin Source File

SOURCE=..\csound\pvoc.h
# End Source File
# Begin Source File

SOURCE=..\csound\pvocext.h
# End Source File
# Begin Source File

SOURCE=..\csound\pvread.h
# End Source File
# Begin Source File

SOURCE=..\csound\repluck.h
# End Source File
# Begin Source File

SOURCE=..\csound\schedule.h
# End Source File
# Begin Source File

SOURCE=..\csound\scot.h
# End Source File
# Begin Source File

SOURCE=..\csound\sfheader.h
# End Source File
# Begin Source File

SOURCE=..\csound\shaker.h
# End Source File
# Begin Source File

SOURCE=..\csound\singwave.h
# End Source File
# Begin Source File

SOURCE=..\csound\sndwarp.h
# End Source File
# Begin Source File

SOURCE=..\csound\sort.h
# End Source File
# Begin Source File

SOURCE=..\csound\soundio.h
# End Source File
# Begin Source File

SOURCE=..\csound\space.h
# End Source File
# Begin Source File

SOURCE=..\csound\spectra.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens1.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens2.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens3.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens4.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens5.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens6.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens7.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens8.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugens9.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugensa.h
# End Source File
# Begin Source File

SOURCE=..\csound\uggab.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugrw1.h
# End Source File
# Begin Source File

SOURCE=..\csound\ugrw2.h
# End Source File
# Begin Source File

SOURCE=..\csound\vdelay.h
# End Source File
# Begin Source File

SOURCE=..\csound\vpvoc.h
# End Source File
# Begin Source File

SOURCE=..\csound\wave.h
# End Source File
# Begin Source File

SOURCE=..\csound\wavegde.h
# End Source File
# Begin Source File

SOURCE=..\csound\windin.h
# End Source File
# Begin Source File

SOURCE=..\csound\window.h
# End Source File
# Begin Source File

SOURCE=..\csound\winEPS.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
