# Microsoft Developer Studio Generated NMAKE File, Based on Csound.dsp
!IF "$(CFG)" == ""
CFG=Csound - Win32 Debug
!MESSAGE No configuration specified. Defaulting to Csound - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Csound - Win32 Release" && "$(CFG)" != "Csound - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
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
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Csound - Win32 Release"

OUTDIR=.\../../../lib
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../lib
# End Custom Macros

ALL : "$(OUTDIR)\Csound.lib"


CLEAN :
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\AIFF.OBJ"
	-@erase "$(INTDIR)\AOPS.OBJ"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\AUXFD.OBJ"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\bbcut.obj"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\BUTTER.OBJ"
	-@erase "$(INTDIR)\CMATH.OBJ"
	-@erase "$(INTDIR)\COMPLEX.OBJ"
	-@erase "$(INTDIR)\control.obj"
	-@erase "$(INTDIR)\CROSS2.OBJ"
	-@erase "$(INTDIR)\CSCORE.OBJ"
	-@erase "$(INTDIR)\CSCORFNS.OBJ"
	-@erase "$(INTDIR)\CSliders.obj"
	-@erase "$(INTDIR)\csound.obj"
	-@erase "$(INTDIR)\CVANAL.OBJ"
	-@erase "$(INTDIR)\CVDLG.OBJ"
	-@erase "$(INTDIR)\DAM.OBJ"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\DISKIN.OBJ"
	-@erase "$(INTDIR)\DISPREP.OBJ"
	-@erase "$(INTDIR)\DSPUTIL.OBJ"
	-@erase "$(INTDIR)\DUMPF.OBJ"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\EXPRESS.OBJ"
	-@erase "$(INTDIR)\EXTRACT.OBJ"
	-@erase "$(INTDIR)\FFT.OBJ"
	-@erase "$(INTDIR)\FGENS.OBJ"
	-@erase "$(INTDIR)\FILOPEN.OBJ"
	-@erase "$(INTDIR)\FILTER.OBJ"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\FM4OP.OBJ"
	-@erase "$(INTDIR)\FOLLOW.OBJ"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\GRAIN.OBJ"
	-@erase "$(INTDIR)\GRAIN4.OBJ"
	-@erase "$(INTDIR)\HETDLG.OBJ"
	-@erase "$(INTDIR)\HETRO.OBJ"
	-@erase "$(INTDIR)\HRTFERX.OBJ"
	-@erase "$(INTDIR)\IEEE80.OBJ"
	-@erase "$(INTDIR)\INSERT.OBJ"
	-@erase "$(INTDIR)\LINEVENT.OBJ"
	-@erase "$(INTDIR)\load_opcodes.obj"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\LPANAL.OBJ"
	-@erase "$(INTDIR)\LPCDLG.OBJ"
	-@erase "$(INTDIR)\LPTRKFNS.OBJ"
	-@erase "$(INTDIR)\MAIN.OBJ"
	-@erase "$(INTDIR)\MANDOLIN.OBJ"
	-@erase "$(INTDIR)\MEMALLOC.OBJ"
	-@erase "$(INTDIR)\MEMFILES.OBJ"
	-@erase "$(INTDIR)\MIDIOPS.OBJ"
	-@erase "$(INTDIR)\MIDIOPS2.OBJ"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\MIDIOUT.OBJ"
	-@erase "$(INTDIR)\MIDIRECV.OBJ"
	-@erase "$(INTDIR)\MIDISEND.OBJ"
	-@erase "$(INTDIR)\MODAL4.OBJ"
	-@erase "$(INTDIR)\MOOG1.OBJ"
	-@erase "$(INTDIR)\MUSMON.OBJ"
	-@erase "$(INTDIR)\mxfft.obj"
	-@erase "$(INTDIR)\NLFILT.OBJ"
	-@erase "$(INTDIR)\OLOAD.OBJ"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\OPCODE.OBJ"
	-@erase "$(INTDIR)\oscbnk.obj"
	-@erase "$(INTDIR)\oscils.obj"
	-@erase "$(INTDIR)\OTRAN.OBJ"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\PHYSMOD.OBJ"
	-@erase "$(INTDIR)\PHYSUTIL.OBJ"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\PLUCK.OBJ"
	-@erase "$(INTDIR)\pstream.obj"
	-@erase "$(INTDIR)\PVADD.OBJ"
	-@erase "$(INTDIR)\PVANAL.OBJ"
	-@erase "$(INTDIR)\PVDLG.OBJ"
	-@erase "$(INTDIR)\pvfileio.obj"
	-@erase "$(INTDIR)\PVINTERP.OBJ"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\Pvlookdlg.obj"
	-@erase "$(INTDIR)\PVOC.OBJ"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\PVREAD.OBJ"
	-@erase "$(INTDIR)\pvsanal.obj"
	-@erase "$(INTDIR)\pvxanal.obj"
	-@erase "$(INTDIR)\RDORCH.OBJ"
	-@erase "$(INTDIR)\RDSCOR.OBJ"
	-@erase "$(INTDIR)\REPLUCK.OBJ"
	-@erase "$(INTDIR)\rtwin32.obj"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansynx.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\SCOT.OBJ"
	-@erase "$(INTDIR)\SCSORT.OBJ"
	-@erase "$(INTDIR)\SCXTRACT.OBJ"
	-@erase "$(INTDIR)\sdif-mem.obj"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\SFHEADER.OBJ"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\SHAKER.OBJ"
	-@erase "$(INTDIR)\SINGWAVE.OBJ"
	-@erase "$(INTDIR)\SNDINFO.OBJ"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\SNDWARP.OBJ"
	-@erase "$(INTDIR)\SORT.OBJ"
	-@erase "$(INTDIR)\SOUNDIN.OBJ"
	-@erase "$(INTDIR)\SOUNDIO.OBJ"
	-@erase "$(INTDIR)\SPACE.OBJ"
	-@erase "$(INTDIR)\spat3d.obj"
	-@erase "$(INTDIR)\SPECTRA.OBJ"
	-@erase "$(INTDIR)\SREAD.OBJ"
	-@erase "$(INTDIR)\SWRITE.OBJ"
	-@erase "$(INTDIR)\TWARP.OBJ"
	-@erase "$(INTDIR)\UGENS1.OBJ"
	-@erase "$(INTDIR)\UGENS2.OBJ"
	-@erase "$(INTDIR)\UGENS3.OBJ"
	-@erase "$(INTDIR)\UGENS4.OBJ"
	-@erase "$(INTDIR)\UGENS5.OBJ"
	-@erase "$(INTDIR)\UGENS6.OBJ"
	-@erase "$(INTDIR)\UGENS7.OBJ"
	-@erase "$(INTDIR)\UGENS8.OBJ"
	-@erase "$(INTDIR)\UGENS9.OBJ"
	-@erase "$(INTDIR)\UGENSA.OBJ"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\UGRW1.OBJ"
	-@erase "$(INTDIR)\UGRW2.OBJ"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\ULAW.OBJ"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VDELAY.OBJ"
	-@erase "$(INTDIR)\VPVOC.OBJ"
	-@erase "$(INTDIR)\WAVE.OBJ"
	-@erase "$(INTDIR)\WAVEGDE.OBJ"
	-@erase "$(INTDIR)\WINASCII.OBJ"
	-@erase "$(INTDIR)\WINCWIN.OBJ"
	-@erase "$(INTDIR)\WINDIN.OBJ"
	-@erase "$(INTDIR)\WINDOW.OBJ"
	-@erase "$(INTDIR)\WINEPS.OBJ"
	-@erase "$(INTDIR)\WINSOUND.res"
	-@erase "$(OUTDIR)\Csound.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_LIB" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WINSOUND.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Csound.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Csound.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CSCORFNS.OBJ" \
	"$(INTDIR)\FILOPEN.OBJ" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\MAIN.OBJ" \
	"$(INTDIR)\MEMALLOC.OBJ" \
	"$(INTDIR)\MIDIRECV.OBJ" \
	"$(INTDIR)\MUSMON.OBJ" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\WINDOW.OBJ" \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\AIFF.OBJ" \
	"$(INTDIR)\AOPS.OBJ" \
	"$(INTDIR)\AUXFD.OBJ" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\bbcut.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\BUTTER.OBJ" \
	"$(INTDIR)\CMATH.OBJ" \
	"$(INTDIR)\COMPLEX.OBJ" \
	"$(INTDIR)\control.obj" \
	"$(INTDIR)\CROSS2.OBJ" \
	"$(INTDIR)\CSCORE.OBJ" \
	"$(INTDIR)\CSliders.obj" \
	"$(INTDIR)\csound.obj" \
	"$(INTDIR)\CVANAL.OBJ" \
	"$(INTDIR)\CVDLG.OBJ" \
	"$(INTDIR)\DAM.OBJ" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\DISKIN.OBJ" \
	"$(INTDIR)\DISPREP.OBJ" \
	"$(INTDIR)\DSPUTIL.OBJ" \
	"$(INTDIR)\DUMPF.OBJ" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\EXPRESS.OBJ" \
	"$(INTDIR)\EXTRACT.OBJ" \
	"$(INTDIR)\FFT.OBJ" \
	"$(INTDIR)\FILTER.OBJ" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\FM4OP.OBJ" \
	"$(INTDIR)\FOLLOW.OBJ" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\GRAIN.OBJ" \
	"$(INTDIR)\GRAIN4.OBJ" \
	"$(INTDIR)\HETDLG.OBJ" \
	"$(INTDIR)\HETRO.OBJ" \
	"$(INTDIR)\HRTFERX.OBJ" \
	"$(INTDIR)\IEEE80.OBJ" \
	"$(INTDIR)\INSERT.OBJ" \
	"$(INTDIR)\LINEVENT.OBJ" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\LPANAL.OBJ" \
	"$(INTDIR)\LPCDLG.OBJ" \
	"$(INTDIR)\LPTRKFNS.OBJ" \
	"$(INTDIR)\MANDOLIN.OBJ" \
	"$(INTDIR)\MEMFILES.OBJ" \
	"$(INTDIR)\MIDIOPS.OBJ" \
	"$(INTDIR)\MIDIOPS2.OBJ" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\MIDIOUT.OBJ" \
	"$(INTDIR)\MIDISEND.OBJ" \
	"$(INTDIR)\MODAL4.OBJ" \
	"$(INTDIR)\MOOG1.OBJ" \
	"$(INTDIR)\mxfft.obj" \
	"$(INTDIR)\NLFILT.OBJ" \
	"$(INTDIR)\OLOAD.OBJ" \
	"$(INTDIR)\OPCODE.OBJ" \
	"$(INTDIR)\oscbnk.obj" \
	"$(INTDIR)\OTRAN.OBJ" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\PHYSMOD.OBJ" \
	"$(INTDIR)\PHYSUTIL.OBJ" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\PLUCK.OBJ" \
	"$(INTDIR)\pstream.obj" \
	"$(INTDIR)\PVADD.OBJ" \
	"$(INTDIR)\PVANAL.OBJ" \
	"$(INTDIR)\PVDLG.OBJ" \
	"$(INTDIR)\pvfileio.obj" \
	"$(INTDIR)\PVINTERP.OBJ" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvlookdlg.obj" \
	"$(INTDIR)\PVOC.OBJ" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\PVREAD.OBJ" \
	"$(INTDIR)\pvsanal.obj" \
	"$(INTDIR)\pvxanal.obj" \
	"$(INTDIR)\RDORCH.OBJ" \
	"$(INTDIR)\RDSCOR.OBJ" \
	"$(INTDIR)\REPLUCK.OBJ" \
	"$(INTDIR)\rtwin32.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\scansynx.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\SCOT.OBJ" \
	"$(INTDIR)\SCSORT.OBJ" \
	"$(INTDIR)\SCXTRACT.OBJ" \
	"$(INTDIR)\sdif-mem.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\SFHEADER.OBJ" \
	"$(INTDIR)\SHAKER.OBJ" \
	"$(INTDIR)\SINGWAVE.OBJ" \
	"$(INTDIR)\SNDINFO.OBJ" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\SNDWARP.OBJ" \
	"$(INTDIR)\SORT.OBJ" \
	"$(INTDIR)\SOUNDIN.OBJ" \
	"$(INTDIR)\SOUNDIO.OBJ" \
	"$(INTDIR)\SPACE.OBJ" \
	"$(INTDIR)\spat3d.obj" \
	"$(INTDIR)\SPECTRA.OBJ" \
	"$(INTDIR)\SREAD.OBJ" \
	"$(INTDIR)\SWRITE.OBJ" \
	"$(INTDIR)\TWARP.OBJ" \
	"$(INTDIR)\UGENS1.OBJ" \
	"$(INTDIR)\UGENS2.OBJ" \
	"$(INTDIR)\UGENS3.OBJ" \
	"$(INTDIR)\UGENS4.OBJ" \
	"$(INTDIR)\UGENS5.OBJ" \
	"$(INTDIR)\UGENS6.OBJ" \
	"$(INTDIR)\UGENS7.OBJ" \
	"$(INTDIR)\UGENS8.OBJ" \
	"$(INTDIR)\UGENS9.OBJ" \
	"$(INTDIR)\UGENSA.OBJ" \
	"$(INTDIR)\uggab.obj" \
	"$(INTDIR)\ugmoss.obj" \
	"$(INTDIR)\UGRW1.OBJ" \
	"$(INTDIR)\UGRW2.OBJ" \
	"$(INTDIR)\ugsc.obj" \
	"$(INTDIR)\ULAW.OBJ" \
	"$(INTDIR)\vbap.obj" \
	"$(INTDIR)\vbap_eight.obj" \
	"$(INTDIR)\vbap_four.obj" \
	"$(INTDIR)\vbap_sixteen.obj" \
	"$(INTDIR)\vbap_zak.obj" \
	"$(INTDIR)\VDELAY.OBJ" \
	"$(INTDIR)\VPVOC.OBJ" \
	"$(INTDIR)\WAVE.OBJ" \
	"$(INTDIR)\WAVEGDE.OBJ" \
	"$(INTDIR)\WINASCII.OBJ" \
	"$(INTDIR)\WINCWIN.OBJ" \
	"$(INTDIR)\WINDIN.OBJ" \
	"$(INTDIR)\WINEPS.OBJ" \
	"$(INTDIR)\WINSOUND.res" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\FGENS.OBJ" \
	"$(INTDIR)\load_opcodes.obj" \
	"$(INTDIR)\oscils.obj"

