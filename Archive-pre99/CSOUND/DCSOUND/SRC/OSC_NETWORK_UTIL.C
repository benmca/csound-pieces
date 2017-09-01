/* ==============================================================
 * File:	OSC-network-util.c
 * Author:	Stefan Kersten <steve@k-hornz.de>
 * Contents:	OSC/UDP support routines
 * ==============================================================
 * $Id$
 * ==============================================================
 */

#include "OSC-network-util.h"

#if defined(WIN32)
#  include <winsock.h>
#else /* !WIN32 */
#  include <fcntl.h>
#  include <netdb.h>
#  include <netinet/in.h>
#  include <sys/time.h>
#  include <sys/types.h>
#  include <sys/socket.h>
#  include <unistd.h>
#endif /* WIN32 */

struct OSC_UDPSocketStruct
{
#if defined(WIN32)
  SOCKET sockFD;
#else /* !WIN32 */
  int sockFD;
#endif /* WIN32 */

  OSCBoolean nonBlk;
  int timeOut;
};

struct OSC_UDPAddressStruct
{
  struct sockaddr_in addr;
  int addrLen;
};


int OSC_UDPStartup(void)
{
  int	error = 0;

#if defined(WIN32)
  WORD	wVersionRequested;
  WSADATA	wsaData;

  wVersionRequested = MAKEWORD(2, 2);

  error = WSAStartup(wVersionRequested, &wsaData);

  if (error != 0)
    {
      return error;
    }

  if (LOBYTE(wsaData.wVersion) != 2 ||
      HIBYTE(wsaData.wVersion) != 2)
    {
      return WSACleanup();
    }
#endif /* WIN32 */

  return error;
}

int OSC_UDPShutdown(void)
{
  int error = 0;

#if defined(WIN32)
  error = WSACleanup();
#endif /* WIN32 */

  return error;
}

int osc_UDPSocketFcntlNonBlocking(OSC_UDPSocket self)
{
#if defined(WIN32)
  unsigned long nonBlk = 1;
  return ioctlsocket(self->sockFD, FIONBIO, &nonBlk);
#else /* !WIN32 */
  return fcntl(self->sockFD, F_SETFL, FNDELAY);
#endif
}

OSC_UDPSocket OSC_UDPCreateServerSocket(unsigned short thePort)
{
  OSC_UDPSocket self = NULL;
  struct sockaddr_in myAddr;

  if ((self = (OSC_UDPSocket)malloc(sizeof(struct OSC_UDPSocketStruct))) == NULL)
    return NULL;

  if ((self->sockFD = socket(AF_INET, SOCK_DGRAM, 0)) == SOCKET_ERROR)
    {
      free(self);
      return NULL;
    }

  memset(&myAddr, 0x0, sizeof(struct sockaddr_in));
  myAddr.sin_family = AF_INET;
  myAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  myAddr.sin_port = htons(thePort);

  if (bind(self->sockFD, (struct sockaddr *)&myAddr, sizeof(myAddr)) == SOCKET_ERROR)
    {
      osc_UDPCloseSocket(self);
      free(self);
      return NULL;
    }

  osc_UDPSocketFcntlNonBlocking(self);

  self->nonBlk = FALSE;
  self->timeOut = 0;

  return self;
}

OSC_UDPSocket OSC_UDPCreateClientSocket(OSCBoolean bindMe)
{
  OSC_UDPSocket self;
  struct sockaddr_in myAddr;

  if ((self = (OSC_UDPSocket)malloc(sizeof(struct OSC_UDPSocketStruct))) == NULL)
    return NULL;

  if ((self->sockFD = socket(AF_INET, SOCK_DGRAM, 0)) == SOCKET_ERROR)
    {
      free(self);
      return NULL;
    }

  memset(&myAddr, 0x0, sizeof(struct sockaddr_in));
  myAddr.sin_family = AF_INET;
  myAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  myAddr.sin_port = htons(0);

  if (bindMe)
    {
      if (bind(self->sockFD, (struct sockaddr *)&myAddr, sizeof(myAddr)) == SOCKET_ERROR)
	{
	  osc_UDPCloseSocket(self);
	  free(self);
	  return NULL;
	}
    }

  osc_UDPSocketFcntlNonBlocking(self);

  self->nonBlk = FALSE;
  self->timeOut = 0;

  return self;
}

void OSC_UDPSocketSetNonBlocking(OSC_UDPSocket self, OSCBoolean value)
{
  self->nonBlk = value;
}

OSCBoolean OSC_UDPSocketGetNonBlocking(OSC_UDPSocket self)
{
  return self->nonBlk;
}

