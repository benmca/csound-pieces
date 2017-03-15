#include "cs.h"                 /*                      ENTRY.C         */
#include "insert.h"
#include "clarinet.h"
#include "flute.h"
#include "bowed.h"
#include "bowedbar.h"
#include "marimba.h"
#include "brass.h"
#include "vibraphn.h"
#include "shaker.h"
#include "phisem.h"
#include "fm4op.h"
#include "moog1.h"
#include "singwave.h"
#include "mandolin.h"
#include "midiops.h"
#include "dcblockr.h"
#include "flanger.h"
#include "lowpassr.h"
#if defined(CWIN) || defined(TCLTK)
#include "control.h"
#endif
#include "schedule.h"
#include "cwindow.h"
#include "spectra.h"
#include "pitch.h"
#include "scansyn.h"
#include "scansynx.h"
#include "vbap.h"
#include "uggab.h"
#include "repluck.h"
#include "aops.h"
#include "ugens1.h"
#include "nlfilt.h"
#include "fhtfun.h"
#include "vdelay.h"
#include "ugens2.h"
#include "babo.h"
#include "ugmoss.h"
#include "bbcut.h"
#include "spat3d.h"
#include "pstream.h"
#include "oscbnk.h"
#include "oscils.h"

#define S       sizeof

#if defined(CWIN) || defined(TCLTK)
void    cntrl_set(void*), control(void*), ocontrol(void*);
void    button_set(void*), button(void*), check_set(void*), check(void*);
void    textflash(void*);
#endif
void    varicolset(void*), varicol(void*);
void    pinkset(void*), pinkish(void*), inh(void*), ino(void*), in16(void*);
void    in32(void*), inall(void*), zaset(void*), inz(void*), outh(void*);
void    outo(void*), outx(void*), outX(void*), outch(void*), outall(void*);
void    zaset(void*), outz(void*), cpsxpch(void*), cps2pch(void*);
void    cpstun(void*),cpstun_i(void*);
void    nlfiltset(void*), nlfilt(void*), Xsynthset(void*), Xsynth(void*);
void    wgpsetin(void*), wgpluck(void*), wgpset(void*), wgpluck(void*);
void    clarinset(void*), clarin(void*), fluteset(void*), flute(void*);
void    bowedset(void*), bowed(void*), bowedbarset(void*), bowedbar(void*);
void    brassset(void*), brass(void*), marimbaset(void*), marimba(void*);
void    vibraphnset(void*), vibraphn(void*), agogobelset(void*), agogobel(void*);
void    shakerset(void*), shaker(void*), cabasaset(void*), cabasa(void*);
void    crunchset(void*), cabasa(void*), sekereset(void*), sekere(void*);
void    sandset(void*), sekere(void*), stixset(void*), sekere(void*);
void    guiroset(void*), guiro(void*), tambourset(void*), tambourine(void*);
void    bambooset(void*), bamboo(void*), wuterset(void*), wuter(void*);
void    sleighset(void*), sleighbells(void*), tubebellset(void*), tubebell(void*);
void    rhodeset(void*), tubebell(void*), wurleyset(void*), wurley(void*);
void    heavymetset(void*), heavymet(void*), b3set(void*), hammondB3(void*);
void    FMVoiceset(void*), FMVoice(void*), percfluteset(void*), percflute(void*);
void    Moog1set(void*), Moog1(void*), voicformset(void*), voicform(void*);
void    mandolinset(void*), mandolin(void*), dcblockrset(void*), dcblockr(void*);
void    flanger_set(void*), flanger(void*), sum(void*), product(void*);
void    macset(void*), maca(void*), macset(void*), mac(void*), instcount(void*);
void    adsrset(void*), klnseg(void*), linseg(void*), madsrset(void*);
void    klnsegr(void*), linsegr(void*), xdsrset(void*), kxpseg(void*);
void    expseg(void*), mxdsrset(void*), kxpsegr(void*), expsegr(void*);
void    schedule(void*), schedwatch(void*), ifschedule(void*), kschedule(void*);
void    triginset(void*), ktriginstr(void*), trigseq_set(void*), trigseq(void*);
void    eventOpcode(void*);
void    seqtim_set(void*), seqtim(void*), lfoset(void*), lfok(void*);
void    lfoa(void*), stresonset(void*), streson(void*), pitchset(void*);
void    pitch(void*), clockset(void*), clockon(void*), clockset(void*);
void    clockoff(void*), clockread(void*), impulse_set(void*), impulse(void*);
void    pitchamdfset(void*), pitchamdf(void*), scsnu_init(void*);
void    scsnu_play(void*);
void    scsnux_init(void*),scsnux(void*),scsnsx_init(void*),scsnsx(void*);
void    scsns_init(void*), scsns_play(void*), clip_set(void*), clip(void*);
void    vbap_FOUR_init(void*), vbap_FOUR (void*), vbap_EIGHT_init(void*);
void    vbap_EIGHT(void*), vbap_SIXTEEN_init(void*), vbap_SIXTEEN(void*);
void    vbap_zak_init(void*), vbap_zak(void*), vbap_ls_init(void*);
void    vbap_FOUR_moving_init(void*), vbap_FOUR_moving(void*);
void    vbap_EIGHT_moving_init(void*), vbap_EIGHT_moving(void*);
void    vbap_SIXTEEN_moving_init(void*), vbap_SIXTEEN_moving(void*);
void    vbap_zak_moving_init(void*), vbap_zak_moving(void*), ksense(void*);
void    isense(void*), reverbx_set(void*), reverbx(void*);
void    Foscset(void*), Fosckk(void*);
void    trnset(void*), ktrnseg(void*), trnseg(void*);
void    lpf18set(void*), lpf18db(void*);
void    wavesetset(void*), waveset(void*);
void    dconvset(void *), dconv(void *);
void    vcombset(void *), vcomb(void *), valpass(void *);
void    ftmorfset(void *), ftmorf(void *);
void    pfun(void*);
void    BBCutMonoInit(void *), BBCutMono(void *), BBCutStereoInit(void *);
void    BBCutStereo(void *);
void    spat3dset(void*), spat3d(void*), spat3diset(void*), spat3di(void*);
void    spat3dt(void*);
void    pvsanalset(void *),pvsanal(void *),pvsynthset(void*),pvsynth(void *);
void    pvadsynset(void *), pvadsyn(void *);
void    pvscrosset(void *),pvscross(void *);
void    pvsfreadset(void *), pvsfread(void *);
void    pvsmaskaset(void *),pvsmaska(void *);
void    pvsftwset(void *),pvsftw(void *),pvsftrset(void *),pvsftr(void *);
void    pvsinfo(void *), gettempo(void*);
void    fassign(void *);
void    loopseg_set(void*), loopseg(void*), lpshold(void*);
void    lineto_set(void*), lineto(void*), tlineto_set(void*),tlineto(void*);
void    vibrato_set(void*), vibrato(void*),vibr_set(void*), vibr(void*);
void    jitter2_set(void*), jitter2(void*),jitter_set(void*), jitter(void*);
void    jitters_set(void*), jitters(void*), jittersa(void*);
void    oscbnkset(void*), oscbnk(void*), userrnd_set(void*);
void    iDiscreteUserRand(void*), kDiscreteUserRand(void*), Cuserrnd_set(void*);
void    aDiscreteUserRand(void*), iContinuousUserRand(void*);
void    kContinuousUserRand(void*), aContinuousUserRand(void*);
void    ikRangeRand(void*), aRangeRand(void*);
void    randomi_set(void*), krandomi(void*), randomi(void*);
void    randomh_set(void*), krandomh(void*), randomh(void*);
void    random3_set(void*), random3(void*),random3a(void*);
void    ipowoftwo(void *), ilogbasetwo(void *), db(void*);
void    powoftwo_set(void *), powoftwoa(void *), dbi(void*), dba(void*);
void    powoftwo(void *), powoftwoa(void *), semitone(void*), isemitone(void*);
void    asemitone(void*), cent(void*), icent(void*), acent(void*);
void    grain2set(void*), grain2(void*), grain3set(void*), grain3(void*);
void    rnd31set(void*), rnd31i(void*), rnd31k(void*), rnd31a(void*);
void    and_kk(void*), and_ka(void*), and_ak(void*), and_aa(void*);
void    or_kk(void*), or_ka(void*), or_ak(void*), or_aa(void*);
void    xor_kk(void*), xor_ka(void*), xor_ak(void*), xor_aa(void*);
void    not_k(void*), not_a(void*);

