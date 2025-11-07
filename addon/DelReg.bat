@echo off
title delete registry print sharing tweak
color 4

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
echo 	-----------------------------------------
echo	         DELETE REGEDIT TWEAKK FIX PRINT SHARING
echo		-----------------------------------------
echo                      By AB!DKS :) 
echo.
echo.
echo TEKAN TOMBOL APA SAJA UNTUK MULAI
pause>nul
echo.
echo.
echo --------------------------------------------
echo MENGHAPUS TWEAK REGEDIT FIX PRINT SHARING
echo --------------------------------------------
timeout 2 > nul
echo.
echo.
echo Deleting...
echo.
timeout 5 > nul
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcOverTcp /f
timeout 1 > nul
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcAuthentication /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcTcpPort /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcOverNamedPipes /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcUseNamedPipeProtocol /f
timeout 1 > nul
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcProtocols /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC" /v ForceKerberosForRpc /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /v CopyFilesPolicy /f
timeout 1 > nul
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v PasswordLessBuildVersion /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v everyoneincludeanonymous /f
timeout 1 > nul
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v restrictnullsessaccess /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v EnableSecuritySignature /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v RequireSecuritySignature /f
timeout 1 > nul
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v EnableSecuritySignature /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v RequireSecuritySignature /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /f
timeout 3 > nul
echo.
echo Cleanup...
echo.
echo.
timeout 5 > nul
echo Done
timeout 3 > nul
echo.
echo -------------------------------------------
echo TEKAN TOMBOL APAPUN(BEBAS) UNTUK RESTART :D
echo -------------------------------------------
pause>nul
SHUTDOWN /r /t 0