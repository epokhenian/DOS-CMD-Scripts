::Copy ipv4 config into a txt file saved into user desktop.
@echo off
ipconfig | find "IPv4" > %USERPROFILE%\Desktop\IPv4.txt
echo "You'll find the file IPv4.txt in your desktop."
ping 127.0.0.1 -n 6 > nul
