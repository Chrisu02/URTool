@echo off
cls
color
Echo.
Echo. *****	This Script is for unpacking the vendor folder from Android 9 OTA Update file	*****
Echo. ***** 			written by Chrisu02 @ https://github.com/Chrisu02 		*****
echo. *****				 Do use at your own risk !!!				*****
Echo. *****    Please note that all existing vendor_android9 data files and folders will be deleted	*****
Echo. 
Echo. Press any key to continue or close this window
Echo. 
pause
Echo.
Echo. deleting all vendor_android9 folders and files within this directory
Echo.
del *.dat.br >nul 2>&1
del *.dat >nul 2>1
del *.img >nul 2>&1
del *.list >nul 2>&1
rd vendor_android9 /s /q >nul 2>&1
if exist vendor_android9 goto error
:run
echo unpacking vendor_android9 files
bins\7z.exe x android9.zip vendor.new.dat.br
if not exist vendor.new.dat.br goto :error
bins\7z.exe x android9.zip vendor.transfer.list
if not exist vendor.transfer.list goto :error
echo converting .dat.br to .dat file
bins\brotli.exe -v -d vendor.new.dat.br
echo converting .dat to .img file 
bins\sdat2img vendor.transfer.list vendor.new.dat vendor.new.img
if not exist vendor.new.img goto :error
echo extracting .img file to "vendor_android9" folder
bins\7z x -y "vendor.new.img" -o"vendor_android9"
echo deleting .dat and .img file
del vendor.new.dat.br
del vendor.new.dat
del vendor.new.img
del vendor.transfer.list
goto end
:error
color c
Echo.
echo. ***** Ooops  something went wrong *****
echo.
echo. Please check there are no vendor_android9 files and folders within this folder
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
