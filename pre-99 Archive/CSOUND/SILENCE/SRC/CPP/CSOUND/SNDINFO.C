#include "cs.h"                                       /*  SNDINFO.C  */
#include "soundio.h"
#ifdef mills_macintosh
#include "MacTransport.h"
#endif
extern MYFLT maxamp[MAXCHNLS];
extern MYFLT smaxamp[MAXCHNLS];
extern MYFLT omaxamp[MAXCHNLS];

int sndinfo(int argc, char **argv)
{
        char    *infilnam;
        int     infd, openin(char *);
        SOUNDIN *p;         /* space allocated here */
        HEADATA *hdr, *readheader(int, char*, SOUNDIN*);
extern  char    *retfilnam;
extern  char *getstrformat(int);

        if (!POLL_EVENTS()) exit(1);
        sssfinit();

        while (--argc) {
            infilnam = *++argv;
            if (strncmp(infilnam, "-j", 2)==0) { /* Skip -j option */
              if (infilnam[2]!='\0') ++argv, --argc;
              continue;
            }
            if ((infd = openin(infilnam)) < 0) {
                printf(Str(X_73,"%s:\n\tcould not find\n"), retfilnam);
                continue;
            }
            p = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
            if ((hdr = readheader(infd, infilnam, p)) != NULL
              && !hdr->readlong) {
                long sframes = hdr->audsize / hdr->sampsize / hdr->nchnls;
                char channame[100];
                if (hdr->filetyp == TYP_AIFF) {
                    AIFFDAT *adp;
                    printf(Str(X_565,"\tAIFF soundfile"));
                    if ((adp = hdr->aiffdata) != NULL
                      && (adp->loopmode1 || adp->loopmode2))
                        printf(Str(X_84,", looping with modes %d, %d"),
                               adp->loopmode1, adp->loopmode2);
                    else printf(Str(X_85,", no looping"));
                    printf("\n");
                }
                else if (hdr->filetyp == TYP_AIFC) {
                  AIFFDAT *adp;
                  int i = 0;
                  printf(Str(X_188,"AIFF-C soundfile"));
                  if ((adp = hdr->aiffdata) != NULL
                      && (adp->loopmode1 || adp->loopmode2))
                    printf(Str(X_84,", looping with modes %d, %d"),
                           adp->loopmode1, adp->loopmode2);
                  else printf(Str(X_85,", no looping"));
                  printf("\n");
                  O.outformat = AE_FLOAT;
                  for (i=0; i< MAXCHNLS; i++) {
                    maxamp[i] = smaxamp[i] = omaxamp[i] = 0.0f;
                  }
                  /*RWD 3:2000 may be no data */
                  if (adp)
                    maxamp[0] = smaxamp[0] = omaxamp[0] = (MYFLT)adp->maxamps[0];
                }
                else if (hdr->filetyp == TYP_WAV)
                    printf(Str(X_567,"\tWAVE soundfile\n"));
                else printf("%s:\n", retfilnam);
                switch (hdr->nchnls) {
                case 1:
                  strcpy(channame, Str(X_1005,"monaural"));
                  break;
                case 2:
                  strcpy(channame, Str(X_1246,"stereo"));
                  break;
                case 4:
                  strcpy(channame, Str(X_1148,"quad"));
                  break;
                case 6:
                  strcpy(channame, Str(X_830,"hex"));
                  break;
                case 8:
                  strcpy(channame, Str(X_1088,"oct"));
                  break;
                default:
                  sprintf(channame, "%d-channel", hdr->nchnls);
                  break;
                }
                printf(Str(X_579,"\tsrate %ld, %s, %ld bit %s, %4.2f seconds\n"),
                       hdr->sr, channame,
                     hdr->sampsize * 8, getstrformat(hdr->format),
                     (MYFLT)sframes / hdr->sr);
                printf(Str(X_576,"\theadersiz %ld, datasiz %ld (%ld sample frames)\n"),
                     hdr->hdrsize, hdr->audsize, sframes);
            }
            else printf(Str(X_74,"%s:\n\tno recognizable soundfile header\n"), retfilnam);
#ifdef mills_macintosh
            nchnls = hdr->nchnls;
            O.outsampsiz = hdr->sampsize;
            esr = hdr->sr;
            transport.osfd = infd;
            O.filetyp = hdr->filetyp;
            O.informat = hdr->format;
            if (hdr->filetyp == 0) transport.eoheader = 0;
            else transport.eoheader = tell(transport.osfd);
/*          printf("transport.eoheader = %d\n",transport.eoheader); */
            fflush(stdout);
            transport.state &= ~kUtilPerf;
            transport.state |= kGenerating;
                transport.state = SetTransportState(transport.d,transport.state,
                                                    kGenFinished,0);
            transport.state |= kFileReOpened;
            O.outbufsamps = 8192;
            O.oMaxLag = 4096;
            while (POLL_EVENTS());
#endif
            mfree((char *)p);
            close(infd);
        }
#ifndef CWIN
        exit(0);
#endif
        return 0;
}



