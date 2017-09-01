
typedef struct {
	int num;
	sfSample *sample;
	BYTE sampleModes;
	BYTE minNoteRange;
	BYTE maxNoteRange;
	BYTE minVelRange;
	BYTE maxVelRange;
	long startOffset;
	long endOffset;
	long startLoopOffset;
	long endLoopOffset;
	char overridingRootKey;
	char coarseTune;
	char fineTune;
	SHORT scaleTuning;
	SHORT initialAttenuation;
	SHORT pan;
} splitType;



typedef struct {
	int num;
	char *name;
	BYTE splits_num;
	splitType *split;
} instrType;

typedef struct {
	int num;
	char *name;
	BYTE splits_num;
	splitType *split;
	BYTE minNoteRange;
	BYTE maxNoteRange;
	BYTE minVelRange;
	BYTE maxVelRange;
	char coarseTune;
	char fineTune;
	SHORT scaleTuning;
	SHORT initialAttenuation;
	SHORT pan;
} layerType;

typedef struct {
	char *name;
	int num;
	WORD prog;
	WORD bank;
    int layers_num;
    layerType *layer;
} presetType;

typedef struct {
	BYTE	ckID[4];	//  A chunk ID identifies the type of data within the chunk.
	DWORD	ckSize;		//  The size of the chunk data in bytes, excluding any pad byte.
	BYTE	*ckDATA;	//  The actual data plus a pad byte if req’d to word align.
} CHUNK;

typedef struct {
	CHUNK main_chunk;
	CHUNK *phdrChunk, *pbagChunk, *pmodChunk, *pgenChunk, *instChunk, 
		  *ibagChunk, *imodChunk, *igenChunk, *shdrChunk, *smplChunk;
	sfPresetHeader *phdr;
	sfInst *inst;
	sfSample *shdr;
	sfPresetBag *pbag;
	sfModList *pmod;
	sfGenList *pgen;
	sfInstBag *ibag;
	sfInstModList *imod;
	sfInstGenList *igen;
} CHUNKS;

typedef struct {
	char name[256];
	int presets_num;
	presetType *preset;
	int instrs_num;
	instrType *instr;
	SHORT *sampleData;
	CHUNKS chunk;	
} SFBANK;
