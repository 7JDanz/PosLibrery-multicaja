@rem ---------------------------------------------------------------------------
@rem Copyright (c) MULTICAJA S.A. (Chile). All rights reserved.
@rem
@rem All rights to this product are owned by MULTICAJA S.A. and may only be used
@rem under  the  terms  of  its  associated  license document. You may NOT copy,
@rem modify, sublicense, or distribute this source file or portions of it unless
@rem previously authorized in writing by  MULTICAJA  S.A.  In  any  event,  this
@rem notice and above copyright must always be included verbatim with this file.
@rem ---------------------------------------------------------------------------

ECHO OFF
CLS
SET DIRINI=.
SET WINSYSDIR=%WINDIR%\SYSTEM32
SET DEPEXPINPAD=%DIRINI%\DEPEXPINPAD
SET DEPEXPINPADV2=%DIRINI%\VerixUSBdriver


ECHO .:: INSTALACION PINPAD ::.
ECHO _ Espere un momento...

call OSVer.bat
IF %osver%==6.1 (
	REM Instalacion Win7.
	ECHO Instalando Pinpad en Win7
	%DEPEXPINPADV2%\setup.exe /silent /nonlegacy /com8 /W7
) ELSE (
	REM Instalacion en COM8 (modificar aquí)
	ECHO Instalando Pinpad en WinXp
	REM %DEPEXPINPAD%\installvfi.msi INSTALL_VX=1 PORT_VX=8
	%DEPEXPINPADV2%\setup /I /silent /nonlegacy /com8 /XP
)