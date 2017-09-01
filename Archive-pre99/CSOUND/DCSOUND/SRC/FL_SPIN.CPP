#include <FL/Fl.H>
#include <FL/Fl_Group.H>
#include <stdio.h>
#include <stdlib.h>
#include <FL/Fl_Spin.H>
#include <FL/fl_draw.H>

void Fl_Spin::draw() {

  int sxx = x(), syy = y(), sww = w(), shh = h(); 
  Fl_Boxtype box1 = (Fl_Boxtype)(box());
  int border_size=Fl::box_dx(box());

  if (damage()&~FL_DAMAGE_CHILD) clear_damage(FL_DAMAGE_ALL);

  if (!box1) box1 = (Fl_Boxtype)(box()&-2);

  if((indrag || mouseobj) && deltadir!=0) {
     if(deltadir>0) {
       draw_box(down(box1),sxx,syy,sww,shh/2,color());
       draw_box(box1,sxx,syy+shh/2,sww,shh/2,color());
     } else {
       draw_box(box1,sxx,syy,sww,shh/2,color());
       draw_box(down(box1),sxx,syy+shh/2,sww,shh/2,color());
     }
  } else {
   draw_box(box1,sxx,syy,sww,shh/2,color());
   draw_box(box1,sxx,syy+shh/2,sww,shh/2,color());
  }
  sxx+=border_size;
  syy+=border_size;
  sww-=border_size*2;  
  shh-=border_size*2;
  if (active_r()) {
        fl_color(selection_color());  
  } else {
        fl_color(selection_color() | 8);
  }    
  int w1 = (sww-1)|1; // use odd sizes only
  int X = sxx+w1/2;
  int W = w1/3;
  int h1 = shh/2-border_size-2;
  int Y= syy;
  fl_polygon(X, Y, X+W,Y+h1 , X-W, Y+h1);
  Y=syy+shh/2+border_size+1+h1; 
  fl_polygon(X, Y, X-W, Y-h1, X+W, Y-h1); 
  clear_damage();  
} 

void Fl_Spin::repeat_callback(void* v) {
  Fl_Spin* b = (Fl_Spin*)v;
  if (b->mouseobj) {
    Fl::add_timeout(.1, repeat_callback, b);
    b->increment_cb();
  }
}

void Fl_Spin::increment_cb() {
  if (!mouseobj) return;
  delta+=deltadir;
  double v;
  switch (drag) {
    case 3: v = increment(value(), deltadir*100); break;
    case 2: v = increment(value(), deltadir*10); break;
    default:v = increment(value(), deltadir); break;
  }
  v = round(v);
  handle_drag(soft()?softclamp(v):clamp(v));
}

int Fl_Spin::handle(int event) {
  double v;
  int olddelta;
  int mx = Fl::event_x();
  int my = Fl::event_y();
  int sxx = x(), syy = y(), sww = w(), shh = h();
 
  switch (event) {
  case FL_PUSH:
//    if (!step()) goto DEFAULT;
    iy = my;
    ix = mx;
    drag = Fl::event_button();
    handle_push();
    indrag=1;
    mouseobj=1;
    Fl::add_timeout(.5, repeat_callback, this);  
    delta=0;
    if(Fl::event_inside(sxx,syy,sww,shh/2)) {
     deltadir=1;
    } else if (Fl::event_inside(sxx,syy+shh/2,sww,shh/2)) {
     deltadir=-1;
    } else {
     deltadir=0;
    }
    increment_cb();
    redraw();
    return 1;
  case FL_DRAG:
    if(mouseobj) {
      mouseobj=0;
      Fl::remove_timeout(repeat_callback, this);      
    }
//    if (!step()) goto DEFAULT;
    olddelta=delta;
    delta = - (Fl::event_y()-iy);
    if ((delta>5) || (delta<-5)  ) {  deltadir=((olddelta-delta)>0)?-1:(((olddelta-delta)<0)?1:0); } 
    else  { deltadir=0; delta = olddelta;}
    switch (drag) {
    case 3: v = increment(value(), deltadir*100); break;
    case 2: v = increment(value(), deltadir*10); break;
    default:v = increment(value(), deltadir); break;
    }
    v = round(v);
    handle_drag(soft()?softclamp(v):clamp(v));
    indrag=1;
    return 1;
  case FL_RELEASE:
    if(mouseobj) {
      Fl::remove_timeout(repeat_callback, this);      
    }
//    if (!step()) goto DEFAULT;
    indrag=0;
    delta=0;
    deltadir=0;
    mouseobj=0;
    handle_release();
    redraw();
    return 1;
  default:
  DEFAULT:
    indrag=0;
    return Fl_Valuator::handle(event);
  }
}

Fl_Spin::~Fl_Spin() {
  Fl::remove_timeout(repeat_callback, this);
}

Fl_Spin::Fl_Spin(int x, int y, int w, int h, const char* l)
: Fl_Valuator(x,y,w,h,l) {

  soft_ = 0;
  align(FL_ALIGN_LEFT);
  ix=x;
  iy=y; 
  drag=0;
  indrag=0;
  mouseobj = 0;
  deltadir=0;
  delta=0;
}
