#include <FL/Fl.H>
#include <FL/Fl_Group.H>
#include <stdlib.h>
#include <stdio.h>
#include <FL/Fl_Value_Slider_Input.H>


static char hack_o_rama;

void Fl_Value_Slider_Input::input_cb(Fl_Widget*, void* v) {
  Fl_Value_Slider_Input& t = *(Fl_Value_Slider_Input*)v;
  double nv;
  if (t.step()>=1.0) nv = strtol(t.input.value(), 0, 0);
  else nv = strtod(t.input.value(), 0);
  hack_o_rama = 1;
  t.handle_push();
  t.handle_drag(nv);
  t.handle_release();
  hack_o_rama = 0;
}

void Fl_Value_Slider_Input::draw() {

  int sxx = x(), syy = y(), sww = w(), shh = h();
  int bxx = x(), byy = y(), bww = w(), bhh = h();
  int X = x(), Y = y(), W = w(), H = h();
  
  int border_size=Fl::box_dx(box());

  if (horizontal()) {
    bww = textboxsize();  sxx += textboxsize(); sww -= textboxsize();
    input.resize(X,Y,W-sww,shh);
  } else {
    fl_font(input.textfont(), input.textsize());
    syy += fl_height()+(border_size+1)*2; shh -= fl_height()+(border_size+1)*2;
    input.resize(X,Y,W,H-shh);
  }
  if (damage()&~FL_DAMAGE_CHILD)  input.clear_damage(FL_DAMAGE_ALL);
  input.box(box());
  input.color(FL_WHITE, selection_color());
  input.draw();
  input.resize(X,Y,W,H);
  input.clear_damage();
//  if (horizontal())   input.draw();
  clear_damage();
  draw_box(box(),sxx,syy,sww,shh,color());
  sxx+=border_size;
  syy+=border_size; 
  sww-=border_size*2;  
  shh-=border_size*2;
  if(border_size<2) {
    sxx++;
    syy++;
    sww--;
    shh--;
  }  
  Fl_Slider::draw(sxx,syy,sww,shh);
}

void Fl_Value_Slider_Input::resize(int X, int Y, int W, int H) {
   input.resize(X,Y,W,H);
   Fl_Value_Slider::resize(X,Y,W,H);
}

void Fl_Value_Slider_Input::value_damage() {
  if (hack_o_rama) return;
  char buf[128];
  format(buf);
  input.value(buf);
  input.mark(input.position()); // turn off selection highlight
}

int Fl_Value_Slider_Input::handle(int event) {
  int mx = Fl::event_x();
  int my = Fl::event_y();
  static int ix, drag, indrag=0,sldrag=0;
  int sxx = x(), syy = y(), sww = w(), shh = h();
  int border_size=Fl::box_dx(box());
  if (horizontal()) {
    sxx += textboxsize(); sww -= textboxsize();
  } else {
    fl_font(input.textfont(), input.textsize());
    syy += fl_height()+(border_size+1)*2; shh -= fl_height()+(border_size+1)*2;
  } 
  if( !indrag && ( !sldrag || !((mx>=sxx && mx<=(sxx+sww)) &&
       (my>=syy && my<=(syy+shh))))  ) {  
          indrag=0;     
	  switch(event) {
            case FL_PUSH:
            case FL_DRAG:
	      sldrag=1;
	      break;
           case FL_FOCUS:
	       input.take_focus();
	       break;
           case FL_UNFOCUS:
	       redraw();
	       break;
	    default:
	      sldrag=0;
	  }
          input.type(step()>=1.0 ? FL_INT_INPUT : FL_FLOAT_INPUT);
          return input.handle(event);
  } 
  switch (event) {
  case FL_PUSH:
    ix = mx;
    drag = Fl::event_button();
    indrag=1;
    return Fl_Slider::handle(event,sxx,syy,sww,shh);
  case FL_DRAG:
	indrag=1;
	return Fl_Slider::handle(event,sxx,syy,sww,shh);
  case FL_RELEASE:
 //   if (!step()) goto DEFAULT;
    if (value() != previous_value() || !Fl::event_is_click())
      handle_release();
    else {
      input.handle(FL_PUSH);
      input.handle(FL_RELEASE);
    }
    indrag=0;
    return 1;
  case FL_FOCUS:
    indrag=0;
    input.take_focus();
    return Fl_Slider::handle(event,sxx,syy,sww,shh);
  default:
  DEFAULT:
    indrag=0;
    input.type(step()>=1.0 ? FL_INT_INPUT : FL_FLOAT_INPUT);
    input.handle(event);
    return Fl_Slider::handle(event,sxx,syy,sww,shh);
  }
}

Fl_Value_Slider_Input::Fl_Value_Slider_Input(int x, int y, int w, int h, const char* l)
: Fl_Value_Slider(x,y,w,h,l),input(x, y, w, h, 0) {
  soft_ = 0;
  if (input.parent())  // defeat automatic-add
   ((Fl_Group*)input.parent())->remove(input);
  input.parent(this); // kludge!
  input.callback(input_cb, this);
//  input.when(FL_WHEN_CHANGED | FL_WHEN_ENTER_KEY);
  input.when(FL_WHEN_CHANGED );
  selection_color(input.selection_color());
  input.align(FL_ALIGN_LEFT);
  align(FL_ALIGN_LEFT);
  textboxsize(35);
  value_damage();
}