"$(OUTDIR)\Csound.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Csound - Win32 Debug"

OUTDIR=.\../../../lib
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../lib
# End Custom Macros

ALL : "$(OUTDIR)\Csound.lib"


CLEAN :
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\AIFF.OBJ"
	-@erase "$(INTDIR)\AOPS.OBJ"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\AUXFD.OBJ"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\bbcut.obj"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\BUTTER.OBJ"
	-@erase "$(INTDIR)\CMATH.OBJ"
	-@erase "$(INTDIR)\COMPLEX.OBJ"
	-@erase "$(INTDIR)\control.obj"
	-@erase "$(INTDIR)\CROSS2.OBJ"
	-@erase "$(INTDIR)\CSCORE.OBJ"
	-@erase "$(INTDIR)\CSCORFNS.OBJ"
	-@erase "$(INTDIR)\CSliders.obj"
	-@erase "$(INTDIR)\csound.obj"
	-@erase "$(INTDIR)\CVANAL.OBJ"
	-@erase "$(INTDIR)\CVDLG.OBJ"
	-@erase "$(INTDIR)\DAM.OBJ"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\DISKIN.OBJ"
	-@erase "$(INTDIR)\DISPREP.OBJ"
	-@erase "$(INTDIR)\DSPUTIL.OBJ"
	-@erase "$(INTDIR)\DUMPF.OBJ"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\EXPRESS.OBJ"
	-@erase "$(INTDIR)\EXTRACT.OBJ"
	-@erase "$(INTDIR)\FFT.OBJ"
	-@erase "$(INTDIR)\FGENS.OBJ"
	-@erase "$(INTDIR)\FILOPEN.OBJ"
	-@erase "$(INTDIR)\FILTER.OBJ"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\FM4OP.OBJ"
	-@erase "$(INTDIR)\FOLLOW.OBJ"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\GRAIN.OBJ"
	-@erase "$(INTDIR)\GRAIN4.OBJ"
	-@erase "$(INTDIR)\HETDLG.OBJ"
	-@erase "$(INTDIR)\HETRO.OBJ"
	-@erase "$(INTDIR)\HRTFERX.OBJ"
	-@erase "$(INTDIR)\IEEE80.OBJ"
	-@erase "$(INTDIR)\INSERT.OBJ"
	-@erase "$(INTDIR)\LINEVENT.OBJ"
	-@erase "$(INTDIR)\load_opcodes.obj"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\LPANAL.OBJ"
	-@erase "$(INTDIR)\LPCDLG.OBJ"
	-@erase "$(INTDIR)\LPTRKFNS.OBJ"
	-@erase "$(INTDIR)\MAIN.OBJ"
	-@erase "$(INTDIR)\MANDOLIN.OBJ"
	-@erase "$(INTDIR)\MEMALLOC.OBJ"
	-@erase "$(INTDIR)\MEMFILES.OBJ"
	-@erase "$(INTDIR)\MIDIOPS.OBJ"
	-@erase "$(INTDIR)\MIDIOPS2.OBJ"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\MIDIOUT.OBJ"
	-@erase "$(INTDIR)\MIDIRECV.OBJ"
	-@erase "$(INTDIR)\MIDISEND.OBJ"
	-@erase "$(INTDIR)\MODAL4.OBJ"
	-@erase "$(INTDIR)\MOOG1.OBJ"
	-@erase "$(INTDIR)\MUSMON.OBJ"
	-@erase "$(INTDIR)\mxfft.obj"
	-@erase "$(INTDIR)\NLFILT.OBJ"
	-@erase "$(INTDIR)\OLOAD.OBJ"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\OPCODE.OBJ"
	-@erase "$(INTDIR)\oscbnk.obj"
	-@erase "$(INTDIR)\oscils.obj"
	-@erase "$(INTDIR)\OTRAN.OBJ"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\PHYSMOD.OBJ"
	-@erase "$(INTDIR)\PHYSUTIL.OBJ"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\PLUCK.OBJ"
	-@erase "$(INTDIR)\pstream.obj"
	-@erase "$(INTDIR)\PVADD.OBJ"
	-@erase "$(INTDIR)\PVANAL.OBJ"
	-@erase "$(INTDIR)\PVDLG.OBJ"
	-@erase "$(INTDIR)\pvfileio.obj"
	-@erase "$(INTDIR)\PVINTERP.OBJ"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\Pvlookdlg.obj"
	-@erase "$(INTDIR)\PVOC.OBJ"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\PVREAD.OBJ"
	-@erase "$(INTDIR)\pvsanal.obj"
	-@erase "$(INTDIR)\pvxanal.obj"
	-@erase "$(INTDIR)\RDORCH.OBJ"
	-@erase "$(INTDIR)\RDSCOR.OBJ"
	-@erase "$(INTDIR)\REPLUCK.OBJ"
	-@erase "$(INTDIR)\rtwin32.obj"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansynx.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\SCOT.OBJ"
	-@erase "$(INTDIR)\SCSORT.OBJ"
	-@erase "$(INTDIR)\SCXTRACT.OBJ"
	-@erase "$(INTDIR)\sdif-mem.obj"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\SFHEADER.OBJ"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\SHAKER.OBJ"
	-@erase "$(INTDIR)\SINGWAVE.OBJ"
	-@erase "$(INTDIR)\SNDINFO.OBJ"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\SNDWARP.OBJ"
	-@erase "$(INTDIR)\SORT.OBJ"
	-@erase "$(INTDIR)\SOUNDIN.OBJ"
	-@erase "$(INTDIR)\SOUNDIO.OBJ"
	-@erase "$(INTDIR)\SPACE.OBJ"
	-@erase "$(INTDIR)\spat3d.obj"
	-@erase "$(INTDIR)\SPECTRA.OBJ"
	-@erase "$(INTDIR)\SREAD.OBJ"
	-@erase "$(INTDIR)\SWRITE.OBJ"
	-@erase "$(INTDIR)\TWARP.OBJ"
	-@erase "$(INTDIR)\UGENS1.OBJ"
	-@erase "$(INTDIR)\UGENS2.OBJ"
	-@erase "$(INTDIR)\UGENS3.OBJ"
	-@erase "$(INTDIR)\UGENS4.OBJ"
	-@erase "$(INTDIR)\UGENS5.OBJ"
	-@erase "$(INTDIR)\UGENS6.OBJ"
	-@erase "$(INTDIR)\UGENS7.OBJ"
	-@erase "$(INTDIR)\UGENS8.OBJ"
	-@erase "$(INTDIR)\UGENS9.OBJ"
	-@erase "$(INTDIR)\UGENSA.OBJ"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\UGRW1.OBJ"
	-@erase "$(INTDIR)\UGRW2.OBJ"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\ULAW.OBJ"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VDELAY.OBJ"
	-@erase "$(INTDIR)\VPVOC.OBJ"
	-@erase "$(INTDIR)\WAVE.OBJ"
	-@erase "$(INTDIR)\WAVEGDE.OBJ"
	-@erase "$(INTDIR)\WINASCII.OBJ"
	-@erase "$(INTDIR)\WINCWIN.OBJ"
	-@erase "$(INTDIR)\WINDIN.OBJ"
	-@erase "$(INTDIR)\WINDOW.OBJ"
	-@erase "$(INTDIR)\WINEPS.OBJ"
	-@erase "$(INTDIR)\WINSOUND.res"
	-@erase "$(OUTDIR)\Csound.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I ".." /I "." /I "../." /D "_LIB" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WINSOUND.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Csound.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/out:"$(OUTDIR)\Csound.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CSCORFNS.OBJ" \
	"$(INTDIR)\FILOPEN.OBJ" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\MAIN.OBJ" \
	"$(INTDIR)\MEMALLOC.OBJ" \
	"$(INTDIR)\MIDIRECV.OBJ" \
	"$(INTDIR)\MUSMON.OBJ" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\WINDOW.OBJ" \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\AIFF.OBJ" \
	"$(INTDIR)\AOPS.OBJ" \
	"$(INTDIR)\AUXFD.OBJ" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\bbcut.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\BUTTER.OBJ" \
	"$(INTDIR)\CMATH.OBJ" \
	"$(INTDIR)\COMPLEX.OBJ" \
	"$(INTDIR)\control.obj" \
	"$(INTDIR)\CROSS2.OBJ" \
	"$(INTDIR)\CSCORE.OBJ" \
	"$(INTDIR)\CSliders.obj" \
	"$(INTDIR)\csound.obj" \
	"$(INTDIR)\CVANAL.OBJ" \
	"$(INTDIR)\CVDLG.OBJ" \
	"$(INTDIR)\DAM.OBJ" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\DISKIN.OBJ" \
	"$(INTDIR)\DISPREP.OBJ" \
	"$(INTDIR)\DSPUTIL.OBJ" \
	"$(INTDIR)\DUMPF.OBJ" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\EXPRESS.OBJ" \
	"$(INTDIR)\EXTRACT.OBJ" \
	"$(INTDIR)\FFT.OBJ" \
	"$(INTDIR)\FILTER.OBJ" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\FM4OP.OBJ" \
	"$(INTDIR)\FOLLOW.OBJ" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\GRAIN.OBJ" \
	"$(INTDIR)\GRAIN4.OBJ" \
	"$(INTDIR)\HETDLG.OBJ" \
	"$(INTDIR)\HETRO.OBJ" \
	"$(INTDIR)\HRTFERX.OBJ" \
	"$(INTDIR)\IEEE80.OBJ" \
	"$(INTDIR)\INSERT.OBJ" \
	"$(INTDIR)\LINEVENT.OBJ" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\LPANAL.OBJ" \
	"$(INTDIR)\LPCDLG.OBJ" \
	"$(INTDIR)\LPTRKFNS.OBJ" \
	"$(INTDIR)\MANDOLIN.OBJ" \
	"$(INTDIR)\MEMFILES.OBJ" \
	"$(INTDIR)\MIDIOPS.OBJ" \
	"$(INTDIR)\MIDIOPS2.OBJ" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\MIDIOUT.OBJ" \
	"$(INTDIR)\MIDISEND.OBJ" \
	"$(INTDIR)\MODAL4.OBJ" \
	"$(INTDIR)\MOOG1.OBJ" \
	"$(INTDIR)\mxfft.obj" \
	"$(INTDIR)\NLFILT.OBJ" \
	"$(INTDIR)\OLOAD.OBJ" \
	"$(INTDIR)\OPCODE.OBJ" \
	"$(INTDIR)\oscbnk.obj" \
	"$(INTDIR)\OTRAN.OBJ" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\PHYSMOD.OBJ" \
	"$(INTDIR)\PHYSUTIL.OBJ" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\PLUCK.OBJ" \
	"$(INTDIR)\pstream.obj" \
	"$(INTDIR)\PVADD.OBJ" \
	"$(INTDIR)\PVANAL.OBJ" \
	"$(INTDIR)\PVDLG.OBJ" \
	"$(INTDIR)\pvfileio.obj" \
	"$(INTDIR)\PVINTERP.OBJ" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvlookdlg.obj" \
	"$(INTDIR)\PVOC.OBJ" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\PVREAD.OBJ" \
	"$(INTDIR)\pvsanal.obj" \
	"$(INTDIR)\pvxanal.obj" \
	"$(INTDIR)\RDORCH.OBJ" \
	"$(INTDIR)\RDSCOR.OBJ" \
	"$(INTDIR)\REPLUCK.OBJ" \
	"$(INTDIR)\rtwin32.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\scansynx.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\SCOT.OBJ" \
	"$(INTDIR)\SCSORT.OBJ" \
	"$(INTDIR)\SCXTRACT.OBJ" \
	"$(INTDIR)\sdif-mem.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\SFHEADER.OBJ" \
	"$(INTDIR)\SHAKER.OBJ" \
	"$(INTDIR)\SINGWAVE.OBJ" \
	"$(INTDIR)\SNDINFO.OBJ" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\SNDWARP.OBJ" \
	"$(INTDIR)\SORT.OBJ" \
	"$(INTDIR)\SOUNDIN.OBJ" \
	"$(INTDIR)\SOUNDIO.OBJ" \
	"$(INTDIR)\SPACE.OBJ" \
	"$(INTDIR)\spat3d.obj" \
	"$(INTDIR)\SPECTRA.OBJ" \
	"$(INTDIR)\SREAD.OBJ" \
	"$(INTDIR)\SWRITE.OBJ" \
	"$(INTDIR)\TWARP.OBJ" \
	"$(INTDIR)\UGENS1.OBJ" \
	"$(INTDIR)\UGENS2.OBJ" \
	"$(INTDIR)\UGENS3.OBJ" \
	"$(INTDIR)\UGENS4.OBJ" \
	"$(INTDIR)\UGENS5.OBJ" \
	"$(INTDIR)\UGENS6.OBJ" \
	"$(INTDIR)\UGENS7.OBJ" \
	"$(INTDIR)\UGENS8.OBJ" \
	"$(INTDIR)\UGENS9.OBJ" \
	"$(INTDIR)\UGENSA.OBJ" \
	"$(INTDIR)\uggab.obj" \
	"$(INTDIR)\ugmoss.obj" \
	"$(INTDIR)\UGRW1.OBJ" \
	"$(INTDIR)\UGRW2.OBJ" \
	"$(INTDIR)\ugsc.obj" \
	"$(INTDIR)\ULAW.OBJ" \
	"$(INTDIR)\vbap.obj" \
	"$(INTDIR)\vbap_eight.obj" \
	"$(INTDIR)\vbap_four.obj" \
	"$(INTDIR)\vbap_sixteen.obj" \
	"$(INTDIR)\vbap_zak.obj" \
	"$(INTDIR)\VDELAY.OBJ" \
	"$(INTDIR)\VPVOC.OBJ" \
	"$(INTDIR)\WAVE.OBJ" \
	"$(INTDIR)\WAVEGDE.OBJ" \
	"$(INTDIR)\WINASCII.OBJ" \
	"$(INTDIR)\WINCWIN.OBJ" \
	"$(INTDIR)\WINDIN.OBJ" \
	"$(INTDIR)\WINEPS.OBJ" \
	"$(INTDIR)\WINSOUND.res" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\FGENS.OBJ" \
	"$(INTDIR)\load_opcodes.obj" \
	"$(INTDIR)\oscils.obj"

