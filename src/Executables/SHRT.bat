
@echo OFF

for /f "usebackq delims=" %%A in (`dir /b /a:d "%SYSTEMDRIVE%\Users" ^| findstr /v /i /x /c:"Public" /c:"Default User" /c:"All Users"`) do (
	echo mkdir "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell"
	mkdir "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell"
	echo mkdir "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell\Pinned"
	mkdir "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell\Pinned"

	echo mkdir "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nomacs"
	mkdir "%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nomacs"

	PowerShell -NoP -C "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell\Pinned\Terminal.lnk'); $S.TargetPath = '%PROGRAMDATA%\Scoop\GlobalScoopApps\apps\windows-terminal\current\WindowsTerminal.exe'; $S.Save(); $s = $ws.CreateShortcut('%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell\Pinned\Vivaldi.lnk'); $S.TargetPath = '%SYSTEMDRIVE%\Users\%%A\AppData\Local\Vivaldi\Application\vivaldi.exe'; $S.WorkingDirectory = '%SYSTEMDRIVE%\Users\%%A\AppData\Local\Vivaldi'; $S.Save(); $s = $ws.CreateShortcut('%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nomacs\nomacs - Image Lounge.lnk'); $S.TargetPath = '%HOMEDRIVE%\Program Files\nomacs\bin\nomacs.exe'; $S.WorkingDirectory = 'C:\Program Files\nomacs'; $S.Save()"
	echo PowerShell -NoP -C "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell\Pinned\Terminal.lnk'); $S.TargetPath = '%PROGRAMDATA%\Scoop\GlobalScoopApps\apps\windows-terminal\current\WindowsTerminal.exe'; $S.Save(); $s = $ws.CreateShortcut('%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\OpenShell\Pinned\Vivaldi.lnk'); $S.TargetPath = '%SYSTEMDRIVE%\Users\%%A\AppData\Local\Vivaldi\Application\vivaldi.exe'; $S.WorkingDirectory = '%SYSTEMDRIVE%\Users\%%A\AppData\Local\Vivaldi'; $S.Save(); $s = $ws.CreateShortcut('%SYSTEMDRIVE%\Users\%%A\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nomacs\nomacs - Image Lounge.lnk'); $S.TargetPath = '%HOMEDRIVE%\Program Files\nomacs\bin\nomacs.exe'; $S.WorkingDirectory = 'C:\Program Files\nomacs; $S.Save()"
)

@echo ON

del /q /f "%SYSTEMDRIVE%\Users\Public\Desktop\Microsoft Edge.lnk"
del /q /f "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Windows Media Player.lnk"

for /f "usebackq tokens=2 delims=\" %%A in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
	reg query "HKU\%%A" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > NUL 2>&1
		if not errorlevel 1 (
			for /f "usebackq tokens=2* delims= " %%B in (`reg query "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "AppData" 2^>^&1 ^| findstr /R /X /C:".*AppData[ ]*REG_SZ[ ].*"`) do (
				echo del "%%C\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk" /q /f
				del "%%C\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk" /q /f
				echo del "%%C\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk" /q /f
				del "%%C\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk" /q /f
				echo del "%%C\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" /q /f
				del "%%C\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" /q /f
			)
		)
)

copy /y "amecs.exe" "%WINDIR%\System32"