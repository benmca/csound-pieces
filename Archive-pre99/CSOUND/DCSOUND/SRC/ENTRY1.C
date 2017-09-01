#include "cs.h"			/*			ENTRY.C		*/
#include "insert.h"
#include "aops.h"
#include "midiops.h"
#include "ugens1.h"
#include "ugens2.h"
#include "ugens3.h"
#include "ugens4.h"
#include "ugens5.h"
#include "ugens6.h"
#include "ugens7.h"
#include "dsputil.h"
#include "ugens8.h"
#include "ugens9.h"
#include "ugensa.h"
#include "cwindow.h"
#include "windin.h"
#include "spectra.h"
#include "disprep.h"
#include "soundio.h"
#include "dumpf.h"
#include "vdelay.h"
#include "follow.h"
#include "butter.h"
#include "grain.h"
#include "grain4.h"
#include "cmath.h"
#include "hrtferx.h"
#include "pvread.h"
#include "pvinterp.h"
#include "vpvoc.h"
#include "sndwarp.h"
#include "fhtfun.h"
#include "ugrw1.h"
#include "ugrw2.h"
#include "diskin.h"
#include "ftgen.h"
#include "oload.h"
#include "midiout.h"
#include "midiops2.h"
#include "midiops3.h"
#include "filter.h"
#include "pluck.h"
#include "wavegde.h"
#include "dam.h"
#include "pitch.h"

#include "pvadd.h"
#include "locsig.h"
#include "space.h"

#include "flanger.h"
#include "lowpassr.h"
#include "uggab.h"
#include "fout.h"
#include "biquad.h"
#include "ugsc.h"
#include "sndinfUG.h"
//#include "sf.h"
#include "sfont.h"


/*------- GAB INCLUDE -------------*/
//#include "gab_osc.h"

#include "fof3.h"		/* Gabriel Maldonado (gab-A1)*/
#include "Gab_osc.h"	/* Gabriel Maldonado (gab-A1)*/
//#include "flanger.h"	/* Gabriel Maldonado (gab-A1)*/

#include "foscili2.h"	/* Gabriel Maldonado (gab-A3)*/
#include "InstrCall.h"	/* Gabriel Maldonado (gab-A5)*/
//#include "fout.h"	/* Gabriel Maldonado (gab-A6)*/
//#include "foldover.h"	/* Gabriel Maldonado (gab-A6)*/ 
//#include "CpuPercent.h" 	/* Gabriel Maldonado (gab b3)*/ 
#include "out3D.h"  /* Gabriel Maldonado (gab c3)*/
//#include "sfont.h"
#include "vibrato.h"
//#include "spline.h"
#include "dashow.h"
#include "generative.h"
#include "picture.h"
#include "fractals.h"
#include "schedule.h"

#include "widgets.h"


#define S	sizeof

void	ihold(void*), turnoff(void*);
void	assign(void*), rassign(void*), aassign(void*);
void	init(void*), ainit(void*), flwset(void*), follow(void*);
void	envset(void*), envext(void*);
void	gt(void*), ge(void*), lt(void*), le(void*), eq(void*), ne(void*);
void	and(void*), or(void*), conval(void*), aconval(void*);
void	addkk(void*), subkk(void*), mulkk(void*), divkk(void*), modkk(void*);
void	addka(void*), subka(void*), mulka(void*), divka(void*), modka(void*);
void	addak(void*), subak(void*), mulak(void*), divak(void*), modak(void*);
void	addaa(void*), subaa(void*), mulaa(void*), divaa(void*), modaa(void*);
void	divzkk(void*), divzka(void*), divzak(void*), divzaa(void*);
void	int1(void*), frac1(void*), rnd1(void*), birnd1(void*);
void	abs1(void*), exp01(void*), log01(void*), sqrt1(void*);
void	sin1(void*), cos1(void*), tan1(void*), asin1(void*), acos1(void*);
void	atan1(void*), sinh1(void*), cosh1(void*), tanh1(void*), log101(void*);
void    atan21(void*), atan2aa(void*);
void	absa(void*), expa(void*), loga(void*), sqrta(void*);
void	sina(void*), cosa(void*), tana(void*), asina(void*), acosa(void*);
void	atana(void*), sinha(void*), cosha(void*), tanha(void*), log10a(void*);
void	dbamp(void*), ampdb(void*), aampdb(void*);
void	dbfsamp(void*), ampdbfs(void*), aampdbfs(void*);
void	ftlen(void*), ftlptim(void*), rtclock(void*);
void	cpsoct(void*), octpch(void*), cpspch(void*);
void	pchoct(void*), octcps(void*), acpsoct(void*);
void	massign(void*), ctrlinit(void*), notnum(void*), veloc(void*);
void	pchmidi(void*), pchmidib(void*), octmidi(void*), octmidib(void*);
void	pchmidib_i(void*), octmidib_i(void*), icpsmidib_i(void*);
void	cpsmidi(void*), icpsmidib(void*), kcpsmidib(void*), kmbset(void*);
void	midibset(void*), ipchmidib(void*), ioctmidib(void*);
void    kpchmidib(void*), koctmidib(void*), msclset(void*);
void	ampmidi(void*), aftset(void*), aftouch(void*), chpress(void*);
void    ipchbend(void*), kbndset(void*), kpchbend(void*);
void	imidictl(void*), mctlset(void*), midictl(void*);
void    ichanctl(void*), chctlset(void*), chanctl(void*), turnon(void*);
void    kmapset(void*), polyaft(void*), ichanctl(void*), chctlset(void*);
void	chanctl(void*), ftgen(void*), linset(void*), kline(void*), aline(void*);
void	expset(void*), kexpon(void*), expon(void*);
void	lsgset(void*), klnseg(void*), linseg(void*), madsrset(void*);
void	adsrset(void*), xdsrset(void*), mxdsrset(void*), expseg2(void*);
void	xsgset(void*), kxpseg(void*), expseg(void*), xsgset2(void*);
void    lsgrset(void*), klnsegr(void*), linsegr(void*);
void    xsgrset(void*), kxpsegr(void*), expsegr(void*);
void	lnnset(void*), klinen(void*), linen(void*);
void	lnrset(void*), klinenr(void*), linenr(void*);
void	evxset(void*), knvlpx(void*), envlpx(void*);
void	evrset(void*), knvlpxr(void*), envlpxr(void*);
void	phsset(void*), kphsor(void*), phsor(void*);
void	itablew1(void*),itablegpw1(void*),itablemix1(void*),itablecopy1(void*);
void	itable(void*), itabli(void*), itabl3(void*), tabl3(void*), ktabl3(void*);
void	tblset(void*), ktable(void*), ktabli(void*), tabli(void*);
void    tablefn(void*);
void	tblsetkt(void*), ktablekt(void*), tablekt(void*), ktablikt(void*);
void	tablikt(void*), ko1set(void*), kosc1(void*),  kosc1i(void*);
void    oscnset(void*), osciln(void*);
void	oscset(void*), koscil(void*), osckk(void*), oscka(void*), oscak(void*);
void	oscaa(void*), koscli(void*), osckki(void*), osckai(void*);
void	oscaki(void*), oscaai(void*), foscset(void*), foscil(void*);
void	foscili(void*), losset(void*), loscil(void*), loscil3(void*);
void	koscl3(void*), osckk3(void*), oscka3(void*), oscak3(void*);
void    oscaa3(void*);
void	adset(void*), adsyn(void*);
void	fofset(void*), fofset2(void*), fof(void*), pvset(void*), pvoc(void*);
void	pvaddset(void*), pvadd(void*);
void	fogset(void*), fog(void*); /*JMC*/
/* void	variset(void*), vari(void*);  JMC*/
void	harmset(void*), harmon(void*);
void	bzzset(void*), buzz(void*);
void	gbzset(void*), gbuzz(void*);
void	plukset(void*), pluck(void*);
void	rndset(void*), krand(void*), arand(void*);
void	rhset(void*), krandh(void*), randh(void*);
void	riset(void*), krandi(void*), randi(void*);
void	rndset2(void*), krand2(void*), arand2(void*);
void	rhset2(void*), krandh2(void*), randh2(void*);
void	riset2(void*), krandi2(void*), randi2(void*);
void	porset(void*), port(void*);
void	tonset(void*), tone(void*), atone(void*);
void	rsnset(void*), reson(void*), areson(void*);
void    resonx(void*), aresonx(void*), rsnsetx(void*);
void    tonex(void*),  atonex(void*), tonsetx(void*);
void	lprdset(void*), lpread(void*), lprsnset(void*), lpreson(void*);
void	lpfrsnset(void*), lpfreson(void*);
void    lpslotset(void*) ;
void    lpitpset(void*),lpinterpol(void*) ;
void	rmsset(void*), rms(void*), gainset(void*), gain(void*);
void	balnset(void*), balance(void*);
void	downset(void*), downsamp(void*), upsamp(void*);
void	indfset(void*), interp(void*), kntegrate(void*), integrate(void*);
void	kdiff(void*), diff(void*);
void	samphset(void*), ksmphold(void*), samphold(void*);
void	delset(void*),  delay(void*),  del1set(void*), delay1(void*);
void	delrset(void*), delayr(void*), delwset(void*), delayw(void*);
void	tapset(void*), deltap(void*), deltapi(void*), deltapn(void*), deltap3(void*);
void	cmbset(void*), comb(void*), alpass(void*), rvbset(void*), reverb(void*);
void	panset(void*), pan(void*), sndinset(void*), soundin(void*);
void    sndo1set(void*), soundout(void*), sndo2set(void*), soundouts(void*);
void	in(void*),  ins(void*), inq(void*), inh(void*),  ino(void*), in16(void*);
void	in32(void*), inall(void*), inz(void*);
void	out(void*),  outs(void*), outs1(void*), outs2(void*), outall(void*);
void	outq(void*), outq1(void*), outq2(void*), outq3(void*), outq4(void*);
void	outh(void*), outo(void*), outx(void*), outX(void*), outch(void*);
void	outz(void*), igoto(void*), kgoto(void*), icgoto(void*), kcgoto(void*);
void	timset(void*), timout(void*);
void	reinit(void*), rigoto(void*), rireturn(void*);
void	tigoto(void*), tival(void*);
void	printv(void*), dspset(void*), kdsplay(void*), dsplay(void*);
void	fftset(void*), kdspfft(void*), dspfft(void*);
void	spectset(void*), spectrum(void*);
void	spadmset(void*), specaddm(void*), spdifset(void*), specdiff(void*);
void	spsclset(void*), specscal(void*), sphstset(void*), spechist(void*);
void	spfilset(void*), specfilt(void*);
void	sptrkset(void*), specptrk(void*), spsumset(void*), specsum(void*);
void	spdspset(void*), specdisp(void*);

void	xyinset(void*), xyin(void*), tempeset(void*), tempest(void*);
void	tempset(void*), tempo(void*);
void    old_kdmpset(void*), old_kdmp2set(void*),
        old_kdmp3set(void*), old_kdmp4set(void*);
void    kdmpset(void*), kdmp2set(void*), kdmp3set(void*), kdmp4set(void*);
void    kdump(void*), kdump2(void*), kdump3(void*), kdump4(void*);
void    krdset(void*), krd2set(void*), krd3set(void*), krd4set(void*);
void    kread(void*), kread2(void*), kread3(void*), kread4(void*);

void    butset(void*), bbutset(void*), hibut(void*), lobut(void*);
void	bpbut(void*), bcbut(void*), butter_filter(void*);
void    vdelset(void*), vdelay(void*), vdelay3(void*);
void    vdelxset(void*), vdelxsset(void*), vdelxqset(void*);
void    vdelayx(void*), vdelayxs(void*), vdelayxq(void*);
void    vdelayxw(void*), vdelayxws(void*), vdelayxwq(void*);
void	multitap_set(void*), multitap_play(void*);
void    agsset(void*), ags(void*);
void    ipow(void*), kpow(void*), apow(void*), alinear(void*), iklinear(void*);
void	atrian(void*), iktrian(void*), aexp(void*);
void	ikexp(void*), abiexp(void*), ikbiexp(void*), agaus(void*), ikgaus(void*);
void	acauchy(void*), ikcauchy(void*), apcauchy(void*), ikpcauchy(void*);
void	abeta(void*), ikbeta(void*), aweib(void*), ikweib(void*), apoiss(void*);
void	ikpoiss(void*), seedrand(void*);

void	cvset(void*), convolve(void*), grainsetv4(void*), graingenv4(void*);
void    cpsxpch(void*), cps2pch(void*), hrtferxk(void*), hrtferxkSet(void *);
void	tblesegset(void*), ktableseg(void*), ktablexseg(void*);
void	vpvset(void*), vpvoc(void*);
void 	pvreadset(void*), pvread(void*), sndwarpgetset(void*), sndwarp(void*);
void	sndwarpstset(void*), sndwarpst(void*), pvcrossset(void*), pvcross(void*);
void	pvbufreadset(void*), pvbufread(void*);
void	pvinterpset(void*), pvinterp(void*);
void	nlfiltset(void*), nlfilt(void*), Xsynth(void*), Xsynthset(void*);
void	auniform(void*), ikuniform(void*);
void	tblsetw(void*), ktablew(void*), tablew(void*), itablew(void*);
void	tblsetwkt(void*), ktablewkt(void*), tablewkt(void*);
void	tableng(void*), itableng(void*), tablegpw(void*), itablegpw(void*);
void	tablemixset(void*), tablemix(void*), itablemix(void*);
void	tablecopyset(void*), tablecopy(void*), itablecopy(void*);
void	tableraset(void*), tablera(void*), tablewaset(void*), tablewa(void*);
void	zakinit(void*);
void	zkset(void*), zir(void*), zkr(void*), ziw(void*), zkw(void*);
void	ziwm(void*), zkwm(void*), zkmod(void*), zkcl(void*);
void	zaset(void*), zar(void*), zarg(void*), zaw(void*);
void	zawm(void*), zamod(void*), zacl(void*);
void	timek(void*), timesr(void*);
void	instimset(void*), instimset1(void*), instimek(void*), instimes(void*);
void	printkset(void*), printk(void*), printksset(void*), printks(void*);
void	printk2set(void*), printk2(void*), peakk(void*), peaka(void*);
void 	kporset(void*), kport(void*);
void	ktonset(void*), ktone(void*), katone(void*);
void	krsnset(void*), kreson(void*), kareson(void*);
void	limitset(void*), klimit(void*), limit(void*);
void	newsndinset(void*), soundinew(void*);
void    daminit(void *), dam(void*);
void	iout_on(void*), iout_off(void*), out_controller(void*);
void    iout_on_dur_set(void*), iout_on_dur(void*),iout_on_dur2(void*);
void    moscil_set(void*), moscil(void*);
void    kvar_out_on_set(void*), kvar_out_on_set1(void*), kvar_out_on(void*);
void    out_controller14(void*), out_pitch_bend(void*);
void    out_aftertouch(void*), out_poly_aftertouch(void*);
void	out_progchange(void*);
void    release_set(void*), release(void*), xtratim(void*);
void    mclock_set(void*), mclock(void*), mrtmsg(void*);
void    imidic7(void*),  midic7set(void*),  midic7(void*);
void    imidic14(void*), midic14set(void*), midic14(void*);
void    imidic21(void*), midic21set(void*), midic21(void*);
void	ictrl7(void*), ctrl7set(void*), ctrl7(void*);
void	ictrl14(void*), ctrl14set(void*), ctrl14(void*);
void	ictrl21(void*), ctrl21set(void*), ctrl21(void*);
void	initc7(void*), initc14(void*), initc21(void*);
void    wgpset(void*), wgpsetin(void*), wgpluck(void*);
void    pluckPluck(void*), pluckGetSamps(void*);
void    ifilter(void*), kfilter(void*), afilter(void*);
void    izfilter(void*), azfilter(void*);
void	clarinset(void*), clarin(void*), fluteset(void*), flute(void*);
void	bowedset(void*), bowed(void*), marimbaset(void*), marimba(void*);
void	bowedbarset(void*), bowedbar(void*);
void	brassset(void *), brass(void*), vibraphnset(void*), vibraphn(void*);
void	agogobelset(void*), agogobel(void*), shakerset(void*), shaker(void*);
void	agogobelset1(void*);
void	cabasaset(void*), cabasa(void*), sekereset(void*), sandset(void*);
void	stixset(void*), crunchset(void*), guiroset(void*), guiro(void*);
void	sekere(void*), tambourset(void*), tambourine(void*), bambooset(void*);
void	bamboo(void*), wuterset(void*), wuter(void*), sleighset(void*), sleighbells(void*);
void	tubebellset(void*), tubebell(void*);
void	rhodeset(void*), wurleyset(void*), wurley(void*);
void	heavymetset(void*), heavymet(void*), b3set(void*), hammondB3(void*);
void	FMVoiceset(void*), FMVoice(void*), percfluteset(void*), percflute(void*);
void	Moog1set(void*), Moog1(void*), voicformset(void*), voicform(void*);
void	mandolinset(void*), mandolin(void*);

