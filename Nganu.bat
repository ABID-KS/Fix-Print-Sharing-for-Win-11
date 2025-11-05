@ECHO OFF
TITLE FIX WIN 11 PRINT SHARING
COLOR 3

 goto check_Permissions
 :check_Permissions
 echo Administrative permissions required. Detecting permissions...
 echo.
 echo.
 net session >nul 2>&1
 if [%errorLevel%] == [0] (
 	goto start
 ) else (
 	echo 			Failure : PLEASE RUN AS ADMINISTRATOR.
 )
 pause>nul
exit

:start
cls
echo.
echo 	----------------------------------------
echo	           FIX PRINT SHARING ERROR WINDOWS 11
echo		----------------------------------------
echo                   Modified By AB!DKS :)
echo		  Credit to [iS4w] and enyongapangerti  
echo.
echo TEKAN TOMBOL APA SAJA UNTUK MULAI
pause>nul
echo ------------------------------------
echo MENGAKTIFKAN FITUR LPD DAN LPR
echo ------------------------------------
Dism /online /Enable-Feature /FeatureName:Printing-Foundation-LPDPrintService /All -norestart 
Dism /online /Enable-Feature /FeatureName:Printing-Foundation-LPRPortMonitor /All -norestart 
timeout 3 > nul

echo ----------------------------
echo KONFIGURASI RPC GROUP POLICY
echo ----------------------------

(
echo Computer
echo Software\Policies\Microsoft\Windows NT\Printers\RPC
echo RpcUseNamedPipeProtocol
echo DWORD:1
echo Computer
echo Software\Policies\Microsoft\Windows NT\Printers\RPC
echo RpcAuthentication
echo DWORD:0
echo Computer
echo Software\Policies\Microsoft\Windows NT\Printers\RPC
echo RpcProtocols
echo DWORD:7
echo Computer
echo Software\Policies\Microsoft\Windows NT\Printers\RPC
echo ForceKerberosForRpc
echo DWORD:0
echo Computer
echo Software\Policies\Microsoft\Windows NT\Printers\RPC
echo RpcTcpPort
echo DWORD:50000
) > "%temp%\RPC.txt"

"%~dp0\LGPO.exe" /t "%temp%\RPC.txt"
del /f /q "%temp%\RPC.txt"

GPUPDATE /force
timeout 3 > nul

echo -------------------------------
echo KONFIGURASI RPC REGISTRY EDITOR
echo -------------------------------
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcOverTcp /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcTcpPort /t REG_DWORD /d 50000 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcOverNamedPipes /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcUseNamedPipeProtocol /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcProtocols /t REG_DWORD /d 7 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v ForceKerberosForRpc /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /v CopyFilesPolicy /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v PasswordLessBuildVersion /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v everyoneincludeanonymous /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v restrictnullsessaccess /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v EnableSecuritySignature /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v RequireSecuritySignature /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v EnableSecuritySignature /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v RequireSecuritySignature /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f
timeout 3 > nul

echo ----------------------------------------
echo MENGATUR PERMISSION PADA REGISTRY EDITOR
echo ----------------------------------------
echo HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows [7]>"%temp%\winper.txt"
"%~dp0\regini.exe" "%temp%\winper.txt"
DEL /q /f "%temp%\winper.txt"
timeout 3 > nul

echo -------------------------------------
echo RESTARTING PRINTER SPOOLER SERVICE
echo -------------------------------------
net stop Spooler /y
net start Spooler
timeout 3 > nul
echo.
echo Done
echo.
timeout 3 > nul
echo.
echo.
echo -------------------------------------------
echo TEKAN TOMBOL APAPUN(BEBAS) UNTUK RESTART :D
echo -------------------------------------------
pause>nul
SHUTDOWN /r /t 0