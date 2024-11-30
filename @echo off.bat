@echo off
title GENERATOR I NIE TYLKO / BY / Adam
color 0a

:menu
cls
echo WITAJCIE W MOIM GENERATORZE!
echo -----------------------------
echo 1 - LICZBY
echo 2 - LICZENIE
echo 3 - GENERATOR SLOW
echo 4 - DATUM I GODZINA
echo 5 - CYTAT
echo 6 - KONWERSJA JEDNOSTEK
echo 7 - LOSOWA LICZBA
echo 8 - BMI KALKULATOR
echo 9 - INFORMACJE O SYSTEMIE
echo 10 - TO-DO LIST
echo 11 - POGODA
echo 12 - USTAWIENIA
echo 13 - GRA W ZGADYWANIE LICZBY
echo 14 - WYJSCIE
echo -----------------------------

set /p "cho=>"
if "%cho%"=="1" goto PSC
if "%cho%"=="2" goto CALC
if "%cho%"=="3" goto WORDGEN
if "%cho%"=="4" goto DATETIME
if "%cho%"=="5" goto QUOTE
if "%cho%"=="6" goto CONVERT
if "%cho%"=="7" goto RANDOMNUM
if "%cho%"=="8" goto BMI
if "%cho%"=="9" goto SYSINFO
if "%cho%"=="10" goto TODO
if "%cho%"=="11" goto WEATHER
if "%cho%"=="12" goto SETTINGS
if "%cho%"=="13" goto GUESSNUMBER
if "%cho%"=="14" exit
goto menu

:weather
cls
echo SPRAWDZANIE POGODY
echo -----------------------------
set /p "city=Podaj nazwe miasta: "

:: Sprawdzanie, czy curl jest zainstalowany
where curl >nul 2>&1
if errorlevel 1 (
    echo Blad: curl nie jest zainstalowany lub nie jest dostepny w PATH!
    echo Nacisnij dowolny klawisz, aby powrocic...
    pause >nul
    goto menu
)

:: Użycie curl do pobrania danych o pogodzie
curl -s "http://api.weatherapi.com/v1/current.json?key=1c128894df2f47e4ac8120308241408&q=%city%" | powershell -Command "$input | ConvertFrom-Json | Select-Object -ExpandProperty current | Select-Object temp_c, temp_f, condition | Format-Table -Property @{Name='Temperatura (°C)';Expression={$_.temp_c}}, @{Name='Temperatura (°F)';Expression={$_.temp_f}}, @{Name='Warunki';Expression={$_.condition.text}} -AutoSize"

echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto menu

:psc
cls
echo GENERATOR LOSUJE RANDOMOWE LICZBY
echo ---------------------------------
echo 1 - WYGNERUJ KODY
echo 2 - POWROT

set /p "cho=>"
if "%cho%"=="2" goto menu
if "%cho%"=="1" (
    cls
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo 0%random:~0,3%-%random:~0,4%-%random:~0,4%-%random:~0,4%
    echo MASZ 10 SEKUND NA SKOPIOWANIE KODOW
    timeout /t 10 /nobreak >nul
    goto psc
)
goto psc

:calc
cls
echo WYBIERZ OPERACJE MATEMATYCZNA
echo -----------------------------
echo 1 - DODAWANIE
echo 2 - ODEJMOWANIE
echo 3 - MNOZENIE
echo 4 - DZIELENIE
echo 5 - POWROT

set /p "cho=>"
if "%cho%"=="5" goto menu
if "%cho%"=="1" goto add
if "%cho%"=="2" goto sub
if "%cho%"=="3" goto mul
if "%cho%"=="4" goto div
goto calc

:add
cls
echo DODAWANIE
echo -----------------------------
set /p "num1=Podaj pierwsza liczbe: "
set /p "num2=Podaj druga liczbe: "
set /a result=num1 + num2
echo Wynik dodawania: %result%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto calc

:sub
cls
echo ODEJMOWANIE
echo -----------------------------
set /p "num1=Podaj pierwsza liczbe: "
set /p "num2=Podaj druga liczbe: "
set /a result=num1 - num2
echo Wynik odejmowania: %result%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto calc

:mul
cls
echo MNOZENIE
echo -----------------------------
set /p "num1=Podaj pierwsza liczbe: "
set /p "num2=Podaj druga liczbe: "
set /a result=num1 * num2
echo Wynik mnozenia: %result%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto calc

