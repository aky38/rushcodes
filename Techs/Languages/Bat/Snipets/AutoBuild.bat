rem �Զ��汾����ϵͳ
@echo off
rem %comspec% /k ""C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat"" x86

rem ���ȸ���svn
start /WAIT cmd /c "svn update.bat"

SETLOCAL ENABLEDELAYEDEXPANSION

rem ÿ���Զ����е�ʱ��------------------------
if exist TIME.TM (
rem echo exist
for /f "delims=" %%i in (TIME.TM) do set TimeToRun=%%i
) else (
echo not exist
echo ������ÿ�켸�����и��Զ�����ϵͳ[H:M/9:00]:
set /p TimeToRun=
rem ���治�ø�������
)

if exist TIME.TM (
rem echo exist
) else (
rem echo %TimeToRun%
echo %TimeToRun%>TIME.TM

rem ÿ�����иó���
AT %TimeToRun% /EVERY:M,T,W,TH,F,S,SU "%~f0"
if %errorlevel% equ 0 (
rem echo �Զ�������ӳɹ�
) else (
echo �Զ��������ʧ��
pause 
exit
)
)


rem ------------------------------------------------

rem ��ȡĿ¼-----------------------------------
set VERSIONDIR=
if exist VERSIONDIR.VER	(
rem echo exist
for /f "delims=" %%i in (VERSIONDIR.VER) do set VERSIONDIR=%%i
) else (
echo not exist
echo ������汾�ļ���λ��,��ʹ�þ���ֵ:
set /p VERSIONDIR=
rem ���治�ø�������
)
rem echo %VERSIONDIR%

rem ȷ����ʽ��ȷ
rem echo %VERSIONDIR:~-1,1%
if "%VERSIONDIR:~-1,1%" == "\" (
rem echo good format
) else (
set VERSIONDIR=%VERSIONDIR%\

)

rem echo %VERSIONDIR%

rem ȷ���ļ�����Ч
mkdir "%VERSIONDIR%test"
if %errorlevel% equ 0 (
rem echo �ļ�����Ч
rmdir "%VERSIONDIR%test"
) else (
echo ��������ļ�����Ч��
pause 
exit
)

echo %VERSIONDIR%>VERSIONDIR.VER
rem ------------------------------------------------

rem ����-------------------------------------------
echo �������� %date% %time%
echo �������� %date% %time%>build.log
del output.log
"C:\Program Files\Microsoft Visual Studio 8\Common7\IDE\devenv.exe" ClientMain.sln /project ClientMain /Rebuild Release /out output.log
type output.log>>build.log
if %errorlevel% equ 0 (
rem echo ����ɹ�
) else (
echo ����ʧ��
pause 
exit
)
rem ----------------------------------------------

rem ��ȡ��ȷʱ��-----------------------------------
echo %time% > time.tmp
for /f "delims=: tokens=1,2 " %%i in (time.tmp) do set timePostfix=%%i_%%j
del time.tmp
rem echo %timePostfix%

echo %date% > date.tmp
for /f "tokens=1,2,3 delims=-	 " %%i in (date.tmp) do set datePostfix=%%i_%%j_%%k
del date.tmp
rem echo %datePostfix%
rem ------------------------------------------------


rem �����汾�ļ���---------------------------------
echo %datePostfix% %timePostfix%
set DESTDIR="%VERSIONDIR%%datePostfix% %timePostfix%"
echo %DESTDIR%
mkdir %DESTDIR%
rem ------------------------------------------------


rem �������汾�ļ���------------------------------
copy /Y "..\bin\release\*.*" %DESTDIR%
rem ------------------------------------------------

echo ��ɹ���
echo ��ɹ���>>build.log
copy build.log %DESTDIR%
pause 