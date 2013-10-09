:start
	@echo off	

	:: Change dir to source
	cd .\src\

	:: Setup constants
	set MAIN_SRC_FILE=main.dpr
	set PROGRAM_NAME=game
	set ENTRY_EXT=dpr
	set EXE_DIR=..\bin
	set OBJ_DIR=..\obj	

:cleanup
	echo Cleaning up...
	del /F /Q %EXE_DIR%\*.* %OBJ_DIR%\*.*

:compile
	echo Compiling...
	set EXE_NAME=%PROGRAM_NAME%.exe

	if not exist %EXE_DIR% mkdir %EXE_DIR%
	if not exist %OBJ_DIR% mkdir %OBJ_DIR%		
	fpc -FE%EXE_DIR% -o%EXE_NAME% -FU%OBJ_DIR% -Sd -XX %MAIN_SRC_FILE%

:run
	cd %EXE_DIR%	

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
