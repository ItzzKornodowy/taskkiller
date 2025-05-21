@echo off
title Zakoncz Proces - Weryfikacja Konta

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [BLAD] Uruchom ten program jako administrator!
    pause >nul
    exit /b
)

echo Trwa wczytywanie programu...
ping localhost -n 1 >nul
echo Gotowe!
goto menu

:menu
title Panel Startowy - Panel wyboru
cls
echo. 
echo -----------------------------------------------------------
echo --------------- Dzien Dobry, jak sie masz? ----------------
echo ---------------------- wybierz opcje ----------------------
echo -----------------------------------------------------------
echo.
echo 1. Zakoncz proces przez nazwe procesu (.exe)
echo 2. Zakoncz proces przez pelna nazwe procesu (rozszerzenie niestandardowe np. plik.txt albo notepad.exe)
echo 3. Zakoncz proces przez PID (process id / identyfikator procesu)
echo 4. Wyjdz
echo.
echo Wpisz "info" aby wyswietlic informacje o programie
echo Wpisz "ustawienia" aby przejsc do ustawien.
echo.
set /p Wybieram=Wybieram: 
if "%Wybieram%"=="1" goto procexe
if "%Wybieram%"=="2" goto procniestand
if "%Wybieram%"=="3" goto procpid
if "%Wybieram%"=="4" goto wyjdz
if /i "%Wybieram%"=="info" goto informacje
if /i "%Wybieram%"=="ustawienia" goto ustawienia
if /i "%Wybieram%"=="x" exit
goto menu

:ustawienia
cls
echo 1. Personalizacja kolorow recznie (np. f4) (ustawia kolor na biale tlo, czerwony motyw)
echo 2. Wbudowane motywy 
echo.
set /p Opcjaper=Wybieram: 
if "%Opcjaper%"=="1" goto personrecz
if "%Opcjaper%"=="2" goto procniestand
if /i "%Opcjaper%"=="x" goto menu

:personrecz
cls
echo [Ustawienia domyslne] - 70
echo.
set /p Kolor=Wpisz tu kolor niestandardowy: 
if /i "%Kolor%"=="x" goto menu
color %Kolor%
goto menu

:procniestand
cls
echo Wybierz motyw.
echo.
echo 1. Hackerski
echo 2. PowerShell
echo 3. Jasny 
echo 4. Horror
echo 5. Morze 
echo 6. Domyslny 
echo.
set /p Motyw=Wybieram: 
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
title Zakanczanie zadania (.exe)
set /p Zadanie=Nazwa Zadania:
if /i "%Zadanie%"=="x" goto menu
taskkill /f /im "%Zadanie%.exe" /t
title Wynik dla %Zadanie%.exe
echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu

:procniestand
cls
title Zakanczanie zadania (wszystkie rozszerzenia)
set /p ZadanieNiestandardowe=Nazwa Zadania:
if /i "%ZadanieNiestandardowe%"=="x" goto menu
taskkill /f /im "%ZadanieNiestandardowe%" /t
title Wynik dla %ZadanieNiestandardowe%
echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu

:procpid
cls
title Zakanczanie zadania (Poprzez PID)
set /p ProcessID=ID procesu:
if /i "%ProcessID%"=="x" goto menu
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
echo -----------------------------------------------------------
echo ----------------------- Co nowego? ------------------------
echo ----------------- Personalizacja kolorow ------------------
echo ---------- Po wpisaniu "x" przenosi cie do menu -----------
echo -----------------------------------------------------------
echo ---- Bugfix dot. niepoprawnego zamykania sie aplikacji ----
echo ----------- (aplikacje sa zamykane przymusowo) ------------
echo -----------------------------------------------------------

echo Kliknij dowolny przycisk aby kontynuowac...
pause >nul
goto menu
