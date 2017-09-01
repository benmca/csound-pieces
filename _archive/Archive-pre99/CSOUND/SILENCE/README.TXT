ANNOUNCING SILENCE VERSION 8.1 AND CSOUNDVST VERSION 0.6
From Michael Gogins/Irreducible Productions
gogins@pipeline.com

Available for download at: http://www.pipeline.com/~gogins

Silence is a user-extensible system for making music on computers by means of software alone. It is specifically designed to support algorithmic composition and synthesis. Music is represented in a hierarchical arrangement of nodes and child nodes, using matrix arithmetic to transform and position material. A number of generative and transformational algorithms are provided.

In addition to using Silence as a score generating program, users can write their own music programs in Java using Silence as a class library.

CsoundVST is a VST plugin version of Csound. It works either as a synthesizer or as an effect in hosts such as Cubase or Orion Pro. It also has a C API, a C++ API, a Java API (which Silence uses to render scores it generates), and a MathLink interface, which enables Mathematica 4.1 to be used for algorithmic composition.

In addition to using CsoundVST as a VST plugin or software synthesizer, users can write their own music programs in C or C++ which use CsoundVST as a synthesis engine.

CHANGES TO SILENCE FOR VERSION 8.1

Changes are focused on making Silence easier to use and more musically powerful, especially by improving CsoundVST.

Installation and setup have been simplified and made more foolproof. 

Documentation has been simplified and made more concise.

 “New version”, “Generate”, “Play Midi”, “Render”, and “Play” commands have been added to MusicModelView’s top-level menu, so the entire edit-generate-render-listen cycle can be controlled from one menu, which stays in place no matter what panel is currently showing. 

The “New version” command first saves the existing music model, then renames the music model using a filename created from date and time, and finally saves the new music model. This enables the user to quickly archive snapshots of a work in progress. In addition, MusicModel automatically creates Csound filenames based on the music model filename.

Mason numbers now never affect pitches until the final score file is generated. This means that repeated use of Mason numbers does not coerce pitches to a reduced pitch-class set.

The Lindenmayer node has been rewritten to be more mathematically elegant, to have easier to remember commands, and to be considerably faster.

The MultipleReductionCopyMachine node did not work properly, and has been corrected.

A number of other bugs and infelicities have been removed.

CHANGES TO CSOUNDVST FOR VERSION 0.6

CsoundVST source code is now synchronized with Csound version 4.17 from John ffitch.

CsoundVST has been reworked to use Matt Ingalls’ re-entrant playevents code. As a result, it is more efficient and more stable. 

CsoundVST has been changed from a “synthesizer” to an “effect”, so it can actually be used either as a synthesizer or as an effect. However, at this time, CsoundVST does not actually seem to work reliably as an effect.

The CsoundVST GUI has been rewritten to use native Win32 API calls, and an arrangement page has been added.

Plugin opcodes for Csound have been implemented, with two samples: Jezar’s freeverb, and Perry Cook’s complete Synthesis Tool Kit (STK).

A native MathLink interface has been created, in CsoundMathLink.exe, to simplify using CsoundVST from Mathematica 4.1, which is a powerful tool for algorithmic composition.

A number of minor bugs have been fixed.

LICENSE

Silence and CsoundVST are copyright (c) 1998-2002 by Michael Gogins, all rights reserved. They are licensed under the terms of the GNU Lesser General Public License.

Csound source code contained in CsoundVST is copyright (c) 1986, 1992 by the Massachusetts Institute of Technology, all rights reserved. It is freely available for educational and research purposes only. 

Other software incorporated in Silence is licensed according to documentation provided with Silence.

Note that MUSIC made with CsoundVST and Csound is copyrighted by its authors and can be sold or given away without limitation, with the possible exception of music made using signal processing techniques that are patented. Contact the patent holders or an attorney if you have questions about such use.
