==========================
Eudora Light for Windows
Version 3.0.5
16- and 32-bit
==========================


This is the freeware version of Eudora for Windows. 
There is also a commercial version of Eudora called 
Eudora Pro.  If you would like information about 
the commercial version, a brief description is 
provided in the "About Eudora Pro" menu in this
freeware.

This README includes the following information:

    *    Minimum Requirements
    *    Installation
    *    New Features
    *    Other Recent Feature Additions
    *    Configuration
    *    TCP/IP Services
    *    Freeware Questions
    *    Bug Reports
    *    Requests for Features
    *    Developers Note
    *    License and Legal Information


----------------------
Minimum Requirements
----------------------

To use Eudora Light for Windows V3.0.5, you 
must have the following:

*    IBM-compatible PC.
*    For 16-bit Eudora: Windows 3.1, 3.11, 
     or Workgroups
     For 32-bit Eudora: Windows 95, NT 3.51,  
     or NT 4.0
*    WinSock 1.1 API-compliant networking  
     package (not needed for serial connection)
*    A mail account with an ISP (Internet  
     Service Provider) or an Internet-style  
     network, providing an SMTP service and  
     a POP3 service.
*    Access to your mail account via a  
     modem (9600bps or higher recommended)  
     or Internet-style network connection.


------------
Installation
------------

To install Eudora, follow these directions:

1.   Exit any applications you are running.

2.   If you are installing from a software archive,
     double-click on it to start the Setup program.

     If you are installing from diskette, insert the
     Eudora Light diskette 1 into drive A: of your PC.
     Then select Run... from the Start menu, enter
     A:Setup.exe, and click OK.

3.   Read the Welcome screen, then click Next.
     The Software License Agreement is displayed.

4.   Read the Software License Agreement and click Next
     (you can also save or print the Agreement).

5.   Specify a directory to install Eudora, then
     click Next.

     To upgrade an older version of Eudora Light, 
     select your current Eudora directory. All of your 
     messages, mailboxes, folders, and options will 
     be maintained.

6.   Select the version of the software that you want
     to install, 16- or 32-bit. Based on the operating
     system and connectivity software that you are
     running, the Setup program recommends an appropriate
     version.

7.   Verify that the displayed settings are correct,
     then click Next (or use the Back button if you need
     to go back and make changes).

8.   If you are installing from diskette, you are
     prompted to insert additional diskettes into drive A.

9.   Eudora is installed in the destination directory,
     and you are prompted for whether or not you want
     to view the README file. Click Yes.

Note:   Always keep the Help file in the same directory 
        as the executable (.exe).


------------
New Features
------------

Auto-configuration (32-bit only)
--------------------------------

Auto-configuration support, using the Internet standard
Application Configuration Access Protocol (ACAP), has
been added to Eudora. ACAP is a client/server protocol
which allows Eudora to retrieve configuration settings
from a central server. These settings include the ones
that must be set up in order for you to start sending and
receiving e-mail, such as the name of your POP account and
SMTP host. This saves you from having to enter all of that
information yourself.

In order for you to use auto-configuration, your system
administrator or service provider must have set up a central
server with your personal settings. You can then download
those settings whenever you like; typically you would do
so only when first starting to use Eudora, but you can do
so at any later time if you want to restore your settings to
their original values.

To download your settings, open the Options dialog under
the Tools menu and click on the Auto-Configure icon. Fill
in the Server Name, User Name, and Password fields; your
system administrator or service provider should have told
you what to enter in these fields. Clicking on the Retrieve
Settings Now button will cause your settings to be downloaded
from the ACAP server.

The following ACAP-related information should be of use
primarily to system administrators and/or service providers.

If the switch UseACAPServer=1 is present in Eudora.ini,
then when Eudora is first launched (actually any time Eudora
is launched without a POP account having been specified),
the Auto-Configure panel of the Options dialog comes up. In
the absence of that switch, the Options dialog's Getting
Started panel would come up instead.

The name of the ACAP server can be specified in Eudora.ini,
so that the user doesn't have to type it in, by inserting a
switch of the form ACAPServer=servername (replacing "servername"
by the actual name, of course). Similarly, a switch of the form
ACAPUserID=username can be used to specify the user name to be
passed to the ACAP server.

