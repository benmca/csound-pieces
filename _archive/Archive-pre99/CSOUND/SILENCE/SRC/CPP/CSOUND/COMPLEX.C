/* Code from Press, Teukolsky, Vettering and Flannery
 * Numerical Recipes in C, 2nd Edition, Cambridge 1992.
 */

#include <math.h>

typedef struct FCOMPLEX {double r,i;} fcomplex; /* >> was float<< */

fcomplex Cadd(fcomplex a, fcomplex b)
{
    fcomplex c;
    c.r=a.r+b.r;
    c.i=a.i+b.i;
    return c;
}

fcomplex Csub(fcomplex a, fcomplex b)
{
    fcomplex c;
    c.r=a.r-b.r;
    c.i=a.i-b.i;
    return c;
}


fcomplex Cmul(fcomplex a, fcomplex b)
{
    fcomplex c;
    c.r=a.r*b.r-a.i*b.i;
    c.i=a.i*b.r+a.r*b.i;
    return c;
}

fcomplex Complex(double/*float*/ re, double/*float*/ im)
{
    fcomplex c;
    c.r = re;
    c.i = im;
    return c;
}

fcomplex Conjg(fcomplex z)
{
    fcomplex c;
    c.r = z.r;
    c.i = -z.i;
    return c;
}

fcomplex Cdiv(fcomplex a, fcomplex b)
{
    fcomplex c;
    double/*float*/ r,den;
    if (fabs(b.r) >= fabs(b.i)) {
      r   = b.i/b.r;
      den = b.r+r*b.i;
      c.r = (a.r+r*a.i)/den;
      c.i = (a.i-r*a.r)/den;
    }
    else {
      r   = b.r/b.i;
      den = b.i+r*b.r;
      c.r = (a.r*r+a.i)/den;
      c.i = (a.i*r-a.r)/den;
    }
    return c;
}

double/*float*/ Cabs(fcomplex z)
{
    double/*float*/ x,y,ans;
    double temp;
    x = (double/*float*/)fabs(z.r);
    y = (double/*float*/)fabs(z.i);
    if (x == 0.0)
      ans  = y;
    else if (y == 0.0)
      ans  = x;
    else if (x > y) {
      temp = (double)(y/x);
      ans  = x*(double/*float*/)sqrt(1.0+temp*temp);
    }
    else {
      temp = (double)(x/y);
      ans  = y*(double/*float*/)sqrt(1.0+temp*temp);
    }
    return ans;
}

fcomplex Csqrt(fcomplex z)
{
    fcomplex c;
    double/*float*/ w;
    double x,y,r;
    if ((z.r == 0.0) && (z.i == 0.0)) {
      c.r=0.0;
      c.i=0.0;
      return c;
    }
    else {
      x=fabs(z.r);
      y=fabs(z.i);
      if (x >= y) {
        r   = y/x;
        w   = (double/*float*/)(sqrt(x)*sqrt(0.5*(1.0+sqrt(1.0+r*r))));
      }
      else {
        r   = x/y;
        w   = (double/*float*/)(sqrt(y)*sqrt(0.5*(r+sqrt(1.0+r*r))));
      }
      if (z.r >= 0.0) {
        c.r = w;
        c.i = z.i/(2.0*w);
      } else {
        c.i = (z.i >= 0.0) ? w : -w;
        c.r = z.i/(2.0*c.i);
      }
      return c;
    }
}

fcomplex RCmul(double/*float*/ x, fcomplex a)
{
        fcomplex c;
        c.r=x*a.r;
        c.i=x*a.i;
        return c;
}

