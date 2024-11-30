@echo off
title RANDOM NUMBER AND WORD GENERATOR / BY / Adam
color 0a

:menu
cls
echo WELCOME TO MY GENERATOR!
echo -----------------------------
echo 1 - NUMBERS
echo 2 - CALCULATING
echo 3 - WORD GENERATOR
echo 4 - DATE AND TIME
echo 5 - QUOTE
echo 6 - UNIT CONVERSION
echo 7 - RANDOM NUMBER
echo 8 - BMI CALCULATOR
echo 9 - SYSTEM INFO
echo 10 - TO-DO LIST
echo 11 - WEATHER
echo 12 - SETTINGS
echo 13 - GUESS THE NUMBER
echo 14 - EXIT
echo -----------------------------

set /p "cho=>"
if "%cho%"=="1" goto PSC
if "%cho%"=="2" goto CALC
if "%cho%"=="3" goto WORDGEN
if "%cho%"=="4" goto DATETIME
if "%cho%"=="5" goto QUOTE
if "%cho%"=="6" goto CONVERT
if "%cho%"=="7" goto RANNUM
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
echo CHECK WEATHER
echo -----------------------------
set /p "city=Enter city name: "

:: Checking if curl is installed
where curl >nul 2>&1
if errorlevel 1 (
    echo Error: curl is not installed or not available in PATH!
    echo Press any key to return...
    pause >nul
    goto menu
)

:: Using curl to get weather data
curl -s "http://api.weatherapi.com/v1/current.json?key=1c128894df2f47e4ac8120308241408&q=%city%" | powershell -Command "$input | ConvertFrom-Json | Select-Object -ExpandProperty current | Select-Object temp_c, temp_f, condition | Format-Table -Property @{Name='Temperature (°C)';Expression={$_.temp_c}}, @{Name='Temperature (°F)';Expression={$_.temp_f}}, @{Name='Condition';Expression={$_.condition.text}} -AutoSize"

echo.
echo Press any key to return...
pause >nul
goto menu

:psc
cls
echo RANDOM NUMBER GENERATOR
echo ---------------------------------
echo 1 - GENERATE CODES
echo 2 - BACK

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
    echo YOU HAVE 10 SECONDS TO COPY THE CODES
    timeout /t 10 /nobreak >nul
    goto psc
)
goto psc

:calc
cls
echo CHOOSE MATHEMATICAL OPERATION
echo -----------------------------
echo 1 - ADDITION
echo 2 - SUBTRACTION
echo 3 - MULTIPLICATION
echo 4 - DIVISION
echo 5 - BACK

set /p "cho=>"
if "%cho%"=="5" goto menu
if "%cho%"=="1" goto add
if "%cho%"=="2" goto sub
if "%cho%"=="3" goto mul
if "%cho%"=="4" goto div
goto calc

:add
cls
echo ADDITION
echo -----------------------------
set /p "num1=Enter first number: "
set /p "num2=Enter second number: "
set /a result=num1 + num2
echo Addition result: %result%
echo.
echo Press any key to return...
pause >nul
goto calc

:sub
cls
echo SUBTRACTION
echo -----------------------------
set /p "num1=Enter first number: "
set /p "num2=Enter second number: "
set /a result=num1 - num2
echo Subtraction result: %result%
echo.
echo Press any key to return...
pause >nul
goto calc

:mul
cls
echo MULTIPLICATION
echo -----------------------------
set /p "num1=Enter first number: "
set /p "num2=Enter second number: "
set /a result=num1 * num2
echo Multiplication result: %result%
echo.
echo Press any key to return...
pause >nul
goto calc

:div
cls
echo DIVISION
echo -----------------------------
set /p "num1=Enter first number: "
set /p "num2=Enter second number: "

:: Checking if divisor is zero
if "%num2%"=="0" (
    echo Error: Cannot divide by zero!
    echo.
    echo Press any key to return...
    pause >nul
    goto calc
)

set /a result=num1 / num2
set /a remainder=num1 %% num2
echo Division result: %result%
echo Remainder: %remainder%
echo.
echo Press any key to return...
pause >nul
goto calc

:wordgen
cls
echo RANDOM WORD GENERATOR
echo -----------------------------
echo 1 - GENERATE WORD
echo 2 - BACK

set /p "cho=>"
if "%cho%"=="2" goto menu
if "%cho%"=="1" (
    cls
    call :generateWord
    echo YOU HAVE 10 SECONDS TO COPY THE WORD
    timeout /t 10 /nobreak >nul
    goto wordgen
)
goto wordgen

:generateWord
:: List of example words
set "words=apple banana cherry date eggplant fig grape honeydew"

:: Selecting a random word
for /f "tokens=%random:~0,1% delims= " %%a in ("%words%") do set "word=%%a"
echo Generated word: %word%
goto :eof

:datetime
cls
echo CURRENT DATE AND TIME
echo -----------------------------
echo %date%
echo %time%
echo.
echo Press any key to return...
pause >nul
goto menu

