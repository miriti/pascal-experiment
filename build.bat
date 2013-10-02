:start
	@echo off
	set PROGRAM_NAME=game
	goto target-release

:target-release
	set TARGET=release
	goto compile

:target-debug
	set TARGET=debug
	goto compile

:compile
	set EXE_DIR=bin\%TARGET%
	if not exist %EXE_DIR% mkdir %EXE_DIR%
	if not exist obj mkdir obj
	fpc -FE%EXE_DIR% -FUobj src\%PROGRAM_NAME%.pas

:run
	cd %EXE_DIR%
	echo Running "%PROGRAM_NAME%" ...
	%PROGRAM_NAME%.exe

pause
