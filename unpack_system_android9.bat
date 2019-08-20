@echo off
cls
color
Echo.
Echo. *****	This Script is for unpacking the System folder from Android 9 OTA Update file	*****
Echo. ***** 			written by Chrisu02 @ https://github.com/Chrisu02 		*****
echo. *****				 Do use at your own risk !!!				*****
Echo. *****    Please note that all existing system_android9 data files and folders will be deleted	*****
Echo. 
Echo. Press any key to continue or close this window
Echo. 
pause
Echo.
Echo. deleting all system_android9 folders and files within this directory
Echo.
del *.dat.br >nul 2>&1
del *.dat >nul 2>1
del *.img >nul 2>&1
del *.list >nul 2>&1
rd system_android9 /s /q >nul 2>&1
if exist system_android9 goto error
:run
echo unpacking system_android9 files
bins\7z.exe x android9.zip system.new.dat.br
if not exist system.new.dat.br goto :error
bins\7z.exe x android9.zip system.transfer.list
if not exist system.transfer.list goto :error
echo converting .dat.br to .dat file
bins\brotli.exe -v -d system.new.dat.br
echo converting .dat to .img file 
bins\sdat2img system.transfer.list system.new.dat system.new.img
if not exist system.new.img goto :error
echo extracting .img file to "system_android9" folder
bins\7z x -y "system.new.img" -o"system_android9"
echo deleting .dat and .img file
del system.new.dat.br
del system.new.dat
del system.new.img
del system.transfer.list
goto end
:error
color c
Echo.
echo. ***** Ooops  something went wrong *****
echo.
echo. Please check there are no system_android9 files and folders within this folder
echo. Only the android9.zip file should be here
echo. please ensure there is enough free memory
echo.
pause
exit
:end
color 2
echo.
echo. script end successfully, press any key
echo.
pause
exit
