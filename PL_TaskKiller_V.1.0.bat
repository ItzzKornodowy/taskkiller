@echo off
title Zakoncz Proces - Weryfikacja Konta

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [BLAD] Uruchom ten program jako administrator!
    pause >nul
    exit /b
)

echo Trwa wczytywanie programu...
ping localhost -n 3 >nul
echo Gotowe!
goto menu

:menu
title Panel Startowy - Panel wyboru
cls
echo. 
echo -----------------------------------------------------------
echo --------------- Dzien Dobry, jak sie masz? ----------------
echo ---------------------- wybierz opcje ----------------------
echo ---- Pamietaj aby uruchomic program jako administrator ----
echo -----------------------------------------------------------
echo.
echo 1. Zakoncz proces przez nazwe procesu (.exe)
echo 2. Zakoncz proces przez pelna nazwe procesu (rozszerzenie niestandardowe np. plik.txt albo notepad.exe)
echo 3. Zakoncz proces przez PID (process id / identyfikator procesu)
echo 4. Wyjdz
echo.
echo Wpisz "info" aby wyswietlic informacje o programie
echo.
set /p Wybieram=Wybieram: 
if "%Wybieram%"=="1" goto procexe
if "%Wybieram%"=="2" goto procniestand
if "%Wybieram%"=="3" goto procpid
if "%Wybieram%"=="4" goto wyjdz
if /i "%Wybieram%"=="info" goto informacje
goto menu

:procexe
cls
title Zakanczanie zadania (.exe)
set /p Zadanie=Nazwa Zadania:
taskkill /im "%Zadanie%.exe"
title Wynik dla %Zadanie%.exe
echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu

:procniestand
cls
title Zakanczanie zadania (wszystkie rozszerzenia)
set /p ZadanieNiestandardowe=Nazwa Zadania:
taskkill /im "%ZadanieNiestandardowe%"
title Wynik dla %ZadanieNiestandardowe%
echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu

:procpid
cls
title Zakanczanie zadania (Poprzez PID)
set /p ProcessID=ID procesu:
TASKKILL /PID "%ProcessID%"
title Wynik dla PID: %ProcessID%
echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu

:wyjdz
exit

:informacje
cls
title Program polegajacy na natychmiastowym zatrzymywaniu procesu autorstwa Kornodowego
echo (c) Kornodowy. Wszelkie prawa zastrzezone.
echo.
echo. 
echo -----------------------------------------------------------
echo ------------------ Wersja Programu v.1.0 ------------------
echo ------------ Autorstwa Kornodowego (kornodowy) ------------
echo ----------- E-Mail: kontakt.z@kornodowy.hub.pl ------------
echo ------------------ Github: ItzzKornodowy ------------------
echo -----------------------------------------------------------
echo.
echo.
echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu
