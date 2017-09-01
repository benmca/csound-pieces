#ifdef _WIN32
#pragma warning(disable:4786 4117)
#endif
#include <stdio.h>
#include <vector>
#include <map>
#include "stdpch.h"
#include "anydec.h"
#include "anybmp.h"

extern "C" {
	#undef __cplusplus
	#include "cs.h"
	#include "picture.h"
	#include "oload.h"
	#define __cplusplus
    extern EVTBLK *currevent; 
	char *unquote(char *name);
}
#undef exit
using namespace std;
map<int,CAnyBmp*> BmpMap; // map of pointers to CAnyBmp objects
map<int,CAnyBmp*>::iterator BmpMapIt; // iterator of the map

#define ONEup255 0.00392156862745098f

extern "C" void bmopen(BMOPEN *p)
{
	char     bmfilnam[MAXNAME];
	if (*p->ifilno == sstrcod) { /* if char string name given */
		if (p->STRARG == NULL) strcpy(bmfilnam,unquote(currevent->strarg));
		else strcpy(bmfilnam, unquote(p->STRARG));
	} 
	else if ((long)*p->ifilno < strsmax && strsets != NULL &&
	     strsets[(long)*p->ifilno])
      strcpy(bmfilnam, strsets[(long)*p->ifilno]);
    else sprintf(bmfilnam,"img.%d", (int)*p->ifilno); /* else pvoc.filnum   */
	int ifn = (int) *p->ifn;  
	BmpMapIt = BmpMap.find(ifn);
	if(BmpMapIt != BmpMap.end()) {  // if a previous instance of ifn already exists
		delete BmpMap[ifn];			// erase it
		BmpMap.erase(BmpMapIt);
	}
	BmpMap[ifn] = new(CAnyBmp); //create a new element of BmpMap and allocate its data memory
	CAnyPicDecoder dec;
	dec.MakeBmpFromFile(bmfilnam, BmpMap[ifn]); // fill the element with a bitmap from a file
	CAnyBmp * bmp = BmpMap[ifn];				// to speed-up operations
	*p->iwidth = (MYFLT) bmp->GetWidth();
	*p->iheight = (MYFLT) bmp->GetHeight();
	*p->ibpp = (MYFLT) bmp->GetBitsPerPixel();
	printf("bmopen ---> Bitmap image %s loaded\n",bmfilnam);
	printf("       ---> Width: %d,  Height: %d,  Bpp: %d\n", 
			(int)*p->iwidth,(int)*p->iheight ,(int) *p->ibpp);
}

extern "C" void bmtable_set(BMTABLE *p)
{
	int ifn = (int) *p->ifn;
	BmpMapIt = BmpMap.find(ifn);
	if(BmpMapIt == BmpMap.end()) {  // ifn does't exist
		initerror("bmtable:invalid picture number");
		return;
	}
	p->LineArray = BmpMap[ifn]->GetLineArray();
}
	

extern "C" void bmtable(BMTABLE *p)
{
	int x= ((int) *p->kx) * 4;
	BYTE *line = p->LineArray[(int) *p->ky];
	*p->kr = line[x+RGBA_RED];
	*p->kg = line[x+RGBA_GREEN];
	*p->kb = line[x+RGBA_BLUE];
	*p->ka = line[x+RGBA_ALPHA];
}

extern "C" void bmtablei(BMTABLE *p)
{
	int   x= (int) *p->kx ,     y= (int) *p->ky;
	MYFLT fractx = *p->kx - x, fracty = *p->ky - y;
	MYFLT result1, result2, result11, result12, left, right;
	BYTE *line0 = p->LineArray[y];
	BYTE *line1 = p->LineArray[y+1];
	int x1=(x+1)*4;
	x*=4;
	
	result1 = line0[x+RGBA_RED];
	result2 = line1[x+RGBA_RED];
	result11 = line0[x1+RGBA_RED];
	result12 = line1[x1+RGBA_RED];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->kr = left + (right-left)*fractx;

	result1 = line0[x+RGBA_GREEN];
	result2 = line1[x+RGBA_GREEN];
	result11 = line0[x1+RGBA_GREEN];
	result12 = line1[x1+RGBA_GREEN];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->kg = left + (right-left)*fractx;

	result1 = line0[x+RGBA_BLUE];
	result2 = line1[x+RGBA_BLUE];
	result11 = line0[x1+RGBA_BLUE];
	result12 = line1[x1+RGBA_BLUE];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->kb = left + (right-left)*fractx;

	result1 = line0[x+RGBA_BLUE];
	result2 = line1[x+RGBA_BLUE];
	result11 = line0[x1+RGBA_BLUE];
	result12 = line1[x1+RGBA_BLUE];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->ka = left + (right-left)*fractx;
}


