#include <stdio.h>
#include <stdarg.h>
/**
* S I L E N C E
*
* An auto-extensible system for making music on computers by means of software alone.
* Copyright (c) 2001 by Michael Gogins. All rights reserved.
*
* L I C E N S E
*
* This software is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this software; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* P U R P O S E
*
* Defines the public C application programming interface to Csound.
*/

#ifdef __cplusplus
extern "C" {
#endif

#include <Csound/csound.h>
#include <Csound/CS.H>
#include <Csound/MIDIOPS.H>
#include <Csound/WINDOW.H>

#ifndef MAX_PATH
#define MAX_PATH 0xff
#endif

        /**
        * Csound symbols referenced in this file.
        */
        extern int csoundMain(int argc, char **argv);
        extern MYFLT *spin;
        extern MYFLT *spout;
        extern int nrecs;
        char *orchname;
        char *scorename;
        extern void mainRESET();
        extern int spoutactive;
        //      extern char *points;
        //      extern WINDAT dwindow;
        extern void dispkill(WINDAT *wdptr);
        extern int kperf(int kcnt);
        extern int kcnt;
        extern OENTRY *opcodlst;
        extern OENTRY *oplstend;
        extern FILE *scfp;

        /**
        * Csound functions that need stub definitions in this file.
        */

        char *getDB(void)
        {
                return 0;
        }

        /**
        * Matt Ingalls symbols referenced in this file.
        */
        extern int runincomponents;
        extern int sensevents();
        extern int cleanup();

        int csoundPerform(int argc, char **argv)
        {
                csoundReset();
                runincomponents = 0;
                return csoundMain(argc, argv);
        }

        int csoundCompile(int argc, char **argv)
        {
                csoundReset();
                runincomponents = 1;
                return csoundMain(argc, argv);
        }

        int csoundPerformKsmps(void)
        {
                int sensed = 0;
                int rtEvents = O.RTevents;
                sensed = sensevents();
                //      Rather than overriding real-time event handling in kperf,
                //      turn it off before calling kperf, and back on afterwards.
                O.RTevents = 0;
                kperf(1);
                kcnt -= 1;
                O.RTevents = rtEvents;
                return sensed;
        }

        MYFLT* csoundGetSpin(void)
        {
                return spin;
        }

        MYFLT* csoundGetSpout(void)
        {
                return spout;
        }

        void csoundCleanup(void)
        {
                orcompact();
                cleanup();
                csoundMainCleanup();
        }

        static void csoundDefaultMessage(const char *message)
        {
                fprintf(stderr, message);
        }

        static void (*csoundMessageCallback_)(const char *message) = csoundDefaultMessage;

        void csoundSetMessageCallback(void (*csoundMessageCallback)(const char *message))
        {
                csoundMessageCallback_ = csoundMessageCallback;
        }

        void csoundMessage(const char *message)
        {
                csoundMessageCallback_(message);
        }

        static void (*csoundThrowMessageCallback_)(const char *exception) = csoundDefaultMessage;

        void csoundSetThrowMessageCallback(void (*csoundThrowMessageCallback)(const char *exception))
        {
                csoundThrowMessageCallback_ = csoundThrowMessageCallback;
        }

        void csoundThrowMessage(const char *message)
        {
                csoundThrowMessageCallback_(message);
        }

        static int csoundExternalMidiEnabled_ = 0;

        int csoundIsExternalMidiEnabled(void)
        {
                return csoundExternalMidiEnabled_;
        }

        void csoundSetExternalMidiEnabled(int enabled)
        {
                csoundExternalMidiEnabled_ = enabled;
        }

        extern void csoundDefaultMidiOpen(void);

        static void (*csoundExternalMidiOpenCallback_)(void) = csoundDefaultMidiOpen;

        void csoundSetExternalMidiOpenCallback(void (*csoundMidiOpen)(void))
        {
                csoundExternalMidiOpenCallback_ = csoundMidiOpen;
        }

        void csoundExternalMidiOpen(void)
        {
                csoundExternalMidiOpenCallback_();
        }

        static int defaultCsoundMidiRead(char *mbuf, int size)
        {
                return 0;
        }

        static int (*csoundExternalMidiReadCallback_)(char *mbuf, int size) = defaultCsoundMidiRead;

        void csoundSetExternalMidiReadCallback(int (*midiReadCallback)(char *mbuf, int size))
        {
                csoundExternalMidiReadCallback_ = midiReadCallback;
        }

        int csoundExternalMidiRead(char *mbuf, int size)
        {
                return csoundExternalMidiReadCallback_(mbuf, size);
        }

        static void csoundDefaultMidiCloseCallback(void)
        {
        }

        static void (*csoundExternalMidiCloseCallback_)(void) = csoundDefaultMidiCloseCallback;

        void csoundSetExternalMidiCloseCallback(void (*csoundExternalMidiCloseCallback)(void))
        {
                csoundExternalMidiCloseCallback_ = csoundExternalMidiCloseCallback;
        }

        void csoundExternalMidiClose(void)
        {
                csoundExternalMidiCloseCallback_();
        }

        int csoundGetKsmps(void)
        {
                return ksmps;
        }

        int csoundGetNchnls(void)
        {
                return nchnls;
        }

        int csoundGetMessageLevel(void)
        {
                return O.msglevel;
        }

        void csoundSetMessageLevel(int messageLevel)
        {
                O.msglevel = messageLevel;
        }

        int csoundAppendOpcode(OENTRY *opcodeEntry)
        {
                OENTRY *old_opcodlst = opcodlst;
                int size = (int)((char *)oplstend - (char *)opcodlst);
                int count = size / sizeof(OENTRY);
                opcodlst = (OENTRY *) realloc(opcodlst, size + sizeof(OENTRY));
                if(!opcodlst)
                {
                        opcodlst = old_opcodlst;
                        err_printf("Failed to allocate new opcode entry.");
                        return 0;
                }
                else
                {
                        memcpy(oplstend, opcodeEntry, sizeof(OENTRY));
                        oplstend++;
                        printf("Appended opcode %s: in %s out %s.", opcodeEntry->opname, opcodeEntry->intypes, opcodeEntry->outypes);
                        return 1;
                }
        }

        static int csoundIsScorePending_ = 0;

        int csoundIsScorePending(void)
        {
                return csoundIsScorePending_;
        }

        void csoundSetScorePending(int pending)
        {
                csoundIsScorePending_ = pending;
        }

        static MYFLT csoundScoreOffsetSeconds_ = (MYFLT) 0.0;

        void csoundSetScoreOffsetSeconds(MYFLT offset)
        {
                csoundScoreOffsetSeconds_ = offset;
        }

        MYFLT csoundGetScoreOffsetSeconds(void)
        {
                return csoundScoreOffsetSeconds_;
        }

        void csoundReset(void)
        {
                mainRESET();
                SfReset();
                spoutactive = 0;
                csoundIsScorePending_ = 1;
                csoundScoreOffsetSeconds_ = (MYFLT) 0.0;
                O.Midiin = 0;
                nrecs = 0;
                orchname = 0;
                scorename = 0;
        }

        void csoundRewindScore(void)
        {
                if(scfp)
                {
                        fseek(scfp, 0, SEEK_SET);
                }
        }

        MYFLT csoundGetSr(void)
        {
                return esr;
        }

        MYFLT csoundGetKr(void)
        {
                return ekr;
        }

        int csoundOpcodeCompare(const void *v1, const void *v2)
        {
                return strcmp(((OENTRY*)v1)->opname, ((OENTRY*)v2)->opname);
        }

        void csoundOpcodeDeinitialize(INSDS *ip_)
        {
                INSDS *ip = ip_;
                OPDS *pds;
                while(ip = ip->nxti)
                {
                        pds = (OPDS *)ip;
                        while(pds = pds->nxti)
                        {
                                if(pds->dopadr)
                                {
                                        (*pds->dopadr)(pds);
                                }
                        }
                }
                ip = ip_;
                while(ip = ip->nxtp)
                {
                        pds = (OPDS *)ip;
                        while(pds = pds->nxtp)
                        {
                                if(pds->dopadr)
                                {
                                        (*pds->dopadr)(pds);
                                }
                        }
                }
        }


#ifdef __cplusplus
};
#endif