"$(OUTDIR)\Csound.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 

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


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Csound.dep")
!INCLUDE "Csound.dep"
!ELSE 
!MESSAGE Warning: cannot find "Csound.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Csound - Win32 Release" || "$(CFG)" == "Csound - Win32 Debug"
SOURCE=.\Modifications\load_opcodes.c

"$(INTDIR)\load_opcodes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\aifc.c

"$(INTDIR)\aifc.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\AIFF.C

"$(INTDIR)\AIFF.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\AOPS.C

"$(INTDIR)\AOPS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\argdecode.c

"$(INTDIR)\argdecode.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\AUXFD.C

"$(INTDIR)\AUXFD.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\babo.c

"$(INTDIR)\babo.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\bbcut.c

"$(INTDIR)\bbcut.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\biquad.c

"$(INTDIR)\biquad.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\bowedbar.c

"$(INTDIR)\bowedbar.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\BUTTER.C

"$(INTDIR)\BUTTER.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CMATH.C

"$(INTDIR)\CMATH.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\COMPLEX.C

"$(INTDIR)\COMPLEX.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\control.c

"$(INTDIR)\control.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CROSS2.C

"$(INTDIR)\CROSS2.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CSCORE.C

"$(INTDIR)\CSCORE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CSCORFNS.C