The port ID used in communicating with the ACAP server can be
specified in Eudora.ini by inserting a switch of the form
ACAPPort=portnumber. The default is port 674.

You can obtain detailed information on setting up an ACAP server
to support Eudora clients on the Eudora web site. Go to
http://www.eudora.com/techsupport, click on the "Frequently
Asked Questions (FAQ)" link, and then click on the "Automatic
Initial Configuration with ACAP" link.

The upcoming version 2.0 release of the Eudora WorldMail server
will support auto-configuration of Eudora clients.

RPA authentication
------------------

RPA has been added as an authentication style; this shows up in
the Checking Mail panel of the Options dialog under the Tools menu.
Checking this authentication style allows you to download messages
from a CompuServe POP3 server.

Before you can use the RPA authentication style, you'll need to
obtain a support module for RSA from your service provider. For
example, for CompuServe you'll need the Virtual Key software,
which can be downloaded from this Web site:
<http://www.compuserve.com/rpa/browser.htm>.

RPA support was first introduced in the 32-bit version of Eudora
3.0.3, and is now available in the 16-bit version as well.

Pre-configuring the POP server
------------------------------

System administrators can now pre-configure Eudora by putting the
POP server name in Eudora.ini, so that the user only needs to add
his or her account name.

If the POPAccount switch in Eudora.ini is of the form
POPAccount=domainname or POPAccount=@domainname, then when Eudora
is launched it will bring up the Getting Started panel of the
Options dialog, and the POP account field will show whatever domain
name is in the POPAccount switch. (Formerly, entering anything
after POPAccount= in Eudora.ini would stop Getting Started from
coming up automatically.)

For example, suppose Eudora.ini says POPAccount=@xyz.qualcomm.com.
When the user starts Eudora, Getting Started will automatically
display, with @xyz.qualcomm.com in the POP account field, so that
the user just needs to insert his or her account name at the start
of that string.

Enhanced third-party developer support
--------------------------------------

Eudora plug-ins that run in the on-arrival context now operate on
all messages, not just ones that are MIME formatted. See the web
page <http://www.eudora.com/developers/emsapi/emswhat.html> for more
information on Eudora plug-in development.

Note for PGP 5.0 users (Windows 95 and Windows NT 4.0 only)
-----------------------------------------------------------

