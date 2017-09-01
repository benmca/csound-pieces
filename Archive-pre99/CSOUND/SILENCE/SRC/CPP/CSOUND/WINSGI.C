/*                                                              winSGI.c
 * CSound interface to the Silicon Graphics GL (Graphics Library)
 *
 * Assumes that the given machine has a 24-bit display and the
 * ability to double-buffer. All the SGI machines, save the 3000 series,
 * also run X11; so if this interface is unsatisfactory, the user can
 * always use Csound's X11 interface.
 *
 * Douglas M. Cook
 * Silicon Graphics, Inc.
 * April, 1991
 *
 * Possible improvements:
 *	3D graphs would make better use of the SGI's hardware capability.
 *	The default colors, fonts, and window size currently used are not
 *		user-selectable.
 */

#include <gl/gl.h>
#include <fmclient.h>
#include <stdio.h>
#include <gl/device.h>
#include "cwindow.h"

#define DEFAULT_WIDTH 512
#define DEFAULT_HEIGHT 200

static fmfonthandle fnt;
static int winGLinitialized = 0;

int
Graphable(void)
{
	/*
	 * This makes the (valid) assumption that if we compiled on an SGI
	 * machine, we have GL graphics.
	 */
	return 1;
}

void
MakeGraph(WINDAT *wdptr, char *name)
{
	foreground();
	prefsize(512,200);
	wdptr->windid = winopen(name);
	winset(wdptr->windid);
	RGBmode();
	doublebuffer();
	gconfig();
	qdevice(REDRAW);
	ortho2(-0.1,1.0,-1.2,1.2);		/* set up our coord system */
	RGBcolor(0,0,0);
	clear();
	swapbuffers();

	if (!winGLinitialized) {
		winGLinitialized++;
		fminit();
		fnt = fmfindfont("Helvetica");
		if (!fnt) {
			err_printf( Str(X_1378,"winGL:MakeGraph: fmfindfont failed.\n"));
			exit(-1);
		}
		fnt = fmscalefont(fnt, 12.0);
		fmsetfont(fnt);
	}
}

static void
drawAxes(void)
{
	float v[2];
	int i;

	/*
	 * Make axes
	 */
	bgnline();
	v[0] = -0.2;
	v[1] = 0;
	v2f(v);
	v[0] = 1.0;
	v2f(v);
	endline();
	bgnline();
	v[0] = 0;
	v[1] = 1.0;
	v2f(v);
	v[1] = -1.0;
	v2f(v);
	endline();

	/*
	 * Make tick marks
	 */
	v[0] = 0;
	for (i = 0; i <= 10; i++) {
		bgnline();
		v[1] = -0.05;
		v2f(v);
		v[1] = 0.05;
		v2f(v);
		v[0] += 0.1;
		endline();
	}
	v[1] = -1.0;
	for (i = 0; i <= 20; i++) {
		bgnline();
		v[0] = -0.015;
		v2f(v);
		v[0] = 0.015;
		v2f(v);
		endline();
		v[1] += 0.1;
	}
}

void
DrawGraph(WINDAT *wdptr)
{
	int iskip = (wdptr->npts < DEFAULT_WIDTH) ? 1 :
		(wdptr->npts / DEFAULT_WIDTH);
	float distPer;
	float v[2];
	short dummy;
	char string[100];
	int i;

	distPer = iskip * 1.0/((float) wdptr->npts);
	winset(wdptr->windid);

	while (qtest()) {
		qread(&dummy);		/* clear the window's event queue */
	}

	RGBcolor(0,0,0);
	clear();
	RGBcolor(130,130,130);
	drawAxes();

	RGBcolor(180,180,180);

	if (wdptr->caption) {
		cmov2(0.05, -1.15);
		sprintf(string,Str(X_50,"%s %d pts, max %f"),
			wdptr->caption, wdptr->npts,wdptr->oabsmax);
		fmprStr(string);
	}

	RGBcolor(0,140,140);

	v[0] = 0.0;

	bgnline();
	for(i = 0; i < wdptr->npts; i+=iskip) {
		v[1] = wdptr->fdata[i] / wdptr->oabsmax;
		v2f(v);
		v[0] += distPer;
	}
	endline();
	swapbuffers();
}

