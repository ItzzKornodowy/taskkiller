@echo off
title TaskKiller - Checking permissions

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run this program as administrator
    pause >nul
    exit /b
)

echo Loading...
ping localhost -n 3 >nul
echo Ready!
goto menu

:menu
title Start Panel - Select option
cls
echo. 
echo -----------------------------------------------------------
echo ------------------- Hello, How are you? -------------------
echo ---------------------- select option ----------------------
echo -------- Remember to run program as administrator! --------
echo -----------------------------------------------------------
echo.
echo 1. Kill task by name (.exe)
echo 2. Kill task by full name (Supports other extensions ex. File.txt, Program.exe)
echo 3. Kill task by PID (process id)
echo 4. Exit
echo.
echo Type "info" to view inforation about program
echo.
set /p Wybieram=Option no:
if "%Wybieram%"=="1" goto procexe
if "%Wybieram%"=="2" goto procniestand
if "%Wybieram%"=="3" goto procpid
if "%Wybieram%"=="4" goto wyjdz
if /i "%Wybieram%"=="info" goto informacje
goto menu

:procexe
cls
title Kill task (.exe)
set /p Zadanie=Task to kill:
taskkill /im "%Zadanie%.exe"
title Result for %Zadanie%.exe
echo Press any key to continue...
pause >nul
goto menu

:procniestand
cls
title Killing task (other extension)
set /p ZadanieNiestandardowe=Task Name:
taskkill /im "%ZadanieNiestandardowe%"
title Results for %ZadanieNiestandardowe%
echo Press any key to continue...
pause >nul
goto menu

:procpid
cls
title Killing task (By PID)
set /p ProcessID=PID:
TASKKILL /PID "%ProcessID%"
title Result for PID: %ProcessID%
echo Press any key to continue...
pause >nul
goto menu

:wyjdz
exit

:informacje
cls
title A program that instantly stops a process by Kornodowy
echo (c) Kornodowy. All rights reserved.
echo.
echo. 
echo -----------------------------------------------------------
echo ---------------------- Version v.1.0 ----------------------
echo -------------------- Author: Kornodowy --------------------
echo ----------- E-Mail: kontakt.z@kornodowy.hub.pl ------------
echo ------------------ Github: ItzzKornodowy ------------------
echo -----------------------------------------------------------
echo.
echo.
echo Press any key to continue...
pause >nul
goto menu
