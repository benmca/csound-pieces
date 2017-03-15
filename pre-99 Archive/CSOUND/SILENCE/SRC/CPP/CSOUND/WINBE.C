/*        Copyright © 1998–2000  Jens Kilian
 *
 *        This program is free software; you can redistribute it and/or modify
 *        it under the terms of the GNU General Public License as published by
 *        the Free Software Foundation; either version 1, or (at your option)
 *        any later version.
 *
 *        This program is distributed in the hope that it will be useful,
 *        but WITHOUT ANY WARRANTY; without even the implied warranty of
 *        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.    See the
 *        GNU General Public License for more details.
 *
 *        You should have received a copy of the GNU General Public License
 *        along with this program; if not, write to the Free Software
 *        Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *        Be windowing interface.  Communicates with server.
 */

#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <OS.h>

#include "cs.h"
#include "CsSvInterface.h"

/*  Constant data. */
static const int32 kPortCapacity = 1;
static const char kRequestPortName[] = "Csound client request port";
static const char kReplyPortName[] = "Csound client reply port";

#define XINIT 10
#define YINIT 50
#define WIDTH 400
#define HEIGHT 120
#define DEPTH 5

/*  Global variables. */
static port_id gRequestPort = B_ERROR;
static port_id gReplyPort = B_ERROR;
static uint32 gWindowCount = 0;

/*  Find window size and position - taken from X11 driver. */
void
windowGeometry(float *pX, float *pY, float *pW, float *pH)
{
    *pX = XINIT + (gWindowCount / DEPTH) * 1.1 * WIDTH;
    *pY = YINIT + (gWindowCount % DEPTH) * 1.2 * HEIGHT;
    *pW = WIDTH;
    *pH = HEIGHT;
    ++gWindowCount;
}

/*  Initialize - try to open connection to server. */
int
Graphable(void)
{
    if (gRequestPort < B_NO_ERROR) {
      const port_id serverPort = find_port(kServerPortName);
      if (serverPort >= B_NO_ERROR) {
        /*  Open the client ports. */
        status_t status = B_ERROR;
        gRequestPort = create_port(kPortCapacity, kRequestPortName);
        gReplyPort = create_port(kPortCapacity, kReplyPortName);
        if (gRequestPort >= B_NO_ERROR && gReplyPort >= B_NO_ERROR) {
          struct ServerClientPort request;
	
          /*  Send the request to the server. */
          request.mRequestPort = gRequestPort;
          request.mReplyPort = gReplyPort;
          status = write_port(serverPort, kServerNewClientPort, &request, sizeof(request));
        }
        if (status < B_NO_ERROR) {
          if (gRequestPort >= B_NO_ERROR) {
            delete_port(gRequestPort);
            gRequestPort = (port_id)status;
          }
          if (gReplyPort >= B_NO_ERROR) {
            delete_port(gReplyPort);
            gReplyPort = (port_id)status;
          }
        }
      }
    }
    return gRequestPort >= B_NO_ERROR;
} 

/*  Uninitialize. */
int
ExitGraph(void)
{
    if (gRequestPort >= B_NO_ERROR) {
      delete_port(gRequestPort);                      /*  server will notice that port is gone */
      gRequestPort = (port_id)B_ERROR;
    }
    if (gReplyPort >= B_NO_ERROR) {
      delete_port(gReplyPort);
      gReplyPort = (port_id)B_ERROR;
    }
    return 0;
}

/*  Open a new graphics window. */
void
MakeGraph(WINDAT *pWindow, char *pName) 
{
    struct ServerGraphWindow request;
    status_t status;
      
    /*  Send the request to the server. */
    request.mSerialNo = gWindowCount;
    windowGeometry(&request.mX, &request.mY, &request.mW, &request.mH);
    status = write_port(gRequestPort, kServerNewGraphWindow,
                        &request, sizeof(request));
    if (status >= B_NO_ERROR) {
      /*  Send the window name. */
      status = write_port(gRequestPort, 0, pName, strlen(pName));
    }
    if (status >= B_NO_ERROR) {
      pWindow->windid = request.mSerialNo;
    } else {
      pWindow->windid = B_ERROR;
    }
} 