"$(INTDIR)\CSCORFNS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CSliders.cpp

"$(INTDIR)\CSliders.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\csound.c

"$(INTDIR)\csound.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CVANAL.C

"$(INTDIR)\CVANAL.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CVDLG.CPP

"$(INTDIR)\CVDLG.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DAM.C

"$(INTDIR)\DAM.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\dcblockr.c

"$(INTDIR)\dcblockr.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DISKIN.C

"$(INTDIR)\DISKIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DISPREP.C

"$(INTDIR)\DISPREP.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DSPUTIL.C

"$(INTDIR)\DSPUTIL.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\DUMPF.C

"$(INTDIR)\DUMPF.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\entry1.c

"$(INTDIR)\entry1.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\entry2.c

"$(INTDIR)\entry2.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\EXPRESS.C

"$(INTDIR)\EXPRESS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\EXTRACT.C

"$(INTDIR)\EXTRACT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FFT.C

"$(INTDIR)\FFT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FGENS.C

"$(INTDIR)\FGENS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FILOPEN.C

"$(INTDIR)\FILOPEN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FILTER.C

"$(INTDIR)\FILTER.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\flanger.c

"$(INTDIR)\flanger.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FM4OP.C

"$(INTDIR)\FM4OP.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\FOLLOW.C

"$(INTDIR)\FOLLOW.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\fout.c