:div
cls
echo DZIELENIE
echo -----------------------------
set /p "num1=Podaj pierwsza liczbe: "
set /p "num2=Podaj druga liczbe: "

:: Sprawdzanie, czy dzielnik jest zerem
if "%num2%"=="0" (
    echo Blad: Nie mozna dzielic przez zero!
    echo.
    echo Nacisnij dowolny klawisz, aby powrocic...
    pause >nul
    goto calc
)

set /a result=num1 / num2
set /a remainder=num1 %% num2
echo Wynik dzielenia: %result%
echo Reszta: %remainder%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto calc

:wordgen
cls
echo GENERATOR LOSOWYCH SLOW
echo -----------------------------
echo 1 - GENERUJ SLOWO
echo 2 - POWROT

set /p "cho=>"
if "%cho%"=="2" goto menu
if "%cho%"=="1" (
    cls
    call :generateWord
    echo MASZ 10 SEKUND NA SKOPIOWANIE SLOWA
    timeout /t 10 /nobreak >nul
    goto wordgen
)
goto wordgen

:generateWord
:: Lista przykładowych słów
set "words=apple banana cherry date eggplant fig grape honeydew"

:: Wybór losowego słowa
for /f "tokens=%random:~0,1% delims= " %%a in ("%words%") do set "word=%%a"
echo Wygenerowane slowo: %word%
goto :eof

:datetime
cls
echo AKTUALNA DATA I GODZINA
echo -----------------------------
echo %date%
echo %time%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto menu

:quote
cls
echo LOSOWY CYTAT
echo -----------------------------
set "quotes=Be yourself; everyone else is already taken. - Oscar Wilde|Two things are infinite: the universe and human stupidity; and I'm not sure about the universe. - Albert Einstein|So many books, so little time. - Frank Zappa|To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment. - Ralph Waldo Emerson"

:: Wybór losowego cytatu
for /f "tokens=%random:~0,1% delims=|" %%a in ("%quotes%") do set "quote=%%a"
echo %quote%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto menu

:convert
cls
echo KONWERSJA JEDNOSTEK
echo -----------------------------
echo 1 - METRY NA KILOMETRY
echo 2 - KILOMETRY NA METRY
echo 3 - CELSJUSZE NA FAHRENHEITY
echo 4 - FAHRENHEITY NA CELSJUSZE
echo 5 - POWROT

set /p "cho=>"
if "%cho%"=="5" goto menu
if "%cho%"=="1" goto metersToKilometers
if "%cho%"=="2" goto kilometersToMeters
if "%cho%"=="3" goto celsiusToFahrenheit
if "%cho%"=="4" goto fahrenheitToCelsius
goto convert

:metersToKilometers
cls
echo KONWERSJA METRY NA KILOMETRY
echo -----------------------------
set /p "meters=Podaj liczbe metrow: "
set /a kilometers=meters / 1000
echo %meters% metrow to %kilometers% kilometrow.
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto convert

:kilometersToMeters
cls
echo KONWERSJA KILOMETRY NA METRY
echo -----------------------------
set /p "kilometers=Podaj liczbe kilometrow: "
set /a meters=kilometers * 1000
echo %kilometers% kilometrow to %meters% metrow.
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto convert

:celsiusToFahrenheit
cls
echo KONWERSJA CELSJUSZE NA FAHRENHEITY
echo -----------------------------
set /p "celsius=Podaj temperature w Celsjuszach: "
set /a fahrenheit=(((celsius * 9) / 5) + 32)
echo %celsius% stopni Celsjusza to %fahrenheit% stopni Fahrenheita.
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto convert

:fahrenheitToCelsius
cls
echo KONWERSJA FAHRENHEITY NA CELSJUSZE
echo -----------------------------
set /p "fahrenheit=Podaj temperature w Fahrenheitach: "
set /a celsius=(((fahrenheit - 32) * 5) / 9)
echo %fahrenheit% stopni Fahrenheita to %celsius% stopni Celsjusza.
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto convert

:rannum
cls
echo LOSOWA LICZBA
echo -----------------------------
set /p "min=Podaj minimalna liczbe: "
set /p "max=Podaj maksymalna liczbe: "
set /a range=max - min + 1
set /a randnum=%random% %% range + min
echo Losowa liczba w zakresie od %min% do %max%: %randnum%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto menu

