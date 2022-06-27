@echo off
echo INSTALLER SETUP
rem pause
SET VfiDc=devcon.exe
SET VfiDiFx=DIFxCmd32.exe
SET Msg1=Win-W7 Installation
SET Msg2=Pre-Installing driver for 32-bit OS using 32-bit installer
rem SET VfiCertPath=.\TestCert\certmgrx86
SET Vx-OS=Vx-7
SET PP-OS=PP-Xp
SET INST-TYPE=%1

echo INST-TYPE=%INST-TYPE%
rem pause
rem find OS is XP or 7
if /I "%INST-TYPE%"=="I" (
	SET Msg2=Installing driver for 32-bit OS using 32-bit installer
	) else if /I "%INST-TYPE%"=="P" (
	SET Msg2=Pre-Installing driver for 32-bit OS using 32-bit installer
	)
rem pause	
call OSVer.bat
if %osver%==6.1 (
	echo OS is W7
	set Msg1=Win-7 Installation
	set Vx-OS=Vx-7
	set Vx-OS=Vx-7
	IF /I "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
		echo for Windows 64-bit OS using 64-bit installer
		del C:\Windows\system32\DIFxAPI.dll
		copy .\XP64DLL\DIFxAPI.dll C:\Windows\system32\
		difxcmd64.exe /INST-TYPE .\Vx-7\vfiusbf.inf 16
	) ELSE IF /I "%PROCESSOR_ARCHITECTURE%" == "X86" (
	IF /I "%PROCESSOR_ARCHITEW6432%" == "AMD64" (
		echo for Windows 64-bit OS using 32-bit installer
		del C:\Windows\system32\DIFxAPI.dll
		copy .\XP64DLL\DIFxAPI.dll C:\Windows\system32\
		difxcmd64.exe /INST-TYPE .\Vx-7\vfiusbf.inf 16			
	) ELSE (
		echo for Windows 32-bit OS using 32-bit installer
		del C:\Windows\system32\DIFxAPI.dll
		copy .\XP32DLL\DIFxAPI.dll C:\Windows\system32\
		difxcmd32.exe /INST-TYPE .\Vx-7\vfiusbf.inf 16
	 )
	)
) 
rem pause
rem main function
echo %Msg1%
call:VfiProcArchDetect
call:VfiDriverInstall %Vx-OS% %PP-OS%
goto:eof

rem function  - to detect the processor architecture and set variables
:VfiProcArchDetect
IF /I "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	SET VfiDc=devcon.exe
	SET VfiDiFx=DIFxCmd64.exe
	rem SET VfiCertPath=.\TestCert\certmgrx64
	SET Msg2=Pre-Installing driver for Windows 64-bit OS using 64-bit installer
) ELSE IF /I "%PROCESSOR_ARCHITECTURE%" == "X86" (
	IF /I "%PROCESSOR_ARCHITEW6432%" == "AMD64" (
		SET VfiDc=dc64.exe
		SET VfiDiFx=DIFxCmd64.exe
		rem SET VfiCertPath=.\TestCert\certmgrx64
		SET Msg2=Pre-Installing driver for Windows 64-bit OS using 32-bit installer
	) ELSE (
		rem SET VfiDiFx=DIFxCmd32.exe
		rem SET VfiCertPath=.\TestCert\certmgrx32
		rem SET Msg2=Pre-Installing driver for Windows XP-32 OS using 32-bit installer
	)
)
goto:eof

rem function - which installs driver and test certificates
:VfiDriverInstall
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup /v MinimizeFootPrint /f
echo %Msg2%
rem %VfiCertPath% -add .\TestCert\vfi.cer -s -r localMachine root
rem echo test certificates installed!

rem clean up com ports
echo off
for /l %%x in (3, 1, 10) do (
   echo cleaning comport# %%x
   Comreset %%x
)
echo INST-TYPE=%INST-TYPE%
echo VfiDiFx=%VfiDiFx%
rem pause

del C:\Windows\system32\DIFxAPI.dll
copy .\XP32DLL\DIFxAPI.dll C:\Windows\system32\
rem %VfiDiFx% /i .\%~1\VFIUSBF.INF 16
%VfiDiFx% /INST-TYPE .\Vx-7\vfiusbf.inf 16
rem %VfiDiFx% /p .\%~2\VFIUSBPP.INF 16
%VfiDc% rescan

del %VfiDc%
goto:eof
