
@ECHO OFF

:; Clear the screen and turn echo off (above) to keep it clean
:;CLS

:; Clear any previous variables set
SET Var1=
SET WinVer=
SET WinMajor=
SET WinMinor=
SET WinBuild=


:; Get Value from 'VER' command output
FOR /F "tokens=*" %%i in ('VER') do SET WinVer=%%i
FOR /F "tokens=1-3 delims=]-" %%A IN ("%WinVer%") DO (
SET Var1=%%A
)

:; Get version number only so drop off Microsoft Windows Version
FOR /F "tokens=1-9 delims=n" %%A IN ("%Var1%") DO (
SET WinVer=%%C
echo %WinVer%
)

:; Separate version numbers
FOR /F "tokens=1-8 delims=.-" %%A IN ("%WinVer%") DO (
SET WinMajor=%%A
SET WinMinor=%%B
SET WinBuild=%%C
)

:; Fix the extra space left over in the Major
FOR /F "tokens=1 delims= " %%A IN ("%WinMajor%") DO (
SET WinMajor=%%A
)

:; Display Results 
ECHO WinVer = %WinVer% 
ECHO WinMajor = %WinMajor%
ECHO WinMinor = %WinMinor%
ECHO WinBuild = %WinBuild%

set osver=%WinMajor%.%WinMinor%