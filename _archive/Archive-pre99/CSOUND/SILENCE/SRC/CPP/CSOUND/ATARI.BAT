set path=e:\lc\bin;d:\csound
set include=e:\lc\h;d:\csound
set lib=e:\lc\lib
set quad=d:\
set lc_opt=-M -dSYS5 -dSFIRCAM
lc.ttp -b1 -cau -fas -m0 -v main.c musmon.c otran.c oload.c rdorch.c
lc.ttp -b1 -cau -fas -m0 -v express.c rdscor.c linevent.c cscore.c
lc.ttp -b1 -cau -fas -m0 -v cscorfns.c insert.c entry.c aops.c midiops.c
lc.ttp -b1 -cau -fas -m0 -v midirecv.c fgens.c ugens1.c ugens2.c ugens3.c
lc.ttp -b1 -cau -fas -m0 -v ugens4.c ugens5.c ugens6.c ugens7.c ugens8.c
lc.ttp -b1 -cau -fas -m0 -v spectra.c disprep.c window.c winascii.c
lc.ttp -b1 -cau -fas -m0 -v hetro.c lpanal.c lptrkfns.c pvanal.c pvoc.c
lc.ttp -b1 -cau -fas -m0 -v fft.c dsputil.c sndinfo.c sfheader.c soundin.c
lc.ttp -b1 -cau -fas -m0 -v soundio.c ulaw.c aiff.c wave.c ieee80.c filopen.c
lc.ttp -b1 -cau -fas -m0 -v memalloc.c memfiles.c auxfd.c windin.c dumpf.c
lc.ttp -b1 -cau -fas -m0 -v scot.c scsort.c scxtract.c sread.c sort.c
lc.ttp -b1 -cau -fas -m0 -v extract.c twarp.c swrite.c follow.c aoscilx.c
lc.ttp -b1 -cau -fas -m0 -v ugens9.c butter.c grain.c vdelay.c cmath.c
lc.ttp -b1 -cau -fas -m0 -v cvanal.c grain4.c pvinterp.c pvread.c sndwarp.c
lc.ttp -b1 -cau -fas -m0 -v vpvoc.c hrtferX.c winEPS.c nlfilt.c opcode.c
lc.ttp -b1 -cau -fas -m0 -v ugrw1.c ugrw2.c ugensa.c cross2.c dam.c midiout.c
lc.ttp -b1 -cau -fas -m0 -v midiops2.c midisend.c wavegde.c filter.c 
lc.ttp -b1 -cau -fas -m0 -v complex.c repluck.c pluck.c physutil.c physmod.c
lc.ttp -b1 -cau -fas -m0 -v modal4.c shaker.c fm4op.c moog1.c singwave.c
lc.ttp -b1 -cau -fas -m0 -v mandolin.c

clink with csound.lnk

lc.ttp -b1 -cau -fas -m0 -v m_hetro.c
lc.ttp -b1 -cau -fas -m0 -v m_lpc.c
lc.ttp -b1 -cau -fas -m0 -v m_pvoc.c
lc.ttp -b1 -cau -fas -m0 -v xmain.c
lc.ttp -b1 -cau -fas -m0 -v smain.c
lc.ttp -b1 -cau -fas -m0 -v scale.c
lc.ttp -b1 -cau -fas -m0 -v m_info.c
lc.ttp -b1 -cau -fas -m0 -v m_cv.c
lc.ttp -b1 -cau -fas -m0 -v mixer.c

clink with hetro.lnk
clink with lpanal.lnk
clink with pvanal.lnk
clink with extract.lnk
clink with scsort.lnk
clink with scale.lnk
clink with sndinfo.lnk
clink with mixer.lnk
clink with cvanal.lnk