"$(INTDIR)\fout.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\getstring.c

"$(INTDIR)\getstring.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\GRAIN.C

"$(INTDIR)\GRAIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\GRAIN4.C

"$(INTDIR)\GRAIN4.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\HETDLG.CPP

"$(INTDIR)\HETDLG.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\HETRO.C

"$(INTDIR)\HETRO.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\HRTFERX.C

"$(INTDIR)\HRTFERX.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\IEEE80.C

"$(INTDIR)\IEEE80.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\INSERT.C

"$(INTDIR)\INSERT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LINEVENT.C

"$(INTDIR)\LINEVENT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\locsig.c

"$(INTDIR)\locsig.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\lowpassr.c

"$(INTDIR)\lowpassr.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LPANAL.C

"$(INTDIR)\LPANAL.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LPCDLG.CPP

"$(INTDIR)\LPCDLG.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LPTRKFNS.C

"$(INTDIR)\LPTRKFNS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MAIN.C

"$(INTDIR)\MAIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MANDOLIN.C

"$(INTDIR)\MANDOLIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MEMALLOC.C

"$(INTDIR)\MEMALLOC.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MEMFILES.C

"$(INTDIR)\MEMFILES.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MIDIOPS.C

"$(INTDIR)\MIDIOPS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MIDIOPS2.C