The original PGP 5.0 is not compatible with Eudora Light 3.0.5. If
you previously installed PGP 5.0 and wish to continue using it with
Eudora Light 3.0.5, you need to install an updated version of PGP
5.0. If you're in the U.S. or Canada, you can download Eudora Light
3.0.5 with the updated PGP 5.0 from the Eudora web site
(http://www.eudora.com).


--------------------
Other Recent Changes
--------------------

*    A Return Address field has been added to the Getting Started
     panel of the Options dialog box. Return Address is still in
     the Personal Info, Sending Mail, and Personalities panels of
     the Options dialog box.

*    A new Using Context Sensitive Help dialog box is displayed the 
     first time you launch Eudora (or when the Eudora.ini file does
     not exist). This dialog box contains tips on using context-
     sensitive help in Eudora. You can read the same information at
     any time via Using Context Sensitive Help under the Help menu.

*    A new switch, WordWrapOnScreen, has been added to the [Settings] 
     category in the Eudora.ini file. When word wrapping is enabled and when
     WordWrapOnScreen is set to 1, lines wrap in the composition window
     at the same positions as when the message is sent. (Otherwise, the
     width of the composition window determines where the lines appear
     to wrap.)

     This can occur only if you and your recipient's composition window 
     is wide enough on both screens for the column width specified, and 
     that you use a fixed-width font, such as Courier, to compose the message.  

     To define the columns, the switch WordWrapOnScreen must be 
     manually added to the Eudora.ini file and set to 1 (WordWrapOnScreen=1), 
     and WordWrapColumn must be set to the column number you wish 
     the text to wrap (WordWrapColumn=70 for 70 columns).

*    Dragging the dump truck icon onto a folder icon in the mailbox list
     now causes the folder to open automatically.


-------------
Configuration
-------------

The first time you run Eudora, you will 
have to edit some of the configuration 
information in order to be able to send 
and receive mail.

Select Options... from the Tools Menu.

The fields you need to review are:

POP Account:  To use Eudora, you must have 
an account on a computer that runs a POP3 
server.  This is the account to which your 
e-mail messages are delivered before they 
are transferred to the Eudora program on 
your PC.  In this field, type your login 
name for this account, an "@" sign, and 
the full (domain) name of the computer.  
For example, if your assigned login name
is "carolyn," and the name of the computer 
where you receive e-mail is "uxh.cso.uiuc.edu," 
type "carolyn@uxh.cso.uiuc.edu" in this field.

Real Name:  Type your real name.  Your name, 
as it appears here, is displayed in parentheses 
after your return address in your outgoing mail.
It is also displayed in the sender column of 
all messages you send.

SMTP Server:  To send mail, a computer with 
an SMTP (Simple Mail Transfer Protocol) 
server program is necessary.  You need not 
have a login to this computer, but you must 
have access to it through your network.  
If the computer on which you have your POP 
account is also an SMTP server, leave this 
field blank.  Otherwise, specify the name 
of the computer you want to use as your 
SMTP server.

Return Address:  Normally, Eudora uses 
your POP account as your return address.  
If you wish to use a return address 
other than your POP account, enter it here.


If you have the New Mail Notification 
"Sound" switch on, and when new mail
arrives, you will hear a notification 
sound.  In order for this to work, your 
system must have a properly configured 
sound board, or you must have installed 
the Sound Driver for PC-Speaker (anonymous  
ftp from ftp.eudora.com the file 
/eudora/eudoralight/windows/extras/utils/SPEAK.EXE).  
Eudora has a built-in sound, but if you 
wish to supply your own, it must be in .WAV
format.  To change the default new mail 
sound, select Options... from the Special 
menu, and then select the Getting Attention 
category. Select the button under the 
"Play a sound" checkbox, and a dialog  
will prompt you for the sound file.

Note that this driver will only work for 
the Windows 3.X operating system.
It will not work for Windows NT or Windows 95.

If the mail you are sending is returning
to you saying that the message
does not have a Date: header, add the 
following entry to your EUDORA.INI
file:

[Settings]
TimeZone=xxxnnnyyy

where xxx, yyy are timezone abbreviations 
like PST, PDT, CDT, and nnn is the offset 
in hours WEST of GMT (i.e., those that 
are east of GMT should enter a negative 
number here).  xxx is the timezone during 
Standard Time and yyy is the timezone 
during Daylight Savings Time.  If you 
do not change your clocks during Daylight 
Savings Time, leave yyy blank.

Here's some samples:
     TimeZone=PST8PDT
     TimeZone=EST5EDT
     TimeZone=MET-1

If you don't specify a TimeZone entry, 
then a Date: header will not be put
in outgoing messages, which is fine for 
most users because their mail server 
will insert the correct Date: header.  
The moral is - if you don't get messages 
bounced because of a missing Date: 
header, then leave the TimeZone entry alone.


---------------
TCP/IP Services
---------------

Eudora makes use of several different 
TCP/IP services, and has default port
numbers for these services.  Most sites 
put these services on the default ports, 
but some may not.  Contact your site 
network administrator to make sure that 
the following services listed below are 
indeed on the default port numbers.  
If they are not, you will have to make 
some changes to some configuration 
file(s) in your TCP/IP package 
(usually to a SERVICES file).

Below are a list of the services which 
Eudora uses, and what they might look 
like in a typical services file.  The 
names of these services must be exactly 
as named here (e.g., the entry for the 
POP3 service must be "pop3" and not 
"pop-3").  Make sure that you make 
any changes necessary for your TCP/IP 
package to specify the location of the 
SERVICES file.

To send mail:
        smtp      25/tcp

To receive mail:
        pop3      110/tcp

To use Ph (if your site has a Ph server):
        csnet-ns  105/tcp

To use Finger (if your site supports finger):
        finger    79/tcp

To use the Change Password... function in 
Eudora, your site must have a password 
changing server installed.  See the 
directory quest/unix/servers/password on 
ftp.eudora.com for examples of password
changing servers):
        epass   106/tcp

There are also entries in the [Settings] 
section of the EUDORA.INI file for default 
port numbers of services.  These are provided 
for setups in which the SERVICES file cannot 
be modified.  Do not use these entries
unless the services are not on default port 
numbers and you cannot modify them in your 
TCP/IP package.  Here are sample INI entries:

