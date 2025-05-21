@echo off
title Zakoncz Proces - Weryfikacja Konta

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run this program as administrator
    pause >nul
    exit /b
)

echo Loading...
ping localhost -n 1 >nul
echo Ready!
goto menu

:menu
title Start Panel
cls
echo. 
echo -----------------------------------------------------------
echo --------------- Hello, how are you today? -----------------
echo ---------------------- select option ----------------------
echo -----------------------------------------------------------
echo.
echo 1. Terminate process by name (.exe)
echo 2. Terminate process by full name (Supports other extensions ex. File.txt, Program.exe)
echo 3. Terminate process by PID (process id)
echo 4. Exit
echo.
echo Type "info" to show info
echo Type "settings" to go to settings
echo.
set /p Wybieram=My choice: 
if "%Wybieram%"=="1" goto procexe
if "%Wybieram%"=="2" goto procniestand
if "%Wybieram%"=="3" goto procpid
if "%Wybieram%"=="4" goto wyjdz
if /i "%Wybieram%"=="info" goto informacje
if /i "%Wybieram%"=="settings" goto ustawienia
if /i "%Wybieram%"=="x" exit
goto menu

:ustawienia
cls
echo 1. Color personalization [Manual] (for examle. f4) (sets color to white background and red theme)
echo 2. Built-in themes 
echo.
set /p Opcjaper=My choice: 
if "%Opcjaper%"=="1" goto personrecz
if "%Opcjaper%"=="2" goto procniestand
if /i "%Opcjaper%"=="x" goto menu

:personrecz
cls
echo [Default] - 70
echo.
set /p Kolor=Color: 
if /i "%Kolor%"=="x" goto menu
color %Kolor%
goto menu

:procniestand
cls
echo Choose theme.
echo.
echo 1. Hecker 010100111101
echo 2. PowerShell
echo 3. Light
echo 4. Horror
echo 5. Sea
echo 6. Default
echo.
set /p Motyw=Theme: 
if "%Motyw%"=="1" color A
if "%Motyw%"=="2" color 1f
if "%Motyw%"=="3" color f0
if "%Motyw%"=="4" color 4f
if "%Motyw%"=="5" color b1
if "%Motyw%"=="6" color 07
if /i "%Motyw%"=="x" goto menu
goto menu

:procexe
cls
title Terminating process (.exe)
set /p Zadanie=Process:
if /i "%Zadanie%"=="x" goto menu
taskkill /f /im "%Zadanie%.exe" /t
title Results for %Zadanie%.exe
pause
goto menu

:procniestand
cls
title Terminating process (other)
set /p ZadanieNiestandardowe=Process:
if /i "%ZadanieNiestandardowe%"=="x" goto menu
taskkill /f /im "%ZadanieNiestandardowe%" /t
title Wynik dla %ZadanieNiestandardowe%
pause
goto menu

:procpid
cls
title Killing task by PID
set /p ProcessID=PID:
if /i "%ProcessID%"=="x" goto menu
TASKKILL /PID "%ProcessID%"
title Results for PID: %ProcessID%
pause
goto menu

:wyjdz
exit

:informacje
cls
echo A program that instantly stops a process by Kornodowy
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
echo -----------------------------------------------------------
echo ----------------------- What's new? -----------------------
echo ----------------- Color personalisation -------------------
echo ----------- Type "x" to go back to menu option ------------
echo -----------------------------------------------------------
echo ---------- Bugfix - forces the program to close  ----------
echo ------------------ (instead of "asking") ------------------  
echo -----------------------------------------------------------

pause 
goto menu