"$(INTDIR)\MIDIOPS2.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\midiops3.c

"$(INTDIR)\midiops3.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MIDIOUT.C

"$(INTDIR)\MIDIOUT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MIDIRECV.C

"$(INTDIR)\MIDIRECV.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MIDISEND.C

"$(INTDIR)\MIDISEND.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MODAL4.C

"$(INTDIR)\MODAL4.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MOOG1.C

"$(INTDIR)\MOOG1.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MUSMON.C

"$(INTDIR)\MUSMON.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\mxfft.c

"$(INTDIR)\mxfft.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\NLFILT.C

"$(INTDIR)\NLFILT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\OLOAD.C

"$(INTDIR)\OLOAD.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\one_file.c

"$(INTDIR)\one_file.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\OPCODE.C

"$(INTDIR)\OPCODE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\oscbnk.c

"$(INTDIR)\oscbnk.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\oscils.c

"$(INTDIR)\oscils.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\OTRAN.C

"$(INTDIR)\OTRAN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\phisem.c

"$(INTDIR)\phisem.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PHYSMOD.C

"$(INTDIR)\PHYSMOD.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PHYSUTIL.C

"$(INTDIR)\PHYSUTIL.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pitch.c

"$(INTDIR)\pitch.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PLUCK.C

"$(INTDIR)\PLUCK.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pstream.c