[Settings]
SMTPPort=25
POPPort=110
PHPort=105
FingerPort=79
EudoraPassPort=106


------------------
Freeware Questions
------------------

If you have a technical question about Eudora 
Light for Windows, check the online help and 
user manual.  If your question is still unanswered,
try the Eudora Usenet News groups
<comp.mail.eudora.ms-windows> or
<comp.mail.eudora.mac>.


-----------
Bug Reports
-----------

If you experience something you think might 
be a bug in Eudora, please report it by 
sending a message to win-eudora-bugs@eudora.com. 
Describe what you did, what happened, what 
version of Eudora you have, any error messages
Eudora gave, what kind of computer you have, 
which operating system you're using,
and anything else you think might be relevant.

You will receive an automated response 
indicating that your bug report has been 
received and forwarded to our engineering 
staff. Unless additional information is 
needed, you will not receive a direct response.


---------------------
Requests For Features
---------------------

>From time to time, everyone comes up with 
an idea for something they'd like their 
software to do differently.  This is true 
of all applications, no less Eudora.  
If you come across an idea that you think 
might make a nice enhancement to Eudora, 
your input is always welcome.  Please send 
any suggestions or requests for new features 
to eudora-suggest@eudora.com.

You will receive an automated response 
indicating that your suggestion has been 
received and forwarded to our engineering 
staff.  Unless additional information is 
needed, you will not receive a direct response.


----------------
Developer's Note
----------------

Eudora Light is postcardware!

If you try out Eudora, and decide that you'd 
like to use it on a regular basis, then just 
send a postcard to the following address:

Jeff Beckley
Eudora Division
QUALCOMM Incorporated
6455 Lusk Blvd.
San Diego, CA  92121-2779
USA

Postcards that have something to do with where 
you live are an especially good choice, as we 
like to see all the interesting places that 
Eudora is being used.  Humorous or unusual 
postcards are a favorite, and you never
know when we may decide that someone's postcard 
was interesting enough to make them a tester 
for the commercial version of Eudora.


-----------------------------
License and Legal Information
-----------------------------

This Eudora Software is owned by QUALCOMM 
Incorporated. QUALCOMM grants to the user a 
nonexclusive license to use this Eudora Software 
solely for User's own personal or internal 
business purposes.  The user may not commercially 
distribute, sublicense, resell, or otherwise 
transfer for any consideration, or reproduce for 
any such purposes, the Eudora software or any 
modification or derivation thereof, either 
alone or in conjunction with any other product
or program.  Further, the user may not modify 
the Eudora Software, other than for User's own 
personal or internal business use.

THIS EUDORA SOFTWARE IS PROVIDED TO THE USER 
"AS IS."  QUALCOMM MAKES NO WARRANTIES, EITHER 
EXPRESS OR IMPLIED, WITH RESPECT TO THIS EUDORA 
SOFTWARE AND/OR ASSOCIATED MATERIALS PROVIDED TO 
THE USER, INCLUDING BUT NOT LIMITED TO ANY WARRANTY 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
OR AGAINST INFRINGEMENT. QUALCOMM DOES NOT WARRANT 
THAT THE FUNCTIONS CONTAINED IN THE SOFTWARE WILL 
MEET YOUR REQUIREMENTS, OR THAT THE OPERATION OF 
THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE, 
OR THAT DEFECTS IN THE SOFTWARE WILL BE CORRECTED.  
FURTHERMORE, QUALCOMM DOES NOT WARRANT OR MAKE ANY 
REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF 
THE USE OF THE SOFTWARE OR ANY DOCUMENTATION PROVIDED 
HEREWITH IN TERMS OF THEIR CORRECTNESS, ACCURACY, 
RELIABILITY, OR OTHERWISE.  NO ORAL OR WRITTEN
INFORMATION OR ADVICE GIVEN BY QUALCOMM OR A QUALCOMM 
AUTHORIZED REPRESENTATIVE SHALL CREATE A WARRANTY OR 
IN ANY WAY INCREASE THE SCOPE OF THIS WARRANTY. 

