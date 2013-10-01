:setup
	@echo off
	set PROGRAM_NAME=igdc100

:target-release
	set TARGET=release

:compile
	set EXE_DIR=bin\%TARGET%
	if not exist %EXE_DIR% mkdir %EXE_DIR%
	fpc -FE%EXE_DIR% -FUobj src\%PROGRAM_NAME%.pp

:run
	cd %EXE_DIR%
	echo Running "%PROGRAM_NAME%" ...
	%PROGRAM_NAME%.exe

pause