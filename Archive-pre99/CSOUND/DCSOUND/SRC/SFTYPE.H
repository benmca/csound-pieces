typedef unsigned long       DWORD;
typedef int                 BOOL;
typedef unsigned char       BYTE;
typedef unsigned short      WORD;
typedef short SHORT;
typedef char CHAR;

typedef unsigned short SFTransform;     

typedef struct
{
	BYTE byLo;
	BYTE byHi;
} rangesType;

typedef union
{
	rangesType ranges;
	SHORT shAmount;
	WORD wAmount;
} genAmountType;

// The SFSampleLink is an enumeration type which 
// describes both the type of sample (mono, stereo left, etc.) 
// and the whether the sample is located in RAM or ROM memory:

typedef enum
{
	monoSample = 1,
	rightSample = 2,
	leftSample = 4,
	linkedSample = 8,
	ROMSample =     0x8000,  //32768
	RomMonoSample = 0x8001,	 //32769
	RomRightSample = 0x8002,  //32770
	RomLeftSample = 0x8004,	  //32772
	RomLinkedSample = 0x8008   //32776
} SFSampleLink;


 /* The INFO-list chunk in a SoundFont 2 compatible file contains 
  three mandatory and a variety of optional subchunks as defined below.  
  The INFO-list chunk gives basic information about the SoundFont 
  compatible bank contained in the file.
 */




/* The ifil subchunk is a mandatory subchunk identifying the SoundFont 
  specification version level to which the file complies.  
  It is always four bytes in length, and contains data 
  according to the structure:
  */



// <iver-rec>	->	
typedef struct 
{
	WORD wMajor;
	WORD wMinor;
} sfVersionTag;

// <phdr-rec>	->	
typedef struct 
{
	CHAR achPresetName[20];
	WORD wPreset;
	WORD wBank;
	WORD wPresetBagNdx;
	DWORD dwLibrary;
	DWORD dwGenre;
	DWORD dwMorphology;
} sfPresetHeader;

// <pbag-rec>	->	
typedef struct 
	{
	WORD wGenNdx;
	WORD wModNdx;
} sfPresetBag;

// <pmod-rec> ->	
typedef struct 
{
	/*
	SFModulator sfModSrcOper;
	SFGenerator sfModDestOper;
	SHORT modAmount;
	SFModulator sfModAmtSrcOper;
	SFTransform sfModTransOper;
	*/

	// SFModulator sfModSrcOper;
	WORD sfModSrcOper;
	// SFGenerator sfModDestOper;
	WORD sfModDestOper;
	SHORT modAmount;
	// SFModulator sfModAmtSrcOper;
	WORD sfModAmtSrcOper;
	SFTransform sfModTransOper;

} sfModList;

// <pgen-rec>	->	
typedef struct 
	{
	//SFGenerator sfGenOper;
	WORD sfGenOper;
	genAmountType genAmount;
} sfGenList;

// <inst-rec>	->	
typedef struct 
{
	CHAR achInstName[20];
	WORD wInstBagNdx;
} sfInst;

// <ibag-rec>	->	
typedef struct 
{
	WORD wInstGenNdx;
	WORD wInstModNdx;
} sfInstBag;

// <imod-rec> ->	
typedef struct 
{
	
	/*
	SFModulator sfModSrcOper;
	SFGenerator sfModDestOper;
	SHORT modAmount;
	SFModulator sfModAmtSrcOper;
	SFTransform sfModTransOper;
	*/
	
	
	
	
	// SFModulator sfModSrcOper;
	WORD sfModSrcOper;
	// SFGenerator sfModDestOper;
	WORD sfModDestOper;
	SHORT modAmount;
	// SFModulator sfModAmtSrcOper;
	WORD sfModAmtSrcOper;
	SFTransform sfModTransOper;
} sfInstModList;

// <igen-rec>	->	
typedef struct 
{
	// SFGenerator sfGenOper;
	WORD sfGenOper;
	genAmountType genAmount;
} sfInstGenList;

// <shdr-rec>	->	
typedef struct 
{
	CHAR achSampleName[20];
	DWORD dwStart;
	DWORD dwEnd;
	DWORD dwStartloop;
	DWORD dwEndloop;
	DWORD dwSampleRate;
	BYTE byOriginalKey;
	CHAR chCorrection;
	WORD wSampleLink;
	//SFSampleLink sfSampleType;
	WORD sfSampleType;
} sfSample;