/*  Draw a graph. */
void
DrawGraph(WINDAT *pWindow)
{
    struct ServerGraphData request;
    status_t status;
    uint32 i, j;

    const float tickLength = 0.02f;
    const uint32 nTicks = 10;
    const float tickDistX = 1.0f / (nTicks + 0.5f);
    float tickDistY;
    float axisY;
    size_t axesSize;
    float *pAxesPoints;

    const uint32 nPoints =
      pWindow->npts > kMaxGraphPoints
      ? kMaxGraphPoints
      : pWindow->npts;
    const float samplesPerPoint = pWindow->npts / nPoints;
    const float xDist = nTicks * tickDistX / nPoints;
    float yMax;
    float yScale;
    size_t graphSize;
    float *pGraphPoints;
    
    /*  Compute coordinate axes. */
    if (pWindow->polarity == BIPOL) {
      tickDistY = 1.0f / (2*nTicks + 1.0f);
      request.mAxesLineCount = 1 + 1 + nTicks + 2*nTicks;
    } else {
      tickDistY = 1.0f / (nTicks + 1.0f);
      request.mAxesLineCount = 1 + 1 + nTicks + nTicks;
    }
    axesSize = 2 * request.mAxesLineCount * 2 * sizeof(float);
    pAxesPoints = (float*) malloc(axesSize);
    j = 0;
      
    /*  X axis. */
    switch (pWindow->polarity) {
      
    case NEGPOL:
      axisY = 0.0f + tickDistY/2;
      break;

    case POSPOL:
      axisY = 1.0f - tickDistY/2;
      break;
              
    case BIPOL:
      axisY = 0.5f;
      break;
    }
    pAxesPoints[j++] = 0.0f;
    pAxesPoints[j++] = axisY;
    pAxesPoints[j++] = 1.0f;
    pAxesPoints[j++] = axisY;
    for (i = 1; i <= nTicks; ++i) {
      pAxesPoints[j++] = i * tickDistX;
      pAxesPoints[j++] = axisY - 0.5f*tickLength;
      pAxesPoints[j++] = i * tickDistX;
      pAxesPoints[j++] = axisY + 0.5f*tickLength;
    }
    
    /*  Y axis. */
    pAxesPoints[j++] = 0.0f;
    pAxesPoints[j++] = 1.0f;
    pAxesPoints[j++] = 0.0f;
    pAxesPoints[j++] = 0.0f;
    for (i = 1; i <= nTicks; ++i) {
      if (pWindow->polarity != NEGPOL) {
        pAxesPoints[j++] = 0.0f;
        pAxesPoints[j++] = axisY - i * tickDistY;
        pAxesPoints[j++] = 0.5f * tickLength;
        pAxesPoints[j++] = axisY - i * tickDistY;
      }
      if (pWindow->polarity != POSPOL) {
        pAxesPoints[j++] = 0.0f;
        pAxesPoints[j++] = axisY + i * tickDistY;
        pAxesPoints[j++] = 0.5f * tickLength;
        pAxesPoints[j++] = axisY + i * tickDistY;
      }
    }
    
    /*  Compute graph. */
    request.mGraphLineCount = nPoints - 1;
    graphSize = (request.mGraphLineCount + 1) * 2 * sizeof(float);
    pGraphPoints = malloc(graphSize);
    yMax = pWindow->oabsmax;
    if (fabs(yMax) < 1.0e-6) {
      /*  Avoid division by 0. */
      yMax = 1.0f;
    }
    yScale =
      pWindow->polarity == BIPOL
      ? (0.5f*tickDistY - 0.5f) / yMax
      : (0.5f*tickDistY - 1.0f) / yMax;
    for (i = 0, j = 0; i <= request.mGraphLineCount; ++i) {
      const float value = pWindow->fdata[(uint32)(i*samplesPerPoint)];
      pGraphPoints[j++] = i * xDist;
      pGraphPoints[j++] = axisY + yScale * value;
    }
    
    /*  I have no idea what this represents, but let's draw it anyway. */
    request.mMidAxis = pWindow->danflag ? 0.5f * nTicks * tickDistX : 0.0f;
    
    /*  Send the request to the server. */
    request.mSerialNo = pWindow->windid;
    status = write_port(gRequestPort, kServerDrawGraph,
                        &request, sizeof(request));
    if (status >= B_NO_ERROR) {
      status = write_port(gRequestPort, 0, pAxesPoints, axesSize);
    }
    if (status >= B_NO_ERROR) {
      status = write_port(gRequestPort, 0, pGraphPoints, graphSize);
    }
    if (status >= B_NO_ERROR) {
      status = write_port(gRequestPort, 0, pWindow->caption,
                          strlen(pWindow->caption));
    }
    
    /*  Clean up. */
    free(pAxesPoints);
    free(pGraphPoints);
}

/*  Close a graphics window. */
void
KillGraph(WINDAT *pWindow)
{
    if (pWindow->windid >= B_NO_ERROR) {
      struct ServerKillWindow request;
      request.mSerialNo = pWindow->windid;
      write_port(gRequestPort, kServerKillWindow,
                 &request, sizeof(request));
      pWindow->windid = B_ERROR;
    }
}

/*  Open a new input window. */
void
MakeXYin(XYINDAT *pWindow, float x, float y)
{
    struct ServerInputWindow request;
    status_t status;
      
    /*  Send the request to the server. */
    request.mSerialNo = gWindowCount;
    request.mValueX = pWindow->m_x = pWindow->x = x;
    request.mValueY = pWindow->m_y = pWindow->y = y;
    pWindow->down = 0;
    windowGeometry(&request.mX, &request.mY, &request.mW, &request.mH);
    status = write_port(gRequestPort, kServerNewInputWindow,
                        &request, sizeof(request));
    if (status >= B_NO_ERROR) {
      pWindow->windid = request.mSerialNo;
    } else {
      pWindow->windid = B_ERROR;
    }
}

/*  Get input. */
void
ReadXYin(XYINDAT *pWindow)
{
    struct ServerInputRequest request;
    struct ServerInputReply reply = { 0.0, 0.0, 0 };
    status_t status;
    int32 dummy;
      
    /*  Send the request to the server. */
    request.mSerialNo = pWindow->windid;
    status = write_port(gRequestPort, kServerReadInput,
                        &request, sizeof(request));
    if (status >= B_NO_ERROR) {
      /*  Get reply. */
      read_port(gReplyPort, &dummy, &reply, sizeof(reply));
    }
    
    pWindow->m_x = pWindow->x = reply.mValueX;
    pWindow->m_y = pWindow->y = reply.mValueY;
    pWindow->down = reply.mDown;
}

/*  Close an input window. */
void
KillXYin(XYINDAT *pWindow)
{
    if (pWindow->windid >= B_NO_ERROR) {
      struct ServerKillWindow request;
      request.mSerialNo = pWindow->windid;
      write_port(gRequestPort, kServerKillWindow,
                 &request, sizeof(request));
      pWindow->windid = B_ERROR;
    }
}
