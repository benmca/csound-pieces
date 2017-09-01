
#if !defined(_SF_H)
#include "sftype.h"
#ifdef          __GNUC__
#  ifndef       PACKED
#    define     PACKED  __attribute__((packed))
#  endif        /* PACKED */
#else
#  define       PACKED
#endif
#ifdef          MSVC
#  pragma       pack(push, before, 1)
#endif
#if defined(mac_classic)
#  pragma               pack(1)
#endif

typedef struct {
        int num                 PACKED;
        sfSample *sample        PACKED;
        BYTE sampleModes        PACKED;
        BYTE minNoteRange       PACKED;
        BYTE maxNoteRange       PACKED;
        BYTE minVelRange        PACKED;
        BYTE maxVelRange        PACKED;
        long startOffset;
        long endOffset;
        long startLoopOffset;
        long endLoopOffset;
        char overridingRootKey  PACKED;
        char coarseTune         PACKED;
        char fineTune           PACKED;
        SHORT scaleTuning       PACKED;
        SHORT initialAttenuation        PACKED;
        SHORT pan               PACKED;
} splitType;



typedef struct {
        int num                 PACKED;
        char *name              PACKED;
        BYTE splits_num         PACKED;
        splitType *split        PACKED;
} instrType;

typedef struct {
        int num                 PACKED;
        char *name              PACKED;
        BYTE splits_num         PACKED;
        splitType *split        PACKED;
        BYTE minNoteRange       PACKED;
        BYTE maxNoteRange       PACKED;
        BYTE minVelRange        PACKED;
        BYTE maxVelRange        PACKED;
        char coarseTune         PACKED;
        char fineTune           PACKED;
        SHORT scaleTuning       PACKED;
        SHORT initialAttenuation        PACKED;
        SHORT pan               PACKED;
} layerType;

typedef struct {
        char *name              PACKED;
        int num                 PACKED;
        WORD prog               PACKED;
        WORD bank               PACKED;
        int layers_num          PACKED;
        layerType *layer        PACKED;
} presetType;

typedef struct {
  BYTE  ckID[4] PACKED; /*  A chunk ID identifies the type of data within the chunk. */
  DWORD ckSize  PACKED; /*  The size of the chunk data in bytes, excluding any pad byte. */
  BYTE  *ckDATA PACKED; /*  The actual data plus a pad byte if req’d to word align. */
} CHUNK;

typedef struct {
        CHUNK main_chunk        PACKED;
        CHUNK *phdrChunk, *pbagChunk, *pmodChunk, *pgenChunk, *instChunk,
                  *ibagChunk, *imodChunk, *igenChunk, *shdrChunk, *smplChunk    PACKED;
        sfPresetHeader *phdr    PACKED;
        sfInst *inst            PACKED;
        sfSample *shdr          PACKED;
        sfPresetBag *pbag       PACKED;
        sfModList *pmod         PACKED;
        sfGenList *pgen         PACKED;
        sfInstBag *ibag         PACKED;
        sfInstModList *imod     PACKED;
        sfInstGenList *igen     PACKED;
} CHUNKS;

typedef struct {
        char name[256]          PACKED;
        int presets_num         PACKED;
        presetType *preset      PACKED;
        int instrs_num          PACKED;
        instrType *instr        PACKED;
        SHORT *sampleData       PACKED;
        CHUNKS chunk            PACKED;
} SFBANK;

#ifdef          MSVC
#  pragma       pack(pop, before)
#endif
#define _SF_H
#endif
