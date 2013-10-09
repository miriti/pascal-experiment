:start
	@echo off	

	:: Change dir to source
	cd .\src\

	:: Setup constants
	set PROGRAM_NAME=game
	set ENTRY_EXT=dpr
	set EXE_DIR=..\bin
	set OBJ_DIR=..\obj	

:cleanup
	echo Cleaning up...
	del /F /Q %EXE_DIR%\*.* %OBJ_DIR%\*.*

:compile
	echo Compiling...
	if not exist %EXE_DIR% mkdir %EXE_DIR%
	if not exist %OBJ_DIR% mkdir %OBJ_DIR%		
	fpc -FE%EXE_DIR% -FU%OBJ_DIR% -Sd %PROGRAM_NAME%.%ENTRY_EXT%

:run
	cd %EXE_DIR%
	set EXE_NAME=%PROGRAM_NAME%.exe

	if exist %EXE_NAME% (
		goto compile-success
	) else (
		goto compile-error
	)

:compile-success
	echo Compilation succeed
	xcopy ..\dll\*.* . /E /R /Y
	%EXE_NAME%
	goto end

:compile-error
	echo Compilation failed
	goto end

:end
	pause
