---------------
Cool Edit 1.34b
---------------
Copy (or unzip) all the files into their own program directory, like C:\COOL or
something similar.  From File Manager, select COOL.EXE and drag it into your
favorite Program Manager group.  Alternately, you can go File->New from Program
Manager and select Browse, then find COOL.EXE and choose it.

There have been tons of new features added (which should explain the the fact
that the program has almost doubled in size!)  If you wish to save space on
your hard drive, it is OK to remove any of the .FLT files you want.  Each .FLT
file allows Cool Edit to load a certain file format.  If there are formats that
you never use, you can delete the associated .FLT file for that format.  For
example, if you never use the Next/Sun AU file format, then delete the file
AU.FLT from your \COOL program directory.  You may also remove .XFM files if
there are effects that you never use.  Please keep the STRETCH.XFM, FILTER.XFM
and AMPLIFY.XFM modules though, as they are crucial for operation in other
parts of the program.

Version 1.34b fixes some minor bugs in 1.34.  See Version History in Help.

Following are the new features, enhancements, and bug fixes since version 1.33:

NEW FEATURES
* Most transform and generate functions placed in their own separate modules
  for smaller EXE and expandability.
* Repeat Last Command (F2 for dialog, F3 for immediate) feature added.
* Convert Sample Type function added to convert sample types with varying
  levels of quality.
* Pause button added for pausing recording or playback.
* New Distortion transform added for creating overdriven, blown speaker, and 
  fuzz effects.
* New Echo Chamber transform added for creating echoes based on room dimensions
  and microphone placement.
* New Generate DTMF Signals function added for creating those telephone tones.
* Batch processing added to Scripts to run a script on a complete batch of
  files while saving files under new names.
* New Next/Sun (.AU), Raw 8-bit signed (.SAM), SampleVision (.SMP), ASCII Text 
  (.TXT), Dialogic Voice (.VOC) and A-Law/mu-Law Wave (.WAV) file formats 
  added.
* Settings for practically every dialog are now remembered between runs.

ENHANCEMENTS
* Auto Play feature in File Open dialogs to preview sounds through installed 
  Windows compression driver.
* Show Info feature in File Open dialogs to view file information before 
  opening.
* Save As file filter Options button added for compression methods that have 
  options.
* Most all transform and generate functions work during Single channel editing.
* Amplify, Normalize and Channel Mixer now faster on slow machines.
* Filter and Noise Reduction performance enhanced on stereo operations.
* Overall application performance improved including start up time and display 
  speed.
* Progress meter has Pause button for suspending calculations if the processor 
  is needed elsewhere.
* Normalize made a separate transform for quick and "scriptable" normalization.
* Invert made separate from Channel Mixer.
* Amplify has decibel scale option and both logarithmic and linear fades.
* Brainwave Synchronizer now supports variable Intensity and Centering.
* Noise Reduction displays noise profile, allows loading and saving of noise 
  profiles, and has more adjustable parameters which can lead to improved noise
  reduciton.
* Generate Tones now has separate initial and final modulation parameters and
  5 independantly adjustable frequency multipliers for more interesting
  effects. 
* Monitor Source level metering made more reliable.
* Settings now contains temporary directory choice, compressed drive option.
* Play may begin from cursor or from left edge of visible screen depending on 
  settings.
* Frequency Analysis displays stereo information with Left in Cyan and Right in
  Magenta, with more precise frequency interpolation.
* CD Player and controls improved, with Disk Insert ability added.
* Added Auto Zoom button to Cue List so double-clicking brings cue or range
  into complete view.
* Zoom In without any selection zooms in at cursor, and Zoom In does not clear
  highlighted selection anymore.
* Wave files may be up to 1 Gig in size.
* Open and Save As can be part of a Script now, for writing even larger script
  macros that use temporary files.
* Select Wave Device displays current sound card's basic capabilities.
* Current file size and number of samples now displayed during recording.
* Time accuracy increased to 3 digits beyond decimal.
* Time displays alternate between seconds, frames, and samples (double-click 
  Time displays in lower right to switch display format).
* More default sample rates added to New Waveform dialog.
* Uses fewer resources per instance, so more Cool Edit windows may be open at
  one time.
* Right Click extends selection as well as Shift + Left Click.
* CD "id" compatible with de-facto MusicBox standard.  Plus, over 10,000 CD
  titles and song lists can be stored.
* Generate Tones now more flexable with user-definable frequency multipliers
  that can vary over time.
* Stretch (preserve tempo/preserve none) function uses improved interpolation
  method to reduce unwanted artifacts.
* Stretch (preserve pitch/preserve tempo) function has new Fractional Interval
  Overlap elongation method for more choices in quality of stretch.
* Spectral Analysis takes advantage of 256-color and greater displays to show
  finer detail with more colors.
* Progress bar updates ETA time more often, at shorter intervals.
* Cool Edit added to your Extensions (File Manager) automatically for all file
  types that Cool Edit understands.

BUG FIXES
* Making Music preview "Listen" mode turns notes OFF when done.
* Stretch while preserving attributes improved slightly.
* Filtering reconstruction algorithm modified slightly to reduce negative 
  artifacts in filtered signal.
* Fixed bug in finding proper file format filter when loading (caused WAV files
  to load as Raw PCM).
* Program loads fine now under NT when there is a musuc CD in the drive.
* Numerous little bugs and glitches have been resolved.

Thanks to everyone who sent in suggestions and such.  I have implemented some
of them, but did not have time to get around to them all as it has been about
six months already since the last update.

To Register, see the Registration section of COOL.HLP (choose Help->Contents
from within Cool Edit).  I have 3 registration levels that you can choose
from:

$25 - Gets you the Registration Number only, no update disks sent
$35 - Gets you the Reg Number plus one ShareWare update
$50 - Gets you on the "preferred" list, and entitles you to one ShareWare 
      update, and perhaps more! 

Send a check drawn on a US bank, or US money order to:
David Johnston
28022 NE 147th Place
Duvall, WA  98019

For Australian orders, try the WOFTAM BBS (03)761-9904:
P.O. Box 100
Mt. Evelyn.  Victoria
Australia.  3796

Cool Edit is (c) 1992-1994 David Johnston

