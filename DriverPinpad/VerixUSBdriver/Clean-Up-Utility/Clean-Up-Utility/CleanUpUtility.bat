@echo off

if exist %windir%\system32\subinacl.exe (
del C:\Windows\System32\subinacl.exe
)

pushd "%~dp0"
msiexec /qn /x usb_installvfi32.msi

copy .\subinacl.exe C:\Windows\system32\

set counter =0
set increment =5

call vfi-clean.bat

FOR /L %%X IN (0,1,5) DO (

if exist %windir%\system32\subinacl.exe (
   takeown /F %windir%\system32\subinacl.exe >nul
   icacls %windir%\system32\subinacl.exe /GRANT *S-1-1-0:F >nul
   
   
   rem VX 510
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0203"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0203" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0203" /f >nul

   rem VX 810
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0207"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0207" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0207" /f >nul   
   
   rem VX 800
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0206"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0206" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0206" /f >nul
   
   rem VX 570
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0208"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0208" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0208" /f >nul
      
   rem VX 610
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0209"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0209" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0209" /f >nul
   
   rem VX 670
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0213"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0213" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0213" /f >nul
   
   rem VX 510
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0216"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0216" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0216" /f >nul
     
   rem VX 680
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0217"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0217" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0217" /f >nul
     
   rem VX 520
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0218"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0218" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0218" /f >nul
   
   rem VX 820
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0219"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0219" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0219" /f >nul
   
   rem VX 805
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0220"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0220" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0220" /f >nul
   
   rem VX 825
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0221"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0221" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0221" /f >nul
   
      
   rem VX 520g
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0222"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0222" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0222" /f >nul
   
   rem VX 68C
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0223"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0223" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0223" /f >nul
   
     
   rem VX fd5
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0224"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0224" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0224" /f >nul
   
       
   rem VX 68b
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0225"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0225" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0225" /f >nul
   
   rem VX 68W
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0226"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0226" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0226" /f >nul
   
   rem VX 52S
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0227"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0227" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0227" /f >nul
   
   rem VX 675
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_022A"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_022A" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_022A" /f >nul
   
   rem VX 68G
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_022B"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_022B" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_022B" /f >nul   
   
   
   subinacl /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0202"  /setowner=%username% >nul
   subinacl  /subkeyreg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0202" /grant=%username%=F >nul
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_11CA&PID_0202" /f >nul
   
   reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\COM Name Arbiter" /v COMDB /f
   
   cls
  
)

)

devcon.exe /rescan

cls

@echo Cleanup succesfull!! 



