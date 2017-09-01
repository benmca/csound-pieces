echo "Nik's JcSelf Enviroment!"
rem If the jre will not start, make sure, that the memory setting for the DOS box is high enough !
rem You can change that in the 'Property' setting of the Dos box.
rem ------------------------------------------------------------
set TopUi=c:\PHS\jcself.jar
set JRE_TOP="c:\Program Files\JavaSoft\JRE\1.1"
set CLASSPATH=%TopUi%
rem ------------------------------------------------------------
rem Next you can choose to run debug - mode: (-d=debug, v1 = Verbosity (1-6)
rem set OPTIONS="-dv1"
set OPTIONS=
rem ------------------------------------------------------------
jre -nojit -DOPTIONS=%OPTIONS% -DTopUi=%TopUi% -DHOME=%HOME% -cp %CLASSPATH% SOUND.CEditor
