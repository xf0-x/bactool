@echo off
title bactool
color 0A
:main
cls
echo //////////////////////////////
echo bactool @
echo github.com/xf0-x/bactool
echo //////////////////////////////
echo 1. Clean Temporary Files
echo 2. Empty Recycle Bin
echo 3. Clean Windows Update Leftovers
echo 4. Clean Windows Prefetch
echo 5. Clear DNS Cache
echo 6. Exit
echo //////////////////////////////
set /p choice=(1-6):

if "%choice%"=="1" goto clean_temp
if "%choice%"=="2" goto clean_recycle_bin
if "%choice%"=="3" goto clean_windows_update
if "%choice%"=="4" goto clean_prefetch
if "%choice%"=="5" goto clear_dns
if "%choice%"=="6" goto exit
echo Invalid option, please select again.
pause
goto main

:clean_temp
echo Cleaning Temporary Files...
del /s /q "%temp%\*.*" 2>nul
del /s /q "C:\Windows\Temp\*.*" 2>nul
echo Temporary files cleaned successfully.
pause
goto main

:clean_recycle_bin
echo Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin
echo Recycle bin emptied successfully.
pause
goto main

:clean_windows_update
echo Cleaning Windows Update leftover files...
dism.exe /online /cleanup-image /startcomponentcleanup /quiet
echo Windows Update leftovers cleaned successfully.
pause
goto main

:clean_prefetch
echo Cleaning Windows Prefetch files...
del /s /q "C:\Windows\Prefetch\*.*" 2>nul
echo Prefetch files cleaned successfully.
pause
goto main

:clear_dns
echo Clearing DNS cache...
ipconfig /flushdns
echo DNS cache cleared successfully.
pause
goto main

:exit
echo Exiting System Cleaner Tool. Goodbye!
pause
exit