void	locsigset(void*), locsig(void*),locsendset(void*), locsend(void*);
void    spaceset(void*), space(void*), spsendset(void*), spsend(void*);
void    spdistset(void*), spdist(void*);
void    dcblockrset(void*), dcblockr(void*);
void	flanger_set(void*), flanger(void*), wguide1set(void*), wguide1(void*);
void    wguide2set(void*), wguide2(void*);
void    lowpr(void *), lowpr_set(void *), lowpr_setx(void *), lowprx(void *);
void    lowpr_w_sep_set(void *), lowpr_w_sep(void *);
void    kwrap(void*), wrap(void*), cpstmid(void *);
void    mirrorset(void*), kmirror(void*), mirror(void*);
void    interpol(void*), nterpol_init(void*), knterpol(void*), anterpol(void*);
void    fold_set(void *), fold(void *);
void	trig_set(void*), trig(void*), numsamp(void*), ftsr(void*);
void    midiin(void *), midiout(void *), kon2_set(void *), kon2(void *);
void    nrpn(void *), mdelay(void *), mdelay_set(void *);
#if defined(CWIN) || defined(TCLTK)
void	cntrl_set(void*), control(void*), ocontrol(void*);
void	button_set(void*), button(void*), check_set(void*), check(void*);
#endif
void    biquadset(void*), biquad(void*);
void    moogvcfset(void*), moogvcf(void*);
void    rezzyset(void*), rezzy(void*);
void    distort(void*);
void    vcoset(void*), vco(void*), tbvcfset(void*), tbvcf(void*);
void    planetset(void*), planet(void*);
void    pareqset(void*), pareq(void*);
void	schedule(void*), schedwatch(void*);
void	ifschedule(void*), kschedule(void*);
void    triginset(void *p), ktriginstr(void *p);
void    trigseq_set(void*), trigseq(void*), seqtim_set(void*), seqtim(void*); 
void	lfoset(void*), lfok(void*), lfoa(void*);
void	stresonset(void*), streson(void*);

void    slider_i8(void*), slider8(void*), slider_i16(void*), slider16(void*);
void    slider_i32(void*), slider32(void*), slider_i64(void*);
void	slider64(void*), slider_i8f(void*), slider8f(void*);
void	slider_i16f(void*), slider16f(void*), slider_i32f(void*);
void	slider32f(void*), slider_i64f(void*), slider64f(void*);
void	slider_i16bit14(void*), slider16bit14(void*), islider8(void*);
void	islider16(void*), islider32(void*), islider64(void*);
void	slider_i32bit14(void*), slider32bit14(void*);
void	islider16bit14(void*), islider32bit14(void*);
void	sum(void*), product(void*), macset(void*), mac(void*), maca(void*);
void    posc_set(void*), kposc(void*), posc(void*), kposc3(void*), posc3(void*);
void    lposc_set(void*), lposc(void*), lposc3(void*);
void    nestedapset(void*), nestedap(void*);
void    lorenzset(void*), lorenz(void*);
void    svfset(void*), svf(void*);
void    hilbertset(void*), hilbert(void*);
void	resonzset(void*), resonr(void*), resonz(void*);
void    resony(void *), rsnsety(void *);
void    outfile_set(void *), outfile (void *), incr (void *), incr_set(void *);
void    clear(void *),clear_set(void *), sum(void *);
void    koutfile_set(void *), koutfile (void *);
void    ioutfile_set(void *), fiopen(void *), ioutfile_set_r(void *);
void    ioutfile_r(void *), infile_set(void *), infile (void *);
void    kinfile_set(void *), kinfile (void *), i_infile(void *);
void    filelen(void *), filenchnls(void *), filesr(void *), filepeak(void *);
void    ipowoftwo(void *), ilogbasetwo(void *);
void    powoftwo_set(void *), logbasetwo_set(void *), powoftwoa(void *);
void    powoftwo(void *), powoftwoa(void *);
void	logbasetwo(void *), logbasetwoa(void *);
void    cpuperc(void *), maxalloc(void *), prealloc(void *);
void    nlalp_set(void*), nlalp(void*);
void	hsboscset(void*), hsboscil(void*);
void    adsyntset(void*), adsynt(void*);
void	phsbnkset(void*), kphsorbnk(void*), phsorbnk(void*);
void    lp2_set(void*), lp2(void*);
void	phaser2set(void*), phaser2(void*);
void	phaser1set(void*), phaser1(void*);
void	SfLoad(void*), SfPreset(void*), SfPlay_set(void*), SfPlay(void*);
void	SfPlayMono_set(void*), SfPlayMono(void*), Sfplist(void*), Sfilist(void*);
void	SfAssignAllPresets(void*), SfInstrPlayMono_set(void*);
void	SfInstrPlayMono(void*), SfInstrPlay_set(void*), SfInstrPlay(void*);
void    SfInstrPlay3(void*), SfPlay3(void*);
void    SfPlayMono3(void*);
void    SfInstrPlayMono3(void*), SfInstrPlay3(void*);
/*---------- GAB OPCODES ----------*/
void posc_set(void *), poscaa(void *), poscak(void *), poscka(void *), posckk(void *), kposc(void *);
void lposcint(void *);
void lsgset_old(void *), klnseg_old(void *), linseg_old(void *);
void  ftlen2(void*);
void  loscil2(void*), losset2(void*);
void  fofset3(void*), fof3(void*), numsamp(void*),ftsr(void*);
void  printk2(void*), printk2set(void*);
void foscset2(void *),foscili2(void *);
void icall(void *),dicall_set(void *),dicall(void *),micall_set(void *);
void micall(void *), dmicall_set(void *),dmicall(void *);
void kargc_set(void *), kargc(void *), kargt_set(void *), kargt(void *);
void argc_set(void *), argc(void *), argt_set(void *), argt(void *);
void artrnc_set(void *), artrnc(void *), artrnt_set(void *), artrnt(void *);
void krtrnc_set(void *), krtrnc(void *), krtrnt_set(void *), krtrnt(void *);
void fastab_set(void *), fastabi(void *), fastabk(void *), fastab(void *);
void fastabiw(void *), fastabkw(void *), fastabw(void *);
void out3d(void*), init3d(void*), o3dpos(void*), out3d_set(void*);
void o3dmindist(void*), o3dmaxdist(void*), o3dconeang(void*);
void o3dconeorient(void*), o3dconevolume(void*), o3dmode(void*);
void list_pos(void*), list_or(void*), list_rolloff(void*), list_distance(void*);
void dsSetDeferredFlag(void*), dsCommitDeferred(void*), eaxListEnvir(void*);
void eaxListEnvirSize(void*),eaxListEnvirDiffusion(void*),eaxListRoom(void*);
void eaxListRoomHF(void*),eaxListDecayTime(void*);
void eaxListDecayTimeHF(void*),eaxListReflec(void*),eaxListReflecDel(void*);
void eaxListReverb(void*),eaxListReverbDel(void*);
void eaxListRoomRolloff(void*),eaxListAirAbsHF(void*), eaxListAll(void*),eaxListFlags(void*);
void o3dsetAll(void*),list_setAll(void*);
void eaxSoDirect(void*), eaxSoDirectHF(void*), eaxSoRoom(void*),eaxSoRoomHF(void*);
void eaxSoObstruct(void*),eaxSoObstructRatio(void*);
void eaxSoOccl(void*),eaxSoOcclRatio(void*),eaxSoOcclRoom(void*);
void eaxSoRolloff(void*),eaxSoAirAbs(void*), init_eax(void*);
void eaxSoOutVol(void*),eaxSoAll(void*),eaxSoFlags(void*);
void loopseg_set(void*),	loopseg(void*), lpshold(void*);
void ikRangeRand(void*), aRangeRand(void*);
void randomi_set(void*), krandomi(void*), randomi(void*);
void randomh_set(void*), krandomh(void*), randomh(void*);
void random3_set(void*), random3(void*),random3a(void*);
void semitone(void*), isemitone(void*), semitone_a(void*), cent(void*), icent(void*),cent_a(void*),db(void*),idb(void*),db_a(void*);
void jitter2_set(void*), jitter2(void*),jitter_set(void*), jitter(void*),jitters_set(void*), jitters(void*), jittersa(void*);
void vibrato_set(void*), vibrato(void*),vibr_set(void*), vibr(void*);
void  krsnsetx(void*), kresonx(void*);
void ikDiscreteUserRand(void*), aDiscreteUserRand(void*);
void ikContinuousUserRand(void*), aContinuousUserRand(void*);
void mtable_set(void*),  mtable_k(void*),mtable_a(void*), mtable_i(void*); 
void mtablew_set(void*), mtablew_k(void*), mtablew_i(void*),  mtablew_a(void*);


void mtab_set(void*), mtab_k(void*), mtab_set(void*),  mtab_a(void*),  mtabw_i(void*);
void mtab_i (void*), mtabw_set(void*), mtabw_k(void*),  mtabw_a(void*),trigcall(void*) ;

void dashow (void*);

void poscils_set(void*), kposcils(void*), poscilsa(void*); 
void test_set(void*), test(void*);
void schedk(void*), schedk_i(void*);
void lineto_set(void*), lineto(void*), tlineto_set(void*),tlineto(void*);
void bmopen(void*), bmtable_set(void*), bmtable(void*), bmtablei(void*);
void bmoscil_set(void*), bmoscil(void*), bmoscili(void*), rgb2hsvl(void*); 
void metro_set(void*), metro(void*),  bmscan_set(void*),   bmscan(void*), bmscani(void*) ;
void mandel_set(void*), mandel(void*),cpstun(void*),cpstun_i(void*);
void vectorOp_set(void*), vadd(void*), vmult(void*), vpow(void*), vexp(void*);
void vectorOp_set(void*),vadd(void*),vmult(void*),vpow(void*),vexp(void*);
void vectorsOp_set(void*),vcopy(void*),vaddv(void*),vsubv(void*),vmultv(void*),vdivv(void*),vpowv(void*),vexpv(void*);
void vlimit_set(void*),vlimit(void*),vwrap(void*),vmirror(void*);
void vseg_set(void*), vlinseg(void*), vexpseg(void*); 
void vrandh_set(void*), vrandh(void*), vrandi_set(void*), vrandi(void*);
void ca_set(void*),  ca(void*), vport_set(void*),  vport(void*) ;
void kdel_set(void*),  kdelay(void*),vecdly_set(void*),  vecdly(void*), vmap(void*);
void seqtim2_set(void*), seqtim2(void*), adsynt2_set(void*), adsynt2(void*) ; 

void fl_slider(void*), StartPanel(void*), EndPanel(void*), FL_run(void*);
void fl_widget_color(void*), fl_knob(void*),fl_roller(void*), fl_text(void*);
void fl_value(void*), StartScroll(void*), EndScroll(void*);
void StartPack(void*), EndPack(void*), fl_widget_label(void*),fl_setWidgetValuei(void*),fl_setWidgetValue(void*);
void fl_update(void*), StartGroup(void*), EndGroup(void*), StartTabs(void*), EndTabs(void*);
void fl_joystick(void*),fl_button(void*),FLkeyb(void*),fl_counter(void*);
void set_snap(void*),get_snap(void*);
void fl_setColor1(void*), fl_setColor2(void*), fl_setTextSize(void*),  fl_setTextColor(void*);
void fl_setFont(void*), fl_setText(void*), fl_setSize(void*),fl_setTextType(void*),fl_setBox(void*);
void fl_setPosition(void*), fl_hide(void*), fl_show(void*), fl_box(void*), fl_align(void*);
void save_snap(void*),  load_snap(void*), fl_button_bank(void*),timeseq_set(void*),timeseq(void*) ;
void lposcinta(void*),FLprintkset(void*),FLprintk(void*),FLprintk2(void*);

/* thread vals, where isub=1, ksub=2, asub=4:
		0 =	1  OR	2  (B out only)
		1 =	1
		2 =		2
		3 =	1  AND	2
		4 =			4
		5 =	1  AND		4
		7 =	1  AND (2  OR	4)			*/

/* inarg types include the following:
		m	begins an indef list of iargs (any count)
		n	begins an indef list of iargs (nargs odd)
		o	optional, defaulting to 0
		p	   "		"	1
		q	   "		"	10
		v	   "		"	.5
		j	   "		"	-1
		h	   "		"	127
                y       begins indef list of aargs (any count)
                z       begins indef list of kargs (any count)
                Z       begins alternating kakaka...list (any count)
   outarg types include:
		m	multiple outargs (1 to 4 allowed)
   (these types must agree with rdorch.c)			*/

/* If dsblksize is 0xffff then translate */
/*                 0xfffe then translate two (oscil) */
/*                 0xfffd then translate two (peak) */
/*                 0xfffc then translate two (divz) */

