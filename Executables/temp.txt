cmd /c "echo off && FOR /F "tokens=*" %%a in ('%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk') do set "edge=%%a"
set edge=%edge:\=\\%
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_SZ /d "%edge%" /f
taskkill /f /im explorer.exe
start explorer.exe"