#ifndef __Fl_Ball__
#define __Fl_Ball__

#include <FL/Fl.H>
#include <FL/fl_draw.H>
#include <FL/Fl_Valuator.H>
#include <math.h>

class Fl_Ball : public Fl_Valuator {
private:
  int ix, iy, drag;
  int spinning;
  
  int ballstacks,ballslices;
  float ballsize;

  float curquat[4];
  float lastquat[4];
  float mat[4][4];
  
  char soft_;
  uchar mouseobj;

  static FL_EXPORT void repeat_callback(void *);
  FL_EXPORT void increment_cb(); 
  FL_EXPORT void vertex_by_matrix(float &x,float &y,float &z);
  
  FL_EXPORT void transform_ball_vertex(float &x,float &y,float &z);
  FL_EXPORT void rotate(float &x,float &y,float &z, 
                        float rotx=0.0,float roty=0.0,float  rotz=0.0);
  FL_EXPORT void draw_solid_ball(float radius,int slices,int stacks);
  FL_EXPORT void draw_wire_ball(float radius,int slices,int stacks);
public:
    FL_EXPORT void draw();
    FL_EXPORT void handle_drag(double v=0.0);
    FL_EXPORT void handle_release();
    FL_EXPORT int handle(int);
    FL_EXPORT Fl_Ball(int x,int y,int w,int h, const char *l = 0);

  void soft(char x) {soft_ = x;}
  char soft() const {return soft_;}

  float ballscale() const {return ballsize;}
  void ballscale(float s) { ballsize=s;}

  void rotateball(float rotx=0.0,float roty=0.0,float rotz=0.0);
  void getrot(float &rotx,float &roty,float &rotz);
  
  void stacks(int s) { ballstacks=s; }
  int stacks() const { return ballstacks; }

  void slices(int s) { ballslices=s; }
  int slices() const { return ballslices; }

  ~Fl_Ball();
};

#endif