:bmi
cls
echo KALKULATOR BMI
echo -----------------------------
set /p "weight=Podaj waga w kilogramach: "
set /p "height=Podaj wzrost w metrach (np. 1.75): "
:: Konwersja wzrostu do metrow
set /a heightInMeters=height * 100
set /a bmi=weight / (heightInMeters * heightInMeters)
echo Twoje BMI: %bmi%
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto menu

:sysinfo
cls
echo INFORMACJE O SYSTEMIE
echo -----------------------------
echo System Operacyjny: %OS%
systeminfo | findstr /B /C:"Wersja" /C:"Architektura" /C:"Dysk C:"
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto menu

:todo
cls
echo TO-DO LIST
echo -----------------------------
echo 1 - DODAJ ZADANIE
echo 2 - WYSLIJ LISTE
echo 3 - POWROT

set /p "cho=>"
if "%cho%"=="3" goto menu
if "%cho%"=="1" goto addTodo
if "%cho%"=="2" goto showTodo
goto todo

:addTodo
cls
set /p "task=Podaj zadanie do wykonania: "
echo %task% >> todo.txt
echo Zadanie dodane do listy!
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto todo

:showTodo
cls
echo TWOJA LISTA ZADAŃ
echo -----------------------------
type todo.txt
echo.
echo Nacisnij dowolny klawisz, aby powrocic...
pause >nul
goto todo

:settings
cls
echo USTAWIENIA PERSONALIZACJI
echo -----------------------------
echo 1 - ZMIEN KOLOR TEKSTU
echo 2 - ZMIEN KOLOR TLA
echo 3 - POWROT

set /p "cho=>"
if "%cho%"=="3" goto menu
if "%cho%"=="1" goto changeTextColor
if "%cho%"=="2" goto changeBackgroundColor
goto settings

:changeTextColor
cls
echo Wybierz kolor tekstu (0-15):
echo 0 - Czarny
echo 1 - Niebieski
echo 2 - Zielony
echo 3 - Turkusowy
echo 4 - Czerwony
echo 5 - Fioletowy
echo 6 - Zielony
echo 7 - Szary
echo 8 - Jasnoszary
echo 9 - Niebieski
echo A - Jasnozielony
echo B - JasnoTurkusowy
echo C - Jasnoczerwony
echo D - JasnoFioletowy
echo E - Jasnozielony
echo F - Biały

set /p "color=Podaj numer koloru: "
color %color%
goto settings

:changeBackgroundColor
cls
echo Wybierz kolor tla (0-15):
echo 0 - Czarny
echo 1 - Niebieski
echo 2 - Zielony
echo 3 - Turkusowy
echo 4 - Czerwony
echo 5 - Fioletowy
echo 6 - Zielony
echo 7 - Szary
echo 8 - Jasnoszary
echo 9 - Niebieski
echo A - Jasnozielony
echo B - JasnoTurkusowy
echo C - Jasnoczerwony
echo D - JasnoFioletowy
echo E - Jasnozielony
echo F - Biały

set /p "bgcolor=Podaj numer koloru tła: "
color %bgcolor%
goto settings

:guessnumber
cls
echo GRA W ZGADYWANIE LICZBY
echo -----------------------------
echo Wybierz poziom trudności:
echo 1 - Łatwy (1-10)
echo 2 - Średni (1-100)
echo 3 - Trudny (1-1000)

set /p "difficulty=Podaj poziom trudności: "
if "%difficulty%"=="1" set /a "max=10"
if "%difficulty%"=="2" set /a "max=100"
if "%difficulty%"=="3" set /a "max=1000"
set /a "target=%random% %% max + 1"

:guessloop
cls
echo ZGADNIJ LICZBE (1-%max%):
set /p "guess=Podaj liczbe: "

if "%guess%"=="%target%" (
    echo Gratulacje! Odgadłeś liczbę!
    echo.
    echo Nacisnij dowolny klawisz, aby powrocic...
    pause >nul
    goto menu
)

if "%guess%" lss "%target%" (
    echo Za niska liczba. Sprobuj ponownie.
) else (
    echo Za wysoka liczba. Sprobuj ponownie.
)

goto guessloop