/* thread vals, where isub=1, ksub=2, asub=4:
                0 =     1  OR   2  (B out only)
                1 =     1
                2 =             2
                3 =     1  AND  2
                4 =                     4
                5 =     1  AND          4
                7 =     1  AND (2  OR   4)                      */

/* inarg types include the following:
                m       begins an indef list of iargs (any count)
                n       begins an indef list of iargs (nargs odd)
                o       optional, defaulting to 0
                p          "            "       1
                q          "            "       10
                v          "            "       .5
                j          "            "       -1
                h          "            "       127
                y       begins indef list of aargs (any count)
                z       begins indef list of kargs (any count)
                Z       begins alternating kakaka...list (any count)
   outarg types include:
                m       multiple outargs (1 to 4 allowed)
   (these types must agree with rdorch.c)                       */

/* If dsblksize is 0xffff then translate */
/*                 0xfffe then translate two (oscil) */
/*                 0xfffd then translate two (peak) */
/*                 0xfffc then translate two (divz) */

OENTRY opcodlst_2[] = {
/* opcode   dspace      thread  outarg  inargs  isub    ksub    asub    */
{ "pinkish", S(PINKISH),  5,    "a",    "xoooo", pinkset, NULL, pinkish },
{ "noise",  S(VARI),   5,       "a",    "xk",   varicolset, NULL, varicol },
{ "inh",    S(INQ),     4,      "aaaaaa","",    NULL,   NULL,   inh     },
{ "ino",    S(INQ),     4,      "aaaaaaaa","",  NULL,   NULL,   ino     },
{ "inx",    S(INALL),   4,      "aaaaaaaaaaaaaaaa","",  NULL,   NULL,   in16 },
{ "in32",   S(INALL),   4,      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                        "",     NULL,   NULL,   in32 },
{ "inch",   S(INALL),   4,      "a",    "k",    NULL,   NULL,   inall   },
{ "inz",    S(IOZ),     4,      "",     "k",    zaset,  NULL,   inz     },
  /* Note that there is code in rdorch.c that assumes that opcodes starting
     with the charcters out followed by a s, q, h, o or x are in this group
     ***BEWARE***
   */
{ "outh",   S(OUTH),    4,      "",     "aaaaaa",NULL,  NULL,   outh    },
{ "outo",   S(OUTO),    4,      "",     "aaaaaaaa",NULL,NULL,   outo    },
{ "outx",   S(OUTX),    4,      "",     "aaaaaaaaaaaaaaaa",NULL,NULL, outx },
{ "out32",  S(OUTX),    4,      "",     "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                                NULL,   NULL,   outX    },
{ "outch",  S(OUTCH),   4,      "",     "Z",    NULL,   NULL,   outch   },
{ "outc",   S(OUTX),    4,      "",     "y",    NULL,   NULL,   outall  },
{ "outz",   S(IOZ),     4,      "",     "k",    zaset,  NULL,   outz    },
{ "cpsxpch", S(XENH),   1,      "i",    "iiii", cpsxpch, NULL,  NULL    },
{ "cps2pch", S(XENH),   1,      "i",    "ii",   cps2pch, NULL,  NULL    },
{ "cpstun", S(CPSTUN),  2,      "k",    "kkk",   NULL,   cpstun         },
{ "cpstuni",S(CPSTUNI), 1,      "i",    "ii",   cpstun_i,               },
{ "nlfilt",  S(NLFILT), 5,      "a",    "akkkkk",nlfiltset, NULL, nlfilt},
{ "cross2",  S(CON),    5,      "a",    "aaiiik",Xsynthset, NULL, Xsynth},
{ "repluck", S(WGPLUCK2), 5,    "a",    "ikikka",wgpsetin,   NULL,     wgpluck},
{ "wgpluck2",S(WGPLUCK2), 5,    "a",    "ikikk", wgpset,     NULL,     wgpluck},
{ "wgclar",  S(CLARIN),  5,     "a",    "kkkiikkkio",clarinset,NULL,   clarin},
{ "wgflute", S(FLUTE),   5,     "a",    "kkkiikkkiovv",fluteset,NULL,  flute },
{ "wgbow",   S(BOWED),   5,     "a",    "kkkkkkio", bowedset, NULL,    bowed },
{ "wgbowedbar", S(BOWEDBAR), 5, "a",    "kkkkkoooo", bowedbarset, NULL, bowedbar },
{ "wgbrass", S(BRASS),   5,     "a",    "kkkikkio", brassset, NULL,     brass},
{ "marimba", S(MARIMBA), 5,     "a",    "kkiiikkiioo", marimbaset, NULL, marimba},
{ "vibes", S(VIBRAPHN),  5,     "a",    "kkiiikkii", vibraphnset,NULL,vibraphn},
{ "gogobel",S(VIBRAPHN), 5,     "a",    "kkiiikki", agogobelset,NULL, agogobel},
{ "shaker",  S(SHAKER),  5,     "a",    "kkkkko",  shakerset, NULL,   shaker},
{ "cabasa",  S(CABASA),  5,     "a",    "iiooo",    cabasaset, NULL,   cabasa},
{ "crunch",  S(CABASA),  5,     "a",    "iiooo",    crunchset, NULL,   cabasa},
{ "sekere",  S(SEKERE),  5,     "a",    "iiooo",    sekereset, NULL,   sekere},
{ "sandpaper", S(SEKERE),5,     "a",    "iiooo",    sandset, NULL,   sekere},
{ "stix", S(SEKERE),     5,     "a",    "iiooo",    stixset, NULL,   sekere},
{ "guiro", S(GUIRO),     5,     "a",    "kiooooo",   guiroset, NULL, guiro},
{ "tambourine", S(TAMBOURINE),5,"a",    "kioooooo", tambourset, NULL, tambourine},
{ "bamboo", S(BAMBOO),   5,     "a",    "kioooooo", bambooset, NULL, bamboo },
{ "dripwater", S(WUTER), 5,     "a",    "kioooooo", wuterset, NULL, wuter },
{ "sleighbells", S(SLEIGHBELLS), 5, "a","kioooooo", sleighset, NULL, sleighbells },
{ "fmbell",  S(FM4OP),   5,     "a",    "kkkkkkiiiii",tubebellset,NULL,tubebell},
{ "fmrhode", S(FM4OP),   5,     "a",    "kkkkkkiiiii",rhodeset,NULL,  tubebell},
{ "fmwurlie", S(FM4OP),  5,     "a",    "kkkkkkiiiii",wurleyset, NULL, wurley},
{ "fmmetal", S(FM4OP),   5,     "a",    "kkkkkkiiiii",heavymetset, NULL, heavymet},
{ "fmb3", S(FM4OP),      5,     "a",    "kkkkkkiiiii", b3set, NULL, hammondB3},
{ "fmvoice", S(FM4OPV),  5,     "a",    "kkkkkkiiiii",FMVoiceset, NULL, FMVoice},
{ "fmpercfl", S(FM4OP),  5,     "a",    "kkkkkkiiiii",percfluteset, NULL, percflute},
{ "moog", S(MOOG1),      5,     "a",    "kkkkkkiii", Moog1set, NULL, Moog1  },
{ "voice", S(VOICF),     5,     "a",    "kkkkkkii", voicformset, NULL, voicform},
{ "mandol", S(MANDOL),   5,     "a",    "kkkkkkio", mandolinset, NULL, mandolin},
{ "dcblock", S(DCBlocker),5,    "a",    "ao",   dcblockrset, NULL, dcblockr},
{ "flanger", S(FLANGER), 5,     "a",    "aakv", flanger_set, NULL, flanger },
{ "sum", S(SUM),         4,     "a",    "y",    NULL, NULL, sum            },
{ "product", S(SUM),     4,     "a",    "y",    NULL, NULL, product        },
{ "maca", S(SUM),        5,     "a",    "y",    macset,      NULL, maca    },
{ "mac", S(SUM),         5,     "a",    "Z",    macset,      NULL, mac     },
{ "active", 0xffff                                                         },
{ "active_i", S(INSTCNT),1,     "i",    "i",    instcount, NULL, NULL      },
{ "active_k", S(INSTCNT),3,     "k",    "k",    NULL, instcount, NULL      },
#if defined(CWIN) || defined(TCLTK)
{ "control", S(CNTRL),   3,     "k",    "k",    cntrl_set, control, NULL   },
{ "setctrl", S(SCNTRL),  1,     "",     "iSi",  ocontrol, NULL, NULL   },
{ "button", S(CNTRL),    3,     "k",    "k",    button_set, button, NULL   },
{ "checkbox", S(CNTRL),  3,     "k",    "k",    check_set, check,   NULL   },
{ "flashtxt", S(TXTWIN), 1,     "",     "iS",   textflash, NULL,    NULL   },
#endif
{ "adsr", S(LINSEG),     7,     "s",    "iiiio",adsrset,klnseg, linseg     },
{ "madsr", S(LINSEG),    7,     "s",    "iiiioj", madsrset,klnsegr, linsegr },
{ "xadsr", S(EXXPSEG),   7,     "s",    "iiiio", xdsrset, kxpseg, expseg    },
{ "mxadsr", S(EXPSEG),   7,     "s",    "iiiioj", mxdsrset, kxpsegr, expsegr },
{ "transeg", S(TRANSEG), 7,     "s",    "iiim", trnset, ktrnseg,    trnseg },
{ "schedule", S(SCHED),  1,     "",     "iiim", schedule, schedwatch, NULL },
{ "schedwhen", S(WSCHED),3,     "",     "kkkkm",ifschedule, kschedule, NULL },
{ "schedkwhen", S(TRIGINSTR), 3,"",     "kkkkkz",triginset, ktriginstr, NULL },
{ "trigseq", S(TRIGSEQ), 3,     "",     "kkkkkz", trigseq_set, trigseq, NULL },
{ "seqtime", S(SEQTIM),  3,     "k",    "kkkkk", seqtim_set, seqtim, NULL   },
{ "event", S(LINEVENT),  2,     "",     "Sz",   NULL, eventOpcode, NULL },
{ "lfo", S(LFO),         7,     "s",    "kko",  lfoset,   lfok,   lfoa     },
{ "streson", S(STRES),   5,     "a",    "aki",  stresonset, NULL, streson  },
{ "pitch", S(PITCH),     5,    "kk", "aiiiiqooooojo", pitchset, NULL, pitch },
{ "clockon", S(CLOCK),   3,     "",     "i",    clockset, clockon, NULL    },
{ "clockoff", S(CLOCK),  3,     "",     "i",    clockset, clockoff, NULL   },
{ "readclock", S(CLKRD), 1,     "i",    "i",    clockread, NULL, NULL      },
{ "mpulse", S(IMPULSE),  5,     "a",    "kko",  impulse_set, NULL, impulse },
{ "pitchamdf",S(PITCHAMDF), 5,  "kk","aiioppoo", pitchamdfset, NULL, pitchamdf },
{ "scanu", S(PSCSNU),5, "", "iiiiiiikkkkiikkaii", scsnu_init, NULL, scsnu_play },
{ "scans", S(PSCSNS),    5,     "a",    "kkiio", scsns_init, NULL, scsns_play},
{ "xscanu", S(PSCSNUX),5, "", "iiiiSiikkkkiikkaii", scsnux_init, NULL, scsnux },
{ "xscans", S(PSCSNSX),  5,     "a",    "kkiio", scsnsx_init, NULL, scsnsx},
{ "clip", S(CLIP),       5,     "a",    "aiiv", clip_set, NULL, clip        },
{ "vbap4",  S(VBAP_FOUR), 5, "aaaa","aioo", vbap_FOUR_init, NULL, vbap_FOUR },
{ "vbap8",  S(VBAP_EIGHT), 5, "aaaaaaaa","aioo", vbap_EIGHT_init, NULL, vbap_EIGHT },
{ "vbap16", S(VBAP_SIXTEEN), 5, "aaaaaaaaaaaaaaaa","aioo", vbap_SIXTEEN_init, NULL, vbap_SIXTEEN },
{ "vbapz",  S(VBAP_ZAK), 5,     "",    "iiaioo", vbap_zak_init, NULL, vbap_zak },
{ "vbaplsinit",  S(VBAP_LS_INIT), 1, "","iioooooooooooooooooooooooooooooooo", vbap_ls_init},
{ "vbap4move",  S(VBAP_FOUR_MOVING), 5, "aaaa","aiiim", vbap_FOUR_moving_init, NULL, vbap_FOUR_moving },
{ "vbap8move",  S(VBAP_EIGHT_MOVING), 5, "aaaaaaaa","aiiim", vbap_EIGHT_moving_init, NULL, vbap_EIGHT_moving },
{ "vbap16move",  S(VBAP_SIXTEEN_MOVING), 5, "aaaaaaaaaaaaaaaa","aiiim", vbap_SIXTEEN_moving_init, NULL, vbap_SIXTEEN_moving },
{ "vbapzmove",  S(VBAP_ZAK_MOVING), 5, "","iiaiiim", vbap_zak_moving_init, NULL, vbap_zak_moving },
{ "sense", S(KSENSE),    2,     "k",    "",      isense, ksense, NULL           },
{ "sensekey", S(KSENSE), 2,     "k",    "",      NULL, ksense, NULL             },
{ "tempoval", S(GTEMPO), 2,     "k",    "",      NULL, gettempo, NULL           },
{ "xxx", S(XOSC),        5,     "a",    "kkio",  Foscset, NULL, Fosckk          },
{ "reverb2",  S(NREV2),  5,     "a",    "akkoojoj", reverbx_set,NULL,reverbx    },
{ "nreverb",  S(NREV2),  5,     "a",    "akkoojoj", reverbx_set,NULL,reverbx    },
{ "babo",   S(BABO),     5,     "aa",   "akkkiiijj", baboset, NULL, babo        },
{ "lpf18", S(LPF18),     5,     "a",    "akkk",  lpf18set, NULL, lpf18db        },
{ "waveset", S(BARRI),   5,     "a",    "ako",   wavesetset,  NULL, waveset     },
{ "dconv",  S(DCONV),    5,     "a",    "aii",   dconvset, NULL, dconv          },
{ "vcomb", S(VCOMB),     5,     "a",    "akkioo", vcombset, NULL, vcomb         },
{ "valpass", S(VCOMB),   5,     "a",    "akkioo", vcombset, NULL, valpass       },
{ "ftmorf", S(FTMORF),   3,     "",     "kii",  ftmorfset,  ftmorf,     NULL    },
{ "p_i", S(PFUN),        1,     "i",    "i",     pfun, NULL, NULL               },
{ "p_k", S(PFUN),        2,     "k",    "k",     NULL, pfun, NULL               },
{ "bbcutm",S(BBCUTMONO), 5,     "a","aiiiiipop",BBCutMonoInit, NULL, BBCutMono  },
{ "bbcuts",S(BBCUTSTEREO),5,    "aa","aaiiiiipop",BBCutStereoInit, NULL, BBCutStereo},
{ "spat3d",   S(SPAT3D), 5,  "aaaa", "akkkiiiiio", spat3dset, NULL, spat3d      },
{ "spat3di",  S(SPAT3D), 5,  "aaaa", "aiiiiiio", spat3diset, NULL, spat3di      },
{ "spat3dt",  S(SPAT3D), 1,      "", "iiiiiiiio", spat3dt, NULL, NULL           },
{ "oscbnk",   S(OSCBNK), 5,     "a", "kkkkiikkkkikkkkkkikooooooo",
                                                 oscbnkset, NULL, oscbnk        },
{ "grain2",   S(GRAIN2), 5,     "a", "kkkikiooo", grain2set, NULL, grain2       },
{ "grain3",   S(GRAIN3), 5,     "a", "kkkkkkikikkoo", grain3set, NULL, grain3   },
{ "oscils",   S(OSCILS), 5,     "a", "iiio",     oscils_set, NULL, oscils       },
{ "lphasor",  S(LPHASOR),5,     "a", "xooooooo" ,lphasor_set, NULL, lphasor     },
{ "tablexkt", S(TABLEXKT),5,    "a", "xkkiooo",  tablexkt_set, NULL, tablexkt   },
{ "rnd31",    0xFFFF                                                            },
{ "rnd31_i",  S(RND31),  1,     "i", "iio",      rnd31i, NULL, NULL             },
{ "rnd31_k",  S(RND31),  3,     "k", "kko",      rnd31set, rnd31k, NULL         },
{ "rnd31_a",  S(RND31),  5,     "a", "kko",      rnd31set, NULL, rnd31a         },
{ "=_f",      S(FASSIGN), 2,    "f",   "f",      NULL, fassign, NULL            },
{ "pvsanal",  S(PVSANAL), 5,    "f",   "aiiiioo",  pvsanalset, NULL, pvsanal    },
{ "pvsynth",  S(PVSYNTH), 5,    "a",   "fo",     pvsynthset, NULL, pvsynth      },
{ "pvsadsyn", S(PVADS),   7,    "a",   "fikopo", pvadsynset, pvadsyn, pvadsyn   },
{ "pvscross", S(PVSCROSS),3,    "f",   "ffkk",   pvscrosset, pvscross, NULL     },
{ "pvsfread", S(PVSFREAD),3,    "f",   "kSo",    pvsfreadset, pvsfread, NULL    },
{ "pvsmaska", S(PVSMASKA),3,    "f",   "fik",    pvsmaskaset, pvsmaska, NULL    },
{ "pvsftw",   S(PVSFTW),  3,    "k",   "fio",    pvsftwset, pvsftw, NULL        },
{ "pvsftr",   S(PVSFTR),  3,    "",    "fio",    pvsftrset, pvsftr, NULL        },
{ "pvsinfo",  S(PVSINFO), 1,    "iiii","f",      pvsinfo, NULL, NULL            },
{ "lineto",   S(LINETO),  3,    "k",   "kk",     lineto_set,   lineto, NULL     },
{ "tlineto",  S(LINETO2), 3,    "k",   "kkk",    tlineto_set,   tlineto, NULL   },
{ "vibrato",  S(VIBRATO), 3,    "k", "kkkkkkkkio", vibrato_set, vibrato, NULL   },
{ "vibr",     S(VIBRATO), 3,    "k",   "kki",    vibr_set, vibr, NULL           },
{ "jitter2",  S(JITTER2), 3,    "k",   "kkkkkkk", jitter2_set, jitter2, NULL    },
{ "jitter",   S(JITTER),  3,    "k",   "kkk",    jitter_set, jitter, NULL       },
{ "jspline",  S(JITTERS), 7,    "s",   "xkk",    jitters_set, jitters, jittersa },
{ "loopseg",  S(LOOPSEG), 3,    "k",   "kkz",    loopseg_set,   loopseg, NULL   },
{ "lpshold",  S(LOOPSEG), 3,    "k",   "kkz",    loopseg_set,   lpshold, NULL   },
{ "cuserrnd", 0xffff                                                            },
{ "duserrnd", 0xffff                                                            },
{ "random",   0xffff                                                            },
{ "cuserrnd_i", S(CURAND),1,    "i",    "iii",   iContinuousUserRand, NULL, NULL },
{ "cuserrnd_k", S(CURAND),2,    "k",    "kkk",   Cuserrnd_set, kContinuousUserRand, NULL },
{ "cuserrnd_a", S(CURAND),4,    "a",    "kkk",   Cuserrnd_set, NULL, aContinuousUserRand },
{ "random_i", S(RANGERAND), 1,  "i",    "ii",    ikRangeRand, NULL, NULL        },
{ "random_k", S(RANGERAND), 2,  "k",    "kk",    NULL, ikRangeRand, NULL        },
{ "random_a", S(RANGERAND), 4,  "a",    "kk",    NULL, NULL,  aRangeRand        },
{ "rspline",  S(RANDOM3), 7,    "s",    "xxkk",  random3_set, random3, random3a },
{ "randomi",  S(RANDOMI), 7,    "s",    "kkx",   randomi_set, krandomi, randomi },
{ "randomh",  S(RANDOMH), 7,    "s",    "kkx",   randomh_set, krandomh, randomh },
{ "urd_i",    S(DURAND),  1,    "i",    "i",     iDiscreteUserRand, NULL, NULL  },
{ "urd_k",    S(DURAND),  2,    "k",    "k",     Cuserrnd_set, kDiscreteUserRand, NULL  },
{ "urd_a",    S(DURAND),  4,    "a",    "k",     Cuserrnd_set, NULL, aDiscreteUserRand  },
{ "duserrnd_i", S(DURAND),1,    "i",    "i",     iDiscreteUserRand, NULL, NULL  },
{ "duserrnd_k", S(DURAND),2,    "k",    "k",     Cuserrnd_set, kDiscreteUserRand, NULL  },
{ "duserrnd_a", S(DURAND),4,    "a",    "k",     Cuserrnd_set, NULL, aDiscreteUserRand  },
{ "octave",   0xffff                                                            },
{ "semitone", 0xffff                                                            },
{ "cent",     0xffff                                                            },
{ "octave_i", S(EVAL),    1,    "i",    "i",     ipowoftwo                      },
{ "octave_k", S(EVAL),    3,    "k",    "k",     powoftwo_set,   powoftwo       },
{ "octave_a", S(EVAL),    5,    "a",    "a",     powoftwo_set, NULL, powoftwoa  },
{ "semitone_i",S(EVAL),   1,    "i",    "i",     isemitone                      },
{ "semitone_k",S(EVAL),   3,    "k",    "k",     powoftwo_set,   semitone       },
{ "semitone_a",S(EVAL),   5,    "a",    "a",     powoftwo_set, NULL, asemitone  },
{ "cent_i",   S(EVAL),    1,    "i",    "i",     icent                          },
{ "cent_k",   S(EVAL),    3,    "k",    "k",     powoftwo_set,   cent           },
{ "cent_a",   S(EVAL),    5,    "a",    "a",     powoftwo_set, NULL, acent      },
{ "db",       0xffff                                                            },
{ "db_i",     S(EVAL),    1,    "i",    "i",     dbi                            },
{ "db_k",     S(EVAL),    3,    "k",    "k",     powoftwo_set, db               },
{ "db_a",     S(EVAL),    5,    "a",    "a",     powoftwo_set, NULL, dba        },
{ "and_ii",  S(AOP),    1,      "i",    "ii",   and_kk                  },
{ "and_kk",  S(AOP),    2,      "k",    "kk",   NULL,   and_kk          },
{ "and_ka",  S(AOP),    4,      "a",    "ka",   NULL,   NULL,   and_ka  },
{ "and_ak",  S(AOP),    4,      "a",    "ak",   NULL,   NULL,   and_ak  },
{ "and_aa",  S(AOP),    4,      "a",    "aa",   NULL,   NULL,   and_aa  },
{ "or_ii",   S(AOP),    1,      "i",    "ii",   or_kk                   },
{ "or_kk",   S(AOP),    1,      "i",    "kk",   or_kk                   },
{ "or_ka",   S(AOP),    4,      "a",    "ka",   NULL,   or_kk,          },
{ "or_ak",   S(AOP),    4,      "a",    "ak",   NULL,   NULL,   or_ak   },
{ "or_aa",   S(AOP),    4,      "a",    "aa",   NULL,   NULL,   or_aa   },
{ "xor_ii",  S(AOP),    1,      "i",    "ii",   xor_kk                  },
{ "xor_kk",  S(AOP),    2,      "k",    "kk",   NULL,   xor_kk          },
{ "xor_ka",  S(AOP),    4,      "a",    "ka",   NULL,   NULL,   xor_ka  },
{ "xor_ak",  S(AOP),    4,      "a",    "ak",   NULL,   NULL,   xor_ak  },
{ "xor_aa",  S(AOP),    4,      "a",    "aa",   NULL,   NULL,   xor_aa  },
{ "not_i",   S(AOP),    1,      "i",    "i",    not_k                   },
{ "not_k",   S(AOP),    2,      "k",    "k",    NULL,   not_k           },
{ "not_a",   S(AOP),    4,      "a",    "a",    NULL,   NULL,   not_a   }
};

long oplength_2 = sizeof(opcodlst_2);

