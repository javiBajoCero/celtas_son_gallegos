
@echo off
REM disclaimer
echo Holiwis, We are about to override files from age of empires, if you want it back how it was youll need to reinstall.
pause

REM Get the global path where the script is executing from
set "scriptPath=%~dp0"

REM Ensure scriptPath has a trailing backslash
if not "%scriptPath:~-1%"=="\" set "scriptPath=%scriptPath%\"

REM Get paths
for %%a in ("%scriptPath%\resources\") do set "modPath=%%~fa"
for %%a in ("%scriptPath%..\..\..\..\common\Age2HD\resources\") do set "originalGamePath=%%~fa"

REM Output the paths
echo Script will copy the contents of: %modPath% 
echo into %originalGamePath%

REM Verify if the directories exist
if not exist "%modPath%" (
    echo Error: Source directory "%modPath%" does not exist!
    pause
    exit /b 1
)

if not exist "%originalGamePath%" (
    echo Error: Destination directory "%originalGamePath%" does not exist!
    pause
    exit /b 1
)

REM Copy all files and subdirectories recursively, overwriting existing files
xcopy "%modPath%" "%originalGamePath%" /E /H /C /I /Y

REM Notify the user of completion
echo Files have been copied successfully!
pause