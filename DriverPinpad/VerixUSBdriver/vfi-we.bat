@echo off
echo INSTALLER SETUP
rem pause
SET VfiDc=devcon.exe
SET VfiDiFx=DIFxCmd32.exe
SET Vx-OS=Vx-Xp
SET PP-OS=PP-Xp
SET INST-TYPE=%1
if /I "%INST-TYPE%"=="I" (
	SET Msg2=Installing driver for 32-bit OS using 32-bit installer
	) else if /I "%INST-TYPE%"=="P" (
	SET Msg2=Pre-Installing driver for 32-bit OS using 32-bit installer
	)
echo INST-TYPE=%INST-TYPE%
rem pause	
IF /I "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
	echo OS is 64-bit
	SET VfiDc=devcon.exe
	SET VfiDiFx=DIFxCmd64.exe
	) ELSE IF /I "%PROCESSOR_ARCHITECTURE%" == "X86" (
		IF /I "%PROCESSOR_ARCHITEW6432%" == "AMD64" (
		echo OS is 64-bit
		SET VfiDc=dc64.exe
		SET VfiDiFx=DIFxCmd64.exe
		) ELSE (
			echo OS is 32-bit
			SET VfiDc=devcon.exe
			SET VfiDiFx=DIFxCmd32.exe
		)
	) 
	

reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup /v MinimizeFootPrint /f
echo %Msg2%

echo INST-TYPE=%INST-TYPE%
echo VfiDiFx=%VfiDiFx%
rem rem pause
del C:\Windows\system32\DIFxAPI.dll
copy .\XP32DLL\DIFxAPI.dll C:\Windows\system32\
%VfiDiFx% /INST-TYPE .\VX-xp\vfiusbf.inf 16

rem rem pause

rem difxcmd32.exe /INST-TYPE .\VX-xp\vfiusbf.inf 16

%VfiDc% rescan

del %VfiDc%
goto:eof

