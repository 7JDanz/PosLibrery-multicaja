@echo OFF

rem "C:\PROGRAM FILES\VERIFONE\USB DRIVER\unins000.exe" /SILENT
rem goto :enduninstall

IF NOT EXIST "C:\PROGRAM FILES\VERIFONE\USB DRIVER" goto novfidriver
set currdir = %CD%
"C:\PROGRAM FILES\VERIFONE\USB DRIVER\unins000.exe" /SILENT
echo Removing files from DrvStore...
cd C:\Windows\system32\DRVSTORE
for /D %%f in (VFIUSB*) do rmdir %%f /s /Q
echo Removing OEM files...
cd c:\windows\inf
for /f "eol=: delims=" %%F in ('findstr /M VFIUSB-Serial c:\windows\inf\*.inf') do del "%%F"
del c:\windows\system32\drivers\vfienum.sys
del c:\windows\system32\drivers\vfiusbf.sys
goto enduninstall

:novfidriver
echo No VeriFone USB Driver found.

cd %currdir%
:enduninstall


