#ifndef __Fl_Spin__
#define __Fl_Spin__

#include <FL/Fl.H>
#include <FL/fl_draw.H>
#include <FL/Fl_Valuator.H>
#include <math.h>

class Fl_Spin : public Fl_Valuator {
private:
  int ix, iy, drag, indrag;
  int delta,deltadir;
  char soft_;
  uchar mouseobj;
  static FL_EXPORT void repeat_callback(void *);
  FL_EXPORT void increment_cb(); 
  
public:
    FL_EXPORT void draw();
    FL_EXPORT int handle(int);
    FL_EXPORT Fl_Spin(int x,int y,int w,int h, const char *l = 0);

  void soft(char x) {soft_ = x;}
  char soft() const {return soft_;}

  ~Fl_Spin();
};

#endif