void
KillGraph(WINDAT *wdptr)
{
	if (wdptr->windid) {
		winclose(wdptr->windid);
	}
	wdptr->windid = 0;
}

int
ExitGraph(WINDAT *wdptr)
{
	return 0;			/* immediate exit */
}

void
MakeXYin(XYINDAT *xyptr, float x, float y)
{
	long v[2];
	long xSize, ySize;

	foreground();
	xyptr->windid = winopen("Csound:XYin");
	winset(xyptr->windid);
	RGBmode();
	doublebuffer();
	gconfig();
	qdevice(MOUSEX);
	qdevice(MOUSEY);
	RGBcolor(0,0,0);
	clear();
	swapbuffers();

	if (!winGLinitialized) {
		winGLinitialized++;
		fminit();
		fnt = fmfindfont("Helvetica");
		if (!fnt) {
			err_printf( Str(X_1378,"winGL:MakeGraph: fmfindfont failed.\n"));
			exit(-1);
		}
		fnt = fmscalefont(fnt, 12.0);
		fmsetfont(fnt);
	}

	getsize(&xSize, &ySize);
	ortho2(0,xSize, 0,ySize);
	xyptr->m_x = xSize * x;
	xyptr->m_y = ySize * y;

	RGBcolor(0,0,0);		/* draw axes */
	clear();
	RGBcolor(255,100,100);
	bgnline();
	v[0] = 0;
	v[1] = ySize / 2;
	v2i(v);
	v[0] = xSize;
	v2i(v);
	endline();
	bgnline();
	v[1] = 0;
	v[0] = xSize / 2;
	v2i(v);
	v[1] = ySize;
	v2i(v);
	endline();

	RGBcolor(100,255,255);		/* now draw cursor crosshairs */
	bgnline();
	v[0] = xyptr->m_x;
	v[1] = 0;
	v2i(v);
	v[1] = ySize;
	v2i(v);
	endline();
	bgnline();
	v[1] = xyptr->m_y;
	v[0] = 0;
	v2i(v);
	v[0] = xSize;
	v2i(v);
	endline();
	swapbuffers();
}

void
ReadXYin(XYINDAT *xyptr)
{
	int ev;
	short	x = xyptr->m_x,
		y = xyptr->m_y,dummy;
	long xSize, ySize;
	long xOrg, yOrg;
	long v[2];

	winset(xyptr->windid);
	getorigin(&xOrg, &yOrg);
	while (qtest()) {
		ev = qread(&dummy);	/* clear the window's event queue */
		if (ev == MOUSEX) {
			x = dummy-xOrg;
		}
		else if (ev == MOUSEY) {
			y = dummy-yOrg;
		}
	}
	getsize(&xSize, &ySize);

	RGBcolor(0,0,0);		/* draw axes */
	clear();
	RGBcolor(255,100,100);

	bgnline();
	v[0] = 0; 
	v[1] = ySize / 2;
	v2i(v);
	v[0] = xSize; 
	v2i(v);
	endline();

	bgnline();
	v[1] = 0;
	v[0] = xSize / 2;
	v2i(v);
	v[1] = ySize;
	v2i(v);
	endline();

	RGBcolor(0,255,100);		/* now draw cursor crosshairs */
	bgnline();
	v[0] = x;
	v[1] = 0;
	v2i(v);
	v[1] = ySize;
	v2i(v);
	endline();
	bgnline();
	v[1] = y;
	v[0] = 0;
	v2i(v);
	v[0] = xSize;
	v2i(v);
	endline();

	swapbuffers();

	xyptr->m_x = x;
	xyptr->m_y = y;
	xyptr->x = x / ((float) xSize);
	xyptr->y = y / ((float) ySize);
}