extern "C" void bmoscil_set(BMOSCIL *p)
{
	int ifn = (int) *p->ifn;
	BmpMapIt = BmpMap.find(ifn);
	if(BmpMapIt == BmpMap.end()) {  // ifn does't exist
		initerror("bmoscil:invalid picture number");
		return;
	}
	CAnyBmp * bmp = BmpMap[ifn];
	p->LineArray = bmp->GetLineArray();
	p->width = bmp->GetWidth();
	p->height = bmp->GetHeight();
	p->Xphase = *p->kxphs;
	p->Yphase = *p->kyphs;
	p->flag=1;
}
	

extern "C" void bmoscil(BMOSCIL *p)
{
	int x;
	MYFLT Xphase = p->Xphase, Yphase = p->Yphase;
	int ktrig_xphreset = *p->ktrig_xphreset;
	int ktrig_yphreset = *p->ktrig_yphreset;
	if (p->flag) {
		p->flag = 0;
		goto firstime;
	}
	if (*p->ktrig) {
		Xphase += *p->kxinc;
		while(Xphase >= p->width) Xphase -= p->width;
		while(Xphase < 0.0f )	  Xphase += p->width;	
		
		Yphase += *p->kyinc;
		while(Yphase >= p->height) Yphase -= p->height;
		while(Yphase < 0.0f )	   Yphase += p->height;
	}
	if (ktrig_xphreset) Xphase =  *p->kxphs;
	if (ktrig_yphreset) Yphase =  *p->kyphs;
firstime:
	x= ((int) Xphase) * 4;
	BYTE *line = p->LineArray[(int) Yphase];
	*p->kr = line[x+RGBA_RED];
	*p->kg = line[x+RGBA_GREEN];
	*p->kb = line[x+RGBA_BLUE];
	*p->ka = line[x+RGBA_ALPHA];
	p->Xphase = Xphase; 
	p->Yphase = Yphase;
}

extern "C" void bmoscili(BMOSCIL *p)
{
	int x;
	MYFLT Xphase = p->Xphase, Yphase = p->Yphase;
	int ktrig_xphreset = *p->ktrig_xphreset;
	int ktrig_yphreset = *p->ktrig_yphreset;
	if (p->flag) {
		p->flag = 0;
		goto firstime;
	}
	if (*p->ktrig) {
		Xphase += *p->kxinc;
		while(Xphase >= p->width) Xphase -= p->width;
		while(Xphase < 0.0f )	  Xphase += p->width;	

		Yphase += *p->kyinc;
		while(Yphase >= p->height) Yphase -= p->height;
		while(Yphase < 0.0f )	   Yphase += p->height;
	}
	if (ktrig_xphreset) Xphase =  *p->kxphs;
	if (ktrig_yphreset) Yphase =  *p->kyphs;
firstime:

	x= (int) Xphase;
	int y= (int) Yphase;
	MYFLT fractx = Xphase - x, fracty = Yphase - y;
	MYFLT result1, result2, result11, result12, left, right;
	BYTE *line0 = p->LineArray[y];
	BYTE *line1 = p->LineArray[y+1];
	int x1=(x+1)*4;
	x*=4;

	result1 = line0[x+RGBA_RED];
	result2 = line1[x+RGBA_RED];
	result11 = line0[x1+RGBA_RED];
	result12 = line1[x1+RGBA_RED];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->kr = left + (right-left)*fractx;

	result1 = line0[x+RGBA_GREEN];
	result2 = line1[x+RGBA_GREEN];
	result11 = line0[x1+RGBA_GREEN];
	result12 = line1[x1+RGBA_GREEN];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->kg = left + (right-left)*fractx;

	result1 = line0[x+RGBA_BLUE];
	result2 = line1[x+RGBA_BLUE];
	result11 = line0[x1+RGBA_BLUE];
	result12 = line1[x1+RGBA_BLUE];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->kb = left + (right-left)*fractx;

	result1 = line0[x+RGBA_BLUE];
	result2 = line1[x+RGBA_BLUE];
	result11 = line0[x1+RGBA_BLUE];
	result12 = line1[x1+RGBA_BLUE];
	left  = result1  + (result2 -result1 )*fracty;
	right = result11 + (result12-result11)*fracty;
	*p->ka = left + (right-left)*fractx;


	p->Xphase = Xphase; 
	p->Yphase = Yphase;
}

