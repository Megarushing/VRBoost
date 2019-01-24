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