"$(INTDIR)\pstream.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PVADD.C

"$(INTDIR)\PVADD.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PVANAL.C

"$(INTDIR)\PVANAL.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PVDLG.CPP

"$(INTDIR)\PVDLG.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pvfileio.c

"$(INTDIR)\pvfileio.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PVINTERP.C

"$(INTDIR)\PVINTERP.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pvlook.c

"$(INTDIR)\pvlook.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Pvlookdlg.cpp

"$(INTDIR)\Pvlookdlg.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PVOC.C

"$(INTDIR)\PVOC.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pvocext.c

"$(INTDIR)\pvocext.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\PVREAD.C

"$(INTDIR)\PVREAD.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pvsanal.c

"$(INTDIR)\pvsanal.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\pvxanal.c

"$(INTDIR)\pvxanal.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RDORCH.C

"$(INTDIR)\RDORCH.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\RDSCOR.C

"$(INTDIR)\RDSCOR.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\REPLUCK.C

"$(INTDIR)\REPLUCK.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\rtwin32.c

"$(INTDIR)\rtwin32.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\scansyn.c

"$(INTDIR)\scansyn.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\scansynx.c

"$(INTDIR)\scansynx.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\schedule.c

"$(INTDIR)\schedule.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SCOT.C

"$(INTDIR)\SCOT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SCSORT.C

