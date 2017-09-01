#ifdef _WIN32
#	pragma warning(disable: 4117 4804)
#endif
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <process.h>

#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Slider.H>
#include <FL/Fl_Value_Slider.H>
#include <FL/Fl_Adjuster.H>
#include <FL/Fl_Counter.H>
#include <FL/Fl_Dial.H>
#include <FL/Fl_Roller.H>
#include <FL/Fl_Value_Input.H>
#include <FL/Fl_Value_Output.H>
#include <FL/Fl_Scrollbar.H>
#include <FL/Fl_Scrollbar.H>
#include <FL/fl_draw.H>
#include <FL/fl_output.H>
#include <FL/Fl_Scroll.H>
#include <FL/Fl_Pack.H>
#include <FL/Fl_Tabs.H>
#include <FL/Fl_Positioner.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Light_Button.H>
#include <FL/Fl_Check_Button.H>
#include <FL/Fl_Round_Button.H>
#include <FL/fl_draw.H>
#include "FL/Fl_Knob.H"
#include "FL/Fl_flews.H"

#include <vector>
#include <string>
#include <fstream.h>

using namespace std ;

extern "C" {
	#undef __cplusplus
	#include "cs.h"
	#include "widgets.h"
	#include "oload.h"
	#define __cplusplus
    extern EVTBLK *currevent; 
	extern char *unquote(char *name);
}
#undef exit

#define LIN_ 0
#define EXP_ -1
#undef min
#undef max

extern Fl_Window * FLkeyboard_init();
extern int FLkeyboard_sensing();
extern "C" void ButtonSched(MYFLT  *args[], int numargs);
extern "C" void deact(INSDS *ip);


//-------------

struct PANELS {
	Fl_Window *panel;
	int	is_subwindow;
	PANELS(Fl_Window *new_panel, int flag) : panel(new_panel), is_subwindow(flag){}
	PANELS() {panel = NULL; is_subwindow=0;	}
};

struct ADDR {
	void *opcode;
	void *WidgAddress;
};

struct ADDR_STACK /*: ADDR*/{
	OPDS *h;
	void *WidgAddress;
	int	count;
	ADDR_STACK(OPDS *new_h,void *new_address,  int new_count) : h(new_h),WidgAddress(new_address), count(new_count) {}
	ADDR_STACK() { h=NULL; WidgAddress = NULL;	count=0; }
};

struct ADDR_SET_VALUE /*: ADDR*/{
	int exponential;
	MYFLT min,max;
	void  *WidgAddress,  *opcode;
	ADDR_SET_VALUE(int new_exponential,MYFLT new_min, MYFLT new_max, void *new_WidgAddress, void *new_opcode) :
		exponential(new_exponential),min(new_min), max(new_max),WidgAddress(new_WidgAddress),opcode(new_opcode)	{}
	ADDR_SET_VALUE() { exponential=LIN_; min=0; max=0; WidgAddress=NULL; opcode=NULL; }
};

struct VALUATOR_FIELD {
	MYFLT value, value2;
	MYFLT min,max, min2,max2;
	int	exp, exp2;
	string widg_name;
	string opcode_name;
	VALUATOR_FIELD() {  value = 0; value2 =0; widg_name= ""; opcode_name =""; 
		min = 0; max =1; min2=0; max2=1; exp=LIN_; exp2=LIN_;}
};

char * GetString(MYFLT pname, char *t);

struct SNAPSHOT {
	int is_empty;
	vector<VALUATOR_FIELD> fields;
	SNAPSHOT(vector<ADDR_SET_VALUE>& valuators);
	SNAPSHOT() { is_empty = 1; }
	void get(vector<ADDR_SET_VALUE>& valuators);
};




