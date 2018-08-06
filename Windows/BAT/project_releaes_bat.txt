::-----------------------------------------------------------------------------------------------------------------------------
:: 
::	Purpose	         : Release Process Automation
::	Author	         : WR.AlexYuan
::	Createed Date    : 2018-08-06
::
::	IarBuild Command Registor for Windows:
::		1. Open "Control Panel"->"System"->"Advanced System Settings"->"Environment Variables"->"System Variables",
::		2. Add "C:\Program Files (x86)\IAR Systems\Embedded Workbench 6.5\common\bin\" into system variables "Path",
::		3. Complete the registor of IAR Build tools "IarBuild.exe".
::
::	Sample	: 1211_Release.bat Release V09-00 V07-00 V09-00 V07-00
::		%0 - 1211_Release.bat
::		%1 - IarBuild.exe config, two option: "Release" or "Debug", note the casematters.
::		%2 - Atlas PR Major Version and Minor Version
::		%3 - Atlas NP Major Version and Minor Version
::		%4 - Tippie PR Major Version and Minor Version
::		%5 - Tippie PR Major Version and Minor Version
::
::	IARBuild tools Usage:
::		IarBuild.exe project.ewp Release
::		IarBuild.exe project.ewp -build Release -log all
::		IarBuild.exe project.ewp -build Release
::		IarBuild.exe project.ewp -clean Release
::		IarBuild.exe project.ewp -make Release
::
::-----------------------------------------------------------------------------------------------------------------------------
@ECHO off

::IAR Command Line Build
if "%1" == "" goto END_IAR_BUILD_NO_CONFIG
if "%2" == "" goto END_ATLAS_PR_NO_VER
if "%3" == "" goto END_ATLAS_NP_NO_VER
if "%4" == "" goto END_TIPPIE_PR_NO_VER
if "%5" == "" goto END_TIPPIE_NP_NO_VER

set config=%1%
set Atlas_PR_Ver=%2%
set Atlas_NP_Ver=%3%
set Tippie_PR_Ver=%4%
set Tippie_NP_Ver=%5%
set Atlas_PR_Ver_Full=0160-0421-%Atlas_PR_Ver%
set Atlas_NP_Ver_Full=0160-0439-%Atlas_NP_Ver%
set Tippie_PR_Ver_Full=0160-0425-%Tippie_PR_Ver%
set Tippie_NP_Ver_Full=0160-0440-%Tippie_NP_Ver%
set work_dir=%cd%
set project_file=1211.ewp
set version_dir=.\ARCHITECTURE\Framework\SharedResouces\CFG\
set release_fold=ReleaseFiles
set build_info_text=Build_Release_Info.txt
ECHO %date:~0,10% %time:~0,8% IAR Build >%build_info_text%
ECHO. >>%build_info_text%
ECHO Build_Config:[%config%]
ECHO Build_Config:[%config%] >>%build_info_text%
if exist .\%release_fold%\ (ECHO ReleaseFolder:[%release_fold%]) else (goto END_BUILD_NO_RELEASE_FOLDER)
ECHO ReleaseFolder:[%release_fold%] >>%build_info_text%
ECHO Working__Dir:[%cd%]
ECHO Working__Dir:[%cd%] >>%build_info_text%
ECHO VersionH_Dir:[%version_dir%]
ECHO VersionH_Dir:[%version_dir%] >>%build_info_text%
ECHO Atlas_PR_Ver:[%Atlas_PR_Ver_Full%]
ECHO Atlas_NP_Ver:[%Atlas_NP_Ver_Full%]
ECHO Tippi_PR_Ver:[%Tippie_PR_Ver_Full%]
ECHO Tippi_NP_Ver:[%Tippie_NP_Ver_Full%]
ECHO. >>%build_info_text%
ECHO.
ECHO.


::---------------------------------------------------------------------------------------------------------
ECHO Build 1211 Atlas PR (1F85U-42PR) 
ECHO Atlas_PR_Ver:[%Atlas_PR_Ver_Full%] Building...
ECHO Atlas_PR_Ver:[%Atlas_PR_Ver_Full%] Building... >>%build_info_text%
cd .\%version_dir%\
del /f VersionConfig.h
if exist VerAtlasPR.h (copy VerAtlasPR.h VersionConfig.h) else (goto END_ATLAS_PR_NO_VER_FILE)
cd %work_dir%
if exist .\%config%\ del /f/s/q %config%
if exist .\%config%\ rd /s/q %config%
if exist .\%config%\ goto END_BUILD_UNEXPECTED_BUILD_FOLDER
IarBuild.exe %project_file% %config%
ECHO Atlas_PR_Ver:[%Atlas_PR_Ver_Full%] Done.
ECHO Atlas_PR_Ver:[%Atlas_PR_Ver_Full%] Done. >>%build_info_text%

