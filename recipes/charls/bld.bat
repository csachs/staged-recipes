:: Build step
mkdir build_charls
cd build_charls

copy %LIBRARY_INC%\stdint.h %LIBRARY_INC%\cstdint

cmake -G "NMake Makefiles" ^
	-D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	-D CMAKE_BUILD_TYPE=Release ^
	%SRC_DIR%

if errorlevel 1 exit 1

jom -j%CPU_COUNT%
if errorlevel 1 exit 1

:: Install step
jom install
if errorlevel 1 exit 1

del %LIBRARY_INC%\cstdint
