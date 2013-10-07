:start
	@echo off
	set PROGRAM_NAME=game
	set ENTRY_EXT=dpr
	goto target-release

:target-release
	set TARGET=release
	goto compile

:target-debug
	set TARGET=debug
	goto compile

:compile
	echo Compiling...
	cd src
	set EXE_DIR=..\bin\%TARGET%
	set OBJ_DIR=..\obj
	if not exist %EXE_DIR% mkdir %EXE_DIR%
	if not exist %OBJ_DIR% mkdir %OBJ_DIR%	
	del /F /Q EXE_DIR\*.* %OBJ_DIR%\*.*
	fpc -FE%EXE_DIR% -FU%OBJ_DIR% -Sd %PROGRAM_NAME%.%ENTRY_EXT%

:run
	cd %EXE_DIR%
	echo Running [%PROGRAM_NAME%.exe]
	%PROGRAM_NAME%.exe

pause