ECHO Package Release Files
ECHO Package Release Files >>%build_info_text%
cd %release_fold%
if exist %Atlas_PR_Ver_Full% rd /s/q %Atlas_PR_Ver_Full%
md %Atlas_PR_Ver_Full%
cd %work_dir%
copy .\%config%\Exe\1211_Release.hex .\%release_fold%\%Atlas_PR_Ver_Full%\%Atlas_PR_Ver_Full%.hex
copy .\%config%\Exe\1211_Release.out .\%release_fold%\%Atlas_PR_Ver_Full%\%Atlas_PR_Ver_Full%.out
copy .\%config%\List\1211_Release.map .\%release_fold%\%Atlas_PR_Ver_Full%\%Atlas_PR_Ver_Full%.map

ECHO %Atlas_PR_Ver_Full%\%Atlas_PR_Ver_Full%.hex >>%build_info_text%
ECHO. >>%build_info_text%
ECHO.
ECHO.


::---------------------------------------------------------------------------------------------------------
ECHO Build 1211 Atlas NP (1F85U-42NP)
ECHO Atlas_NP_Ver:[%Atlas_NP_Ver_Full%] Building...
ECHO Atlas_NP_Ver:[%Atlas_NP_Ver_Full%] Building... >>%build_info_text%
cd %version_dir%
del /f VersionConfig.h
if exist VerAtlasNP.h (copy VerAtlasNP.h VersionConfig.h) else (goto END_ATLAS_NP_NO_VER_FILE)
cd %work_dir%
if exist .\%config%\ del /f/s/q %config%
if exist .\%config%\ rd /s/q %config%
if exist .\%config%\ goto END_BUILD_UNEXPECTED_BUILD_FOLDER
IarBuild.exe %project_file% %config%
ECHO Atlas_NP_Ver:[%Atlas_NP_Ver_Full%] Done.
ECHO Atlas_NP_Ver:[%Atlas_NP_Ver_Full%] Done. >>%build_info_text%

ECHO Package Release Files
ECHO Package Release Files >>%build_info_text%
cd .\%release_fold%\
if exist %Atlas_NP_Ver_Full% rd /s/q %Atlas_NP_Ver_Full%
md %Atlas_NP_Ver_Full%
cd %work_dir%
copy .\%config%\Exe\1211_Release.hex .\%release_fold%\%Atlas_NP_Ver_Full%\%Atlas_NP_Ver_Full%.hex
copy .\%config%\Exe\1211_Release.out .\%release_fold%\%Atlas_NP_Ver_Full%\%Atlas_NP_Ver_Full%.out
copy .\%config%\List\1211_Release.map .\%release_fold%\%Atlas_NP_Ver_Full%\%Atlas_NP_Ver_Full%.map

ECHO %Atlas_NP_Ver_Full%\%Atlas_NP_Ver_Full%.hex >>%build_info_text%
ECHO. >>%build_info_text%
ECHO.
ECHO.


::---------------------------------------------------------------------------------------------------------
ECHO Build 1211 Tippie PR (1F85U-22PR) 
ECHO Tippi_PR_Ver:[%Tippie_PR_Ver_Full%] Building...
ECHO Tippi_PR_Ver:[%Tippie_PR_Ver_Full%] Building... >>%build_info_text%
cd %version_dir%
del /f VersionConfig.h
if exist VerTippiePR.h (copy VerTippiePR.h VersionConfig.h) else (goto END_TIPPIE_PR_NO_VER_FILE)
cd %work_dir%
if exist .\%config%\ del /f/s/q %config%
if exist .\%config%\ rd /s/q %config%
if exist .\%config%\ goto END_BUILD_UNEXPECTED_BUILD_FOLDER
IarBuild.exe %project_file% %config%
ECHO Tippi_PR_Ver:[%Tippie_PR_Ver_Full%] Done.
ECHO Tippi_PR_Ver:[%Tippie_PR_Ver_Full%] Done. >>%build_info_text%

ECHO Package Release Files
ECHO Package Release Files >>%build_info_text%
cd .\%release_fold%\
if exist %Tippie_PR_Ver_Full% rd /s/q %Tippie_PR_Ver_Full%
md %Tippie_PR_Ver_Full%
cd %work_dir%
copy .\%config%\Exe\1211_Release.hex .\%release_fold%\%Tippie_PR_Ver_Full%\%Tippie_PR_Ver_Full%.hex
copy .\%config%\Exe\1211_Release.out .\%release_fold%\%Tippie_PR_Ver_Full%\%Tippie_PR_Ver_Full%.out
copy .\%config%\List\1211_Release.map .\%release_fold%\%Tippie_PR_Ver_Full%\%Tippie_PR_Ver_Full%.map

ECHO %Tippie_PR_Ver_Full%\%Tippie_PR_Ver_Full%.hex >>%build_info_text%
ECHO. >>%build_info_text%
ECHO.
ECHO.


