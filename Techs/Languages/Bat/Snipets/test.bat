@echo off
set /p vn3=����汾��1:
set /p vn2=����汾��2:
set /p vn1=����汾��3:
set /p vn0=����汾��4:
rem set /p vndesc=����汾����:

rem batĿ¼
set BatDir=%cd%

rem һЩԤ��Ŀ¼�ṹ���������޸�
set version_str=%vn3%.%vn2%.%vn1%.%vn0%
set version_folder=%BatDir%\%vn3%_%vn2%_%vn1%_%vn0%
set VersionMakeDir=%BatDir%\..\BinTools\VersionMaker\release
set VersionInfoExe=%VersionMakeDir%\VersionInfo.exe
set MaterialPreParserExe=%VersionMakeDir%\MaterialPreParser.exe
set CrossFileMakerExe=%VersionMakeDir%\CrossFileMakerExe1.exe
set GameExeDir=%BatDir%\..\client\Bin\%VersionType%

echo %version_str%
echo %version_folder%
echo %VersionMakeDir%
echo %VersionInfoExe%
echo %MaterialPreParserExe%
echo %CrossFileMakerExe%
echo %GameExeDir%


pause