"$(INTDIR)\SCSORT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SCXTRACT.C

"$(INTDIR)\SCXTRACT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=".\sdif-mem.c"

"$(INTDIR)\sdif-mem.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\sdif.c

"$(INTDIR)\sdif.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SFHEADER.C

"$(INTDIR)\SFHEADER.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\sfont.c

"$(INTDIR)\sfont.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SHAKER.C

"$(INTDIR)\SHAKER.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SINGWAVE.C

"$(INTDIR)\SINGWAVE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SNDINFO.C

"$(INTDIR)\SNDINFO.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\sndinfUG.c

"$(INTDIR)\sndinfUG.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SNDWARP.C

"$(INTDIR)\SNDWARP.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SORT.C

"$(INTDIR)\SORT.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SOUNDIN.C

"$(INTDIR)\SOUNDIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SOUNDIO.C

"$(INTDIR)\SOUNDIO.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SPACE.C

"$(INTDIR)\SPACE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\spat3d.c

"$(INTDIR)\spat3d.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SPECTRA.C

"$(INTDIR)\SPECTRA.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SREAD.C

"$(INTDIR)\SREAD.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SWRITE.C

"$(INTDIR)\SWRITE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\TWARP.C

"$(INTDIR)\TWARP.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS1.C

"$(INTDIR)\UGENS1.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS2.C

"$(INTDIR)\UGENS2.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS3.C

"$(INTDIR)\UGENS3.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS4.C

"$(INTDIR)\UGENS4.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS5.C

"$(INTDIR)\UGENS5.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS6.C

"$(INTDIR)\UGENS6.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS7.C

"$(INTDIR)\UGENS7.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS8.C

"$(INTDIR)\UGENS8.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENS9.C

"$(INTDIR)\UGENS9.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGENSA.C

"$(INTDIR)\UGENSA.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\uggab.c

"$(INTDIR)\uggab.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ugmoss.c

"$(INTDIR)\ugmoss.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGRW1.C

"$(INTDIR)\UGRW1.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UGRW2.C

"$(INTDIR)\UGRW2.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ugsc.c

"$(INTDIR)\ugsc.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ULAW.C

"$(INTDIR)\ULAW.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\vbap.c

"$(INTDIR)\vbap.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\vbap_eight.c

"$(INTDIR)\vbap_eight.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\vbap_four.c

"$(INTDIR)\vbap_four.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\vbap_sixteen.c

"$(INTDIR)\vbap_sixteen.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\vbap_zak.c

"$(INTDIR)\vbap_zak.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VDELAY.C

"$(INTDIR)\VDELAY.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VPVOC.C

"$(INTDIR)\VPVOC.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WAVE.C

"$(INTDIR)\WAVE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WAVEGDE.C

"$(INTDIR)\WAVEGDE.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WINASCII.C

"$(INTDIR)\WINASCII.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WINCWIN.C

"$(INTDIR)\WINCWIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WINDIN.C

"$(INTDIR)\WINDIN.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WINDOW.C

"$(INTDIR)\WINDOW.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WINEPS.C

"$(INTDIR)\WINEPS.OBJ" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WINSOUND.RC

"$(INTDIR)\WINSOUND.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