::---------------------------------------------------------------------------------------------------------
ECHO Build 1211 Tippie NP (1F85U-22NP) 
ECHO Tippi_NP_Ver:[%Tippie_NP_Ver_Full%] Building...
ECHO Tippi_NP_Ver:[%Tippie_NP_Ver_Full%] Building... >>%build_info_text%
cd %version_dir%
del /f VersionConfig.h
if exist VerTippieNP.h (copy VerTippieNP.h VersionConfig.h) else (goto END_TIPPIE_NP_NO_VER_FILE)
cd %work_dir%
if exist .\%config%\ del /f/s/q %config%
if exist .\%config%\ rd /s/q %config%
if exist .\%config%\ goto END_BUILD_UNEXPECTED_BUILD_FOLDER
IarBuild.exe %project_file% %config%
ECHO Tippi_NP_Ver:[%Tippie_NP_Ver_Full%] Done.
ECHO Tippi_NP_Ver:[%Tippie_NP_Ver_Full%] Done. >>%build_info_text%

ECHO Package Release Files
ECHO Package Release Files >>%build_info_text%
cd .\%release_fold%\
if exist %Tippie_NP_Ver_Full% rd /s/q %Tippie_NP_Ver_Full%
md %Tippie_NP_Ver_Full%
cd %work_dir%
copy .\%config%\Exe\1211_Release.hex .\%release_fold%\%Tippie_NP_Ver_Full%\%Tippie_NP_Ver_Full%.hex
copy .\%config%\Exe\1211_Release.out .\%release_fold%\%Tippie_NP_Ver_Full%\%Tippie_NP_Ver_Full%.out
copy .\%config%\List\1211_Release.map .\%release_fold%\%Tippie_NP_Ver_Full%\%Tippie_NP_Ver_Full%.map

ECHO %Tippie_NP_Ver_Full%\%Tippie_NP_Ver_Full%.hex >>%build_info_text%
ECHO. >>%build_info_text%
ECHO.
ECHO.

ECHO IAR Build Successfully
ECHO IAR Build Successfully >>%build_info_text%
goto END_ALL


::---------------------------------------------------------------------------------------------------------
:END_IAR_BUILD_NO_CONFIG
ECHO ERROR: No "Release" or "Debug" as 1st parameter
ECHO ERROR: No "Release" or "Debug" as 1st parameter >>%build_info_text%
goto END_ALL
:END_BUILD_NO_RELEASE_FOLDER
ECHO ERROR: No Build Release Folder such as "ReleaseFiles"
ECHO ERROR: No Build Release Folder such as "ReleaseFiles" >>%build_info_text%
goto END_ALL
:END_BUILD_UNEXPECTED_BUILD_FOLDER
ECHO ERROR: Unexpected Build Folder such as "Release" or "Debug" During Building
ECHO ERROR: Unexpected Build Folder such as "Release" or "Debug" During Building >>%build_info_text%
goto END_ALL

:END_ATLAS_PR_NO_VER
ECHO ERROR: No Atlas PR Version such as "V01-00" as 2st parameter
ECHO ERROR: No Atlas PR Version such as "V01-00" as 2st parameter >>%build_info_text%
goto END_ALL
:END_ATLAS_NP_NO_VER
ECHO ERROR: No Atlas NP Version such as "V01-00" as 3nd parameter
ECHO ERROR: No Atlas NP Version such as "V01-00" as 3nd parameter >>%build_info_text%
goto END_ALL
:END_TIPPIE_PR_NO_VER
ECHO ERROR: No Tippie PR Version such as "V01-00" as 4th parameter
ECHO ERROR: No Tippie PR Version such as "V01-00" as 4th parameter >>%build_info_text%
goto END_ALL
:END_TIPPIE_NP_NO_VER
ECHO ERROR: No Tippie NP Version such as "V01-00" as 5th parameter
ECHO ERROR: No Tippie NP Version such as "V01-00" as 5th parameter >>%build_info_text%
goto END_ALL


:END_ATLAS_PR_NO_VER_FILE
ECHO ERROR: No VerAtlasPR.h
ECHO ERROR: No VerAtlasPR.h >>%build_info_text%
goto END_ALL
:END_ATLAS_NP_NO_VER_FILE
ECHO ERROR: No VerAtlasNP.h
ECHO ERROR: No VerAtlasNP.h >>%build_info_text%
goto END_ALL
:END_TIPPIE_PR_NO_VER_FILE
ECHO ERROR: No VerTippieNP.h
ECHO ERROR: No VerTippieNP.h >>%build_info_text%
goto END_ALL
:END_TIPPIE_NP_NO_VER_FILE
ECHO ERROR: No VerTippieNP.h
ECHO ERROR: No VerTippieNP.h >>%build_info_text%
goto END_ALL


:END_ALL

pause
::---------------------------------------------------------------------------------------------------------