@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem �汾��1Ĭ��1�����Ǵ�汾��
rem �汾��2��3��4 ��/��/ʱ
set vn1=1
set vn2=
set vn3=
set vn4=

rem ��ȡ��ȷʱ��汾-----------------------------------
echo %time% > time.tmp
for /f "delims=: tokens=1 " %%i in (time.tmp) do (
set vn4=%%i
)
rem ȥ��Сʱǰ�п��ܴ��ڵĿո�
for /f "tokens=1 delims= " %%i in ("%vn4%") do set vn4=%%i
echo %vn4%
del time.tmp

echo %date% > date.tmp
for /f "tokens=1,2,3 delims=-	 " %%i in (date.tmp) do (
set vn2=%%j
set vn3=%%k
)
del date.tmp
rem ------------------------------------------------

set VERSION_STR=%vn1%.%vn2%.%vn3%.%vn4%
echo %VERSION_STR%

rem Ĭ��û��verdesc
start /WAIT GenVersion.exe VERSION.DAT %VERSION_STR%

echo "����ɹ����" 
pause "����ɹ����" 