LIMITATION OF LIABILITY -- QUALCOMM AND ITS LICENSORS 
ARE NOT LIABLE FOR ANY CLAIMS OR DAMAGES WHATSOEVER, 
INCLUDING PROPERTY DAMAGE, PERSONAL INJURY, INTELLECTUAL 
PROPERTY INFRINGEMENT, LOSS OF PROFITS, OR INTERRUPTION 
OF BUSINESS, OR FOR ANY SPECIAL, CONSEQUENTIAL OR INCIDENTAL
DAMAGES, HOWEVER CAUSED, WHETHER ARISING OUT OF BREACH 
OF WARRANTY, CONTRACT, TORT (INCLUDING NEGLIGENCE), 
STRICT LIABILITY, OR OTHERWISE.

Windows is a registered trademark of Microsoft 
Corporation.

Eudora (TM) is a registered trademark of QUALCOMM 
Incorporated.

Eudora Pro (TM) and Eudora Light (TM) are trademarks 
of QUALCOMM Incorporated.

QUALCOMM is a registered trademark and registered 
service mark of QUALCOMM Incorporated.

All other trademarks and service marks are the property of
their respective owners.

QUALCOMM Incorporated

License Terms for PureVoice(TM) Player-Recorder Version 1.0 - Windows Platform
License Terms for PureVoice(TM) Plug-In for Eudora Version 1.0 - Windows Platform

QUALCOMM grants to the user a nonexclusive license to use this PureVoice
software solely for user's own personal or internal business purposes.
The user may not commercially distribute, sublicense, resell, or otherwise 
transfer for any consideration, or reproduce for any such purposes, the 
PureVoice software or any modification or derivation thereof, either 
alone or in conjunction with any other product or program.  
Further, the user may not modify the PureVoice software.

THE PUREVOICE SOFTWARE IS PROVIDED TO THE USER ''AS IS.''  QUALCOMM MAKES 
NO WARRANTIES, EITHER EXPRESS OR IMPLIED, WITH RESPECT TO THE PUREVOICE 
SOFTWARE AND/OR ASSOCIATED MATERIALS PROVIDED TO THE USER, INCLUDING 
BUT NOT LIMITED TO ANY WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE OR AGAINST INFRINGEMENT. QUALCOMM DOES NOT WARRANT THAT THE FUNCTIONS 
CONTAINED IN THE SOFTWARE WILL MEET YOUR REQUIREMENTS, OR THAT THE OPERATION 
OF THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE, OR THAT DEFECTS IN 
THE SOFTWARE WILL BE CORRECTED.  FURTHERMORE, QUALCOMM DOES NOT WARRANT OR 
MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF THE USE OF THE 
SOFTWARE OR ANY DOCUMENTATION PROVIDED THEREWITH IN TERMS OF THEIR CORRECTNESS, 
ACCURACY, RELIABILITY, OR OTHERWISE. NO ORAL OR WRITTEN INFORMATION OR ADVICE 
GIVEN BY QUALCOMM OR A QUALCOMM AUTHORIZED REPRESENTATIVE SHALL CREATE A WARRANTY 
OR IN ANY WAY INCREASE THE SCOPE OF THIS WARRANTY.

LIMITATION OF LIABILITY - QUALCOMM IS NOT LIABLE FOR ANY CLAIMS OR 
DAMAGES WHATSOEVER, INCLUDING PROPERTY DAMAGE, PERSONAL INJURY, INTELLECTUAL 
PROPERTY INFRINGEMENT, LOSS OF PROFITS, OR INTERRUPTION OF BUSINESS, OR FOR 
ANY SPECIAL, CONSEQUENTIAL OR INCIDENTAL DAMAGES, HOWEVER CAUSED, WHETHER ARISING 
OUT OF BREACH OF WARRANTY, CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT 
LIABILITY, OR OTHERWISE.

Copyright © 1997 by QUALCOMM Incorporated.  All rights reserved.

PureVoice(TM) is a registered trademark of QUALCOMM Incorporated.

Windows is a registered trademark of Microsoft 
Corporation.

Eudora (TM) is a registered trademark of QUALCOMM 
Incorporated.

Eudora Pro (TM) and Eudora Light (TM) are trademarks 
of QUALCOMM Incorporated.

QUALCOMM is a registered trademark and registered 
service mark of QUALCOMM Incorporated.

All other trademarks and service marks are the property of
their respective owners.


10/97