void OSC_UDPSetTimeOut(OSC_UDPSocket self, int seconds)
{
  self->timeOut = seconds;
}

int OSC_UDPGetTimeOut(OSC_UDPSocket self)
{
  return self->timeOut;
}

int osc_UDPCloseSocket(OSC_UDPSocket self)
{
  if (self->sockFD != INVALID_SOCKET)
    {
#if defined(WIN32)
      return closesocket(self->sockFD);
#else /* !WIN32 */
      return close(self->sockFD);
#endif /* WIN32 */
    }
  return 0;
}

int OSC_UDPFreeSocket(OSC_UDPSocket self)
{
  int res = osc_UDPCloseSocket(self);
  free(self);
  return res;
}

OSC_UDPAddress OSC_UDPCreateAddress(const char *hostName, unsigned short portNumber)
{
  OSC_UDPAddress self;
  struct hostent *hostInfo;

  self = (OSC_UDPAddress)malloc(sizeof(struct OSC_UDPAddressStruct));

  if (self == NULL)
    return NULL;

  hostInfo = gethostbyname(hostName);

  if (hostInfo == NULL)
    {
      free(self);
      return NULL;
    }

  memset(&self->addr, 0x0, sizeof(struct sockaddr_in));
  (self->addr).sin_family = AF_INET;
  (self->addr).sin_addr = *(struct in_addr *) hostInfo->h_addr;
  (self->addr).sin_port = htons(portNumber);

  self->addrLen = sizeof(struct sockaddr_in);

  return self;
}

int OSC_UDPFreeAddress(OSC_UDPAddress self)
{
  free(self);
  return 0;
}

int OSC_UDPReceiveBuf(OSC_UDPSocket self, OSC_UDPAddress returnAddress)
{
  OSCPacketBuffer pBuf;
  fd_set readFD;
  struct timeval timeout;
  struct timeval *timeoutP;
  struct sockaddr_in *ra = NULL;
  int *raLen = NULL;
  int n;
  int bufLen = OSCGetReceiveBufferSize();
  char *buf;

  if (self->nonBlk)
    {
      timeout.tv_sec = 0;
      timeout.tv_usec = 0;
      timeoutP = &timeout;
    }
  else
    {
      if (self->timeOut > 0)
	{
	  timeout.tv_sec = self->timeOut;
	  timeout.tv_usec = 0;
	  timeoutP = &timeout;
	}
      else
	{
	  timeoutP = NULL;
	}
    }

  FD_ZERO(&readFD);
  FD_SET(self->sockFD, &readFD);

  if (select(self->sockFD+1, &readFD, (fd_set *)0, (fd_set * )0, &timeout) < 0)
    return SOCKET_ERROR;

  if(!FD_ISSET(self->sockFD, &readFD))
    return SOCKET_ERROR;

  pBuf = OSCAllocPacketBuffer();

  if (!pBuf)
    {
      OSCWarning("Out of memory for packet buffers - had to drop a packet!");
      return SOCKET_ERROR;
    }

  buf = OSCPacketBufferGetBuffer(pBuf);

  if (returnAddress != NULL)
    {
      ra = &(returnAddress->addr);
      raLen = &(returnAddress->addrLen);
    }

  n = recvfrom(self->sockFD, buf, bufLen, 0, (struct sockaddr *)ra, (int *)raLen);

  if (n > 0)
    {
      int *sizep = OSCPacketBufferGetSize(pBuf);
      *sizep = n;
      OSCAcceptPacket(pBuf);
      return 1;
    }
  else
    {
      OSCFreePacket(pBuf);
      return 0;
    }
}

int OSC_UDPSendBuf(OSC_UDPSocket self, OSC_UDPAddress servAddr, OSCbuf *buf)
{
  fd_set writeFD;
  struct timeval timeout;
  struct timeval *timeoutP;

  FD_ZERO(&writeFD);
  FD_SET(self->sockFD, &writeFD);

  if (self->nonBlk)
    {
      timeout.tv_sec = 0;
      timeout.tv_usec = 0;
      timeoutP = &timeout;
    }
  else
    {
      if (self->timeOut > 0)
	{
	  timeout.tv_sec = self->timeOut;
	  timeout.tv_usec = 0;
	  timeoutP = &timeout;
	}
      else
	{
	  timeoutP = NULL;
	}
    }

  if (select(self->sockFD+1, NULL, &writeFD, NULL, timeoutP) < 0)
    return SOCKET_ERROR;

  return sendto(self->sockFD, OSC_getPacket(buf), OSC_packetSize(buf), 0,
		(struct sockaddr *)&(servAddr->addr), servAddr->addrLen);
}

/* EOF */