:quote
cls
echo RANDOM QUOTE
echo -----------------------------
set "quotes=Be yourself; everyone else is already taken. - Oscar Wilde|Two things are infinite: the universe and human stupidity; and I'm not sure about the universe. - Albert Einstein|So many books, so little time. - Frank Zappa|To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment. - Ralph Waldo Emerson"

:: Selecting a random quote
for /f "tokens=%random:~0,1% delims=|" %%a in ("%quotes%") do set "quote=%%a"
echo %quote%
echo.
echo Press any key to return...
pause >nul
goto menu

:convert
cls
echo UNIT CONVERSION
echo -----------------------------
echo 1 - METERS TO KILOMETERS
echo 2 - KILOMETERS TO METERS
echo 3 - CELSIUS TO FAHRENHEIT
echo 4 - FAHRENHEIT TO CELSIUS
echo 5 - BACK

set /p "cho=>"
if "%cho%"=="5" goto menu
if "%cho%"=="1" goto metersToKilometers
if "%cho%"=="2" goto kilometersToMeters
if "%cho%"=="3" goto celsiusToFahrenheit
if "%cho%"=="4" goto fahrenheitToCelsius
goto convert

:metersToKilometers
cls
echo CONVERT METERS TO KILOMETERS
echo -----------------------------
set /p "meters=Enter number of meters: "
set /a kilometers=meters / 1000
echo %meters% meters is %kilometers% kilometers.
echo.
echo Press any key to return...
pause >nul
goto convert

:kilometersToMeters
cls
echo CONVERT KILOMETERS TO METERS
echo -----------------------------
set /p "kilometers=Enter number of kilometers: "
set /a meters=kilometers * 1000
echo %kilometers% kilometers is %meters% meters.
echo.
echo Press any key to return...
pause >nul
goto convert

:celsiusToFahrenheit
cls
echo CONVERT CELSIUS TO FAHRENHEIT
echo -----------------------------
set /p "celsius=Enter temperature in Celsius: "
set /a fahrenheit=(((celsius * 9) / 5) + 32)
echo %celsius% degrees Celsius is %fahrenheit% degrees Fahrenheit.
echo.
echo Press any key to return...
pause >nul
goto convert

:fahrenheitToCelsius
cls
echo CONVERT FAHRENHEIT TO CELSIUS
echo -----------------------------
set /p "fahrenheit=Enter temperature in Fahrenheit: "
set /a celsius=(((fahrenheit - 32) * 5) / 9)
echo %fahrenheit% degrees Fahrenheit is %celsius% degrees Celsius.
echo.
echo Press any key to return...
pause >nul
goto convert

:rannum
cls
echo RANDOM NUMBER
echo -----------------------------
set /p "min=Enter minimum number: "
set /p "max=Enter maximum number: "
set /a range=max - min + 1
set /a randnum=%random% %% range + min
echo Random number between %min% and %max%: %randnum%
echo.
echo Press any key to return...
pause >nul
goto menu

:bmi
cls
echo BMI CALCULATOR
echo -----------------------------
set /p "weight=Enter weight in kilograms: "
set /p "height=Enter height in meters (e.g., 1.75): "
:: Converting height to meters
set /a heightInMeters=height * 100
set /a bmi=weight / (heightInMeters * heightInMeters)
echo Your BMI: %bmi%
echo.
echo Press any key to return...
pause >nul
goto menu

:sysinfo
cls
echo SYSTEM INFO
echo -----------------------------
echo Operating System: %OS%
systeminfo | findstr /B /C:"Version" /C:"Architecture" /C:"Disk C:"
echo.
echo Press any key to return...
pause >nul
goto menu

:todo
cls
echo TO-DO LIST
echo -----------------------------
echo 1 - ADD TASK
echo 2 - SHOW LIST
echo 3 - BACK

set /p "cho=>"
if "%cho%"=="3" goto menu
if "%cho%"=="1" goto addTodo
if "%cho%"=="2" goto showTodo
goto todo

:addTodo
cls
set /p "task=Enter task to be done: "
echo %task% >> todo.txt
echo Task added to the list!
echo.
echo Press any key to return...
pause >nul
goto todo

:showTodo
cls
echo YOUR TO-DO LIST
echo -----------------------------
type todo.txt
echo.
echo Press any key to return...
pause >nul
goto todo

:settings
cls
echo SETTINGS
echo -----------------------------
echo 1 - CHANGE LANGUAGE
echo 2 - BACK

set /p "cho=>"
if "%cho%"=="2" goto menu
if "%cho%"=="1" (
    cls
    echo Language change option is not yet implemented.
    echo Press any key to return...
    pause >nul
    goto settings
)
goto settings

:guessNumber
cls
echo GUESS THE NUMBER
echo -----------------------------
set /a target=%random% %% 100 + 1
set /a attempts=0

:guess
set /p "guess=Guess the number (between 1 and 100): "
set /a attempts+=1

if %guess% lss %target% (
    echo Too low! Try again.
    goto guess
)
if %guess% gtr %target% (
    echo Too high! Try again.
    goto guess
)

echo Congratulations! You guessed the number %target% in %attempts% attempts.
echo.
echo Press any key to return...
pause >nul
goto menu
