#ifndef __Fl_Value_Slider_Input__
#define __Fl_Value_Slider_Input__

#include <FL/Fl.H>
#include <FL/Fl_Input.H>
#include <FL/fl_draw.H>
#include <FL/Fl_Value_Slider.H>
#include <math.h>

class Fl_Value_Slider_Input : public Fl_Value_Slider {
private:

  char soft_;
  int txtboxsize;

  static FL_EXPORT void input_cb(Fl_Widget*,void*);
  virtual FL_EXPORT void value_damage(); // cause damage() due to value() changing

public:
    Fl_Input input;
    FL_EXPORT void draw();
    FL_EXPORT int handle(int);
    FL_EXPORT void resize(int,int,int,int);
    FL_EXPORT Fl_Value_Slider_Input(int x,int y,int w,int h, const char *l = 0);

  void soft(char x) {soft_ = x;}
  char soft() const {return soft_;}

  Fl_Font textfont() const {return input.textfont();}
  void textfont(uchar s) { input.textfont(s);}
  uchar textsize() const {return input.textsize();}
  void textsize(uchar s) {input.textsize(s);}
  Fl_Color textcolor() const {return input.textcolor();}
  void textcolor(uchar n) {input.textcolor(n);}
  Fl_Color cursor_color() const {return input.cursor_color();}
  void cursor_color(uchar n) {input.cursor_color(n);}
  void textboxsize(int s) { txtboxsize=s;}
  int textboxsize() const {return txtboxsize;}
};

#endif
