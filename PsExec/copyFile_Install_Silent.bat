@echo off
:: If there's no first argument, stop script
if [%1]==[] goto error1

:: ping computer to check if is online
ping %1 -n 1 -w 1000 > nul
::If computer is not online go to error3
if errorlevel 1 goto error3

:: Assign second argument to a variable
set ComputerName=%1

:: If there's no second argument, stop script
if [%2]==[] goto error2

:: Assign second argument to a variable
set ExeName=%2

::Copy software  to remote pc
robocopy D:\shared\Installers\ \\%ComputerName%\c$\Temp\ %ExeName%
::Execute software interactive for user
PsExec.exe \\%ComputerName% -i "C:\temp\%ExeName%" /S

::End Script
exit /b

::Error Handling
:error1
echo ::ERROR:: No computer name passed by argument. Please pass a computer name as first arg.
exit /b
:error2
echo ::ERROR:: No .exe name passed as 2nd argument. Please pass a .exe name as second arg.
exit /b
:error3
echo ::ERROR: Computer is not online.
exit /b