static inline MYFLT MAX(MYFLT v1, MYFLT v2, MYFLT v3)
{ 
	if (v1 > v2 && v1 > v3) return(v1);
	if (v2 > v3) return(v2);
	return(v3);
}

static inline MYFLT MIN(MYFLT v1, MYFLT v2, MYFLT v3)
{ 
	if (v1 < v2 && v1 < v3) return(v1);
	if (v2 < v3) return(v2);
	return(v3);
}

//inspired from rgb2hsv of mark danks' GEM
extern "C" void rgb2hsvl(RGB2HSVL *p)
{
	MYFLT h, s, v;
	MYFLT r= *p->r * ONEup255, g= *p->g * ONEup255, b= *p->b * ONEup255;

	MYFLT max = MAX(r, g, b);
	MYFLT min = MIN(r, g, b);
	v = max;		// the value
	if (max != 0.0f) s = (max - min) / max; // calculate saturation
	else			 s = 0.0f;

	if (s == 0.0f)	 h = 0.0f; // hue is undefined if no saturation	
	else		
	{		// chromatic case - calculate hue
		MYFLT delta = max - min;
		if (r == max) h = (g - b) / delta;	// between magenta and cyan
		else if (g == max)	h = 2.0f + (b - r) / delta;			// between yellow and magenta
		else if (b == max)	h = 4.0f + (r - g) / delta;					// between cyan and yellow
		h *= 60.0f; // convert hue to degrees
		if (h < 0.0) h += 360.f; // make sure hue is nonnegative
		h /= 360.f;		// normalize hue
	}
	*p->hue=h;
	*p->sat=s;
	*p->val=v;
	*p->lum=(r+g+b) * .333333333333333f; //normalize luminance 0 to 1
}


extern "C" void bmscan_set(BMSCAN *p)
{
	int ifn = (int) *p->ifn;
	FUNC *ftp;
	BmpMapIt = BmpMap.find(ifn);
	if(BmpMapIt == BmpMap.end()) {  // ifn does't exist
		initerror("bmoscil:invalid picture number");
		return;
	}
	CAnyBmp * bmp = BmpMap[ifn];
	p->LineArray = bmp->GetLineArray();
	p->width = bmp->GetWidth();
	p->height = bmp->GetHeight();

	if (*p->ihorLines >0)
		p->flag=1;
	else {
		p->flag=0;
		if ((ftp = ftfind(p->ihorLines)) != NULL) 
			p->ftpLines = ftp->ftable;
	}
	if ((ftp = ftfind(p->ifnR)) != NULL)
		p->ftpR = ftp->ftable;
	if ((ftp = ftfind(p->ifnG)) != NULL)
		p->ftpG = ftp->ftable;
	if ((ftp = ftfind(p->ifnB)) != NULL) 
		p->ftpB = ftp->ftable;
}

extern "C" void bmscan(BMSCAN *p)
{
	int j,k;
	int height = (int) p->height, width = (int) p->width;
	BYTE ** LineArray = p->LineArray;
	int x = (int) *p->kphs;
	MYFLT *ftpR = p->ftpR, *ftpG= p->ftpG,*ftpB = p->ftpB;
	while (x  >= width) x  -= width;
	x *=4;

	if(p->flag) {
		int horLines = (int) *p->ihorLines;
		for (j = (int) *p->istartLine, k=0 ; j <height; j+= horLines, k++) {
			BYTE *line = LineArray[height-j-1];
			ftpR[k] = line[x+RGBA_RED]; 
			ftpG[k] = line[x+RGBA_GREEN];
			ftpB[k] = line[x+RGBA_BLUE]; 
		}
	}
	else {
		MYFLT *ftpLines =p->ftpLines;
		k=0;
		while (j <height) {
			j = (int) ftpLines[k];
			BYTE *line = LineArray[height-j-1];
			ftpR[k] = line[x+RGBA_RED]; 
			ftpG[k] = line[x+RGBA_GREEN];
			ftpB[k] = line[x+RGBA_BLUE];
			k++;
		}
	}
}


