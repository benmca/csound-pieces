/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class Silence_Orchestra_Csound */
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
#ifndef _Included_Silence_Orchestra_Csound
#define _Included_Silence_Orchestra_Csound
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     Silence_Orchestra_Csound
 * Method:    create
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_Silence_Orchestra_Csound_create
  (JNIEnv *, jobject);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    destroy
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_destroy
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    clear
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_clear
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    startCsound
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_startCsound
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    stopCsound
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_stopCsound
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    setCommand
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_setCommand
  (JNIEnv *, jobject, jint, jstring);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    getCommand
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_Silence_Orchestra_Csound_getCommand
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    setOrchestra
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_setOrchestra
  (JNIEnv *, jobject, jint, jstring);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    getOrchestra
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_Silence_Orchestra_Csound_getOrchestra
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    setScore
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_setScore
  (JNIEnv *, jobject, jint, jstring);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    getScore
 * Signature: (I)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_Silence_Orchestra_Csound_getScore
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    openView
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_openView
  (JNIEnv *, jobject, jint);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    load
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_load
  (JNIEnv *, jobject, jint, jstring);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    save
 * Signature: (ILjava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_save
  (JNIEnv *, jobject, jint, jstring);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    addNote
 * Signature: (IDDD)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_addNote__IDDD
  (JNIEnv *, jobject, jint, jdouble, jdouble, jdouble);

/*
 * Class:     Silence_Orchestra_Csound
 * Method:    clearScore
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_Silence_Orchestra_Csound_clearScore
  (JNIEnv *, jobject, jint);

#ifdef __cplusplus
}
#endif
#endif
