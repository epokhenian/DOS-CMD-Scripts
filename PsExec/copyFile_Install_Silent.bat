@echo off
::
:: Bat file to install a .exe silent in a remote computer
:: Arguments copyFile_Install_Silent computername exename
::


::::::::::::::::::::
:::::::Checks:::::::
::::::::::::::::::::

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
:: If file does not exist, stop script
if NOT EXIST D:\shared\Installers\%2  goto error4
:: Assign second argument to a variable
set ExeName=%2

::::::::::::::::::::::
::::Main Content::::
::::::::::::::::::::::

::Copy software  to remote pc and execute software interactive for user
robocopy D:\shared\Installers\ \\%ComputerName%\c$\Temp\ %ExeName%

PsExec.exe \\%ComputerName% -i "C:\temp\%ExeName%" /S

::End Script
exit /b

::::::::::::::::::::::
::::Error Handling::::
::::::::::::::::::::::

:error1
echo ::ERROR:: No computer name passed by argument. Please pass a computer name as first arg.
exit /b
:error2
echo ::ERROR:: No .exe name passed as 2nd argument. Please pass a .exe name as second arg.
exit /b
:error3
echo ::ERROR: Computer is not online.
exit /b
:error4
echo ::ERROR: Exe file does not exist.
exit /b
