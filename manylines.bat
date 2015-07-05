:: Drop into your VS projects folder.
@echo off
set CDIR=%cd%
:start
title Line counter
cd %CDIR%
set /p INPUT="Path to directory: "
IF %INPUT%==n (
	cd %CDIR%
) ELSE (
	IF EXIST %INPUT% (
	cd %INPUT%
) ELSE (
		echo Directory could not be found.
		goto start
	)
)
echo Lines in project:
powershell "(dir -include *.cs,*.xaml -recurse | select-string .).Count"
goto start