extern "C" void bmscani(BMSCAN *p)
{
	int j,k;
	int height = (int) p->height, width = (int) p->width;
	BYTE ** LineArray = p->LineArray;
	int x= (int) *p->kphs;
	int x1=x+1;
	MYFLT fract = *p->kphs -x;
	//int x = ((int) *p->kphs) * 4;
	MYFLT *ftpR = p->ftpR, *ftpG= p->ftpG,*ftpB = p->ftpB;
	MYFLT result1,result2;
	while (x  >= width) 
		x  -= width;
	while (x1 >= width) 
		x1 -= width;
	x *= 4;
	x1*= 4;
	if(p->flag) {
		int horLines = (int) *p->ihorLines;
		for (j = (int) *p->istartLine, k=0 ; j <height; j+= horLines, k++) {
			BYTE *line = LineArray[height-j-1];

			result1 = line[x+RGBA_RED]; 
			result2 = line[x1+RGBA_RED]; 
			ftpR[k] = result1 + (result2 - result1 )*fract;

			result1 = line[x+RGBA_GREEN];
			result2 = line[x1+RGBA_GREEN]; 
			ftpG[k] = result1 + (result2 - result1 )*fract;

			result1 = line[x+RGBA_BLUE]; 
			result2 = line[x1+RGBA_BLUE]; 
			ftpB[k] = result1 + (result2 - result1 )*fract;
		}
	}
	else {
		MYFLT *ftpLines =p->ftpLines;
		k=0;
		while (j <height) {
			j = (int) ftpLines[k];
			BYTE *line = LineArray[height-j-1];

			result1 = line[x+RGBA_RED]; 
			result2 = line[x1+RGBA_RED]; 
			ftpR[k] = result1 + (result2 - result1 )*fract;

			result1 = line[x+RGBA_GREEN];
			result2 = line[x1+RGBA_GREEN]; 
			ftpG[k] = result1 + (result2 - result1 )*fract;

			result1 = line[x+RGBA_BLUE]; 
			result2 = line[x1+RGBA_BLUE]; 
			ftpB[k] = result1 + (result2 - result1 )*fract;
			k++;
		}
	}
}


extern "C" void timeseq_set(TIMEDSEQ *p)
{
	FUNC *ftp;
	MYFLT *table;
	if ((ftp = ftfind(p->ifn)) != NULL) {
      ftp = ftp;
    }
	else return;
	table = p->table = ftp->ftable;
	p->numParm = p->INOCOUNT-3; // ?
	for (int j = 0; j < ftp->flen; j+= p->numParm) {
		if (table[j] < 0) { // if insnum  < 0
			p->endSeq = table[j+1];
			p->endIndex = j/p->numParm;
			break;
		}
	}
	p->prevActime = p->nextActime = 0;
	p->lastIndex=-1;
	//p->lastActime = *p->kphs;
	//p->currIndex = 0;
	p->oldPhs =0;
	p->nextIndex=0;

}


extern "C" void timeseq(TIMEDSEQ *p)
{
	MYFLT minDist = *p->iMinDist, *table = p->table;
	MYFLT phs = *p->kphs;
	int  j, index  = p->currIndex, numParm = p->numParm, endIndex = p->endIndex;
	//phsTemp = phs;
	//if (p->nextActime<0) p->nextActime=0; 

	if (p->lastIndex > p->nextIndex) {
		if (p->oldPhs < phs) {
			*p->ktrig = 0;
			goto fine;
		}
	}
	if (phs > p->nextActime) {
			*p->ktrig = 1;
			for (j=0; j < p->numParm; j++) {
				*p->args[j]=table[p->nextIndex * p->numParm+j];
			}
			//p->lastActime = p->nextActime;
			p->lastIndex = p->nextIndex;
			p->nextIndex = (p->nextIndex + 1) % p->endIndex;
			p->nextActime = table[p->nextIndex * p->numParm+1]; //p->nextActime+1;
		}
	else *p->ktrig = 0;
fine:
	p->oldPhs = phs;
}