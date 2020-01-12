@echo off
if [%1]==[] goto error1

ELSE
(
set ComputerName=%1
::Copy software  to remote pc
robocopy D:\shared\Installers\ \\%ComputerName%\c$\Temp\ 7zip.exe
::Execute software interactive for user
PsExec.exe \\%ComputerName% -i "C:\temp\7zip.exe" /S
)

:error1
echo ::ERROR:: No computer name passed by argument. Please pass a computer name as first arg.