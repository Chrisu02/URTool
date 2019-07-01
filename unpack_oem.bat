@echo off
cls
color
Echo.
Echo. *****	This Script is for unpacking the OEM folder from Android 8.1 OTA Update file	*****
Echo. ***** 			written by Chrisu02 @ https://github.com/Chrisu02 		*****
echo. *****				 Do use at your own risk !!!				*****
Echo. *****    Please note that all existing OEM data files and folders will be deleted	*****
Echo. 
Echo. Press any key to continue or close this window
Echo. 
pause
Echo.
Echo. deleting all OEM folders and files within this directory
Echo.
del *.dat.br >nul 2>&1
del *.dat >nul 2>1
del *.img >nul 2>&1
del *.list >nul 2>&1
rd oem /s /q >nul 2>&1
if exist oem goto error
:run
echo unpacking oem files
bins\7z.exe x px6.zip oem.new.dat.br
if not exist oem.new.dat.br goto :error
bins\7z.exe x px6.zip oem.transfer.list
if not exist oem.transfer.list goto :error
echo converting .dat.br to .dat file
bins\brotli.exe -v -d oem.new.dat.br
echo converting .dat to .img file 
bins\sdat2img oem.transfer.list oem.new.dat oem.new.img
if not exist oem.new.img goto :error
echo extracting .img file to "oem" folder
bins\7z x -y "oem.new.img" -o"oem"
echo deleting .dat and .img file
del oem.new.dat.br
del oem.new.dat
del oem.new.img
del oem.transfer.list
goto end
:error
color c
Echo.
echo. ***** Ooops  something went wrong *****
echo.
echo. Please check there are no oem files and folders within this folder
echo. Only the px6.zip file should be here
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