SNAPSHOT::SNAPSHOT (vector<ADDR_SET_VALUE>& valuators)
{ // the constructor captures current values of all widgets by copying all current
  //  values from "valuators" vector (AddrSetValue) to the "fields" vector	
	is_empty =0;
	for (int i=0; i < valuators.size(); i++) {
			string  opcode_name, widg_name;
			ADDR_SET_VALUE& v  = valuators[i];
			if (fields.size() < i+1) 
				fields.resize(i+1);
			VALUATOR_FIELD& fld = fields[i];
			float val, min, max;
			opcode_name = fld.opcode_name = ((OPDS *) (v.opcode))->optext->t.opcod;
			if (opcode_name == "FLslider") {
				FLSLIDER *p = (FLSLIDER *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				val = *p->kout; min = *p->imin; max =*p->imax;
				if (val < min) val=min;
				else if(val>max) val=max;
				fld.value = val; 
				fld.min = *p->imin; fld.max = *p->imax; fld.exp = (int) *p->iexp;
			} else if (opcode_name == "FLknob") {
				FLKNOB *p = (FLKNOB *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				val = *p->kout; min = *p->imin; max =*p->imax;
				if (val < min) val=min;
				else if(val>max) val=max;
				fld.value = val; 
				fld.min = *p->imin; fld.max = *p->imax; fld.exp = (int) *p->iexp;
			} else if (opcode_name == "FLroller") {
				FLROLLER *p = (FLROLLER *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				val = *p->kout; min = *p->imin; max =*p->imax;
				if (val < min) val=min;
				else if(val>max) val=max;
				fld.value = val; 
				fld.min = *p->imin; fld.max = *p->imax; fld.exp = (int) *p->iexp;
			} else if (opcode_name == "FLtext") {
				FLTEXT *p = (FLTEXT *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				val = *p->kout; min = *p->imin; max =*p->imax;
				if (val < min) val=min;
				else if(val>max) val=max;
				fld.value = val; 
				fld.min = *p->imin; fld.max = *p->imax; fld.exp = LIN_;
			} else if (opcode_name == "FLjoy") {
				FLJOYSTICK *p = (FLJOYSTICK *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				val = *p->koutx; min = *p->iminx; max =*p->imaxx;
				if (val < min) val=min;
				else if(val>max) val=max;
				fld.value = val;
				val = *p->kouty; min = *p->iminy; max =*p->imaxy;
				if (val < min) val=min;
				else if(val>max) val=max;
				fld.value2 =val;
				fld.min =  *p->iminx; fld.max  = *p->imaxx; fld.exp  = (int) *p->iexpx;
				fld.min2 = *p->iminy; fld.max2 = *p->imaxy; fld.exp2 = (int) *p->iexpy;
			} else if (opcode_name == "FLbutton") {
				FLBUTTON *p = (FLBUTTON *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				fld.value = *p->kout;
				fld.min = 0; fld.max = 1; fld.exp = LIN_;
			} else if (opcode_name == "FLcount") {
				FLCOUNTER *p = (FLCOUNTER *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
				val = *p->kout; min = *p->imin; max =*p->imax;
				if (min != max) {
					if (val < min) val=min;
					else if(val>max) val=max;
				}
				fld.value = val; 
				fld.min = *p->imin; fld.max = *p->imax; fld.exp = LIN_;
			} else if (opcode_name == "FLvalue") {
				FLVALUE *p = (FLVALUE *) (v.opcode);
				fld.widg_name = GetString(*p->name, p->STRARG);
			}
			else if (opcode_name == "FLbox") {
				FL_BOX *p = (FL_BOX *) (v.opcode);
				fld.widg_name = GetString(*p->itext, p->STRARG);
			}
	}
}

void SNAPSHOT::get(vector<ADDR_SET_VALUE>& valuators) 
{  
	if(is_empty) {
		initerror("empty snapshot");
		return;
	}
	for (int j =0; j< valuators.size(); j++) {
		Fl_Widget* o = (Fl_Widget*) (valuators[j].WidgAddress);
		void *opcode = valuators[j].opcode;
		VALUATOR_FIELD& fld = fields[j];
		string opcode_name = fld.opcode_name;
		
		MYFLT val = fld.value, min=fld.min, max=fld.max, range,base;
		if (val < min) val =min;
		else if (val >max) val = max;

		if (opcode_name == "FLjoy") {
			switch(fld.exp) {
				case LIN_:	((Fl_Positioner*) o)->xvalue(val); 
					break;
				case EXP_:	
					range  = fld.max - fld.min;
					base = pow(fld.max / fld.min, 1/range);
					((Fl_Positioner*) o)->xvalue(log(val/fld.min) / log(base)) ;
					break;
				default:
					warning("not implemented yet");
					break;
			}
			val = fld.value2; min = fld.min2; max = fld.max2;
			if (val < min) val =min;
			else if (val >max) val = max;
			switch(fld.exp2) {
				case LIN_:	((Fl_Positioner*) o)->yvalue(val); 
					break;
				case EXP_:	
					range  = fld.max2 - fld.min2;
					base = pow(fld.max2 / fld.min2, 1/range);
					((Fl_Positioner*) o)->yvalue(log(val/fld.min2) / log(base)) ;
					break;
				default:
					warning("not implemented yet");
					break;
			}
			o->do_callback(o, opcode); 
		}
		else if (opcode_name == "FLbutton") {
			FLBUTTON *p = (FLBUTTON*) (opcode);
			if (*p->itype < 10) {//  don't allow to retreive its value if >= 10
				((Fl_Button*) o)->value(fld.value);
				o->do_callback(o, opcode); 
			}
		}
		else if (opcode_name == "FLcount") {
			FLCOUNTER *p = (FLCOUNTER*) (opcode);
			if (*p->itype < 10) { //  don't allow to retreive its value if >= 10
				((Fl_Counter*) o)->value(fld.value);
				o->do_callback(o, opcode); 
			}
		}
		else {
			switch(fld.exp) {
				case LIN_:	
					if (opcode_name == "FLbox" || opcode_name == "FLvalue" ) continue;
					((Fl_Valuator*) o)->value(val); 
					break;
				case EXP_:	
					range  = fld.max - fld.min;
					base = pow(fld.max / fld.min, 1/range);
					((Fl_Valuator*) o)->value(log(val/fld.min) / log(base)) ;
					break;
				default:
					warning("not implemented yet (bogus)");
					break;
			}
			o->do_callback(o, opcode); 
		}
	}
	Fl::check();
}



//---------------

static int curr_x = 0 , curr_y = 0;
static int stack_count=0;

static int FLcontrol_iheight = 15;
static int FLroller_iheight = 18;
static int FLcontrol_iwidth = 400;
static int FLroller_iwidth = 150;
static int FLvalue_iwidth = 100;

static int FLcolor = -1;
static int FLcolor2 = -1;
static int FLtext_size = 0;
static int FLtext_color = -1;
static int FLtext_font = -1;
static int FLtext_align = 0;

static int FL_ix = 10;
static int FL_iy = 10;

static vector<PANELS> fl_windows; // all panels
//static vector<void*> AddrValue; //addresses of widgets that display current value of valuators
static vector<ADDR_STACK> AddrStack; //addresses of containers 
static vector<ADDR_SET_VALUE> AddrSetValue; //addresses of valuators 
static vector<char*> allocatedStrings;
static unsigned long threadHandle;
static vector<SNAPSHOT> snapshots; 

static Fl_Window *oKeyb;
static int isActivatedKeyb=0;
//static int keyb_out=0;
static FLKEYB* keybp = NULL;

extern "C" void set_snap(FLSETSNAP *p)
{
	SNAPSHOT snap(AddrSetValue);
	int numfields = snap.fields.size();
	int index = (int) *p->index;
	*p->inum_snap = snapshots.size();
	*p->inum_val = numfields; // number of snapshots
	
	if (*p->ifn >= 1) { // if the table number is valid
		FUNC	*ftp;   // store the snapshot into the table
		if ((ftp = ftfind(p->ifn)) != NULL) {
			MYFLT * table = ftp->ftable;
			for( int j=0; j < numfields; j++) {
				table[index*numfields+j] = snap.fields[j].value;
			}
		}
		else initerror("FLsetsnap: invalid table");
	}
	else { // else store it into snapshot bank
		if (snapshots.size() < index+1)
			snapshots.resize(index+1);
		snapshots[index]=snap;
	}
}	



extern "C" void get_snap(FLGETSNAP *p)
{
	int index = *p->index;
	if (!snapshots.empty()) {
		if (index > snapshots.size()) index = snapshots.size();
		else if (index < 0 ) index=0;
		snapshots[index].get(AddrSetValue);
	}
	*p->inum_el = snapshots.size();
}	




extern "C" void save_snap(FLSAVESNAPS* p)
{
	char* filename = GetString(*p->filename,p->STRARG);
	fstream file(filename, ios::out);
	for (int j =0; j < snapshots.size(); j++) {
		file << "----------- "<< j << " -----------\n";
		for ( int k =0; k < snapshots[j].fields.size(); k++) {
			VALUATOR_FIELD& f = snapshots[j].fields[k];
			if (f.opcode_name == "FLjoy") {
				file <<f.opcode_name<<" "<< f.value <<" "<< f.value2
					<<" "<< f.min <<" "<< f.max <<" "<< f.min2 <<" "<< f.max2<<" "<<f.exp<<" "<<f.exp2<<" \"" <<f.widg_name<<"\"\n";
			}
			else {
				file <<f.opcode_name<<" "<< f.value 
					<<" "<< f.min <<" "<< f.max <<" "<<f.exp<<" \"" <<f.widg_name<<"\"\n";
			}
		}
	}
	file << "---------------------------";
	file.close();
}
/*
	MYFLT value, value2;
	MYFLT min,max, min2,max2;
	int	exp, exp2;
	string widg_name;
	string opcode_name;
	void *opcode;
*/
	
extern "C" void load_snap(FLLOADSNAPS* p)
{
	char* filename = GetString(*p->filename,p->STRARG);
	fstream file(filename, ios::in);
	int j=0,k=-1;
	char s[500];
	while (!(file.eof())) {
		//; 
		file.getline(s,500);
		string opc, opc_orig;
		char *ss = s, *opc_temp,/* *opc_orig,  */ *val, *val2, *min, *max, *min2, *max2, *exp, *exp2, *widg_name;
		if (*ss == '-'){ // if it is a separation line
			k++; j=0; 
			if (snapshots.size() < k+1)
			snapshots.resize(k+1);
		
		}
		else if (*ss != '\0' && *ss != ' ') { //ignore blank lines
			ADDR_SET_VALUE& v = AddrSetValue[j];
			if (snapshots[k].fields.size() < j+1)
				snapshots[k].fields.resize(j+1);
			snapshots[k].is_empty = 0;
			VALUATOR_FIELD& fld = snapshots[k].fields[j];
			opc_temp = ss; while(*ss != ' ') ss++; *ss++ = '\0';
			opc = opc_temp;
			opc_orig = ((OPDS *) (v.opcode))->optext->t.opcod;
			if (!(opc_orig == opc))
				initerror("unmatched widget, probably due to a modified orchestra");

			val = ss; while(*ss != ' ') ss++; *ss++ = '\0';
		
			if(opc == "FLjoy") {
				val2=ss; while(*ss != ' ') ss++; *ss++ = '\0';
				fld.value2 = atof(val2);

			}
			min = ss; while(*ss != ' ') ss++;	*ss++ = '\0';
			max = ss; while(*ss != ' ') ss++;	*ss++ = '\0';

			if(opc == "FLjoy") {
				min2 = ss; while(*ss != ' ') ss++;	*ss++ = '\0';
				max2 = ss; while(*ss != ' ') ss++;	*ss++ = '\0';
				fld.min2 = atof(min2);
				fld.max2 = atof(max2);
			}
			exp = ss; while(*ss != ' ') ss++;	*ss++ = '\0';

			if(opc == "FLjoy") {
				exp2 = ss; while(*ss != ' ') ss++;	*ss++ = '\0';
				fld.exp2 = atoi(exp2);
			}
			widg_name = ++ss; 
				while(*ss != '\"') 
					ss++;	
				*ss++ = '\0';
			
			fld.exp = atoi(exp);
			fld.value = atof(val);
			fld.min = atof(min);
			fld.max = atof(max);
			fld.exp = atoi(exp);
			fld.widg_name= widg_name;
			fld.opcode_name= opc;
			j++;
		}
		
	}
	file.close();

}
//-----------

char * GetString(MYFLT pname, char *t){
	char    *Name=  new char[MAXNAME];
	allocatedStrings.push_back(Name);
	if (pname == sstrcod) { 
		if (t == NULL) strcpy(Name,unquote(currevent->strarg));
		else strcpy(Name, unquote(t));
	} 
	else if ((long)pname < strsmax && strsets != NULL && strsets[(long)pname])
		strcpy(Name, strsets[(long)pname]);
	return Name;
}


#ifdef RESET
extern "C" void widgetRESET()
{
	int j;
	for (j = allocatedStrings.size()-1; j >=0; j--)  {
		delete allocatedStrings[j];
		allocatedStrings.pop_back();
	}
	for (j=fl_windows.size()-1; j >=0 ; j--) { //destroy all opened panels
		if  (fl_windows[j].is_subwindow == 0)	delete fl_windows[j].panel;
		fl_windows.pop_back();
	}
	//for (j = AddrValue.size()-1; j >=0; j--)  {
	//	AddrValue.pop_back();
	//}
	int ss = snapshots.size();
	for (j=0; j< ss; j++) {
		snapshots[j].fields.erase(snapshots[j].fields.begin(),snapshots[j].fields.end());
		snapshots.push_back();
	}
	if (isActivatedKeyb) {
		delete oKeyb;
	}
	//keyb_out=0;
	isActivatedKeyb=0;
	keybp = NULL;
	
	AddrSetValue.erase(AddrSetValue.begin(), AddrSetValue.end());


	curr_x = 0 , curr_y = 0;
	stack_count=0;
	
	FLcontrol_iheight = 15;
	FLroller_iheight = 18;
	FLcontrol_iwidth = 400;
	FLroller_iwidth = 150;
	FLvalue_iwidth = 100;
	
	FLcolor = -1;
	FLcolor2 = -1;
	FLtext_size = 0;
	FLtext_color = -1;
	FLtext_font = -1;
	FLtext_align = 0;
//	keyb_out = 0;
	FL_ix = 10;
	FL_iy = 10;
}

#endif
//-----------


static void __cdecl fltkRun(void *s)
{
	int j;
	for (j=0; j < fl_windows.size(); j++) {
		fl_windows[j].panel->show();
	}
#ifdef WIN32 // to make this thread to update GUI when no events are present
	SetTimer(0,0,200,NULL);
#endif
	Fl::run();
	warning("end of widget thread\n");
}

static void __cdecl fltkKeybRun(void *s)
{
	oKeyb->show();
	//Fl::run();
	
	while(Fl::wait()) {
		int temp = FLkeyboard_sensing();
		if (temp != 0 && *keybp->args[1] >=1 ) { 
			*keybp->kout = temp;
			ButtonSched(keybp->args, keybp->INOCOUNT);
		}

	}
	warning("end of keyboard thread\n");
}

extern "C" void FL_run(FLRUN *p)
{
#ifdef _WINDOWS
  threadHandle = _beginthread(fltkRun, 0, NULL);
  if (isActivatedKeyb) 
	  threadHandle = _beginthread(fltkKeybRun, 0, NULL);
#elif defined( LINUX ) || defined(someotherUNIXes)
  // create a new thread in the proper way here
#endif
}

extern "C" void fl_update(FLRUN *p)
{
	for(int j=0; j< AddrSetValue.size()-1; j++) {
		ADDR_SET_VALUE v = AddrSetValue[j];
		Fl_Valuator *o = (Fl_Valuator *) v.WidgAddress;
		o->do_callback(o, v.opcode);
	}
}

//----------------------------------------------

inline void displ(MYFLT val, MYFLT index)
{
	if (index >= 0) {//display current value of valuator 
		char valString[MAXNAME]; 
		((Fl_Output*) (AddrSetValue[(long) index]).WidgAddress)->value(gcvt( val, 5, valString )); 
	}
}


static void infoff(MYFLT p1)           /*  turn off an indef copy of instr p1  */
{                               /*      called by musmon                */
    INSDS *ip;
    int   insno;
	extern INSTRTXT **instrtxtp;
    insno = (int)p1;
    if ((ip = (instrtxtp[insno])->instance) != NULL) {
      do  if (ip->insno == insno          /* if find the insno */
              && ip->actflg                 /*      active       */
              //&& ip->offtim < 0             /*      but indef,   */
              && ip->p1 == p1) {
        VMSG(printf("turning off inf copy of instr %d\n",insno);)
        deact(ip);
        return;                     /*  turn it off */
      }
      while ((ip = ip->nxtinstance) != NULL);
    }
    //printf(Str(X_669,"could not find indefinitely playing instr %d\n"),insno);
}


static void fl_callbackButton(Fl_Button* w, void *a) 
{
	FLBUTTON *p = (FLBUTTON *) a;
	MYFLT val = *((FLBUTTON*) a)->kout =  (w->value()) ? *p->ion : *p->ioff;
	if (*p->args[0] >= 0) ButtonSched(p->args, p->INOCOUNT-8);
}	

static void fl_callbackButtonBank(Fl_Button* w, void *a) 
{
	FLBUTTONBANK *p = (FLBUTTONBANK *) a;
	MYFLT val = *((FLBUTTONBANK*) a)->kout = (MYFLT) atoi(w->label());
	if (*p->args[0] >= 0) ButtonSched(p->args, p->INOCOUNT-7);
}	


static void fl_callbackCounter(Fl_Counter* w, void *a) 
{
	FLCOUNTER *p = (FLCOUNTER *) a;
	MYFLT val = *((FLCOUNTER*) a)->kout =  w->value();
	if (*p->args[0] >= 0) ButtonSched(p->args, p->INOCOUNT-10);
}	

static void fl_callbackLinearSlider(Fl_Valuator* w, void *a) 
{
	FLSLIDER *p = ((FLSLIDER*) a);
	displ(*p->kout = w->value(), *p->idisp);
}	

static void fl_callbackExponentialSlider(Fl_Valuator* w, void *a) 
{
	FLSLIDER *p = ((FLSLIDER*) a);
	displ(*p->kout = p->min * pow (p->base, w->value()), *p->idisp);
}



static void fl_callbackInterpTableSlider(Fl_Valuator* w, void *a) 
{
	FLSLIDER *p = ((FLSLIDER*) a);
	MYFLT ndx = w->value() * (p->tablen-1);
	int index = (long) ndx;
	MYFLT v1 = p->table[index];
	displ(*p->kout = p->min+ ( v1 + (p->table[index+1] - v1) * (ndx - index)) * (*p->imax - p->min), *p->idisp);
}


static void fl_callbackTableSlider(Fl_Valuator* w, void *a) 
{
	FLSLIDER *p = ((FLSLIDER*) a);
	displ(*p->kout = p->min+ p->table[(long) (w->value() * p->tablen)] * (*p->imax - p->min), *p->idisp);
}


static void fl_callbackJoystick(Fl_Widget* w, void *a) 
{
	FLJOYSTICK *p = (FLJOYSTICK*) a;
	Fl_Positioner *j = (Fl_Positioner*) w;
	MYFLT val;
	int iexpx = *p->iexpx, iexpy = *p->iexpy;
	switch (iexpx) {
		case LIN_: 
			val = j->xvalue();
			break;	
		case EXP_:
			val = *p->iminx * pow (p->basex, j->xvalue());
			break;
		default:
			if (iexpx > 0) { //interpolated
				MYFLT ndx = j->xvalue() * (p->tablenx-1);
				int index = (long) ndx;
				MYFLT v1 = p->tablex[index];
				val = *p->iminx + ( v1 + (p->tablex[index+1] - v1) * (ndx - index)) * (*p->imaxx - *p->iminx);
			}
			else // non-interpolated
				val = *p->iminx+ p->tablex[(long) (j->xvalue() * p->tablenx)] * (*p->imaxx - *p->iminx);
	}
	displ(*p->koutx = val,*p->idispx);
	switch (iexpy) {
		case LIN_: 
			val = j->yvalue();
			break;	
		case EXP_:
			val = *p->iminy * pow (p->basey, j->yvalue());
			break;
		default:
			if (iexpy > 0) { //interpolated
				MYFLT ndx = j->yvalue() * (p->tableny-1);
				long index = (long) ndx;
				MYFLT v1 = p->tabley[index];
				val = *p->iminy + ( v1 + (p->tabley[index+1] - v1) * (ndx - index)) * (*p->imaxy - *p->iminy);
			}
			else { // non-interpolated
				MYFLT g = j->yvalue();
				long index = (long) (j->yvalue()* p->tableny);
				val = *p->iminy+ p->tabley[index] * (*p->imaxy - *p->iminy);
			
			}
	}
	displ(*p->kouty = val, *p->idispy);
}	

static void fl_callbackLinearRoller(Fl_Valuator* w, void *a) 
{
	FLROLLER *p = ((FLROLLER*) a);
	displ(*p->kout =  w->value(),*p->idisp);
}


static void fl_callbackExponentialRoller(Fl_Valuator* w, void *a) 
{
	FLROLLER *p = ((FLROLLER*) a);
	displ(*p->kout = ((FLROLLER*) a)->min * pow (p->base, w->value()), *p->idisp);
}


static void fl_callbackInterpTableRoller(Fl_Valuator* w, void *a) 
{
	FLROLLER *p = ((FLROLLER*) a);
	MYFLT ndx = w->value() * (p->tablen-1);
	int index = (long) ndx;
	MYFLT v1 = p->table[index];
	displ(*p->kout = p->min+ ( v1 + (p->table[index+1] - v1) * (ndx - index)) * (*p->imax - p->min), *p->idisp);
}


static void fl_callbackTableRoller(Fl_Valuator* w, void *a) 
{
	FLROLLER *p = ((FLROLLER*) a);
	displ(*p->kout = p->min+ p->table[(long) (w->value() * p->tablen)] * (*p->imax - p->min), *p->idisp);
}


static void fl_callbackLinearKnob(Fl_Valuator* w, void *a) 
{
	FLKNOB *p = ((FLKNOB*) a);
	displ( *p->kout = w->value(), *p->idisp);
}


static void fl_callbackExponentialKnob(Fl_Valuator* w, void *a) 
{
	FLKNOB *p = ((FLKNOB*) a);
	displ( *p->kout = ((FLKNOB*) a)->min * pow (p->base, w->value()), *p->idisp);
}


static void fl_callbackInterpTableKnob(Fl_Valuator* w, void *a) 
{
	FLKNOB *p = ((FLKNOB*) a);
	MYFLT ndx = w->value() * (p->tablen-1);
	int index = (long) ndx;
	MYFLT v1 = p->table[index];
	displ(*p->kout = p->min+ ( v1 + (p->table[index+1] - v1) * (ndx - index)) * (*p->imax - p->min), *p->idisp);
}


static void fl_callbackTableKnob(Fl_Valuator* w, void *a) 
{
	FLKNOB *p = ((FLKNOB*) a);
	displ(*p->kout = p->min+ p->table[(long) (w->value() * p->tablen)] * (*p->imax - p->min), *p->idisp);
}


static void fl_callbackLinearValueInput(Fl_Valuator* w, void *a) 
{
	*((FLTEXT*) a)->kout =  w->value();
}

//-----------
void widget_attributes(Fl_Widget *o)
{
	if (FLtext_size == -2 ) {
		FLtext_size = -1;
		FLtext_color= -1;
		FLtext_font = -1;
		FLtext_align= -1;
		FLcolor = -1;
	}
	if (FLtext_size)  o->labelsize(FLtext_size); // if > 0 assign it, else skip, leaving default
	switch ((int) FLtext_color) {
		case -2: // random color  
			o->labelcolor(
				fl_color_cube( 
					(rand()*256. / RAND_MAX) * FL_NUM_RED/256, 
					(rand()*256. / RAND_MAX) * FL_NUM_GREEN/256, 
					(rand()*256. / RAND_MAX) * FL_NUM_BLUE/256 
				)  
			); 
			break;
		case -1:  // if FLtext_color is == -1, color assignment is skipped, leaving default color
			break;
		default:
			o->labelcolor(FLtext_color);
			break;
	}
	if (FLtext_font> 0) {
		Fl_Font font;
		switch (FLtext_font) {
			case 1: font = FL_HELVETICA; break;
			case 2: font = FL_HELVETICA_BOLD; break;
			case 3: font = FL_HELVETICA_ITALIC; break;
			case 4: font = FL_HELVETICA_BOLD_ITALIC; break;
			case 5: font = FL_COURIER; break;
			case 6: font = FL_COURIER_BOLD; break;
			case 7: font = FL_COURIER_ITALIC; break;
			case 8: font = FL_COURIER_BOLD_ITALIC; break;
			case 9: font = FL_TIMES; break;
			case 10: font = FL_TIMES_BOLD; break;
			case 11: font = FL_TIMES_ITALIC; break;
			case 12: font = FL_TIMES_BOLD_ITALIC; break;
			case 13: font = FL_SYMBOL; break;
			case 14: font = FL_SCREEN; break;
			case 15: font = FL_SCREEN_BOLD; break;
			case 16: font = FL_ZAPF_DINGBATS; break;
			default: font = FL_HELVETICA; break;
		}
		o->labelfont(font);
	}
	if (FLtext_align > 0) {
		Fl_Align type;
		switch (FLtext_align) {
			case -1: break;
			case 1: type = FL_ALIGN_CENTER; break;
			case 2: type = FL_ALIGN_TOP; break;
			case 3: type = FL_ALIGN_BOTTOM; break;
			case 4: type = FL_ALIGN_LEFT; break;
			case 5: type = FL_ALIGN_RIGHT; break;
			case 6: type = FL_ALIGN_TOP_LEFT; break;
			case 7: type = FL_ALIGN_TOP_RIGHT; break;
			case 8: type = FL_ALIGN_BOTTOM_LEFT; break;
			case 9: type = FL_ALIGN_BOTTOM_RIGHT; break;
			default: type = FL_ALIGN_BOTTOM; break;
		}
		o->align(type);
	}
	switch ((int) FLcolor) { // random color  
		case -2:
			o->color(FL_GRAY, 
				fl_color_cube( 
					(rand()*256. / RAND_MAX) * FL_NUM_RED/256, 
					(rand()*256. / RAND_MAX) * FL_NUM_GREEN/256, 
					(rand()*256. / RAND_MAX) * FL_NUM_BLUE/256 
				)  
			);
			break;
		case -1: // if FLcolor is == -1, color assignment is skipped, leaving widget default color
			break;
		default:
			o->color(FLcolor, FLcolor2); 
			break;
	}
}


//-----------


extern "C" void FLkeyb(FLKEYB *p)
{
	isActivatedKeyb = 1;
	oKeyb = FLkeyboard_init();
	keybp = p; //output of the keyboard is stored into a global variable pointer
}


//-----------


extern "C" void StartPanel(FLPANEL *p)
{
	char* panelName = GetString(*p->name,p->STRARG);
	
	int x = *p->ix, y =*p->iy, width = *p->iwidth, height=*p->iheight;
	if(width <0) width = 400; //default
	if(height <0) height = 300;

	int borderType;
	switch( (int) *p->border ) {
		case 0: borderType = FL_FLAT_BOX; break;
		case 1: borderType = FL_DOWN_BOX; break;
		case 2: borderType = FL_UP_BOX; break;
		case 3:	borderType = FL_ENGRAVED_BOX; break;
		case 4:	borderType = FL_EMBOSSED_BOX; break;
		case 5:	borderType = FL_BORDER_BOX; break;
		case 6:	borderType = FL_THIN_DOWN_BOX; break;
		case 7:	borderType = FL_THIN_UP_BOX; break;
		default: borderType = FL_FLAT_BOX;
	}
	
	Fl_Window *o;
	if(x < 0) o = new Fl_Window(width,height, panelName);
	else 	o = new Fl_Window(x,y,width,height, panelName);
	widget_attributes(o);
	o->box((Fl_Boxtype) borderType);
	o->resizable(o);
	widget_attributes(o);
	ADDR_STACK adrstk(&p->h, (void *) o, stack_count);
	AddrStack.push_back(adrstk);
	PANELS panel(o, (stack_count>0) ? 1 : 0);
	fl_windows.push_back(panel);
	stack_count++;
}

extern "C" void EndPanel(FLPANELEND *p)
{
	stack_count--;
	ADDR_STACK adrstk = AddrStack.back();
	if (strcmp( adrstk.h->optext->t.opcod, "FLpanel"))
		initerror("FLpanel_end: invalid stack pointer: verify its placement");
	if(adrstk.count != stack_count)
		initerror("FLpanel_end: invalid stack count: verify FLpanel/FLpanel_end count and placement");
	((Fl_Window*) adrstk.WidgAddress)->end();
	AddrStack.pop_back();
}

//-----------
extern "C" void StartScroll(FLSCROLL *p)
{
    Fl_Scroll *o = new Fl_Scroll ((int) *p->ix, (int) *p->iy, (int) *p->iwidth, (int) *p->iheight);
	ADDR_STACK adrstk(&p->h,o,stack_count);
	AddrStack.push_back(adrstk);
	stack_count++;
}

extern "C" void EndScroll(FLSCROLLEND *p)
{
	stack_count--;
	ADDR_STACK adrstk = AddrStack.back();
	if (strcmp( adrstk.h->optext->t.opcod, "FLscroll"))
		initerror("FLscroll_end: invalid stack pointer: verify its placement");
	if(adrstk.count != stack_count)
		initerror("FLscroll_end: invalid stack count: verify FLscroll/FLscroll_end count and placement");
	((Fl_Scroll*) adrstk.WidgAddress)->end();

	AddrStack.pop_back();
}

//-----------
extern "C" void StartTabs(FLTABS *p)
{
    Fl_Tabs *o = new Fl_Tabs ((int) *p->ix, (int) *p->iy, (int) *p->iwidth, (int) *p->iheight);
	widget_attributes(o);
	ADDR_STACK adrstk(&p->h,o,stack_count);
	AddrStack.push_back(adrstk);
	stack_count++;
}

extern "C" void EndTabs(FLTABSEND *p)
{
	stack_count--;
	ADDR_STACK adrstk = AddrStack.back();
	if (strcmp( adrstk.h->optext->t.opcod, "FLtabs"))
		initerror("FLscroll_end: invalid stack pointer: verify its placement");
	if(adrstk.count != stack_count)
		initerror("FLtabs_end: invalid stack count: verify FLtabs/FLtabs_end count and placement");
	((Fl_Scroll*) adrstk.WidgAddress)->end();

	AddrStack.pop_back();
}

//-----------
extern "C" void StartGroup(FLGROUP *p)
{
	char *Name = GetString(*p->name,p->STRARG);
    Fl_Group *o = new Fl_Group ((int) *p->ix, (int) *p->iy, (int) *p->iwidth, (int) *p->iheight,Name);
	widget_attributes(o);
	int borderType;
	switch((int)*p->border ) {
		case 0: borderType = FL_FLAT_BOX; break;
		case 1: borderType = FL_DOWN_BOX; break;
		case 2: borderType = FL_UP_BOX; break;
		case 3:	borderType = FL_ENGRAVED_BOX; break;
		case 4:	borderType = FL_EMBOSSED_BOX; break;
		case 5:	borderType = FL_BORDER_BOX; break;
		case 6:	borderType = FL_THIN_DOWN_BOX; break;
		case 7:	borderType = FL_THIN_UP_BOX; break;
		default: borderType = FL_FLAT_BOX;
	}
	o->box((Fl_Boxtype) borderType);
	widget_attributes(o);
	ADDR_STACK adrstk(&p->h,o,stack_count);
	AddrStack.push_back(adrstk);
	stack_count++;
}

extern "C" void EndGroup(FLGROUPEND *p)
{
	stack_count--;
	ADDR_STACK adrstk = AddrStack.back();
	if (strcmp( adrstk.h->optext->t.opcod, "FLgroup"))
		initerror("FLgroup_end: invalid stack pointer: verify its placement");
	if(adrstk.count != stack_count)
		initerror("FLgroup_end: invalid stack count: verify FLgroup/FLgroup_end count and placement");
	((Fl_Scroll*) adrstk.WidgAddress)->end();

	AddrStack.pop_back();
}

//-----------

extern "C" void StartPack(FLSCROLL *p)
{
    Fl_Pack *o = new Fl_Pack ((int) *p->ix, (int) *p->iy, (int) *p->iwidth, (int) *p->iheight);
	//fl_window->resizable(o);
	o->box(FL_ENGRAVED_FRAME);
	o->spacing(15);

	ADDR_STACK adrstk(&p->h,o,stack_count);;
	AddrStack.push_back(adrstk);
	stack_count++;
}

extern "C" void EndPack(FLSCROLLEND *p)
{
	stack_count--;
	ADDR_STACK adrstk = AddrStack.back();
	if (strcmp( adrstk.h->optext->t.opcod, "FLpack"))
		initerror("FLpack_end: invalid stack pointer: verify its placement");
	if(adrstk.count != stack_count)
		initerror("FLpack_end: invalid stack count: verify FLpack/FLpack_end count and placement");
	((Fl_Pack*) adrstk.WidgAddress)->end();

	AddrStack.pop_back();

}

//-----------

extern "C" void fl_widget_color(FLWIDGCOL *p)
{
	if (*p->red1 < 0) { // reset colors to default 
		FLcolor = (int) *p->red1; //when called without arguments
		FLcolor2 =(int) *p->red1;
	}
	else {
		FLcolor = fl_color_cube(
			(int) *p->red1   * FL_NUM_RED  /256,
			(int) *p->green1 * FL_NUM_GREEN/256,
			(int) *p->blue1  * FL_NUM_BLUE /256
		);
		FLcolor2 = fl_color_cube(
			(int) *p->red2   * FL_NUM_RED  /256,
			(int) *p->green2 * FL_NUM_GREEN/256,
			(int) *p->blue2  * FL_NUM_BLUE /256
		);
	}
}

extern "C" void fl_widget_label(FLWIDGLABEL *p)
{
	if (*p->size <= 0) { // reset settings to default  
		FLtext_size = 0; //when called without arguments
		FLtext_font = -1;
		FLtext_align = 0;
		FLtext_color = -1;
	}
	else {
		FLtext_size = (int) *p->size;
	
		if (*p->font > -1) FLtext_font = (int) *p->font;
		if (*p->align > 0)  FLtext_align =  (int) *p->align;
		if (*p->red > -1 && *p->green > -1 && *p->blue > -1) {
			FLtext_color = fl_color_cube(
				(int) *p->red   * FL_NUM_RED  /256,
				(int) *p->green * FL_NUM_GREEN/256,
				(int) *p->blue  * FL_NUM_BLUE /256
			);
		}
	}
}
//-----------

extern "C" void fl_setWidgetValuei(FL_SET_WIDGET_VALUE_I *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	MYFLT val = *p->ivalue, range, base;
	switch (v.exponential) {
		case LIN_: //linear
			if (val > v.max) val = v.max;
			else if (val < v.min) val = v.min;
			break; 
		case EXP_: //exponential
			range = v.max-v.min; 
			base = pow(v.max / v.min, 1/range);
			val = (log(val/v.min) / log(base)) ;
			break; 
		default: 
			warning("not implemented yet");
	}
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	if (strcmp(((OPDS *) v.opcode)->optext->t.opcod, "FLbutton"))
		((Fl_Valuator *)o)->value(val);
	else
		((Fl_Button *)o)->value(val);
	o->do_callback(o, v.opcode);
}

extern "C" void fl_setWidgetValue(FL_SET_WIDGET_VALUE *p)
{
	
}


//-----------
//-----------

extern "C" void fl_setColor1(FL_SET_COLOR *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	int color = fl_color_cube(
			(int) *p->red   * FL_NUM_RED  /256,
			(int) *p->green * FL_NUM_GREEN/256,
			(int) *p->blue  * FL_NUM_BLUE /256
		);
	o->color(color);
}

extern "C" void fl_setColor2(FL_SET_COLOR *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	int color = fl_color_cube(
			(int) *p->red   * FL_NUM_RED  /256,
			(int) *p->green * FL_NUM_GREEN/256,
			(int) *p->blue  * FL_NUM_BLUE /256
		);
	o->selection_color(color);
}

extern "C" void fl_setTextColor(FL_SET_COLOR *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	int color = fl_color_cube(
			(int) *p->red   * FL_NUM_RED  /256,
			(int) *p->green * FL_NUM_GREEN/256,
			(int) *p->blue  * FL_NUM_BLUE /256
		);
	o->labelcolor(color);
}

extern "C" void fl_setTextSize(FL_SET_TEXTSIZE *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	o->labelsize((uchar) *p->ivalue );
}

extern "C" void fl_setFont(FL_SET_FONT *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	Fl_Font font;
	switch ((int) *p->itype) {
		case 1: font = FL_HELVETICA; break;
		case 2: font = FL_HELVETICA_BOLD; break;
		case 3: font = FL_HELVETICA_ITALIC; break;
		case 4: font = FL_HELVETICA_BOLD_ITALIC; break;
		case 5: font = FL_COURIER; break;
		case 6: font = FL_COURIER_BOLD; break;
		case 7: font = FL_COURIER_ITALIC; break;
		case 8: font = FL_COURIER_BOLD_ITALIC; break;
		case 9: font = FL_TIMES; break;
		case 10: font = FL_TIMES_BOLD; break;
		case 11: font = FL_TIMES_ITALIC; break;
		case 12: font = FL_TIMES_BOLD_ITALIC; break;
		case 13: font = FL_SYMBOL; break;
		case 14: font = FL_SCREEN; break;
		case 15: font = FL_SCREEN_BOLD; break;
		case 16: font = FL_ZAPF_DINGBATS; break;
		default: font = FL_SCREEN;
	}
	o->labelfont(font);
}

extern "C" void fl_setTextType(FL_SET_FONT *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	Fl_Labeltype type;
	switch ((int) *p->itype) {
		case 0: type = FL_NORMAL_LABEL; break;
		case 1: type = FL_NO_LABEL; break;
		case 2: type = FL_SYMBOL_LABEL; break;
		case 3: type = FL_SHADOW_LABEL; break;
		case 4: type = FL_ENGRAVED_LABEL; break;
		case 5: type = FL_EMBOSSED_LABEL; break;
		case 6: type = _FL_BITMAP_LABEL; break;
		case 7: type = _FL_PIXMAP_LABEL; break;
		case 8: type = _FL_IMAGE_LABEL; break;
		case 9: type = _FL_MULTI_LABEL; break;
		case 10: type = FL_FREE_LABELTYPE; break;
		default: type = FL_NORMAL_LABEL;
	}
	o->labeltype(type);
	o->window()->redraw();
}

extern "C" void fl_box(FL_BOX *p)
{
	char *text = GetString(*p->itext,p->STRARG);
	Fl_Box *o =  new Fl_Box(*p->ix, *p->iy, *p->iwidth, *p->iheight, text);
	widget_attributes(o);
	Fl_Boxtype type;
	switch ((int) *p->itype) {
		case 1: type = FL_FLAT_BOX; break;
		case 2: type = FL_UP_BOX; break;
		case 3: type = FL_DOWN_BOX; break;
		case 4: type = FL_THIN_UP_BOX; break;
		case 5: type = FL_THIN_DOWN_BOX; break;
		case 6: type = FL_ENGRAVED_BOX; break;
		case 7: type = FL_EMBOSSED_BOX; break;
		case 8: type = FL_BORDER_BOX; break;
		case 9: type = _FL_SHADOW_BOX; break;
		case 10: type = _FL_ROUNDED_BOX; break;
		case 11: type = _FL_RSHADOW_BOX; break;
		case 12: type = _FL_RFLAT_BOX; break;
		case 13: type = _FL_ROUND_UP_BOX; break;
		case 14: type = _FL_ROUND_DOWN_BOX; break;
		case 15: type = _FL_DIAMOND_UP_BOX; break;
		case 16: type = _FL_DIAMOND_DOWN_BOX; break;
		case 17: type = _FL_OVAL_BOX; break;
		case 18: type = _FL_OSHADOW_BOX; break;
		case 19: type = _FL_OFLAT_BOX; break;
		default: type = FL_FLAT_BOX;
	}
	o->box(type);
	Fl_Font font;
	switch ((int) *p->ifont) {
		case 1: font = FL_HELVETICA; break;
		case 2: font = FL_HELVETICA_BOLD; break;
		case 3: font = FL_HELVETICA_ITALIC; break;
		case 4: font = FL_HELVETICA_BOLD_ITALIC; break;
		case 5: font = FL_COURIER; break;
		case 6: font = FL_COURIER_BOLD; break;
		case 7: font = FL_COURIER_ITALIC; break;
		case 8: font = FL_COURIER_BOLD_ITALIC; break;
		case 9: font = FL_TIMES; break;
		case 10: font = FL_TIMES_BOLD; break;
		case 11: font = FL_TIMES_ITALIC; break;
		case 12: font = FL_TIMES_BOLD_ITALIC; break;
		case 13: font = FL_SYMBOL; break;
		case 14: font = FL_SCREEN; break;
		case 15: font = FL_SCREEN_BOLD; break;
		case 16: font = FL_ZAPF_DINGBATS; break;
		default: font = FL_HELVETICA;
	}
	o->labelfont(font);
	o->labelsize(*p->isize);
	o->align(FL_ALIGN_WRAP);
	AddrSetValue.push_back(ADDR_SET_VALUE(0, 0, 0, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 

}


extern "C" void fl_setText(FL_SET_TEXT *p)
{
	char *text = GetString(*p->itext,p->STRARG);
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	o->label(text);
}

extern "C" void fl_setSize(FL_SET_SIZE *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	o->size((short)  *p->iwidth, (short) *p->iheight);
}

extern "C" void fl_setPosition(FL_SET_POSITION *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	o->position((short)  *p->ix, (short) *p->iy);
}

extern "C" void fl_hide(FL_WIDHIDE *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	o->hide();
}

extern "C" void fl_show(FL_WIDSHOW *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	o->show();
}

extern "C" void fl_setBox(FL_SETBOX *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	Fl_Boxtype type;
	switch ((int) *p->itype) {
		case 1: type = FL_FLAT_BOX; break;
		case 2: type = FL_UP_BOX; break;
		case 3: type = FL_DOWN_BOX; break;
		case 4: type = FL_THIN_UP_BOX; break;
		case 5: type = FL_THIN_DOWN_BOX; break;
		case 6: type = FL_ENGRAVED_BOX; break;
		case 7: type = FL_EMBOSSED_BOX; break;
		case 8: type = FL_BORDER_BOX; break;
		case 9: type = FL_SHADOW_BOX; break;
		case 10: type = FL_ROUNDED_BOX; break;
		case 11: type = FL_RSHADOW_BOX; break;
		case 12: type = FL_RFLAT_BOX; break;
		case 13: type = FL_ROUND_UP_BOX; break;
		case 14: type = FL_ROUND_DOWN_BOX; break;
		case 15: type = FL_DIAMOND_UP_BOX; break;
		case 16: type = FL_DIAMOND_DOWN_BOX; break;
		case 17: type = FL_OVAL_BOX; break;
		case 18: type = FL_OSHADOW_BOX; break;
		case 19: type = FL_OFLAT_BOX; break;
		default: type = FL_FLAT_BOX;
	}
	o->box(type);
}

extern "C" void fl_align(FL_TALIGN *p)
{
	ADDR_SET_VALUE v = AddrSetValue[(int) *p->ihandle];
	Fl_Widget *o = (Fl_Widget *) v.WidgAddress;
	Fl_Align type;
	switch ((int) *p->itype) {
		case 1: type = FL_ALIGN_CENTER; break;
		case 2: type = FL_ALIGN_TOP; break;
		case 3: type = FL_ALIGN_BOTTOM; break;
		case 4: type = FL_ALIGN_LEFT; break;
		case 5: type = FL_ALIGN_RIGHT; break;
		case 6: type = FL_ALIGN_TOP_LEFT; break;
		case 7: type = FL_ALIGN_TOP_RIGHT; break;
		case 8: type = FL_ALIGN_BOTTOM_LEFT; break;
		case 9: type = FL_ALIGN_BOTTOM_RIGHT; break;
		default: type = FL_ALIGN_BOTTOM;
	}
	o->align(type);
}

//-----------
//-----------




extern "C" void fl_value(FLVALUE *p)
{
	char *controlName = GetString(*p->name,p->STRARG);
	int ix, iy, iwidth, iheight;
	if (*p->ix<0) ix = FL_ix;	else  FL_ix = ix = *p->ix;
	if (*p->iy<0) iy = FL_iy;	else  FL_iy = iy = *p->iy;
	if (*p->iwidth<0) iwidth = FLvalue_iwidth; else FLvalue_iwidth = iwidth = *p->iwidth;
	if (*p->iheight<0) iheight = FLroller_iheight;	else FLroller_iheight = iheight = *p->iheight;

	Fl_Output *o = new Fl_Output(ix, iy, iwidth, iheight,controlName);
	o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
	if (FLcolor < 0 )
		o->color(FL_GRAY );
	else
		o->color(FLcolor, FLcolor2); 
	widget_attributes(o);
	//AddrValue.push_back((void *) o);
	AddrSetValue.push_back(ADDR_SET_VALUE(0, 0, 0, (void *) o, (void *) p));
	//*p->ihandle = AddrValue.size()-1; 
	*p->ihandle = AddrSetValue.size()-1; 
	
}


//-----------

extern "C" void fl_slider(FLSLIDER *p)
{
	char *controlName = GetString(*p->name,p->STRARG);
	int ix,iy,iwidth, iheight,itype, iexp;

	if (*p->iy < 0) {
		iy = FL_iy;
		FL_iy += FLcontrol_iheight + 5;
	} else {
		iy = *p->iy;
		FL_iy = iy + FLcontrol_iheight + 5;
	}
	if (*p->ix < 0)  ix = FL_ix; // omitted options: set default
	else  FL_ix = ix = *p->ix;
	if (*p->iwidth < 0) iwidth = FLcontrol_iwidth;
	else FLcontrol_iwidth = iwidth = *p->iwidth;
	if (*p->iheight < 0) iheight = FLcontrol_iheight;
	else FLcontrol_iheight = iheight = *p->iheight;
	if (*p->itype < 1) itype = 1;
	else  itype = (int) *p->itype;
	
	//if (*p->iexp == LIN_) iexp = LIN_;
	//else  iexp = (int) *p->iexp;
	switch((int) *p->iexp) {
		case -1: iexp = EXP_; break;
		case 0: iexp = LIN_; break; 
		default: iexp = *p->iexp;
	}

	
	if (itype > 10 && iexp == EXP_) {
		warning("FLslider exponential, using non-labeled slider");
		itype -= 10;
	}

	Fl_Slider *o;
	if (itype < 10)	o = new Fl_Slider(ix, iy, iwidth, iheight, controlName);
	else { 
		o = new Fl_Value_Slider_Input(ix, iy, iwidth, iheight, controlName);
		itype -=10;
		//o->labelsize(20);
		((Fl_Value_Slider_Input*) o)->textboxsize(50);
		((Fl_Value_Slider_Input*) o)->textsize(13);
		o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
	}
	switch (itype) {
		case 1:  o->type(FL_HOR_FILL_SLIDER); break;
		case 2:	 o->type(FL_VERT_FILL_SLIDER); break;
		case 3:	 o->type(FL_HOR_SLIDER); break;
		case 4:	 o->type(FL_VERT_SLIDER); break;
		case 5:  o->type(FL_HOR_NICE_SLIDER); o->box(FL_FLAT_BOX); break;
		case 6:	 o->type(FL_VERT_NICE_SLIDER); o->box(FL_FLAT_BOX); break;
		default: initerror("FLslider: invalid slider type");
	}
	widget_attributes(o);
	MYFLT min = p->min = *p->imin, max = *p->imax, range;
	switch (iexp) {
		case LIN_: //linear
			o->range(min,max);
			o->callback((Fl_Callback*)fl_callbackLinearSlider,(void *) p);
			break;
		case EXP_ : //exponential
			if (min == 0 || max == 0)
				initerror("FLslider: zero is illegal in exponential operations");
			range = max - min;
			o->range(0,range);
			p->base = pow((max / min), 1/range);
			o->callback((Fl_Callback*)fl_callbackExponentialSlider,(void *) p);
			break;
		default: 
		{
			FUNC *ftp;
			MYFLT fnum = abs(iexp);
			if((ftp = ftfind(&fnum)) != NULL) {
				p->table = ftp->ftable;
				p->tablen = ftp->flen;
			}
			else return;
			o->range(0,.99999999);
			if (iexp > 0) //interpolated
				o->callback((Fl_Callback*)fl_callbackInterpTableSlider,(void *) p);
			else // non-interpolated
				o->callback((Fl_Callback*)fl_callbackTableSlider,(void *) p);
		}
	}
	AddrSetValue.push_back(ADDR_SET_VALUE(iexp, *p->imin, *p->imax, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
}


extern "C" void fl_joystick(FLJOYSTICK *p)
{
	char *Name = GetString(*p->name,p->STRARG);
	int ix,iy,iwidth, iheight, iexpx, iexpy;

	if (*p->ix < 0)  ix = 10; // omitted options: set default
	else  FL_ix = ix = *p->ix;
	if (*p->iy < 0)  iy = 10; // omitted options: set default
	else  iy = *p->iy;
	if (*p->iwidth < 0) iwidth = 130;
	else iwidth = *p->iwidth;
	if (*p->iheight < 0) iheight = 130;
	else iheight = *p->iheight;


	switch((int) *p->iexpx) {
		case -1: iexpx = EXP_; break;
		case 0: iexpx = LIN_; break; 
		default: iexpx = *p->iexpx;
	}
	switch((int) *p->iexpy) {
		case -1: iexpy = EXP_; break;
		case 0: iexpy = LIN_; break; 
		default: iexpy = *p->iexpy;
	}
/*
	if (*p->iexpx == LIN_) iexpx = LIN_;
	else  iexpx = (int) *p->iexpx;
	if (*p->iexpy == LIN_) iexpy = LIN_;
	else  iexpy = (int) *p->iexpy;
*/	

	Fl_Positioner *o = new Fl_Positioner(ix, iy, iwidth, iheight, Name);
	widget_attributes(o);
	switch (iexpx) {
		case LIN_: //linear
			o->xbounds(*p->iminx,*p->imaxx); break;
		case EXP_: //exponential
			{ if (*p->iminx == 0 || *p->imaxx == 0)
				initerror("FLjoy X axe: zero is illegal in exponential operations");
			MYFLT range = *p->imaxx - *p->iminx;
			o->xbounds(0,range);
			p->basex = pow((*p->imaxx / *p->iminx), 1/range);
			} break;
		default:
		{
			FUNC *ftp;
			MYFLT fnum = abs(iexpx);
			if((ftp = ftfind(&fnum)) != NULL) {
				p->tablex = ftp->ftable;
				p->tablenx = ftp->flen;
			}
			else return;
			o->xbounds(0,.99999999);
			/*
			if (iexp > 0) //interpolated
				o->callback((Fl_Callback*)fl_callbackInterpTableSlider,(void *) p); 
			else // non-interpolated
				o->callback((Fl_Callback*)fl_callbackTableSlider,(void *) p);
			*/
		}
	}
   	switch (iexpy) {
		case LIN_: //linear
			o->ybounds(*p->iminy,*p->imaxy); break;
		case EXP_ : //exponential
			{ if (*p->iminy == 0 || *p->imaxy == 0)
				initerror("FLjoy X axe: zero is illegal in exponential operations");
			MYFLT range = *p->imaxy - *p->iminy;
			o->ybounds(0,range);
			p->basey = pow((*p->imaxy / *p->iminy), 1/range);
			} break;
		default:
		{
			FUNC *ftp;
			MYFLT fnum = abs(iexpy);
			if((ftp = ftfind(&fnum)) != NULL) {
				p->tabley = ftp->ftable;
				p->tableny = ftp->flen;
			}
			else return;
			o->ybounds(0,.99999999);
		/*	if (iexp > 0) //interpolated
				o->callback((Fl_Callback*)fl_callbackInterpTableSlider,(void *) p); 
			else // non-interpolated
				o->callback((Fl_Callback*)fl_callbackTableSlider,(void *) p);
		*/
		}
	}
	o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
	o->callback((Fl_Callback*)fl_callbackJoystick,(void *) p);
	AddrSetValue.push_back(ADDR_SET_VALUE(iexpx, *p->iminx, *p->imaxx, (void *) o, (void *) p));
	*p->ihandle1 = AddrSetValue.size()-1; 
	AddrSetValue.push_back(ADDR_SET_VALUE(iexpy, *p->iminy, *p->imaxy, (void *) o, (void *) p));
	*p->ihandle2 = AddrSetValue.size()-1; 

}


extern "C" void fl_knob(FLKNOB *p)
{
	char *controlName = GetString(*p->name,p->STRARG);
	int ix,iy,iwidth, itype, iexp;

	if (*p->iy < 0) iy = FL_iy;
	else  FL_iy = iy = *p->iy;
	if (*p->ix < 0)  ix = FL_ix;
	else  FL_ix = ix = *p->ix;
	if (*p->iwidth < 0) iwidth = FLcontrol_iwidth;
	else FLcontrol_iwidth = iwidth = *p->iwidth;
	if (*p->itype < 1) itype = 1;
	else  itype = (int) *p->itype;
	/*
	if (*p->iexp < LIN_) iexp = LIN_;
	else  iexp = (int) *p->iexp;
*/
	switch((int) *p->iexp) {
		case -1: iexp = EXP_; break;
		case 0: iexp = LIN_; break; 
		default: iexp = *p->iexp;
	}

	Fl_Valuator* o;
	switch (itype) {
		case 1:
			o = new Fl_Knob(ix, iy, iwidth, iwidth, controlName);
			break;
		case 2:
			o = new Fl_Dial(ix, iy, iwidth, iwidth, controlName);
			o->type(FL_FILL_DIAL);
			o->box(_FL_OSHADOW_BOX);
			((Fl_Dial*) o)->angles(20,340);
			break;
		case 3:
			o = new Fl_Dial(ix, iy, iwidth, iwidth, controlName);
			o->type(FL_LINE_DIAL); 
			o->box(_FL_OSHADOW_BOX);
			break;
		case 4:
			o = new Fl_Dial(ix, iy, iwidth, iwidth, controlName);
			o->type(FL_NORMAL_DIAL); 
			o->box(_FL_OSHADOW_BOX);
			break;
		default:
			initerror("FLknob: invalid knob type");
	}
	widget_attributes(o);
	o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
    o->range(*p->imin,*p->imax);
   	switch (iexp) {
		case LIN_: //linear
			o->range(*p->imin,*p->imax);
			o->callback((Fl_Callback*)fl_callbackLinearKnob,(void *) p);
			o->step(0.001);
			break;
		case EXP_ : //exponential
			{ MYFLT min = p->min = *p->imin, max = *p->imax;
			if (min == 0 || max == 0)
				initerror("FLknob: zero is illegal in exponential operations");
			MYFLT range = max - min;
			o->range(0,range);
			p->base = pow((max / min), 1/range);
			o->callback((Fl_Callback*)fl_callbackExponentialKnob,(void *) p);
			} break;
		default:
		{
			FUNC *ftp;
			p->min = *p->imin;
			MYFLT fnum = abs(iexp);
			if((ftp = ftfind(&fnum)) != NULL) {
				p->table = ftp->ftable;
				p->tablen = ftp->flen;
			}
			else return;
			o->range(0,.99999999);
			if (iexp > 0) //interpolated
				o->callback((Fl_Callback*)fl_callbackInterpTableKnob,(void *) p); 
			else // non-interpolated
				o->callback((Fl_Callback*)fl_callbackTableKnob,(void *) p);
		}
	}
	AddrSetValue.push_back(ADDR_SET_VALUE(iexp, *p->imin, *p->imax, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
}




extern "C" void fl_text(FLTEXT *p)
{
	char *controlName = GetString(*p->name,p->STRARG);
	int ix,iy,iwidth,iheight,itype;
	MYFLT	istep;

	if (*p->iy < 0) iy = FL_iy;
	else  FL_iy = iy = *p->iy;
	if (*p->ix < 0)  ix = FL_ix;
	else  FL_ix = ix = *p->ix;
	if (*p->iwidth < 0) iwidth = FLcontrol_iwidth;
	else FLcontrol_iwidth = iwidth = *p->iwidth;
	if (*p->iheight < 0) iheight = FLcontrol_iheight;
	else FLcontrol_iheight = iheight = *p->iheight;
	if (*p->itype < 1) itype = 1;
	else  itype = (int) *p->itype;
	if (*p->istep < 0) istep = FL(.1);
	else  istep = *p->istep;

	Fl_Valuator* o;
	switch(itype) {
		case 1:	{
			o = new Fl_Value_Input(ix, iy, iwidth, iheight, controlName);
			((Fl_Value_Output *) o)->step(istep);
			((Fl_Value_Output *) o)->range(*p->imin,*p->imax);
		} break;
		case 2:	 {
			o = new Fl_Value_Input_Spin(ix, iy, iwidth, iheight, controlName);
			((Fl_Value_Input *) o)->step(istep);
			((Fl_Value_Input *) o)->range(*p->imin,*p->imax);
		} break; 
		case 3:
		{
			o = new Fl_Value_Output(ix, iy, iwidth, iheight, controlName);
			((Fl_Value_Output *) o)->step(istep);
			((Fl_Value_Output *) o)->range(*p->imin,*p->imax);
		} break;
	}
	o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
	widget_attributes(o);
	o->callback((Fl_Callback*)fl_callbackLinearValueInput,(void *) p);
	AddrSetValue.push_back(ADDR_SET_VALUE(1, *p->imin, *p->imax, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
}

extern "C" void fl_button(FLBUTTON *p)
{
	char *Name = GetString(*p->name,p->STRARG);
	int type = (int) *p->itype;
	if (type >9 ) { // ignored when getting snapshots
		char s[512];
		sprintf(s,"FLbutton \"%s\" ignoring snapshot capture retreive", Name);
		warning(s);
		type = type-10;
	}
	Fl_Button *w;
	
	switch (type) {
		case 1: w= new Fl_Button(*p->ix, *p->iy, *p->iwidth, *p->iheight, Name); break;
		case 2: w= new Fl_Light_Button(*p->ix, *p->iy, *p->iwidth, *p->iheight, Name); break;
		case 3: w= new Fl_Check_Button(*p->ix, *p->iy, *p->iwidth, *p->iheight, Name); break;
		case 4: w= new Fl_Round_Button(*p->ix, *p->iy, *p->iwidth, *p->iheight, Name); break;
		default: initerror("FLbutton: invalid button type");
	}
	Fl_Button *o = w;
	o->align(FL_ALIGN_WRAP);
	widget_attributes(o);
	o->callback((Fl_Callback*)fl_callbackButton,(void *) p);
	AddrSetValue.push_back(ADDR_SET_VALUE(0, 0, 0, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
	O.RTevents = 1;     /* Make sure kperf() looks for RT events */
	O.ksensing = 1;
	O.OrcEvts  = 1;     /* - of the appropriate type */

}

extern "C" void fl_button_bank(FLBUTTONBANK *p)
{
	char *Name = "/0"; //GetString(*p->name,p->STRARG);
	int type = (int) *p->itype;
	if (type >9 ) { // ignored when getting snapshots
		char s[512];
		sprintf(s,"FLbutton \"%s\" ignoring snapshot capture retreive", Name);
		warning(s);
		type = type-10;
	}
	Fl_Group* o = new Fl_Group(*p->ix, *p->iy, *p->inumx * 10, *p->inumy*10);
	int z = 0;
	for (int j =0; j<*p->inumx; j++) {
		for (int k=0; k< *p->inumy; k++) {
			int x = *p->ix + j*10, y = *p->iy + k*10;
			Fl_Button *w;
			char    *btName=  new char[30];
			allocatedStrings.push_back(btName);
			itoa( z, btName, 10); z++;
			switch (type) {
				case 1: w= new Fl_Button(x, y, 10, 10, btName); break;
				case 2: w= new Fl_Light_Button(x, y, 10, 10, btName); break;
				case 3: w= new Fl_Check_Button(x, y, 10, 10, btName); break;
				case 4: w= new Fl_Round_Button(x, y, 10, 10, btName); break;
				default: initerror("FLbuttonBank: invalid button type");
			}
			widget_attributes(w);
			w->type(FL_RADIO_BUTTON);
			w->callback((Fl_Callback*)fl_callbackButtonBank,(void *) p);
		}
	}
	o->resizable(o);
	//*p->ix, *p->iy,
	o->size( *p->iwidth, *p->iheight);
	o->position(*p->ix, *p->iy);
	o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
	o->end();

	//AddrSetValue.push_back(ADDR_SET_VALUE(0, 0, 0, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
	O.RTevents = 1;     /* Make sure kperf() looks for RT events */
	O.ksensing = 1;
	O.OrcEvts  = 1;     /* - of the appropriate type */
}

extern "C" void fl_counter(FLCOUNTER *p)
{
	char *controlName = GetString(*p->name,p->STRARG);
//	int ix,iy,iwidth,iheight,itype;
//	MYFLT	istep1, istep2;

	Fl_Counter* o = new Fl_Counter(*p->ix, *p->iy, *p->iwidth, *p->iheight, controlName);
	widget_attributes(o);
	int type = (int) *p->itype;
	if (type >9 ) { // ignored when getting snapshots
		char s[512];
		sprintf(s,"FLcount \"%s\" ignoring snapshot capture retreive", controlName);
		warning(s);
		type = type-10;
	}
	switch(type) {
		case 1: o->type(FL_NORMAL_COUNTER);  break;
		case 2:	o->type(FL_SIMPLE_COUNTER);  break; 
		default:o->type(FL_NORMAL_COUNTER);  break;
	}

	o->step(*p->istep1);
	o->lstep(*p->istep2);
	o->align(FL_ALIGN_BOTTOM | FL_ALIGN_WRAP);
	if (*p->imin != *p->imax) // range is accepted only if min and max are different
		o->range(*p->imin,*p->imax); //otherwise no-range
	widget_attributes(o);
	o->callback((Fl_Callback*)fl_callbackCounter,(void *) p);
	AddrSetValue.push_back(ADDR_SET_VALUE(1, 0, 100000, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
	O.RTevents = 1;     /* Make sure kperf() looks for RT events */
	O.ksensing = 1;
	O.OrcEvts  = 1;     /* - of the appropriate type */

}



extern "C" void fl_roller(FLROLLER *p)
{
	char *controlName = GetString(*p->name,p->STRARG);
	int ix,iy,iwidth, iheight,itype, iexp ;
	double istep;
	if (*p->iy < 0) {
		iy = FL_iy;
		FL_iy += FLroller_iheight + 15;
	} else {
		iy = *p->iy;
		FL_iy = iy + FLroller_iheight + 15;
	}
	// omitted options: set defaults
	if (*p->ix<0) ix = FL_ix;	else  FL_ix = ix = *p->ix;
	if (*p->iy<0) iy = FL_iy;	else  FL_iy = iy = *p->iy;
	if (*p->iwidth<0) iwidth = FLroller_iwidth; else FLroller_iwidth = iwidth = *p->iwidth;
	if (*p->iheight<0) iheight = FLroller_iheight;	else FLroller_iheight = iheight = *p->iheight;
	if (*p->itype<1) itype = 1; 	else  itype = (int) *p->itype;
	//if (*p->iexp<LIN_) iexp = LIN_;	else  iexp = (int) *p->iexp;
	switch((int) *p->iexp) {
		case -1: iexp = EXP_; break;
		case 0: iexp = LIN_; break; 
		default: iexp = *p->iexp;
	}

	if (*p->istep<0) istep = 1;	else  istep =  *p->istep;
	p->min = *p->imin;
	Fl_Roller *o;
	switch (itype) {
		case 1:
			o = new Fl_Roller(ix, iy, iwidth, iheight, controlName);
			o->type(FL_HORIZONTAL); 
			break;
		case 2:
			o = new Fl_Roller(ix, iy, iwidth, iheight, controlName);
			o->type(FL_VERTICAL); 
			break;
		default:
			initerror("FLroller: invalid roller type");
	}
	widget_attributes(o);
	o->step(istep);
	switch (iexp) {
		case LIN_: //linear
			o->range(*p->imin,*p->imax);
			o->callback((Fl_Callback*)fl_callbackLinearRoller,(void *) p);
			break;
		case EXP_ : //exponential
			{ MYFLT min = p->min, max = *p->imax;
			if (min == 0 || max == 0)
				initerror("FLslider: zero is illegal in exponential operations");
			MYFLT range = max - min;
			o->range(0,range);
			p->base = pow((max / min), 1/range);
			o->callback((Fl_Callback*)fl_callbackExponentialRoller,(void *) p);
			} break;
		default:
		{
			FUNC *ftp;
			MYFLT fnum = abs(iexp);
			if((ftp = ftfind(&fnum)) != NULL) {
				p->table = ftp->ftable;
				p->tablen = ftp->flen;
			}
			else return;
			o->range(0,.99999999);
			if (iexp > 0) //interpolated
				o->callback((Fl_Callback*)fl_callbackInterpTableRoller,(void *) p); 
			else // non-interpolated
				o->callback((Fl_Callback*)fl_callbackTableRoller,(void *) p);
		}
	}
	AddrSetValue.push_back(ADDR_SET_VALUE(iexp, *p->imin, *p->imax, (void *) o, (void *) p));
	*p->ihandle = AddrSetValue.size()-1; 
}


extern "C" long kcounter;

extern "C" void FLprintkset(FLPRINTK *p)
{
    if (*p->ptime < FL(1.0) / ekr)
      p->ctime = FL(1.0) / ekr;
    else	p->ctime = *p->ptime;
	
    p->initime = (MYFLT) kcounter * onedkr;
    p->cysofar = -1;
}

extern "C" void FLprintk(FLPRINTK *p)
{
	MYFLT	timel;
	long	cycles;

	timel =	((MYFLT) kcounter * onedkr) - p->initime;
	cycles = (long)(timel / p->ctime);
	if (p->cysofar < cycles) {
		p->cysofar = cycles;
		char valString[MAXNAME]; 
		((Fl_Output*) (AddrSetValue[(long) *p->idisp]).WidgAddress)->value(gcvt( *p->val, 5, valString )); 
	}
}


extern "C" void FLprintk2(FLPRINTK2 *p)
{
	MYFLT	value = *p->val;	
	if (p->oldvalue != value) {
		char valString[MAXNAME]; 
		((Fl_Output*) (AddrSetValue[(long) *p->idisp]).WidgAddress)->value(gcvt( *p->val, 5, valString )); 
		p->oldvalue = value;
	}
}
