@echo off
Rem ��svn uplist.txt�н�������Ҫ���µ��ļ���Ŀ¼

 SETLOCAL ENABLEDELAYEDEXPANSION
 
 rem ��ȡ��ǰdir
for /f  %%i in ('cd') do set localFolder=%%i
rem echo %localFolder%

for /f "tokens=1,2 " %%i in (dirList.txt) do (
					wmic environment where "name='%%i'" delete 
	  				wmic environment create name="%%i",username="<system>",VariableValue="%localFolder%\%%j"
	  				)

echo ����ɹ����
pause 