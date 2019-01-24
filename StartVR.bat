@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
setlocal EnableDelayedExpansion
for /f "skip=3 tokens=1" %%i in ('TASKLIST') do (
SET /A p = 0
for %%a in (amdow.exe AMDRSServ.exe atieclxx.exe atiesrxx.exe RadeonSettings.exe VirtualDesktop.Service.ex svchost.exe sihost.exe fontdrvhost.exe explorer.exe cmd.exe conhost.exe tasklist.exe smss.exe csrss.exe wininit.exe lsass.exe lsm.exe winlogon.exe services.exe dwm.exe nvvsvc.exe nvtray.exe nvxdsync.exe NvTmru.exe daemonu.exe nvSCPAPISvr.exe LogMeIn.exe LogMeInRC.exe OVRServer_x64.exe OVRServer_x86.exe vivelink.exe) do (
if %%i==%%a (SET /A p = 1; echo %%a)
)
if !p!==0 (taskkill /f /im "%%i*")
)
:-------------------------------------- 
:reduces privileges to run steamvr
start /HIGH "yay" "%WINDIR%\explorer.exe" "steam://rungameid/250820"