OENTRY opcodlst_1[] = {
/* opcode   dspace	thread	outarg	inargs	isub	ksub	asub	*/
{ ""									},
{ "instr",  0					 			},
{ "endin",  0								},
{ "$label", S(LBLBLK)							},
{ "strset", S(STRNG),   0,      "",     "iS"    /* oload time only */   },
{ "pset",   S(PVSET),   0,      "",     "m"                             },
{ "ftgen",  S(FTGEN),   1,      "i",   "iiiiSm",ftgen                   },
{ "ctrlinit",S(CTLINIT),1,      "",     "im",   ctrlinit                },
{ "massign",S(MASSIGN), 1,      "",     "ii",   massign                 },
{ "turnon", S(TURNON),  1,      "",     "io",   turnon                  },
{ "=",	    0								},
{ "init",   0xffff	/* base names for later prefixes,suffixes */	},
{ "betarand", 0xffff							},
{ "bexprnd", 0xffff							},
{ "cauchy",  0xffff							},
{ "chanctrl",0xffff                                                     },
{ "cpsmidib",0xffff							},
{ "ctrl14", 0xffff,							},
{ "ctrl21", 0xffff,							},
{ "ctrl7", 0xffff,							},
{ "exprand", 0xffff							},
{ "filter2",0xffff,							},
{ "gauss" ,  0xffff							},
{ "limit", 0xffff,							},
{ "linrand", 0xffff							},
{ "midic14", 0xffff,							},
{ "midic21", 0xffff,							},
{ "midic7", 0xffff,							},
{ "midictrl",0xffff							},
{ "ntrpol", 0xffff							},
{ "octmidib",0xffff							},
{ "pcauchy", 0xffff							},
{ "pchbend",0xffff				                        },
{ "pchmidib",0xffff							},
{ "poisson", 0xffff							},
{ "pow",    0xffff,							},
{ "s16b14", 0xffff,							},
{ "s32b14", 0xffff,							},
{ "slider16", 0xffff,							},
{ "slider32", 0xffff,							},
{ "slider64", 0xffff,							},
{ "slider8", 0xffff,							},
{ "tableng", 0xffff,							},
{ "taninv2", 0xffff							},
{ "timek", 0xffff,							},
{ "times", 0xffff,							},
{ "trirand", 0xffff							},
{ "unirand",0xffff,							},
{ "weibull", 0xffff							},
{ "random", 0xffff							},	/*gab d5*/
{ "duserrnd", 0xffff						},	/*gab d5*/
{ "cuserrnd", 0xffff						},	/*gab d5*/
{ "oscil",  0xfffe							},
{ "oscil3", 0xfffe							},
{ "oscili", 0xfffe							},
{ "peak", 0xfffd,							},
{ "poscil", 0xfffe							}, /* gab c3 */
{ "dashow", 0xffff,							},
{ "rtclock", 0xfffd,							},
{ "ihold",  S(LINK),	1,	"",	"",	ihold			},
{ "turnoff",S(LINK),	2,	"",	"",	NULL,	turnoff		},
{ "=_r",    S(ASSIGN),	1,	"r",	"i",	rassign			},
{ "=_i",    S(ASSIGN),	1,	"i",	"i",	assign			},
{ "=_k",    S(ASSIGN),	2,	"k",	"k",	NULL,	assign		},
{ "=_a",    S(ASSIGN),	4,	"a",	"x",	NULL,	NULL,	aassign	},
{ "init_i",  S(ASSIGN),	1,	"i",	"i",	init			},
{ "init_k",  S(ASSIGN),	1,	"k",	"i",	init			},
{ "init_a",  S(ASSIGN),	1,	"a",	"i",	ainit			},
{ ">",      S(RELAT),	0,	"B",	"kk",	gt,	gt		},
{ ">=",     S(RELAT),	0,	"B",	"kk",	ge,	ge		},
{ "<",      S(RELAT),	0,	"B",	"kk",	lt,	lt		},
{ "<=",     S(RELAT),	0,	"B",	"kk",	le,	le		},
{ "==",     S(RELAT),	0,	"B",	"kk",	eq,	eq		},
{ "!=",     S(RELAT),	0,	"B",	"kk",	ne,	ne		},
{ "&&",     S(LOGCL),	0,	"B",	"BB",	and,	and		},
{ "||",     S(LOGCL),	0,	"B",	"BB",	or,	or		},
{ ":i",     S(CONVAL),	1,	"i",	"bii",	conval			},
{ ":k",     S(CONVAL),	2,	"k",	"Bkk",	NULL,	conval		},
{ ":a",     S(CONVAL),	4,	"a",	"Bxx",	NULL,	NULL,	aconval	},
{ "add_ii",  S(AOP),	1,	"i",	"ii",	addkk			},
{ "sub_ii",  S(AOP),	1,	"i",	"ii",	subkk			},
{ "mul_ii",  S(AOP),	1,	"i",	"ii",	mulkk			},
{ "div_ii",  S(AOP),	1,	"i",	"ii",	divkk			},
{ "mod_ii",  S(AOP),	1,	"i",	"ii",	modkk			},
{ "add_kk",  S(AOP),	2,	"k",	"kk",	NULL,	addkk		},
{ "sub_kk",  S(AOP),	2,	"k",	"kk",	NULL,	subkk		},
{ "mul_kk",  S(AOP),	2,	"k",	"kk",	NULL,	mulkk		},
{ "div_kk",  S(AOP),	2,	"k",	"kk",	NULL,	divkk		},
{ "mod_kk",  S(AOP),	2,	"k",	"kk",	NULL,	modkk		},
{ "add_ka",  S(AOP),	4,	"a",	"ka",	NULL,	NULL,	addka	},
{ "sub_ka",  S(AOP),	4,	"a",	"ka",	NULL,	NULL,	subka	},
{ "mul_ka",  S(AOP),	4,	"a",	"ka",	NULL,	NULL,	mulka	},
{ "div_ka",  S(AOP),	4,	"a",	"ka",	NULL,	NULL,	divka	},
{ "mod_ka",  S(AOP),	4,	"a",	"ka",	NULL,	NULL,	modka	},
{ "add_ak",  S(AOP),	4,	"a",	"ak",	NULL,	NULL,	addak	},
{ "sub_ak",  S(AOP),	4,	"a",	"ak",	NULL,	NULL,	subak	},
{ "mul_ak",  S(AOP),	4,	"a",	"ak",	NULL,	NULL,	mulak	},
{ "div_ak",  S(AOP),	4,	"a",	"ak",	NULL,	NULL,	divak	},
{ "mod_ak",  S(AOP),	4,	"a",	"ak",	NULL,	NULL,	modak	},
{ "add_aa",  S(AOP),	4,	"a",	"aa",	NULL,	NULL,	addaa	},
{ "sub_aa",  S(AOP),	4,	"a",	"aa",	NULL,	NULL,	subaa	},
{ "mul_aa",  S(AOP),	4,	"a",	"aa",	NULL,	NULL,	mulaa	},
{ "div_aa",  S(AOP),	4,	"a",	"aa",	NULL,	NULL,	divaa	},
{ "mod_aa",  S(AOP),	4,	"a",	"aa",	NULL,	NULL,	modaa	},
{ "divz",   0xfffc							},
{ "divz_ii", S(DIVZ),	1,	"i",	"iii",	divzkk, NULL,   NULL    },
{ "divz_kk", S(DIVZ),	2,	"k",	"kkk",	NULL,   divzkk, NULL    },
{ "divz_ak", S(DIVZ),	4,	"a",	"akk",	NULL,   NULL,   divzak  },
{ "divz_ka", S(DIVZ),	4,	"a",	"kak",	NULL,   NULL,   divzka  },
{ "divz_aa", S(DIVZ),	4,	"a",	"aak",	NULL,   NULL,   divzaa  },
{ "int_i",  S(EVAL),	1,	"i",	"i",	int1			},
{ "frac_i", S(EVAL),	1,	"i",	"i",	frac1			},
{ "rnd_i",  S(EVAL),    1,      "i",    "i",    rnd1                    },
{ "birnd_i",S(EVAL),    1,      "i",    "i",    birnd1                  },
{ "abs_i",  S(EVAL),	1,	"i",	"i",	abs1			},
{ "exp_i",  S(EVAL),	1,	"i",	"i",	exp01			},
{ "log_i",  S(EVAL),	1,	"i",	"i",	log01			},
{ "sqrt_i", S(EVAL),	1,	"i",	"i",	sqrt1			},
{ "sin_i",  S(EVAL),	1,	"i",	"i",	sin1			},
{ "cos_i",  S(EVAL),	1,	"i",	"i",	cos1			},
{ "tan_i",  S(EVAL),	1,	"i",	"i",	tan1			},
{ "sininv_i", S(EVAL),	1,	"i",	"i",	asin1			},
{ "cosinv_i", S(EVAL),	1,	"i",	"i",	acos1			},
{ "taninv_i", S(EVAL),	1,	"i",	"i",	atan1			},
{ "taninv2_i",S(AOP),	1,	"i",	"ii",	atan21			},
{ "log10_i",S(EVAL),	1,	"i",	"i",	log101			},
{ "sinh_i", S(EVAL),	1,	"i",	"i",	sinh1			},
{ "cosh_i", S(EVAL),	1,	"i",	"i",	cosh1			},
{ "tanh_i", S(EVAL),	1,	"i",	"i",	tanh1			},
{ "int_k",  S(EVAL),	2,	"k",	"k",	NULL,	int1		},
{ "frac_k", S(EVAL),	2,	"k",	"k",	NULL,	frac1		},
{ "rnd_k",  S(EVAL),    2,      "k",    "k",    NULL,   rnd1            },
{ "birnd_k",S(EVAL),    2,      "k",    "k",    NULL,   birnd1          },
{ "abs_k",  S(EVAL),	2,	"k",	"k",	NULL,	abs1		},
{ "exp_k",  S(EVAL),	2,	"k",	"k",	NULL,	exp01		},
{ "log_k",  S(EVAL),	2,	"k",	"k",	NULL,	log01		},
{ "sqrt_k", S(EVAL),	2,	"k",	"k",	NULL,	sqrt1		},
{ "sin_k",  S(EVAL),	2,	"k",	"k",	NULL,	sin1		},
{ "cos_k",  S(EVAL),	2,	"k",	"k",	NULL,	cos1		},
{ "tan_k",  S(EVAL),	2,	"k",	"k",	NULL,	tan1		},
{ "sininv_k", S(EVAL),	2,	"k",	"k",	NULL,	asin1		},
{ "cosinv_k", S(EVAL),	2,	"k",	"k",	NULL,	acos1		},
{ "taninv_k", S(EVAL),	2,	"k",	"k",	NULL,	atan1		},
{ "taninv2_k",S(AOP),	2,	"k",	"kk",	NULL,	atan21		},
{ "sinh_k", S(EVAL),	2,	"k",	"k",	NULL,	sinh1		},
{ "cosh_k", S(EVAL),	2,	"k",	"k",	NULL,	cosh1		},
{ "tanh_k", S(EVAL),	2,	"k",	"k",	NULL,	tanh1		},
{ "log10_k",S(EVAL),	2,	"k",	"k",	NULL,	log101		},
{ "abs_a",  S(EVAL),	4,	"a",	"a",	NULL,	NULL,	absa	},
{ "exp_a",  S(EVAL),	4,	"a",	"a",	NULL,	NULL,	expa	},
{ "log_a",  S(EVAL),	4,	"a",	"a",	NULL,	NULL,	loga	},
{ "sqrt_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	sqrta	},
{ "sin_a",  S(EVAL),	4,	"a",	"a",	NULL,	NULL,	sina	},
{ "cos_a",  S(EVAL),	4,	"a",	"a",	NULL,	NULL,	cosa	},
{ "tan_a",  S(EVAL),	4,	"a",	"a",	NULL,	NULL,	tana	},
{ "sininv_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	asina	},
{ "cosinv_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	acosa	},
{ "taninv_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	atana	},
{ "taninv2_a",S(AOP),	4,	"a",	"aa",	NULL,	NULL,	atan2aa	},
{ "sinh_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	sinha	},
{ "cosh_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	cosha	},
{ "tanh_a", S(EVAL),	4,	"a",	"a",	NULL,	NULL,	tanha	},
{ "log10_a",S(EVAL),	4,	"a",	"a",	NULL,	NULL,	log10a	},
{ "dbamp_i",S(EVAL),	1,	"i",	"i",	dbamp			},
{ "ampdb_i",S(EVAL),	1,	"i",	"i",	ampdb			},
{ "dbamp_k",S(EVAL),	2,	"k",	"k",	NULL,	dbamp		},
{ "ampdb_k",S(EVAL),	2,	"k",	"k",	NULL,	ampdb		},
{ "ampdb_a",S(EVAL),	4,	"a",	"a",	NULL,	NULL,	aampdb	},
{ "dbfsamp_i",S(EVAL),	1,	"i",	"i",	dbfsamp			},
{ "ampdbfs_i",S(EVAL),	1,	"i",	"i",	ampdbfs			},
{ "dbfsamp_k",S(EVAL),	2,	"k",	"k",	NULL,	dbfsamp		},
{ "ampdbfs_k",S(EVAL),	2,	"k",	"k",	NULL,	ampdbfs		},
{ "ampdbfs_a",S(EVAL),	4,	"a",	"a",	NULL,	NULL,	aampdbfs },
{ "rtclock_i",S(EVAL),	1,	"i",	"",	rtclock			},
{ "rtclock_k",S(EVAL),	2,	"k",	"",	NULL,	rtclock		},
{ "ftlen_i",S(EVAL),	1,	"i",	"i",	ftlen			},
{ "ftsr_i",S(EVAL),	1,	"i",	"i",	ftsr			},
{ "ftlptim_i",S(EVAL),  1,      "i",    "i",    ftlptim                 },
{ "i_k",   S(ASSIGN),	1,	"i",	"k",	init			},
{ "cpsoct_i",S(EVAL),	1,	"i",	"i",	cpsoct			},
{ "octpch_i",S(EVAL),	1,	"i",	"i",	octpch			},
{ "cpspch_i",S(EVAL),	1,	"i",	"i",	cpspch			},
{ "pchoct_i",S(EVAL),	1,	"i",	"i",	pchoct			},
{ "octcps_i",S(EVAL),	1,	"i",	"i",	octcps			},
{ "cpsoct_k",S(EVAL),	2,	"k",	"k",	NULL,	cpsoct		},
{ "octpch_k",S(EVAL),	2,	"k",	"k",	NULL,	octpch		},
{ "cpspch_k",S(EVAL),	2,	"k",	"k",	NULL,	cpspch		},
{ "pchoct_k",S(EVAL),	2,	"k",	"k",	NULL,	pchoct		},
{ "octcps_k",S(EVAL),	2,	"k",	"k",	NULL,	octcps		},
{ "cpsoct_a",S(EVAL),	4,	"a",	"a",	NULL,	NULL,	acpsoct	},
{ "notnum", S(MIDIKMB), 1,	"i",	"",	notnum			},
{ "veloc",  S(MIDIMAP), 1,	"i",	"oh",	veloc			},
{ "pchmidi",S(MIDIKMB), 1,	"i",	"",	pchmidi			},
{ "octmidi",S(MIDIKMB), 1,	"i",	"",	octmidi			},
{ "cpsmidi",S(MIDIKMB), 1,	"i",	"",	cpsmidi			},
{ "pchmidib_i",S(MIDIKMB),1,	"i",	"o",	pchmidib_i		},
{ "octmidib_i",S(MIDIKMB),1,	"i",	"o",	octmidib_i		},
{ "cpsmidib_i",S(MIDIKMB),1,	"i",	"o",	icpsmidib_i		},
{ "pchmidib_k",S(MIDIKMB),3,	"k",	"o",	midibset,pchmidib	},
{ "octmidib_k",S(MIDIKMB),3,	"k",	"o",	midibset,octmidib	},
{ "cpsmidib_k",S(MIDIKMB),3,	"k",	"o",	midibset,icpsmidib     },
{ "ampmidi",S(MIDIAMP), 1,	"i",	"io",	ampmidi			},
{ "aftouch",S(MIDIKMAP), 3,	"k",	"oh",	aftset, aftouch		},
{ "pchbend_i",S(MIDIMAP),0x21,  "i",    "jp",   ipchbend                },
{ "pchbend_k",S(MIDIKMAP),0x23, "k",    "jp",   kbndset,kpchbend        },
{ "midictrl_i",S(MIDICTL),1,	"i",	"ioh",	imidictl		},
{ "midictrl_k",S(MIDICTL),3,	"k",	"ioh",	mctlset,midictl	},
{ "chanctrl_i",S(CHANCTL),1,    "i",    "iioh", ichanctl                },
{ "chanctrl_k",S(CHANCTL),3,    "k",    "iioh", chctlset,chanctl        },
{ "line",   S(LINE),	7,	"s",	"iii",	linset,	kline,	aline	},
{ "expon",  S(EXPON),	7,	"s",	"iii",	expset,	kexpon,	expon	},
{ "linseg", S(LINSEG),  7,	"s",	"iin",	lsgset,	klnseg,	linseg	},
{ "linsegr",S(LINSEG),  7,      "s",    "iin",  lsgrset,klnsegr,linsegr },
{ "expseg", S(EXXPSEG),  7,	"s",	"iin",	xsgset,	kxpseg,	expseg	},
{ "expsega",S(EXPSEG2),  7,     "a",    "iin",  xsgset2, NULL, expseg2  },
{ "expsegr",S(EXPSEG),  7,      "s",    "iin",  xsgrset,kxpsegr,expsegr },
{ "linen",  S(LINEN),	7,	"s",	"xiii",	lnnset,	klinen,	linen	},
{ "linenr", S(LINENR),	7,	"s",	"xiii", lnrset,	klinenr,linenr	},
{ "envlpx", S(ENVLPX),	7,	"s","xiiiiiio", evxset, knvlpx,	envlpx	},
{ "envlpxr", S(ENVLPR),	7,	"s","xiiiiioo", evrset, knvlpxr,envlpxr	},
{ "phasor", S(PHSOR),	7,	"s",	"xo",	phsset,	kphsor,	phsor	},
{ "table_i", S(TABLE),	1,	"i",	"iiooo",itable	 		},
{ "tablei_i", S(TABLE),	1,	"i",	"iiooo",itabli	 		},
{ "table3_i", S(TABLE),	1,	"i",	"iiooo",itabl3	 		},
{ "table",  S(TABLE),	7,	"s",	"xiooo",tblset,	ktable,	tablefn	},
{ "tablei", S(TABLE),	7,	"s",	"xiooo",tblset,	ktabli,	tabli	},
{ "table3", S(TABLE),	7,	"s",	"xiooo",tblset,	ktabl3,	tabl3	},
{ "oscil1", S(OSCIL1),	3,	"k",	"ikii", ko1set,	kosc1   	},
{ "oscil1i",S(OSCIL1),	3,	"k",	"ikii", ko1set,	kosc1i  	},
{ "osciln", S(OSCILN),  5,      "a",    "kiii", oscnset,NULL,   osciln  },
{ "oscil_kk",S(OSC),	7,	"s",	"kkio",	oscset,	koscil,	osckk	},
{ "oscil_ka",S(OSC),	5,	"a",	"kaio",	oscset,	NULL,	oscka	},
{ "oscil_ak",S(OSC),	5,	"a",	"akio",	oscset,	NULL,	oscak	},
{ "oscil_aa",S(OSC),	5,	"a",	"aaio",	oscset,	NULL,	oscaa	},
{ "oscili_kk",S(OSC),	7,	"s",	"kkio",	oscset,	koscli,	osckki	},
{ "oscili_ka",S(OSC),	5,	"a",	"kaio",	oscset,	NULL,	osckai	},
{ "oscili_ak",S(OSC),	5,	"a",	"akio",	oscset,	NULL,	oscaki	},
{ "oscili_aa",S(OSC),	5,	"a",	"aaio",	oscset,	NULL,	oscaai	},
{ "oscil3_kk",S(OSC),	7,	"s",	"kkio",	oscset,	koscl3,	osckk3	},
{ "oscil3_ka",S(OSC),	5,	"a",	"kaio",	oscset,	NULL,	oscka3	},
{ "oscil3_ak",S(OSC),	5,	"a",	"akio",	oscset,	NULL,	oscak3	},
{ "oscil3_aa",S(OSC),	5,	"a",	"aaio",	oscset,	NULL,	oscaa3	},
{ "foscil", S(FOSC),    5,      "a",  "xkxxkio",foscset,NULL,   foscil  },
{ "foscili",S(FOSC),    5,      "a",  "xkxxkio",foscset,NULL,   foscili },
{ "loscil", S(LOSC),	5,	"mm","xkiojoojoo",losset,NULL, loscil	},
{ "loscil3", S(LOSC),	5,	"mm","xkiojoojoo",losset,NULL, loscil3  },
{ "adsyn",  S(ADSYN),	5,	"a",	"kkkSo", adset,	NULL,	adsyn	},
{ "pvoc",   S(PVOC),	5,	"a",  "kkSoooo", pvset,	NULL,	pvoc	},
{ "fof",    S(FOFS),	5,	"a","xxxkkkkkiiiioo",fofset,NULL,fof	},
{ "fof2",   S(FOFS),	5,	"a","xxxkkkkkiiiikk",fofset2,NULL,fof	},
{ "fog",    S(FOGS),	5,	"a","xxxakkkkkiiiioo",fogset,NULL,fog	},
{ "harmon", S(HARMON),  5,      "a",  "akkkkiii",harmset,NULL,  harmon  },
{ "buzz",   S(BUZZ),	5,	"a",  "xxkio",  bzzset,	NULL,	buzz	},
{ "gbuzz",  S(GBUZZ),	5,	"a",  "xxkkkio",gbzset,	NULL,	gbuzz	},
{ "pluck",  S(PLUCK),	5,	"a",  "kkiiioo",plukset,NULL,	pluck	},
{ "rand",   S(RAND),	7,	"s",	"xvoo",	rndset,	krand,	arand	},
{ "randh",  S(RANDH),	7,	"s",	"xxvoo", rhset,	krandh,	randh	},
{ "randi",  S(RANDI),	7,	"s",	"xxvoo", riset,	krandi,	randi	},
/* { "rand2", S(RAND),	7,	"s",	"xv",	rndset2,krand2,	arand2	}, */
/* { "rand2h",S(RANDH),	7,	"s",	"xxv",	rhset2,	krandh2,randh2	}, */
/* { "rand2i", S(RANDI),7,	"s",	"xxv",	riset2,	krandi2,randi2	}, */
{ "port",   S(PORT),	3,	"k",	"kio",	porset,	port		},
{ "tone",   S(TONE),	5,	"a",	"ako",	tonset,	NULL,	tone	},
{ "tonex",  S(TONEX),   5,      "a",    "akoo", tonsetx, NULL,  tonex   },
{ "atone",  S(TONE),	5,	"a",	"ako",	tonset,	NULL,	atone	},
{ "atonex", S(TONEX),   5,      "a",    "akoo", tonsetx, NULL,  atonex  },
{ "reson",  S(RESON),	5,	"a",	"akkoo",rsnset,	NULL,	reson	},
{ "resonx", S(RESONX),  5,      "a",    "akkooo", rsnsetx, NULL, resonx },
{ "resony", S(RESONY),  5,      "a",    "akkikooo", rsnsety, NULL, resony },
{ "areson", S(RESON),	5,	"a",	"akkoo",rsnset,	NULL,	areson	},
{ "lpread", S(LPREAD),	3,	"kkkk",	"kSoo",	lprdset,lpread		},
{ "lpreson",S(LPRESON),	5,	"a",	"a",	lprsnset,NULL,	lpreson	},
{ "lpfreson",S(LPFRESON),5,	"a",	"ak",	lpfrsnset,NULL,	lpfreson},
{ "lpslot"  ,  S(LPSLOT),  1,   "",     "i",    lpslotset, NULL, NULL   },
{ "lpinterp", S(LPINTERPOL), 3, "",     "iik",  lpitpset, lpinterpol, NULL},
{ "rms",    S(RMS),	3,	"k",	"aqo",	rmsset,	rms		},
{ "gain",   S(GAIN),	5,	"a",	"akqo",	gainset,NULL,	gain	},
{ "balance",S(BALANCE),	5,	"a",	"aaqo",	balnset,NULL,	balance	},
{ "downsamp",S(DOWNSAMP),3,	"k",	"ao",	downset,downsamp	},
{ "upsamp", S(UPSAMP),	4,	"a",	"k",	NULL,	NULL,	upsamp	},
{ "interp", S(INDIFF),	5,	"a",	"ko",	indfset,NULL,	interp	},
{ "integ",  S(INDIFF),	7,	"s",	"xo",	indfset,kntegrate,integrate},
{ "diff",   S(INDIFF),	7,	"s",	"xo",	indfset,kdiff,	diff	},
{ "samphold",S(SAMPHOLD),7,	"s",	"xxoo",	samphset,ksmphold,samphold},
{ "delay",  S(DELAY),	5,	"a",	"aio",	delset,	NULL,	delay	},
{ "delayr", S(DELAYR),	5,	"a",	"io",	delrset,NULL,	delayr	},
{ "delayw", S(DELAYW),	5,	"",	"a",	delwset,NULL,	delayw	},
{ "delay1", S(DELAY1),	5,	"a",	"ao",	del1set,NULL,	delay1	},
{ "deltap", S(DELTAP),	5,	"a",	"k",	tapset, NULL,	deltap	},
{ "deltapi",S(DELTAP),	5,	"a",	"x",	tapset, NULL,	deltapi	},
{ "deltapn",S(DELTAP),  5,      "a",    "x",    tapset, NULL,   deltapn },
{ "deltap3",S(DELTAP),	5,	"a",	"x",	tapset, NULL,	deltap3	},
{ "comb",   S(COMB),	5,	"a",	"akioo", cmbset,NULL,	comb	},
{ "alpass", S(COMB),	5,	"a",	"akioo", cmbset,NULL,	alpass	},
{ "reverb", S(REVERB),	5,	"a",	"ako",	rvbset,	NULL,	reverb	},
{ "pan",    S(PAN),	5,	"aaaa",	"akkioo",panset,NULL,	pan	},
{ "soundin",S(SOUNDIN),	5,	"mmmm",	"Soo",	sndinset,NULL,	soundin	},
{ "soundout",S(SNDOUT), 5,      "",     "aSo",  sndo1set,NULL,  soundout},
/* { "soundouts",S(SNDOUTS),5,     "",     "aaSo", sndo2set,NULL,  soundouts}, */
{ "in",     S(IN),	4,	"a",	"",	NULL,	NULL,	in	},
{ "ins",    S(INS),	4,	"aa",	"",	NULL,	NULL,	ins	},
{ "inq",    S(INQ),	4,	"aaaa",	"",	NULL,	NULL,	inq	},
  /* Note that there is code in rdorch.c that assumes that opcodes starting
     with the charcters out followed by a s, q, h, o or x are in this group
     ***BEWARE***
   */
{ "out",    S(OUT),	4,	"",	"a",	NULL,	NULL,	out	},
{ "outs",   S(OUTS),	4,	"",	"aa",	NULL,	NULL,	outs	},
{ "outq",   S(OUTQ),	4,	"",	"aaaa",	NULL,	NULL,	outq	},
{ "outs1",  S(OUT),	4,	"",	"a",	NULL,	NULL,	outs1	},
{ "outs2",  S(OUT),	4,	"",	"a",	NULL,	NULL,	outs2	},
{ "outq1",  S(OUT),	4,	"",	"a",	NULL,	NULL,	outq1	},
{ "outq2",  S(OUT),	4,	"",	"a",	NULL,	NULL,	outq2	},
{ "outq3",  S(OUT),	4,	"",	"a",	NULL,	NULL,	outq3	},
{ "outq4",  S(OUT),	4,	"",	"a",	NULL,	NULL,	outq4	},
{ "igoto",  S(GOTO),	1,	"",	"l",	igoto			},
{ "kgoto",  S(GOTO),	2,	"",	"l",	NULL,	kgoto		},
{ "goto",   S(GOTO),	3,	"",	"l",	igoto,	kgoto		},
{ "cigoto", S(CGOTO),	1,	"",	"Bl",	icgoto			},
{ "ckgoto", S(CGOTO),	2,	"",	"Bl",	NULL,	kcgoto		},
{ "cggoto", S(CGOTO),	3,	"",	"Bl",	icgoto,	kcgoto		},
{ "timout", S(TIMOUT),	3,	"",	"iil",	timset,	timout		},
{ "reinit", S(GOTO),	2,	"",	"l",	NULL,	reinit		},
{ "rigoto", S(GOTO),	1,	"",	"l",	rigoto			},
{ "rireturn",S(LINK),	1,	"",	"",	rireturn		},
{ "tigoto", S(GOTO),	1,	"",	"l",	tigoto			},
{ "tival",  S(EVAL),	1,	"i",	"",	tival			},
{ "print",  S(PRINTV),	1,	"",	"m",	printv			},
{ "display",S(DSPLAY),	7,	"",	"sioo",	dspset, kdsplay,dsplay	},
{ "dispfft",S(DSPFFT),	7,	"",	"siiooo",fftset,kdspfft,dspfft	},
/* Deprecated */
/*  { "kdump",  S(KDUMP),	3,	"",	"kSii", old_kdmpset,kdump	}, */
/*  { "kdump2", S(KDUMP2),	3,	"",	"kkSii",old_kdmp2set,kdump2	}, */
/*  { "kdump3", S(KDUMP3),	3,	"",	"kkkSii",old_kdmp3set,kdump3	}, */
/*  { "kdump4", S(KDUMP4),	3,	"",	"kkkkSii",old_kdmp4set,kdump4	}, */
/* end */
{ "dumpk",  S(KDUMP),	3,	"",	"kSii", kdmpset,kdump		},
{ "dumpk2", S(KDUMP2),	3,	"",	"kkSii",kdmp2set,kdump2		},
{ "dumpk3", S(KDUMP3),	3,	"",	"kkkSii",kdmp3set,kdump3	},
{ "dumpk4", S(KDUMP4),	3,	"",	"kkkkSii",kdmp4set,kdump4	},
{ "readk",  S(KREAD),	3,	"k",	"Siio",  krdset, kread		},
{ "readk2", S(KREAD2),	3,	"kk",	"Siio",  krd2set, kread2	},
{ "readk3", S(KREAD3),	3,	"kkk",	"Siio",  krd3set, kread3   	},
{ "readk4", S(KREAD4),	3,	"kkkk",	"Siio",  krd4set, kread4 	},
{ "spectrum", S(SPECTRUM),7,    "w", "siiiqoooo",spectset,spectrum,spectrum},
{ "specaddm", S(SPECADDM),5,	"w",	"wwp",  spadmset,NULL,	specaddm},
{ "specdiff", S(SPECDIFF),5,	"w",	"w",    spdifset,NULL,	specdiff},
{ "specscal", S(SPECSCAL),5,	"w",	"wii",  spsclset,NULL,	specscal},
{ "spechist", S(SPECHIST),5,	"w",	"w",    sphstset,NULL,	spechist},
{ "specfilt", S(SPECFILT),5,	"w",	"wi",   spfilset,NULL,	specfilt},
{ "specptrk", S(SPECPTRK),5,	"kk",	"wkiiiiiioqooo",sptrkset,NULL,specptrk},
{ "specsum",  S(SPECSUM), 5,	"k",	"wo",   spsumset,NULL,	specsum },
{ "specdisp", S(SPECDISP),5,	"",	"wio",  spdspset,NULL,	specdisp},
{ "xyin",     S(XYIN),    3,    "kk",   "iiiiioo",xyinset,xyin          },
{ "tempest",  S(TEMPEST), 5,	"k","kiiiiiiiiiop",tempeset,NULL,tempest},
{ "tempo",    S(TEMPO),   3,    "",     "ki",   tempset,tempo           },
{ "butterhp", S(BFIL),  5,      "a",    "ako",  butset,  NULL,   hibut  },
{ "butterlp", S(BFIL),  5,      "a",    "ako",  butset,  NULL,   lobut  },
{ "butterbp", S(BBFIL), 5,      "a",    "akko", bbutset, NULL,  bpbut   },
{ "butterbr", S(BBFIL), 5,      "a",    "akko", bbutset, NULL,  bcbut   },
{ "buthp",    S(BFIL),  5,      "a",    "ako",  butset,  NULL,   hibut  },
{ "butlp",    S(BFIL),  5,      "a",    "ako",  butset,  NULL,   lobut  },
{ "butbp",    S(BBFIL), 5,      "a",    "akko", bbutset, NULL,  bpbut   },
{ "butbr",    S(BBFIL), 5,      "a",    "akko", bbutset, NULL,  bcbut   },
{ "vdelay",   S(VDEL),  5,      "a",    "axio", vdelset, NULL,  vdelay  },
{ "vdelay3",  S(VDEL),  5,      "a",    "axio", vdelset, NULL,  vdelay3 },
{ "vdelayxwq",S(VDELXQ),5,      "aaaa", "aaaaaiio", vdelxqset, NULL, vdelayxwq},
{ "vdelayxws",S(VDELXS),5,      "aa",   "aaaiio", vdelxsset, NULL, vdelayxws},
{ "vdelayxw", S(VDELX), 5,      "a",    "aaiio", vdelxset, NULL, vdelayxw},
{ "vdelayxq", S(VDELXQ),5,      "aaaa", "aaaaaiio", vdelxqset, NULL, vdelayxq},
{ "vdelayxs", S(VDELXS),5,      "aa",   "aaaiio", vdelxsset, NULL, vdelayxs},
{ "vdelayx",  S(VDELX), 5,      "a",    "aaiio", vdelxset, NULL, vdelayx},
{ "grain",    S(PGRA),  5,      "a",    "xxxkkkiiio", agsset, NULL, ags },
{ "pow_i",    S(POW),   1,      "i",    "ii",   ipow,    NULL,  NULL    },
{ "pow_k",    S(POW),   2,      "k",    "kkp",  NULL,    kpow,  NULL    },
{ "pow_a",    S(POW),   4,      "a",    "akp",  NULL,    NULL,  apow    },
{ "multitap", S(MDEL),	5,	"a",	"am",	multitap_set,NULL,multitap_play},
{ "follow",   S(FOL),	5,	"a",	"ai",	flwset,  NULL,	follow  },
{ "follow2",  S(ENV),   5,	"a",	"akk",	envset,  NULL,  envext  },
{ "oscilx",   S(OSCILN),5,	"a",	"kiii",	oscnset,NULL,   osciln  },
/* { "poscil",   S(POSC),  7,      "s",    "kkio", posc_set, kposc,   posc }, */
{ "poscil_kk",   S(POSC),  7,      "s",    "kkio", posc_set, kposc,   posckk }, /* gab c3 */
{ "poscil_ka",   S(POSC),  5,      "a",    "kaio", posc_set, NULL,   poscka },
{ "poscil_ak",   S(POSC),  5,      "a",    "akio", posc_set, NULL,   poscak },
{ "poscil_aa",   S(POSC),  5,      "a",    "aaio", posc_set, NULL,   poscaa },
{ "lposcil",  S(LPOSC), 5,      "a",    "kkkkio", lposc_set, NULL, lposc},
{ "poscil3",  S(POSC),  7,      "s",    "kkio", posc_set, kposc3, posc3 },
{ "lposcil3", S(LPOSC), 5,      "a",    "kkkkio", lposc_set, NULL,lposc3},
{ "linrand_i",S(PRAND),	1,	"i",	"k",   	iklinear, NULL, NULL    },
{ "linrand_k",S(PRAND),	2,	"k",	"k",	NULL, iklinear, NULL	},
{ "linrand_a",S(PRAND),	4,	"a",	"k",	NULL, NULL,     alinear	},
{ "trirand_i",S(PRAND),	1,	"i",	"k",	iktrian, NULL,  NULL	},
{ "trirand_k",S(PRAND),	2,	"k",	"k",	NULL, iktrian,  NULL	},
{ "trirand_a",S(PRAND),	4,	"a",	"k",	NULL, NULL,     atrian	},
{ "exprand_i",S(PRAND),	1,	"i",	"k",	ikexp, NULL,    NULL	},
{ "exprand_k",S(PRAND),	2,	"k",	"k",	NULL,    ikexp, NULL	},
{ "exprand_a",S(PRAND),	4,	"a",	"k",	NULL, NULL,     aexp	},
{ "bexprnd_i",S(PRAND),	1,	"i",	"k",	ikbiexp, NULL,  NULL	},
{ "bexprnd_k",S(PRAND),	2,	"k",	"k",	NULL, ikbiexp,  NULL	},
{ "bexprnd_a",S(PRAND),	4,	"a",	"k",	NULL, NULL,     abiexp	},
{ "cauchy_i", S(PRAND),	1,	"i",	"k",	ikcauchy, NULL, NULL	},
{ "cauchy_k", S(PRAND),	2,	"k",	"k",	NULL, ikcauchy, NULL	},
{ "cauchy_a", S(PRAND),	4,	"a",	"k",	NULL,    NULL,  acauchy	},
{ "pcauchy_i",S(PRAND),	1,	"i",	"k",	ikpcauchy, NULL,NULL	},
{ "pcauchy_k",S(PRAND),	2,	"k",	"k",	NULL, ikpcauchy,NULL	},
{ "pcauchy_a",S(PRAND),	4,	"a",	"k",	NULL,    NULL,  apcauchy},
{ "poisson_i",S(PRAND),	1,	"i",	"k",	ikpoiss, NULL,  NULL	},
{ "poisson_k",S(PRAND),	2,	"k",	"k",	NULL, ikpoiss,  NULL	},
{ "poisson_a",S(PRAND),	4,	"a",	"k",	NULL,    NULL,  apoiss	},
{ "gauss_i" , S(PRAND),	1,	"i",	"k",	ikgaus,  NULL,  NULL	},
{ "gauss_k" , S(PRAND),	2,	"k",	"k",	NULL, ikgaus,   NULL	},
{ "gauss_a" , S(PRAND),	4,	"a",	"k",	NULL,    NULL,  agaus	},
{ "weibull_i",S(PRAND),	1,	"i",	"kk",	ikweib,  NULL,  NULL	},
{ "weibull_k",S(PRAND),	2,	"k",	"kk",	NULL, ikweib,   NULL	},
{ "weibull_a",S(PRAND),	4,	"a",	"kk",	NULL,    NULL,  aweib	},
{ "betarand_i",S(PRAND),1,	"i",	"kkk",	ikbeta, NULL,  NULL	},
{ "betarand_k",S(PRAND),2,	"k",	"kkk",	NULL,   ikbeta,NULL	},
{ "betarand_a",S(PRAND),4,	"a",	"kkk",	NULL,   NULL,  abeta	},
{ "seed",     S(PRAND),	1,	"",	"i",	seedrand, NULL, NULL	},
{ "convolve", S(CONVOLVE), 5,	"mmmm", "aSo",  cvset,   NULL,  convolve},
{ "convle",   S(CONVOLVE), 5,	"mmmm", "aSo",  cvset,   NULL,  convolve},
{ "granule",  S(GRAINV4),  5,   "a",    "xiiiiiiiiikikiiivppppo", grainsetv4, NULL, graingenv4},
{ "hrtfer",   S(HRTFER),5,	"aa",	"akkS",	hrtferxkSet, NULL, hrtferxk},
{ "sndwarp",  S(SNDWARP), 5,	"mm",	"xxxiiiiiii",sndwarpgetset, NULL, sndwarp},
{ "sndwarpst", S(SNDWARPST), 5, "mmmm","xxxiiiiiii",sndwarpstset,NULL,sndwarpst},
{ "tableseg", S(TABLESEG), 3,  "",	"iin",	tblesegset, ktableseg},
{ "ktableseg", S(TABLESEG), 3,  "",	"iin",	tblesegset, ktableseg},
{ "tablexseg", S(TABLESEG), 3, "",	"iin",	tblesegset, ktablexseg},
{ "vpvoc",    S(VPVOC),	5,     "a",	"kkSoo", vpvset,	NULL,   vpvoc},
{ "pvread",   S(PVREAD),3,     "kk",	"kSi",  pvreadset, pvread},
{ "pvcross",  S(PVCROSS),  5,  "a",	"kkSkko", pvcrossset, NULL, pvcross},
{ "pvbufread",S(PVBUFREAD), 3, "",	"kS",   pvbufreadset, pvbufread, NULL},
{ "pvinterp", S(PVINTERP), 5,  "a",  "kkSkkkkkk", pvinterpset, NULL, pvinterp},
{ "pvadd",    S(PVADD),	5,     "a", "kkSiiopooo", pvaddset,	NULL,   pvadd},
  /* Deprecated */
{ "itablew",  S(TABLEW),1,     "",	"iiiooo", itablew1, NULL, NULL},
{ "itablegpw",S(TABLENG),1,    "",	"i",	itablegpw1, NULL,  NULL},
{ "itablemix",S(TABLEMIX),1,   "",   "iiiiiiiii", itablemix1, NULL, NULL},
{ "itablecopy",S(TABLECOPY),1, "",	"ii", 	itablecopy1, NULL, NULL},
  /* end */
{ "tableiw",  S(TABLEW),1,     "",	"iiiooo", itablew, NULL, NULL},
{ "tablew",   S(TABLEW),7,     "",	"xxiooo",tblsetw,ktablew,tablew},
{ "tablewkt", S(TABLEW),7,     "",     "xxkooo",tblsetwkt,ktablewkt,tablewkt},
{ "tableng_i", S(TABLENG),1,   "i",	"i",	itableng, NULL,  NULL},
{ "tableng_k",  S(TABLENG),2,  "k",	"k",	NULL,	tableng, NULL},
{ "tableigpw",S(TABLENG),1,    "",	"i",	itablegpw, NULL,  NULL},
{ "tablegpw", S(TABLENG),2,    "",	"k",	NULL,	tablegpw, NULL},
{ "tableimix",S(TABLEMIX),1,   "",   "iiiiiiiii", itablemix, NULL, NULL},
{ "tablemix", S(TABLEMIX),2,   "",   "kkkkkkkkk",tablemixset, tablemix, NULL},
{ "tableicopy",S(TABLECOPY),1, "",	"ii", 	itablecopy, NULL, NULL},
{ "tablecopy", S(TABLECOPY),2, "",	"kk",   tablecopyset, tablecopy, NULL},
{ "tablera", S(TABLERA),5,     "a",	"kkk",	tableraset, NULL, tablera},
{ "tablewa", S(TABLEWA),5,     "k",	"kak",	tablewaset, NULL, tablewa},
{ "tablekt",  S(TABLE),	7,     "s",  "xkooo",tblsetkt,	ktablekt, tablekt },
{ "tableikt", S(TABLE),	7,     "s",  "xkooo",tblsetkt,	ktablikt, tablikt },
{ "zakinit", S(ZAKINIT), 1,    "",	"ii",	zakinit, NULL, 	NULL},
{ "zir",    S(ZKR),	1,     "i",	"i",	zir,	 NULL, 	NULL},
{ "zkr",    S(ZKR),	3,     "k",	"k",	zkset,   zkr,	NULL},
{ "ziw",    S(ZKW),	1,     "",	"ii",	ziw,	 NULL, 	NULL},
{ "zkw",    S(ZKW),	3,     "",	"kk",	zkset,   zkw,	NULL},
{ "ziwm",   S(ZKWM),	1,     "",	"iip",	ziwm,	 NULL, 	NULL},
{ "zkwm",   S(ZKWM),	3,     "",	"kkp",	zkset,   zkwm,	NULL},
{ "zkmod",  S(ZKMOD),	2,     "k",	"kk",	NULL,    zkmod,	NULL},
{ "zkcl",   S(ZKCL),	3,     "",	"kk",	zkset,   zkcl,	NULL},
{ "zar",    S(ZAR),	5,     "a",	"k",	zaset,   NULL, 	zar},
{ "zarg",   S(ZARG),	5,     "a",	"kk",	zaset,   NULL, 	zarg},
{ "zaw",    S(ZAW),	5,     "",	"ak",	zaset,   NULL, 	zaw},
{ "zawm",   S(ZAWM),	5,     "",	"akp",	zaset,   NULL, 	zawm},
{ "zamod",  S(ZAMOD),	4,     "a",	"ak",	NULL,    NULL,  zamod},
{ "zacl",   S(ZACL),	5,     "",	"kk",	zaset,   NULL, 	zacl},
{ "timek_i", S(RDTIME),	1,     "i",	"",	timek, 	 NULL,	NULL},
{ "times_i", S(RDTIME),	1,     "i",	"",	timesr,  NULL,	NULL},
{ "timek_k",  S(RDTIME), 	2,     "k",	"",	NULL, 	 timek,	NULL},
{ "times_k",  S(RDTIME), 	2,     "k",	"",	NULL, 	 timesr,NULL},
  /* Deprecated */
/*  { "instimek", S(RDTIME), 3,    "k",	"",     instimset1, instimek, NULL}, */
/*  { "instimes", S(RDTIME), 3,    "k",	"",     instimset1, instimes, NULL}, */
  /* end */
{ "timeinstk", S(RDTIME), 3,    "k",	"",     instimset, instimek, NULL},
{ "timeinsts", S(RDTIME), 3,    "k",	"",     instimset, instimes, NULL},
{ "printk", S(PRINTK), 	3,     "",	"iko",	printkset, printk, NULL},
{ "printks",S(PRINTKS),	3,     "",	"Sikkkk",printksset,printks, NULL},
{ "printk2", S(PRINTK2),3,     "",	"ko",	printk2set, printk2, NULL},
{ "peak_k",  S(PEAK),	2,     "k",	"k",	NULL,	 peakk,    NULL},
{ "peak_a",   S(PEAK),	4,     "k",	"a",	NULL, 	 NULL,     peaka},
{ "portk",  S(KPORT),	3,     "k",	"kko",	kporset, kport, NULL	},
{ "tonek",  S(KTONE),	3,     "k",	"kko",	ktonset, ktone, NULL	},
{ "atonek", S(KTONE),	3,     "k",	"kko",	ktonset, katone, NULL	},
{ "resonk", S(KRESON),	3,     "k",	"kkkpo",krsnset, kreson, NULL	},
{ "aresonk",S(KRESON),	3,     "k",	"kkkpo",krsnset, kareson, NULL	},
{ "limit_i", S(LIMIT),	1,     "i",	"iii",	klimit,  NULL, 	  NULL  },
{ "limit_k",  S(LIMIT),	3,     "k",	"xkk",	limitset, klimit, NULL  },
{ "limit_a",  S(LIMIT),	5,     "a",	"xkk",	limitset, NULL,   limit },
{ "unirand_i",S(PRAND),	1,     "i",	"k",   	ikuniform, NULL,  NULL  },
{ "unirand_k",S(PRAND),	2,     "k",	"k",	NULL,    ikuniform, NULL},
{ "unirand_a",S(PRAND),	4,     "a",	"k",	NULL,    NULL, auniform },
{ "diskin",S(SOUNDINEW),5,  "mmmm",	"Skooo", newsndinset,NULL, soundinew},
{ "noteon", S(OUT_ON),	1,	"", 	"iii",	iout_on, NULL, 	 NULL   },
{ "noteoff", S(OUT_ON),	1,	"", 	"iii",	iout_off, NULL,    NULL },
{ "noteondur",S(OUT_ON_DUR),3,	"", "iiii", iout_on_dur_set,iout_on_dur,NULL},
{ "noteondur2",S(OUT_ON_DUR),3,	"", "iiii", iout_on_dur_set,iout_on_dur2,NULL},
{ "moscil",S(MOSCIL),	3,	"",	"kkkkk",moscil_set, moscil, NULL},
/* Deprecated */
{ "kon",S(KOUT_ON),	3,  	"", "kkk", kvar_out_on_set1,kvar_out_on,NULL},
/* end */
{ "midion",S(KOUT_ON),	3,  	"", "kkk", kvar_out_on_set,kvar_out_on,NULL},
{ "outic",S(OUT_CONTR),	1,	"",	"iiiii", out_controller, NULL, NULL},
{ "outkc",S(OUT_CONTR),	2,	"",	"kkkkk", NULL, out_controller, NULL},
{ "outic14",S(OUT_CONTR14),1,	"",	"iiiiii",out_controller14, NULL,NULL},
{ "outkc14",S(OUT_CONTR14),2,	"",	"kkkkkk",NULL, out_controller14, NULL},
{ "outipb",S(OUT_PB),	1,	"",	"iiii", out_pitch_bend, NULL , NULL},
{ "outkpb",S(OUT_PB),	2,	"",	"kkkk", NULL,  out_pitch_bend, NULL},
{ "outiat",S(OUT_ATOUCH),1,	"",	"iiii", out_aftertouch, NULL , NULL},
{ "outkat",S(OUT_ATOUCH),2,	"",	"kkkk", NULL,  out_aftertouch, NULL},
{ "outipc",S(OUT_PCHG),	1,	"",	"iiii", out_progchange, NULL , NULL},
{ "outkpc",S(OUT_PCHG),	2,	"",	"kkkk", NULL,  out_progchange, NULL},
{ "outipat",S(OUT_POLYATOUCH),1,"",    "iiiii", out_poly_aftertouch, NULL,NULL},
{ "outkpat",S(OUT_POLYATOUCH),2,"",    "kkkkk", NULL, out_poly_aftertouch,NULL},
{ "release",S(REL),	3,	"k",	"", 	release_set, release , NULL },
{ "xtratim",S(XTRADUR),	1,	"",	"i",  	xtratim,    NULL,     NULL },
{ "mclock", S(MCLOCK),	3,	"",	"i",  	mclock_set, mclock,   NULL },
{ "mrtmsg", S(XTRADUR),	1,	"",	"i",  	mrtmsg,     NULL,     NULL },
{ "midic7_i",S(MIDICTL2),1,     "i",    "iiio", imidic7,    NULL,     NULL },
{ "midic7_k", S(MIDICTL2),3,    "k",    "ikko", midic7set,  midic7,   NULL },
{ "midic14_i", S(MIDICTL3), 1,	"i",    "iiiio",imidic14,   NULL,     NULL },
{ "midic14_k", S(MIDICTL3), 3,  "k",    "iikko",midic14set, midic14,  NULL },
{ "midic21_i", S(MIDICTL4),1,   "i",    "iiiiio",imidic21,   NULL,     NULL },
{ "midic21_k", S(MIDICTL4), 3,  "k",    "iiikko",midic21set, midic21,  NULL },
{ "ctrl7_i", S(CTRL7), 1,       "i",    "iiiio", ictrl7,     NULL,     NULL },
{ "ctrl7_k", S(CTRL7),  3,	"k",    "iikko", ctrl7set,   ctrl7,    NULL },
{ "ctrl14_i", S(CTRL14),1,	"i",    "iiiiio",ictrl14,    NULL,     NULL },
{ "ctrl14_k", S(CTRL14), 3,	"k",    "iiikko",ctrl14set,  ctrl14,   NULL },
{ "ctrl21_i", S(CTRL21),1,	"i",    "iiiiiio", ictrl21,  NULL,     NULL },
{ "ctrl21_k", S(CTRL21), 3,	"k",    "iiiikko", ctrl21set, ctrl21,  NULL },
{ "initc7", S(INITC7), 1,       "",     "iii",  initc7,     NULL,     NULL },
{ "initc14", S(INITC14), 1,     "",     "iiii", initc14,    NULL,     NULL },
{ "initc21", S(INITC21), 1,     "",     "iiiii",initc21,    NULL,     NULL },
{ "slider8_k", S(SLIDER8), 3, "kkkkkkkk",  "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiii", slider_i8, slider8, NULL },
{ "slider8f", S(SLIDER8f), 3, "kkkkkkkk","iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiii",
                                                slider_i8f, slider8f, NULL },
{ "slider8_i", S(SLIDER8), 1, "iiiiiiii", "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
                                                islider8, NULL, NULL },
{ "slider16_k", S(SLIDER16), 3, "kkkkkkkkkkkkkkkk",
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    					"iiiiiiiiiii",
    						slider_i16, slider16, NULL },
{ "slider16f", S(SLIDER16f), 3, "kkkkkkkkkkkkkkkk",
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiii",
    					       slider_i16f, slider16f, NULL },
{ "slider16_i", S(SLIDER16), 1, "iiiiiiiiiiiiiiii",
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
    						islider16, NULL, NULL       },
{ "slider32_k", S(SLIDER32),  3, "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	                                "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiii",
					slider_i32, slider32, NULL  },
{ "slider32f", S(SLIDER32f), 3, "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	                                "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiii",
					slider_i32f, slider32f, NULL  },
{ "slider32_i", S(SLIDER32), 1, "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
	                                "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
                                        "iiiiiiiiiiiiiiiiiiiiiiii",
					islider32, NULL, NULL  },
{ "slider64_k", S(SLIDER64), 3, "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
			      "kkkkkkkkkkkkkkkkkkk",
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiii",
    					slider_i64, slider64, NULL  },
{ "slider64f", S(SLIDER64f), 3, "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
                                "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	                                "iiiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii",
					slider_i64f, slider64f, NULL  },
{ "slider64_i", S(SLIDER64), 1, "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
				"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiiiiiiiiii"
	                                "iiiiiiiiiiiiiiiii",
    					islider64, NULL, NULL  },
{ "s16b14_k", S(SLIDER16BIT14), 3, "kkkkkkkkkkkkkkkk",
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
					slider_i16bit14, slider16bit14, NULL  },
{ "s32b14_k", S(SLIDER32BIT14), 3, "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
					slider_i32bit14, slider32bit14, NULL  },
{ "s16b14_i", S(ISLIDER16BIT14), 1, "iiiiiiiiiiiiiiii",
					"iiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiii",
					islider16bit14, NULL, NULL  },
{ "s32b14_i", S(ISLIDER32BIT14), 1, "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
					"iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
					islider32bit14, NULL, NULL  },
{ "wgpluck", S(WGPLUCK), 5,     "a",   "iikiiia",pluckPluck,NULL,pluckGetSamps},
{ "filter2_a",  S(FILTER), 5,   "a",    "aiim", ifilter,    NULL,     afilter},
{ "filter2_k", S(FILTER), 3,    "k",    "kiim", ifilter,    kfilter,  NULL },
{ "zfilter2", S(ZFILTER), 5,    "a",    "akkiim", izfilter,  NULL,    azfilter},
{ "dam",     S(DAM),     5,     "a",    "akiiii",daminit,    NULL,     dam  },
{ "locsig", S(LOCSIG),   5,  "mmmm",    "akkk", locsigset,NULL, locsig     },
{ "locsend", S(LOCSEND), 5,  "mmmm",    "",     locsendset, NULL, locsend  },
{ "space", S(SPACE),     5,  "aaaa",    "aikkkk",spaceset, NULL, space      },
{ "spsend", S(SPSEND),   5,  "aaaa",    "",     spsendset, NULL, spsend    },
{ "spdist", S(SPDIST),   3,     "k",    "ikkk", spdistset, spdist, NULL    },
{ "lowres",   S(LOWPR),   5,    "a",    "akko", lowpr_set, NULL,   lowpr   },
{ "lowresx",  S(LOWPRX),  5,    "a",    "akkoo",lowpr_setx, NULL, lowprx   },
{ "vlowres", S(LOWPR_SEP),5,    "a",    "akkik",lowpr_w_sep_set, NULL, lowpr_w_sep },
{ "wrap_i", S(WRAP),	 1,	"i",	"iii",	kwrap, NULL, 	NULL        },
{ "wrap",  S(WRAP),	 6,	"s",	"xkk",	NULL,  kwrap,       wrap   },
{ "mirror_i", S(WRAP),	 1,	"i",	"iii",	kmirror, NULL, 	NULL},
{ "mirror",  S(WRAP),	 6,	"s",	"xkk",	NULL,  kmirror,     mirror },
{ "ntrpol_i",S(INTERPOL), 1,    "i",    "iiiop",interpol                   },
{ "ntrpol_k",S(INTERPOL), 3,    "k",    "kkkop",nterpol_init, knterpol     },
{ "ntrpol_a",S(INTERPOL), 5,    "a",    "aakop",nterpol_init,NULL, anterpol },
{ "fold",    S(FOLD),     5,    "a",	"ak",   fold_set, NULL, fold       },
{ "cpstmid", S(CPSTABLE), 1,    "i",    "i",    cpstmid                    },
{ "trigger", S(TRIG),    3,     "k",    "kkk",  trig_set, trig,   NULL     },
{ "midiin", S(MIDIIN),   2,     "kkkk", "",     NULL, midiin,   NULL       },
{ "midiout",S(MIDIOUT),  2,     "",     "kkkk", NULL, midiout,   NULL      },
{ "midion2", S(KON2),    3,     "",     "kkkk", kon2_set, kon2,   NULL     },
{ "nrpn",   S(NRPN),     2,     "",     "kkk",  NULL,  nrpn ,NULL          },
{ "mdelay", S(MDELAY),   3,     "",     "kkkkk",mdelay_set, mdelay,   NULL },
{ "nsamp_i", S(EVAL),    1,     "i",    "i",    numsamp                    },
{ "wguide1", S(WGUIDE1), 5,     "a",    "axkk", wguide1set, NULL, wguide1  },
{ "wguide2", S(WGUIDE2), 5,     "a",    "axxkkkk", wguide2set, NULL, wguide2 },
{ "vincr", S(INCR),	 4,     "",	"aa",	NULL, NULL, incr           },
{ "clear", S(CLEARS),    4,     "",	"y",	NULL, NULL, clear          },
{ "fout", S(OUTFILE),    5,     "",	"Siy", 	outfile_set, NULL, outfile },
{ "foutk", S(KOUTFILE),  3,     "",	"Siz",	koutfile_set, koutfile     },
{ "fouti", S(IOUTFILE),  1,     "",	"iiim", ioutfile_set               },
{ "foutir", S(IOUTFILE_R), 3,   "",     "iiim",	ioutfile_set_r, ioutfile_r },
{ "fiopen", S(FIOPEN),   1,     "i",	"Si",   fiopen	 	            },
{ "fin", S(INFILE),      5,     "",	"Siiy",	infile_set,  NULL, infile  },
{ "fink", S(KINFILE),    3,     "",	"Siiz",	kinfile_set, kinfile       },
{ "fini", S(I_INFILE),   1,     "",	"Siim", i_infile                   },
{ "powoftwo_i",S(EVAL),  1,     "i",    "i",    ipowoftwo                  },
{ "powoftwo_k",S(EVAL),  3,     "k",    "k",    powoftwo_set, powoftwo     },//gab
{ "powoftwo_a",S(EVAL),  5,     "a",    "a",  powoftwo_set, NULL, powoftwoa },//gab
{ "logbtwo_i",S(EVAL),   1,     "i",    "i",    ilogbasetwo                },
{ "logbtwo_k",S(EVAL),   3,     "k",    "k",    logbasetwo_set, logbasetwo },//gab
{ "logbtwo_a",S(EVAL),   5,     "a",    "a", logbasetwo_set, NULL, logbasetwoa },//gab
{ "biquad", S(BIQUAD),   5,     "a",    "akkkkkko",biquadset, NULL, biquad  },
{ "moogvcf", S(MOOGVCF), 5,     "a",    "axxp", moogvcfset, NULL, moogvcf  },
{ "rezzy", S(REZZY),     5,     "a",    "axxo", rezzyset, NULL, rezzy      },
{ "distort1", S(DISTORT), 4,    "a",    "appoo",NULL,     NULL, distort    },
{ "vco", S(VCO),         5,     "a",    "kkpppp",vcoset, NULL, vco         },
{ "tbvcf", S(TBVCF),     5,     "a",    "axxkk",  tbvcfset, NULL, tbvcf    },
{ "planet", S(PLANET),   5,     "aaa",  "kkkiiiiiiio", planetset, NULL, planet},
{ "pareq", S(PAREQ),     5,     "a",    "akkko",pareqset, NULL, pareq      },
{ "nestedap", S(NESTEDAP), 5, "a", "aiiiiooooo", nestedapset, NULL, nestedap},
{ "lorenz", S(LORENZ),   5,   "aaa", "kkkkiiii", lorenzset, NULL, lorenz    },
{ "svfilter", S(SVF),    5,    "aaa",  "akko",  svfset,    NULL, svf        },
{ "hilbert", S(HILBERT), 5,    "aa",   "a",     hilbertset, NULL, hilbert   },
{ "resonr", S(RESONZ),   5,    "a",    "akkoo", resonzset, NULL, resonr     },
{ "resonz", S(RESONZ),   5,    "a",    "akkoo", resonzset, NULL, resonz     },
{ "lowpass2", S(LP2),    5,    "a",    "akko",  lp2_set, NULL, lp2	    },
{ "phaser2", S(PHASER2), 5,    "a",    "akkkkkk", phaser2set, NULL, phaser2 },
{ "phaser1", S(PHASER1), 5,    "a",    "akkko",  phaser1set, NULL, phaser1  },
{ "filelen", S(SNDINFO), 1,     "i",    "S",    filelen, NULL, NULL        },
{ "filenchnls", S(SNDINFO), 1,  "i",    "S",    filenchnls, NULL, NULL     },
{ "filesr", S(SNDINFO),  1,     "i",    "S",    filesr, NULL, NULL         },
{ "filepeak", S(SNDINFOPEAK), 1, "i",   "So",   filepeak, NULL, NULL       },
{ "cpuprc", S(CPU_PERC), 1,     "",     "ii",   cpuperc, NULL, NULL        },
{ "prealloc", S(CPU_PERC), 1,   "",     "ii",   prealloc, NULL, NULL       },
{ "maxalloc", S(CPU_PERC), 1,   "",     "ii",   maxalloc, NULL, NULL       },
{ "nlalp", S(NLALP),     5,     "a",    "akkoo", nlalp_set, NULL, nlalp     }, 
{ "hsboscil",S(HSBOSC),  5,	"a", "kkkiiioo", hsboscset, NULL, hsboscil  },
{ "phasorbnk", S(PHSORBNK), 7,	"s", "xkio", phsbnkset, kphsorbnk, phsorbnk },
{ "adsynt",S(ADSYNT),    5,     "a",  "kkiiiio", adsyntset,  NULL,  adsynt  }, //gab
/*
{ "sfload",S(SFLOAD),     1,    "i",	"S",    SfLoad	 	            },
{ "sfpreset",S(SFPRESET), 1,    "i",	"iiii", SfPreset 		    },
{ "sfplay", S(SFPLAY),    5,    "aa",   "iixxio",SfPlay_set, NULL, SfPlay   },
{ "sfplaym", S(SFPLAYMONO), 5,  "a",    "iixxio",SfPlayMono_set, NULL, SfPlayMono   },
{ "sfplist",S(SFPLIST),   1,    "",	"i",    Sfplist	 	    }, 
{ "sfilist",S(SFPLIST),   1,    "",	"i",    Sfilist	 	    },
{ "sfpassign",S(SFPASSIGN), 1,  "",	"ii",   SfAssignAllPresets	    },
{ "sfinstrm", S(SFIPLAYMONO),5, "a", "iixxiio", SfInstrPlayMono_set, NULL, SfInstrPlayMono   },
{ "sfinstr", S(SFIPLAY),  5,    "aa", "iixxiio",SfInstrPlay_set, NULL,SfInstrPlay },
{ "sfplay3", S(SFPLAY),   5,    "aa", "iixxio", SfPlay_set, NULL, SfPlay3  },
{ "sfplay3m", S(SFPLAYMONO), 5, "a", "iixxio",  SfPlayMono_set, NULL,SfPlayMono3 },
{ "sfinstr3", S(SFIPLAY), 5,    "aa", "iixxiio", SfInstrPlay_set, NULL, SfInstrPlay3 },
{ "sfinstr3m", S(SFIPLAYMONO), 5, "a", "iixxiio", SfInstrPlayMono_set, NULL, SfInstrPlayMono3 },
*/
/*-------------------- GAB OPCODES ----------------------------------*/
/* deprecated */
{ "lpres",   S(LOWPR),    5,    "a",    "akko",  lowpr_set, NULL,   lowpr    },
{ "lpresx",  S(LOWPRX),    5,    "a",    "akkoo",  lowpr_setx, NULL,   lowprx    },
{ "posc",   S(POSC),     7,      "s",    "kkio", posc_set, kposc,   posckk   },
{ "lposc",  S(LPOSC),    5,      "a",    "kkkkio", lposc_set, NULL,   lposc   },
{ "physic1", S(WGUIDE1), 5,     "a",    "axkk",  wguide1set, NULL, wguide1  },
{ "physic2", S(WGUIDE2), 5,     "a",    "axxkkkk", wguide2set, NULL, wguide2 },
{ "vlpres",  S(LOWPR_SEP),    5,    "a",    "akkik",  lowpr_w_sep_set, NULL,   lowpr_w_sep    },
/* end */
{ "lposcint",   S(LPOSC),5,      "a",   "kkkkio", lposc_set, NULL,   lposcint   },
//{ "linsegold",S(LINSEG_OLD),  7,	"s",	"iin",	lsgset_old,	klnseg_old,	linseg_old	},
{ "ftlen2_i", S(EVAL),    1,     "i",    "i",    ftlen2                   },
{ "loscil2", S(LOSC),    5,     "mm","xkiojoojoo",losset2,NULL, loscil2   },
{ "fof3",   S(FOFS3),    5,     "a","xxxkkkkkiiiikk",fofset3,NULL,fof3   },
{ "foscili2",S(FOSC2),	5,	"a",  "xkkkkiio",foscset2,NULL,	foscili2 },

{ "call", S(ICALL),  1,  "",	"iiim",	icall			},
{ "callm", S(MICALL),  3,  "",	"iiim",	micall_set,	micall			},
{ "calld",S(DICALL), 3,  "",	"iiim",	dicall_set, dicall	},
{ "callmd",S(DMICALL), 3,  "",	"iiim",	dmicall_set, dmicall	},
{ "parmck",S(KARGC), 3,  "",	"z",	kargc_set, kargc	},
{ "parmtk",S(KARGT), 1,  "",	"z",	kargt_set	},
{ "parmca",S(KARGC), 5,  "",	"y",	argc_set, NULL, argc	},
{ "parmta",S(KARGT), 1,  "",	"y",	argt_set	},
{ "rtrnca",S(KARGC), 5,  "",	"y",	artrnc_set, NULL, artrnc	},
{ "rtrnta",S(KARGT), 1,  "",	"y",	artrnt_set  },
{ "rtrnck",S(KARGC), 3,  "",	"z",	krtrnc_set,  krtrnc	},
{ "rtrntk",S(KARGT), 1,  "",	"z",	krtrnt_set  	},

{ "tab_i",S(FASTAB),  1,   "i",    "iio", fastabi               },
{ "tab",S(FASTAB),  7,   "s",    "xio", fastab_set, fastabk,   fastab },
{ "tabw_i",S(FASTAB),  1,   "",    "iiio", fastabiw               },
{ "tabw",S(FASTAB),  7,   "",    "xxio", fastab_set, fastabkw,   fastabw },

/*--------- DirectSound 3D API -------------------*/
{ "Init3dAudio",S(INIT3D),  1,   "",    "i", init3d              },

{ "Out3d",S(OUT3D), 5,  "",	"ak",	out3d_set,   NULL,   out3d	},

{ "DsMode_i",S(OUT3DMODE),  1,   "",    "ii", o3dmode      },
{ "DsMode",  S(OUT3DMODE), 	2,     "",	"ki",	NULL, o3dmode, NULL},

{ "DsPosition_i",S(OUT3DPOS),  1,   "",    "iiii", o3dpos      },
{ "DsPosition",  S(OUT3DPOS), 	2,     "",	"kkki",	NULL, 	 o3dpos,	NULL},

{ "DsMinDistance_i",S(OUT3DPOS),  1,   "",    "ii", o3dmindist      },
{ "DsMinDistance",  S(OUT3DPOS), 	2,     "",	"ki",	NULL, 	 o3dmindist,	NULL},

{ "DsMaxDistance_i",S(OUT3DPOS),  1,   "",    "ii", o3dmaxdist      },
{ "DsMaxDistance",  S(OUT3DPOS), 	2,     "",	"ki",	NULL, 	 o3dmaxdist,	NULL},

{ "DsConeAngles_i",S(OUT3DCONEANG),  1,   "",    "iii", o3dconeang      },
{ "DsConeAngles",  S(OUT3DCONEANG), 	2,     "",	"kki",	NULL, 	 o3dconeang,	NULL},

{ "DsConeOrientation_i",S(OUT3DPOS),  1,   "",    "iiii", o3dconeorient      },
{ "DsConeOrientation",  S(OUT3DPOS), 	2,     "",	"kkki",	NULL,  o3dconeorient,	NULL},

{ "DsConeOutsideVolume_i",S(OUT3DCONEVOL),  1,   "",    "ii", o3dconevolume      },
{ "DsConeOutsideVolume",  S(OUT3DCONEVOL), 	2,     "",	"ki",	NULL, o3dconevolume, NULL},

{ "DsSetAll_i",S(OUT3DSETALL),  1,   "",       "iiiiiiiiiiiii", o3dsetAll      },
{ "DsSetAll",  S(OUT3DSETALL), 	2,     "",	"kkkkkkkkkkkki",	NULL, o3dsetAll, NULL},


{ "DsListenerPosition_i",S(LISTPOS),  1,   "",    "iii", list_pos      },
{ "DsListenerPosition",  S(LISTPOS), 	2,     "",	"kkk",	NULL, 	 list_pos,	NULL},

{ "DsListenerOrientation_i",S(LISTOR),  1,   "",    "iiiiii", list_or      },
{ "DsListenerOrientation",  S(LISTOR), 	2,     "",	"kkkkkk",	NULL, 	 list_or,	NULL},

{ "DsListenerRolloffFactor_i",S(LISTROLL),  1,   "",    "i", list_rolloff      },
{ "DsListenerRolloffFactor",  S(LISTROLL), 	2,     "",	"k",	NULL, 	 list_rolloff,	NULL},

{ "DsListenerDistanceFactor_i",S(LISTDIST),  1,   "",    "i", list_distance      },
{ "DsListenerDistanceFactor",  S(LISTDIST), 	2,     "",	"k",	NULL, 	 list_distance,	NULL},

{ "DsListenerSetAll_i",S(LISTSETALL),  1,   "",     "iiiiiiiiiii", o3dsetAll      },
{ "DsListenerSetAll",  S(LISTSETALL), 	2,     "",	"kkkkkkkkkkk",	NULL, o3dsetAll, NULL},


#ifdef GAB_EAX
/*----- EAX 2.0 API ----------*/
{ "InitEAX",S(COMMIT_DEFERRED),  1,   "",    "", init_eax        },

{ "EaxListenerEnvironment_i",S(EAX_PARM),  1,   "",    "i", eaxListEnvir      },
{ "EaxListenerEnvironment",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListEnvir, NULL},

{ "EaxListenerEnvSize_i",S(EAX_PARM),  1,   "",    "i", eaxListEnvirSize      },
{ "EaxListenerEnvSize",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListEnvirSize, NULL},

{ "EaxListenerEnvDiffusion_i",S(EAX_PARM),  1,   "",    "i", eaxListEnvirDiffusion      },
{ "EaxListenerEnvDiffusion",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListEnvirDiffusion, NULL},

{ "EaxListenerRoom_i",S(EAX_PARM),  1,   "",    "i", eaxListRoom      },
{ "EaxListenerRoom",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListRoom, NULL},

{ "EaxListenerRoomHF_i",S(EAX_PARM),  1,   "",    "i", eaxListRoomHF      },
{ "EaxListenerRoomHF",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListRoomHF, NULL},

{ "EaxListenerDecayTime_i",S(EAX_PARM),  1,   "",    "i", eaxListDecayTime      },
{ "EaxListenerDecayTime",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListDecayTime, NULL},

{ "EaxListenerDecayTimeHfRatio_i",S(EAX_PARM),  1,   "",    "i", eaxListDecayTimeHF      },
{ "EaxListenerDecayTimeHfRatio",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListDecayTimeHF, NULL},

{ "EaxListenerReflections_i",S(EAX_PARM),  1,   "",    "i", eaxListReflec      },
{ "EaxListenerReflections",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListReflec, NULL},

{ "EaxListenerReflectionsDelay_i",S(EAX_PARM),  1,   "",    "i", eaxListReflecDel      },
{ "EaxListenerReflectionsDelay",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListReflecDel, NULL},

{ "EaxListenerReverb_i",S(EAX_PARM),  1,   "",    "i", eaxListReverb      },
{ "EaxListenerReverb",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListReverb, NULL},

{ "EaxListenerReverbDelay_i",S(EAX_PARM),  1,   "",    "i", eaxListReverbDel      },
{ "EaxListenerReverbDelay",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListReverbDel, NULL},

{ "EaxListenerRoomRolloff_i",S(EAX_PARM),  1,   "",    "i", eaxListRoomRolloff      },
{ "EaxListenerRoomRolloff",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListRoomRolloff, NULL},

{ "EaxListenerAirAbsorption_i",S(EAX_PARM),  1,   "",    "i", eaxListAirAbsHF      },
{ "EaxListenerAirAbsorption",  S(EAX_PARM), 	2,     "",	"k",	NULL, eaxListAirAbsHF, NULL},

{ "EaxListenerFlags_i",S(EAX_LISTFLAGS),1,"","iiiiii", eaxListFlags      },
{ "EaxListenerFlags",  S(EAX_LISTFLAGS),2,"","kkkkkk", NULL, eaxListFlags, NULL},

{ "EaxListenerAll_i",S(EAX_LISTALL),1,"","iiiiiiiiiiiii", eaxListAll      },
{ "EaxListenerAll",  S(EAX_LISTALL),2,"","kkkkkkkkkkkkk", NULL, eaxListAll, NULL},

{ "EaxSourceDirect_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoDirect      },
{ "EaxSourceDirect",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoDirect, NULL},

{ "EaxSourceDirectHF_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoDirectHF      },
{ "EaxSourceDirectHF",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoDirectHF, NULL},

{ "EaxSourceRoom_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoRoom      },
{ "EaxSourceRoom",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoRoom, NULL},

{ "EaxSourceRoomHF_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoRoomHF      },
{ "EaxSourceRoomHF",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoRoomHF, NULL},

{ "EaxSourceObstruction_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoObstruct      },
{ "EaxSourceObstruction",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoObstruct, NULL},

{ "EaxSourceObstructionRatio_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoObstructRatio      },
{ "EaxSourceObstructionRatio",  S(EAX_PARM), 	2,     "",	"ki",	NULL, eaxSoObstructRatio, NULL},

{ "EaxSourceOcclusion_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoOccl      },
{ "EaxSourceOcclusion",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoOccl, NULL},

{ "EaxSourceOcclusionRatio_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoOcclRatio      },
{ "EaxSourceOcclusionRatio",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoOcclRatio, NULL},

{ "EaxSourceOcclusionRoomRatio_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoOcclRoom      },
{ "EaxSourceOcclusionRoomRatio",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoOcclRoom, NULL},

{ "EaxSourceRoomRolloff_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoRolloff      },
{ "EaxSourceRoomRolloff",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoRolloff, NULL},

{ "EaxSourceAirAbsorption_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoAirAbs      },
{ "EaxSourceAirAbsorption",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoAirAbs, NULL},

{ "EaxSourceOutsideVolumeHF_i",S(EAX_SOURCEPARM),  1,   "",    "ii", eaxSoOutVol      },
{ "EaxSourceOutsideVolumeHF",  S(EAX_SOURCEPARM), 	2,     "",	"ki",	NULL, eaxSoOutVol, NULL},

{ "EaxSourceAll_i",S(EAX_SOURCEALL),  1,"", "iiiiiiiiiiiii", eaxSoAll      },
{ "EaxSourceAll",  S(EAX_SOURCEALL), 2, "",	"kkkkkkkkkkkki", NULL, eaxSoAll, NULL},

{ "EaxSourceFlags_i",S(EAX_SOURCEFLAGS),1,"","iiii", eaxSoFlags      },
{ "EaxSourceFlags",  S(EAX_SOURCEFLAGS),2,"","kkki", NULL, eaxSoFlags, NULL},

#endif /* GAB_EAX */
/*-------------- DirectSound 3D and EAX common --------------*/
{ "DsEaxSetDeferredFlag",S(SET_DEFERRED),  1,   "",    "i", dsSetDeferredFlag      },
{ "DsCommitDeferredSettings_i",S(COMMIT_DEFERRED),  1,   "",   "", dsCommitDeferred      },
{ "DsCommitDeferredSettings",  S(COMMIT_DEFERRED),  2,   "",	"",	NULL, dsCommitDeferred, NULL},

{ "triginstr", S(TRIGINSTR),3,  "",     "kkkkkz",triginset, ktriginstr, NULL },
{ "schedkwhen", S(TRIGINSTR),3,  "",     "kkkkkz",triginset, ktriginstr, NULL },
{ "loopseg", S(LOOPSEG),3,	"k", "kkz",    loopseg_set, 	loopseg, NULL},
{ "lpshold", S(LOOPSEG),3,	"k", "kkz",    loopseg_set, 	lpshold, NULL},

{ "random_i", S(RANGERAND),	1,	"i",	"ii",   ikRangeRand, NULL, NULL    },
{ "random_k", S(RANGERAND),	2,	"k",	"kk",	NULL, ikRangeRand, NULL	},
{ "random_a", S(RANGERAND),	4,	"a",	"kk",	NULL, NULL,  aRangeRand	},
{ "rspline",  S(RANDOM3),	7,	"s",	"xxkk",	random3_set, random3, random3a	},
{ "randomi",  S(RANDOMI),	7,	"s",	"kkx",	randomi_set, krandomi, randomi	},
{ "randomh",  S(RANDOMH),	7,	"s",	"kkx",	randomh_set, krandomh, randomh	},
{ "jitter2", S(JITTER2),	3,	"k",	"kkkkkkk",	jitter2_set, jitter2, NULL	},
{ "jitter",  S(JITTER),	3,	"k", "kkk",	jitter_set, jitter, NULL	},
{ "jspline", S(JITTERS),7,	"s", "xkk",	jitters_set, jitters, jittersa	},

{ "vibrato", S(VIBRATO),3,	"k", "kkkkkkkkio",	vibrato_set, vibrato, NULL	},
{ "vibr", S(VIBRATO),3,	"k",     "kki",	vibr_set, vibr, NULL	},
{ "resonxk", S(KRESONX),   3,      "k",    "kkkooo", krsnsetx, kresonx,   NULL   },
{ "duserrnd_i", S(DURAND),	1,	"i",	"i",   ikDiscreteUserRand, NULL, NULL    },
{ "duserrnd_k", S(DURAND),	2,	"k",	"k",	NULL, ikDiscreteUserRand, NULL	},
{ "duserrnd_a", S(DURAND),	4,	"a",	"k",	NULL, NULL,  aDiscreteUserRand	},
{ "urd_i", S(DURAND),	1,	"i",	"i",   ikDiscreteUserRand, NULL, NULL    },
{ "urd_k", S(DURAND),	2,	"k",	"k",	NULL, ikDiscreteUserRand, NULL	},
{ "urd_a", S(DURAND),	4,	"a",	"a",	NULL, NULL,  aDiscreteUserRand	},
{ "cuserrnd_i", S(CURAND),	1,	"i",	"iii",  ikContinuousUserRand, NULL, NULL    },
{ "cuserrnd_k", S(CURAND),	2,	"k",	"kkk",	NULL, ikContinuousUserRand, NULL	},
{ "cuserrnd_a", S(CURAND),	4,	"a",	"kkk",	NULL, NULL,  aContinuousUserRand	},

{ "sfload",S(SFLOAD), 1,  "i",	"S",SfLoad	 	},
{ "sfplist",S(SFPLIST), 1,  "",	"i",Sfplist	 	}, 
{ "sfilist",S(SFPLIST), 1,  "",	"i",Sfilist	 	},
{ "sfpassign",S(SFPASSIGN), 1,  "",	"ii",SfAssignAllPresets	 	},
{ "sfpreset",S(SFPRESET), 1,  "i",	"iiii",SfPreset 	},
{ "sfplay", S(SFPLAY),  5, "aa", "iixxioo", SfPlay_set, NULL, SfPlay   },
{ "sfplay3", S(SFPLAY),  5, "aa", "iixxioo", SfPlay_set, NULL, SfPlay3   },
{ "sfplaym", S(SFPLAYMONO),  5, "a", "iixxioo", SfPlayMono_set, NULL, SfPlayMono   },
{ "sfplay3m", S(SFPLAYMONO),  5, "a", "iixxioo", SfPlayMono_set, NULL, SfPlayMono3   },
{ "sfinstr", S(SFIPLAY),  5, "aa", "iixxiioo", SfInstrPlay_set, NULL, SfInstrPlay   },
{ "sfinstrm", S(SFIPLAYMONO),  5, "a", "iixxiioo", SfInstrPlayMono_set, NULL, SfInstrPlayMono   },
{ "sfinstr3", S(SFIPLAY),  5, "aa", "iixxiioo", SfInstrPlay_set, NULL, SfInstrPlay3   },
{ "sfinstr3m", S(SFIPLAYMONO),  5, "a", "iixxiioo", SfInstrPlayMono_set, NULL, SfInstrPlayMono3   },

{ "trigseq", S(TRIGSEQ),   3,      "",    "kkkkkz", trigseq_set, trigseq,   NULL   },
{ "seqtime", S(SEQTIM),   3,      "k",    "kkkkk", seqtim_set, seqtim,   NULL   },

{ "vtablei", S(MTABLEI),   1,     "",   "iiiim", mtable_i,   NULL   },
{ "vtablek", S(MTABLE),   3,      "",   "kkkiz", mtable_set, mtable_k,   NULL   },
{ "vtablea", S(MTABLE),   5,      "",   "akkiy", mtable_set, NULL, mtable_a    },

{ "vtablewi", S(MTABLEIW),  1,    "",   "iiim", mtablew_i,   NULL   },
{ "vtablewk", S(MTABLEW),   3,    "",   "kkiz", mtablew_set, mtablew_k,   NULL   },
{ "vtablewa", S(MTABLEW),   5,    "",   "akiy", mtablew_set, NULL, mtablew_a    },

{ "vtabi", S(MTABI),   1,     "",   "iiiim", mtab_i,   NULL   },
{ "vtabk", S(MTAB),   3,      "",   "kkkiz", mtab_set, mtab_k,   NULL   },
{ "vtaba", S(MTAB),   5,      "",   "akkiy", mtab_set, NULL, mtab_a    },

{ "vtabwi", S(MTABIW),  1,    "",   "iiim", mtabw_i,   NULL   },
{ "vtabwk", S(MTABW),   3,    "",   "kkiz", mtabw_set, mtabw_k,   NULL   },
{ "vtabwa", S(MTABW),   5,    "",   "akiy", mtabw_set, NULL, mtabw_a    },

//{ "poscils",   S(POSCILS2),  7,  "s",    "kkio", poscils_set, kposcils,poscilsa }, 
//{ "poscil3",  S(POSC),  7,      "s",    "kkio", posc_set, kposc3, posc3 },
{ "schedk", S(SCHEDK2),3,  "",     "kkz",schedk_i, schedk, NULL },
//{ "trigcall", S(TCALL),2,  "",     "kkz",NULL, trigcall, NULL },

//{ "test", S(TEST),   3,    "k",   "k", test_set, test,   NULL   },

{ "dashow_i",S(DSH),    1,      "ii",    "iiii",    dashow               },
{ "dashow_k",S(DSH),    2,      "kk",    "kkkk",    NULL,   dashow      },

{ "octave_i",S(EVAL),    1,      "i",    "i",    ipowoftwo                  },
{ "octave_k",S(EVAL),    3,      "k",    "k",    powoftwo_set,   powoftwo          },
{ "octave_a",S(EVAL),    5,      "a",    "a",    powoftwo_set, NULL  ,powoftwoa          },
{ "semitone_i",S(EVAL),    1,      "i",    "i",  isemitone                  },
{ "semitone_k",S(EVAL),    3,      "k",    "k",  powoftwo_set,   semitone          },
{ "semitone_a",S(EVAL),    5,      "a",    "a",  powoftwo_set, NULL  ,semitone_a          },
{ "cent_i",S(EVAL),    1,      "i",    "i",    icent                  },
{ "cent_k",S(EVAL),    3,      "k",    "k",    powoftwo_set,   cent          },
{ "cent_a",S(EVAL),    5,      "a",    "a",    powoftwo_set, NULL  ,cent_a          },
{ "db_i",S(EVAL),    1,      "i",    "i",    idb                  },
{ "db_k",S(EVAL),    3,      "k",    "k",    powoftwo_set,   db          },
{ "db_a",S(EVAL),    5,      "a",    "a",    powoftwo_set, NULL  ,db_a          },


{ "lineto",S(LINETO),    3,      "k",    "kk",   lineto_set,   lineto      },
{ "tlineto",S(LINETO2),    3,      "k",    "kkk",   tlineto_set,   tlineto      },
{ "bmopen",S(BMOPEN), 1,  "iii",	"Sio",bmopen	 	},
{ "bmtable",S(BMTABLE),    3,      "kkkk",    "kki",   bmtable_set,   bmtable      },
{ "bmtablei",S(BMTABLE),   3,      "kkkk",    "kki",   bmtable_set,   bmtablei      },
{ "bmoscil",S(BMOSCIL),    3,      "kkkk",    "kkkkkkki",   bmoscil_set,   bmoscil      },
{ "bmoscili",S(BMOSCIL),    3,      "kkkk",    "kkkkkkki",   bmoscil_set,   bmoscili      },
{ "rgb2hsvl",S(RGB2HSVL),    2,      "kkkk",    "kkk",   NULL,   rgb2hsvl      },
{ "rgb2hsvl_i",S(RGB2HSVL),  1,      "iiii",    "iii",  rgb2hsvl,         },
{ "bmscan",S(BMSCAN),    3,      "",    "kiiiiii",   bmscan_set,   bmscan      },
{ "bmscani",S(BMSCAN),    3,      "",    "kiiiiii",   bmscan_set,   bmscani      },
{ "metro",  S(METRO),	   3,		"k",	"ko",	metro_set,	metro		},
{ "mandel",S(MANDEL),    3,      "kk",    "kkkk",   mandel_set,   mandel      },
{ "cpstun",S(CPSTUN),    2,      "k",    "kkk",   NULL,   cpstun      },
{ "cpstuni",S(CPSTUNI),    1,      "i",    "ii",   cpstun_i,        },
{ "vadd",S(VECTOROP),    3,        "",    "iki",   vectorOp_set,   vadd      },
{ "vmult",S(VECTOROP),   3,        "",    "iki",   vectorOp_set,   vmult     },
{ "vpow",S(VECTOROP),    3,        "",    "iki",   vectorOp_set,   vpow      },
{ "vexp",S(VECTOROP),    3,        "",    "iki",   vectorOp_set,   vexp      },
{ "vaddv",S(VECTORSOP),  3,        "",    "iii",   vectorsOp_set,   vaddv      },
{ "vsubv",S(VECTORSOP),  3,        "",    "iii",   vectorsOp_set,   vsubv      },
{ "vmultv",S(VECTORSOP), 3,        "",    "iii",   vectorsOp_set,   vmultv      },
{ "vdivv",S(VECTORSOP),  3,        "",    "iii",   vectorsOp_set,   vdivv      },
{ "vpowv",S(VECTORSOP),  3,        "",    "iii",   vectorsOp_set,   vpowv      },
{ "vexpv",S(VECTORSOP),  3,        "",    "iii",   vectorsOp_set,   vexpv      },
{ "vcopy",S(VECTORSOP),  3,        "",    "iii",   vectorsOp_set,   vcopy      },
{ "vmap",S(VECTORSOP),   3,        "",    "iii",   vectorsOp_set,   vmap },
{ "vlimit",S(VLIMIT),    3,        "",    "ikki",   vlimit_set,   vlimit      },
{ "vwrap",S(VLIMIT),     3,        "",    "ikki",   vlimit_set,   vwrap      },
{ "vmirror",S(VLIMIT),   3,        "",    "ikki",   vlimit_set,   vmirror      },
{ "vlinseg",S(VSEG),    3,        "",    "iin",   vseg_set,   vlinseg      },
{ "vexpseg",S(VSEG),    3,        "",    "iin",   vseg_set,   vexpseg      },
{ "vrandh",S(VRANDH),   3,        "",    "ikki",  vrandh_set,   vrandh      },
{ "vrandi",S(VRANDI),   3,        "",    "ikki",  vrandi_set,   vrandi      },
{ "vport",S(VPORT),    3,        "",    "ikio",  vport_set,  vport    },
{ "vecdelay",S(VECDEL), 3,        "",    "iiiiio",vecdly_set,  vecdly    },
{ "vdelayk",S(KDEL),   3,        "k",   "kkio",  kdel_set,  kdelay    },

{ "vcella",S(CELLA),   3,        "",    "kkiiiiip",  ca_set,  ca    },
{ "seqtime2", S(SEQTIM2),   3,      "k",    "kkkkkk", seqtim2_set, seqtim2, NULL},
{ "adsynt2",S(ADSYNT2),    5,     "a",  "kkiiiio", adsynt2_set,  NULL,  adsynt2  },


	/*------*/
{ "FLslider",S(FLSLIDER),    1,     "ki",  "Siijjjjjjj", fl_slider  },
{ "FLknob",S(FLKNOB),		1,     "ki",  "Siijjjjjj", fl_knob  },
{ "FLroller",S(FLROLLER),   1,     "ki",  "Siijjjjjjjj", fl_roller  },
{ "FLtext",S(FLTEXT),		1,     "ki",  "Siijjjjjj", fl_text  },
{ "FLjoy",S(FLJOYSTICK),    1,     "kkii",  "Siiiijjjjjjjj", fl_joystick  },
{ "FLcount",S(FLCOUNTER),   1,     "ki", "Siiiiiiiiiiz", fl_counter  },
{ "FLbutton",S(FLBUTTON),   1,     "ki",  "Siiiiiiiz", fl_button  },

{ "FLbutBank",S(FLBUTTONBANK),   1,     "ki",  "iiiiiiiiz", fl_button_bank  },

{ "FLkeyb",S(FLKEYB),		1,     "k",  "z", FLkeyb  },


{ "FLcolor",S(FLWIDGCOL),    1,     "",  "jjjjjj", fl_widget_color  },
{ "FLlabel",S(FLWIDGLABEL),    1,     "",  "ojojjj", fl_widget_label  },

{ "FLsetVal_i",S(FL_SET_WIDGET_VALUE_I), 1,  "",  "ii", fl_setWidgetValuei  },
{ "FLsetVal",S(FL_SET_WIDGET_VALUE_I), 1,  "",  "ii", fl_setWidgetValue  },

{ "FLsetColor",S(FL_SET_COLOR), 1,  "",  "iiii", fl_setColor1  },
{ "FLsetColor2",S(FL_SET_COLOR), 1,  "",  "iiii", fl_setColor2  },
{ "FLsetTextSize",S(FL_SET_TEXTSIZE), 1,  "",  "ii", fl_setTextSize  },
{ "FLsetTextColor",S(FL_SET_COLOR), 1,  "",  "iiii", fl_setTextColor  },
{ "FLsetFont",S(FL_SET_FONT), 1,  "",  "ii", fl_setFont  },
{ "FLsetTextType",S(FL_SET_FONT), 1,  "",  "ii", fl_setTextType  },
{ "FLsetText",S(FL_SET_TEXT), 1,  "",  "Si", fl_setText  },
{ "FLsetSize",S(FL_SET_SIZE), 1,  "",  "iii", fl_setSize  },
{ "FLsetPosition",S(FL_SET_POSITION), 1,  "",  "iii", fl_setPosition  },
{ "FLhide",S(FL_WIDHIDE), 1,  "",  "i", fl_hide  },
{ "FLshow",S(FL_WIDSHOW), 1,  "",  "i", fl_show  },
{ "FLsetBox",S(FL_SETBOX), 1,  "",  "ii", fl_setBox  },
{ "FLsetAlign",S(FL_TALIGN), 1,  "",  "ii", fl_align  },
{ "FLbox",S(FL_BOX), 1,  "i",  "Siiiiiii", fl_box  },

	/*------*/

{ "FLvalue",S(FLVALUE),		1,     "i",  "Sjjjj", fl_value  },

{ "FLpanel",S(FLPANEL),    1,     "",  "Sjjooo", StartPanel  },
{ "FLpanel_end",S(FLPANELEND),    1,     "",  "", EndPanel  },
{ "FLscroll",S(FLSCROLL),	1,     "",  "iiii", StartScroll  },
{ "FLscroll_end",S(FLSCROLLEND),1, "",  "", EndScroll  },
{ "FLpack",S(FLPACK),		1,     "",  "iiii", StartPack  },
{ "FLpack_end",S(FLPACKEND),1,     "",  "", EndPack  },
{ "FLtabs",S(FLTABS),		1,     "",  "iiii", StartTabs  },
{ "FLtabs_end",S(FLTABSEND),1,     "",  "", EndTabs  },
{ "FLgroup",S(FLGROUP),		1,     "",  "Siiiij", StartGroup  },
{ "FLgroup_end",S(FLGROUPEND),1,   "",  "", EndGroup  },


{ "FLsetsnap",S(FLSETSNAP), 1,     "ii", "io", set_snap  },
{ "FLgetsnap",S(FLGETSNAP), 1,     "i", "i", get_snap  },
{ "FLsavesnap",S(FLSAVESNAPS), 1,     "", "S", save_snap  },
{ "FLloadsnap",S(FLLOADSNAPS), 1,     "", "S", load_snap  },

{ "FLrun",S(FLRUN),			1,     "",  "", FL_run  },
{ "FLupdate",S(FLRUN),		1,     "",  "", fl_update  },
{ "FLprintk",S(FLPRINTK),	3,     "",  "iki", FLprintkset,FLprintk  },
{ "FLprintk2",S(FLPRINTK2),	2,     "",  "ki", NULL,FLprintk2  },


{ "timedseq",S(TIMEDSEQ),		3,     "k",  "kiiz", timeseq_set,timeseq  },
{ "lposcinta",   S(LPOSC),5,      "a",   "akkkio", lposc_set, NULL,   lposcinta},


};

long oplength_1 = sizeof(opcodlst_1);
