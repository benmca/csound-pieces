/* ==============================================================
 * File:	OSC-network-util.c
 * Author:	Stefan Kersten <steve@k-hornz.de>
 * Contents:	Csound/OSC support
 * ==============================================================
 * $Id$
 * ==============================================================
 */

#if !defined(_OSC_NETWORK_UTIL_H)
#define _OSC_NETWORK_UTIL_H

#include <OSC/OSC-client.h>
#include <OSC/OSC.h>


#if defined(__cplusplus)
extern "C" {
#endif /* __cplusplus */


#if !defined(INVALID_SOCKET)
#  define INVALID_SOCKET -1
#endif

#if !defined(SOCKET_ERROR)
#  define SOCKET_ERROR -1
#endif

  /* UDP socket type */
  typedef struct OSC_UDPSocketStruct *
  	OSC_UDPSocket;
  /* UDP address type */
  typedef struct OSC_UDPAddressStruct *
	OSC_UDPAddress;

  /*
   * UDP networking routines
   *
   * 	Error codes generally are available via the errno variable (on Unix)
   *	or WSAGetLastError() (on Windows), respectively.
   */

  /*	The next two routine basically initialize the WinSock library
	on Windows. They should be called on any platform, though.
  */

  /*	Initialize UDP functionality.

	This routine has to be called before any use of the other
	routines in this module.
  */
  int OSC_UDPStartup(void);

  /*	Deinitialize UDP functionality.

	This routine has to be called when no routine in this module
	will be called anymore.
  */
  int OSC_UDPShutdown(void);

  /*	Create a server socket.

	@param self		The socket object; memory will be allocated.
	@param portNumber	The port number the socket will be listening to.

	@return 		SOCKET_ERROR on failure, 0 otherwise.
  */
  OSC_UDPSocket OSC_UDPCreateServerSocket(unsigned short portNumber);

  /*	Create a client socket.

	@param self		The socket object; memory will be allocated.
	@param bindMe		Boolean value determining wether to bind the client socket
				(and thus being able to receive return messages
				from a server), or not.

	@return			SOCKET_ERROR on failure, 0 otherwise.
  */
  OSC_UDPSocket OSC_UDPCreateClientSocket(OSCBoolean bindMe);

  /*	Free the socket's resources.

	This routine closes the socket and frees any allocated memory.

	@param self		The socket object.

	@return			-1 on failure, 0 otherwise.
  */
  int OSC_UDPFreeSocket(OSC_UDPSocket self);

  /*	Put the socket in non-blocking mode.
	
	@param self		The socket object.
	@param flag		If flag is TRUE, the socket is set non-blocking.
  */
  void OSC_UDPSocketSetNonBlocking(OSC_UDPSocket self, OSCBoolean flag);

  /*	Query the socket's blocking status.

	@param self		The socket object.

	@return			TRUE if socket is non-blocking.
  */
  OSCBoolean OSC_UDPSocketGetNonBlocking(OSC_UDPSocket self);

  /*	Set the timeout to wait during a send or receive.
	
	This will only be in effect during blocking operation.

	@param self		The socket object.
	@param timeout		The timeout in seconds.
  */
  void OSC_UDPSocketSetTimeOut(OSC_UDPSocket self, int timeout);

  /*	Get the currently set timeout.

	@param self		The socket object.

	@return			The timeout in seconds.
  */
  int OSC_UDPSocketGetTimeOut(OSC_UDPSocket self);

  /*	Create an internet address for use with OSC_UDPReceiveBuf and OSC_UDPSendBuf.

	@param self		The address object; memory will be allocated.
	@param hostName		The remote host's name.
	@param portNumber	The port.

	@return 		SOCKET_ERROR on failure, 0 otherwise.
  */
  OSC_UDPAddress OSC_UDPCreateAddress(const char *hostName, unsigned short portNumber);

  /*	Free the address' resources.

	@param self		The address object.

	@return			-1 on failure, 0 otherwise.
  */
  int OSC_UDPFreeAddress(OSC_UDPAddress self);

  /*	Check the readability of the socket, receive incoming OSC buffers and
	pass them to the library.

	@param self		The server socket object.
	@param returnAddress	The client's return address (if any); pass NULL
				if no return address is needed.

	@return			SOCKET_ERROR on failure or if the socket is not readable
				(has no data), the number of bytes received otherwise.
  */
  int OSC_UDPReceiveBuf(OSC_UDPSocket self, OSC_UDPAddress returnAddress);

  /*	Send an OSC buffer to another proxy.

	@param self		The socket object.
	@param address		The address where the buffer is supposed to go.
	@param buf		The OSC buffer to send.

	@return 		SOCKET_ERROR on failure, the number of bytes sent otherwise,
  */
  int OSC_UDPSendBuf(OSC_UDPSocket self, OSC_UDPAddress address, OSCbuf *buf);


#if defined(__cplusplus)
}
#endif /* __cplusplus */

#endif /* _OSC_NETWORK_UTIL_H */
