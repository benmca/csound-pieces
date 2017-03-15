#include <CsoundVST/Silence_Orchestra_Csound.h>
#include <CsoundVST/CsoundVST.h>
/**
* S I L E N C E
* 
* An auto-extensible system for making music on computers by means of software alone.
* Copyright (c) 2001 by Michael Gogins. All rights reserved.
*
* L I C E N S E
*
* This software is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this software; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     Silence_Orchestra_Csound
 * Method:    create
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_Silence_Orchestra_Csound_create
  (JNIEnv *, jobject)
{
	CsoundVST *csoundVST = new CsoundVST;
	return (jint) csoundVST;
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    destroy
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_destroy
  (JNIEnv *, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	delete csoundVST;
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    clear
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_clear
  (JNIEnv *, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->removeAll();
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    startCsound
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_startCsound
  (JNIEnv *, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->perform();
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    stopCsound
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_stopCsound
  (JNIEnv *, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->stop();
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    setCommand
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_setCommand
  (JNIEnv *java, jobject, jint jcsoundVST, jstring jtext)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	const char *text = java->GetStringUTFChars(jtext, 0);
	csoundVST->setCommand(text);
	java->ReleaseStringUTFChars(jtext, text);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    getCommand
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_Silence_Orchestra_Csound_getCommand
  (JNIEnv *java, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	std::string &text = csoundVST->getCommand();
	jstring jtext = java->NewStringUTF(text.c_str());
	return jtext;
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    setOrchestra
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_setOrchestra
  (JNIEnv *java, jobject, jint jcsoundVST, jstring jtext)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	const char *text = java->GetStringUTFChars(jtext, 0);
	csoundVST->setOrchestra(text);
	java->ReleaseStringUTFChars(jtext, text);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    getOrchestra
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_Silence_Orchestra_Csound_getOrchestra
  (JNIEnv *java, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	std::string &text = csoundVST->getOrchestra();
	jstring jtext = java->NewStringUTF(text.c_str());
	return jtext;
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    setScore
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_setScore
  (JNIEnv *java, jobject, jint jcsoundVST, jstring jtext)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	const char *text = java->GetStringUTFChars(jtext, 0);
	csoundVST->setScore(text);
	java->ReleaseStringUTFChars(jtext, text);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    getScore
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_Silence_Orchestra_Csound_getScore
  (JNIEnv *java, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	std::string &text = csoundVST->getScore();
	jstring jtext = java->NewStringUTF(text.c_str());
	return jtext;
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    openView
 * Signature: (I)V
 */
HANDLE ghInstance = 0;

JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_openView
(JNIEnv *, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	AEffEditor *editor = csoundVST->getEditor();
	void *parentWindow = 0;
	csoundVST->getEditor()->open(parentWindow);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    load
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_load
  (JNIEnv *java, jobject, jint jcsoundVST, jstring jtext)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	const char *text = java->GetStringUTFChars(jtext, 0);
	csoundVST->load(text);
	java->ReleaseStringUTFChars(jtext, text);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    save
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_save
  (JNIEnv *java, jobject, jint jcsoundVST, jstring jtext)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	const char *text = java->GetStringUTFChars(jtext, 0);
	csoundVST->save(text);
	java->ReleaseStringUTFChars(jtext, text);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4, jdouble p5, jdouble p6, jdouble p7, jdouble p8, jdouble p9, jdouble p10)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4, jdouble p5, jdouble p6, jdouble p7, jdouble p8, jdouble p9)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4, p5, p6, p7, p8, p9);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4, jdouble p5, jdouble p6, jdouble p7, jdouble p8)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4, p5, p6, p7, p8);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4, jdouble p5, jdouble p6, jdouble p7)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4, p5, p6, p7);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4, jdouble p5, jdouble p6)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4, p5, p6);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4, jdouble p5)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4, p5);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3, jdouble p4)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3, p4);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDD
  (JNIEnv *java, jobject, jint jcsoundVST, jdouble p1, jdouble p2, jdouble p3)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->addNote(p1, p2, p3);
}

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    clearScore
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_clearScore
  (JNIEnv *, jobject, jint jcsoundVST)
{
	CsoundVST *csoundVST = (CsoundVST *) jcsoundVST;
	csoundVST->removeScore();
}

#ifdef __cplusplus
};
#endif