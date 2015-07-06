:: Drop into your VS projects folder.

@echo off
set CDIR=%cd%
echo Type "/n" for to read lines of the current directory and type "/exit" to exit.

:start
title Line counter
cd %CDIR%
set /p INPUT="Path to directory: "
IF %INPUT%==/n (
	cd %CDIR%
) ELSE IF %INPUT%==/exit (
		exit
) ELSE (
	IF EXIST %INPUT% (
		cd %INPUT%
) ELSE (
		echo Directory could not be found.
		goto start
	)
)

:: Echos the lines in the project:
for /f %%i in ('powershell "(dir -include *.cs,*.xaml -recurse | select-string .).Count"') do set OUTPUT=%%i
echo Lines in project: %OUTPUT%
goto start